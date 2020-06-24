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
        a = inputs['srcA'].value.astype(np.int32).reshape((env['len_m'], env['len_n']))
        b = inputs['srcB'].value.astype(np.int32).reshape((env['len_o'], env['len_n']))
        if fix_point is None or fix_point == 0:
            result = np.matmul(a, b.T).astype(np.int32).reshape((env['len_res'], ))
        else:
            raise RuntimeError("Fix-Point not implemented")
    elif result_parameter.ctype == 'float':
        raise RuntimeError("Float not implemented")
    else:
        raise RuntimeError("Unrecognized result type: %s" % result_parameter.ctype)

    return result


######################
# Fixpoint Functions #
######################


def q_sat(x):
    if x > 2**31 - 1:
        return 2**31 - 1
    elif x < -2**31:
        return -2**31
    else:
        return x


def q_add(a, b, p):
    return q_sat(a + b)


def q_sub(a, b, p):
    return q_sat(a - b)


def q_mul(a, b, p):
    return q_sat((a * b) >> p)


###########################
# generate_stimuli_header #
###########################


if __name__ == "__main__":
    import sys, os
    sys.path.append(os.path.abspath(os.path.join(os.path.realpath(__file__), "../../../..")))
    from pulp_dsp_test import generate_stimuli_header
    generate_stimuli_header(compute_result)