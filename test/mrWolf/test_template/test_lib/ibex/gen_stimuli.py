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

def write_check(f, name, reference, size):
	f.write('if(passed == 1){for(int i = 0; i < %s; i++){if(%s[i] != %s[i]){passed = 0;}}}\\\n' % (size, name, reference))

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
	parser.add_argument('--folder')

	args = parser.parse_args()

	# change to build folder
	import os
	os.chdir(args.folder)

	# get nicer name for argument list
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
				max_val = (2**15)-1
				min_val = -(2**15)
				if arg[2] == 1:
					data = rand.randint(min_val,max_val)
					write_scalar(f, arg[0], arg[1], data)
				else:
					data = [rand.randint(min_val,max_val) for i in range(arg[2])]
					write_arr(f, arg[0], arg[1], arg[2], data)

			elif arg[1] == 'int8_t':
				max_val = (2**7)-1
				min_val = -(2**7)
				if arg[2] == 1:
					data = rand.randint(min_val,max_val)
					write_scalar(f, arg[0], arg[1], data)
				else:
					data = [rand.randint(min_val,max_val) for i in range(arg[2])]
					write_arr(f, arg[0], arg[1], arg[2], data)

			elif arg[1] == 'float':
				max_val = (2**31)-1
				min_val = -(2**31)
				if arg[2] == 1:
					data = rand.uniform(min_val,max_val)
					write_scalar(f, arg[0], arg[1], data)
				else:
					data = [rand.uniform(min_val,max_val) for i in range(arg[2])]
					write_arr(f, arg[0], arg[1], arg[2], data)

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

		arg_data.append(data)

	# handle result arguments in seperate loop, as we need to have all data form above ready
	# start check define: write a check for every argument that is marked as result
	f.write('#define CHECK {\\\n')
	for arg in arglist:
		if arg[3] == 2:
			ref_name = 'reference_'+ arg[0]
			write_check(f, arg[0], ref_name, arg[2])
	f.write('}\n\n')
	# compute results for all arguments maked as results
	for arg in arglist:
		result_index = 0
		if arg[3] == 2:
			ref_name = 'reference_'+ arg[0]
			write_arr(f, ref_name, arg[1], arg[2], compute_result(result_index, arg_data))
			result_index = result_index + 1

	f.close()