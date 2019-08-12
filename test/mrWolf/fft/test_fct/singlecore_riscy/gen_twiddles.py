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
    f.write('RT_L2_DATA %s %s[%s] = {\n' % (var_type, name, length)) # RT_L2_DATA #RT_CL_DATA
    for i in range(0, length):
        v = arr[i]
        f.write('%d, ' % (v))
    f.write('\n')
    f.write('};\n')

    f.write('#endif\n\n')

    return

def write_arr_decl(f, name, n_bits, var_type, length):

    f.write('#if defined(PLP_FFT_TABLES_I%s_%s)\n' % (n_bits, length))
    f.write('extern %s %s[%s];\n' % (var_type, name, length)) # RT_L2_DATA #RT_CL_DATA
    f.write('#endif\n\n')

    return

def write_scalar(f, name, value, var_type):
    f.write('%s %s = %d;\n\n' % (var_type, name, value)) # RT_L2_DATA # RT_CL_DATA
    return

################################################################################

def gen_twiddles(cfile, hfile, var_type, n_bits, length):
    
    twiddleCoef = np.empty(2*length//2)
    twiddleCoef_real = np.cos(np.arange(length//2) * 2*np.pi/length)*(2**(n_bits - 1) - 1)
    twiddleCoef_imag = -np.sin(np.arange(length//2) * 2*np.pi/length)*(2**(n_bits - 1) - 1)
    twiddleCoef[0:2*length//2-1:2] = twiddleCoef_real
    twiddleCoef[1:2*length//2:2] = twiddleCoef_imag
    twiddleCoef_q = np.empty(2*length//2, dtype='int'+str(n_bits))
    twiddleCoef_q = twiddleCoef.astype('int'+str(n_bits))

    #print(n_bits, length, np.min(twiddleCoef_q), np.max(twiddleCoef_q), 2**(n_bits-1))
        
    write_arr(cfile, 'Twiddles_LUT', twiddleCoef_q, n_bits, var_type, 2*length//2)
    write_arr_decl(hfile, 'Twiddles_LUT', n_bits, var_type, 2*length//2)


if __name__=='__main__':

    n_bits = [16, 32]
    lengths = [128, 256, 512, 1024, 2048, 4096];
    
    cfile_name = 'TwiddleFactors.c'
    if os.path.exists(cfile_name):
        os.remove(cfile_name)

    hfile_name = 'TwiddleFactors.h'
    if os.path.exists(hfile_name):
        os.remove(hfile_name)

    cfile = open(cfile_name, 'a+')
    hfile = open(hfile_name, 'a+')
    hfile.write('#ifndef __FFT_TWIDDLES_H__\n#define __FFT_TWIDDLES_H__\n\n')
    cfile.write('#include \"rt/rt_api.h\"\n#include \"TwiddleFactors.h\"\n#include \"../config.h\"\n\n')
    hfile.write('#include \"rt/rt_api.h\"\n#include \"../config.h\"\n\n')

    for n in n_bits:
        for l in lengths:
            gen_twiddles(cfile, hfile, 'int' + str(n) + '_t', n, l)


    hfile.write('\n#endif // __FFT_TWIDDLES_H__\n')

    hfile.close()
    cfile.close()
