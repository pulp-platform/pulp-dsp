/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sqrt_q32s_xpulpv2.c
 * Description:
 *
 * $Date:        02.07.2020
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Moritz Scherer, ETH Zurich
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
 *
 */

#define sqrt2 0b1011010100000100
#include "plp_math.h"

/**
   @ingroup sqrt
*/

/**
   @defgroup sqrtKernels Sqrt Kernels
   Calculates the square root of the input number.
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

   isa extension = rv32im, rv32im, etc. of which rv32im is the most general one.

   </pre>

*/

/**
   @addtogroup sqrtKernels
   @{
*/

/**
   @brief         Square root of a 32-bit fixed point number for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    sum of squares returned here
   @return        none
*/

void plp_sqrt_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                           const uint32_t fracBits,
                           int32_t *__restrict__ pRes) {
  
  int32_t number = *pSrc;
  //  int32_t count = 0;

  int32_t start = 0;
  int32_t end = number;
  int32_t mid;
 
  if (number > 0) {

    while(start <= end) {

      mid = (start+end) >> 1;

      if(((mid*mid) >> fracBits) == number){
        *pRes = mid;
        break;
      }

      if(((mid*mid) >> fracBits) < number){
        start = mid + 1;
        *pRes = mid;
      }

      else {
        end = mid - 1;
      }
    }
    
  } else {
    *pRes = 0;
  }
}
