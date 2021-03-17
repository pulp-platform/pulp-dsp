/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_negate_f32.c
 * Description:  32-bit floating-point Vector Negate glue code
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
  @addtogroup BasicNegate
  @{
 */

/**
  @brief      Glue code of negate the elements of a vector for 32-bit floats
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none
 */

void plp_negate_f32(const float32_t * pSrc, float32_t * pDst, uint32_t blockSize) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("Floating point is supported only for cluster side\n");
        return;
    } else {
        plp_negate_f32s_xpulpv2(pSrc, pDst, blockSize);
    }
}

/**
  @} end of BasicNegate group
 */
