/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_copy_stride_i8s_xpulpv2.c
 * Description:  8-bit integer strided matrix copy for XPULPV2
 *
 * $Date:        17. July 2020
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
  @brief      Copy an MxN strided 8-bit integers matrix on XpulpV2
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
 */

void plp_mat_copy_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     int8_t *__restrict__ pDst) {

//#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = 0; m < M; m++) {
        for (int n = 0; n < N; n++) {
            pDst[m * strideDst + n] = pSrc[m * strideSrc + n];
        }
    }

#else

    unsigned int m;
    unsigned int n;

    unsigned int n_iter = N >> 2;
    unsigned int n_rem = N & 0x00000003;

    for (m = 0; m < M; m++) {
        for (n = 0; n < n_iter; n++) {
            *((int32_t *)pDst) = *((int32_t *)pSrc);
            pDst += 4;
            pSrc += 4;
        }
        for (n = 0; n < n_rem; n++) {
            *pDst++ = *pSrc++;
        }
        pSrc += strideSrc - N;
        pDst += strideDst - N;
    }

#endif
    //#undef BASIC_VERSION
}
/**
   @} end of MatCopyStrideKernels group
*/
