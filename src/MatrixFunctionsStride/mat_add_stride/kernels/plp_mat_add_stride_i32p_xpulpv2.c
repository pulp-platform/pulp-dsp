/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_add_stride_i32p_xpulpv2.c
 * Description:  parallel 32-bit integer strided matrix addition for XPULPV2
 *
 * $Date:        strided matrix addition
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
  @brief Parallel strided matrix addition of 32-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_add_stride_instance_i32 struct initialized by
  plp_mat_add_stride_i32_parallel
  @return     none
 */

void plp_mat_add_stride_i32p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_add_stride_instance_i32 *a = (plp_mat_add_stride_instance_i32 *)args;

    const int32_t *__restrict__ pSrcA = a->pSrcA;
    const int32_t *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t strideA = a->strideA;
    uint32_t strideB = a->strideB;
    uint32_t strideY = a->strideY;
    uint32_t nPE = a->nPE;
    int32_t *__restrict__ pDst = a->pDst;

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
            int32_t a1 = *pSrcA++;
            int32_t a2 = *pSrcA++;
            int32_t b1 = *pSrcB++;
            int32_t b2 = *pSrcB++;
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
