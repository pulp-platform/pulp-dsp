/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_min_f32.c
 * Description:  Min value of a 32-bit floating point vector glue code
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
   @ingroup groupStats
*/

/**
   @defgroup min Min
*/

/**
   @addtogroup min
   @{
*/

/**
   @brief         Glue code for min value of a 32-bit float vector.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    min value returned here
   @return        none
 */

void plp_min_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        *pRes = -1;
    } else {
        plp_min_f32s_xpulpv2(pSrc, blockSize, pRes);
    }
}

/**
  @} end of min group
 */
