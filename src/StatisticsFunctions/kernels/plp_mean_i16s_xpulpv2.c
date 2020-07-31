/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mean_i16s_xpulpv2.c
 * Description:  Kernel for calculation the mean of 16-Bit input vectors on XPULPV2
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
   @brief         Mean value of a 16-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    mean value returned here
   @return        none
*/

void plp_mean_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           int16_t *__restrict__ pRes) {

    int32_t blkCnt; /* Loop counter, temporal BlockSize */
    int32_t sum = 0; /* Temporary return variable */

    v2s y1, y2;

    const v2s v2s_ones = {1,1};

#if defined(PLP_MATH_LOOPUNROLL)

    if (blockSize > 3) {
        y1 = *(v2s*) pSrc;
        pSrc += 2;
        y2 = *(v2s*) pSrc;
        pSrc += 2;

        for(blkCnt = 0; blkCnt < (blockSize >> 2)-1; blkCnt++) {
            sum = __builtin_pulp_sdotsp2(v2s_ones, y1, sum);
            y1 = *(v2s*) pSrc;
            pSrc += 2;

            sum = __builtin_pulp_sdotsp2(v2s_ones, y2, sum);
            y2 = *(v2s*) pSrc;
            pSrc += 2;
        }

        sum = __builtin_pulp_sdotsp2(v2s_ones, y1, sum);
        sum = __builtin_pulp_sdotsp2(v2s_ones, y2, sum);

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

    *pRes = ((sum) / (int32_t)blockSize);
}

/**
   @} end of meanKernels group
*/
