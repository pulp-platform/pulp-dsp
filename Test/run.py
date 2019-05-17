import os
import sys
#from gen_stimuli import *

min_values = [-2**7, -2**6, -2**3]
max_values = [2**7-1, 2**6-1, 2**3-1]

n_bits_list = [32, 16, 8]
for i in range(len(n_bits_list)):
    n_bits = n_bits_list[i]
    print("\n\nnumber of bits: {}\n\n".format(n_bits))

    directory = "./perf_"+str(n_bits)+"_bits"
    if not os.path.exists(directory):
        os.makedirs(directory)

    for m in range(2,4):
        print("\n\nmethod {}\n\n".format(m))
        os.system("python3 gen_Makefile.py {} {}". format(n_bits, m))

        #if (m == 1) and (n_bits == 16 or n_bits == 8):
        #    continue

        for N in range(128, 4097, 128):
            print("\n\nvector length: %d\n\n" % (N))
            os.system("python3 gen_stimuli.py \"data{}.h\" \"int{}_t\" {} {} {} {}".format(n_bits, n_bits, n_bits, min_values[i], max_values[i], N))
            txt_filename = directory+"/terminal_output_"+str(m)+".txt"
            os.system("make clean all run &>> "+txt_filename)
            os.system("python3 create_csv.py " + txt_filename)


