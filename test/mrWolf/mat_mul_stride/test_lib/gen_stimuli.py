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
    stride_a = env['strideA']
    stride_b = env['strideB']
    stride_c = env['strideC']
    M = env['len_m']
    N = env['len_n']
    O = env['len_o']

    a = inputs['srcA'].value.reshape((M, stride_a))
    b = inputs['srcB'].value.reshape((N, stride_b))
    if fix_point is not None:
        # fix-point computation
        a = a.astype(np.int32)
        b = b.astype(np.int32)
        ctype = result_parameter.ctype
        dtype = np.int8 if ctype == "int8_t" else np.int16 if ctype == "int16_t" else np.int32
        result = np.zeros((M, stride_c), dtype=dtype)
        for m in range(M):
            for o in range(O):
                s = np.int32(0)
                for n in range(N):
                    s += q_roundnorm(a[m, n] * b[n, o], fix_point)
                result[m, o] = dtype(s)
        result = result.reshape((env['len_res'], ))
    elif result_parameter.ctype == 'int32_t':
        # integer computation
        a = a.astype(np.int32)
        b = b.astype(np.int32)
        result = np.zeros((M, stride_c), dtype=np.int32)
        result[:M, :O] = np.matmul(a[:M, :N], b[:N, :O]).astype(np.int32)
        result = result.reshape((env['len_res'], ))
    elif result_parameter.ctype == 'float':
        a = a.astype(np.float32)
        b = b.astype(np.float32)
        result = np.zeros((M, stride_c), dtype=np.float32)
        for m in range(M):
            for o in range(O):
                for n in range(N):
                    result[m, o] = np.float32(result[m, o] + np.float32(a[m, n] * b[n, o]))
        result = result.reshape((env['len_res'], ))
    else:
        raise RuntimeError("Unrecognized result type: %s" % result_parameter.ctype)

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
