/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_fill_i32s_rv32im.c
 * Description:  Fills a constant value into a 32-bit integer vector for RV32IM
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
  @ingroup Fill
 */

/**
  @defgroup FillKernels Vector Fill Kernels
  Fills the destination vector with a constant value.
  <pre>
      pDst[n] = value;   0 <= n < blockSize.
  </pre>
  There are separate functions for floating point, integer, and fixed point 32- 16- 8-bit data
  types. For lower precision integers (16- and 8-bit), functions exploiting SIMD instructions are
  provided.

  The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s):
  <pre>
  \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

  data type = {f, i, q} respectively for floats, integers, fixed points

  precision = {32, 16, 8} bits

  method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using
  SIMD instructions), and parallel (for multicore parallel computing), respectively.

  isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

  </pre>

 */

/**
  @addtogroup FillKernels
  @{
 */

/**
  @brief         Fills a constant value into a 32-bit integer vector for RV32IM extension.
  @param[in]     value      input value to be filled
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_fill_i32s_rv32im(int32_t value, int32_t *__restrict__ pDst, uint32_t blockSize) {

    uint32_t blkCnt, tmpBS; /* Loop counter */
    int32_t value1 = value;
    int32_t value2 = value;
    int32_t value3 = value; // comment: it performs the same with or without temporary values.

#if defined(PLP_MATH_LOOPUNROLL)

    tmpBS = (blockSize >> 2);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        *pDst++ = value;
        *pDst++ = value1;
        *pDst++ = value2;
        *pDst++ = value3;
    }

    tmpBS = (blockSize % 4U);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        *pDst++ = value;
    }

#else

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        *pDst++ = value;
    }

#endif // PLP_MATH_LOOPUNROLL
}

/**
  @} end of FillKernels group
 */
