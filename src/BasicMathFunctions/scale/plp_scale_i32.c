/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_scale_i32.c
 * Description:  16-bit integer vector scale glue code
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
  @ingroup groupMath
 */

/**
  @addtogroup BasicScale
  @{
 */

/**
  @brief      Glue code of multiply a vector by a scalar for 32-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
 */

void plp_scale_i32(const int32_t *__restrict__ pSrc, int32_t scaleFactor, int32_t shift, int32_t *__restrict__ pDst, uint32_t blockSize) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_scale_i32s_rv32im(pSrc, scaleFactor, shift, pDst, blockSize);
    } else {
        plp_scale_i32s_xpulpv2(pSrc, scaleFactor, shift, pDst, blockSize);
    }
}

/**
  @} end of BasicScale group
 */
