import os
import time
import random
from plptest import Test as PulpTest, Testset
from plptest import Shell, Check
from itertools import product
from functools import partial
from collections import OrderedDict
from copy import deepcopy
import numpy as np
from textwrap import dedent, indent, wrap
import struct
import traceback

GENERATE_STIMULI = "gen_stimuli"


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


class Argument(object):
    """docstring for argument"""
    def __init__(self, name, ctype, value=None, use_l1=None, in_function=True):
        """
        name: name of the argument (in the function declaration)
        ctype: String, one of the following:
               - C type of the argument (like 'int32_t')
               - 'var_type' or 'ret_type', which is determined based on the current version.
        value: One of the following:
               - Number for constant initialization
               - The name of a SweepVariable or DynamicVariable, to take their value
               - None for a random value
               - tuple(min, max) for a random value in the given range
               - "gen_stimuli" (GENERATE_STIMULI): the function generate_stimuli in gen_stimuli.py
                 will be called for generating the values. This function must take the argument
                 itself, and the environment (dict(string, number)) as arguments, and return the
                 desired value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(Argument, self).__init__()
        self.name = name
        self.ctype = ctype
        self.value = value
        self.use_l1 = use_l1
        self.in_function = in_function
        if isinstance(self.value, SweepVariable):
            self.value = self.value.name

    def apply(self, env, var_type, version, use_l1, idx):
        """
        Prepare the variable for the specific test case. The following is done:
        - Apply the environment (current iteration of the sweep variables)
        - Apply the version (var_type or ret_type)
        - Apply use_l1 flag
        - Alter the name to contain the test id
        """
        # set the use_l1 flag
        if self.use_l1 is None:
            self.use_l1 = use_l1
        # apply the ctype
        if self.ctype == 'var_type':
            self.ctype = var_type[0]
        if self.ctype == 'ret_type':
            self.ctype = var_type[1]
        # change the name
        self.name = "t{}__{}".format(idx, self.name)
        return self

    def general_name(self):
        """ returns the name without txx__ prefix """
        splits = self.name.split("__")
        if len(splits) == 0 or not splits[0].startswith("t"):
            return self.name
        else:
            return self.name[len(splits[0] + "__"):]

    def get_range(self):
        """ return the range for random values based on the ctype """
        assert self.ctype not in ['var_type', 'ret_type']
        if self.ctype == "float":
            return -1, 1
        n_bits = 16 if self.ctype == 'int16_t' else 8 if self.ctype == 'int8_t' else 16
        return (-(2 ** (n_bits - 1)), (2 ** (n_bits - 1)) - 1)

    def get_dtype(self):
        """ translation from self.ctype as string to a np dtype """
        if self.ctype == "int8_t":
            return np.int8
        if self.ctype == "int16_t":
            return np.int16
        if self.ctype == "int32_t":
            return np.int32
        if self.ctype == "float":
            return np.float32
        raise RuntimeError("Unknown type: %s" % self.ctype)

    def arg_str(self):
        """ Returns the string to show for funciton argument """
        if self.ctype == "float":
            # floats are defined as unions, so we take the float variant
            return "%s.f" % self.name
        else:
            return self.name

    def do_bench_setup_str(self):
        """ returns the string for setup in do_bench function """
        return None

    def run_test_setup_str(self):
        """ returns the string for setup the variable """
        return None

    def run_test_free_str(self):
        """ string to free up memory for the variable """
        return None

    def check_str(self, target):
        """ returns the string to check the result """
        return None

    def generate_value(self, env, gen_stimuli):
        """ Interpret the type of self.value and generate the stimuli """
        if self.value == GENERATE_STIMULI:
            self.value = gen_stimuli(self, env)
        elif isinstance(self.value, str):
            self.value = env[self.value]
        elif self.value is None or (isinstance(self.value, (tuple, list)) and len(self.value) == 2):
            if isinstance(self.value, tuple):
                min_value, max_value = self.value
            else:
                min_value, max_value = self.get_range()
            if self.ctype == "float":
                self.value = np.random.uniform(low=min_value, high=max_value)
            else:
                self.value = np.random.randint(low=min_value, high=max_value + 1)
            self.value = self.get_dtype()(self.value).item()

    def header_str(self):
        """ return the string for delclaring and initializing the data """
        assert isinstance(self.value, (float, int))
        return declare_scalar(self.name, self.ctype, self.value)

    def reference_header_str(self, gen_function):
        """ return the header string for declaring and initializing the reference """
        return None


class ArrayArgument(Argument):
    """Array Argument"""
    def __init__(self, name, ctype, length, value=None, use_l1=None, in_function=True):
        """
        name: name of the argument
        ctype: String, one of the following:
               - C type of the argument (like 'int32_t')
               - 'var_type' or 'ret_type', which is determined based on the current version.
        length: One of the following:
                - Integer for a constant length
                - The name of a SweepVariable or DynamicVariable, to take their value
                - tuple(min, max) for random value in the given range
        value: One of the following:
               - Number for constant initialization, all elements will have the same value
               - None for a random value
               - tuple(min, max) for a random value in the given range
               - np.ndarray for a constant initialization
               - "gen_stimuli" (GENERATE_STIMULI): the function generate_stimuli in gen_stimuli.py
                 will be called for generating the values. This function must take the argument
                 itself, and the environment (dict(string, number)) as arguments, and return the
                 numpy array.
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(ArrayArgument, self).__init__(name, ctype, value, use_l1, in_function)
        self.length = length
        if isinstance(self.length, SweepVariable):
            self.length = self.length.name

    def apply(self, env, var_type, version, use_l1, idx):
        """
        Prepare the variable for the specific test case. The following is done:
        - Apply the environment (current iteration of the sweep variables)
        - Apply the version (var_type or ret_type)
        - Apply use_l1 flag
        - Interpret the length of the variable
        - Alter the name to contain the test id
        """
        # interpret the length
        self.interpret_length(env)
        # do the same thing as a regular Argument
        return super(ArrayArgument, self).apply(env, var_type, version, use_l1, idx)

    def l2_data_name(self):
        return self.name + "__l2"

    def interpret_length(self, env):
        """ interpret the length of the variable based on the environment """
        if isinstance(self.length, tuple):
            assert len(self.length) == 2
            self.length = random.randint(*self.length)
        if isinstance(self.length, str):
            self.length = env[self.length]
        if isinstance(self.length, int):
            self.length = self.length
        assert isinstance(self.length, int)

    def arg_str(self):
        """ Returns the string to show for funciton argument """
        return self.name

    def run_test_setup_str(self):
        """ returns the string for setup the variable """
        if self.use_l1:
            return dedent(
                """\
                {l1_name} = rt_alloc(RT_ALLOC_CL_DATA, sizeof({ctype}) * {len});
                rt_dma_memcpy((unsigned int){l2_name},
                              (unsigned int){l1_name},
                              sizeof({ctype}) * {len},
                              RT_DMA_DIR_EXT2LOC, 0, &copy);
                rt_dma_wait(&copy);
                """
            ).format(l1_name=self.name, l2_name=self.l2_data_name(), ctype=self.ctype,
                           len=self.length)
        else:
            return None

    def run_test_free_str(self):
        """ string to free up memory for the variable """
        if self.use_l1:
            return dedent(
                """\
                rt_free(RT_ALLOC_CL_DATA, {l1_name}, sizeof({ctype}) * {len});
                """
            ).format(l1_name=self.name, ctype=self.ctype, len=self.length)
        else:
            return None

    def generate_value(self, env, gen_stimuli):
        """ Interpret the type of self.value and generate the stimuli """
        assert isinstance(self.length, int)
        dtype = self.get_dtype()
        if self.value == GENERATE_STIMULI:
            self.value = gen_stimuli(self, env)
        elif isinstance(self.value, str):
            self.value = env[self.value]
        elif self.value is None or (isinstance(self.value, (tuple, list)) and len(self.value) == 2):
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
            pass # nothing to do

    def header_str(self):
        """ return the string for delclaring and initializing the data """
        assert isinstance(self.value, np.ndarray)
        if self.use_l1:
            return dedent(
                """\
                {ctype}* {name};
                {l2_array}\
                """
            ).format(ctype=self.ctype, name=self.name,
                     l2_array=declare_array(self.l2_data_name(), self.ctype, self.length,
                                            self.value))
        else:
            return declare_array(self.name, self.ctype, self.length, self.value)


