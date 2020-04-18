import random
from plptest import Test, Shell, Check
from itertools import product
import argparse
from collections import namedtuple
import numpy as np


class Variable(object):
	"""Variable"""
	def __init__(self, name):
		"""
		name: name for the variable
		"""
		super(Variable, self).__init__()
		self.name = name


class SweepVariable(Variable):
	"""sweep variable"""
	def __init__(self, name, values):
		"""
		name: name for the sweep variable
		values: iterable over all possible values for this variable
		"""
		super(SweepVariable, self).__init__(name)
		self.values = values


class DynamicVariable(Variable):
	"""Dynamic Variable, value determined based on others"""
	def __init__(self, name, fun):
		"""
		name: name of the variable
		fun: function, returning a value for a dictionary of all other previously defined variables.
		example: DynamicVairable('resLen', lambda env: env['lenA'] + env['lenB'] + 1)
		"""
		super(DynamicVariable, self).__init__(name)
		self.fun = fun


class Argument(object):
	"""docstring for argument"""
	def __init__(self, name, ctype, value):
		"""
		name: name of the argument (in the function declaration)
		ctype: C type of the argument (or 'var_type', 'ret_type')
		value: Number for initialization, or SweepVariable, or None for random value
		"""
		super(Argument, self).__init__()
		self.name = name
		self.ctype = ctype
		self.value = value
		if isinstance(self.value, SweepVariable):
			self.value = self.value.name

	def get_type(self, var_type):
		if self.ctype == 'var_type':
			return var_type[0]
		if self.ctype == 'ret_type':
			return var_type[1]
		return self.ctype

	def interpret_value(self, env):
		if self.value is None:
			return (0, 0)
		if isinstance(self.value, str):
			return (1, env[self.value])
		elif isinstance(self.value, int):
			return (1, self.value)
		raise TypeError("self.value has an unknown type: %s" % str(self.value))

	def get_arg_string(self, var_type, env):
		ctype = self.get_type(var_type)
		var_type, var_value = self.interpret_value(env)
		return '--arg %s %s 0 %d %d' % (self.name, ctype, var_type, var_value)


class ArrayArgument(Argument):
	"""Array Argument"""
	def __init__(self, name, ctype, length, value):
		"""
		name: name of the argument
		ctype: type of the argument (or 'var_type', 'ret_type')
		length: Length of the array, or SweepVariable, or tuple for random value between (min, max)
		value: tuple for random value between (min, max), or list with values, or single number for all.
		"""
		super(ArrayArgument, self).__init__(name, ctype, value)
		self.length = length
		if isinstance(self.length, SweepVariable):
			self.length = self.length.name

	def interpret_length(self, env):
		if isinstance(self.length, tuple):
			assert len(self.length) == 2
			return random.randint(*self.length)
		if isinstance(self.length, str):
			return env[self.length]
		if isinstance(self.length, int):
			return self.length
		raise TypeError("self.length has unknown type: %s" % str(self.length))

	def get_arg_string(self, var_type, env):
		ctype = self.get_type(var_type)
		var_type, var_value = self.interpret_value(env)
		var_length = self.interpret_length(env)
		return '--arg %s %s %d %d %d' % (self.name, ctype, var_length, var_type, var_value)


class OutputArgument(ArrayArgument):
	"""Output Array Argument"""
	def __init__(self, name, ctype, length):
		"""
		name: name of the argument
		ctype: type of the argument (or 'var_type', 'ret_type')
		length: Length of the array, or SweepVariable, or None for random value
		"""
		super(OutputArgument, self).__init__(name, ctype, length, 0)

	def get_arg_string(self, var_type, env):
		ctype = self.get_type(var_type)
		var_length = self.interpret_length(env)
		return '--arg %s %s %d 2 0' % (self.name, ctype, var_length)


class FixPointArgument(Argument):
	"""fixpoint argument"""
	def __init__(self, name, ctype, value):
		"""
		name: name of the argument (in the function declaration)
		ctype: C type of the argument (or 'var_type', 'ret_type')
		value: Number for initialization, or SweepVariable, or None for random value
		"""
		super(FixPointArgument, self).__init__(name, ctype, value)


class Sweep:
	""" Iterator over all variables and returns the environment"""
	def __init__(self, variables):
		self.variables = variables
		self.prod_iter = product(*[v.values for v in self.variables if isinstance(v, SweepVariable)])

	def __iter__(self):
		return self

	def __next__(self):
		sweep_vars = iter(next(self.prod_iter))
		env = {}
		for var in self.variables:
			if isinstance(var, SweepVariable):
				env[var.name] = next(sweep_vars)
			if isinstance(var, DynamicVariable):
				env[var.name] = var.fun(env)
		return env


