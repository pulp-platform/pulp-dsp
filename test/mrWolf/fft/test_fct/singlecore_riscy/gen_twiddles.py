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
import os
import random
import numpy as np

def write_header(f, name, var_type, height, width):
    f.write('%s %s[%d];\n\n' % (var_type, name, length)) #RT_CL_DATA

def write_header_scalar(f, name, var_type, value):
    f.write('%s %s = %s;\n\n' % (var_type, name, value)) #RT_CL_DATA

def write_arr(f, name, arr, n_bits, var_type, length):

    f.write('#if defined(PLP_FFT_TABLES_I%s_%s)\n' % (n_bits, length))
    f.write('RT_CL_DATA %s %s[%s] = {\n' % (var_type, name, length)) # RT_L2_DATA #RT_CL_DATA
    for i in range(0, length):
        v = arr[i]
        f.write('%d, ' % (v))
    f.write('\n')
    f.write('};\n')

    f.write('#endif\n\n')

    return

def write_scalar(f, name, value, var_type):
    f.write('%s %s = %d;\n\n' % (var_type, name, value)) # RT_L2_DATA # RT_CL_DATA
    return

################################################################################

def gen_twiddles(f, var_type, n_bits, length):
    
    twiddleCoef = np.empty(2*length//2)
    twiddleCoef_real = np.cos(np.arange(length//2) * 2*np.pi/length)*(2**(n_bits - 1) - 1)
    twiddleCoef_imag = -np.sin(np.arange(length//2) * 2*np.pi/length)*(2**(n_bits - 1) - 1)
    twiddleCoef[0:2*length//2-1:2] = twiddleCoef_real
    twiddleCoef[1:2*length//2:2] = twiddleCoef_imag
    twiddleCoef_q = np.empty(2*length//2, dtype='int'+str(n_bits))
    twiddleCoef_q = twiddleCoef.astype('int'+str(n_bits))

    #print(n_bits, length, np.min(twiddleCoef_q), np.max(twiddleCoef_q), 2**(n_bits-1))
        
    write_arr(f, 'Twiddles_LUT', twiddleCoef_q, n_bits, var_type, 2*length//2) 
        



if __name__=='__main__':

    file_name = 'TwiddleFactors.c'
    if os.path.exists(file_name):
        os.remove(file_name)

    f = open(file_name, 'a+')
    f.write('#ifndef __FFT_TWIDDLES_H__\n#define __FFT_TWIDDLES_H__\n\n')
    f.write('#include \"rt/rt_api.h\"\n\n')
    f.write('#define PLP_FFT_TABLES_I16_256\n\n')

    gen_twiddles(f, 'int8_t', 8, 128)
    gen_twiddles(f, 'int8_t', 8, 256)
    gen_twiddles(f, 'int8_t', 8, 512)
    gen_twiddles(f, 'int8_t', 8, 1024)
    
    gen_twiddles(f, 'int16_t', 16, 128)
    gen_twiddles(f, 'int16_t', 16, 256)
    gen_twiddles(f, 'int16_t', 16, 512)
    gen_twiddles(f, 'int16_t', 16, 1024)

    gen_twiddles(f, 'int32_t', 32, 128)
    gen_twiddles(f, 'int32_t', 32, 256)
    gen_twiddles(f, 'int32_t', 32, 512)
    gen_twiddles(f, 'int32_t', 32, 1024)

    f.write('\n#endif\n')

    f.close()
