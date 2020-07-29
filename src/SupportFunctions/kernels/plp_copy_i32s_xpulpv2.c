/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_copy_i32s_xpulpv2.c
 * Description:  Copies the elements of a 32-bit integer vector for XPULPV2
 *
 * $Date:        02. June 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. 
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
  @ingroup Copy
 */

/**
  @addtogroup CopyKernels
  @{
 */

/**
  @brief         Copies the elements of a 32-bit integer vector for XPULPV2 extension.
  @param[in]     pSrc       points to input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
*/

void plp_copy_i32s_xpulpv2(int32_t *__restrict__ pSrc,
                           int32_t *__restrict__ pDst,
                           uint32_t blockSize) {

    uint32_t blkCnt, tmpBS; /* Loop counter, temporal BlockSize */

#if defined(PLP_MATH_LOOPUNROLL)

    tmpBS = (blockSize >> 1);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {

        /* Copy and store result in destination buffer */
        *pDst++ = *pSrc++;
        *pDst++ = *pSrc++;
    }

    tmpBS = (blockSize % 2U);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {
        *pDst++ = *pSrc++;
    }

#else

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        *pDst++ = *pSrc++;
    }

#endif // PLP_MATH_LOOPUNROLL
}

/**
  @} end of CopyKernels group
 */
