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
        # fix-point computation
        a = inputs['srcA'].value.astype(np.int32).reshape((env['len_m'], env['len_n']))
        b = inputs['srcB'].value.astype(np.int32).reshape((env['len_o'], env['len_n']))
        ctype = result_parameter.ctype
        dtype = np.int8 if ctype == "int8_t" else np.int16 if ctype == "int16_t" else np.int32
        result = np.zeros((env['len_m'], env['len_o']), dtype=dtype)
        for m in range(env['len_m']):
            for o in range(env['len_o']):
                s = np.int32(0)
                for n in range(env['len_n']):
                    s += q_roundnorm(a[m, n] * b[o, n], fix_point)
                result[m, o] = dtype(s)
        result = result.reshape((env['len_res'], ))
    elif result_parameter.ctype == 'int32_t':
        a = inputs['srcA'].value.astype(np.int32).reshape((env['len_m'], env['len_n']))
        b = inputs['srcB'].value.astype(np.int32).reshape((env['len_o'], env['len_n']))
        result = np.matmul(a, b.T).astype(np.int32).reshape((env['len_res'], ))
    elif result_parameter.ctype == 'float':
        a = inputs['srcA'].value.astype(np.float32).reshape((env['len_m'], env['len_n']))
        b = inputs['srcB'].value.astype(np.float32).reshape((env['len_o'], env['len_n']))
        result = np.zeros((env['len_m'], env['len_o']), dtype=np.float32)
        for m in range(env['len_m']):
            for o in range(env['len_o']):
                for n in range(env['len_n']):
                    result[m, o] = np.float32(result[m, o] + np.float32(a[m, n] * b[o, n]))
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
