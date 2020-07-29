/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_scale_stride_f32s_xpulpv2.c
 * Description:  32-bit floating-point strided matrix scale for XPULPV2
 *
 * $Date:        6. July 2020
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
  @ingroup MatScaleStride
 */

/**
  @addtogroup MatScaleStrideKernels
  @{
 */

/**
  @brief strided matrix scale of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride of input matrix (elements between each row)
  @param[in]  strideDst   Stride of output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[out] pDst        Points to the output matrix
  @return     none
 */

void plp_mat_scale_stride_f32s_xpulpv2(const float *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       float scaleFactor,
                                       float *__restrict__ pDst) {

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = 0; m < M; m++) {
        for (int n = 0; n < N; n++) {
            float val = pSrc[m * strideSrc + n] * scaleFactor;
            pDst[m * strideDst + n] = val;
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatScaleStrideKernels group
*/
