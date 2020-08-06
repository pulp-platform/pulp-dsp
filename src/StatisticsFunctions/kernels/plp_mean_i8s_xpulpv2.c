/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mean_i8s_xpulpv2.c
 * Description:  Kernel for calculation the mean of 8-Bit input vectors on XPULPV2
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
   @brief         Mean value of a 8-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    mean value returned here
   @return        none
*/

void plp_mean_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int8_t *__restrict__ pRes) {

    int32_t blkCnt; /* Loop counter, temporal BlockSize */
    int32_t sum = 0; /* Temporary return variable */

    v4s y1, y2;

    const v4s v4s_ones = {1,1, 1, 1};

#if defined(PLP_MATH_LOOPUNROLL)

    if (blockSize > 7) {
        y1 = *(v4s*) pSrc;
        pSrc += 4;
        y2 = *(v4s*) pSrc;
        pSrc += 4;

        for(blkCnt = 0; blkCnt < (blockSize >> 3)-1; blkCnt++) {
            sum = __builtin_pulp_sdotsp4(v4s_ones, y1, sum);
            y1 = *(v4s*) pSrc;
            pSrc += 4;

            sum = __builtin_pulp_sdotsp4(v4s_ones, y2, sum);
            y2 = *(v4s*) pSrc;
            pSrc += 4;
        }

        sum = __builtin_pulp_sdotsp4(v4s_ones, y1, sum);
        sum = __builtin_pulp_sdotsp4(v4s_ones, y2, sum);

        for(blkCnt = 0; blkCnt < (blockSize % 8); blkCnt++) {
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

    *pRes = ((sum) / (int32_t)blockSize);
}

/**
   @} end of meanKernels group
*/
