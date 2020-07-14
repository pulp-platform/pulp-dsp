/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i32.c
 * Description:  32-bit integer matrix multiplication glue code
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
  @addtogroup BasicMatMult
  @{
 */

/**
  @brief Glue code for matrix mutliplication of 32-bit fix-point matrices.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[in]  shift     Amount to shift the result of each multiplication.
  @param[out] pDstC     points to the output matrix
  @return        none

  @par Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (multiplied
  by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
  B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
  point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_q32(const int32_t * __restrict__ pSrcA,
                      const int32_t * __restrict__ pSrcB,
                      uint32_t M,
                      uint32_t N,
                      uint32_t O,
                      uint32_t shift,
                      int32_t * __restrict__ pDstC) {

    if (rt_cluster_id() == ARCHI_FC_CID){
        plp_mat_mult_q32s_rv32im(pSrcA, pSrcB, M, N, O, shift, pDstC);
    }
    else{
        plp_mat_mult_q32s_xpulpv2(pSrcA, pSrcB, M, N, O, shift, pDstC);
    }

}

/**
  @} end of BasicMatMult group
 */


