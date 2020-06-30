import os
import sys
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
from textwrap import dedent
import struct


class Variable(object):
    """Variable"""
    def __init__(self, name, visible=True):
        """
        name: name for the variable
        """
        super(Variable, self).__init__()
        self.name = name
        self.visible = visible


class SweepVariable(Variable):
    """sweep variable"""
    def __init__(self, name, values, visible=True):
        """
        name: name for the sweep variable
        values: iterable over all possible values for this variable
        """
        super(SweepVariable, self).__init__(name, visible)
        self.values = values


class DynamicVariable(Variable):
    """Dynamic Variable, value determined based on others"""
    def __init__(self, name, fun, visible=True):
        """
        name: name of the variable
        fun: function, returning a value for a dictionary of all other previously defined variables.
        example: DynamicVairable('resLen', lambda env: env['lenA'] + env['lenB'] + 1)
        """
        super(DynamicVariable, self).__init__(name, visible)
        self.fun = fun


class ExternalPointedArgument(object):
    """External Argument pointed to"""
    def __init__(self, name):
        """
        name: name of the argument to be input
        """
        super(ExternalPointedArgument, self).__init__()
        self.name = name

    def to_dict(self, env, var_type, version, use_l1):
        return {'class': type(self).__name__, 'dict': self.__dict__}

    def generate_stimuli(self, header):
        return


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

    def to_dict(self, env, var_type, version, use_l1):
        d = self.apply(env, var_type, version, use_l1).__dict__
        return {'class': type(self).__name__, 'dict': d}

    def apply(self, env, var_type, version, use_l1):
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
            return -1, 1
        n_bits = 16 if self.ctype == 'int16_t' else 8 if self.ctype == 'int8_t' else 16
        return (-(2 ** (n_bits - 1)), (2 ** (n_bits - 1)) - 1)

    def get_dtype(self):
        if self.ctype == "int8_t":
            return np.int8
        if self.ctype == "int16_t":
            return np.int16
        if self.ctype == "int32_t":
            return np.int32
        if self.ctype == "float":
            return np.float32
        raise RuntimeError("Unknown type: %s" % self.ctype)

    def generate_value(self):
        """ Generates the value of argument, stores it in self.value and returns it. """
        assert not isinstance(self.value, str)
        if self.value is None:
            min_value, max_value = self.get_range()
            if self.ctype == "float":
                self.value = np.random.uniform(low=min_value, high=max_value)
            else:
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

    def apply(self, env, var_type, version, use_l1):
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
        if self.value is None or (self.value.isinstance(self.value, tuple)
                                  and self.value.len() == 2):
            if isinstance(self.value, tuple):
                min_value, max_value = self.value
            else:
                min_value, max_value = self.get_range()
            if self.ctype == "float":
                self.value = np.random.uniform(low=min_value, high=max_value, size=self.length)
            else:
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
    def __init__(self, name, ctype, length, use_l1=None, tolerance=0):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        tolerance: constant or function, which maps the output variable type to a tolerance.
        """
        super(OutputArgument, self).__init__(name, ctype, length, 0, use_l1)
        self.reference_name = self.name + "_reference"
        self.tolerance = tolerance

    def apply(self, env, var_type, version, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        ctype = self.get_type(var_type)
        tolerance = self.tolerance(version) if callable(self.tolerance) else self.tolerance
        return OutputArgument(self.name, ctype, self.interpret_length(env), use_l1, tolerance)

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
    def __init__(self, ctype, use_l1=None, tolerance=0):
        """
        ctype: type of the argument (or 'var_type', 'ret_type')
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        tolerance: constant or function, which maps the output variable type to a relative tolerance
        """
        super(ReturnValue, self).__init__("return_value", ctype, 0, use_l1)
        self.reference_name = self.name + "_reference"
        self.tolerance = tolerance

    def apply(self, env, var_type, version, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        ctype = self.get_type(var_type)
        tolerance = self.tolerance(version) if callable(self.tolerance) else self.tolerance
        return OutputArgument(ctype, use_l1, tolerance)

    def generate_reference(self, gen_function, header):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        header.write_scalar(self.reference_name, self.ctype, reference, False)


class FixPointArgument(Argument):
    """fixpoint argument for setting the decimal point, ctype is always set to uint32_t"""
    def __init__(self, name, value, use_l1=None):
        """
        name: name of the argument (in the function declaration)
        value: Number for initialization, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(FixPointArgument, self).__init__(name, "uint32_t", value, use_l1)

    def apply(self, env, var_type, version, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        return FixPointArgument(self.name, self.interpret_value(env), use_l1)


class ParallelArgument(Argument):
    """Argument for choosing the number of cores argument. ctype is always set to uint32_t"""
    def __init__(self, name, value, use_l1=None):
        """
        name: name of the argument
        value: Number for initialization, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        """
        super(ParallelArgument, self).__init__(name, "uint32_t", value, use_l1)

    def apply(self, env, var_type, version, use_l1):
        if self.use_l1 is not None:
            use_l1 = self.use_l1
        return ParallelArgument(self.name, self.interpret_value(env), use_l1)


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
        print("\n".join(mistakes))
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
            f.write("name,device,dimension,cycles,instructions,ipc,imiss,ld_stall,tcdm_cont,ops,mpc\n")

    # extract relevant fields
    dimension = "; ".join(["%s=%s" % (k, str(test_obj.env[k])) for k in test_obj.visible_env])
    insn_per_cycles = performance['instructions'] / performance['cycles']
    ops_per_cycle = test_obj.n_ops / performance['cycles']
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
                          str(test_obj.n_ops),
                          str(ops_per_cycle)]))
        f.write("\n")


