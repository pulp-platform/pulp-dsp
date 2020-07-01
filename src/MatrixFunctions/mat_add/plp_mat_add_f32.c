/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_add_f32.c
 * Description:  32-bit floating-point matrix addition glue code
 *
 * $Date:        1. July 2020
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
   @ingroup groupMatrix
 */

/**
  @addtogroup MatAdd
  @{
 */

/**
  @brief Glue code for matrix addition of 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  <PARALLEL_ARG_DOC>
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_add_f32(const float * __restrict__ pSrcA,
                     const float * __restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     float * __restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID){
        printf("Floating point is supported only for cluster side\n");
        return;
    }
    else{
        plp_mat_add_f32s_xpulpv2(pSrcA, pSrcB, M, N, pDst);
    }

}

/**
  @} end of MatAdd group
 */


