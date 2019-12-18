/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_copy_i32s_rv32im.c
 * Description:  Copies the elements of a 32-bit integer vector for RV32IM
 *
 * $Date:        02. June 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Xiaying Wang, ETH Zurich
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
  @ingroup Copy
 */

/**
  @defgroup CopyKernels Vector Copy Kernels
  Copies sample by sample from source vector to destination vector.
  <pre>
  pDst[n] = pSrc[n];   0 <= n < blockSize.
  </pre>
  There are separate functions for floating point, integer, and fixed point 32- 16- 8-bit data types. For lower precision integers (16- and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s):
  <pre>
  \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

  data type = {f, i, q} respectively for floats, integers, fixed points

  precision = {32, 16, 8} bits

  method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

  isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

  </pre>
  
 */

/**
  @addtogroup CopyKernels
  @{
 */

/**
  @brief         Copies the elements of a 32-bit integer vector for RV32IM extension.
  @param[in]     pSrc       points to input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
*/

void plp_copy_i32s_rv32im(
                          int32_t * __restrict__ pSrc,
                          int32_t * __restrict__ pDst,
                          uint32_t blockSize){

  uint32_t blkCnt, tmpBS;             /* Loop counter and temporal blockSize */

#if defined (PLP_MATH_LOOPUNROLL)

  tmpBS = (blockSize>>2);

  for (blkCnt=0; blkCnt<tmpBS; blkCnt++){

    /* Copy and store result in destination buffer */
    *pDst++ = *pSrc++;
    *pDst++ = *pSrc++;
    *pDst++ = *pSrc++;
    *pDst++ = *pSrc++;
  }

  tmpBS = (blockSize%4U);

  for (blkCnt=0; blkCnt<tmpBS; blkCnt++){
    *pDst++ = *pSrc++;
  }

#else

  for (blkCnt=0; blkCnt<blockSize; blkCnt++){
    *pDst++ = *pSrc++;
  }

#endif // PLP_MATH_LOOPUNROLL


}

/**
  @} end of CopyKernels group
 */
