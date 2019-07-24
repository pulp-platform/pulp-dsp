#ifndef __FFT_TWIDDLES_H__
#define __FFT_TWIDDLES_H__

#include "rt/rt_api.h"
#include "../config.h"

#if defined(PLP_FFT_TABLES_I8_128)
extern int8_t Twiddles_LUT[128];
#endif

#if defined(PLP_FFT_TABLES_I8_256)
extern int8_t Twiddles_LUT[256];
#endif

#if defined(PLP_FFT_TABLES_I8_512)
extern int8_t Twiddles_LUT[512];
#endif

#if defined(PLP_FFT_TABLES_I8_1024)
extern int8_t Twiddles_LUT[1024];
#endif

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

#if defined(PLP_FFT_TABLES_I32_256)
extern int32_t Twiddles_LUT[256];
#endif

#if defined(PLP_FFT_TABLES_I32_512)
extern int32_t Twiddles_LUT[512];
#endif

#if defined(PLP_FFT_TABLES_I32_1024)
extern int32_t Twiddles_LUT[1024];
#endif


#endif
