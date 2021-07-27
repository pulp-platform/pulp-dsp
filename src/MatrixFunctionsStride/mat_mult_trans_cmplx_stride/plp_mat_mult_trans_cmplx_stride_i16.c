/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_trans_cmplx_stride_i16.c
 * Description:  16-bit integer complex strided matrix transpose matrix multiplication glue code
 *
 * $Date:        18. July 2020
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
  @ingroup groupMatrixStride
 */

/**
  @defgroup MatMultTransCmplxStride Complex Matrix Transpose Matrix Multiplication
  This module contains the glue code for complex strided matrix transpose matrix multiplication. The
  kernel codes (kernels) are in the Module @ref MatMultTransCmplxStrideKernels.

  The Matrix Transpose Matrix Multiplication computes the product of two matrices with dimensions
  MxN and NxO. The first matrix is accessed row wise, the second column wise, all values form the
  first are multiplied with the values of the second and then sum of the result gives the value for
  the result matrix.

      pDst[m,o] = pSrcA[m,0]*pSrcB[o,0] + pSrcA[m,1]*pSrcB[o,1] + ... + pSrcA[m,N-1]*pSrcB[o,N-1]

  These functions assume both source matrices (`pSrcA` and `pSrcB`) and the output matrix (`pDstC`)
  to be complex. They must be stored such that real and imaginary part of any element directly are
  directly next to eachother. The dimensionality (`M`, `N`, `O`) still counts the number of elements
  in each dimension, such that a complex matrix X with shape MxN has size `M * N * 2`. To access the
  real and imatinary part of this matrix `X`, do:

      Re(X[m, n]): pX[(m * N + n) * 2]
      Im(X[m, n]): pX[(m * N + n) * 2 + 1]

  There are functions for integer 32- 16- and 8-bit data types. For lower precision integers (16-
  and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example
  `plp_mat_mult_trans_cmplx_stride_i32`):

      plp_<function name>_<data type><precision>[_parallel]

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_mult_trans_cmplx`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits
 */

/**
  @addtogroup MatMultTransCmplxStride
  @{
 */

/**
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 16-bit
  integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
 */

void plp_mat_mult_trans_cmplx_stride_i16(const int16_t *__restrict__ pSrcA,
                                         const int16_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         int32_t *__restrict__ pDstC) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_mult_trans_cmplx_stride_i16s_rv32im(pSrcA, pSrcB, M, N, O, strideA, strideB,
                                                    strideC, pDstC);
    } else {
        plp_mat_mult_trans_cmplx_stride_i16s_xpulpv2(pSrcA, pSrcB, M, N, O, strideA, strideB,
                                                     strideC, pDstC);
    }
}

/**
  @} end of MatMultTransCmplxStride group
 */
