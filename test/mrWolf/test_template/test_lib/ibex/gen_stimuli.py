#!/usr/bin/env python3

import numpy as np

###############################################################
 # Define how to compute the result here
 # The data in argument arrays can be accessed by inputs[x][i]
 # where x is the index of the input, 
 # meaning it's position in the function signature
 # i is a possible index into any array

def compute_result(inputs):
 	res_size = 1
 	result = np.zeros(res_size, dtype=int)
 	for i in range(0,12):
 		result[0] = (result[0] + inputs[0][i]*inputs[1][i]) % (2**32) 
 		# need to convert to signed reperesentation if possible
 	return(res_size, result)

 
###############################################################


def write_arr(f, name, var_type, size, arr):
	f.write('RT_L2_DATA %s %s[%s] = {\n' % (var_type, name, size))
	for i in range(0, size):
		f.write('%d, ' % arr[i])
	f.write('\n};\n\n')
	return

def write_scalar(f, name, var_type, value):
	f.write('%s %s = %s;\n\n' % (var_type, name, value))

def write_result(f, var_type, result):
	print(result)
	if result[0] == 1:
		write_scalar(f, 'result', var_type, result[1][0])
	else: 
		write_arr(f, 'result', var_type, result[0], result[1])

if __name__ == '__main__':
	
	print('hello from gen')

	import argparse

	parser = argparse.ArgumentParser()
	parser.add_argument('--arg', nargs=3, action='append')

	args = parser.parse_args()
	arglist = args.arg

	print(arglist[0])

	f = open('data.h', 'w')

	arg_data = []

	for arg in arglist:
		if arg[1]  == 'int':
			lowest = -(1<<31)
			highest = (1<<31)+1
		else:
			lowest = 0
			highest = 1

		data = np.random.randint(low=lowest, high=highest, size=int(arg[2]))
		arg_data.append(data)
		write_arr(f, arg[0], arg[1], int(arg[2]),data)

	write_result(f, 'int', compute_result(arg_data))