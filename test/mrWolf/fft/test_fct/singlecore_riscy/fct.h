#ifndef __FCT_H__
#define __FCT_H__

typedef struct
{
  int16_t * Data;
  int16_t * Twiddles;
  uint16_t * SwapTable;
  uint32_t N_FFT;
  uint32_t nPE;
} plp_cfft_instance_i16;

typedef struct
{
  int32_t * Data;
  int32_t * Twiddles;
  uint16_t * SwapTable;
  uint32_t   N_FFT;
  uint32_t  nPE;
} plp_cfft_instance_i32;

void plp_cfft_i16(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, int32_t N_FFT);
void plp_cfft_i16_parallel(void * S);
void plp_cfft_i16_cplx(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, int32_t N_FFT);
void plp_cfft_i32(int32_t *__restrict__ Data, int32_t *__restrict__ Twiddles, int32_t N_FFT);
void plp_cfft_i32_parallel(void * S);
void SwapSamples_i16(int16_t *__restrict__ Data, int16_t *__restrict__ SwapTable, int32_t N_FFT);
void SwapSamples_i32(int32_t *__restrict__ Data, int16_t *__restrict__ SwapTable, int32_t N_FFT);

#endif //__FCT_H__
