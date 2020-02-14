#!/usr/bin/env python3

import numpy as np

###############################################################
 # Define how to compute the result here
 # The data in argument arrays can be accessed by inputs[x][i]
 # where x is the index of the input, 
 # meaning it's position in the function signature
 # i is a possible index into any array

def compute_result(res_number, inputs):
	lenght = inputs[2]
	result = np.zeros(lenght, dtype=int)
	for i in range(0,lenght):
		result[0] = (result[0] + inputs[0][i]*inputs[1][i]) % (2**32) 
		# need to convert to signed reperesentation if possible
	return(result)

 
###############################################################


def write_arr(f, name, var_type, size, arr):
	f.write('RT_L2_DATA %s %s[%s] = {\n' % (var_type, name, size))
	for i in range(0, size-1):
		f.write('%d, ' % arr[i])
	f.write('%d' % arr[size-1])
	f.write('\n};\n\n')
	return

def write_scalar(f, name, var_type, value):
	f.write('%s %s = %s;\n\n' % (var_type, name, value))

if __name__ == '__main__':

	import argparse
	import random as rand

	parser = argparse.ArgumentParser()

	# --arg gets 5 parameters:
	# 0 : name
	# 1 : type
	# 2 : lenght
	# 3 : arg_type
	# 4 : value
	parser.add_argument('--arg', nargs=5, action='append')

	args = parser.parse_args()
	arglist = args.arg

	for arg in arglist:
		for i in [2,3,4]:
			arg[i] = int(arg[i])
		# print(arg)

	f = open('data.h', 'w')

	arg_data = []

	for arg in arglist:
		# check what argument type it is and act accordingly
		data = 0
		if arg[3] == 0:
			# set max and minimum values for number generation
			max_val = 0
			min_val = 0

			if arg[1] == 'int32_t':
				max_val = (2**31)-1
				min_val = -(2**31)
				if arg[2] == 1:
					data = rand.randint(min_val,max_val)
					write_scalar(f, arg[0], arg[1], data)
				else:
					data = [rand.randint(min_val,max_val) for i in range(arg[2])]
					write_arr(f, arg[0], arg[1], arg[2], data)

			elif arg[1] == 'int16_t':
				max_val = (2**16)-1
				min_val = -(2**16)
				if arg[2] == 1:
					data = rand.randint(min_val,max_val)
					write_scalar(f, arg[0], arg[1], data)
				else:
					data = [rand.randint(min_val,max_val) for i in range(arg[2])]
					write_arr(f, arg[0], arg[1], arg[2], data)

			elif arg[1] == 'int8_t':
				max_val = (2**8)-1
				min_val = -(2**8)
				if arg[2] == 1:
					data = rand.randint(min_val,max_val)
					write_scalar(f, arg[0], arg[1], data)
				else:
					data = [rand.randint(min_val,max_val) for i in range(arg[2])]
					write_arr(f, arg[0], arg[1], arg[2], data)

			# elif arg[1] == 'float':
			# 	max_val = MAX_FLOAT
			# 	min_val = MIN_FLOAT
			# also need to handle fixed point at this


		elif arg[3] == 1:
			if arg[2] == 1:
				data = arg[4]
				write_scalar(f, arg[0], arg[1], data)
			else:
				data = [arg[4] for i in range(arg[2])]
				write_arr(f, arg[0], arg[1], arg[2], data)

		elif arg[3] == 2:
			data = []
			if arg[1] == 'int32_t':
				max_val = (2**31)-2
				min_val = -(2**31)+1

			elif arg[1] == 'int16_t':
				max_val = (2**16)-1
				min_val = -(2**16)		

			elif arg[1] == 'int8_t':
				max_val = (2**8)-1
				min_val = -(2**8)

			elif arg[1] == 'float':
				max_val = (2**31)-1
				min_val = -(2**31)

			write_arr(f, arg[0], arg[1], arg[2], [rand.randint(min_val,max_val) for i in range(arg[2])])

			# elif arg[1] == 'float':
			# 	max_val = MAX_FLOAT
			# 	min_val = MIN_FLOAT
			# also need to handle fixed point at this

		arg_data.append(data)

	# handle result arguments in seperate loop, as we need to have all data form above ready
	
	for arg in arglist:
		result_index = 0
		if arg[3] == 2:
			res_name = 'reference_'+ arg[0]
			write_arr(f, res_name, arg[1], arg[2], compute_result(result_index, arg_data))
			result_index = result_index + 1

	f.close()