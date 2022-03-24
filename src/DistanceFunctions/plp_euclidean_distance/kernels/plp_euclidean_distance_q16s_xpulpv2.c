/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_q16s_xpulpv2.c
 * Description:  16-bit fixed point vectorized Euclidean distance for XPULPV2
 *
 * $Date:        21. Mar 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Marco Bertuletti, ETH Zurich
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */

#include "plp_math.h"

/**
  @ingroup DistanceFunctions
 */

/**
  @defgroup Euclidean distance
  Euclidean distance
 */

/**
  @addtogroup Euclidean
  @{
 */

/**
  @brief Euclidean distance of 16-bit fixed point vectors kernel for XPULPV2.
  @param[in]  pSrcA      points to the first input vector [16 bit]
  @param[in]  pSrcB      points to the second input vector [16 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits  decimal point for right shift
  @param[out] pRes     output result returned here [32 bit]
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two by two into 32 bit vectors and then the sums and prducts are
  performed simultaneously on 32 bit vectors, with 32 bit accumulator.
 */

void plp_euclidean_distance_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t fracBits,
                               int32_t *__restrict__ pRes) {

    uint32_t blkCnt, tmpBS, remBS; /* Loop counter, temporal BlockSize */
    int32_t sum = 0;
    //  int32_t sum1 = 0, sum2 = 0;                          /* Temporary return variable */

#if defined(PLP_MATH_LOOPUNROLL)

    tmpBS = (blockSize >> 2);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {

        v2s a0 = *((v2s *)((void *)(pSrcA + 4 * blkCnt)));
        v2s b0 = *((v2s *)((void *)(pSrcB + 4 * blkCnt)));
        v2s a1 = *((v2s *)((void *)(pSrcA + 4 * blkCnt + 2)));
        v2s b1 = *((v2s *)((void *)(pSrcB + 4 * blkCnt + 2)));
        a0 = __SUB2(a0, b0);
        a1 = __SUB2(a1, b1);        
        int32_t tmp0 = __DOTP2(a0, a0);
        int32_t tmp1 = __DOTP2(a1, a1);
        sum += __ADDROUNDNORM_REG(tmp0, tmp1, fracBits);
    }

    remBS = (blockSize % 4U);

    for (blkCnt = 0; blkCnt < remBS; blkCnt++) {
        int16_t a = *(pSrcA + 4 * tmpBS + blkCnt);
        int16_t b = *(pSrcB + 4 * tmpBS + blkCnt);
        int16_t tmp = a - b;
        sum += __ROUNDNORM_REG(tmp*tmp, fracBits);
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        int16_t tmp = *(pSrcA ++) - *(pSrcB ++);
        sum += __ROUNDNORM_REG(tmp*tmp, fracBits);
    }

#endif // PLP_MATH_LOOPUNROLL

    plp_sqrt_q32(&sum, fracBits, pRes);
}

/**
   @} end of BasicDotProdKernels group
*/
