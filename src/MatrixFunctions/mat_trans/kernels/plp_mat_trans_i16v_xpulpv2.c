/** =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_trans_i16v_xpulpv2.c
 * Description:  16-bit integer matrix transpose for XPULPV2
 *
 * $Date:        14. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/**
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
  @ingroup MatTrans
 */


/**
  @addtogroup MatTransKernels
  @{
 */

/**
  @brief matrix transpose of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
 */

void plp_mat_trans_i16v_xpulpv2(const int16_t* __restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int16_t* __restrict__ pDst) {

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = 0; m < M; m++) {
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
