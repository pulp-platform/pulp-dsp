/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i16_parallel.c
 * Description:  parallel 16-bit integer matrix multiplication glue code
 *
 * $Date:        18. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Tom Kuchler, ETH Zurich
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
  @addtogroup BasicMatMult
  @{
 */

/**
  @brief Glue code for parallel matrix mutliplication of 16-bit integer matrices.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[in]  nPE        Number of cores to use
  @param[out] pDstC     points to the output matrix
  @return     none
 */

void plp_mat_mult_i16_parallel(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t nPE,
                               int32_t *__restrict__ pDstC) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {
        plp_mat_mult_instance_i16 args = {
            .pSrcA = pSrcA, .pSrcB = pSrcB, .M = M, .N = N, .O = O, .nPE = nPE, .pDstC = pDstC
        };
        hal_cl_team_fork(nPE, plp_mat_mult_i16p_xpulpv2, (void *)&args);
    }
}

/**
  @} end of BasicMatMult group
 */
