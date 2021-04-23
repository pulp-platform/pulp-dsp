/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_add_i8.c
 * Description:  16-bit integer matrix addition glue code
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
  @ingroup groupMatrix
 */

/**
  @addtogroup MatAdd
  @{
 */

/**
  @brief Glue code for matrix addition of 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_add_i8(const int8_t *__restrict__ pSrcA,
                    const int8_t *__restrict__ pSrcB,
                    uint32_t M,
                    uint32_t N,
                    int8_t *__restrict__ pDst) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_add_i8s_rv32im(pSrcA, pSrcB, M, N, pDst);
    } else {
        plp_mat_add_i8s_xpulpv2(pSrcA, pSrcB, M, N, pDst);
    }
}

/**
  @} end of MatAdd group
 */
