import os
import time
import random
import shutil
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
import re

GENERATE_STIMULI = "gen_stimuli"
# L2_MEM_SIZE_KB = 448
TEST_MEM_SIZE_KB = 256


class Variable(object):
    """Variable"""
    def __init__(self, name, visible=True, active=None):
        """
        name: name for the variable
        """
        super(Variable, self).__init__()
        self.name = name
        self.visible = visible
        self.active = active if callable(active) else lambda v: True


class SweepVariable(Variable):
    """sweep variable"""
    def __init__(self, name, values, visible=True, active=None):
        """
        name: name for the sweep variable
        values: iterable over all possible values for this variable
        """
        super(SweepVariable, self).__init__(name, visible, active)
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
               - Function, returning the ctype.
               - A function, returning the ctype. The function can take the arguments: env, version,
                 device, var_type.
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

    def apply(self, env, var_type, version, use_l1, idx, device):
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
        if callable(self.ctype):
            self.ctype = call_dynamic_function(self.ctype, env, version, device)
        if self.ctype == 'var_type':
            self.ctype = var_type[0]
        elif self.ctype == 'ret_type':
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

    def generate_value(self, env, version, device, gen_stimuli):
        """ Interpret the type of self.value and generate the stimuli """
        if callable(self.value):
            self.value = call_dynamic_function(self.value, env, version, device)
        if self.value == GENERATE_STIMULI:
            self.value = call_dynamic_function(gen_stimuli, env, version, device, argument=self)
        if isinstance(self.value, str):
            self.value = env[self.value]
        if self.value is None or (isinstance(self.value, (tuple, list)) and len(self.value) == 2):
            if isinstance(self.value, tuple):
                min_value, max_value = self.value
            else:
                min_value, max_value = self.get_range()
            if self.ctype == "float":
                self.value = np.random.uniform(low=min_value, high=max_value)
            else:
                self.value = np.random.randint(low=min_value, high=max_value + 1)
            self.value = self.get_dtype()(self.value).item()
        assert isinstance(self.value, (int, np.int8, np.int16, np.int32, float, np.float32))

    def header_str(self):
        """ return the string for delclaring and initializing the data """
        assert isinstance(self.value, (float, int))
        return declare_scalar(self.name, self.ctype, self.value)

    def reference_header_str(self, gen_function):
        """ return the header string for declaring and initializing the reference """
        return None

    def estimate_memory(self):
        """ returns an estimate of the number of bytes in L2 for this argument """
        # argument only requires a single scalar of ctype. However, the compiler usually aligns
        # memory. Thus, always use 4 bytes for each scalar
        return 4


