/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_trans_f32s_xpulpv2.c
 * Description:  32-bit integer matrix multiplication for XPULPV2
 *
 * $Date:        18. July 2019
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
  @ingroup MatMultTrans
 */


/**
  @addtogroup MatMultTransKernels
  @{
 */

/**
  @brief Matrix multiplication of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix, stored transposed in memory
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[out] pDstC     points to the output matrix
  @return     none
 */

void plp_mat_mult_trans_f32s_xpulpv2(const float * __restrict__ pSrcA,
                                     const float * __restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     float * __restrict__ pDstC) {

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    uint32_t m, n, o;

    for(m = 0; m < M; m++){
        for(o = 0; o < O; o++){
            float sum = 0;
            for(n = 0; n < N; n++){
                sum = sum + pSrcA[m * N + n]*pSrcB[o * N + n];
            }
            pDstC[m * O + o] = sum;
        }
    }

#else 

    // TODO: Hackathon

#endif
#undef BASIC_VERSION

}


/**
   @} end of MatMultTransKernels group
*/
