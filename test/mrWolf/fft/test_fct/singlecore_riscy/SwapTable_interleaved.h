#ifndef __FFT_SWAPTABLE_INTERLEAVED_H__
#define __FFT_SWAPTABLE_INTERLEAVED_H__

#include "rt/rt_api.h"
#include "../config.h"

#if defined(PLP_FFT_TABLES_I16_128) || defined(PLP_FFT_TABLES_I32_128)
extern uint16_t Swap_LUT[113];
#endif

#if defined(PLP_FFT_TABLES_I16_256) || defined(PLP_FFT_TABLES_I32_256)
extern uint16_t Swap_LUT[241];
#endif

#if defined(PLP_FFT_TABLES_I16_512) || defined(PLP_FFT_TABLES_I32_512)
extern uint16_t Swap_LUT[481];
#endif

#if defined(PLP_FFT_TABLES_I16_1024) || defined(PLP_FFT_TABLES_I32_1024)
extern uint16_t Swap_LUT[993];
#endif

#if defined(PLP_FFT_TABLES_I16_2048) || defined(PLP_FFT_TABLES_I32_2048)
extern uint16_t Swap_LUT[1985];
#endif

#if defined(PLP_FFT_TABLES_I16_4096) || defined(PLP_FFT_TABLES_I32_4096)
extern uint16_t Swap_LUT[4033];
#endif


#endif
