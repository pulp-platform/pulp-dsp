
#ifndef __FCT_H__
#define __FCT_H__

#include <stdint.h>

void plp_mat_fma_i16s_rv32im(
                              const int16_t * __restrict__ pSrcA,
                              const int16_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC);

#endif