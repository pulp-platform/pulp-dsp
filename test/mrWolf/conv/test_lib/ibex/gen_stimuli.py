#!/usr/bin/env python3

import numpy as np


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
	rounding = 1 << (p - 1)
	return q_sat((a * b + rounding) >> p)


###############################################################
# Define how to compute the result here
# The data in argument arrays can be accessed by inputs[x][i]
# where x is the index of the input,
# meaning it's position in the function signature
# i is a possible index into any array
# res_type contains the string type of the result
# fix point will give -1 if it is not fix point arithmetic or the index where the point should be

def compute_result(res_number, inputs, res_type, fix_point):
	if res_type == 'int32_t':
		# compute results for i32, i16 and i8
		if fix_point == -1:
			a = inputs[0].astype(np.int32)
			b = inputs[2].astype(np.int32)
			return np.convolve(a, b, mode='full')
		# compite results for q32, q16 and q8
		# the example is wront currently
		else:
			raise RuntimeError("Fixpoint not implemented")
			# result = np.zeros(lenght, dtype=np.int32)
			# if fix_point != 0:
			# 	for i in range(0, lenght):
			# 		result[0] = q_add(result[0], q_mul(inputs[0][i], inputs[1][i], fix_point), fix_point)
			# else:
			# 	for i in range(0, lenght):
			# 		result[0] = (result[0] + inputs[0][i] * inputs[1][i])
			# return result
	# compute result for float computation
	elif res_type == 'float':
		raise RuntimeError("Float not implemented")
		# result = np.zeros(lenght, dtype=np.float32)
		# for i in range(0, lenght):
		#	result[0] = (result[0] + inputs[0][i] * inputs[1][i])
		# return result
	else:
		raise TypeError('result %s has neither i32 or float type' % res_number)


###############################################################

if __name__ == "__main__":
	import sys, os
	sys.path.append(os.path.abspath(os.path.join(os.path.realpath(__file__), "../../../..")))
	from pulp_dsp_test import generate_stimuli_header
	generate_stimuli_header(compute_result)
