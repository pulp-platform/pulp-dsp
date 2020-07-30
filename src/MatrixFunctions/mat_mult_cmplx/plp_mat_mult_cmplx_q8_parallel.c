/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_cmplx_q8_parallel.c
 * Description:  parallel 16-bit fix-point complex matrix matrix multiplication glue code
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
  @ingroup groupMatrix
 */

/**
  @addtogroup MatMultCmplx
  @{
 */

/**
  @brief      Glue code of parallel matrix matrix multiplication for complex 8-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`. The output matrix is also
  stored with the same number of bits as the inputs. Set the `shift` parameter such that no overflow
  occurrs.
 */

void plp_mat_mult_cmplx_q8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    uint32_t nPE,
                                    int8_t *__restrict__ pDstC) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {
        plp_mat_mult_cmplx_instance_q8 args = { .pSrcA = pSrcA,
                                                .pSrcB = pSrcB,
                                                .M = M,
                                                .N = N,
                                                .O = O,
                                                .shift = shift,
                                                .nPE = nPE,
                                                .pDstC = pDstC };

        rt_team_fork(nPE, plp_mat_mult_cmplx_q8p_xpulpv2, (void *)&args);
    }
}

/**
  @} end of MatMultCmplx group
 */
