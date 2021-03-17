/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_scale_i16s_xpulpv2.c
 * Description:  16-bit integer vector scale for XPULPV2
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
  @ingroup BasicScale
 */

/**
  @addtogroup BasicScaleKernels
  @{
 */

/**
  @brief      multiply a vector by a scalar for 16-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
 */

void plp_scale_i16s_xpulpv2(const int16_t *__restrict__ pSrc, int16_t scaleFactor, int32_t shift, int16_t *__restrict__ pDst, uint32_t blockSize) {

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

  for (int i = 0; i < blockSize; i++)
    {
      int32_t val = ((int32_t)pSrc[i]) * ((int32_t)scaleFactor);
      pDst[i] = (int16_t)(val >> shift);
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}
/**
   @} end of BasicScaleKernels group
*/
