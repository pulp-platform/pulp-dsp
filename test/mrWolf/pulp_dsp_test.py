import os
import random
from plptest import Test as PulpTest
from plptest import Shell, Check
from itertools import product, chain
from functools import partial
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
    def __init__(self, name, ctype, value):
        """
        name: name of the argument (in the function declaration)
        ctype: C type of the argument (or 'var_type', 'ret_type')
        value: Number for initialization, or SweepVariable, or None for random value
        """
        super(Argument, self).__init__()
        self.name = name
        self.ctype = ctype
        self.value = value
        if isinstance(self.value, SweepVariable):
            self.value = self.value.name

    def to_dict(self, env, var_type):
        d = self.apply(env, var_type).__dict__
        return {'class': type(self).__name__, 'dict': d}

    def apply(self, env, var_type):
        """ Applies environment and var_type to the argument """
        return Argument(self.name, self.get_type(var_type), self.interpret_value(env))

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
        n_bits = 16 if self.ctype == 'int16_t' else 8 if self.ctype == 'int8_t' else 32
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
            self.value = np.random.randint(low=min_value, high=max_value + 1, dtype=self.get_dtype())
        return self.value

    def generate_stimuli(self, header, use_l1):
        """ Writes stimuli value to header file """
        self.generate_value()
        header.write_scalar(self.name, self.ctype, self.value, use_l1)


class ArrayArgument(Argument):
    """Array Argument"""
    def __init__(self, name, ctype, length, value):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or tuple for random value between (min, max)
        value: tuple for random value between (min, max), or list with values, or single number for all.
        """
        super(ArrayArgument, self).__init__(name, ctype, value)
        self.length = length
        if isinstance(self.length, SweepVariable):
            self.length = self.length.name

    def apply(self, env, var_type):
        return ArrayArgument(self.name, self.get_type(var_type), self.interpret_length(env), self.interpret_value(env))

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
            self.value = np.random.randint(low=min_value, high=max_value + 1, size=self.length, dtype=dtype)
        elif isinstance(self.value, (int, float)):
            self.value = (np.ones(self.length) * self.value).astype(dtype)
        elif isinstance(self.value, np.ndarray):
            assert len(self.value) == self.length
        else:
            raise RuntimeError("Unknown Type!")
        return self.value

    def generate_stimuli(self, header, use_l1):
        """ Writes stimuli value to header file """
        self.generate_value()
        header.write_array(self.name, self.ctype, self.value, use_l1)


class OutputArgument(ArrayArgument):
    """Output Array Argument"""
    def __init__(self, name, ctype, length):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or None for random value
        """
        super(OutputArgument, self).__init__(name, ctype, length, 0)
        self.reference_name = self.name + "_reference"

    def apply(self, env, var_type):
        return OutputArgument(self.name, self.get_type(var_type), self.interpret_length(env))

    def generate_value(self):
        """ Generates the value of argument, stores it in self.value and returns it. """
        assert not isinstance(self.value, str)
        assert isinstance(self.length, int)
        self.value = np.zeros(self.length).astype(self.get_dtype())
        return self.value

    def generate_reference(self, gen_function, header, use_l1):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        header.write_array(self.reference_name, self.ctype, reference, use_l1)


class ReturnValue(Argument):
    """ result value """
    def __init__(self, ctype):
        """
        ctype: type of the argument (or 'var_type', 'ret_type')
        """
        super(ReturnValue, self).__init__("return_value", ctype, 0)
        self.reference_name = self.name + "_reference"

    def generate_reference(self, gen_function, header, use_l1):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        header.write_scalar(self.reference_name, self.ctype, reference, use_l1)


class FixPointArgument(Argument):
    """fixpoint argument"""
    def __init__(self, name, ctype, value):
        """
        name: name of the argument (in the function declaration)
        ctype: C type of the argument (or 'var_type', 'ret_type')
        value: Number for initialization, or SweepVariable, or None for random value
        """
        super(FixPointArgument, self).__init__(name, ctype, value)

    def apply(self, env, var_type):
        return FixPointArgument(self.name, self.get_type(var_type), self.interpret_value(env))


def check_output(config, output):
    # print(output)
    passed = False
    for item in output.split('\n'):
        if 'Test passed:' in item:
            # print(item)
            if item.find('1') != -1:
                passed = True
        elif 'Total cycles:' in item:
            print(item)
        elif 'Instructions:' in item:
            print(item)
        elif 'comp_result:' in item:
            # print(item) # can be used for debug purposes
            pass

    return (passed, None)


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
        self.version = ''

    def build(self, test_idx, function_name, version, arguments, env, use_l1):
        self.test_idx = test_idx
        self.function_name = "%s_%s" % (function_name, version)
        self.version = version
        self.env = env
        self.use_l1 = use_l1

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
            self.fix_point = fix_point_args[0].apply(self.env, self.var_type).value
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
        d['arguments'] = [arg.to_dict(self.env, self.var_type) for arg in self.arguments]
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
                                  Check('check', check_output)],
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
        any([header.write_return_check(arg.name, arg.reference_name)
             for arg in self.arguments if isinstance(arg, ReturnValue)])

        # generate result check
        any([header.write_check(arg.name, arg.reference_name, arg.length)
             for arg in self.arguments if isinstance(arg, OutputArgument)])

    def generate_stimuli(self, header):
        any([arg.generate_stimuli(header, self.use_l1) for arg in self.arguments])

    def generate_reference(self, header, gen_function):
        # build input dictionary
        inputs = {arg.name: arg
                  for arg in self.arguments
                  if not isinstance(arg, (ReturnValue, OutputArgument))}
        gen_function_prep = partial(gen_function, inputs=inputs, fix_point=self.fix_point)
        any([arg.generate_reference(gen_function_prep, header, self.use_l1)
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
        env = {}
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

    def write_check(self, result_name, reference_name, size):
        self.fp.write('%sfor (int i = 0; i < %s; i++) {\\\n' % (self.tab, size))
        self.fp.write('%sif (%s[i] != %s[i]) passed = 0;\\\n' % (self.tab * 2, result_name,
                                                                 reference_name))
        self.fp.write('%s}\\\n' % self.tab)

    def write_return_check(self, result_name, reference_name):
        self.fp.write('%sif (%s != %s) passed = 0;\\\n' % (self.tab, result_name, reference_name))

    def generate_fsig(self, test):
        self.fp.write('#define FSIG {\\\n')
        self.fp.write('%s%s;\\\n' % (self.tab, test.function_signature()))
        self.fp.write('}\n\n')


def generate_test(device_name, function_name, arguments, variables, implemented, use_l1=False):
    tests = [[Test().build(i, function_name, v, arguments, e, use_l1).to_plptest()
              for i, e in enumerate(Sweep(variables))]
             for v in implemented if implemented[v]]

    return {'tests': list(chain(*tests))}


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