class OutputArgument(ArrayArgument):
    """Output Array Argument"""
    def __init__(self, name, ctype, length, use_l1=None, tolerance=0, in_function=True):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        tolerance: constant or function, which maps the output variable type to a relative or
                   absolute tolerance. If the value is greater or equal to 1, it is interpreted
                   as absolute.
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(OutputArgument, self).__init__(name, ctype, length, 0, use_l1, in_function)
        self.tolerance = tolerance

    def reference_name(self):
        return self.name + "__reference"

    def apply(self, env, var_type, version, use_l1, idx):
        """
        Prepare the variable for the specific test case. The following is done:
        - Apply the environment (current iteration of the sweep variables)
        - Apply the version (var_type or ret_type)
        - Apply use_l1 flag
        - Interpret the length of the variable
        - Apply the tolerance
        - Alter the name to contain the test id
        """
        if callable(self.tolerance):
            self.tolerance = self.tolerance(version)
        return super(OutputArgument, self).apply(env, var_type, version, use_l1, idx)

    def check_str(self, target):
        """ returns the string to check the result """
        display_format = "%.10f" if self.ctype == "float" else "%d"
        check_str = tolerance_check_str("%s[i]" % self.name, "%s[i]" % self.reference_name(),
                                        self.tolerance, self.ctype, "    ", target)
        return dedent(
            """\
            for (int i = 0; i < {len}; i++) {{
            {check_str}
                    passed = 0;
                    printf("    <Mismatch> {acq}[%d]: acq={fmt}, exp={fmt}\\n", i, {acq}[i], {exp}[i]);
                }}
            }}
            """
        ).format(len=self.length,
                 check_str=check_str,
                 acq=self.name,
                 exp=self.reference_name(),
                 fmt=display_format)

    def reference_header_str(self, gen_function):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        return declare_array(self.reference_name(), self.ctype, self.length, reference)


