/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_stride_i32p_xpulpv2.c
 * Description:  parallel 32-bit integer strided matrix fill for XPULPV2
 *
 * $Date:        strided matrix fill
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and Ubiversity of Bologna. All rights reserved.
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
  @ingroup MatFillStride
 */

/**
  @addtogroup MatFillStrideKernels
  @{
 */

/**
  @brief      Fill an MxN strided 32-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_mat_fill_stride_instance_i32 struct initialized by
                    plp_mat_fill_stride_i32_parallel
  @return     none
 */

void plp_mat_fill_stride_i32p_xpulpv2(void *args) {

    int core_id = rt_core_id();

    plp_mat_fill_stride_instance_i32 *a = (plp_mat_fill_stride_instance_i32 *)args;

    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t stride = a->stride;
    int32_t value = a->value;
    uint32_t nPE = a->nPE;
    int32_t *__restrict__ pDst = a->pDst;

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = core_id; m < M; m += nPE) {
        for (int n = 0; n < N; n++) {
            pDst[m * stride + n] = value;
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatFillStrideKernels group
*/
