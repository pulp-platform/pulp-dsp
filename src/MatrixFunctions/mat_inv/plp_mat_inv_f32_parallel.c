/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_inv_f32_parallel.c
 * Description:  parallel 32-bit floating-point matrix inversion glue code
 *
 * $Date:        14. July 2020
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
  @addtogroup MatInv
  @{
 */

/**
  @brief Glue code for parallel matrix inversion of 32-bit floating-point matrices.
  @param[in]  pSrc Points to the input matrix, pSrc is modified by this function
  @param[in]  N    Width and height of both matrices
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix
  @return     0: Success, 1: Matrix is singular, 2: operation not supported

  @warn This function is not yet implemented in parallel, and it will call the
  single-core implementation!
 */

int plp_mat_inv_f32_parallel( float *__restrict__ pSrc,
                              float *__restrict__ pDst,
                              uint32_t N,
                              uint32_t nPE) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel and floating-point processing supported only for cluster side\n");
        return 2;
    } else {
        uint32_t* __restrict__ flag = 0U;
        plp_mat_inv_instance_f32 args = {.pSrc = pSrc, .pDst = pDst, .flag = flag, .N = N, .nPE = nPE};
        hal_cl_team_fork(nPE, plp_mat_inv_f32p_xpulpv2, (void *)&args);
    }
}

/**
  @} end of MatInv group
 */
