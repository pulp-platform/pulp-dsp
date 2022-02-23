/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_common.c
 * Description:  Common Discret Wavelet Transform utilitiy functions
 *
 * $Date:        10. Juli 2021
 * $Revision:    V1
 *
 * Target Processor: PULP cores with "F" support (wolfe)
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Jakub Mandula, ETH Zurich
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
  @ingroup groupTransforms
 */

/**
  @defgroup dwt_common  DWT Common Utility functions
  This module contains the helper code for the DWT transforms.


 */

/**
   @addtogroup dwt_common
   @{
*/

/**
   @brief  Computes maximum available decomposition level for a signal length and wavelet length
   @param[in]   sig_len      length of input signal
   @param[in]   wavelet_len  wavelet length
   @return      Maximal decomposition level
*/
uint32_t plp_dwt_max_level(uint32_t sig_len, uint32_t wavelet_len){
    uint32_t quotient = sig_len/(wavelet_len - 1);
    uint32_t level = 0;
    
    while(quotient >>= 1) ++level;
    
    return level;
}


/**
   @brief  Calculates decomposition output length given a level
   @param[in]   sig_len      length of input signal
   @param[in]   wavelet_len  wavelet length
   @param[in]   level        decomposition level (0 for maximal decomposition)
   @return      Length of decomposition output buffer  
*/
uint32_t plp_dwt_dec_len(uint32_t sig_len, uint32_t wavelet_len, uint32_t level){

   uint32_t total = 0;
   uint32_t quotient = sig_len/(wavelet_len - 1) >> 1;

   do {
      sig_len = PLP_DWT_OUTPUT_LENGTH(sig_len, wavelet_len);
      total += sig_len;
      level--; // In the case that level was 0, it will underflow. The while loop will then run until the first stop condition 
   } while(quotient >>= 1 && level > 0);
   
   total += sig_len;

   return total;
}


/**
   @} end of dwt_common group
*/
