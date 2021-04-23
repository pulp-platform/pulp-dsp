/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_trans_stride_i16.c
 * Description:  16-bit integer strided matrix multiplication glue code
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
  @ingroup groupMatrixStride
 */

/**
  @addtogroup MatMultTransStride
  @{
 */

/**
  @brief Glue code for strided matrix multiplication of 16-bit integer matrices.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[in]  strideA   Stride of matrix A (elements between each row)
  @param[in]  strideB   Stride of matrix B (elements between each row)
  @param[in]  strideC   Stride of output matrix (elements between each row)
  @param[out] pDstC     points to the output matrix
  @return        none
 */

void plp_mat_mult_trans_stride_i16(const int16_t *__restrict__ pSrcA,
                                   const int16_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   int32_t *__restrict__ pDstC) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_mult_trans_stride_i16s_rv32im(pSrcA, pSrcB, M, N, O, strideA, strideB, strideC,
                                              pDstC);
    } else {
        plp_mat_mult_trans_stride_i16s_xpulpv2(pSrcA, pSrcB, M, N, O, strideA, strideB, strideC,
                                               pDstC);
    }
}

/**
  @} end of MatMultTransStride group
 */
