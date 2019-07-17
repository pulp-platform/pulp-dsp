import os
import subprocess
cmd = ['make', 'clean', 'all', 'run', '-s']

# outputs are formated in
# [0] number of bits
# [1] total cycles
# [2] total instructions
# [3] load stalls
# [4] contention stalls
# [5] operations done (One add and one mult for M*N*O)

version32_perf = []
version32p_perf = []
version16_perf = []
version16p_perf = []
version8_perf = []
version8p_perf = []
fc_version32_perf = []
fc_version16_perf = []
fc_version8_perf = []

sizes = [i for i in range(4,56)]
# sizes = [16]

for i in sizes:
	stimuli_cmd = 'python3 ../test_data/gen_stimuli.py' +' '+ str(i) +' '+ str(i) +' '+ str(i)
	os.system(stimuli_cmd)

	print('start now with iteration: ',i)

	# ON FC
	# FC 32 bit
	fc_output32 = subprocess.Popen(cmd+['-C', 'fc_ibex'], stdout=subprocess.PIPE).communicate()[0]
	print(fc_output32)
	fc_output32 = fc_output32.split()
	fc_output32 = [int(s) for s in fc_output32 if s.isdigit()]
	fc_version32_perf.append(fc_output32[5]/fc_output32[1])

	# FC 16 Bit
	fc_output16 = subprocess.Popen(cmd+['-C', 'fc_ibex', 'MUL_TEST_16=1'], stdout=subprocess.PIPE).communicate()[0]
	print(fc_output16)
	fc_output16 = fc_output16.split()
	fc_output16 = [int(s) for s in fc_output16 if s.isdigit()]
	fc_version16_perf.append(fc_output16[5]/fc_output16[1])

	# FC 8 bit
	fc_output8 = subprocess.Popen(cmd+['-C', 'fc_ibex', 'MUL_TEST_8=1'], stdout=subprocess.PIPE).communicate()[0]
	print(fc_output8)
	fc_output8 = fc_output8.split()
	fc_output8 = [int(s) for s in fc_output8 if s.isdigit()]
	fc_version8_perf.append(fc_output8[5]/fc_output8[1])

	# ON CLUSTER
	# 32 bit not parallel
	output32 = subprocess.Popen(cmd+['-C', 'singlecore_riscy'], stdout=subprocess.PIPE).communicate()[0]
	print(output32)
	output32 = output32.split()
	output32 = [int(s) for s in output32 if s.isdigit()]
	version32_perf.append(output32[5]/output32[1])

	# 32 bit paralell
	output32p = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'P_TEST_32=1'], stdout=subprocess.PIPE).communicate()[0]
	print(output32p)
	output32p = output32p.split()
	output32p = [int(s) for s in output32p if s.isdigit()]
	version32p_perf.append(output32p[5]/output32p[1])

	# 16 bit not paralell
	output16 = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'TEST_16=1'], stdout=subprocess.PIPE).communicate()[0]
	print(output16)
	output16 = output16.split()
	output16 = [int(s) for s in output16 if s.isdigit()]
	version16_perf.append(output16[5]/output16[1])

	# 16 bit paralell
	output16p = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'P_TEST_16=1'], stdout=subprocess.PIPE).communicate()[0]
	print(output16p)
	output16p = output16p.split()
	output16p = [int(s) for s in output16p if s.isdigit()]
	version16p_perf.append(output16p[5]/output16p[1])

	# 8 bit not paralell
	output8 = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'TEST_8=1'], stdout=subprocess.PIPE).communicate()[0]
	print(output8)
	output8 = output8.split()
	output8 = [int(s) for s in output8 if s.isdigit()]
	version8_perf.append(output8[5]/output8[1])

	# 8 bit paralell
	output8p = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'P_TEST_8=1'], stdout=subprocess.PIPE).communicate()[0]
	print(output8p)
	output8p = output8p.split()
	output8p = [int(s) for s in output8p if s.isdigit()]
	version8p_perf.append(output8p[5]/output8p[1])

f = open("performance.csv", "w+")
f.write ('n,32,32p,16,16p,8,fc_32,fc_16,fc_8\n')

for i,n in enumerate(sizes):
	f.write(str(n))
	f.write(','+str(version32_perf[i])+','+str(version32p_perf[i]))
	f.write(','+str(version16_perf[i])+','+str(version16p_perf[i]))
	f.write(','+str(version8_perf[i])+','+str(version8p_perf[i]))
	f.write(','+str(fc_version32_perf[i])+','+str(fc_version16_perf[i])+','+str(fc_version8_perf[i]))
	f.write('\n')

f.close()