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
        raise RuntimeError("FixPoint is not supported")
    elif result_parameter.version == 'i4':
        a = inputs['pSrcA'].value.astype(np.int32)
        b = inputs['pSrcB'].value.astype(np.int32)
        result = []
        for elem in zip(a, b):
            a4_vec = convert_r32_to_i4(elem[0])
            # print("a4_vec = ", a4_vec)
            b4_vec = convert_r32_to_i4(elem[1])
            # print("b4_vec = ", b4_vec)
            result.append(i4_vec_sum(a4_vec, b4_vec))
    elif result_parameter.version == 'i2':
        raise NotImplementedError("INT2 addition not implemented yet!")
    elif result_parameter.ctype == 'int8_t':
        a = inputs['pSrcA'].value.astype(np.int8)
        b = inputs['pSrcB'].value.astype(np.int8)
        result = np.add(a, b, dtype=np.int8)
    elif result_parameter.ctype == 'int16_t':
        a = inputs['pSrcA'].value.astype(np.int16)
        b = inputs['pSrcB'].value.astype(np.int16)
        result = np.add(a, b, dtype=np.int16)
    elif result_parameter.ctype == 'int32_t':
        a = inputs['pSrcA'].value.astype(np.int32)
        b = inputs['pSrcB'].value.astype(np.int32)
        result = np.add(a, b, dtype=np.int32)
    elif result_parameter.ctype == 'float':
        a = inputs['pSrcA'].value.astype(np.float32)
        b = inputs['pSrcB'].value.astype(np.float32)
        result = np.add(a, b, dtype=np.float32)
        # print("result: ", result)
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


######################
#   INT4 Functions   #
######################

""" convert_r32_to_i4
        - input: 32-bit value (register) holding 8xINT4 values (signed)
        - output: a list containing eight INT4 values (signed)
"""
def convert_r32_to_i4(i32_val):
    # get the binary representation of the 32-bit register
    i32_bin = np.binary_repr(i32_val, width=32)
    # split the 32-bit register into 8xINT4
    i4_bin = [i32_bin[i:i+4] for i in range(0, len(i32_bin), 4)]
    # Convert INT4 to decimal in 2s complement
    i4_dec = [int(i4_bin[i][1:4], 2) - int(i4_bin[i][0], 2) * 8 for i in range(0, len(i4_bin))]#[int(i4_bin[i][1:4], 2) for i in i4_bin]
    return i4_dec

""" i4_vec_sum
        - input: two INT4 vectors holding eight elements each
        - output: element-wise sum converted back to a 320bit register entry
"""
def i4_vec_sum(i4_dec0, i4_dec1):
    # element-wise addition
    i4_dec_sum = [i4_dec0[i] + i4_dec1[i] for i in range(0, len(i4_dec0))]
    for i in range(0, len(i4_dec_sum)):
        if i4_dec_sum[i] > 7:
            i4_dec_sum[i] = -16 + i4_dec_sum[i]
        elif i4_dec_sum[i] < -8:
            i4_dec_sum[i] = 16 + i4_dec_sum[i]
    # Convert INT4 to binary in 2s complement
    i4_bin_sum = [np.binary_repr(i4_dec_sum[i], width=4) for i in range(0, len(i4_dec_sum))]
    # convert i4_bin_sum to i32
    i32_bin_sum = ''.join(i4_bin_sum)
    i32_dec_sum = int(i32_bin_sum, 2)
    return i32_dec_sum