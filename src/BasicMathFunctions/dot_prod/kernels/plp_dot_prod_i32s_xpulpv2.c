/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i32s_xpulpv2.c
 * Description:  32-bit integer scalar dot product for XPULPV2
 *
 * $Date:        16. May 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. 
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
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
  @brief Scalar dot product of 32-bit integer vectors kernel for XPULPV2 extension.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_dot_prod_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               int32_t *__restrict__ pRes) {
    uint32_t blkCnt, tmpBS;     /* Loop counter, temporal BlockSize */
    int32_t sum1 = 0, sum2 = 0; /* Temporary return variable */

#if defined(PLP_MATH_LOOPUNROLL)

    tmpBS = (blockSize >> 1);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        sum1 = __MAC(sum1, (*pSrcA++), (*pSrcB++));
        sum2 = __MAC(sum2, (*pSrcA++), (*pSrcB++));
    }

    tmpBS = (blockSize % 2U);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        sum1 = __MAC(sum1, (*pSrcA++), (*pSrcB++));
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        sum1 = __MAC(sum1, (*pSrcA++), (*pSrcB++));
    }

#endif // PLP_MATH_LOOPUNROLL

    *pRes = sum1 + sum2;
}

/**
   @} end of BasicDotProdKernels group
*/
