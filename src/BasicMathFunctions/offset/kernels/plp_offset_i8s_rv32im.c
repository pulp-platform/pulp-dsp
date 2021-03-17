/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_offset_i8s_rv32im.c
 * Description:  8-bit vector offset kernel for RV32IM
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
  @ingroup BasicOffset
 */

/**
  @addtogroup BasicOffsetKernels
  @{
 */

/**
  @brief      add a constant offset to a vector for 8-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
 */

void plp_offset_i8s_rv32im(const int8_t * pSrc, int8_t offset, int8_t * pDst, uint32_t blockSize) {

#define BASIC_VERSION // if used don' forget to also use undefine at end of file
#ifdef BASIC_VERSION

    uint32_t blkCnt = blockSize;

while (blkCnt > 0U)
  {
    /* C = A + offset */

    /* Add offset and store result in destination buffer. */
    *pDst++ = (*pSrc++) + offset;

    /* Decrement loop counter */
    blkCnt--;
  }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of BasicOffsetKernels group
*/
