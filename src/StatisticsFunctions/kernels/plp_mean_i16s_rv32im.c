/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mean_i16s_rv32im.c
 * Description:  Kernel for calculation the mean of 16-Bit input vectors on RV32IM
 *
 * $Date:        01.07.2020        
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
  @ingroup mean
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


  uint32_t blkCnt, tmpBS;                      /* Loop counter, temporal BlockSize */
  int32_t sum = 0; /* Temporary return variable */

  int16_t x1,x2;
  
#if defined(PLP_MATH_LOOPUNROLL)

  for(blkCnt=0;blkCnt<(blockSize>>1);blkCnt++){
    x1 = *pSrc++;
    x2 = *pSrc++;
    sum += x1;
    sum += x2;
  }

  if(blockSize%2 == 1){
    sum += (*pSrc++);
  }
  
#else // PLP_MATH_LOOPUNROLL

  for (blkCnt=0; blkCnt<blockSize; blkCnt++){
    sum += *pSrc++;
  }

#endif // PLP_MATH_LOOPUNROLL

  *pRes = ( (sum) / (int32_t)blockSize);

}

/**
   @} end of meanKernels group
*/
