#!/usr/bin/env python3

def compute_result(result_parameter, inputs, env, fix_point):
    assert fix_point is None
    assert result_parameter.ctype == inputs['pSrc'].ctype
    src = inputs['pSrc'].value.reshape((env['len_m'], env['len_n']))
    dst = src.T.reshape((env['len_mat'], ))
    return dst
