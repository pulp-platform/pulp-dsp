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

def write_arr(f, name, arr, var_type, length):

    f.write('#if defined(PLP_FFT_TABLES_I%s_%s) || defined(PLP_FFT_TABLES_I%s_%s)\n' % (16, length, 32, length))
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

if __name__=='__main__':

    f = open('SwapTable.c', 'w')
    
    f.write('#ifndef __FFT_SWAPTABLE_H__\n#define __FFT_SWAPTABLE_H__\n\n')
    f.write('#include \"rt/rt_api.h\"\n\n')
    f.write('#define PLP_FFT_TABLES_I16_256\n\n')

    lengths = np.array([128, 256, 512, 1024])

    for i in lengths:
        rangi = range(i)
        swaptable = np.zeros(i)

        for j in rangi:
            for k in range(int(np.log2(i))):
                swaptable[j] += ((j // (i // 2**(k+1))) % 2) * (2**k)

        write_arr(f, 'Swap_LUT', swaptable, 'uint16_t', i)
   

    
f.write('\n#endif\n')
    
f.close()
