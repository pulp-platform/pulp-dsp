#!/usr/bin/env python3

import numpy as np


def compute_result(result_parameter, inputs, env, fix_point):
    dtype = np.int8 if result_parameter.ctype == "int8_t" else \
            np.int16 if result_parameter.ctype == "int16_t" else \
            np.int32 if result_parameter.ctype == "int32_t" else \
            np.float32
    M = env['len_m']
    N = env['len_n']
    stride = env['stride']
    value = inputs['value'].value
    result = inputs['pDst'].value.copy().astype(dtype).reshape((M, stride))
    result[:M, :N] = value
    return result.reshape((env['len_mat'], ))
