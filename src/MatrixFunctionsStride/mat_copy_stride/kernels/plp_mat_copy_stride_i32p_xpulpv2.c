/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_copy_stride_i32p_xpulpv2.c
 * Description:  parallel 32-bit integer strided matrix copy for XPULPV2
 *
 * $Date:        strided matrix copy
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
  @ingroup MatCopyStride
 */

/**
  @addtogroup MatCopyStrideKernels
  @{
 */

/**
  @brief      Copy an MxN strided 32-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_mat_copy_stride_instance_i32 struct initialized by
                    plp_mat_copy_stride_i32_parallel
  @return     none
 */

void plp_mat_copy_stride_i32p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_copy_stride_instance_i32 *a = (plp_mat_copy_stride_instance_i32 *)args;

    const int32_t *__restrict__ pSrc = a->pSrc;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t strideSrc = a->strideSrc;
    uint32_t strideDst = a->strideDst;
    uint32_t nPE = a->nPE;
    int32_t *__restrict__ pDst = a->pDst;

//#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = core_id; m < M; m += nPE) {
        for (int n = 0; n < N; n++) {
            pDst[m * strideDst + n] = pSrc[m * strideSrc + n];
        }
    }

#else

    unsigned int m;
    unsigned int n;

    pSrc += strideSrc * core_id;
    pDst += strideDst * core_id;

    unsigned int src_offset = (strideSrc * nPE) - N;
    unsigned int dst_offset = (strideDst * nPE) - N;

    unsigned int n_iter = N >> 1;
    unsigned int n_rem = N & 0x00000001;

    for (m = core_id; m < M; m += nPE) {
        for (n = 0; n < n_iter; n++) {
            *pDst++ = *pSrc++;
            *pDst++ = *pSrc++;
        }
        if (n_rem) {
            *pDst++ = *pSrc++;
        }
        pSrc += src_offset;
        pDst += dst_offset;
    }

#endif
    //#undef BASIC_VERSION
}

/**
   @} end of MatCopyStrideKernels group
*/
