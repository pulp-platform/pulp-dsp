/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_scale_i16s_rv32im.c
 * Description:  16-bit matrix scale kernel for RV32IM
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
  @ingroup MatScale
 */

/**
  @defgroup MatScaleKernels matrix scale Kernels
  <GROUP_DESCRIPTION>
 */

/**
  @addtogroup MatScaleKernels
  @{
 */

/**
  @brief matrix scale of 16-bit integer matrices kernel for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
 */


void plp_mat_scale_i16s_rv32im(const int16_t * __restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int16_t scaleFactor,
                               int32_t shift,
                               int16_t * __restrict__ pDst) {

#define BASIC_VERSION // if used don' forget to also use undefine at end of file
#ifdef BASIC_VERSION

    for(int m = 0; m < M; m++) {
        for(int n = 0; n < N; n++) {
            int32_t val = ((int32_t)pSrc[m * N + n]) * ((int32_t)scaleFactor);
            pDst[m * N + n] = (int16_t)(val >> shift);
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION

}

/**
   @} end of MatScaleKernels group
*/

