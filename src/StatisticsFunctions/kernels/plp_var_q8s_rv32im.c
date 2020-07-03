/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_var_q8s_rv32im.c
 * Description:  Calculates the sum of squares on RV32IM cores
 *
 * $Date:        30.06.2020        
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
   @ingroup var
*/

/**
   @defgroup varKernels Var Kernels
   Calculates the sum of squares of the input vector.
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
   @addtogroup varKernels
   @{
*/

/**
   @brief         Sum of squares of a 8-bit fixed point vector for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    sum of squares returned here
   @return        none
*/

void plp_var_q8s_rv32im(
                         const int8_t * __restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t deciPoint,
                         int32_t * __restrict__ pRes){
  
  int32_t square_of_mean;
  int32_t square_of_values;

  int8_t mean;

  plp_mean_i8(pSrc, blockSize, &mean);
  square_of_mean = (mean * mean) >> deciPoint;

  plp_power_q8(pSrc, blockSize, deciPoint, &square_of_values);
  
  *pRes = (square_of_values/blockSize - square_of_mean);

}