class ArrayArgument(Argument):
    """Array Argument"""
    def __init__(self, name, ctype, length, value=None, use_l1=None, in_function=True):
        """
        name: name of the argument
        ctype: String, one of the following:
               - C type of the argument (like 'int32_t')
               - 'var_type' or 'ret_type', which is determined based on the current version.
               - A function, returning the type. The function can take the arguments: env, version,
                 device, var_type.
        length: One of the following:
                - Integer for a constant length
                - The name of a SweepVariable or DynamicVariable, to take their value
                - tuple(min, max) for random value in the given range
                - A function, returning the length. The function can take the arguments: env,
                  version, device, var_type.
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

    def apply(self, env, var_type, version, use_l1, idx, device):
        """
        Prepare the variable for the specific test case. The following is done:
        - Apply the environment (current iteration of the sweep variables)
        - Apply the version (var_type or ret_type)
        - Apply use_l1 flag
        - Interpret the length of the variable
        - Alter the name to contain the test id
        """
        # interpret the length
        if callable(self.length):
            self.length = call_dynamic_function(self.length, env, version, device)
        if isinstance(self.length, tuple):
            assert len(self.length) == 2
            self.length = random.randint(*self.length)
        if isinstance(self.length, str):
            self.length = env[self.length]
        if isinstance(self.length, int):
            self.length = self.length
        assert isinstance(self.length, int)
        # do the same thing as a regular Argument
        return super(ArrayArgument, self).apply(env, var_type, version, use_l1, idx, device)

    def l2_data_name(self):
        return self.name + "__l2"

    def arg_str(self):
        """ Returns the string to show for funciton argument """
        return self.name

    def run_test_setup_str(self):
        """ returns the string for setup the variable """
        if self.use_l1:
            return dedent(
                """\
                {l1_name} = hal_cl_l1_malloc(sizeof({ctype}) * {len});
                hal_cl_dma_cmd((unsigned int){l2_name},
                              (unsigned int){l1_name},
                              sizeof({ctype}) * {len},
                              HAL_CL_DMA_DIR_EXT2LOC, 0, &copy);
                hal_cl_dma_cmd_wait(&copy);
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
                hal_cl_l1_free({l1_name}, sizeof({ctype}) * {len});
                """
            ).format(l1_name=self.name, ctype=self.ctype, len=self.length)
        else:
            return None

    def generate_value(self, env, version, device, gen_stimuli):
        """ Interpret the type of self.value and generate the stimuli """
        assert isinstance(self.length, int)
        dtype = self.get_dtype()
        if callable(self.value):
            self.value = call_dynamic_function(self.value, env, version, device)
        if self.value == GENERATE_STIMULI:
            self.value = call_dynamic_function(gen_stimuli, env, version, device, variable=self)
        if isinstance(self.value, str):
            self.value = env[self.value]
        if self.value is None or (isinstance(self.value, (tuple, list)) and len(self.value) == 2):
            if isinstance(self.value, tuple):
                min_value, max_value = self.value
            else:
                min_value, max_value = self.get_range()
            if self.ctype == "float":
                self.value = np.random.uniform(low=min_value, high=max_value, size=self.length)
            else:
                self.value = np.random.randint(low=min_value, high=max_value + 1, size=self.length)
            self.value = self.value.astype(dtype)
        if isinstance(self.value, (int, float)):
            self.value = (np.ones(self.length) * self.value).astype(dtype)
        if isinstance(self.value, np.ndarray):
            pass # nothing to do
        assert isinstance(self.value, (list, np.ndarray))

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

    def estimate_memory(self):
        """ returns an estimate of the number of bytes in L2 for this argument """
        # ArrayArgument needs only 1 array of defined length, and 4 bytes for the pointer. however,
        # if the ctype is float, we need one pointer extra.
        mem = ctype_mem_size(self.ctype) * self.length
        mem += 8 if "float" in self.ctype else 4
        return mem


class OutputArgument(ArrayArgument):
    """Output Array Argument"""
    def __init__(self, name, ctype, length, use_l1=None, tolerance=0, in_function=True,
                 skip_check=False):
        """
        name: name of the argument
        ctype: String, one of the following:
               - C type of the argument (like 'int32_t')
               - 'var_type' or 'ret_type', which is determined based on the current version.
               - A function, returning the type. The function can take the arguments: env, version,
                 device, var_type.
        length: One of the following:
                - Integer for a constant length
                - The name of a SweepVariable or DynamicVariable, to take their value
                - tuple(min, max) for random value in the given range
                - A function, returning the length. The function can take the arguments: env,
                  version, device, var_type.
        use_l1: if True, use L1 memory. If None, use default value configured in generate_test
        tolerance: constant or function, which returns the tolerance. Values larger or equal to 1
                   will be interpreted as absolute tolerance. The funciton can thake the arguments:
                   env, version, device, var_type.
        in_function: Boolean, if True, add this argument to the function signature. Set this to
                     False, and use CustomArgument to create struts.
        skip_check: Boolean, if True, the output is not checked.
        """
        super(OutputArgument, self).__init__(name, ctype, length, 0, use_l1, in_function)
        self.tolerance = tolerance
        self.skip_check = skip_check

    def reference_name(self):
        return self.name + "__reference"

    def apply(self, env, var_type, version, use_l1, idx, device):
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
            self.tolerance = call_dynamic_function(self.tolerance, env, version, device)
        return super(OutputArgument, self).apply(env, var_type, version, use_l1, idx, device)

    def check_str(self, target):
        """ returns the string to check the result """
        if self.skip_check:
            return ""

        display_format = "%.10f" if self.ctype == "float" else "%d"
        check_str = tolerance_check_str("%s[i]" % self.name, "%s[i]" % self.reference_name(),
                                        self.tolerance, self.ctype, "    ", target)
        return dedent(
            """\
            for (int i = 0; i < {len}; i++) {{
            {check_str}
                    passed = 0;
                    printf("\\n#@# mismatch {name}[%d]: acq={fmt}, exp={fmt}\\n",
                           i, {acq}[i], {exp}[i]);
                }}
            }}
            """
        ).format(len=self.length,
                 check_str=check_str,
                 name=self.general_name(),
                 acq=self.name,
                 exp=self.reference_name(),
                 fmt=display_format)

    def reference_header_str(self, gen_function):
        """ Generates and writes reference value to header file """
        if self.skip_check:
            return ""

        reference = gen_function(self)
        return declare_array(self.reference_name(), self.ctype, self.length, reference)

    def estimate_memory(self):
        """ returns an estimate of the number of bytes in L2 for this argument """
        # OutputArgument needs 2 arrays of the same length, one to store the output and one for the
        # reference, and the memory for storing two pointers. In fact, it is twice as much as for
        # ArrayArgument, thus, just call estimate_memory of the super array.
        return super(OutputArgument, self).estimate_memory() * 2
        return ctype_mem_size(self.ctype) * self.length * 2


class InplaceArgument(OutputArgument):
    """ Array, that is both used as input and output
    It must be handled differently in order to make the various benchmark passes identical (in case
    the runtime of the function is data dependent).

    It will produce three arrays in total: One with the original values (which will never be
    modified), one with the expected result (which will also never be modified), and one on which
    the computation is performed. Before each new call of the function, the data from the original
    array needs to be copied to the actual computation array.
    """
    def __init__(self, name, ctype, length, value=None, use_l1=None, tolerance=0, in_function=True,
                 skip_check=False):
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
        skip_check: Boolean, if True, the output is not checked.
        """
        super(InplaceArgument, self).__init__(name, ctype, length, use_l1, tolerance, in_function,
                                              skip_check)
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

    def estimate_memory(self):
        """ returns an estimate of the number of bytes in L2 for this argument """
        # OutputArgument needs 3 arrays of the same length, one to store the output, one for the
        # original value to fall back, and one for the reference. Hence, just call estimate_memory
        # of Output Argument, divide by 2 and multiply by 3.
        return (super(InplaceArgument, self).estimate_memory() // 2) * 3


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

    def apply(self, env, var_type, version, use_l1, idx, device):
        """
        Prepare the variable for the specific test case. The following is done:
        - Apply the environment (current iteration of the sweep variables)
        - Apply the version (var_type or ret_type)
        - Apply use_l1 flag
        - Apply the tolerance
        - Alter the name to contain the test id
        """
        if callable(self.tolerance):
            self.tolerance = call_dynamic_function(self.tolerance, env, version, device)
        return super(ReturnValue, self).apply(env, var_type, version, use_l1, idx, device)

    def check_str(self, target):
        """ returns the string to check the result """
        display_format = "%.10f" if self.ctype == "float" else "%d"
        val_name = self.name + ".f" if self.ctype == "float" else self.name
        ref_name = self.reference_name() + ".f" if self.ctype == "float" else self.reference_name()
        check_str = tolerance_check_str(val_name, ref_name, self.tolerance, self.ctype, "", target)
        return dedent(
            """\
            {check_str}
                passed = 0;
                printf("\\n#@# mismatch {name}: acq={fmt}, exp={fmt}\\n", {acq}, {exp});
            }}
            """
        ).format(check_str=check_str,
                 name=self.general_name(),
                 acq=self.name,
                 exp=self.reference_name(),
                 fmt=display_format)

    def reference_header_str(self, gen_function):
        """ Generates and writes reference value to header file """
        reference = gen_function(self)
        return declare_scalar(self.reference_name(), self.ctype, reference)

    def estimate_memory(self):
        """ returns an estimate of the number of bytes in L2 for this argument """
        # OutputArgument needs 2 scalars of ctype. In fact, just call estimate_memory on Argument
        # and multiply the result by 2
        return super(ReturnValue, self).estimate_memory() * 2


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
               has the following arguments (can use only a subset of those):
               - env: dict(name: str, value: number): Dictionary with the environment
               - version: str: Version string
               - var_type: tuple(str, str), which contains (var_type, ret_type)
               - use_l1: Bool, wether to use L1 memory.
               - target: name of the target device (ibex or riscy)
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

    def apply(self, env, var_type, version, use_l1, idx, device):
        """
        Prepares the value (initialization string) of the custom argument, and the name to include
        the test id
        """
        def arg_name(name):
            return "t{}__{}".format(idx, name)
        self.name = arg_name(self.name)
        self.value = call_dynamic_function(self.value, env, version, device, use_l1=use_l1,
                                           arg_name=arg_name)
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

    def generate_value(self, env, version, device, gen_stimuli):
        """ Interpret the type of self.value and generate the stimuli """
        # Nothing to do here! the init string was already created
        pass

    def header_str(self):
        """ return the string for delclaring and initializing the data """
        # here, we just need to return self.value, since this is the initialization string.
        return self.value

    def estimate_memory(self):
        """ returns an estimate of the number of bytes in L2 for this argument """
        # for Custom Argument, we just add a constant value of 16 bytes.
        # TODO add a function which the user can define!
        return 16


class AggregatedTestCase(object):
    """ Structure for one testcase in the aggregated tests """
    def __init__(self, idx, arguments, env, n_ops, version, device_name):
        """ constructor. Arguments must already be applied! """
        self.idx = idx
        self.arguments = arguments
        self.env = env
        self.n_ops = n_ops
        self.version = version
        self.device_name = device_name

    def generate_header_content(self, gen_stimuli, gen_result):
        """ generate all stimuli values and compute the expected result """
        # generate value of all arguments
        [arg.generate_value(self.env, self.version, self.device_name, gen_stimuli)
         for arg in self.arguments]
        content = "\n".join([arg.header_str() for arg in self.arguments])
        content += "\n"

        # prepare inputs dictionary
        inputs = {arg.general_name(): arg
                  for arg in self.arguments
                  if isinstance(arg, InplaceArgument) or not isinstance(arg, (ReturnValue,
                                                                              OutputArgument))}

        # get the fix point
        fix_point = ([arg.value for arg
                      in self.arguments
                      if isinstance(arg, FixPointArgument)] or [None])[0]
        assert fix_point is None or isinstance(fix_point, int)

        # prepare the gen_result function
        gen_result_prep = partial(gen_result, inputs=inputs, env=self.env, fix_point=fix_point)

        content += "\n".join([x for x in [arg.reference_header_str(gen_result_prep)
                                          for arg in self.arguments]
                              if x is not None])

        return content

    def get_do_bench_function(self, function_name):
        """ returns the do_bench function for the current test """
        ret_str = ([a.arg_str() + " = " for a in self.arguments if isinstance(a, ReturnValue)] or [""])[0]
        return dedent(
            """\
            static int t{idx}__do_bench(hal_perf_t *perf, int events, int do_check) {{
                // setup variables (like resetting InplaceArguments)
            {setup}

                // start the performance counters
                hal_perf_conf(perf, events);
                hal_perf_reset(perf);
                hal_perf_start(perf);

                // call the function-under-test
                {ret_str}{fname}({args});

                hal_perf_stop(perf);

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
                 check=indent("\n".join([arg.check_str(self.device_name)
                                         for arg in self.arguments
                                         if arg.check_str(self.device_name) is not None]),
                              "        "))

    def get_run_test_function_call(self):
        return "t{}__run_test();".format(self.idx)

    def get_run_test_function(self):
        """ returns the run_test function for the current test """
        return dedent(
            """\
            static void t{idx}__run_test(void) {{
                printf("\\n#@# testcase {idx} {{\\n");

                // setup the test
                hal_cl_dma_cmd_t copy;

            {setup}

                // setup performance counter
                hal_perf_t perf;
                hal_perf_init(&perf);

                // run 1: check result and get numebr of cycles / instructions
                int passed = t{idx}__do_bench(&perf, (1<<HAL_PERF_CYCLES) | (1<<HAL_PERF_INSTR), 1);
                printf("\\n#@# passed: %d\\n", passed);
                printf("#@# cycles: %d\\n", hal_perf_read(HAL_PERF_CYCLES));
                printf("#@# instructions: %d\\n", hal_perf_read(HAL_PERF_INSTR));

                // run 2: count load stalls
                t{idx}__do_bench(&perf, 1<<HAL_PERF_LD_STALL, 0);
                printf("\\n#@# load_stalls: %d\\n", hal_perf_read(HAL_PERF_LD_STALL));

                // run 3: count instruction cache misses
                t{idx}__do_bench(&perf, 1<<HAL_PERF_IMISS, 0);
                printf("\\n#@# icache_miss: %d\\n", hal_perf_read(HAL_PERF_IMISS));

                // run 4: count TCDM contentions
                printf("\\n#@# output start\\n");
                t{idx}__do_bench(&perf, 1<<HAL_PERF_TCDM_CONT, 0);
                printf("\\n#@# output end\\n");
                printf("#@# tcdm_cont: %d\\n", hal_perf_read(HAL_PERF_TCDM_CONT));

                // free up all memory
            {free}

                printf("\\n#@# }}\\n");
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

    def estimate_memory(self):
        """ returns an estimate of the number of bytes needed on L2 """
        return sum([arg.estimate_memory() for arg in self.arguments])


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
        self.sub_folder = "%s_%s_%s" % (self.function_name, self.version, self.device_name)

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
                    deepcopy(arg).apply(env, var_type, self.version, use_l1, i, self.device_name)
                    for arg in arguments
                ],
                env=env,
                n_ops=self.n_ops(env),
                version=self.version,
                device_name=self.device_name
            )
            for (i, env) in enumerate(Sweep(variables, version))
        ]

    def to_plptest(self):
        """ Returns the PulpTest structure """
        test_name = self.function_name
        # set the platform for compatibility with various different Pulp-SDK versions
        platform_str = "platform=gvsoc" # default platform
        if "TEST_PLATFORM" in os.environ:
            platform_str = "platform=%s" % (os.environ["TEST_PLATFORM"])
        elif "PULP_CURRENT_CONFIG_ARGS" in os.environ:
            platform_str = os.environ["PULP_CURRENT_CONFIG_ARGS"]
        return PulpTest(
            name=test_name,
            commands=self.generate_test_commands(platform_str),
            # timeout=40 # Timeout is now handled with shell script in run.sh
        )

    def generate_test_commands(self, platform_str):
        """
        Generates the commands array for PulpTest. It will generate as many tests as necessary to
        fit everything into L2 memory.
        """
        c = []
        start_case_id = 0
        used_mem = 0
        allowed_mem = TEST_MEM_SIZE_KB * 1024
        num_cases = len(self.cases)
        for i, case in enumerate(self.cases):
            case_mem = case.estimate_memory()
            assert case_mem <= allowed_mem # Memory must be large enough to fit a single testcase.
            used_mem += case_mem
            end_case_id = i + 1 if i + 1 == num_cases else i
            if used_mem > allowed_mem or end_case_id == num_cases:
                used_mem = case_mem
                gen_test_fn = partial(generate_test_program, start=start_case_id, end=end_case_id)
                c.append(Check('gen', gen_test_fn, test_obj=self))
                c.append(Shell('test', 'bash %s/run.sh %s' % (self.sub_folder, platform_str)))
                start_case_id = end_case_id
        assert start_case_id == num_cases
        c.append(Check('check', check_output, test_obj=self))
        return c

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

    def get_main_imports(self, start, end):
        """ returns a string containing all imports of the test case headers """
        return "\n".join(["#include \"{}\"".format(case.get_header_filename())
                          for case in self.cases[start:end]])

    def get_test_entry_function(self, start, end):
        """ write the test_entry function. """
        return dedent(
            """\
            void test_entry(void) {{
            {}
            }}
            """
        ).format(indent("\n".join([case.get_run_test_function_call()
                                   for case in self.cases[start:end]]),
                        "    "))

    def generate_test_program(self, gen_stimuli, gen_result, start, end):
        """ generate all files needed for the test, from start to end """
        # remove all files in the directory if it still exists
        clean(self.sub_folder)
        # create the fresh directory
        os.mkdir(self.sub_folder)

        # generate the run.sh script which will run the test but exit at timeout. The script will
        # also always return with status 0, such that we can check the output and give meaningful
        # error messages
        with open(os.path.join(self.sub_folder, "run.sh"), "w") as fp:
            fp.write(
                dedent(
                    """
                    cd $(dirname $0)
                    make clean
                    make all
                    if [ $? -eq 0 ]; then
                        timeout -k 1 5 make run $@
                        if [ $? -eq 0 ]; then
                            echo "#@# success"
                        else
                            echo "#@# error: run"
                        fi
                    else
                        echo "#@# error: build"
                    fi
                    cd ..
                    """
                )
            )

        # generate all necessary header files (independent of device name)
        # common header
        with open(os.path.join(self.sub_folder, "common.h"), "w") as fp:
            fp.write(self.get_common_header_str())

        # header of all tests
        for case in self.cases[start:end]:
            with open(os.path.join(self.sub_folder, case.get_header_filename()), "w") as fp:
                fp.write(case.get_header_file_str(gen_stimuli, gen_result))

        # next, generate the remaining test structure
        if self.device_name == "ibex":
            self.generate_ibex_test_program(start, end)
        elif self.device_name == "riscy":
            self.generate_riscy_test_program(start, end)
        else:
            raise RuntimeError("Unknown device name: {}".format(self.device_name))

    def generate_ibex_test_program(self, start, end):
        """ generate all files needed for the ibex test """
        with open(os.path.join(self.sub_folder, "test.c"), "w") as fp:
            fp.write(
                dedent(
                    """\
                    #include "rtos_hal.h"
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
                ).format(includes=self.get_main_imports(start, end),
                         test_entry=self.get_test_entry_function(start, end),
                         run_tests="\n".join([case.get_run_test_function()
                                              for case in self.cases[start:end]]),
                         do_benchs="\n".join([case.get_do_bench_function(self.function_name)
                                              for case in self.cases[start:end]]))
            )

        with open(os.path.join(self.sub_folder, "Makefile"), "w") as fp:
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

    def generate_riscy_test_program(self, start, end):
        """ generate all files needed for the riscy test """
        with open(os.path.join(self.sub_folder, "test.c"), "w") as fp:
            fp.write(dedent(
                """\
                #include "rtos_hal.h"
                #include "stdio.h"
                #include "cluster.h"
                int main(){
                #ifdef RTOS_PMSIS
                    struct pi_device cluster_dev = {0};
                    struct pi_cluster_conf conf;
                    struct pi_cluster_task cluster_task = {0};
                    pi_cluster_task(&cluster_task, cluster_entry, NULL);
                    pi_cluster_conf_init(&conf);
                    conf.id=0;
                    pi_open_from_conf(&cluster_dev, &conf);
                    pi_cluster_open(&cluster_dev);
                    pi_cluster_send_task_to_cl(&cluster_dev, &cluster_task);
                    pi_cluster_close(&cluster_dev);
                #else
                    rt_cluster_mount(1, 0, 0, NULL);
                    rt_cluster_call(NULL, 0, cluster_entry, NULL, NULL, 0, 0, 0, NULL);
                    rt_cluster_mount(0, 0, 0, NULL);
                #endif                
                    return 0;
                }
                """
            ))

        with open(os.path.join(self.sub_folder, "cluster.h"), "w") as fp:
            fp.write(dedent(
                """\
                #ifndef __PULP_DSP_TEST__CLUSTER_H__
                #define __PULP_DSP_TEST__CLUSTER_H__
                void cluster_entry(void *arg);
                #endif//__PULP_DSP_TEST__CLUSTER_H__
                """
            ))

        with open(os.path.join(self.sub_folder, "cluster.c"), "w") as fp:
            fp.write(
                dedent(
                    """\
                    #include "rtos_hal.h"
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
                ).format(includes=self.get_main_imports(start, end),
                         test_entry=self.get_test_entry_function(start, end),
                         run_tests="\n".join([case.get_run_test_function()
                                              for case in self.cases[start:end]]),
                         do_benchs="\n".join([case.get_do_bench_function(self.function_name)
                                              for case in self.cases[start:end]]))
            )

        with open(os.path.join(self.sub_folder, "Makefile"), "w") as fp:
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
                    ifeq '$(PULP_RTOS)'  'pmsis'
                    PULP_CFLAGS += -DRTOS_PMSIS
                    include $(RULES_DIR)/pmsis_rules.mk
                    else
                    include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
                    endif
                    PULP_CFLAGS += -D DATA=$(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)                        
                """
            ))


def generate_test_program(_config, _output, test_obj, start, end):
    """
    generate the test program without serialization and deserialization
    It will generate tests for cases from start up to, but not including end
    """
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

        test_obj.generate_test_program(generate_stimuli, compute_result, start, end)
        return (True, None)

    except Exception:
        print("generate_test_program failed")
        print(traceback.format_exc())
        return (False, None)


def check_output(config, output, test_obj):
    """ parses the output and prints the results """
    # parse the output and get all cases
    cases_result, err = parse_output(output)

    if err:
        status = '\033[91mKILL:\033[0m'
        print("{} {}".format(status, err))
        return (False, None)

    passed = all([c['passed'] for c in cases_result] or [False])
    passed = passed and len(cases_result) == len(test_obj.cases)

    tests_missing = {i for i, _ in enumerate(test_obj.cases)}

    for case_idx, result in enumerate(cases_result):

        case = test_obj.cases[case_idx]
        tests_missing.remove(case_idx)

        # print the user messages
        if len(result['user_msg']) >= 1:
            print("\n".join(result['user_msg']))

        # print the result
        if result['passed']:
            status = '\033[92mOK:\033[0m  '
        else:
            if result['error_msg']:
                status = '\033[91mKILL:\033[0m'
            else:
                status = '\033[91mFAIL:\033[0m'
        print("{} {}".format(status, ", ".join(["{}={}".format(k, case.env[k])
                                                for k in test_obj.visible_env])))
        # print error messages
        if result['error_msg']:
            err = "\033[1m%s\033[0m" % err
            for msg in result['error_msg']:
                print("      %s" % msg)

        # print mismatches
        if result['mismatches'] and test_obj.extended_output:
            print(indent("\n".join(result['mismatches']), "      "))

        if passed:
            bench_output(result, test_obj, case)

    for case_idx in tests_missing:
        case = test_obj.cases[case_idx]
        status = '\033[93mSKIP:\033[0m'
        print("{} {}".format(status, ", ".join(["{}={}".format(k, case.env[k])
                                                for k in test_obj.visible_env])))

    # clean the directory
    clean(test_obj.sub_folder)

    return (passed, None)


def parse_output(output):
    """ Parse the output of running all tests (all test projects together) """
    cases = []
    current_case = -1
    user_msg_mode = False
    gvsoc_error_str = []
    gvsoc_error_re = re.compile("^[0-9]*: [0-9]*: \[.*\]")
    for line in output.split('\n'):

        if user_msg_mode:
            # special mode where everything is added to user_msg
            if "#@# output end" in line:
                if len(cases[current_case]['user_msg']) > 0 and len(cases[current_case]['user_msg'][-1].strip()) == 0:
                    del cases[current_case]['user_msg'][-1]
                user_msg_mode = False
            # do not add the line if it is empty and it is the first message
            elif not (len(cases[current_case]['user_msg']) == 0 and len(line.strip()) == 0):
                cases[current_case]['user_msg'].append(line)
            continue

        # normal parsing mode
        line = line.strip()
        if line == "#@# }":
            current_case = -1
            gvsoc_error_str = []
        elif line.startswith("#@# testcase") and line.endswith("{"):
            current_case = int(line[len("#@# testcase "):-len(" {")])
            assert len(cases) == current_case
            cases.append({'passed': False,
                          'error_msg': None,
                          'user_msg': [],
                          'cycles': 0,
                          'instructions': 0,
                          'load_stalls': 0,
                          'icache_miss': 0,
                          'tcdm_cont': 0,
                          'mismatches': []})
        elif line.startswith('#@# passed:'):
            cases[current_case]['passed'] = line.find('1') != -1
        elif line.startswith('#@# cycles'):
            cases[current_case]['cycles'] = int(line.split(": ")[1])
        elif line.startswith('#@# instructions'):
            cases[current_case]['instructions'] = int(line.split(": ")[1])
        elif line.startswith('#@# load_stalls'):
            cases[current_case]['load_stalls'] = int(line.split(": ")[1])
        elif line.startswith('#@# icache_miss'):
            cases[current_case]['icache_miss'] = int(line.split(": ")[1])
        elif line.startswith('#@# tcdm_cont'):
            cases[current_case]['tcdm_cont'] = int(line.split(": ")[1])
        elif line.startswith('#@# mismatch'):
            cases[current_case]['mismatches'].append("Mismatch: %s" % line[13:])
        elif "#@# output start" in line:
            user_msg_mode = True
        elif gvsoc_error_re.match(line):
            gvsoc_error_str.append(line[line.find("["):])
        elif line.startswith('#@# error:'):
            reason = line.split(": ")[1]
            if reason == "run":
                cases[current_case]['passed'] = False
                cases[current_case]['error_msg'] = gvsoc_error_str if gvsoc_error_str else ["Timeout"]
                # clear the current case
                current_case = -1
            if reason == "clean":
                return None, "Cannot clean test"
            if reason == "build":
                return None, "Cannot build test"
    return cases, None


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
    def __init__(self, variables, version):
        self.variables = variables
        self.prod_iter = product(*[v.values if v.active(version) else [v.values[0]]
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
    if val == 0:
        val = 0.0
    if isinstance(val, float):
        val = np.float32(val)
    assert isinstance(val, np.float32)
    packed = struct.pack('!f', val)
    int_val = sum([b << ((3 - i) * 8) for i, b in enumerate(packed)])
    return hex(int_val)


def ctype_mem_size(ctype):
    """ returns the memory size for a specific ctype """
    if "int8_t" in ctype:
        return 1
    if "int16_t" in ctype:
        return 2
    if "int32_t" in ctype:
        return 4
    if "float" in ctype:
        return 4
    raise RuntimeError("Memory size of ctype %s is unknown!", ctype)


def declare_scalar(name, ctype, value):
    """ returns a string to declare and initialize a scalar value """
    assert isinstance(value, (int, float, np.int8, np.int16, np.int32, np.float32))
    if ctype == "float":
        # We want to write the floating point as hex representation to the header file (and not
        # as a decimal "string"). Then, we want to typecast it to a float. One way is to get the
        # address of the variable, and then cast it to a float pointer. However, it is not
        # possible to dereference a pointer in a .h file. Therefore, we use the second method;
        # generating a union with a float (.f) and a unsigned int (.u).
        return "__u2f %s = {.u = %sU};\n" % (name, fmt_float(value))
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
            HAL_L2 uint32_t {name}__int[{len}] = {{
            {content}
            }};

            float* {name} = (float*)((void*){name}__int);
            """
        ).format(name=name, len=length, content=indent("\n".join(wrap(values_str, 96)), "    "))
    else:
        values_str = ", ".join([str(x) for x in arr])
        return dedent(
            """\
            HAL_L2 {ctype} {name}[{len}] = {{
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
    testsets = [
        Testset(
            name=device_name,
            tests=[
                AggregatedTest(function_name=function_name,
                               version=v,
                               arg_ret_type=arg_ret_type,
                               arguments=arguments,
                               variables=variables,
                               visible_env=[var.name for var in variables if var.visible and var.active(v)],
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


def call_dynamic_function(f, env, version, device, arg_name=None, argument=None, use_l1=None):
    """ Calls the funciton f and passes env, version, device or var_types, based on the arguments of
    the function """
    possible_args = {
        'e': (env, "environment: dict(str -> value)"),
        'env': (env, "environment: dict(str -> value)"),
        'environ': (env, "environment: dict(str -> value)"),
        'environment': (env, "environment: dict(str -> value)"),
        'v': (version, "version: str"),
        'ver': (version, "version: str"),
        'version': (version, "version: str"),
        'd': (device, "device: str"),
        'dev': (device, "device: str"),
        'device': (device, "device: str"),
        't': (device, "device: str"),
        'tar': (device, "device: str"),
        'target': (device, "device: str")
    }

    assert not (arg_name is not None and argument is not None)

    if arg_name is not None:
        possible_args.update({
            'a': (arg_name, "arg_name: F: str -> str"),
            'arg': (arg_name, "arg_name: F: str -> str"),
            'name': (arg_name, "arg_name: F: str -> str"),
            'arg_name': (arg_name, "arg_name: F: str -> str"),
        })

    if argument is not None:
        possible_args.update({
            'a': (argument, "arg_name: F: str -> str"),
            'arg': (argument, "arg_name: F: str -> str"),
            'argument': (argument, "arg_name: F: str -> str"),
        })

    if use_l1 is not None:
        possible_args.update({
            'l1': (argument, "use_l1: bool"),
            'use_l1': (argument, "use_l1: bool"),
        })

    # __code__.co_varnames returns the list of argument names of the function
    arg_list = f.__code__.co_varnames

    if not set(arg_list).issubset(possible_args.keys()):
        valid_options = "\n".join(["{:11} -> {}".format(k, v[1]) for k, v in sorted(
            possible_args.items(), key=lambda t: "{}:{}".format(t[1][1], t[0])
        )])
        raise RuntimeError(
            "Function '{}' can use only the following argument names: \n\n{}\n\n{}" .format(
                f.__name__,
                indent(valid_options, "    "),
                "InvalidArgument: '%s'" % [a for a in arg_list if a not in possible_args][0]
            )
        )

    args = (possible_args[arg_name][0] for arg_name in arg_list)

    return f(*args)


def clean(sub_folder):
    """
    Clean the test environment
    """
    if os.path.exists(sub_folder):
        shutil.rmtree(sub_folder)
