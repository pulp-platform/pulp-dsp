/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_sub_stride_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer strided matrix subtraction for XPULPV2
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
  @ingroup MatSubStride
 */

/**
  @addtogroup MatSubStrideKernels
  @{
 */

/**
  @brief Parallel strided matrix subtraction of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_sub_stride_instance_i8 struct initialized by
  plp_mat_sub_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_stride_i8p_xpulpv2(void *args) {

    int core_id = rt_core_id();

    plp_mat_sub_stride_instance_i8 *a = (plp_mat_sub_stride_instance_i8 *)args;

    const int8_t *__restrict__ pSrcA = a->pSrcA;
    const int8_t *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t strideA = a->strideA;
    uint32_t strideB = a->strideB;
    uint32_t strideY = a->strideY;
    uint32_t nPE = a->nPE;
    int8_t *__restrict__ pDst = a->pDst;

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    uint32_t m, n; // loop counters

    for (m = 0; m < M; m++) {
        for (n = 0; n < N; n++) {
            pDst[m * strideY + n] = pSrcA[m * strideA + n] - pSrcB[m * strideB + n];
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatSubStrideKernels group
*/
