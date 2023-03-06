/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_f32s_rv32im.c
 * Description:  32-bit floating point scalar dot product kernel for RV32IM
 *
 * $Date:        21. October 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Xiaying Wang
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
  @brief Glue code for dot product of 32-bit float vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_dot_prod_f32s_rv32im(const float32_t *__restrict__ pSrcA,
                               const float32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               float32_t *__restrict__ pRes) {
  
  uint32_t blkCnt, tmpBS;     /* Loop counter, temporal BlockSize */
  float sum1 = 0, sum2 = 0; /* Temporary return variable */
  *pRes = 0.0f;

  #if defined(PLP_MATH_LOOPUNROLL)
    
    tmpBS = (blockSize >> 1);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
      sum1 += *(pSrcA++) * (*(pSrcB++));
      sum2 += *(pSrcA++) * (*(pSrcB++));
    }

    tmpBS = (blockSize % 2U);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
      sum1 += *(pSrcA++) * (*(pSrcB++));
    }

  #else 
  
      for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        sum1 += *(pSrcA++) * (*(pSrcB++));
      }

  #endif

  *pRes = sum1 + sum2;

  // for (int i = 0; i < blockSize; i++) {
  //   *pRes += *(pSrcA++) * (*(pSrcB++));
  // }
}

/**
   @} end of BasicDotProd group
*/
