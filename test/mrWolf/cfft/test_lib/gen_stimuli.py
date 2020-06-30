#!/usr/bin/env python3

import numpy as np


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
    ctype = inputs['p1'].ctype;
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

    a = inputs['p1'].value.astype(my_type)
    result = np.zeros(len(a), dtype=my_type)
    complex_a = np.zeros(len(a)/2)
    complex_result = np.zeros(len(a)/2)
    if fix_point is None or fix_point == 0:
        raise RuntimeError("no fixpoint not implemented")
    else:
        for i in range(len(a)/2):
            complex_a[i] = a[2*i]>>inputs['deciPoint'] + (a[2*i + 1]>>inputs['deciPoint'])*j
        complex_result = np.fft.fft(complex_a)
        for i in range(len(a)/2):
            result[2*i] = (np.real(complex_result[i])<<inputs['deciPoint']).astype(my_type)
            result[2*i+1] = (np.imag(complex_result[i])<<inputs['deciPoint']).astype(my_type)

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
