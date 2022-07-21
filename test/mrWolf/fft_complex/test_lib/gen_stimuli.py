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

    # Q16:
    # len=16:    Q1.15 -> Q5.11
    # len=32:    Q1.15 -> Q6.10
    # len=64:    Q1.15 -> Q7.9
    # len=128:   Q1.15 -> Q8.8
    # len=256:   Q1.15 -> Q9.7
    # len=512:   Q1.15 -> Q10.6
    # len=1024:  Q1.15 -> Q11.5
    # len=2048:  Q1.15 -> Q12.4
    # len=4096:  Q1.15 -> Q13.3
    bit_shift_dict_q16 = {16:11, 32:10, 64: 9, 128: 8, 256: 7, 512: 6, 1024: 5, 2048: 4, 4096: 3}
    bit_shift_dict_q32 = {16:27, 32:26, 64:25, 128:24, 256:23, 512:22, 1024:21, 2048:20, 4096:19}


    ctype = inputs['p1'].ctype;
    if ctype == 'int32_t':
        my_type = np.int32
        my_fixpoint = 31
        bit_shift_dict = bit_shift_dict_q32
        a = inputs['p1'].value.astype(my_type)
        result = np.zeros(len(a), dtype=my_type)
        complex_a = np.zeros(int(len(a)/2), dtype=np.csingle)
        complex_result = np.zeros(len(a)>>1, dtype=np.csingle)
        for i in range(len(a)>>1):
            complex_a[i] = a[2*i].astype(np.csingle)/(2**(my_fixpoint)) + (a[2*i + 1].astype(np.csingle)/(2**(my_fixpoint)))*1j
        complex_result = np.fft.fft(complex_a)
        for i in range(int(len(a)/2)):
            result[2*i] = (np.real(complex_result[i])*(2**(bit_shift_dict[int(len(a)/2)]))).astype(my_type)
            result[2*i+1] = (np.imag(complex_result[i])*(2**(bit_shift_dict[int(len(a)/2)]))).astype(my_type)

    elif ctype == 'int16_t':
        my_type = np.int16
        my_fixpoint = 15
        bit_shift_dict = bit_shift_dict_q16
        a = inputs['p1'].value.astype(my_type)
        result = np.zeros(len(a), dtype=my_type)
        complex_a = np.zeros(int(len(a)/2), dtype=np.csingle)
        complex_result = np.zeros(len(a)>>1, dtype=np.csingle)
        for i in range(len(a)>>1):
            complex_a[i] = a[2*i].astype(np.csingle)/(2**(my_fixpoint)) + (a[2*i + 1].astype(np.csingle)/(2**(my_fixpoint)))*1j
        complex_result = np.fft.fft(complex_a)
        for i in range(int(len(a)/2)):
            result[2*i] = (np.real(complex_result[i])*(2**(bit_shift_dict[int(len(a)/2)]))).astype(my_type)
            result[2*i+1] = (np.imag(complex_result[i])*(2**(bit_shift_dict[int(len(a)/2)]))).astype(my_type)

    elif ctype == 'float':
        my_type = np.float32
        a = inputs['p1'].value.astype(my_type)
        result = np.zeros(len(a), dtype=my_type)
        complex_a = np.zeros(int(len(a)/2), dtype=np.csingle)
        complex_result = np.zeros(len(a)>>1, dtype=np.csingle)
        for i in range(len(a)>>1):
            complex_a[i] = a[2*i].astype(np.csingle) + (a[2*i + 1].astype(np.csingle))*1j
        complex_result = np.fft.fft(complex_a)
        for i in range(int(len(a)/2)):
            result[2*i] = (np.real(complex_result[i]))
            result[2*i+1] = (np.imag(complex_result[i]))


    elif ctype == 'int8_t':
        my_type = np.int8

    else:
        raise RuntimeError("Unrecognized result type: %s" % ctype)



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