def prepare_var_type(version):
		if version == 'i32' or version == 'q32':
			var_type = ['int32_t', 'int32_t']
		elif version == 'i16' or version == 'q16':
			var_type = ['int16_t', 'int32_t']
		elif version == 'i8' or version == 'q8':
			var_type = ['int8_t', 'int32_t']
		else:
			var_type = ['float', 'float']
		return var_type


def prepare_func_sig(function_name, version, arguments):
	arg_list = ', '.join([arg.name for arg in arguments])
	func_sig = function_name + '_' + version + '(' + arg_list + ')'
	return func_sig


def prepare_arg_sig(arguments, env, var_type):
	return ' '.join([arg.get_arg_string(var_type, env) for arg in arguments])


def get_fixpoint(arguments, env):
	fixpoint_args = [arg for arg in arguments if isinstance(arg, FixPointArgument)]
	assert len(fixpoint_args) == 1
	return fixpoint_args[0].interpret_value(env)[1]


def prepare_test_sig(version, test_idx, func_sig, arg_sig, fixpoint, use_l1):
	l1_str = ' --use_l1' if use_l1 else ''
	s = 'FSIG=\'-D FSIG=\"%s\"\' GARGS=\' %s --point %d%s\' BUILD_DIR_EXT=test_%s_t%d'
	return s % (func_sig, arg_sig, fixpoint, l1_str, version, test_idx)


def prepare_test_name(function_name, version, variables, env):
	sweep_vars_str = ', '.join(['%s=%d' % (var.name, env[var.name]) for var in variables if isinstance(var, SweepVariable)])
	test_name = '%s_%s' % (function_name, version)
	return ' '.join((test_name, sweep_vars_str))


def check_output(config, output):
	# print(output)
	passed = False
	for item in output.split('\n'):
		if 'Test passed:' in item:
			print(item)
			if item.find('1') != -1:
				passed = True
		elif 'Total cycles:' in item:
			print(item)
		elif 'Instructions:' in item:
			print(item)
		elif 'comp_result:' in item:
			print(item) # can be used for debug purposes
			pass

	return (passed, None)


def add_test(name, flags, parent=None):
	return Test(
		name=name,
		commands=[
			Shell('clean', 'make clean %s' % (flags)),
			Shell('gen', 'make gen %s' % (flags)),
			Shell('build', 'make all %s' % (flags)),
			Shell('run', 'make run %s' % (flags)),
			Check('check', check_output)
		],
		timeout=1000000,
		parent=parent
	)


def generate_test(device_name, function_name, arguments, variables, implemented, use_l1=False):
	c = {'tests': []}

	# loop over all implemented version
	for version in [v for v, s in implemented.items() if s]:

		fixed = 'q' in version # check if we use fix point arithmetic
		used_args = arguments if fixed else [arg for arg in arguments if not isinstance(arg, FixPointArgument)]
		var_type = prepare_var_type(version)
		func_sig = prepare_func_sig(function_name, version, used_args)

		# generate sweep and iterate over it, and generate the correct environment
		for test_idx, env in enumerate(Sweep(variables)):
			arg_sig = prepare_arg_sig(used_args, env, var_type)
			fixpoint = get_fixpoint(used_args, env) if fixed else -1
			test_sig = prepare_test_sig(version, test_idx + 1, func_sig, arg_sig, fixpoint, use_l1)
			test_name = prepare_test_name(function_name, version, variables, env)
			c['tests'].append(add_test(test_name, test_sig))

	return c


# Generate Header file


def write_arr(f, name, var_type, size, arr, use_l1):
	assert size == len(arr), "array should have size %d, but has %d" % (size, len(arr))
	target_loc = 'RT_L1_DATA' if use_l1 else 'RT_L2_DATA'
	f.write('%s %s %s[%s] = {\n' % (target_loc, var_type, name, size))
	for i in range(0, size - 1):
		f.write('%d, ' % arr[i])
	f.write('%d' % arr[size - 1])
	f.write('\n};\n\n')
	return


def write_scalar(f, name, var_type, value, use_l1):
	target_loc = 'L1_DATA' if use_l1 else 'L2_DATA'
	f.write('%s %s %s = %s;\n\n' % (target_loc, var_type, name, value))


def write_check(f, name, reference, size):
	f.write('if(passed == 1){for(int i = 0; i < %s; i++){if(%s[i] != %s[i]){passed = 0;}}}\\\n' % (size, name, reference))


