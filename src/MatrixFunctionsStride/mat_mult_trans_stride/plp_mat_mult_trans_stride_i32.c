/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_trans_stride_i32.c
 * Description:  32-bit integer strided matrix multiplication glue code
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
  @defgroup MatMultTransStride Strided Matrix Transposed Matrix Multiplication
  This module contains the glue code for Matrix Transposed Matrix Multiplication. The kernel codes
  (kernels) are in the Moducle Matrix Transposed Matrix Multiplication Kernels.

  The Matrix Transpose Matrix Multiplication computes the product of two matrices with dimensions
  MxN and OxN. Both matrices is accessed row wise, all values form the first are multiplied with
  the values of the second and then sum of the result gives the value for the result matrix. The
  resulting matrix has shape MxO.

      'pDst[m,o] = pSrcA[m,0]*pSrcB[o,0] + pSrcA[m,1]*pSrcB[o,1] + ... + pSrcA[m,N-1]*pSrcB[o,N-1]`

  There are functions for integer 32- 16- and 8-bit data types. For lower precision integers (16-
  and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example
  `plp_mat_mult_stride_i32`):

      `plp_<function name>_<data type><precision>[_parallel]`

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_mult_trans_stride`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits

  The `strideX` argument tells how many elements are in between the start of each row of the matrix.
  In other words, it is the width of the original matrix. @ref groupMatrixStride
 */

/**
  @addtogroup MatMultTransStride
  @{
 */

/**
  @brief Glue code for strided matrix multiplication of 32-bit integer matrices.
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

void plp_mat_mult_trans_stride_i32(const int32_t *__restrict__ pSrcA,
                                   const int32_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   int32_t *__restrict__ pDstC) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_mult_trans_stride_i32s_rv32im(pSrcA, pSrcB, M, N, O, strideA, strideB, strideC,
                                              pDstC);
    } else {
        plp_mat_mult_trans_stride_i32s_xpulpv2(pSrcA, pSrcB, M, N, O, strideA, strideB, strideC,
                                               pDstC);
    }
}

/**
  @} end of MatMultTransStride group
 */
