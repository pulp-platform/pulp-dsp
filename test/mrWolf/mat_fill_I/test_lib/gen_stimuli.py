#!/usr/bin/env python3

import numpy as np


def compute_result(result_parameter, inputs, env, fix_point):
    dtype = np.int8 if result_parameter.ctype == "int8_t" else \
            np.int16 if result_parameter.ctype == "int16_t" else \
            np.int32 if result_parameter.ctype == "int32_t" else \
            np.float32
    result = np.eye(env['len_n']).astype(dtype)
    if fix_point:
        result = result << fix_point
    return result.reshape((env['len_mat'], ))
