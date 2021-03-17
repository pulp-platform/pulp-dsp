/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sub_i16s_xpulpv2.c
 * Description:  16-bit integer vector subtraction for XPULPV2
 *
 * $Date:        17 Mar 2021
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and Ubiversity of Bologna. All rights reserved.
 *
 * Author: Tibor Schneider, ETH Zurich
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
  @ingroup BasicSub
 */

/**
  @addtogroup BasicSubKernels
  @{
 */

/**
  @brief      vector substraction for 16-bit integers on XpulpV2
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
 */

void plp_sub_i16s_xpulpv2(const int16_t * pSrcA, const int16_t * pSrcB, int32_t * pDst, uint32_t blockSize) {

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    uint32_t blkCnt = blockSize;

while (blkCnt > 0U)
  {
    /* C = A - B */

    /* Subtract and store result in destination buffer. */
    *pDst++ = (*pSrcA++) - (*pSrcB++);

    /* Decrement loop counter */
    blkCnt--;
  }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}
/**
   @} end of BasicSubKernels group
*/
