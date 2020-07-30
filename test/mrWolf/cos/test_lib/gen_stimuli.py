#!/usr/bin/env python3

import numpy as np


####################
# generate_stimuli #
####################


def generate_stimuli(arg, env):
    """
    Function to generate the stimuli

    Arguments
    ---------
    arg: Argument for which to generate stimuli (either Argument or ArrayArgument)
    env: Dict mapping the variable (SweepVariable or DynamicVariable) names to their value.
    """
    # name = arg.name
    # if name == "srcA":
    #     # generate and return stimuli for srcA
    # if name == "srcB":
    #     # generate and return stimuli for srcB
    # ...


##################
# compute_result #
##################


def compute_result(result_parameter, inputs, env, fix_point):
    """
    Funciton to generate the expected result of the testcase.

    Arguments
    ---------
    result_parameter: Either OutputArgument or ReturnValue (see pulp_dsp_test.py)
    inputs: Dict mapping name to the Argument, with arg.value, arg.ctype (and arg.length)
    env: Dict mapping the variable (SweepVariable or DynamicVariable) names to their value.
    fix_point: None (if no fixpoint is used) or decimal point
    """
    ctype = inputs['value'].ctype;
    if ctype == 'int32_t':
        my_type = np.int32
        my_bits=32
        fracBits=31
    elif ctype == 'int16_t':
        my_type = np.int16
        my_bits=16
        fracBits=15
    elif ctype == 'int8_t':
        my_type = np.int8
    elif ctype == 'float' or ctype == 'float32_t':
        my_type = np.float32
        my_bits = 0
    else:
        raise RuntimeError("Unrecognized result type: %s" % ctype)

    if my_bits != 0:
        input_number = inputs['value'].value

        in_rad = 2*np.pi*float(input_number)/2**(my_bits-1)

        return q_sat(int(2**(my_bits-1)*np.cos(in_rad)), my_bits)
    elif ctype == 'float':
        return np.cos(inputs['value'].value).astype(my_type)


######################
# Fixpoint Functions #
######################


def q_sat(x, bits=32):
    if x > 2**(bits-1) - 1:
        return x - 2**bits
    elif x < -2**(bits-1):
        return x + 2**bits
    else:
        return x


def q_add(a, b):
    return q_sat(a + b)


def q_sub(a, b):
    return q_sat(a - b)


def q_mul(a, b, p):
    return q_roundnorm(a * b, p)


def q_roundnorm(a, p):
    rounding = 1 << (p - 1)
    return q_sat((a + rounding) >> p)
