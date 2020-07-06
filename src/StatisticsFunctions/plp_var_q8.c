/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_var_q8.c
 * Description:  Varimum value of a 8-bit integer vector glue code
 *
 * $Date:        29.06.2020        
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
   @ingroup groupStats
*/

/**
   @defgroup var Var
   Calculates the varimum of the input vector. Var is defined as the the greatest value in the vector.
   There are separate functions for floating point, integer, and fixed point 32- 8- 8-bit data types. For lower precision integers (8- and 8-bit), functions exploiting SIMD instructions are provided.

   The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i8s):
   <pre>
   \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

   data type = {f, i, q} respectively for floats, integers, fixed points

   precision = {32, 16, 8} bits

   method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

   isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

   </pre>

*/

/**
   @addtogroup var
   @{
*/


/**
   @brief         Glue code for var value of a 8-bit integer vector.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    var value returned here
   @return        none
 */


void plp_var_q8(
                         const int8_t * __restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t deciPoint,
                         int8_t * __restrict__ pRes){
  
  if (rt_cluster_id() == ARCHI_FC_CID){
    plp_var_q8s_rv32im(pSrc, blockSize, deciPoint, pRes);
  }
  else{
    plp_var_q8s_xpulpv2(pSrc, blockSize, deciPoint, pRes);
  }

}

/**
  @} end of mean group
 */