class InplaceArgument(OutputArgument):
    """ Array, that is both used as input and output
    It must be handled differently in order to make the various benchmark passes identical (in case
    the runtime of the function is data dependent).

    It will produce three arrays in total: One with the original values (which will never be
    modified), one with the expected result (which will also never be modified), and one on which
    the computation is performed. Before each new call of the function, the data from the original
    array needs to be copied to the actual computation array.
    """
    def __init__(self, name, ctype, length, value=None, use_l1=None, tolerance=0, in_function=True):
        """
        name: name of the argument
        ctype: type of the argument (or 'var_type', 'ret_type')
        length: Length of the array, or SweepVariable, or None for random value
        value: One of the following:
               - Number for constant initialization, all elements will have the same value
               - None for a random value
               - tuple(min, max) for a random value in the given range
               - np.ndarray for a constant initialization
               - "gen_stimuli" (GENERATE_STIMULI): the function generate_stimuli in gen_stimuli.py
                 will be called for generating the values. This function must take the argument
                 itself, and the environment (dict(string, number)) as arguments, and return the
                 numpy array.
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        tolerance: constant or function, which maps the output variable type to a relative or
                   absolute tolerance. If the value is greater or equal to 1, it is interpreted
                   as absolute.
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(InplaceArgument, self).__init__(name, ctype, length, use_l1, tolerance, in_function)
        # overwrite the value
        self.value = value

    def original_name(self):
        return self.name + "__original"

    def do_bench_setup_str(self):
        """ returns the string for setup in do_bench function """
        return dedent(
            """\
            for (int i = 0; i < {len}; i++) {{
                {data}[i] = {original}[i];
            }}
            """
        ).format(len=self.length, data=self.name, original=self.original_name())

    def header_str(self):
        """ return the string for delclaring and initializing the data """
        assert isinstance(self.value, np.ndarray)
        return dedent(
            """\
            {super_init}
            {original_init}\
            """
        ).format(super_init=super(InplaceArgument, self).header_str(),
                 original_init=declare_array(self.original_name(), self.ctype, self.length,
                                             self.value))


class ReturnValue(Argument):
    """ result value """
    def __init__(self, ctype, use_l1=None, tolerance=0):
        """
        ctype: type of the argument (or 'var_type', 'ret_type')
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        tolerance: constant or function, which maps the output variable type to a relative or
                   absolute tolerance. If the value is greater or equal to 1, it is interpreted
                   as absolute.
        """
        super(ReturnValue, self).__init__("return_value", ctype, 0, use_l1, False)
        self.tolerance = tolerance
        self.in_function = False

    def reference_name(self):
        return self.name + "__reference"

    def apply(self, env, var_type, version, use_l1, idx):
        """
        Prepare the variable for the specific test case. The following is done:
        - Apply the environment (current iteration of the sweep variables)
        - Apply the version (var_type or ret_type)
        - Apply use_l1 flag
        - Apply the tolerance
        - Alter the name to contain the test id
        """
        if callable(self.tolerance):
            self.tolerance = self.tolerance(version)
        return super(ReturnValue, self).apply(env, var_type, version, use_l1, idx)

    def check_str(self, target):
        """ returns the string to check the result """
        display_format = "%.10f" if self.ctype == "float" else "%d"
        check_str = tolerance_check_str(self.name, self.reference_name(),
                                        self.tolerance, self.ctype, "", target)
        return dedent(
            """\
            {check_str}
                passed = 0;
                printf("    <Mismatch> {acq}[%d]: acq={fmt}, exp={fmt}\\n", i, {acq}[i], {exp}[i]);
            }}
            """
        ).format(check_str=check_str,
                 acq=self.name,
                 exp=self.reference_name(),
                 fmt=display_format)

    def reference_header_str(self, gen_function):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        return declare_scalar(self.reference_name(), self.ctype, reference)


class FixPointArgument(Argument):
    """fixpoint argument for setting the decimal point, ctype is always set to uint32_t"""
    def __init__(self, name, value, use_l1=None, in_function=True):
        """
        name: name of the argument (in the function declaration)
        value: Number for initialization, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(FixPointArgument, self).__init__(name, "uint32_t", value, use_l1, in_function)


