/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_trans_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer matrix transpose for XPULPV2
 *
 * $Date:        14. July 2020
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
  @ingroup MatTrans
 */

/**
  @addtogroup MatTransKernels
  @{
 */

/**
  @brief Parallel matrix transpose of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_trans_instance_i8 struct initialized by
                    plp_mat_trans_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_trans_i8p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_trans_instance_i8 *a = (plp_mat_trans_instance_i8 *)args;

    const int8_t *__restrict__ pSrc = a->pSrc;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t nPE = a->nPE;
    int8_t *__restrict__ pDst = a->pDst;

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = core_id; m < M; m += nPE) {
        for (int n = 0; n < N; n++) {
            pDst[n * M + m] = pSrc[m * N + n];
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatTransKernels group
*/
