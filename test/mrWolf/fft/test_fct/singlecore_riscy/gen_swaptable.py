#!/usr/bin/env python

import sys
import random
import numpy as np

def write_header(f, name, var_type, height, width):
    f.write('%s %s[%d];\n\n' % (var_type, name, length)) #RT_CL_DATA

def write_header_scalar(f, name, var_type, value):
    f.write('%s %s = %s;\n\n' % (var_type, name, value)) #RT_CL_DATA

def write_arr(f, name, arr, var_type, length):

    f.write('#if defined(PLP_FFT_TABLES_I%s_%s) || defined(PLP_FFT_TABLES_I%s_%s)\n' % (16, length, 32, length))
    f.write('RT_L2_DATA %s %s[%s] = {\n' % (var_type, name, length)) # RT_L2_DATA #RT_CL_DATA
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

    cfile = open('SwapTable.c', 'w')
    hfile = open('SwapTable.h', 'w')

    cfile.write('#include \"rt/rt_api.h\"\n#include \"SwapTable.h\"\n#include \"../config.h\"\n\n')
    hfile.write('#ifndef __FFT_SWAPTABLE_H__\n#define __FFT_SWAPTABLE_H__\n\n')
    hfile.write('#include \"rt/rt_api.h\"\n#include \"../config.h\"\n\n')
    
    lengths = np.array([128, 256, 512, 1024, 2048, 4096])

    for i in lengths:
        rangi = range(i)
        swaptable = np.zeros(i)

        for j in rangi:
            for k in range(int(np.log2(i))):
                swaptable[j] += ((j // (i // 2**(k+1))) % 2) * (2**k)

        write_arr(cfile, 'Swap_LUT', swaptable, 'uint16_t', i)
        hfile.write('#if defined(PLP_FFT_TABLES_I%s_%s) || defined(PLP_FFT_TABLES_I%s_%s)\n' % (16, i, 32, i))
        hfile.write('extern uint16_t Swap_LUT[%s];\n#endif\n\n' % (i))
   

    
hfile.write('\n#endif\n')
    
hfile.close()
cfile.close()
