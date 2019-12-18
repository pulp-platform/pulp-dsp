/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i8s_rv32im.c
 * Description:  8-bit integer scalar dot product for RV32IM
 *
 * $Date:        16. May 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Xiaying Wang, ETH Zurich
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
  @ingroup BasicDotProd
 */


/**
  @addtogroup BasicDotProdKernels
  @{
 */

/**
  @brief Scalar dot product of 8-bit integer vectors kernel for RV32IM extension.
  @param[in]  pSrcA      points to the first input vector [8] bit]
  @param[in]  pSrcB      points to the second input vector [8 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[out] pRes     output result returned here [32 bit]
  @return        none

  @par Exploiting SIMD instructions
  When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
 */

void plp_dot_prod_i8s_rv32im(
                             const int8_t * __restrict__ pSrcA,
                             const int8_t * __restrict__ pSrcB,
                             uint32_t blockSize,
                             int32_t * __restrict__ pRes){
        uint32_t blkCnt;                               /* Loop counter */
        int32_t sum = 0;                          /* Temporary return variable */


#if defined (PLP_MATH_LOOPUNROLL)

        for (blkCnt=0; blkCnt<(blockSize>>2); blkCnt++){
          sum += (*pSrcA++) * (*pSrcB++);
          sum += (*pSrcA++) * (*pSrcB++);
          sum += (*pSrcA++) * (*pSrcB++);
          sum += (*pSrcA++) * (*pSrcB++);
        }

        for (blkCnt=0; blkCnt<(blockSize%4U); blkCnt++){
          sum += (*pSrcA++) * (*pSrcB++);
        }

#else // PLP_MATH_LOOPUNROLL

        for (blkCnt=0; blkCnt<blockSize; blkCnt++){
          sum += (*pSrcA++) * (*pSrcB++);
        }

#endif // PLP_MATH_LOOPUNROLL

        * pRes = sum;

}

/**
  @} end of BasicDotProdKernels group
 */


