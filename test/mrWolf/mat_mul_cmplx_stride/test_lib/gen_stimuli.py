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
    rtype = result_parameter.get_dtype()
    ctype = rtype if rtype == np.float32 else np.int64
    M = env['len_m']
    N = env['len_n']
    O = env['len_o']
    strideA = env['strideA']
    strideB = env['strideB']
    strideC = env['strideC']

    # generate result
    A = inputs['srcA'].value.reshape((M, strideA, 2))
    B = inputs['srcB'].value.reshape((N, strideB, 2))
    C = np.zeros((M, strideC, 2)).astype(rtype)
    for m in range(M):
        for o in range(O):
            sum_re = ctype(0)
            sum_im = ctype(0)
            for n in range(N):
                a_re = ctype(A[m, n, 0])
                a_im = ctype(A[m, n, 1])
                b_re = ctype(B[n, o, 0])
                b_im = ctype(B[n, o, 1])
                res_re = ctype(a_re * b_re - a_im * b_im)
                res_im = ctype(a_re * b_im + a_im * b_re)
                if fix_point is not None:
                    res_re = q_roundnorm(res_re, fix_point)
                    res_im = q_roundnorm(res_im, fix_point)
                sum_re += res_re
                sum_im += res_im
            C[m, o, 0] = rtype(sum_re)
            C[m, o, 1] = rtype(sum_im)
    return C.astype(rtype).reshape((M * strideC * 2, ))


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
