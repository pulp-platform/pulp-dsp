/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_q8p_xpulpv2.c
 * Description:  16-bit fixed point scalar dot product for XPULPV2 with interleaved access
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
  @brief Parallel dot product with interleaved access of 32-bit fixed point vectors kernel for
  XPULPV2 extension.
  @param[in]  S     points to the instance structure for fixed point parallel dot product
  @return        none
 */

void plp_dot_prod_q8p_xpulpv2(void *S) {

    int core_id = hal_core_id();

    plp_dot_prod_instance_q8 *args = (plp_dot_prod_instance_q8 *)S;

    int8_t *pSrcA = (int8_t *)(args->pSrcA);
    int8_t *pSrcB = (int8_t *)(args->pSrcB);
    uint32_t blkSizePE = args->blkSizePE;
    uint32_t deciPoint = args->deciPoint;
    uint32_t nPE = args->nPE;
    int32_t *resBufferPE = &(args->resBuffer[core_id]);

    // *NOTICE* here, we can do something better for performance, by splitting it more evenly.
    // If (blkSizePe / nPE) is odd, then each core will process (blkSizePe / nPE) - 1 elements.
    // This is due to verification reasons: FOr the non-parallel case, we always sum up two
    // temporary values, and then execute __ROUNDNORM_REG. To mimik this behavior, every core
    // (except the last one) will process an even number of elements. This way, the last core will
    // have to do more work, but the result of this function will identical to the result of the
    // singlecore implementation.
    // set the default block size
    uint32_t blkSize = (blkSizePE / nPE) & 0xFFFFFFFE; // the and makes sure the block size is even

    // set pSrcA and pSrcB to the correct location
    pSrcA += core_id * blkSize;
    pSrcB += core_id * blkSize;

    // set the block size for the last core
    if (core_id == nPE - 1) {
        blkSize = blkSizePE - (nPE - 1) * blkSize;
    }

    if (blkSize == 0) {
        *resBufferPE = 0;
        return;
    }

    int32_t i, sum = 0;

#if defined(PLP_MATH_LOOPUNROLL)

    for (i = 0; i < blkSize - 1; i += 8) {
        v4s a0 = *((v4s *)((void *)(pSrcA + i)));
        v4s b0 = *((v4s *)((void *)(pSrcB + i)));
        v4s a1 = *((v4s *)((void *)(pSrcA + i + 4)));
        v4s b1 = *((v4s *)((void *)(pSrcB + i + 4)));
        int32_t x0 = __DOTP4(a0, b0);
        int32_t x1 = __DOTP4(a1, b1);
        sum += __ADDROUNDNORM_REG(x0, x1, deciPoint);
    }

    if (i != blkSize) {
        sum += __ROUNDNORM_REG(pSrcA[i] * pSrcB[i], deciPoint);
    }

#else // PLP_MATH_LOOPUNROLL

    for (i = 0; i < blkSize; i++) {
        sum += __ROUNDNORM_REG(pSrcA[i] * pSrcB[i], deciPoint);
    }

#endif // PLP_MATH_LOOPUNROLL

    *resBufferPE = sum;
}

/**
   @} end of BasicDotProdKernels group
*/
