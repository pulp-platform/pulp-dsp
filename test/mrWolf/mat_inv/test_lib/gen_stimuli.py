#!/usr/bin/env python3

import numpy as np

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

    A = inputs['pSrc'].value.reshape((env['len_n'], env['len_n']))

    if "return_value" in result_parameter.name:
        return 0 if is_invertible(A) else 1
    else:
        return np.linalg.inv(A).reshape((env['len_mat'], ))


def is_invertible(A):
    return A.shape[0] == A.shape[1] and np.linalg.matrix_rank(A) == A.shape[0]
