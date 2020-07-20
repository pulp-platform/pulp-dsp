/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sqrt_q32s_rv32im.c
 * Description:  32-Bit fixed point square root kernel for RV32IM
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
*/

/**
   @addtogroup sqrtKernels
   @{
*/

/**
   @brief         Square root of a 32-bit fixed point number for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pRes    Square root returned here
   @return        none
*/

void plp_sqrt_q32s_rv32im(const int32_t *__restrict__ pSrc,
                           const uint32_t fracBits,
                           int32_t *__restrict__ pRes) {
  
  int32_t number = *pSrc;
  int32_t root;
  
  int32_t start = 0;
  int32_t end = number;
  int32_t mid;
 
  if (number > 0) {

    while(start <= end) {

      mid = (start+end) >> 1;

      if(((mid*mid) >> fracBits) == number){
        root = mid;
        break;
      }

      if(((mid*mid) >> fracBits) < number){
        start = mid + 1;
        root = mid;
      }

      else {
        end = mid - 1;
      }
    }

    *pRes = root;
    
  } else {
    *pRes = 0;
  }
}