def generate_stimuli_header(compute_result):
	"""
	Parses the command line parameters, and generates the stimuli header file based on the
	compute_result function passed as argument
	"""
	Arg = namedtuple('Arg', 'name ctype length arg_type value')

	TYPE_RANDOM = 0
	TYPE_CONSTANT = 1
	TYPE_OUTPUT = 2

	parser = argparse.ArgumentParser()

	# --arg gets 5 parameters:
	# 0 : name
	# 1 : type
	# 2 : lenght
	# 3 : arg_type
	# 4 : value
	parser.add_argument('--arg', nargs=5, action='append')
	parser.add_argument('--folder')
	parser.add_argument('--point')
	parser.add_argument('--use_l1', action='store_true')

	args = parser.parse_args()

	# change to build folder
	import os
	os.chdir(args.folder)

	# get nicer name for argument list
	arglist = args.arg
	use_l1 = args.use_l1

	for arg in arglist:
		for i in [2, 3, 4]:
			arg[i] = int(arg[i])
		# print(arg)

	# convert to list of namedtuple
	arglist = [Arg(*a) for a in arglist]

	f = open('data.h', 'w')

	arg_data = []

	for arg in arglist:
		# check what argument type it is and act accordingly
		data = 0
		if arg.arg_type == TYPE_RANDOM:
			# set max and minimum values for number generation
			max_val = 0
			min_val = 0

			if arg.ctype == 'int32_t':
				max_val = (2**31) - 1
				min_val = -(2**31)
				if arg.length == 0:
					data = np.random.randint(min_val, high=max_val, dtype=np.int32)
					write_scalar(f, arg.name, arg.ctype, data, use_l1)
				else:
					data = np.random.randint(min_val, high=max_val, size=arg.length, dtype=np.int32)
					write_arr(f, arg.name, arg.ctype, arg.length, data, use_l1)

			elif arg.ctype == 'int16_t':
				max_val = (2**15) - 1
				min_val = -(2**15)
				if arg.length == 0:
					data = np.random.randint(min_val, high=max_val, dtype=np.int16)
					write_scalar(f, arg.name, arg.ctype, data, use_l1)
				else:
					data = np.random.randint(min_val, high=max_val, size=arg.length, dtype=np.int16)
					write_arr(f, arg.name, arg.ctype, arg.length, data, use_l1)

			elif arg.ctype == 'int8_t':
				max_val = (2**7) - 1
				min_val = -(2**7)
				if arg.length == 0:
					data = np.random.randint(min_val, high=max_val, dtype=np.int8)
					write_scalar(f, arg.name, arg.ctype, data, use_l1)
				else:
					data = np.random.randint(min_val, high=max_val, size=arg.length, dtype=np.int8)
					write_arr(f, arg.name, arg.ctype, arg.length, data, use_l1)

			elif arg.ctype == 'float':
				max_val = (2**31) - 1
				min_val = -(2**31)
				if arg.length == 0:
					data = np.random.randint(min_val, high=max_val, dtype=np.int32)
					write_scalar(f, arg.name, arg.ctype, data, use_l1)
				else:
					data = np.random.randint(min_val, high=max_val, size=arg.length, dtype=np.int32)
					write_arr(f, arg.name, arg.ctype, arg.length, data, use_l1)

			# also need to handle fixed point at this

		elif arg.arg_type == TYPE_CONSTANT:
			if arg.length == 0:
				data = arg.value
				write_scalar(f, arg.name, arg.ctype, data, use_l1)
			else:
				data = [arg.value for i in range(arg.length)]
				write_arr(f, arg.name, arg.ctype, arg.length, data, use_l1)

		elif arg.arg_type == TYPE_OUTPUT:
			data = []
			if arg.ctype == 'int32_t':
				max_val = (2**31) - 2
				min_val = -(2**31) + 1

			elif arg.ctype == 'int16_t':
				max_val = (2**16) - 1
				min_val = -(2**16)

			elif arg.ctype == 'int8_t':
				max_val = (2**8) - 1
				min_val = -(2**8)

			elif arg.ctype == 'float':
				max_val = (2**31) - 1
				min_val = -(2**31)

			write_arr(f, arg.name, arg.ctype, arg.length, np.random.randint(min_val, high=max_val, dtype=np.int32, size=arg.length), use_l1)

		arg_data.append(data)

	# handle result arguments in seperate loop, as we need to have all data form above ready
	# start check define: write a check for every argument that is marked as result
	f.write('#define CHECK {\\\n')
	for arg in arglist:
		if arg.arg_type == TYPE_OUTPUT:
			ref_name = 'reference_' + arg.name
			write_check(f, arg.name, ref_name, arg.length)
	f.write('}\n\n')
	# compute results for all arguments maked as results
	for arg in arglist:
		result_index = 0
		if arg.arg_type == TYPE_OUTPUT:
			ref_name = 'reference_' + arg.name
			write_arr(f, ref_name, arg.ctype, arg.length, compute_result(result_index, arg_data, arg.ctype, int(args.point)), use_l1)
			result_index = result_index + 1

	f.close()
