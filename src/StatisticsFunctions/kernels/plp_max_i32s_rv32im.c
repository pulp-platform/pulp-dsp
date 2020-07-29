/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_max_i32s_rv32im.c
 * Description:  Kernel for calculation the max of 32-Bit integer input vectors on RV32IM
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
   @ingroup max
*/

/**
   @defgroup maxKernels Max Kernels

*/

/**
   @addtogroup maxKernels
   @{
*/

/**
   @brief         Max value of a 32-bit integer vector for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    max value returned here
   @return        none
*/

void plp_max_i32s_rv32im(const int32_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int32_t *__restrict__ pRes) {

    uint32_t blkCnt = 0;
    int32_t x1, x2;
    int32_t max = 0xA0000000;

#if defined(PLP_MATH_LOOPUNROLL)

    for (blkCnt = 0; blkCnt < (blockSize >> 1); blkCnt++) {
        x1 = *pSrc++;
        x2 = *pSrc++;
        if (x1 > max) {
            if (x2 > x1) {
                max = x2;
            } else {
                max = x1;
            }
        } else if (x2 > max) {
            max = x2;
        }
    }

    if (blockSize % 2 == 1) {
        x1 = *pSrc++;
        if (x1 > max) {
            max = x1;
        }
    }

#else

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        x1 = *pSrc++;
        if (x1 > max) {
            max = x1;
        }
    }

#endif

    *pRes = max;
}
