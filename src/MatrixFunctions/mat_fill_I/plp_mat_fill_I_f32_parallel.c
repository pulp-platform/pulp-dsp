/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_I_f32_parallel.c
 * Description:  parallel 32-bit floating-point identity matrix creation glue code
 *
 * $Date:        16. July 2020
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
  @addtogroup MatFillI
  @{
 */

/**
  @brief      Glue code for creating a 32-bit float identity matrix in parallel
  @param[in]  N    Width and height of the matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
 */

void plp_mat_fill_I_f32_parallel(uint32_t N, uint32_t nPE, float *__restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("parallel and floating-point processing supported only for cluster side\n");
        return;
    } else {
        plp_mat_fill_I_instance_f32 args = { .N = N, .nPE = nPE, .pDst = pDst };

        rt_team_fork(nPE, plp_mat_fill_I_f32p_xpulpv2, (void *)&args);
    }
}

/**
  @} end of MatFillI group
 */
