/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mean_i16s_rv32im.c
 * Description:  Mean value of a 16-bit integer vector for RV32IM
 *
 * $Date:        11. Jun 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
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
  @ingroup mean
 */

/**
  @defgroup meanKernels Mean Kernels
  Calculates the mean of the input vector. Mean is defined as the average of the elements in the vector.
   The underlying algorithm is used:
   <pre>
   Result = (pSrc[0] + pSrc[1] + pSrc[2] + ... + pSrc[blockSize-1]) / blockSize;
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
  @addtogroup meanKernels
  @{
 */

/**
   @brief         Mean value of a 16-bit integer vector for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    mean value returned here
   @return        none
*/

void plp_mean_i16s_rv32im(
                  const int16_t * __restrict__ pSrc,
                  uint32_t blockSize,
                  int16_t * __restrict__ pRes){


  uint32_t blkCnt;                      /* Loop counter, temporal BlockSize */
  int32_t sum=0;                          /* Temporary return variable */

#if defined(PLP_MATH_LOOPUNROLL)

  for (blkCnt=0; blkCnt<(blockSize>>2); blkCnt++){
          sum += *pSrc++;
          sum += *pSrc++;
          sum += *pSrc++;
          sum += *pSrc++;
        }


        for (blkCnt=0; blkCnt<(blockSize%4U); blkCnt++){
          sum += *pSrc++;
        }

#else // PLP_MATH_LOOPUNROLL

        for (blkCnt=0; blkCnt<blockSize; blkCnt++){
          sum += *pSrc++;
        }

#endif // PLP_MATH_LOOPUNROLL

        * pRes = (sum / blockSize);

}

/**
   @} end of meanKernels group
*/
