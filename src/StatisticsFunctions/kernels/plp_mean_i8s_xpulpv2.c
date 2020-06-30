/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mean_i8s_xpulpv2.c
 * Description:  Mean value of a 8-bit integer vector for XPULPV2
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
  @addtogroup meanKernels
  @{
 */

/**
   @brief         Mean value of a 8-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    mean value returned here
   @return        none
*/

void plp_mean_i8s_xpulpv2(
                  const int8_t * __restrict__ pSrc,
                  uint32_t blockSize,
                  int8_t * __restrict__ pRes){


  uint32_t blkCnt, tmpBS;                      /* Loop counter, temporal BlockSize */
  int32_t sum1 = 0, sum2=0;                          /* Temporary return variable */

#if defined(PLP_MATH_LOOPUNROLL)

        tmpBS = (blockSize>>1);

        for (blkCnt=0; blkCnt<tmpBS; blkCnt++){
          sum1 += *pSrc++;
          sum2 += *pSrc++;
        }

        tmpBS = (blockSize%2U);

        for (blkCnt=0; blkCnt<tmpBS; blkCnt++){
          sum1 += *pSrc++;
        }

#else // PLP_MATH_LOOPUNROLL

        for (blkCnt=0; blkCnt<blockSize; blkCnt++){
          sum1 += *pSrc++;
        }

#endif // PLP_MATH_LOOPUNROLL

        * pRes = ((sum1 + sum2) / blockSize);

}

/**
   @} end of meanKernels group
*/
