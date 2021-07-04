/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_max_i32.c
 * Description:  Maximum value of a 32-bit integer vector glue code
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
   @ingroup groupStats
*/

/**
   @defgroup max Max
*/

/**
   @addtogroup max
   @{
*/

/**
   @brief         Glue code for max value of a 32-bit integer vector.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    max value returned here
   @return        none
 */

void plp_max_i32(const int32_t *__restrict__ pSrc, uint32_t blockSize, int32_t *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_max_i32s_rv32im(pSrc, blockSize, pRes);
    } else {
        plp_max_i32s_xpulpv2(pSrc, blockSize, pRes);
    }
}

/**
  @} end of mean group
 */
