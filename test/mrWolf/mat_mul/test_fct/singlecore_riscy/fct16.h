
#ifndef __FCT_H__
#define __FCT_H__

#include "rt/rt_api.h"
#include <stdint.h>

void plp_mat_mult_i16v_xpulpv2(
                              const int16_t * __restrict__ pSrcA,
                              const int16_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int16_t * __restrict__ pDstC);

#endif