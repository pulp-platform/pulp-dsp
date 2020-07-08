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
    inputs: Dict mapping name to the Argument, with arg.value, arg.dtype (and arg.length)
    env: Dict mapping the variable (SweepVariable or DynamicVariable) names to their value.
    fix_point: None (if no fixpoint is used) or decimal point
    """    
    if result_parameter.ctype == 'int32_t':
        p = inputs['pSrc'].value.astype(np.int32)
        result = np.zeros(1, dtype=np.int32)
        if(p>0):
            result[0] = int(2**(32-fix_point)*np.sqrt(float(p)/2**(32-fix_point)))
        else:
            result[0] = 0
                    
    elif result_parameter.ctype == 'int16_t':
        p = inputs['pSrc'].value.astype(np.int16)
        result = np.zeros(1, dtype=np.int16)
        if(p>0):
            result[0] = int(2**(16-fix_point)*np.sqrt(float(p)/2**(16-fix_point)))
        else:
            result[0] = 0
                    
    elif result_parameter.ctype == 'int8_t':
        raise RuntimeError("Int8 not implemented")
    
    elif result_parameter.ctype == 'float':
        p = inputs['pSrc'].value.astype(np.float32)
        result = np.zeros(1, dtype=np.float32)
        if(p>0):
            result[0] = np.sqrt(p)
        else:
            result[0] = 0
        
    else:
        raise RuntimeError("Unrecognized result type: %s" % result_parameter.ctype)


    print("---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
    print(p)
    print("---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
    
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


###########################
# generate_stimuli_header #
###########################


if __name__ == "__main__":
    import sys, os
    sys.path.append(os.path.abspath(os.path.join(os.path.realpath(__file__), "../../../..")))
    from pulp_dsp_test import generate_stimuli_header
    generate_stimuli_header(compute_result)
