/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_stride_i32.c
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
  @defgroup groupMatrixStride Strided Matrix operations
  This module contains all matrix operations with strided access. Strided operations can be used to
  ooperate on a small region of an MxN matrix. All functions contain a `stride` parameter for each
  operand. The `stride` parameter is the number of elements between the start of each row. In other
  words, it is the number of columns of the original matrix.

  @par Example: Assume the following 4x5 matrix:
  @f[
    \mathbf{A} = \left[\begin{array}{lllll}
       a_{00} & a_{01} & a_{02} & a_{03} & a_{04}\\
       a_{10} & a_{11} & a_{12} & a_{13} & a_{14}\\
       a_{20} & a_{21} & a_{22} & a_{23} & a_{24}\\
       a_{30} & a_{31} & a_{32} & a_{33} & a_{34}\\
    \end{array}\right]
  @f]
  It linear memory, it is `uint16_t pA[20] = [a_00, a_01, a_02, a_03, a_04, a_10, ..., a_34]` Per
  convention, the number of columns `N = 5` and the number of rows `M = 4`. Let's assume we wish to
  access only the sub matrix:
  @f[
    \mathbf{A}_{1:2,1:3} = \left[\begin{array}{lll}
       a_{11} & a_{12} & a_{13}\\
       a_{21} & a_{22} & a_{23}\\
    \end{array}\right]
  @f]
  We can achieve this by passing the array as: `pSrcA = pA + N + 1`, `N = 3`, `M = 2` and
  `strideA = 5`. Notice that we need to change the pointer to the start of the matrix, and the
  dimensionality of the matrix. Also, `strideA` is the original width of the matrix.
  */

/**
   @ingroup groupMatrixStride
 */

/**
  @defgroup BasicMatMultStride Strided Matrix Matrix Multiplication
  This module contains the glue code for Matrix Matrix Multiplication. The kernel codes (kernels)
  are in the Moducle Matrix Matrix Multiplication Kernels.

  The Matrix Matrix Multiplication computes the product of two matrices with dimensions MxN and NxO.
  The first matrix is accessed row wise, the second column wise, all values form the first are
  multiplied with the values of the second and then sum of the result gives the value for the result
  matrix.

      'pDst[m,o] = pSrcA[m,0]*pSrcB[0,o] + pSrcA[m,1]*pSrcB[1,o] + ... + pSrcA[m,N-1]*pSrcB[N-1,o]`

  There are functions for integer 32- 16- and 8-bit data types. For lower precision integers (16-
  and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example
  `plp_mat_mult_stride_i32`):

      `plp_<function name>_<data type><precision>[_parallel]`

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_mult_stride`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits

  The `strideX` argument tells how many elements are in between the start of each row of the matrix.
  In other words, it is the width of the original matrix. @ref groupMatrixStride
 */

/**
  @addtogroup BasicMatMultStride
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

void plp_mat_mult_stride_i32(const int32_t *__restrict__ pSrcA,
                             const int32_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t strideA,
                             uint32_t strideB,
                             uint32_t strideC,
                             int32_t *__restrict__ pDstC) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_mult_stride_i32s_rv32im(pSrcA, pSrcB, M, N, O, strideA, strideB, strideC, pDstC);
    } else {
        plp_mat_mult_stride_i32s_xpulpv2(pSrcA, pSrcB, M, N, O, strideA, strideB, strideC, pDstC);
    }
}

/**
  @} end of BasicMatMult group
 */
