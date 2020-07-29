/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_sub_i16s_rv32im.c
 * Description:  16-bit matrix subtraction kernel for RV32IM
 *
 * $Date:        1. July 2020
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
  @ingroup MatSub
 */

/**
  @defgroup MatSubKernels matrix subtraction Kernels
  This module contains the kernels for matrix subtraction.

  The Matrx Subtraction subtracts two matrices, element wise. Both matrices, and the output matrix
  have dimension MxN.

      `pDst[m, n] = pSrcA[m, n] - pSrcB[m, n]`

  There are functions for integer 32- 16- and 8-bit data types, as well as for floating-point. These
  functions can also be used for fix-point matrices, if they have their fix-point at the same
  location. The outpt matrix will then also have the fix-point at the same location.

  The naming scheme of the functions follows the following pattern (for example
  `plp_mat_sub_i32s_xpulpv2`):

      `plp_<function name>_<data type><precision><method>_<isa_extension>`

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_sub`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits
  method        | {`s`, `v`, `p`} meaning scalar, vectorized (i.e. SIMD) and parallel, respectively
  isa_extension | {`rv32im`, `xpulpv2`} respectively for ibex and riscy
 */

/**
  @addtogroup MatSubKernels
  @{
 */

/**
  @brief matrix subtraction of 16-bit integer matrices kernel for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_sub_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                             const int16_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int16_t *__restrict__ pDst) {

#define BASIC_VERSION // if used don' forget to also use undefine at end of file
#ifdef BASIC_VERSION

    uint32_t m, n; // loop counters

    for (m = 0; m < M; m++) {
        for (n = 0; n < N; n++) {
            pDst[m * N + n] = pSrcA[m * N + n] - pSrcB[m * N + n];
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatSubKernels group
*/
