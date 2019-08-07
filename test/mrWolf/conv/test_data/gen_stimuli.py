#!/usr/bin/env python

'''
gen_stimuli.py is used to generate header files containing data used for testing. 
Currently it supports generation of two vectors for dot product. It randomly generates the two vectors and saves them into a header file together with the respected expected (right) result from dot product.
The inputs to the gen_stimuli.py are:
- name of the header file containing generated data
- variable type: int32_t, int16_t, int8_t
- precision of the elements of the vectors in bit: 32, 16, 8
- minimum extreme of the range of the values in the vectors
- maximum extreme of the range of the values in the vectors
- length of the vectors
'''

import sys
import random
import numpy as np

def write_header(f, name, var_type, height, width):
    f.write('%s %s[%d];\n\n' % (var_type, name, length)) #RT_CL_DATA

def write_header_scalar(f, name, var_type, value):
    f.write('%s %s = %s;\n\n' % (var_type, name, value)) #RT_CL_DATA

def write_arr(f, name, arr, var_type, length, length_VAR, L):

    if L == 1:
        cache = 'RT_CL_DATA'
    else: 
        cache = 'RT_L2_DATA'

    f.write('%s %s %s[%s] = {\n' % (cache, var_type, name,length_VAR)) # RT_L2_DATA #RT_CL_DATA
    for i in range(0, length):
        v = arr[i]
        f.write('%d, ' % (v))
    f.write('\n')
    f.write('};\n\n')
    return

def write_scalar(f, name, value, var_type):
    f.write('%s %s = %d;\n\n' % (var_type, name, value)) # RT_L2_DATA # RT_CL_DATA
    return

################################################################################
# generate random int vector and convolve it, printing all three vectors to a header file
def gen_stimuli(name, var_type, n_bits, min_value, max_value, A, B):
    f = open(name + '_L1.h', 'w+')
    g = open(name + '_L2.h', 'w+')

    v_a = np.random.randint(min_value, max_value, A)
    v_b = np.random.randint(min_value, max_value, B)

    r = np.convolve(v_a, v_b)

    f.write('#ifndef __CONV_L1_H_' + str(n_bits) + '__\n#define __CONV_L1_H_' + str(n_bits) + '__\n\n')
    f.write('#define LENGTHA %d\n\n' % A)
    f.write('#define LENGTHB %d\n\n' % B)
    f.write('typedef %s v_type;\n' % var_type)

    g.write('#ifndef __CONV_L2_H_' + str(n_bits) + '__\n#define __CONV_L2_H_' + str(n_bits) + '__\n\n')
    g.write('#define LENGTHA %d\n\n' % A)
    g.write('#define LENGTHB %d\n\n' % B)
    g.write('typedef %s v_type;\n' % var_type)
#    f.write('unsigned int v_length = %s;\n' % str(length))

    # write_header_scalar(f, 'result',   "int32_t", 0)

    write_arr(f, 'v_a',   v_a,   var_type, A, "LENGTHA", 1)
    write_arr(f, 'v_b',   v_b,   var_type, B, "LENGTHB", 1)
    write_arr(f, 'r',   r,   "int32_t", A+B-1, "LENGTHB+LENGTHA-1", 1)

    write_arr(g, 'v_a',   v_a,   var_type, A, "LENGTHA", 2)
    write_arr(g, 'v_b',   v_b,   var_type, B, "LENGTHB", 2)
    write_arr(g, 'r',   r,   "int32_t", A+B-1, "LENGTHB+LENGTHA-1", 2)
    
#    f.write('%s dot_product(%s * v, %s * u, unsigned int n);\n' % (var_type, var_type, var_type))

    f.write('\n#endif\n')
    g.write('\n#endif\n')

    f.close()
    g.close()


if __name__=='__main__':

    """
    input
    first argument: file_name [string]
    second argument: data type [string]
    third argument: number of bits [integer]
    fourth argument: minimum value [int]
    fifth argument: maximum value [int]
    sixth argument: vector length [integer]
    """

    # file_name = sys.argv[1]
    # data_type = sys.argv[2]
    # n_bits = int(sys.argv[3])
    # min_value = int(sys.argv[4])
    # max_value = int(sys.argv[5])
    # v_len = int(sys.argv[6])

#    print("file_name {}, data_type {}, n_bits {}, v_len {}\n".format(file_name, data_type, n_bits, type(v_len)))

    # gen_stimuli(file_name, data_type, n_bits, min_value, max_value,v_len)

    m_size = 64
    n_size = 64

    gen_stimuli('conv_data32', "int32_t", 32, -2**7, 2**7-1  ,m_size, n_size)
    gen_stimuli('conv_data16', "int16_t", 16, -2**6, 2**6-1  ,m_size, n_size)
    gen_stimuli('conv_data8' ,  "int8_t", 8, -2**3, 2**3-1   ,m_size, n_size)
