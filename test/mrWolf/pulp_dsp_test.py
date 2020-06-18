import os
import time
import random
from plptest import Test as PulpTest, Testset
from plptest import Shell, Check
from itertools import product
from functools import partial
from collections import OrderedDict
import argparse
import numpy as np
import json
import textwrap


class Variable(object):
    """Variable"""
    def __init__(self, name):
        """
        name: name for the variable
        """
        super(Variable, self).__init__()
        self.name = name


class SweepVariable(Variable):
    """sweep variable"""
    def __init__(self, name, values):
        """
        name: name for the sweep variable
        values: iterable over all possible values for this variable
        """
        super(SweepVariable, self).__init__(name)
        self.values = values


class DynamicVariable(Variable):
    """Dynamic Variable, value determined based on others"""
    def __init__(self, name, fun):
        """
        name: name of the variable
        fun: function, returning a value for a dictionary of all other previously defined variables.
        example: DynamicVairable('resLen', lambda env: env['lenA'] + env['lenB'] + 1)
        """
        super(DynamicVariable, self).__init__(name)
        self.fun = fun


class Argument(object):
    """docstring for argument"""
    def __init__(self, name, ctype, value, use_l1=None):
        """
        name: name of the argument (in the function declaration)
        ctype: C type of the argument (or 'var_type', 'ret_type')
        value: Number for initialization, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(Argument, self).__init__()
        self.name = name
        self.ctype = ctype
        self.value = value
        self.use_l1 = use_l1
        if isinstance(self.value, SweepVariable):
            self.value = self.value.name

    def to_dict(self, env, var_type, use_l1):
        d = self.apply(env, var_type, use_l1).__dict__
        return {'class': type(self).__name__, 'dict': d}

    def apply(self, env, var_type, use_l1):
        """ Applies environment and var_type to the argument """
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        return Argument(self.name, self.get_type(var_type), self.interpret_value(env), use_l1)

    def get_type(self, var_type):
        if self.ctype == 'var_type':
            return var_type[0]
        if self.ctype == 'ret_type':
            return var_type[1]
        return self.ctype

    def interpret_value(self, env):
        if self.value is None or isinstance(self.value, int):
            return self.value
        elif isinstance(self.value, str):
            return env[self.value]
        raise TypeError("self.value has an unknown type: %s" % str(self.value))

    def get_range(self):
        assert self.ctype not in ['var_type', 'ret_type']
        if self.ctype == "float":
            raise NotImplementedError("Floating point is not yet implemented")
        n_bits = 16 if self.ctype == 'int16_t' else 8 if self.ctype == 'int8_t' else 16
        return (-(2 ** (n_bits - 1)), (2 ** (n_bits - 1)) - 1)

    def get_dtype(self):
        if self.ctype == "int8_t":
            return np.int8
        if self.ctype == "int16_t":
            return np.int16
        if self.ctype == "int32_t":
            return np.int32
        raise RuntimeError("Unknown type: %s" % self.ctype)

    def generate_value(self):
        """ Generates the value of argument, stores it in self.value and returns it. """
        assert not isinstance(self.value, str)
        if self.value is None:
            min_value, max_value = self.get_range()
            self.value = np.random.randint(low=min_value, high=max_value + 1)
            self.value = self.value.astype(self.get_dtype())
        return self.value

    def generate_stimuli(self, header):
        """ Writes stimuli value to header file """
        self.generate_value()
        header.write_scalar(self.name, self.ctype, self.value, self.use_l1)


class ArrayArgument(Argument):
    """Array Argument"""
    def __init__(self, name, ctype, length, value, use_l1=None):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or tuple for random value between (min, max)
        value: tuple for random value between (min, max), or list with values, or single number for all.
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(ArrayArgument, self).__init__(name, ctype, value, use_l1)
        self.length = length
        if isinstance(self.length, SweepVariable):
            self.length = self.length.name

    def apply(self, env, var_type, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        return ArrayArgument(self.name, self.get_type(var_type), self.interpret_length(env),
                             self.interpret_value(env), use_l1)

    def interpret_length(self, env):
        if isinstance(self.length, tuple):
            assert len(self.length) == 2
            return random.randint(*self.length)
        if isinstance(self.length, str):
            return env[self.length]
        if isinstance(self.length, int):
            return self.length
        raise TypeError("self.length has unknown type: %s" % str(self.length))

    def generate_value(self):
        """ Generates the value of argument, stores it in self.value and returns it. """
        assert not isinstance(self.value, str)
        assert isinstance(self.length, int)
        dtype = self.get_dtype()
        if self.value is None:
            min_value, max_value = self.get_range()
            self.value = np.random.randint(low=min_value, high=max_value + 1, size=self.length)
            self.value = self.value.astype(dtype)
        elif isinstance(self.value, (int, float)):
            self.value = (np.ones(self.length) * self.value).astype(dtype)
        elif isinstance(self.value, np.ndarray):
            assert len(self.value) == self.length
        else:
            raise RuntimeError("Unknown Type!")
        return self.value

    def generate_stimuli(self, header):
        """ Writes stimuli value to header file """
        self.generate_value()
        header.write_array(self.name, self.ctype, self.value, self.use_l1)


class OutputArgument(ArrayArgument):
    """Output Array Argument"""
    def __init__(self, name, ctype, length, use_l1=None):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(OutputArgument, self).__init__(name, ctype, length, 0, use_l1)
        self.reference_name = self.name + "_reference"

    def apply(self, env, var_type, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        return OutputArgument(self.name, self.get_type(var_type), self.interpret_length(env),
                              use_l1)

    def generate_value(self):
        """ Generates the value of argument, stores it in self.value and returns it. """
        assert not isinstance(self.value, str)
        assert isinstance(self.length, int)
        self.value = np.zeros(self.length).astype(self.get_dtype())
        return self.value

    def generate_reference(self, gen_function, header):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        header.write_array(self.reference_name, self.ctype, reference, False)


class ReturnValue(Argument):
    """ result value """
    def __init__(self, ctype, use_l1=None):
        """
        ctype: type of the argument (or 'var_type', 'ret_type')
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(ReturnValue, self).__init__("return_value", ctype, 0, use_l1)
        self.reference_name = self.name + "_reference"

    def generate_reference(self, gen_function, header):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        header.write_scalar(self.reference_name, self.ctype, reference, False)


