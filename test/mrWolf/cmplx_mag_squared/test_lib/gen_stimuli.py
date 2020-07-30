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
        my_type = np.int32
        my_bits = 32
        my_computeType = np.int32
    elif result_parameter.ctype == 'int16_t':
        my_type = np.int16
        my_bits = 16
        my_computeType = np.int32
    elif result_parameter.ctype == 'int8_t':
        my_type = np.int8
        my_bits = 8
        my_computeType = np.int32
    elif result_parameter.ctype == 'float':
        my_type = np.float32
        my_bits = 32
        my_computeType = np.float32
    else:
        raise RuntimeError("Unrecognized result type: %s" % ctype)

    src = inputs['src'].value.astype(my_computeType)
    num_samples = inputs['num_samples'].value
    result = np.zeros(num_samples, dtype=my_type)
    if fix_point is None or fix_point == 0:
        for n in range(0, num_samples):
            result[n] =  src[2*n] * src[2*n] + src[2*n + 1] * src[2*n + 1];
    else:
        for n in range(0, num_samples):
            result[n] =  q_add(q_mul(src[2*n], src[2*n], fix_point, bits=my_bits), q_mul(src[2*n + 1], src[2*n + 1], fix_point, bits=my_bits), bits=my_bits);
    
    # print(result_parameter.ctype); print("src"); print(src); print("result"); print(result);

    return result


######################
# Fixpoint Functions #
######################


def q_sat(x, bits=32):
    if x > 2**(bits-1) - 1:
        # print("overflow")
        return x - 2**bits
    elif x < -2**(bits-1):
        # print("underflow")
        return x + 2**bits
    else:
        return x


def q_add(a, b, bits=32):
    return q_sat(a + b, bits=bits)


def q_sub(a, b, bits=32):
    return q_sat(a - b, bits=bits)


def q_mul(a, b, p, bits=32):
    # print(a)
    # print(b)
    # print(a*b)
    return q_roundnorm(a * b, p, bits=bits)


def q_roundnorm(a, p, bits=32):
    rounding = 1 << (p - 1)
    # print(rounding)
    return q_sat((a + rounding) >> p, bits=bits)


###########################
# generate_stimuli_header #
###########################


if __name__ == "__main__":
    import sys, os
    sys.path.append(os.path.abspath(os.path.join(os.path.realpath(__file__), "../../../..")))
    from pulp_dsp_test import generate_stimuli_header
    generate_stimuli_header(compute_result)
