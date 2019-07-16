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

sizes = [8, 16, 24, 32, 40, 48]

for i in sizes:
	stimuli_cmd = 'python3 ../test_data/gen_stimuli.py' +' '+ str(i) +' '+ str(i) +' '+ str(i)
	os.system(stimuli_cmd)

	# 32 bit not parallel
	output32 = subprocess.Popen(cmd+['-C', 'singlecore_riscy'], stdout=subprocess.PIPE).communicate()[0]
	output32 = output32.split()
	output32 = [int(s) for s in output32 if s.isdigit()]
	version32_perf.append(output32[5]/output32[1])

	# 32 bit paralell
	output32p = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'P_TEST_32=1'], stdout=subprocess.PIPE).communicate()[0]
	output32p = output32p.split()
	output32p = [int(s) for s in output32p if s.isdigit()]
	version32p_perf.append(output32p[5]/output32p[1])

	# 16 bit not paralell
	output16 = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'TEST_16=1'], stdout=subprocess.PIPE).communicate()[0]
	output16 = output16.split()
	output16 = [int(s) for s in output16 if s.isdigit()]
	version16_perf.append(output16[5]/output16[1])

	# 16 bit paralell
	output16p = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'P_TEST_16=1'], stdout=subprocess.PIPE).communicate()[0]
	output16p = output16p.split()
	output16p = [int(s) for s in output16p if s.isdigit()]
	version16p_perf.append(output16p[5]/output16p[1])

	# 8 bit not paralell
	output8 = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'TEST_8=1'], stdout=subprocess.PIPE).communicate()[0]
	output8 = output8.split()
	output8 = [int(s) for s in output8 if s.isdigit()]
	version8_perf.append(output8[5]/output8[1])

	# 8 bit paralell
	# output16p = subprocess.Popen(cmd+['-C', 'singlecore_riscy', 'P_TEST_16=1'], stdout=subprocess.PIPE).communicate()[0]
	# output16p = output16p.split()
	# output16p = [int(s) for s in output16p if s.isdigit()]
	# version16p_perf.append(output16p[5]/output16p[1])

f = open("performance.csv", "w+")
f.write (',32,32p,16,16p,8\n')

for i,n in enumerate(sizes):
	f.write(str(n))
	f.write(','+str(version32_perf[i])+','+str(version32p_perf[i]))
	f.write(','+str(version16_perf[i])+','+str(version16p_perf[i]))
	f.write(','+str(version8_perf[i]))
	# f.write(','+str(version16_perf[i])+','+str(version16p_perf[i]))
	f.write('\n')

f.close()