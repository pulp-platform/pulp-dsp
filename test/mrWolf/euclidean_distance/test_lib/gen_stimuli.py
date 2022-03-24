#!/usr/bin/env python3

import numpy as np
import math
    
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
    if(fix_point == None):
        fix_point = 0
    if result_parameter.ctype == 'int32_t':
        a = inputs['srcA'].value.astype(np.int32)
        b = inputs['srcB'].value.astype(np.int32)
        result = np.zeros(1, dtype=np.int32)
        for xa, xb in zip(a, b):
            tmp = xa - xb;
            result[0] = q_add(result[0], (tmp*tmp) >> fix_point)

        if result[0] > 0:
            result[0] = int(2**(fix_point)*np.sqrt(float(result[0])/2**(fix_point)))
        else:
            result[0] = 0;
                       
    elif result_parameter.ctype == 'int16_t':
        a = inputs['srcA'].value.astype(np.int16)
        b = inputs['srcB'].value.astype(np.int16)
        result = np.zeros(1, dtype=np.int16)
        for xa, xb in zip(a, b):
            tmp = xa - xb;
            result[0] = q_add(result[0], (tmp*tmp) >> fix_point)

        if result[0] > 0:
            result[0] = int(2**(fix_point)*np.sqrt(float(result[0])/2**(fix_point)))
        else:
            result[0] = 0;
                    
    elif result_parameter.ctype == 'int8_t':
        raise RuntimeError("Int8 not implemented")

    elif result_parameter.ctype == 'float':
        # for float implementation, it is important to always use float32 for intermediate operations!
        a = inputs['srcA'].value.astype(np.float32)
        b = inputs['srcB'].value.astype(np.float32)
        res = np.float32(0)
        for x_a, x_b in zip(a, b):
            res += np.square(x_a-x_b)
        res = np.sqrt(res)
        result = np.array([res], dtype=np.float32)

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
