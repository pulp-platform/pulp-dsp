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
# generates resutl C a MxO matrix from A: MxN and B: NxO
def gen_stimuli(name, var_type, n_bits, min_value, max_value, M, N, O, fma):
    f = open(name + '_L1.h', 'w+')
    g = open(name + '_L2.h', 'w+')

    m_a = np.random.randint(min_value, max_value, M*N)
    m_b = np.random.randint(min_value, max_value, N*O)
    m_c = np.zeros(M*O, dtype=int)

    for i in range(0,M):
        for j in range(0,N):
            for k in range(0,O):
                m_c[i*O+k] = (m_c[i*O+k] + m_a[i*N+j]*m_b[j*O+k]) % (2**32) # make sure it does correctly overflow as it should with the data types chosen.


    f.write('#ifndef __MAT_MUL_L1_H_' + str(n_bits) + '__\n#define __MAT_MUL_L1_H_' + str(n_bits) + '__\n\n')
    f.write('#define M_LENGTH %d\n\n' % M)
    f.write('#define N_LENGTH %d\n\n' % N)
    f.write('#define O_LENGTH %d\n\n' % O)
    f.write('typedef %s v_type;\n' % var_type)

    g.write('#ifndef __MAT_MUL_L2_H_' + str(n_bits) + '__\n#define __MAT_MUL_L2_H_' + str(n_bits) + '__\n\n')
    g.write('#define M_LENGTH %d\n\n' % M)
    g.write('#define N_LENGTH %d\n\n' % N)
    g.write('#define O_LENGTH %d\n\n' % O)
    g.write('typedef %s v_type;\n' % var_type)

    write_arr(f, 'm_a',   m_a,   var_type, M*N, "M_LENGTH*N_LENGTH", 1)
    write_arr(f, 'm_b',   m_b,   var_type, N*O, "N_LENGTH*O_LENGTH", 1)
    write_arr(f, 'm_c',   m_c,   "int32_t", M*O, "M_LENGTH*O_LENGTH", 1)

    write_arr(g, 'm_a',   m_a,   var_type, M*N, "M_LENGTH*N_LENGTH", 2)
    write_arr(g, 'm_b',   m_b,   var_type, N*O, "N_LENGTH*O_LENGTH", 2)
    write_arr(g, 'm_c',   m_c,   "int32_t", M*O, "M_LENGTH*O_LENGTH", 2)

    f.write('\n#endif\n')
    g.write('\n#endif\n')

    f.close()
    g.close()


if __name__=='__main__':

    import os
    folder = os.path.dirname(os.path.realpath(__file__))

    if(len(sys.argv) > 3):
        m_size = int(sys.argv[1])
        n_size = int(sys.argv[2])
        o_size = int(sys.argv[3])
    else:
        m_size = 32
        n_size = 32
        o_size = 32

    # print(m_size, n_size, o_size)

    gen_stimuli(folder+'/mul_data32', "int32_t", 32, -2**7, 2**7-1  ,m_size, n_size, o_size,0)
    gen_stimuli(folder+'/mul_data16', "int16_t", 16, -2**6, 2**6-1  ,m_size, n_size, o_size,0)
    gen_stimuli(folder+'/mul_data8' ,  "int8_t", 8, -2**3, 2**3-1   ,m_size, n_size, o_size,0)