class ParallelArgument(Argument):
    """Argument for choosing the number of cores argument. ctype is always set to uint32_t"""
    def __init__(self, name, value, use_l1=None, in_function=True):
        """
        name: name of the argument
        value: Number for initialization, or SweepVariable, or None for random value
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(ParallelArgument, self).__init__(name, "uint32_t", value, use_l1, in_function)


class CustomArgument(Argument):
    """ Custom Argument
    With this argument, you can write your own initialization. It can be used either to point to an
    externally defined variable, struct or array. But it can also be used to create a struct with
    fields, which may point to other arguments.
    """
    def __init__(self, name, value, as_ptr=False, deref=False, in_function=True):
        """
        name: Name of the argument (in the initialization and function declaration)
        value: Function, which should return a string for initializing the CustomVariable.
               By using other arguments (for which you have set in_function=False), you can craft
               structs. This function can produce a multi-line initialization string. The function
               has the following arguments:
               - env: dict(name: str, value: number): Dictionary with the environment
               - version: str: Version string
               - var_type: tuple(str, str), which contains (var_type, ret_type)
               - use_l1: Bool, wether to use L1 memory.
               - arg_name: F: str -> str: Function which transforms the name of an argument to the
                 name which will actually appear in the test program. Each iteration of the
                 accumulated test will use different variable names. Therefore, all references need
                 to be transformed.
               The function *must* return the entire string for initialization, including the type
               and the name of the variable.
        as_ptr: Boolean, if True, the struct is passed as pointer to the function. Else, it is
                passed without referencing it.
        deref: Boolean, if True, the struct is dereferenced before passing to the function. Else, it
               is passed without dereferencing it.
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        """
        super(CustomArgument, self).__init__(name, None, value, None, in_function)
        self.as_ptr = as_ptr
        self.deref = deref
        assert not (self.as_ptr and self.deref)

    def apply(self, env, var_type, version, use_l1, idx):
        """
        Prepares the value (initialization string) of the custom argument, and the name to include
        the test id
        """
        self.name = "t{}__{}".format(idx, self.name)
        self.value = self.value(env, version, var_type, use_l1, lambda f: "t{}__{}".format(idx, f))
        return self

    def arg_str(self):
        """ Returns the string to show for funciton argument """
        if not self.in_function:
            return None
        if self.as_ptr:
            return "&%s" % (self.name)
        if self.deref:
            return "*%s" % (self.name)
        else:
            return self.name

    def generate_value(self, env, gen_stimuli):
        """ Interpret the type of self.value and generate the stimuli """
        # Nothing to do here! the init string was already created
        pass

    def header_str(self):
        """ return the string for delclaring and initializing the data """
        # here, we just need to return self.value, since this is the initialization string.
        return self.value


class AggregatedTestCase(object):
    """ Structure for one testcase in the aggregated tests """
    def __init__(self, idx=0, arguments=None, env=None, n_ops=0):
        """ constructor. Arguments must already be applied! """
        self.idx = idx
        self.arguments = arguments or []
        self.env = env
        self.n_ops = n_ops

        # get the fix point
        self.fix_point = ([arg.value for arg
                           in self.arguments
                           if isinstance(arg, FixPointArgument)] or [None])[0]
        assert self.fix_point is None or isinstance(self.fix_point, int)

    def generate_header_content(self, gen_stimuli, gen_result):
        """ generate all stimuli values and compute the expected result """
        # generate value of all arguments
        [arg.generate_value(self.env, gen_stimuli) for arg in self.arguments]
        content = "\n".join([arg.header_str() for arg in self.arguments])
        content += "\n"

        # prepare inputs dictionary
        inputs = {arg.general_name(): arg
                  for arg in self.arguments
                  if isinstance(arg, InplaceArgument) or not isinstance(arg, (ReturnValue,
                                                                              OutputArgument))}

        # prepare the gen_result function
        gen_result_prep = partial(gen_result, inputs=inputs, env=self.env, fix_point=self.fix_point)

        content += "\n".join([x for x in [arg.reference_header_str(gen_result_prep)
                                          for arg in self.arguments]
                              if x is not None])

        return content

    def get_do_bench_function(self, function_name, target):
        """ returns the do_bench function for the current test """
        ret_str = ([a.arg_str() for a in self.arguments if isinstance(a, ReturnValue)] or [""])[0]
        return dedent(
            """\
            static int t{idx}__do_bench(rt_perf_t *perf, int events, int do_check) {{
                // setup variables (like resetting InplaceArguments)
            {setup}

                // start the performance counters
                rt_perf_conf(perf, events);
                rt_perf_reset(perf);
                rt_perf_start(perf);

                // call the function-under-test
                {ret_str}{fname}({args});

                rt_perf_stop(perf);

                // check the result
                int passed = 1;
                if (do_check) {{
            {check}
                }}
                return passed;
            }}
            """
        ).format(idx=self.idx,
                 setup=indent("\n".join([arg.do_bench_setup_str()
                                         for arg in self.arguments
                                         if arg.do_bench_setup_str() is not None]),
                              "    "),
                 ret_str=ret_str,
                 fname=function_name,
                 args=", ".join([a.arg_str() for a in self.arguments if a.in_function]),
                 check=indent("\n".join([arg.check_str(target)
                                         for arg in self.arguments
                                         if arg.check_str(target) is not None]),
                              "        "))

    def get_run_test_function_call(self):
        return "t{}__run_test();".format(self.idx)

    def get_run_test_function(self):
        """ returns the run_test function for the current test """
        return dedent(
            """\
            static void t{idx}__run_test(void) {{
                printf("\\ntestcase {idx} {{\\n");

                // setup the test
                rt_dma_copy_t copy;

            {setup}

                // setup performance counter
                rt_perf_t perf;
                rt_perf_init(&perf);

                // run 1: check result and get numebr of cycles / instructions
                int passed = t{idx}__do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);
                printf("    passed: %d\\n", passed);
                printf("    cycles: %d\\n", rt_perf_read(RT_PERF_CYCLES));
                printf("    instructions: %d\\n", rt_perf_read(RT_PERF_INSTR));

                // run 2: count load stalls
                t{idx}__do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);
                printf("    load_stalls: %d\\n", rt_perf_read(RT_PERF_LD_STALL));

                // run 3: count instruction cache misses
                t{idx}__do_bench(&perf, 1<<RT_PERF_IMISS, 0);
                printf("    icache_miss: %d\\n", rt_perf_read(RT_PERF_IMISS));

                // run 4: count TCDM contentions
                t{idx}__do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);
                printf("    tcdm_cont: %d\\n", rt_perf_read(RT_PERF_TCDM_CONT));

                // free up all memory
            {free}

                printf("}}\\n");
            }}
            """
        ).format(idx=self.idx,
                 setup=indent("\n".join([arg.run_test_setup_str()
                                         for arg in self.arguments
                                         if arg.run_test_setup_str() is not None]),
                              "    "),
                 free=indent("".join([arg.run_test_free_str()
                                      for arg in self.arguments
                                      if arg.run_test_free_str() is not None]),
                             "    "))

    def get_header_filename(self):
        """ returns the name of the header file """
        return "data_t{}.h".format(self.idx)

    def get_header_file_str(self, gen_stimuli, gen_result):
        """ returns the header file of this test as a string """
        return dedent(
            """\
            #ifndef __PULP_DSP_TEST__DATA_T{idx}_H__
            #define __PULP_DSP_TEST__DATA_T{idx}_H__

            // include the common header
            #include "common.h"

            {content}

            #endif//__PULP_DSP_TEST__DATA_T{idx}_H__
            """
        ).format(idx=self.idx, content=self.generate_header_content(gen_stimuli, gen_result))


class AggregatedTest(object):
    """ Test structure for aggregated tests
    Aggregated tests work by generating all required arrays for all iterations at once, and storing
    them into L2 memory. Then, at runtime, each iteration is executed one by one, and all data for
    L1 memory is copied to L1 storage. For this, the largest size of each array is allocated
    statically.
    """
    def __init__(self, function_name, version, arg_ret_type, arguments, variables, visible_env,
                 device_name, use_l1, extended_output=True, n_ops=None):
        """ Build an aggregated test. This will also apply all arguments for all versions """
        self.function_name = function_name
        self.version = version
        self.device_name = device_name
        self.extended_output = extended_output
        self.visible_env = visible_env

        # extend funciton name
        self.function_name += "_" + self.version

        # set use_l1 to false for ibex
        if self.device_name == "ibex":
            use_l1 = False

        # set n_ops function
        if n_ops is None:
            self.n_ops = lambda env: 0
        elif isinstance(n_ops, int):
            self.n_ops = lambda env: n_ops
        elif callable(n_ops):
            self.n_ops = n_ops
        else:
            raise RuntimeError("Unknown type for n_ops: {}".format(type(n_ops)))

        # prepare var_type
        version_type = version.split('_')[0]
        if arg_ret_type is not None and version_type in arg_ret_type:
            var_type = arg_ret_type[version_type]
        elif version.startswith('i32') or version.startswith('q32'):
            var_type = ['int32_t', 'int32_t']
        elif version.startswith('i16') or version.startswith('q16'):
            var_type = ['int16_t', 'int32_t']
        elif version.startswith('i8') or version.startswith('q8'):
            var_type = ['int8_t', 'int32_t']
        else:
            var_type = ['float', 'float']

        # arguments based on if fix-point and parallel is used
        if not version.startswith('q') and not version.endswith('parallel'):
            arguments = [arg for arg in arguments
                         if not isinstance(arg, (FixPointArgument, ParallelArgument))]
        if not version.startswith('q') and version.endswith('parallel'):
            arguments = [arg for arg in arguments if not isinstance(arg, FixPointArgument)]
        if version.startswith('q') and not version.endswith('parallel'):
            arguments = [arg for arg in arguments if not isinstance(arg, ParallelArgument)]
        if version.startswith('q') and version.endswith('parallel'):
            arguments = arguments

        # check fixpoint stuff
        if version.startswith('q'):
            assert len([arg for arg in arguments if isinstance(arg, FixPointArgument)]) == 1

        # generate all aggregated tests
        self.cases = [
            AggregatedTestCase(
                idx=i,
                arguments=[
                    deepcopy(arg).apply(env, var_type, self.version, use_l1, i)
                    for arg in arguments
                ],
                env=env,
                n_ops=self.n_ops(env)
            )
            for (i, env) in enumerate(Sweep(variables))
        ]

    def to_plptest(self):
        """ Returns the PulpTest structure """
        test_name = self.function_name
        build_dir = "test_%s_%s" % (self.device_name, self.version)
        flags = "GARGS=\'\' BUILD_DIR_EXT=%s" % (build_dir)
        # set the platform for compatibility with various different Pulp-SDK versions
        platform_str = "platform=gvsoc" # default platform
        if "TEST_PLATFORM" in os.environ:
            platform_str = "platform=%s" % (os.environ["TEST_PLATFORM"])
        elif "PULP_CURRENT_CONFIG_ARGS" in os.environ:
            platform_str = os.environ["PULP_CURRENT_CONFIG_ARGS"]
        return PulpTest(name=test_name,
                        commands=[
                            Check('gen', generate_test_program, test_obj=self),
                            Shell('clean', 'make clean %s' % (flags)),
                            Shell('build', 'make all %s' % (flags)),
                            Shell('run', 'make run %s %s' % (platform_str, flags)),
                            Check('check', check_output, test_obj=self)
                        ],
                        timeout=10)

    def get_common_header_str(self):
        return dedent(
            """\
            #ifndef __PULP_DSP_TEST__COMMON_H__
            #define __PULP_DSP_TEST__COMMON_H__

            typedef union {
                uint32_t u;
                float f;
            } __u2f;

            #define ABS(x) (x > 0 ? x : -x)

            #endif//__PULP_DSP_TEST__COMMON_H__
            """
        )

    def get_main_imports(self):
        """ returns a string containing all imports of the test case headers """
        return "\n".join(["#include \"{}\"".format(case.get_header_filename())
                          for case in self.cases])

    def get_test_entry_function(self):
        """ write the test_entry function. """
        return dedent(
            """\
            void test_entry(void) {{
            {}
            }}
            """
        ).format(indent("\n".join([case.get_run_test_function_call()
                                   for case in self.cases]),
                        "    "))

    def generate_test_program(self, gen_stimuli, gen_result):
        """ generate all files needed for the test """
        # first, we generate all necessary header files (independent of device name)
        # common header
        with open("common.h", "w") as fp:
            fp.write(self.get_common_header_str())

        # header of all tests
        for case in self.cases:
            with open(case.get_header_filename(), "w") as fp:
                fp.write(case.get_header_file_str(gen_stimuli, gen_result))

        # next, generate the remaining test structure
        if self.device_name == "ibex":
            self.generate_ibex_test_program()
        elif self.device_name == "riscy":
            self.generate_riscy_test_program()
        else:
            raise RuntimeError("Unknown device name: {}".format(self.device_name))

    def generate_ibex_test_program(self):
        """ generate all files needed for the ibex test """
        with open("test.c", "w") as fp:
            fp.write(
                dedent(
                    """\
                    #include "rt/rt_api.h"
                    #include "stdio.h"
                    #include "plp_math.h"

                    #include "common.h"
                    {includes}

                    {do_benchs}

                    {run_tests}

                    {test_entry}

                    int main(void) {{
                    test_entry();
                    return 0;
                    }}
                    """
                ).format(includes=self.get_main_imports(),
                         test_entry=self.get_test_entry_function(),
                         run_tests="\n".join([case.get_run_test_function() for case in self.cases]),
                         do_benchs="\n".join([case.get_do_bench_function(self.function_name,
                                                                         self.device_name)
                                              for case in self.cases]))
            )

        with open("Makefile", "w") as fp:
            fp.write(dedent(
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

    def generate_riscy_test_program(self):
        """ generate all files needed for the riscy test """
        with open("test.c", "w") as fp:
            fp.write(dedent(
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

        with open("cluster.h", "w") as fp:
            fp.write(dedent(
                """\
                #ifndef __PULP_DSP_TEST__CLUSTER_H__
                #define __PULP_DSP_TEST__CLUSTER_H__
                void cluster_entry(void *arg);
                #endif//__PULP_DSP_TEST__CLUSTER_H__
                """
            ))

        with open("cluster.c", "w") as fp:
            fp.write(
                dedent(
                    """\
                    #include "rt/rt_api.h"
                    #include "stdio.h"
                    #include "plp_math.h"

                    #include "common.h"
                    {includes}

                    {do_benchs}

                    {run_tests}

                    {test_entry}

                    void cluster_entry(void* args) {{
                        test_entry();
                    }}
                    """
                ).format(includes=self.get_main_imports(),
                         test_entry=self.get_test_entry_function(),
                         run_tests="\n".join([case.get_run_test_function() for case in self.cases]),
                         do_benchs="\n".join([case.get_do_bench_function(self.function_name,
                                                                         self.device_name)
                                              for case in self.cases]))
            )

        with open("Makefile", "w") as fp:
            fp.write(dedent(
                """\
                PULP_APP = test
                PULP_APP_FC_SRCS = test.c
                PULP_APP_CL_SRCS = cluster.c
                PULP_LDFLAGS += -lplpdsp
                PULP_CFLAGS += -I$(CONFIG_BUILD_DIR) -O3 -g
                ifdef TFLAGS
                    PULP_CFLAGS += $(TFLAGS)
                endif
                include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
                PULP_CFLAGS += -D DATA=$(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)
                """
            ))


def generate_test_program(_config, _output, test_obj):
    """ generate the test program without serialization and deserialization """
    # wrap everything in a try block in order to see the error message
    try:
        gen_stimuli_file = os.path.join(os.getcwd(), "gen_stimuli.py")
        # import gen_stimuli
        import runpy
        gen_stimuli = runpy.run_path(gen_stimuli_file)
        compute_result = gen_stimuli['compute_result']
        try:
            generate_stimuli = gen_stimuli['generate_stimuli']
        except KeyError:
            generate_stimuli = None

        test_obj.generate_test_program(generate_stimuli, compute_result)
        return (True, None)

    except Exception:
        print("generate_test_program failed")
        print(traceback.format_exc())
        return (False, None)


def check_output(config, output, test_obj):
    """ parses the output and prints the results """
    # parse the output and get all cases
    cases_result = parse_output(output)
    passed = all([c['passed'] for c in cases_result] or [False])

    for case, result in zip(test_obj.cases, cases_result):
        # print the result
        if result['passed']:
            status = '\033[92mOK:\033[0m  '
        else:
            status = '\033[91mKO:\033[0m  '
        print("{} {}".format(status, ", ".join(["{}={}".format(k, case.env[k])
                                                for k in test_obj.visible_env])))
        # print mismatches
        if result['mismatches']:
            print(indent("\n".join(result['mismatches']), "      "))

        bench_output(result, test_obj, case)

    # clean the directory
    clean()

    return (passed, None)


def parse_output(output):
    cases = []
    current_case = -1
    for line in output.split('\n'):
        line = line.strip()
        if line == "}":
            current_case = -1
        elif line.startswith("testcase") and line.endswith("{"):
            current_case = int(line[len("testcase "):-len(" {")])
            assert len(cases) == current_case
            cases.append({'passed': False,
                          'cycles': 0,
                          'instructions': 0,
                          'load_stalls': 0,
                          'icache_miss': 0,
                          'tcdm_cont': 0,
                          'mismatches': []})
        elif line.startswith('passed:'):
            cases[current_case]['passed'] = line.find('1') != -1
        elif line.startswith('cycles'):
            cases[current_case]['cycles'] = int(line.split(": ")[1])
        elif line.startswith('instructions'):
            cases[current_case]['instructions'] = int(line.split(": ")[1])
        elif line.startswith('load_stalls'):
            cases[current_case]['load_stalls'] = int(line.split(": ")[1])
        elif line.startswith('icache_miss'):
            cases[current_case]['icache_miss'] = int(line.split(": ")[1])
        elif line.startswith('tcdm_cont'):
            cases[current_case]['tcdm_cont'] = int(line.split(": ")[1])
        elif line.startswith('<Mismatch>'):
            cases[current_case]['mismatches'].append("Mismatch: %s" % line[11:])
    return cases


BENCHMARK_FILE = os.path.join(os.path.dirname(os.path.realpath(__file__)),
                              "bench_{}.csv".format(time.strftime("%Y-%m-%d_%H:%M:%S")))


def bench_output(performance, test_obj, test_case):
    # generate file and first header line if it does not yet exist
    if not os.path.isfile(BENCHMARK_FILE):
        # create file and write header
        with open(BENCHMARK_FILE, "w") as f:
            f.write(
                "name,device,dimension,cycles,instructions,ipc,imiss,ld_stall,tcdm_cont,ops,mpc\n"
            )

    # extract relevant fields
    dimension = "; ".join(["%s=%s" % (k, str(test_case.env[k])) for k in test_obj.visible_env])
    insn_per_cycles = performance['instructions'] / performance['cycles']
    ops_per_cycle = test_case.n_ops / performance['cycles']
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
                          str(test_case.n_ops),
                          str(ops_per_cycle)]))
        f.write("\n")


class Sweep:
    """ Iterator over all variables and returns the environment"""
    def __init__(self, variables):
        self.variables = variables
        self.prod_iter = product(*[v.values
                                   for v in self.variables
                                   if isinstance(v, SweepVariable)])

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


def fmt_float(val):
    """ This function returns the hex representation of a float """
    if isinstance(val, float):
        val = np.float32(val)
    assert isinstance(val, np.float32)
    packed = struct.pack('!f', val)
    int_val = sum([b << ((3 - i) * 8) for i, b in enumerate(packed)])
    return hex(int_val)


def declare_scalar(name, ctype, value):
    """ returns a string to declare and initialize a scalar value """
    assert isinstance(value, (int, float, np.int8, np.int16, np.int32, np.float32))
    if ctype == "float":
        # We want to write the floating point as hex representation to the header file (and not
        # as a decimal "string"). Then, we want to typecast it to a float. One way is to get the
        # address of the variable, and then cast it to a float pointer. However, it is not
        # possible to dereference a pointer in a .h file. Therefore, we use the second method;
        # generating a union with a float (.f) and a unsigned int (.u).
        return "__u2f %s = {.u = %sU}\n" % (name, fmt_float(value))
    else:
        return('%s %s = %s;\n' % (ctype, name, value))


def declare_array(name, ctype, length, arr):
    assert isinstance(arr, (np.ndarray, list))
    assert length == len(arr)

    if ctype == "float":
        values_str = ", ".join([fmt_float(x) for x in arr])
        # We store float values in their hex representation. This way, we do not use the
        # inaccurate decimal "string" representation, and we guarantee that the data is the
        # exact same as when computeing the expected result.
        return dedent(
            """\
            RT_L2_DATA uint32_t {name}__int[{len}] = {{
            {content}
            }};

            float* {name} = (float*)((void*){name}__int);
            """
        ).format(name=name, len=length, content=indent("\n".join(wrap(values_str, 96)), "    "))
    else:
        values_str = ", ".join([str(x) for x in arr])
        return dedent(
            """\
            RT_L2_DATA {ctype} {name}[{len}] = {{
            {content}
            }};
            """
        ).format(ctype=ctype, name=name, len=length,
                 content=indent("\n".join(wrap(values_str, 96)), "    "))


def tolerance_check_str(acq, exp, tolerance, ctype, indent, target):
    """ returns a string which performs the check of acq and exp.
    The check will properly add the tolerance, including all possible overflow cases."""
    if tolerance == 0:
        return "%sif (%s != %s) {" % (indent, exp, acq)
    elif ctype == "float":
        # only relative tolerance is allowed
        assert tolerance < 1
        # In case of float: add a tiny absolute offset of 0.0001
        return dedent(
            """\
            {indent}float __tol = ABS({tol:E} * (float){exp} + 0.0001);
            {indent}if (!({acq} >= ({ty})({exp} - __tol) &&
            {indent}      {acq} <= ({ty})({exp} + __tol))) {{\
            """
        ).format(indent=indent, acq=acq, exp=exp, tol=tolerance, ty=ctype)
    unsigned_bits = 7 if ctype == "int8_t" else 15 if ctype == "int16_t" else 31
    type_min = -(1 << unsigned_bits)
    type_max = (1 << unsigned_bits) - 1
    if tolerance < 1:
        # interpret tolerance as relative tolerance
        if target == "ibex":
            # in this case, we cannot use floating point! But make sure that the fraction is at
            # least 1.
            return dedent(
                """\
                {indent}{ty} __tol_t = ABS({exp} / {tol_fraction}) + 1;
                {indent}if (!(({exp} < {type_min} + __tol_t &&
                {indent}       ({acq} <= {exp} + __tol_t ||
                {indent}        {acq} >= {exp} - __tol_t)) ||
                {indent}      ({exp} > {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t ||
                {indent}        {acq} <= {exp} + __tol_t)) ||
                {indent}      ({exp} >= {type_min} + __tol_t &&
                {indent}       {exp} <= {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t &&
                {indent}        {acq} <= {exp} + __tol_t)))) {{\
                """
            ).format(indent=indent, acq=acq, exp=exp, ty=ctype, tol_fraction=int(1 / tolerance),
                     type_min=type_min, type_max=type_max)
        else:
            # Here, we can use float. But for the int-version, we want to round up.
            return dedent(
                """\
                {indent}float __tol = ABS({tol:E} * (float){exp});
                {indent}{ty} __tol_t = ({ty})(__tol + 0.999);
                {indent}if (!(({exp} < {type_min} + __tol_t &&
                {indent}       ({acq} <= {exp} + __tol_t ||
                {indent}        {acq} >= {exp} - __tol_t)) ||
                {indent}      ({exp} > {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t ||
                {indent}        {acq} <= {exp} + __tol_t)) ||
                {indent}      ({exp} >= {type_min} + __tol_t &&
                {indent}       {exp} <= {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t &&
                {indent}        {acq} <= {exp} + __tol_t)))) {{\
                """
            ).format(indent=indent, acq=acq, exp=exp, tol=tolerance, ty=ctype,
                     type_min=type_min, type_max=type_max)
    else:
        # interpret tolerance as absolute tolerance
        if target == "ibex":
            return dedent(
                """\
                {indent}{ty} __tol_t = {tol};
                {indent}if (!(({exp} < {type_min} + __tol_t &&
                {indent}       ({acq} <= {exp} + __tol_t ||
                {indent}        {acq} >= {exp} - __tol_t)) ||
                {indent}      ({exp} > {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t ||
                {indent}        {acq} <= {exp} + __tol_t)) ||
                {indent}      ({exp} >= {type_min} + __tol_t &&
                {indent}       {exp} <= {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t &&
                {indent}        {acq} <= {exp} + __tol_t)))) {{\
                """
            ).format(indent=indent, acq=acq, exp=exp, ty=ctype, tol=int(tolerance),
                     type_min=type_min, type_max=type_max)
        else:
            return dedent(
                """\
                {indent}{ty} __tol_t = {tol};
                {indent}if (!(({exp} < {type_min} + __tol_t &&
                {indent}       ({acq} <= {exp} + __tol_t ||
                {indent}        {acq} >= {exp} - __tol_t)) ||
                {indent}      ({exp} > {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t ||
                {indent}        {acq} <= {exp} + __tol_t)) ||
                {indent}      ({exp} >= {type_min} + __tol_t &&
                {indent}       {exp} <= {type_max} - __tol_t &&
                {indent}       ({acq} >= {exp} - __tol_t &&
                {indent}        {acq} <= {exp} + __tol_t)))) {{\
                """
            ).format(indent=indent, acq=acq, exp=exp, tol=int(tolerance), ty=ctype,
                     type_min=type_min, type_max=type_max)


def generate_test(function_name, arguments, variables, implemented, use_l1=False,
                  extended_output=True, n_ops=None, arg_ret_type=None):
    """ Entry-Point of the phase 1 """
    visible_env = [v.name for v in variables if v.visible]
    testsets = [
        Testset(
            name=device_name,
            tests=[
                AggregatedTest(function_name=function_name,
                               version=v,
                               arg_ret_type=arg_ret_type,
                               arguments=arguments,
                               variables=variables,
                               visible_env=visible_env,
                               device_name=device_name,
                               use_l1=use_l1,
                               extended_output=extended_output,
                               n_ops=n_ops).to_plptest()
                for v in impl if impl[v]
            ]
        )
        for device_name, impl in implemented.items()
    ]

    return {'testsets': testsets}


def clean():
    """
    Clean the test environment
    """
    for fname in os.listdir("."):
        if fname in ["Makefile", "cluster.c", "cluster.h", "test.c", "common.h"]:
            os.remove(fname)
        if fname.startswith("data_t") and fname.endswith(".h"):
            os.remove(fname)
