/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_stride_i8.c
 * Description:  16-bit integer strided matrix fill glue code
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
  @ingroup groupMatrixStride
 */

/**
  @addtogroup MatFillStride
  @{
 */

/**
  @brief      Glue code for filling an MxN strided 8-bit integers matrix
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
 */

void plp_mat_fill_stride_i8(
    uint32_t M, uint32_t N, uint32_t stride, int8_t value, int8_t *__restrict__ pDst) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_fill_stride_i8s_rv32im(M, N, stride, value, pDst);
    } else {
        plp_mat_fill_stride_i8s_xpulpv2(M, N, stride, value, pDst);
    }
}

/**
  @} end of MatFillStride group
 */
