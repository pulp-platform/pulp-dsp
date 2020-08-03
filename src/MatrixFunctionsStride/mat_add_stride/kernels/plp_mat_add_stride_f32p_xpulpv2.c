/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_add_stride_f32p_xpulpv2.c
 * Description:  parallel 32-bit floating-point strided matrix addition for XPULPV2
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
  @ingroup MatAddStride
 */

/**
  @addtogroup MatAddStrideKernels
  @{
 */

/**
   @brief Parallel strided matrix addition of 32-bit floating-point matrices kernel for XPULPV2
   extension.
   @param[in]  args      pointer to plp_mat_add_stride_instance_f32 struct initialized by
   plp_mat_add_stride_f32_parallel
   @return     none
*/

void plp_mat_add_stride_f32p_xpulpv2(void *args) {

    int core_id = rt_core_id();

    plp_mat_add_stride_instance_f32 *a = (plp_mat_add_stride_instance_f32 *)args;

    const float *__restrict__ pSrcA = a->pSrcA;
    const float *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t strideA = a->strideA;
    uint32_t strideB = a->strideB;
    uint32_t strideY = a->strideY;
    uint32_t nPE = a->nPE;
    float *__restrict__ pDst = a->pDst;

//#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    uint32_t m, n; // loop counters

    for (m = core_id; m < M; m += nPE) {
        for (n = 0; n < N; n++) {
            pDst[m * strideY + n] = pSrcA[m * strideA + n] + pSrcB[m * strideB + n];
        }
    }

#else

    uint32_t m, n; // loop counters

    unsigned int n_iter = N >> 1;
    unsigned int n_rem = N & 0x1;

    pSrcA += strideA * core_id;
    pSrcB += strideB * core_id;
    pDst += strideY * core_id;

    unsigned int step_a = strideA * nPE - N;
    unsigned int step_b = strideB * nPE - N;
    unsigned int step_y = strideY * nPE - N;

    for (m = core_id; m < M; m += nPE) {
        for (n = 0; n < n_iter; n++) {
            float a1 = *pSrcA++;
            float a2 = *pSrcA++;
            float b1 = *pSrcB++;
            float b2 = *pSrcB++;
            *pDst++ = a1 + b1;
            *pDst++ = a2 + b2;
        }
        if (n_rem) {
            *pDst++ = *pSrcA++ + *pSrcB++;
        }
        pSrcA += step_a;
        pSrcB += step_b;
        pDst += step_y;
    }

#endif
    //#undef BASIC_VERSION
}

/**
   @} end of MatAddStrideKernels group
*/
