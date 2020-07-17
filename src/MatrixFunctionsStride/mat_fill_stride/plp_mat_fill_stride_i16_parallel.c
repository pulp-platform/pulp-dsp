/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_stride_i16_parallel.c
 * Description:  parallel 16-bit integer strided matrix fill glue code
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
  @brief      Glue code for filling an MxN strided 16-bit integers matrix in parallel
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for processing
  @param[out] pSrc   Points to the output matrix
  @return     none
 */

void plp_mat_fill_stride_i16_parallel(uint32_t M,
                                      uint32_t N,
                                      uint32_t stride,
                                      int16_t value,
                                      uint32_t nPE,
                                      int16_t *__restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {
        plp_mat_fill_stride_instance_i16 args = {
            .M = M, .N = N, .stride = stride, .value = value, .nPE = nPE, .pDst = pDst
        };

        rt_team_fork(nPE, plp_mat_fill_stride_i16vp_xpulpv2, (void *)&args);
    }
}

/**
  @} end of MatFillStride group
 */
