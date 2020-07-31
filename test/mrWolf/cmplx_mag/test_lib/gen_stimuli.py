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

    ctype = inputs['pSrc'].ctype;
    if ctype == 'int32_t':
        my_type = np.int32
    elif ctype == 'int16_t':
        my_type = np.int16
    elif ctype == 'int8_t':
        my_type = np.int8
    elif ctype == 'float':
        my_type = np.float32
    else:
        raise RuntimeError("Unrecognized result type: %s" % ctype)

    if fix_point is None or fix_point == 0:
        a = inputs['pSrc'].value.astype(my_type)
        cmplx_a = np.zeros(int(len(a)/2), dtype=np.csingle)
        for i in range(len(a)>>1):
            cmplx_a[i] = a[2*i] + a[2*i+1]*1j
        result = np.absolute(cmplx_a).astype(my_type)
        for i in range(len(a)>>1):
            if result[i] < 0.35:
                result[i] = 0
        return result

    a = inputs['pSrc'].value.astype(my_type)
    cmplx_a = np.zeros(int(len(a)/2), dtype=np.csingle)
    for i in range(len(a)>>1):
        cmplx_a[i] = a[2*i].astype(np.csingle)/(2**(fix_point)) + (a[2*i + 1].astype(np.csingle)/(2**(fix_point)))*1j
    # result = np.clip((np.absolute(cmplx_a)*(2**(fix_point))), np.iinfo(my_type).min, np.iinfo(my_type).max).astype(my_type)
    result = (np.absolute(cmplx_a)*(2**fix_point)).astype(my_type)
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
