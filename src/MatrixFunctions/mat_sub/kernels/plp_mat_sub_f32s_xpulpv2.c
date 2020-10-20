/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_sub_f32s_xpulpv2.c
 * Description:  32-bit floating-point matrix subtraction for XPULPV2
 *
 * $Date:        1. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Tibor Schneider, ETH Zurich
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
  @ingroup MatSub
 */

/**
  @addtogroup MatSubKernels
  @{
 */

/**
  @brief matrix subtraction of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_sub_f32s_xpulpv2(const float *__restrict__ pSrcA,
                              const float *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              float *__restrict__ pDst) {

    uint32_t i; // loop counters
    uint32_t total = M*N; // we can see it as a 1D operation
#if defined(PLP_MATH_LOOPUNROLL)
    // loop over the matrix - the shift by one is for the loop unrolling
    for (i = 0; i < total>>1; i++) {
            pDst[2*i] = pSrcA[2*i] - pSrcB[2*i];
            pDst[2*i+1] = pSrcA[2*i+1] - pSrcB[2*i+1];
    }
    // to save the branch we just always compute the possibly remaining element
    pDst[total - 1] = pSrcA[total - 1] - pSrcB[total - 1];
#else // No PLP_MATH_LOOPUNROLL
    for (i = 0; i < total; i++) {
            pDst[i] = pSrcA[i] - pSrcB[i];
    }

#endif // PLP_MATH_LOOPUNROLL
}

/**
   @} end of MatSubKernels group
*/
