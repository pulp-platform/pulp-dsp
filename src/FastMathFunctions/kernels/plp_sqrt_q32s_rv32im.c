/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sqrt_q32s_rv32im.c
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
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */


#define sqrt2 0b1011010100000100
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
   @brief         Square root of a 32-bit fixed point number for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    sum of squares returned here
   @return        none
*/

void plp_sqrt_q32s_rv32im(
                           const int32_t * __restrict__ pSrc,
                           const uint32_t fracBits,
                           int32_t * __restrict__ pRes){

  int16_t number, temp1, intermediate_fixpoint, signBits, half;

  number = *pSrc >> 16;

  /* If the input is a positive number then compute the signBits. */
  if (number > 0)
    {
      signBits = __builtin_clz(number) - 17;

      /* Shift by the number of signBits */
      if ((signBits % 2) == 0)
        {
          number = number << signBits;
        }
      else
        {
          number = number << (signBits - 1);
        }

      /* Calculate half value of the number */
      half = number >> 1;
      /* Store the number for later use */
      temp1 = number;
      /* Initial guess for 1/(2sqrt(x)) */
      intermediate_fixpoint = (temp1)>>2;

      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;

      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;

      
      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;
      
      
      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;
      
      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;
     
      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;


      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;
 

      intermediate_fixpoint = ((int16_t) ((int32_t) intermediate_fixpoint * (0x3000 -
                                       ((int16_t)
                                        ((((int16_t)
                                           (((int32_t) intermediate_fixpoint * intermediate_fixpoint) >> 15)) *
                                          (int32_t) half) >> 15))) >> 15)) << 2;

      
      intermediate_fixpoint = ((int16_t) (((int32_t) temp1 * intermediate_fixpoint) >> 15)) << 1;


      if((32-fracBits) > 1){
        intermediate_fixpoint = intermediate_fixpoint >> ((int32_t)((32-fracBits))>>1);
        if((32-fracBits)%2==0){
          intermediate_fixpoint = ((int32_t)intermediate_fixpoint * sqrt2) >> 15;
        }
      }
      

      if ((signBits % 2) == 0)
        {
          intermediate_fixpoint = intermediate_fixpoint >> (signBits / 2);
        }
      else
        {
          intermediate_fixpoint = intermediate_fixpoint >> ((signBits - 1) / 2);
        }
      *pRes = intermediate_fixpoint;
    }

  else
    {
      *pRes = 0;
    }
}

