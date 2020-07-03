/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sqrt_q16s_rv32im.c
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
 */


#include "plp_math.h"


/**
   @ingroup sqrt
*/

/**
   @defgroup sqrtKernels Sqrt Kernels
   Calculates the square root of the input number.
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
   @addtogroup sqrtKernels
   @{
*/

/**
   @brief         Square root of a 16-bit fixed point number for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    sum of squares returned here
   @return        none
*/

void plp_sqrt_q16s_rv32im(
                           const int16_t * __restrict__ pSrc,
                           const uint32_t deciPoint,
                           int16_t * __restrict__ pRes){
  int16_t x,n;

  n = *pSrc;
  x = 1 << (15-deciPoint);

  const int16_t three = 3 << (16-deciPoint);
  int16_t x_square, nx_square, final;
  
#if defined(PLP_MATH_LOOPUNROLL)

  for (int i=0; i<2; i++){

    x_square = (x*x)>>deciPoint;
    nx_square  = (n*x_square)>>deciPoint;
    final = (x*(three-nx_square))>>deciPoint;
    
    x = final;
  }

  *pRes = x*n >> deciPoint;
#else

  for (int i=0; i<2; i++){

    x_square = (x*x)>>deciPoint;
    nx_square  = (n*x_square)>>deciPoint;
    final = (x*(three-nx_square))>>deciPoint;
    
    x = final;
  }

  *pRes = x*n >> deciPoint;  
#endif

 
}
