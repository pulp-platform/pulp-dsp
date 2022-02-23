#!/usr/bin/env python3

import numpy as np
import pywt


####################
# generate_stimuli #
####################


def generate_stimuli(arg, env):
    """
    Function to generate the stimuli

    Arguments
    ---------
    arg: Argument for which to generate stimuli (either Argument or ArrayArgument)
    env: Dict mapping the variable (SweepVariable or DynamicVariable) names to their value.
    """
    # name = arg.name
    # if name == "srcA":
    #     # generate and return stimuli for srcA
    # if name == "srcB":
    #     # generate and return stimuli for srcB
    # ...



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
    wavelets = {
        'PLP_DWT_HAAR': 'haar',
        'PLP_DWT_DB1': 'db1',
        'PLP_DWT_DB2': 'db2',
        'PLP_DWT_DB4': 'db4',
        'PLP_DWT_COIF17': 'coif17',
	    'PLP_DWT_SYM20': 'sym20'
    }

    modes = {
        'PLP_DWT_MODE_ZERO': 'zero', 
        'PLP_DWT_MODE_CONSTANT': 'constant',
        'PLP_DWT_MODE_SYMMETRIC': 'symmetric',
        'PLP_DWT_MODE_REFLECT': 'reflect',
        'PLP_DWT_MODE_ANTISYMMETRIC': 'antisymmetric',
        'PLP_DWT_MODE_ANTIREFLECT': 'antireflect'
    }

    mode = modes[env['mode']]
    wavelet = wavelets[env['wavelet']]
    level = env['level']
    src = inputs['pSrc'].value.astype(np.float32)


    max_level = pywt.dwt_max_level(len(src), wavelet)


    if level > max_level:
        level = max_level

    if level == 0:
        level = max_level

    if fix_point is not None:
        raise RuntimeError("not supported")


        
        if result_parameter.ctype == 'int8_t':
            # Create 8bit quantized version of the wavelet
            ww = make_fixed_point_wavelet(wavelet, 'q8')

            cA, cD = pywt.dwt(src, ww, mode)
            cA = right_shift(cA, 'q8')
            cD = right_shift(cD, 'q8')

        elif result_parameter.ctype == 'int16_t':
            # Create 16bit quantized version of the wavelet
            ww = make_fixed_point_wavelet(wavelet, 'q16')

            cA, cD = pywt.dwt(src, ww, mode)
            cA = right_shift(cA, 'q16')
            cD = right_shift(cD, 'q16')

        elif result_parameter.ctype == 'int32_t':
            # Create 32bit quantized version of the wavelet
            ww = make_fixed_point_wavelet(wavelet, 'q32')

            cA, cD = pywt.dwt(src, ww, mode)
            cA = right_shift(cA, 'q32')
            cD = right_shift(cD, 'q32')

    elif result_parameter.ctype == 'float':

        c = pywt.wavedec(src, wavelet, mode, level=level)
    else:
        raise RuntimeError("Unrecognized result type: %s" % result_parameter.ctype)

    # print(c[::-1])
    return np.concatenate(c[::-1])


######################
# Fixpoint Functions #
######################


def right_shift(arr, dtype):
    """Rightshift - needed after the fixed point multiplication"""
    if dtype == "q32":
        return np.right_shift(arr.astype(np.int64), 31).astype(np.int32)
    elif dtype == "q16":
        return np.right_shift(arr.astype(np.int32), 15).astype(np.int16)
    elif dtype == "q8":
        return np.right_shift(arr.astype(np.int16), 7).astype(np.int8)


def make_fixed_point_wavelet(wavelet, dtype):
    """Make fixed point wavelet by quantizing existing wavelength coefficients"""
    if dtype == "q32":
        return pywt.Wavelet(filter_bank=convert_dtype(np.array(pywt.Wavelet(wavelet).filter_bank), 'q32'))
    elif dtype == "q16":
        return pywt.Wavelet(filter_bank=convert_dtype(np.array(pywt.Wavelet(wavelet).filter_bank), 'q16'))
    elif dtype == "q8":
        return pywt.Wavelet(filter_bank=convert_dtype(np.array(pywt.Wavelet(wavelet).filter_bank), 'q8'))


def convert_dtype(arr, dtype):
    """"""
    arr = np.array(arr)
    if dtype == "q32":
        return np.array(np.round(arr*2**31), dtype=np.int32)
    elif dtype == "q16":
        return np.array(np.round(arr*2**15), dtype=np.int16)
    elif dtype == "q8":
        return  np.array(np.round(arr*2**7), dtype=np.int8)
    else:
        return arr


def to_fixed(x, dtype):
    """ Convert array into x fixed point with dtype """
    if dtype == "q8":
        x = np.clip(x, -(2**7), (2**7-1))
        return np.array(np.round(x), dtype=np.int8)
    elif dtype == "q16":
        x = np.clip(x, -(2**15), (2**15-1))
        return np.array(np.round(x), dtype=np.int16)
    elif dtype == "q32":
        x = np.clip(x, -(2**31), (2**31-1))
        return np.array(np.round(x), dtype=np.int32)



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
