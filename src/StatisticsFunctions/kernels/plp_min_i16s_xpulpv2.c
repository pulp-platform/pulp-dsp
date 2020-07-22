/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_min_i16s_xpulpv2.c
 * Description:  Kernel for calculating the min of 16-Bit integer input vectors on XPULPV2
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
  @ingroup min
 */

/**
   @defgroup minKernels Min Kernels
 */

/**
  @addtogroup minKernels
  @{
 */

/**
   @brief         Min value of a 16-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    min value returned here
   @return        none
*/

void plp_min_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int16_t *__restrict__ pRes) {

    uint32_t blkCnt = 0;
    int16_t x1, x2;
    int16_t min = 0x7FFF;

#if defined(PLP_MATH_LOOPUNROLL)

    for (blkCnt = 0; blkCnt < (blockSize >> 1); blkCnt++) {
        x1 = *pSrc++;
        x2 = *pSrc++;
        if (x1 < min) {
            if (x2 < x1) {
                min = x2;
            } else {
                min = x1;
            }
        } else if (x2 < min) {
            min = x2;
        }
    }

    if (blockSize % 2 == 1) {
        x1 = *pSrc++;
        if (x1 < min) {
            min = x1;
        }
    }

#else

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        x1 = *pSrc++;
        if (x1 < min) {
            min = x1;
        }
    }

#endif

    *pRes = min;
}
