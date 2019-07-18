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
    
    f.write('RT_L2_DATA %s %s[%s] = {\n' % (var_type, name, length)) # RT_L2_DATA #RT_CL_DATA
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

def gen_stimuli(name, var_type, n_bits, min_value, max_value, length):
    f = open(name, 'w')
    
    x = np.random.randint(min_value, max_value, length, dtype='int'+str(n_bits))
    #x = np.concatenate((10*np.ones(256), np.zeros(256)))
    x_complex = np.zeros(length*2, dtype='int'+str(n_bits))
    x_complex[0:length*2-1:2] = x
    X = np.fft.fft(x)

    X_real = X.real.astype('int'+str(n_bits))
    X_imag = X.imag.astype('int'+str(n_bits))

    X_result = np.empty(2*length, dtype='int'+str(n_bits))

    X_result[0:2*length-1:2] = X_real
    X_result[1:2*length:2] = X_imag
    
    twiddleCoef = np.empty(2*length//2)
    twiddleCoef[0:2*length//2-1:2] = np.floor(np.cos(np.arange(length//2) * 2*np.pi/length)*2**(n_bits - 1) - 1)
    twiddleCoef[1:2*length//2:2] = -np.floor(np.sin(np.arange(length//2) * 2*np.pi/length)*2**(n_bits - 1))
    twiddleCoef_q = np.empty(2*length//2, dtype='int'+str(n_bits))
    twiddleCoef_q = twiddleCoef.astype('int'+str(n_bits))
    
    f.write('#ifndef __FFT_H_' + str(n_bits) + '__\n#define __FFT_H_' + str(n_bits) + '__\n\n')
    # f.write('#define LENGTH %d\n\n' % length)
    f.write('typedef %s v_type;\n' % var_type)
    #    f.write('unsigned int v_length = %s;\n' % str(length))
    
    write_arr(f, 'x',   x_complex,   var_type, length*2)
    write_arr(f, 'exp_result', X_result, var_type, length*2)
    write_arr(f, 'twiddleCoef_i' + str(n_bits) + '_' + str(length), twiddleCoef_q, var_type, 2*length//2) 
    
    #    f.write('%s dot_product(%s * v, %s * u, unsigned int n);\n' % (var_type, var_type, var_type))
    
    f.write('\n#endif\n')
    
    f.close()


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
    
    #file_name = sys.argv[1]
    #data_type = sys.argv[2]
    #n_bits = int(sys.argv[3])
    #min_value = int(sys.argv[4])
    #max_value = int(sys.argv[5])
    #v_len = int(sys.argv[6])

    gen_stimuli('fft_data_i16_128.h', 'int16_t', 16, -2**7 , 2**7-1 , 128)
    gen_stimuli('fft_data_i16_256.h', 'int16_t', 16, -2**7 , 2**7-1 , 256)
    gen_stimuli('fft_data_i16_512.h', 'int16_t', 16, -2**7 , 2**7-1 , 512)
    gen_stimuli('fft_data_i32_128.h', 'int32_t', 32, -2**15, 2**15-1, 128)
    gen_stimuli('fft_data_i32_256.h', 'int32_t', 32, -2**15, 2**15-1, 256)
    gen_stimuli('fft_data_i32_512.h', 'int32_t', 32, -2**15, 2**15-1, 512)
