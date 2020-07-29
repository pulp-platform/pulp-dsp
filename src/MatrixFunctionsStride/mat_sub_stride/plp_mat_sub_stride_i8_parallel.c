/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_sub_stride_i8_parallel.c
 * Description:  parallel 16-bit integer strided matrix subtraction glue code
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
  @ingroup groupMatrixStride
 */

/**
  @addtogroup MatSubStride
  @{
 */

/**
  @brief Glue code for parallel strided matrix subtraction of 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrid B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_sub_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    uint32_t nPE,
                                    int8_t *__restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {
        plp_mat_sub_stride_instance_i8 args = { .pSrcA = pSrcA,
                                                .pSrcB = pSrcB,
                                                .M = M,
                                                .N = N,
                                                .strideA = strideA,
                                                .strideB = strideB,
                                                .strideY = strideY,
                                                .nPE = nPE,
                                                .pDst = pDst };

        rt_team_fork(nPE, plp_mat_sub_stride_i8vp_xpulpv2, (void *)&args);
    }
}

/**
  @} end of MatSubStride group
 */
