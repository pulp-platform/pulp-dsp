#ifndef __FCT_H__
#define __FCT_H__

void plp_cfft_i16(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, int32_t N_FFT);
void plp_cfft_i32(int32_t *__restrict__ Data, int32_t *__restrict__ Twiddles, int32_t N_FFT);
void SwapSamples_i16(int16_t *__restrict__ Data, int16_t *__restrict__ SwapTable, int32_t N_FFT);
void SwapSamples_i32(int32_t *__restrict__ Data, int16_t *__restrict__ SwapTable, int32_t N_FFT);

#endif //__FCT_H__
