/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i8p_xpulpv2.c
 * Description:  8-bit integer scalar dot product for XPULPV2 with interleaved access
 *
 * $Date:        06. Mar 2023
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Viviane Potocnik, ETH Zurich
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
  @brief Parallel dot product with interleaved access of 32-bit integer vectors kernel for XPULPV2
  extension.
  @param[in]  S     points to the instance structure for integer parallel dot product
  @return        none
 */

void plp_dot_prod_i8p_xpulpv2(void *S) {

    int8_t *pSrcA = (int8_t *)(((plp_dot_prod_instance_i8 *)S)->pSrcA) + hal_core_id() * 8;
    int8_t *pSrcB = (int8_t *)(((plp_dot_prod_instance_i8 *)S)->pSrcB) + hal_core_id() * 8;
    uint32_t blkSizePE = ((plp_dot_prod_instance_i8 *)S)->blkSizePE;
    uint32_t nPE = ((plp_dot_prod_instance_i8 *)S)->nPE;
    int32_t *resBufferPE = &(((plp_dot_prod_instance_i8 *)S)->resBuffer[hal_core_id()]);

    uint32_t blkCnt, tmpBS;     /* Loop counter, temporal BlockSize */
    int32_t sum1 = 0, sum2 = 0; /* Temporary return variable */

    // hal_team_barrier();

#if defined(PLP_MATH_LOOPUNROLL)

    tmpBS = (blkSizePE >> 3);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        v4s a0 = *((v4s *)((void *)(pSrcA + 8 * blkCnt * nPE))); 
        v4s b0 = *((v4s *)((void *)(pSrcB + 8 * blkCnt * nPE))); 
        v4s a1 = *((v4s *)((void *)(pSrcA + 8 * blkCnt * nPE + 4))); 
        v4s b1 = *((v4s *)((void *)(pSrcB + 8 * blkCnt * nPE + 4)));
        sum1 = __SUMDOTP4(a0, b0, sum1);
        sum2 = __SUMDOTP4(a1, b1, sum2);
    }

    tmpBS = (blkSizePE % 8U);

    // Code below is for non-multiple of 4
    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        int8_t a = *((int8_t *)(pSrcA + (8 * (blkSizePE / 8) + blkCnt) * nPE));
        int8_t b = *((int8_t *)(pSrcB + (8 * (blkSizePE / 8) + blkCnt) * nPE));
        sum1 += a * b;
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt = blkCnt + nPE) {
        sum1 = __MAC(sum1, pSrcA[blkCnt], pSrcB[blkCnt]);
    }

#endif // PLP_MATH_LOOPUNROLL

    *resBufferPE = sum1 + sum2;
}

/**
   @} end of BasicDotProdKernels group
*/
