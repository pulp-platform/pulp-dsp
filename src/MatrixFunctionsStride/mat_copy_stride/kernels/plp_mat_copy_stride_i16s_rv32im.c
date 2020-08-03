/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_copy_stride_i16s_rv32im.c
 * Description:  16-bit strided matrix copy kernel for RV32IM
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
  @ingroup MatCopyStride
 */

/**
  @defgroup MatCopyStrideKernels Strided Matrix Copy Kernels

  The source and destination matrix can have different strides.

  There are functions for integer 32- 16- and 8-bit data types, as well as for floating-point. The
  naming scheme of the functions follows the following pattern (for example
  `plp_mat_copy_stride_i32s_xpulpv2`):

      `plp_<function name>_<data type><precision><method>_<isa_extension>`

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_copy_stride`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits
  method        | {`s`, `v`, `p`} meaning scalar, vectorized (i.e. SIMD) and parallel, respectively
  isa_extension | {`rv32im`, `xpulpv2`} respectively for ibex and riscy

  The `strideSrc` and `strideDst` argument tells how many elements are in between the start of each
  row of the matrix. In other words, it is the width of the original matrix. @ref groupMatrixStride
 */

/**
  @addtogroup MatCopyStrideKernels
  @{
 */

/**
  @brief      Copy an MxN strided 16-bit integers matrix on RV32IM
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
 */

void plp_mat_copy_stride_i16s_rv32im(const int16_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     int16_t *__restrict__ pDst) {

//#define BASIC_VERSION // if used don' forget to also use undefine at end of file
#ifdef BASIC_VERSION

    for (int m = 0; m < M; m++) {
        for (int n = 0; n < N; n++) {
            pDst[m * strideDst + n] = pSrc[m * strideSrc + n];
        }
    }

#else

    unsigned int m;
    unsigned int n;

    unsigned int n_iter = N >> 1;
    unsigned int n_rem = N & 0x00000001;

    for (m = 0; m < M; m++) {
        for (n = 0; n < n_iter; n++) {
            *((int32_t *)pDst) = *((int32_t *)pSrc);
            pDst += 2;
            pSrc += 2;
        }
        if (n_rem) {
            *pDst++ = *pSrc++;
        }
        pSrc += strideSrc - N;
        pDst += strideDst - N;
    }

#endif
    //#undef BASIC_VERSION
}

/**
   @} end of MatCopyStrideKernels group
*/
