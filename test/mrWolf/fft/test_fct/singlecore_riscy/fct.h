#ifndef __FCT_H__
#define __FCT_H__

void Radix2FFT_DIF_args(int16_t *__restrict__ Data, short int *__restrict__ Twiddles, int N_FFT)
void SwapSamples_args(        v2s *__restrict__ Data,
                      int16_t *__restrict__ SwapTable ,
                      int32_t N_FFT)
#endif //__FCT_H__
