/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_trans_f32_parallel.c
 * Description:  parallel 32-bit integer matrix multiplication glue code
 *
 * $Date:        18. July 2019
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
  @addtogroup MatMultTrans
  @{
 */

/**
  @brief Glue code for parallel matrix mutliplication of 32-bit floating-point matrices.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix, stored transposed in memory
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[in]  nPE       Number of cores to use
  @param[out] pDstC     points to the output matrix
  @return     none
 */

void plp_mat_mult_trans_f32_parallel(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     float *__restrict__ pDstC) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("parallel and floating-point processing supported only for cluster side\n");
        return;
    } else {
        plp_mat_mult_instance_f32 args = {
            .pSrcA = pSrcA, .pSrcB = pSrcB, .M = M, .N = N, .O = O, .nPE = nPE, .pDstC = pDstC
        };
        rt_team_fork(nPE, plp_mat_mult_trans_f32p_xpulpv2, (void *)&args);
    }
}

/**
  @} end of MatMultTrans group
 */
