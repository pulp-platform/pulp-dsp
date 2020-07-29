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
    if fix_point is not None:
        raise RuntimeError("Fixpoint not supported" % result_parameter.ctype)
    elif result_parameter.ctype == 'int8_t':
        dtype = np.int8
    elif result_parameter.ctype == 'int16_t':
        dtype = np.int16
    elif result_parameter.ctype == 'int32_t':
        dtype = np.int32
    elif result_parameter.ctype == 'float':
        dtype = np.float32
    else:
        raise RuntimeError("Unrecognized result type: %s" % result_parameter.ctype)

    stride_a = env['strideA']
    stride_b = env['strideB']
    stride_c = env['strideC']
    M = env['len_m']
    N = env['len_n']

    a = inputs['srcA'].value.reshape((M, stride_a)).astype(dtype)
    b = inputs['srcB'].value.reshape((M, stride_b)).astype(dtype)

    result = np.zeros((M, stride_c), dtype=dtype)
    result[:M, :N] = (a[:M, :N] - b[:M, :N]).astype(dtype)

    return result.reshape((env['len_res'], ))


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
