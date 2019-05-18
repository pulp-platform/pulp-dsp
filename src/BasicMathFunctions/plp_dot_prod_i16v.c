/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_int32_scalar.c
 * Description:  32-bit integer scalar dot product
 *
 * $Date:        16. May 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 Xiaying Wang, IIS, ETH Zurich. All rights reserved.
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
 */

#include "plp_math.h"


/**
  @ingroup groupMath
 */


/**
  @addtogroup BasicDotProd
  @{
 */

/**
  @brief Vectorized dot product of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector [16 bit]
  @param[in]  pSrcB      points to the second input vector [16 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[out] result     output result returned here [32 bit]
  @return        none

  @par Exploiting SIMD instructions
       The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed on 32 bit vectors.
 */

void plp_dot_prod_i16v(
                         const int16_t * pSrcA,
                         const int16_t * pSrcB,
                         uint32_t blockSize,
                         int32_t * pRes) {
        uint32_t blkCnt;                               /* Loop counter */
        int32_t sum = 0;                          /* Temporary return variable */

#if defined(PLP_MATH_RISCY)

#if defined(PLP_MATH_LOOPUNROLL)

        for (blkCnt=0; blkCnt<(blockSize>>2); blkCnt++){

          v2s a0 = *((v2s*)((void*)(pSrcA+4*blkCnt)));
          v2s b0 = *((v2s*)((void*)(pSrcB+4*blkCnt)));
          v2s a1 = *((v2s*)((void*)(pSrcA+4*blkCnt+2)));
          v2s b1 = *((v2s*)((void*)(pSrcB+4*blkCnt+2)));
          sum = __SUMDOTP2(a0, b0, sum);
          sum = __SUMDOTP2(a1, b1, sum);



          //sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
          //sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
        }

        for (blkCnt=0; blkCnt<(blockSize%4U); blkCnt++){
          int16_t a = *((int16_t*)(pSrcA+4*(blockSize/4)+blkCnt));
          int16_t b = *((int16_t*)(pSrcB+4*(blockSize/4)+blkCnt));
          sum += a*b;
          //sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
        }

#else // PLP_MATH_LOOPUNROLL

        for (blkCnt=0; blkCnt<blockSize; blkCnt++){
          sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
        }

#endif // PLP_MATH_LOOPUNROLL

#else // PLP_MATH_RISCY

#if defined(PLP_MATH_IBEX)

#if defined (PLP_MATH_LOOPUNROLL)

        for (blkCnt=0; blkCnt<(blockSize>>1); blkCnt++){
          sum += (*pSrcA++) * (*pSrcB++);
          sum += (*pSrcA++) * (*pSrcB++);
        }

        for (blkCnt=0; blkCnt<(blockSize%2U); blkCnt++){
          sum += (*pSrcA++) * (*pSrcB++);
        }

#else // PLP_MATH_LOOPUNROLL

        for (blkCnt=0; blkCnt<blockSize; blkCnt++){
          sum += (*pSrcA++) * (*pSrcB++);
        }

#endif // PLP_MATH_LOOPUNROLL

#endif // PLP_MATH_IBEX

#endif // PLP_MATH_RISCY

        * pRes = sum;

}

/**
  @} end of BasicDotProd group
 */


