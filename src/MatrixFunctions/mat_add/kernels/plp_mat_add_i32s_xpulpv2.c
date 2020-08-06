/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_add_i32s_xpulpv2.c
 * Description:  32-bit integer matrix addition for XPULPV2
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
  @ingroup MatAdd
 */

/**
  @addtogroup MatAddKernels
  @{
 */

/**
  @brief matrix addition of 32-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_add_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              int32_t *__restrict__ pDst) {

//#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    uint32_t m, n; // loop counters

    for (m = 0; m < M; m++) {
        for (n = 0; n < N; n++) {
            pDst[m * N + n] = pSrcA[m * N + n] + pSrcB[m * N + n];
        }
    }

#else

    // Switch dimensions if necessary.
    uint32_t Mloc, Nloc;
    if (M > N) {
        Mloc = N;
        Nloc = M;
    } else {
        Mloc = M;
        Nloc = N;
    }

    uint32_t m, n;
    uint32_t N2 = Nloc >> 1;

    // The regular part.
    for (m = 0; m < Mloc; m++) {
        uint32_t mN = m * Nloc;
        uint32_t i0 = mN;
        uint32_t i1 = mN + 1;
        for (n = 0; n < N2; n++) {
            pDst[i0] = pSrcA[i0] + pSrcB[i0];
            pDst[i1] = pSrcA[i1] + pSrcB[i1];
            i0 += 2;
            i1 += 2;
        }
    }

    // The irregular part.
    if (Nloc & 0x1) {
        uint32_t M2 = Mloc >> 1;
        uint32_t i0 = Nloc - 1;
        uint32_t i1 = i0 + Nloc;
        for (m = 0; m < M2; m++) {
            pDst[i0] = pSrcA[i0] + pSrcB[i0];
            pDst[i1] = pSrcA[i1] + pSrcB[i1];
            i0 += 2 * Nloc;
            i1 += 2 * Nloc;
        }
        if (Mloc & 0x1) {
            uint32_t i = i1 - Nloc;
            pDst[i] = pSrcA[i] + pSrcB[i];
        }
    }

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatAddKernels group
*/
