/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_scale_stride_i16.c
 * Description:  16-bit integer strided matrix scale glue code
 *
 * $Date:        6. July 2020
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
  @defgroup MatScaleStride Strided Matrix Scale
  This module contains the glue code for strided matrix scale. The kernel codes (kernels) are in the
  Module strided matrix scale Kernels.

  The Matrix Scale applies a scalar multiplication, followed by a bitshift operation to every
  element in the matrix. For floating-point implementations, the bitshift operation is not applied.

      `pDst[m,n] = (pSrc[m,n] * scale) >> shift`

  There are functions for integer 32- 16- and 8-bit data types. For lower precision integers (16-
  and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example
  `plp_mat_scale_stride_i32`):

      `plp_<function name>_<data type><precision>[_parallel]`

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_scale_stride`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits

  The `strideX` argument tells how many elements are in between the start of each row of the matrix.
  In other words, it is the width of the original matrix. @ref groupMatrixStride
 */

/**
  @addtogroup MatScaleStride
  @{
 */

/**
  @brief Glue code for strided matrix scale of 16-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride of input matrix (elements between each row)
  @param[in]  strideDst   Stride of output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
 */

void plp_mat_scale_stride_i16(const int16_t *__restrict__ pSrc,
                              uint32_t M,
                              uint32_t N,
                              uint32_t strideSrc,
                              uint32_t strideDst,
                              int16_t scaleFactor,
                              int32_t shift,
                              int16_t *__restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_mat_scale_stride_i16s_rv32im(pSrc, M, N, strideSrc, strideDst, scaleFactor, shift,
                                         pDst);
    } else {
        plp_mat_scale_stride_i16v_xpulpv2(pSrc, M, N, strideSrc, strideDst, scaleFactor, shift,
                                          pDst);
    }
}

/**
  @} end of MatScaleStride group
 */
