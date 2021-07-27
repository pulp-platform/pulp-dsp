/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_sub_i16p_xpulpv2.c
 * Description:  parallel 16-bit integer matrix subtraction for XPULPV2
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
  @brief Parallel matrix subtraction of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_sub_instance_i16 struct initialized by
                    plp_mat_sub_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_i16p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_sub_instance_i16 *a = (plp_mat_sub_instance_i16 *)args;

    const int16_t *__restrict__ pSrcA = a->pSrcA;
    const int16_t *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t nPE = a->nPE;
    int16_t *__restrict__ pDst = a->pDst;

    uint32_t i; // loop counters
    uint32_t total = M*N; // we can see it as a 1D operation
#if defined(PLP_MATH_LOOPUNROLL)
    // amount of elements per core, rounded up to next even number
    uint32_t per_core = ((total+nPE-1)/nPE + 3) & 0xFFFFFFFC;
    // compute the last element of the area each core has to process
    uint32_t upper_bound = (core_id+1)*per_core;
    // as we always rounded up before (to distribute the load as equal as possible) we need to check if the upper bound is still in our matrix
    if(upper_bound > total ) upper_bound = total;
    // loop over the area assigned to the core - the shift by one is for the loop unrolling
    for (i = core_id*(per_core>>2); i < (upper_bound>>2); i++) {
        *((v2s*)(pDst + 4*i    )) = __SUB2(*((v2s*)(pSrcA + 4*i    )), *((v2s*)(pSrcB + 4*i    )));
        *((v2s*)(pDst + 4*i + 2)) = __SUB2(*((v2s*)(pSrcA + 4*i + 2)), *((v2s*)(pSrcB + 4*i + 2)));
    }

    // to save the branch we just compute the possibly remaining element always and with all cores
    // might lead to wait cycles due to contention while writing the same element
    // possible improvement 1: last core has least work to do if there is a remaining element, make use of this
    // possible improvement 2: if the cores that don't compute flush the pipeline, it should not be a waste of time, make use of this
    *((v2s*)(pDst + total - 2)) = __SUB2(*((v2s*)(pSrcA + total - 2)), *((v2s*)(pSrcB + total - 2)));
    *((v2s*)(pDst + total - 4)) = __SUB2(*((v2s*)(pSrcA + total - 4)), *((v2s*)(pSrcB + total - 4)));
#else // No PLP_MATH_LOOPUNROLL
    // amount of elements per core, rounded up
    uint32_t per_core = (total+nPE-1)/nPE;
    // compute the last element of the area each core has to process
    uint32_t upper_bound = (core_id+1)*per_core;
    // as we always rounded up before (to distribute the load as equal as possible) we need to check if the upper bound is still in our matrix
    if(upper_bound > total ) upper_bound = total;
    // loop over the area assigned to the core
    for (i = core_id*per_core; i < upper_bound; i++) {
            pDst[i] = pSrcA[i] - pSrcB[i];
    }
#endif // PLP_MATH_LOOPUNROLL
}

/**
   @} end of MatSubKernels group
*/
