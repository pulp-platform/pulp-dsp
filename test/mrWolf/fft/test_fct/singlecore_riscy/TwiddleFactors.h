#ifndef __FFT_TWIDDLES_H__
#define __FFT_TWIDDLES_H__

#include "rt/rt_api.h"
#include "../config.h"

#if defined(PLP_FFT_TABLES_I16_128)
extern int16_t Twiddles_LUT[128];
#endif

#if defined(PLP_FFT_TABLES_I16_256)
extern int16_t Twiddles_LUT[256];
#endif

#if defined(PLP_FFT_TABLES_I16_512)
extern int16_t Twiddles_LUT[512];
#endif

#if defined(PLP_FFT_TABLES_I16_1024)
extern int16_t Twiddles_LUT[1024];
#endif

#if defined(PLP_FFT_TABLES_I16_2048)
extern int16_t Twiddles_LUT[2048];
#endif

#if defined(PLP_FFT_TABLES_I16_4096)
extern int16_t Twiddles_LUT[4096];
#endif

#if defined(PLP_FFT_TABLES_I32_128)
extern int32_t Twiddles_LUT[128];
#endif

#if defined(PLP_FFT_TABLES_I32_256)
extern int32_t Twiddles_LUT[256];
#endif

#if defined(PLP_FFT_TABLES_I32_512)
extern int32_t Twiddles_LUT[512];
#endif

#if defined(PLP_FFT_TABLES_I32_1024)
extern int32_t Twiddles_LUT[1024];
#endif

#if defined(PLP_FFT_TABLES_I32_2048)
extern int32_t Twiddles_LUT[2048];
#endif

#if defined(PLP_FFT_TABLES_I32_4096)
extern int32_t Twiddles_LUT[4096];
#endif


#endif // __FFT_TWIDDLES_H__
