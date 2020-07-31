/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_cmplx_i16.c
 * Description:  16-bit integer complex matrix matrix multiplication glue code
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
  @defgroup MatMultCmplx Complex Matrix Matrix Multiplication
  This module contains the glue code for complex matrix matrix multiplication. The kernel codes
  (kernels) are in the Module @ref MatMultCmplxKernels.

  The Matrix Matrix Multiplication computes the product of two matrices with dimensions MxN and NxO.
  The first matrix is accessed row wise, the second column wise, all values form the first are
  multiplied with the values of the second and then sum of the result gives the value for the result
  matrix.

      pDst[m,o] = pSrcA[m,0]*pSrcB[0,o] + pSrcA[m,1]*pSrcB[1,o] + ... + pSrcA[m,N-1]*pSrcB[N-1,o]

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
  `plp_mat_mult_cmplx_i32`):

      plp_<function name>_<data type><precision>[_parallel]

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_mult_cmplx`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits
 */

/**
  @addtogroup MatMultCmplx
  @{
 */

/**
  @brief      Glue code of matrix matrix multiplication for complex 16-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
 */

void plp_mat_mult_cmplx_i16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            int32_t *__restrict__ pDstC) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_mat_mult_cmplx_i16s_rv32im(pSrcA, pSrcB, M, N, O, pDstC);
    } else {
        plp_mat_mult_cmplx_i16s_xpulpv2(pSrcA, pSrcB, M, N, O, pDstC);
    }
}

/**
  @} end of MatMultCmplx group
 */
