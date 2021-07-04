/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_add_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer matrix addition for XPULPV2
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
  @brief Parallel matrix addition of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_add_instance_i8 struct initialized by
                    plp_mat_add_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_i8p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_add_instance_i8 *a = (plp_mat_add_instance_i8 *)args;

    const int8_t *__restrict__ pSrcA = a->pSrcA;
    const int8_t *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t nPE = a->nPE;
    int8_t *__restrict__ pDst = a->pDst;

    uint32_t i; // loop counters
    uint32_t total = M*N; // we can see it as a 1D operation
#if defined(PLP_MATH_LOOPUNROLL)
    // amount of elements per core, rounded up to next even number
    uint32_t per_core = ((total+nPE-1)/nPE + 7) & 0xFFFFFFF8;
    // compute the last element of the area each core has to process
    uint32_t upper_bound = (core_id+1)*per_core;
    // as we always rounded up before (to distribute the load as equal as possible) we need to check if the upper bound is still in our matrix
    if(upper_bound > total ) upper_bound = total;
    // loop over the area assigned to the core - the shift by one is for the loop unrolling
    for (i = core_id*(per_core>>3); i < (upper_bound>>3); i++) {
        *((v4s*)(pDst + 8*i    )) = __ADD4(*((v4s*)(pSrcA + 8*i    )), *((v4s*)(pSrcB + 8*i    )));
        *((v4s*)(pDst + 8*i + 4)) = __ADD4(*((v4s*)(pSrcA + 8*i + 4)), *((v4s*)(pSrcB + 8*i + 4)));
    }

    // to save the branch we just compute the possibly remaining element always and with all cores
    // might lead to wait cycles due to contention while writing the same element
    // possible improvement 1: last core has least work to do if there is a remaining element, make use of this
    // possible improvement 2: if the cores that don't compute flush the pipeline, it should not be a waste of time, make use of this
    *((v4s*)(pDst + total - 4)) = __ADD4(*((v4s*)(pSrcA + total - 4)), *((v4s*)(pSrcB + total - 4)));
    *((v4s*)(pDst + total - 8)) = __ADD4(*((v4s*)(pSrcA + total - 8)), *((v4s*)(pSrcB + total - 8)));
#else // No PLP_MATH_LOOPUNROLL
    // amount of elements per core, rounded up
    uint32_t per_core = (total+nPE-1)/nPE;
    // compute the last element of the area each core has to process
    uint32_t upper_bound = (core_id+1)*per_core;
    // as we always rounded up before (to distribute the load as equal as possible) we need to check if the upper bound is still in our matrix
    if(upper_bound > total ) upper_bound = total;
    // loop over the area assigned to the core
    for (i = core_id*per_core; i < upper_bound; i++) {
            pDst[i] = pSrcA[i] + pSrcB[i];
    }
#endif // PLP_MATH_LOOPUNROLL
}

/**
   @} end of MatAddKernels group
*/
