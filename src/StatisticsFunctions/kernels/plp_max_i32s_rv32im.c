/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_max_i32s_rv32im.c
 * Description:  Max value of a 32-bit integer vector for RV32IM
 *
 * $Date:        29.06.2020        
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
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
 */


#include "plp_math.h"


/**
   @ingroup max
*/

/**
   @defgroup maxKernels Max Kernels
   Calculates the max of the input vector. Max is defined as the greatest of the elements in the vector.
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
   @addtogroup maxKernels
   @{
*/

/**
   @brief         Max value of a 32-bit integer vector for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    max value returned here
   @return        none
*/

void plp_max_i32s_rv32im(
                         const int32_t * __restrict__ pSrc,
                         uint32_t blockSize,
                         int32_t * __restrict__ pRes){

  uint32_t blkCnt = 0;
  int32_t x1, x2;
  int32_t max = 0xA0000000;
  
#if defined(PLP_MATH_LOOPUNROLL)
  
  for(blkCnt=0; blkCnt<(blockSize>>1); blkCnt++){
    x1 = *pSrc++;
    x2 = *pSrc++;
    if(x1 > max) {
      if(x2 > x1){
        max = x2;
      } else {
        max = x1;
      }
    } else if(x2 > max) {
      max = x2;
    }  
  }
  
  if(blockSize%2 == 1){
    x1 = *pSrc++;
    if(x1 > max) {
      max = x1;
    }
  }
  
#else

  for(blkCnt=0;blkCnt<blockSize;blkCnt++){
    x1 = *pSrc++;
    if(x1 > max){
      max = x1; 
    }
  }

#endif

  *pRes = max;
}
