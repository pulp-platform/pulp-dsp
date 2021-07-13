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
        'PLP_DWT_DB2': 'db2',
        'PLP_DWT_DB4': 'db4'
    }

    modes = {
        'PLP_DWT_MODE_ZERO': 'zero', 
        'PLP_DWT_MODE_CONSTANT': 'constant',
        'PLP_DWT_MODE_SYMMETRIC': 'symmetric',
        'PLP_DWT_MODE_REFELCT': 'reflect',
        'PLP_DWT_MODE_ANTISYMMETRIC': 'antisymmetric',
        'PLP_DWT_MODE_ANTIREFLECT': 'antireflect'
    }



    if fix_point is not None:
        raise RuntimeError("FixPoint is not supported")
    # elif result_parameter.ctype == 'int8_t':
    #     a = inputs['pSrcA'].value.astype(np.int8)
    #     b = inputs['pSrcB'].value.astype(np.int8)
    #     result = np.add(a, b, dtype=np.int8)
    # elif result_parameter.ctype == 'int16_t':
    #     a = inputs['pSrcA'].value.astype(np.int16)
    #     b = inputs['pSrcB'].value.astype(np.int16)
    #     result = np.add(a, b, dtype=np.int16)
    # elif result_parameter.ctype == 'int32_t':
    #     a = inputs['pSrcA'].value.astype(np.int32)
    #     b = inputs['pSrcB'].value.astype(np.int32)
    #     result = np.add(a, b, dtype=np.int32)
    elif result_parameter.ctype == 'float':
        src = inputs['pSrc'].value.astype(np.float32)
        mode = env['mode']
        wavelet = env['wavelet']
        print(src, mode, wavelet)
        cA, cD = pywt.dwt(src, wavelets[wavelet], modes[mode])


        print(result_parameter.name)
        if 'pDstA' in result_parameter.name:
            return cA
        elif 'pDstD' in result_parameter.name:
            return cD
    else:
        raise RuntimeError("Unrecognized result type: %s" % result_parameter.ctype)




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
