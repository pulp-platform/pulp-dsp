/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_abs_i32s_xpulpv2.c
 * Description:  32-bit integer vector absolute value kernel for XPULPV2
 *
 * $Date:        30. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. 
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */


#include "plp_math.h"

/**
  @ingroup BasicAbs
 */

/**
  @addtogroup BasicAbsKernels
  @{
 */

/**
  @brief Element-by-element absolute value of 32-bit integer vectors kernel for XPULPV2 extension.
  @param[in]     pSrc       points to the input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_abs_i32s_xpulpv2(const int32_t * pSrc,
                         int32_t * pDst,
                         uint32_t blockSize) {
    uint32_t blkCnt; /* Loop counter */

#if defined(PLP_MATH_LOOPUNROLL)

    /* Loop unrolling: Compute 2 outputs at a time */
    blkCnt = blockSize >> 1U;

    while (blkCnt > 0U)
      {
        /* C = |A| */

        /* Calculate absolute and store result in destination buffer. */
        *pDst++ = abs(*pSrc++);

        *pDst++ = abs(*pSrc++);

        /* Decrement loop counter */
        blkCnt--;
      }

    /* Loop unrolling: Compute remaining outputs */
    blkCnt = blockSize % 0x2U;

#else // PLP_MATH_LOOPUNROLL

    /* Initialize blkCnt with number of samples */
    blkCnt = blockSize;

#endif // PLP_MATH_LOOPUNROLL

    while (blkCnt > 0U)
      {
        /* C = |A| */

        /* Calculate absolute and store result in destination buffer. */
        *pDst++ = abs(*pSrc++);

        /* Decrement loop counter */
        blkCnt--;
      }

}

/**
   @} end of BasicAbsKernels group
*/
