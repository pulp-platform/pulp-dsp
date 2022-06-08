## TWIDDLES ##

## RADIX 2
#import cmath as C
#def rfft_twiddles(FFTLength: int):
#    N = FFTLength//2
#    twiddles = [C.exp(-1*C.pi*1j*k/N) for k in range(N)]
#    for i in range(N):
#        if not i%3:
#            print("\n    ", end='')
#        print("{"+" {: .8f}f, ".format(twiddles[i].real), end='')
#        print("{: .8f}f".format(twiddles[i].imag)+" },", end='')
#        print("  ", end='')
#    print("")
#rfft_twiddles(128)

# RADIX 4
#import cmath as C
#def cfft_twiddles(FFTLength: int):
#    N = FFTLength
#    twiddles = [C.exp(-2*C.pi*1j*k/N) for k in range(N)]
#    for i in range((int)(N)):
#        if not i%3:
#            print("\n    ", end='')
#        print("{"+" {: .8f}f, ".format(twiddles[i].real), end='')
#        print("{: .8f}f".format(twiddles[i].imag)+" },", end='')
#        print("  ", end='')
#    print("")
#cfft_twiddles(16)

# RADIX 8
#import cmath as C
#def cfft_twiddles(FFTLength: int):
#    N = FFTLength
#    twiddles = [C.exp(-2*C.pi*1j*k/N) for k in range(N)]
#    for i in range((int)(N)):
#        if not i%3:
#            print("\n    ", end='')
#        print("{"+" {: .8f}f, ".format(twiddles[i].real), end='')
#        print("{: .8f}f".format(twiddles[i].imag)+" },", end='')
#        print("  ", end='')
#    print("")
#cfft_twiddles(64)


## q16
#import math as M
#N = 65536
#PI = 3.14159265358979
#for i in range(0, (int)(3*N/4)):
#    twiddleCoefq15_cos = M.cos(i * 2*PI/N)
#    twiddleCoefq15_sin = M.sin(i * 2*PI/N)
#    if not i%5:
#        print("\n    ", end='')
#    print("(int16_t) 0x{:04X}, " .format(int(round(twiddleCoefq15_cos*(2**15)))&0xffff), end='')
#    print("(int16_t) 0x{:04X}, " .format(int(round(twiddleCoefq15_sin*(2**15)))&0xffff), end='')
#print("\n")

# RADIX 4
# 16, 256, 1024
#N = 16
#for i in range(1, N):
#    n1 = int(i/4)
#    n2 = int((i%4)/2)
#    n3 = i - 4*n1 - 2*n2
#    reversal = (4*n3 +2*n2 + n1)
#    if not i%16:
#        print("\n    ", end='')
#    print("{:2}".format(int(reversal)), end=', ')
#print("\n")



## BIT REVERSE ##

# RADIX 2
# 32, 128, 2048
# python script for generating these LUTs
# replace 9 with log(FFTLength) (both occurrances!)
# after pasting, use gqq in vim to separate onto different lines
#for i in range(2**7):
#    if not i%16:
#        print("\n    ", end='')
#    print(int("{:0>7}".format(bin(i)[2:])[::-1],2), end=', ')
#print("\n    ", end='')

# RADIX 4
# 16, 256, 1024
N = 2048
for i in range(N):
    reversal = 256*(i%4)+ 64*(int)((i%16)/4)+ 16*(int)((i%64)/16)+ 4*(int)((i%256)/64)+ 1*(int)(i/256)
#    reversal = 64*(i%4)+ 16*(int)((i%16)/4)+ 4*(int)((i%64)/16)+ 1*(int)(i/64)
#    reversal = 4*(i%4)+ 1*(int)(i/4)
    if not i%16:
        print("\n    ", end='')
    print("{:2}".format(int(reversal)), end=', ')

# RADIX 8 
# 512, 64
#N = 64
#for i in range(N):
#    #reversal = 64*(i%8)+ 8*(int)((i%64)/8)+ 1*(int)(i/64)
#    reversal = 8*(i%8)+ 1*(int)(i/8)
#    if not i%16:
#        print("\n    ", end='')
#    print("{:3}".format(int(reversal)), end=', ')
