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
    ctype = inputs['pSource'].ctype;
    if ctype == 'float':
        my_type = np.float32
        a = inputs['pSource'].value.astype(my_type)
        result = np.zeros(len(a), dtype=my_type)
        complex_a = np.zeros(int(len(a)/2), dtype=np.csingle)
        complex_result = np.zeros(len(a)>>1, dtype=np.csingle)
        for i in range(len(a)>>1):
            complex_a[i] = a[2*i].astype(np.csingle) + (a[2*i + 1].astype(np.csingle))*1j
        complex_result = np.fft.fft(complex_a)
        for i in range(int(len(a)/2)):
            result[2*i] = (np.real(complex_result[i]))
            result[2*i+1] = (np.imag(complex_result[i]))
    else:
        raise RuntimeError("Unrecognized result type: %s" % ctype)
        
    return result


######################
# Fixpoint Functions #
######################


def q_sat(x):
    if x > 2**31 - 1:
        return x - 2**32
    elif x < -2**31:
        return x + 2**32
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
