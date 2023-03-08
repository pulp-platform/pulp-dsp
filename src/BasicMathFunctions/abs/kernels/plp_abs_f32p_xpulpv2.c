/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mult_f32p_xpulpv2.c
 * Description:  32-bit floating-point multiplication for XPULPV2 with interleaved access
 *
 * $Date:        06. Mar 2023
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna.
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
  @ingroup BasicMult
 */

/**
  @addtogroup BasicMultKernels
  @{
 */

/**
  @brief Parallel multiplication with interleaved access of 32-bit float vectors kernel for XPULPV2
  extension.
  @param[in]  S     points to the instance structure for float parallel multiplication
  @return        none
 */

void plp_abs_f32p_xpulpv2(void *S) {

    float32_t *pSrcA = (float32_t *)(((plp_abs_instance_f32 *)S)->pSrcA) + hal_core_id();
    uint32_t blkSizePE = ((plp_abs_instance_f32 *)S)->blkSizePE;
    uint32_t nPE = ((plp_abs_instance_f32 *)S)->nPE;
    float32_t *pDst = (float32_t *)(((plp_abs_instance_f32 *)S)->pDst) + hal_core_id();

    uint32_t blkCnt, tmpBS; /* Loop counter, temporal BlockSize */
    // float32_t sum1 = 0, sum2=0;                          /* Temporary return variable */

    /* #if defined(PLP_MATH_LOOPUNROLL) */
    /* #undef PLP_MATH_LOOPUNROLL */
    /* #endif */

    /* #if defined(PLP_MATH_LOOPUNROLL) */

    /*         tmpBS = (blkSizePE>>1); */
    /*         uint32_t tmpIdx = 2*nPE; */

    /*         for (blkCnt=0; blkCnt<tmpBS; blkCnt++){ */
    /*           //printf("blkCnt %d, tmpIdx*blkCnt %d\n", blkCnt, tmpIdx*blkCnt); */
    /*           sum1 += pSrcA[tmpIdx*blkCnt] * pSrcB[tmpIdx*blkCnt]; */
    /*           sum2 += pSrcA[tmpIdx*blkCnt + nPE] * pSrcB[tmpIdx*blkCnt + nPE]; */
    /*         } */

    /* #else // PLP_MATH_LOOPUNROLL */

    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt++) {
        pDst[nPE * blkCnt] = fabs(pSrcA[nPE * blkCnt]);
    }

    /* #endif // PLP_MATH_LOOPUNROLL */

    //* resBufferPE = sum1 + sum2;

    // printf("resBufferPE %d, core id %d\n", *resBufferPE, rt_core_id());
}

/* #define PLP_MATH_LOOPUNROLL */

/**
   @} end of BasicMultKernels group
*/
