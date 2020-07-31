/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mean_f32s_xpulpv2.c
 * Description:  Kernel for calculation the mean of 32-Bit floating point input vectors on XPULPV2
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
   @brief         Mean value of a 32-bit float vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    mean value returned here
   @return        none
*/

void plp_mean_f32s_xpulpv2(const float *__restrict__ pSrc,
                           uint32_t blockSize,
                           float *__restrict__ pRes) {

    int32_t blkCnt; /* Loop counter, temporal BlockSize */
    float sum = 0;   /* Temporary return variable */

    volatile float x1, x2, x3, x4;

#if defined(PLP_MATH_LOOPUNROLL)

    if (blockSize > 3) {
        x1 = *pSrc++;
        x2 = *pSrc++;
        x3 = *pSrc++;
        x4 = *pSrc++;

        for(blkCnt = 0; blkCnt < (blockSize >> 2)-1; blkCnt++) {
            sum += x1;
            x1 = *pSrc++;
            sum += x2;
            x2 = *pSrc++;
            sum += x3;
            x3 = *pSrc++;
            sum += x4;
            x4 = *pSrc++;   
        }

        sum += x1;
        sum += x2;
        sum += x3;
        sum += x4;

        for(blkCnt = 0; blkCnt < (blockSize % 4); blkCnt++) {
            sum += (*pSrc++);
        }
    }
    else {
        for(blkCnt = 0; blkCnt < blockSize; blkCnt++) {
            sum += (*pSrc++);
        }
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        sum += *pSrc++;
    }

#endif // PLP_MATH_LOOPUNROLL

    *pRes = ((sum) / (float)blockSize);
}

/**
   @} end of meanKernels group
*/
