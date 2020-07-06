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
    bS = inputs['blockSize'].value
    if result_parameter.ctype == 'int32_t':
        p = inputs['pSrc'].value.astype(np.int32)
        result = np.zeros(1, dtype=np.int32)
        if fix_point is None or fix_point == 0:
            result[0] = q_sat(np.var(p))
        else:
            if fix_point != 0:
                for xa, xb in zip(p, p):
                    result[0] = q_add(result[0], (xa * xb) >> fix_point)/bS
                result[0] = q_add(result[0],-np.mean(p))
    elif result_parameter.ctype == 'int16_t':
        p = inputs['pSrc'].value.astype(np.int16)
        result = np.zeros(1, dtype=np.int16)
        if fix_point is None or fix_point == 0:
            result[0] = q_sat(np.var(p))
        else:
            if fix_point != 0:
                for xa, xb in zip(p, p):
                    result[0] = q_add(result[0], (xa * xb) >> fix_point)/bS
                result[0] = q_add(result[0],-np.mean(p))
    elif result_parameter.ctype == 'int8_t':
        p = inputs['pSrc'].value.astype(np.int8)
        result = np.zeros(1, dtype=np.int8)
        if fix_point is None or fix_point == 0:
            result[0] = q_sat(np.var(p))
        else:
            if fix_point != 0:
                for xa, xb in zip(p, p):
                    result[0] = q_add(result[0], (xa * xb) >> fix_point)/bS
                result[0] = q_add(result[0],-np.mean(p))
    elif result_parameter.ctype == 'float':
        p = inputs['pSrc'].value.astype(np.float32)
        result = np.zeros(1, dtype=np.float32)
        result[0] = np.var(p)
        
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