class Test(object):
    """Test structure """
    def __init__(self):
        self.test_idx = 0
        self.function_name = None
        self.var_type = []
        self.arguments = []
        self.env = {}
        self.visible_env = []
        self.use_l1 = False
        self.fix_point = None
        self.extended_output = True
        self.version = ''
        self.device_name = ''

    def build(self, test_idx, function_name, version, arg_ret_type, arguments, env, visible_env,
              device_name, use_l1, extended_output=True, n_ops=None):
        self.test_idx = test_idx
        self.function_name = "%s_%s" % (function_name, version)
        self.version = version
        self.env = env
        self.visible_env = visible_env
        self.device_name = device_name
        self.use_l1 = use_l1
        self.extended_output = extended_output
        self.n_ops = n_ops(env) if env is not None else 0

        # prepare var_type
        version_type = version.split('_')[0]
        if arg_ret_type is not None and version_type in arg_ret_type:
            self.var_type = arg_ret_type[version_type]
        elif version.startswith('i32') or version.startswith('q32'):
            self.var_type = ['int32_t', 'int32_t']
        elif version.startswith('i16') or version.startswith('q16'):
            self.var_type = ['int16_t', 'int32_t']
        elif version.startswith('i8') or version.startswith('q8'):
            self.var_type = ['int8_t', 'int32_t']
        else:
            self.var_type = ['float', 'float']

        # arguments based on if fix-point and parallel is used
        if not version.startswith('q') and not version.endswith('parallel'):
            self.arguments = [arg for arg in arguments
                              if not isinstance(arg, (FixPointArgument, ParallelArgument))]
        if not version.startswith('q') and version.endswith('parallel'):
            self.arguments = [arg for arg in arguments if not isinstance(arg, FixPointArgument)]
        if version.startswith('q') and not version.endswith('parallel'):
            self.arguments = [arg for arg in arguments if not isinstance(arg, ParallelArgument)]
        if version.startswith('q') and version.endswith('parallel'):
            self.arguments = arguments

        # prepare fixpoint stuff
        if version.startswith('q'):
            fix_point_args = [arg for arg in arguments if isinstance(arg, FixPointArgument)]
            assert len(fix_point_args) == 1
            self.fix_point = fix_point_args[0].apply(self.env, self.var_type, self.version, self.use_l1).value
            assert isinstance(self.fix_point, int)
        else:
            self.fix_point = None

        # check parallel argument
        if version.endswith('parallel'):
            assert len([arg for arg in arguments if isinstance(arg, ParallelArgument)]) == 1

        return self

    def from_json(self, json_string):
        d = json.loads(json_string)
        d['arguments'] = [self.argument_from_dict(arg) for arg in d['arguments']]
        self.__dict__ = d
        return self

    def to_json(self):
        d = self.__dict__
        # overwrite arguments
        d['arguments'] = [arg.to_dict(self.env, self.var_type, self.version, self.use_l1)
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
        elif d['class'] == ParallelArgument.__name__:
            arg = ParallelArgument("tmp", "tmp", 0)
        elif d['class'] == ReturnValue.__name__:
            arg = ReturnValue("tmp")
        elif d['class'] == ExternalPointedArgument.__name__:
            arg = ExternalPointedArgument("tmp");
        else:
            raise RuntimeError("Unknown class name")
        arg.__dict__ = d['dict']
        return arg

    def to_plptest(self):
        test_name = "%s(%s)" % (self.function_name,
                                ", ".join(["%s=%s" % (k, str(self.env[k]))
                                           for k in self.visible_env]))
        build_dir = "test_%s_t%d" % (self.version, self.test_idx)
        json_str = self.to_json()
        flags = "GARGS=\'\' BUILD_DIR_EXT=%s" % (build_dir)
        setup_flags = "--device %s" % self.device_name
        gen_flags = "--json %s" % (json_str)
        # set the platform for compatibility with various different Pulp-SDK versions
        platform_str = "platform=gvsoc" # default platform
        if "TEST_PLATFORM" in os.environ:
            platform_str = "platform=%s" % (os.environ["TEST_PLATFORM"])
        elif "PULP_CURRENT_CONFIG_ARGS" in os.environ:
            platform_str = os.environ["PULP_CURRENT_CONFIG_ARGS"]
        file_name = os.path.abspath(__file__)
        return PulpTest(name=test_name,
                        commands=[
                            Shell('setup_dir', 'python3 %s --setup %s' % (file_name, setup_flags)),
                            Shell('clean', 'make clean %s' % (flags)),
                            Shell('gen', 'python3 %s --gen %s' % (file_name, gen_flags)),
                            Shell('build', 'make all %s' % (flags)),
                            Shell('run', 'make run %s %s' % (platform_str, flags)),
                            Shell('clean_dir', 'python3 %s --clean %s' % (file_name, setup_flags)),
                            Check('check', check_output, test_obj=self)
                        ],
                        timeout=1000000)

    def function_signature(self):
        arguments_str = ', '.join([arg.name if not isinstance(arg, ExternalPointedArgument) else "&" + arg.name for arg in self.arguments])
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
        any([header.write_check(arg, self.device_name, self.extended_output)
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
    def __init__(self, filename='data.h', indent=4, max_line_len=100, allow_l1=True):
        self.filename = filename
        self.tab = ' ' * indent
        self.width = max_line_len
        self.fp = None
        self.allow_l1 = allow_l1

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
        self.generate_abs()

    def write_array(self, name, var_type, arr, use_l1):
        target_loc = 'RT_L1_DATA' if use_l1 and self.allow_l1 else 'RT_L2_DATA'
        nl = '\n' + self.tab
        if var_type == "float":
            self.fp.write('%s uint32_t %s__int[%s] = {\n' % (target_loc, name, len(arr)))
            self.fp.write(self.tab)
            self.fp.write(nl.join(textwrap.wrap(', '.join([fmt_float(x) for x in arr]),
                                                width=self.width)))
            self.fp.write('\n};\n')
            self.fp.write('%s %s* %s = (%s*)((void*)%s__int);' % (target_loc, var_type, name,
                                                                  var_type, name))
            self.fp.write('\n\n')
        else:
            self.fp.write('%s %s %s[%s] = {\n' % (target_loc, var_type, name, len(arr)))
            self.fp.write(self.tab)
            self.fp.write(nl.join(textwrap.wrap(', '.join([str(x) for x in arr]),
                                                width=self.width)))
            self.fp.write('\n};\n\n')

    def write_scalar(self, name, var_type, value, use_l1):
        target_loc = 'L1_DATA' if use_l1 and self.allow_l1 else 'L2_DATA'
        if var_type == "float":
            self.fp.write('%s uint32_t %s__int = %s;\n' % (target_loc, name, fmt_float(value)))
            self.fp.write('%s %s %s = *((%s*)((void*)&%s__int));\n\n' % (target_loc, var_type, name,
                                                                         var_type, name))
        else:
            self.fp.write('%s %s %s = %s;\n\n' % (target_loc, var_type, name, value))

    def generate_check(self, test):
        self.fp.write('#define CHECK {\\\n')
        test.generate_check(self)
        self.fp.write('}\n\n')

    def write_check(self, arg, target, print_errors=False):
        display_format = "%.10f" if arg.ctype == "float" else "%d"
        check_str = "%sif (%s[i] != %s[i]) {\\\n" % (self.tab * 2, arg.name, arg.reference_name)
        # Generate the check string
        # For the fix-point and integer check string with tolerance, we need to take the wrapping
        # into account. Therefore, we check for all three different cases.
        if arg.tolerance != 0:
            if arg.ctype == "float":
                # In case of float: add a tiny absolute offset of 0.0001
                check_str = dedent(
                    """\
                    {sp}{sp}float __tol = ABS({tol:E} * (float){exp}[i] + 0.0001);\\
                    {sp}{sp}if (!({acq}[i] >= ({ty})({exp}[i] - __tol) &&\\
                    {sp}{sp}      {acq}[i] <= ({ty})({exp}[i] + __tol))) {{\\
                    """
                ).format(sp=self.tab, acq=arg.name, exp=arg.reference_name,
                         tol=arg.tolerance, ty=arg.ctype)
            elif target == "ibex":
                # in this case, we cannot use floating point! But make sure that the fraction is at
                # least 1.
                check_str = dedent(
                    """\
                    {sp}{sp}{ty} __tol_t = ABS({exp}[i] / {tol_fraction}) + 1;\\
                    {sp}{sp}if (!(({exp}[i] < {type_min} + __tol_t &&\\
                    {sp}{sp}       ({acq}[i] <= {exp}[i] + __tol_t ||\\
                    {sp}{sp}        {acq}[i] >= {exp}[i] - __tol_t)) ||\\
                    {sp}{sp}      ({exp}[i] > {type_max} - __tol_t &&\\
                    {sp}{sp}       ({acq}[i] >= {exp}[i] - __tol_t ||\\
                    {sp}{sp}        {acq}[i] <= {exp}[i] + __tol_t)) ||\\
                    {sp}{sp}      ({exp}[i] >= {type_min} + __tol_t &&\\
                    {sp}{sp}       {exp}[i] <= {type_max} - __tol_t &&\\
                    {sp}{sp}       ({acq}[i] >= {exp}[i] - __tol_t &&\\
                    {sp}{sp}        {acq}[i] <= {exp}[i] + __tol_t)))) {{\\
                    """
                ).format(sp=self.tab, acq=arg.name, exp=arg.reference_name,
                         ty=arg.ctype, tol_fraction=int(1 / arg.tolerance),
                         type_min=-(1 << 7) if arg.ctype == "int8_t"
                                  else -(1 << 15) if arg.ctype == "int16_t"
                                  else -(1 << 31),
                         type_max=(1 << 7) - 1 if arg.ctype == "int8_t"
                                  else (1 << 15) - 1 if arg.ctype == "int16_t"
                                  else (1 << 31) - 1)
            else:
                # Here, we can use float. But for the int-version, we want to round up.
                check_str = dedent(
                    """\
                    {sp}{sp}float __tol = ABS({tol:E} * (float){exp}[i]);\\
                    {sp}{sp}{ty} __tol_t = ({ty})(__tol + 0.999);\\
                    {sp}{sp}if (!(({exp}[i] < {type_min} + __tol_t &&\\
                    {sp}{sp}       ({acq}[i] <= {exp}[i] + __tol_t ||\\
                    {sp}{sp}        {acq}[i] >= {exp}[i] - __tol_t)) ||\\
                    {sp}{sp}      ({exp}[i] > {type_max} - __tol_t &&\\
                    {sp}{sp}       ({acq}[i] >= {exp}[i] - __tol_t ||\\
                    {sp}{sp}        {acq}[i] <= {exp}[i] + __tol_t)) ||\\
                    {sp}{sp}      ({exp}[i] >= {type_min} + __tol_t &&\\
                    {sp}{sp}       {exp}[i] <= {type_max} - __tol_t &&\\
                    {sp}{sp}       ({acq}[i] >= {exp}[i] - __tol_t &&\\
                    {sp}{sp}        {acq}[i] <= {exp}[i] + __tol_t)))) {{\\
                    """
                ).format(sp=self.tab, acq=arg.name, exp=arg.reference_name,
                         tol=arg.tolerance, ty=arg.ctype,
                         type_min=-(1 << 7) if arg.ctype == "int8_t"
                                  else -(1 << 15) if arg.ctype == "int16_t"
                                  else -(1 << 31),
                         type_max=(1 << 7) - 1 if arg.ctype == "int8_t"
                                  else (1 << 15) - 1 if arg.ctype == "int16_t"
                                  else (1 << 31) - 1)
        self.fp.write('%sfor (int i = 0; i < %s; i++) {\\\n' % (self.tab, arg.length))
        if print_errors:
            self.fp.write(check_str)
            self.fp.write('%spassed=0;\\\n' % (self.tab * 3))
            self.fp.write('%sprintf("<Mismatch> %s[%%d]: acq=%s, exp=%s\\n", i, %s[i], %s[i]);\\\n'
                          % (self.tab * 3, arg.name, display_format, display_format, arg.name,
                             arg.reference_name))
            self.fp.write('%s}\\\n' % (self.tab * 2))
        else:
            self.fp.write('%sif (%s[i] != %s[i]) passed = 0;\\\n' % (self.tab * 2, arg.name,
                                                                     arg.reference_name))
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
        self.fp.write(
            dedent(
                """\
                #define BENCH {{\\
                {tab}rt_perf_t perf;\\
                {tab}rt_perf_init(&perf);\\
                {tab}int passed = do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);\\
                {tab}printf(\"passed: %d\\n\", passed);\\
                {tab}printf(\"cycles: %d\\n\", rt_perf_read(RT_PERF_CYCLES));\\
                {tab}printf(\"instructions: %d\\n\", rt_perf_read(RT_PERF_INSTR));\\
                {tab}do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);\\
                {tab}printf(\"load_stalls: %d\\n\", rt_perf_read(RT_PERF_LD_STALL));\\
                {tab}do_bench(&perf, 1<<RT_PERF_IMISS, 0);\\
                {tab}printf(\"icache_miss: %d\\n\", rt_perf_read(RT_PERF_IMISS));\\
                {tab}do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);\\
                {tab}printf(\"tcdm_cont: %d\\n\", rt_perf_read(RT_PERF_TCDM_CONT));\\
                }}\\""".format(tab=self.tab)
            )
        )
        self.fp.write('\n\n')

    def generate_abs(self):
        self.fp.write("#define ABS(x) (x > 0 ? x : -x)\n\n")


def fmt_float(val):
    assert(val.dtype == np.float32)
    packed = struct.pack('!f', val)
    int_val = sum([b << ((3 - i) * 8) for i, b in enumerate(packed)])
    return hex(int_val)


def generate_test(function_name, arguments, variables, implemented, use_l1=False,
                  extended_output=True, n_ops=None, arg_ret_type=None):
    visible_env = [v.name for v in variables if v.visible]
    testsets = [
        Testset(
            name=device_name,
            testsets=[
                Testset(
                    name=v,
                    tests=[Test().build(test_idx=i,
                                        function_name=function_name,
                                        version=v,
                                        arg_ret_type=arg_ret_type,
                                        arguments=arguments,
                                        env=e,
                                        visible_env=visible_env,
                                        device_name=device_name,
                                        use_l1=use_l1,
                                        extended_output=extended_output,
                                        n_ops=n_ops).to_plptest()
                           for i, e in enumerate(Sweep(variables))]
                )
                for v in impl if impl[v]
            ]
        )
        for device_name, impl in implemented.items()
    ]

    return {'testsets': testsets}


def main():
    """
    Does either a setup or a clean of the test project
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--setup', action="store_true")
    parser.add_argument('--clean', action="store_true")
    parser.add_argument('--gen', action="store_true")
    parser.add_argument('--device')
    parser.add_argument('--folder')
    parser.add_argument('--json', nargs='*')
    args = parser.parse_args()

    if args.clean:
        clean()
    elif args.setup:
        setup(args.device)
    elif args.gen:
        # get the test directory
        test_dir = os.environ['PLPTEST_PATH']
        # add the location of gen_stimuli.py to the path
        sys.path.append(test_dir)
        # import gen_stimuli
        from gen_stimuli import compute_result

        # parse json
        json_str = ' '.join(args.json)
        test = Test().from_json(json_str)

        # write header file
        with HeaderWriter(allow_l1=test.device_name == 'riscy') as writer:
            writer.write_test(test, compute_result)


def setup(device):
    """
    Setup the test environment
    """
    # first, make sure that all the files are removed
    clean()

    # check for the target device
    if device == "ibex":
        setup_ibex()
    elif device == "riscy":
        setup_riscy()
    else:
        raise RuntimeError("Invalid device: %s" % device)


def setup_ibex():
    """
    Setup test environment for ibex test
    """
    # write makefile
    _write_file("Makefile", dedent(
        """\
        PULP_APP = test
        PULP_APP_FC_SRCS = test.c
        PULP_LDFLAGS += -lplpdsp
        PULP_CFLAGS += -I$(CONFIG_BUILD_DIR) -O3 -g
        ifdef TFLAGS
            PULP_CFLAGS += $(TFLAGS)
        endif
        include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
        PULP_CFLAGS += -D DATA=$(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)
        """
    ))

    # write test.c
    _write_file("test.c", dedent(
        """\
        #include "rt/rt_api.h"
        #include "stdio.h"
        #include "plp_math.h"
        #include "data.h"
        #include "plp_const_structs.h"

        static int do_bench(rt_perf_t *perf, int events, int do_check)
        {
            rt_perf_conf(perf, events);
            rt_perf_reset(perf);
            rt_perf_start(perf);
            FSIG
            rt_perf_stop(perf);
            int passed = 1;
            if (do_check) {
                CHECK
            }
            return passed;
        }
        int main(){
            BENCH
            return 0;
        }
        """
    ))


def setup_riscy():
    """
    Setup test environment for riscy test
    """
    _write_file("Makefile", dedent(
        """\
        PULP_APP = test
        PULP_APP_FC_SRCS = test.c cluster.c
        PULP_LDFLAGS += -lplpdsp
        PULP_CFLAGS += -I$(CONFIG_BUILD_DIR) -O3 -g
        ifdef TFLAGS
            PULP_CFLAGS += $(TFLAGS)
        endif
        include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
        PULP_CFLAGS += -D DATA=$(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)
        """
    ))

    _write_file("test.c", dedent(
        """\
        #include "rt/rt_api.h"
        #include "stdio.h"
        #include "cluster.h"
        int main(){
            rt_cluster_mount(1, 0, 0, NULL);
            rt_cluster_call(NULL, 0, cluster_entry, NULL, NULL, 0, 0, 0, NULL);
            rt_cluster_mount(0, 0, 0, NULL);
            return 0;
        }
        """
    ))

    _write_file("cluster.c", dedent(
        """\
        #include "rt/rt_api.h"
        #include "stdio.h"
        #include "plp_math.h"
        #include "data.h"
        static int do_bench(rt_perf_t *perf, int events, int do_check)
        {
            rt_perf_conf(perf, events);
            rt_perf_reset(perf);
            rt_perf_start(perf);
            FSIG
            rt_perf_stop(perf);
            int passed = 1;
            if (do_check) {
                CHECK
            }
            return passed;
        }
        void cluster_entry(void *arg){
            BENCH
            return;
        }
        """
    ))

    _write_file("cluster.h", dedent(
        """\
        #ifndef __INC_CLUSTER_H__
        #define __INC_CLUSTER_H__
        void cluster_entry(void *arg);
        #endif
        """
    ))


def _write_file(filename, content):
    with open(filename, "w") as f:
        f.write(content)


def clean():
    """
    Clean the test environment
    """
    if os.path.isfile("Makefile"):
        print("removing Makefile")
        os.remove("Makefile")
    if os.path.isfile("cluster.c"):
        print("removing cluster.c")
        os.remove("cluster.c")
    if os.path.isfile("cluster.h"):
        print("removing cluster.h")
        os.remove("cluster.h")
    if os.path.isfile("test.c"):
        print("removing test.c")
        os.remove("test.c")
    if os.path.isfile("data.h"):
        print("removing data.h")
        os.remove("data.h")


if __name__ == "__main__":
    main()