class FixPointArgument(Argument):
    """fixpoint argument"""
    def __init__(self, name, ctype, value, use_l1=None):
        """
        name: name of the argument (in the function declaration)
        ctype: C type of the argument (or 'var_type', 'ret_type')
        value: Number for initialization, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(FixPointArgument, self).__init__(name, ctype, value, use_l1)

    def apply(self, env, var_type, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        return FixPointArgument(self.name, self.get_type(var_type), self.interpret_value(env),
                                use_l1)


def check_output(config, output, test_obj):
    # print(output)
    passed = False
    performance = {'cycles': 0,
                   'instructions': 0,
                   'load_stalls': 0,
                   'icache_miss': 0,
                   'tcdm_cont': 0}
    mistakes = []
    for item in output.split('\n'):
        if 'passed:' in item:
            if item.find('1') != -1:
                passed = True
        elif 'cycles:' in item:
            performance['cycles'] = int(item.split(": ")[1])
        elif 'instructions:' in item:
            performance['instructions'] = int(item.split(": ")[1])
        elif 'load_stalls:' in item:
            performance['load_stalls'] = int(item.split(": ")[1])
        elif 'icache_miss:' in item:
            performance['icache_miss'] = int(item.split(": ")[1])
        elif 'tcdm_cont:' in item:
            performance['tcdm_cont'] = int(item.split(": ")[1])
        elif '<Mismatch>' in item:
            mistakes.append("Mismatch: %s" % item[11:])
    result_format = ", ".join(["%s=%s" % (k, v) for k, v in performance.items()])
    if mistakes:
        result_format += "\n"
        result_format += "\n".join(mistakes)
    # generate / update benchmark file
    if passed:
        bench_output(performance, test_obj)
    return (passed, result_format)


BENCHMARK_FILE = os.path.join(os.path.dirname(os.path.realpath(__file__)),
                              "bench_{}.csv".format(time.strftime("%Y-%m-%d_%H:%M:%S")))


def bench_output(performance, test_obj):
    # generate file and first header line if it does not yet exist
    if not os.path.isfile(BENCHMARK_FILE):
        # create file and write header
        with open(BENCHMARK_FILE, "w") as f:
            f.write("name,device,dimension,cycles,instructions,ipc,imiss,ld_stall,tcdm_cont,macs,mpc\n")

    # extract relevant fields
    dimension = "; ".join(["%s=%s" % (k, str(v)) for k, v in test_obj.env.items()])
    insn_per_cycles = performance['instructions'] / performance['cycles']
    macs_per_cycle = test_obj.n_macs / performance['cycles']
    # write the new line
    with open(BENCHMARK_FILE, "a") as f:
        f.write(",".join([test_obj.function_name,
                          test_obj.device_name,
                          dimension,
                          str(performance['cycles']),
                          str(performance['instructions']),
                          str(insn_per_cycles),
                          str(performance['icache_miss']),
                          str(performance['load_stalls']),
                          str(performance['tcdm_cont']),
                          str(test_obj.n_macs),
                          str(macs_per_cycle)]))
        f.write("\n")


class Test(object):
    """Test structure """
    def __init__(self):
        self.test_idx = 0
        self.function_name = None
        self.var_type = []
        self.arguments = []
        self.env = {}
        self.use_l1 = False
        self.fix_point = None
        self.extended_output = True
        self.version = ''

    def build(self, test_idx, function_name, version, arguments, env, device_name, use_l1,
              extended_output=True, n_macs=None):
        self.test_idx = test_idx
        self.function_name = "%s_%s" % (function_name, version)
        self.version = version
        self.env = env
        self.device_name = device_name
        self.use_l1 = use_l1
        self.extended_output = extended_output
        self.n_macs = n_macs(env) if env is not None else 0

        # prepare var_type
        if version == 'i32' or version == 'q32':
            self.var_type = ['int32_t', 'int32_t']
        elif version == 'i16' or version == 'q16':
            self.var_type = ['int16_t', 'int32_t']
        elif version == 'i8' or version == 'q8':
            self.var_type = ['int8_t', 'int32_t']
        else:
            self.var_type = ['float', 'float']

        # prepare fix-point stuff and arguments
        if 'q' not in version:
            self.arguments = [arg for arg in arguments if not isinstance(arg, FixPointArgument)]
            self.fix_point = None
        else:
            self.arguments = arguments
            fix_point_args = [arg for arg in arguments if isinstance(arg, FixPointArgument)]
            assert len(fix_point_args) == 1
            self.fix_point = fix_point_args[0].apply(self.env, self.var_type, self.use_l1).value
            assert isinstance(self.fix_point, int)

        return self

    def from_json(self, json_string):
        d = json.loads(json_string)
        d['arguments'] = [self.argument_from_dict(arg) for arg in d['arguments']]
        self.__dict__ = d
        return self

    def to_json(self):
        d = self.__dict__
        # overwrite arguments
        d['arguments'] = [arg.to_dict(self.env, self.var_type, self.use_l1)
                          for arg in self.arguments]
        json_str = json.dumps(d)
        return json_str.replace('\"', '\\\"')

    def argument_from_dict(self, d):
        if d['class'] == Argument.__name__:
            arg = Argument("tmp", "tmp", 0)
        elif d['class'] == ArrayArgument.__name__:
            arg = ArrayArgument("tmp", "tmp", 1, 0)
        elif d['class'] == OutputArgument.__name__:
            arg = OutputArgument("tmp", "tmp", 1)
        elif d['class'] == FixPointArgument.__name__:
            arg = FixPointArgument("tmp", "tmp", 0)
        elif d['class'] == ReturnValue.__name__:
            arg = ReturnValue("tmp")
        else:
            raise RuntimeError("Unknown class name")
        arg.__dict__ = d['dict']
        return arg

    def to_plptest(self):
        test_name = "%s(%s)" % (self.function_name,
                                ", ".join(["%s=%s" % (k, str(v)) for k, v in self.env.items()]))
        build_dir = "test_%s_t%d" % (self.version, self.test_idx)
        flags = "GARGS=\'--json %s\' BUILD_DIR_EXT=%s" % (self.to_json(), build_dir)
        return PulpTest(name=test_name,
                        commands=[Shell('clean', 'make clean %s' % (flags)),
                                  Shell('gen', 'make gen %s' % (flags)),
                                  Shell('build', 'make all %s' % (flags)),
                                  Shell('run', 'make run %s' % (flags)),
                                  Check('check', check_output, test_obj=self)],
                        timeout=1000000)

    def function_signature(self):
        arguments_str = ', '.join([arg.name for arg in self.arguments])
        return_value_str = ""
        return_value_list = [arg for arg in self.arguments if isinstance(arg, ReturnValue)]
        assert len(return_value_list) <= 1
        if len(return_value_list) == 1:
            return_value_str = "%s = " % return_value_list[0].name
        return "%s%s(%s)" % (return_value_str, self.function_name, arguments_str)

    def generate_check(self, header):
        # generate return check
        any([header.write_return_check(arg.name, arg.reference_name, self.extended_output)
             for arg in self.arguments if isinstance(arg, ReturnValue)])

        # generate result check
        any([header.write_check(arg.name, arg.reference_name, arg.length, self.extended_output)
             for arg in self.arguments if isinstance(arg, OutputArgument)])

    def generate_stimuli(self, header):
        any([arg.generate_stimuli(header) for arg in self.arguments])

    def generate_reference(self, header, gen_function):
        # build input dictionary
        inputs = {arg.name: arg
                  for arg in self.arguments
                  if not isinstance(arg, (ReturnValue, OutputArgument))}
        gen_function_prep = partial(gen_function, inputs=inputs, env=self.env,
                                    fix_point=self.fix_point)
        any([arg.generate_reference(gen_function_prep, header)
             for arg in self.arguments if isinstance(arg, (OutputArgument, ReturnValue))])


class Sweep:
    """ Iterator over all variables and returns the environment"""
    def __init__(self, variables):
        self.variables = variables
        self.prod_iter = product(*[v.values for v in self.variables if isinstance(v, SweepVariable)])

    def __iter__(self):
        return self

    def __next__(self):
        sweep_vars = iter(next(self.prod_iter))
        env = OrderedDict()
        for var in self.variables:
            if isinstance(var, SweepVariable):
                env[var.name] = next(sweep_vars)
            if isinstance(var, DynamicVariable):
                env[var.name] = var.fun(env)
        return env


class HeaderWriter(object):
    """ writes .h header files """
    def __init__(self, filename='data.h', indent=4, max_line_len=100):
        self.filename = filename
        self.tab = ' ' * indent
        self.width = max_line_len
        self.fp = None

    def __enter__(self):
        self.fp = open(self.filename, 'w')
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.fp.close()
        self.fp = None

    def write_test(self, test, gen_function):
        assert self.fp is not None
        test.generate_stimuli(self)
        test.generate_reference(self, gen_function)
        self.generate_check(test)
        self.generate_fsig(test)
        self.generate_bench()

    def write_array(self, name, var_type, arr, use_l1):
        target_loc = 'RT_L1_DATA' if use_l1 else 'RT_L2_DATA'
        nl = '\n' + self.tab
        self.fp.write('%s %s %s[%s] = {\n' % (target_loc, var_type, name, len(arr)))
        self.fp.write(self.tab)
        self.fp.write(nl.join(textwrap.wrap(', '.join([str(x) for x in arr]), width=self.width)))
        self.fp.write('\n};\n\n')

    def write_scalar(self, name, var_type, value, use_l1):
        target_loc = 'L1_DATA' if use_l1 else 'L2_DATA'
        self.fp.write('%s %s %s = %s;\n\n' % (target_loc, var_type, name, value))

    def generate_check(self, test):
        self.fp.write('#define CHECK {\\\n')
        test.generate_check(self)
        self.fp.write('}\n\n')

    def write_check(self, result_name, reference_name, size, print_errors=False):
        self.fp.write('%sfor (int i = 0; i < %s; i++) {\\\n' % (self.tab, size))
        if print_errors:
            self.fp.write('%sif (%s[i] != %s[i]) {\\\n' % (self.tab * 2, result_name,
                                                           reference_name))
            self.fp.write('%spassed=0;\\\n' % (self.tab * 3))
            self.fp.write('%sprintf("<Mismatch> %s[%%d]: acq=%%d, exp=%%d\\n", i, %s[i], %s[i]);\\\n'
                          % (self.tab * 3, result_name, result_name, reference_name))
            self.fp.write('%s}\\\n' % (self.tab * 2))
        else:
            self.fp.write('%sif (%s[i] != %s[i]) passed = 0;\\\n' % (self.tab * 2, result_name,
                                                                     reference_name))
        self.fp.write('%s}\\\n' % self.tab)

    def write_return_check(self, result_name, reference_name, print_errors=False):
        if print_errors:
            self.fp.write('%sif (%s != %s) {\\\n' % (self.tab, result_name, reference_name))
            self.fp.write('%spassed = 0;\\\n' % self.tab * 2)
            self.fp.write('%sprintf("<Mismatch> return: acq=%%d, exp=%%d", %s, %s);\\\n'
                          % (self.tab * 2, result_name, reference_name))
            self.fp.write('%s}\\\n' % self.tab)
        else:
            self.fp.write('%sif (%s != %s) passed = 0;\\\n'
                          % (self.tab, result_name, reference_name))

    def generate_fsig(self, test):
        self.fp.write('#define FSIG {\\\n')
        self.fp.write('%s%s;\\\n' % (self.tab, test.function_signature()))
        self.fp.write('}\n\n')

    def generate_bench(self):
        self.fp.write("""#define BENCH {{\\
{tab}rt_perf_t perf;\\
{tab}rt_perf_init(&perf);\\
{tab}int passed = do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);\\
{tab}printf(\"passed: %d\\n\", passed);\\
{tab}printf(\"cycles: %d\\n\", rt_perf_read(RT_PERF_CYCLES));\\
{tab}printf(\"instructions: %d\\n\", rt_perf_read(RT_PERF_INSTR));\\
{tab}if (passed) {{\\
{tab}{tab}do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);\\
{tab}{tab}printf(\"load_stalls: %d\\n\", rt_perf_read(RT_PERF_LD_STALL));\\
{tab}{tab}do_bench(&perf, 1<<RT_PERF_IMISS, 0);\\
{tab}{tab}printf(\"icache_miss: %d\\n\", rt_perf_read(RT_PERF_IMISS));\\
{tab}{tab}do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);\\
{tab}{tab}printf(\"tcdm_cont: %d\\n\", rt_perf_read(RT_PERF_TCDM_CONT));\\
{tab}}}\\
}}\\""".format(tab=self.tab))
        self.fp.write('\n\n')


def generate_test(device_name, function_name, arguments, variables, implemented,
                  use_l1=False, extended_output=True, n_macs=None):
    testsets = [Testset(
        name=v,
        tests=[Test().build(test_idx=i,
                            function_name=function_name,
                            version=v,
                            arguments=arguments,
                            env=e,
                            device_name=device_name,
                            use_l1=use_l1,
                            extended_output=extended_output,
                            n_macs=n_macs).to_plptest()
               for i, e in enumerate(Sweep(variables))]
    ) for v in implemented if implemented[v]]
    return {'testsets': testsets}


def generate_stimuli_header(compute_result):
    """
    Parses the command line parameters, and generates the stimuli header file based on the
    compute_result function passed as argument
    """
    parser = argparse.ArgumentParser()

    parser.add_argument('--json', nargs='+')
    parser.add_argument('--folder')

    args = parser.parse_args()

    # change to build folder
    os.chdir(args.folder)

    # parse json
    json_str = ' '.join(args.json)
    test = Test().from_json(json_str)

    # write header file
    with HeaderWriter() as writer:
        writer.write_test(test, compute_result)
