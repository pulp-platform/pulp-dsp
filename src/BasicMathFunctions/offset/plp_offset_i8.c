/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_offset_i8.c
 * Description:  16-bit integer vector offset glue code
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
  @addtogroup BasicOffset
  @{
 */

/**
  @brief      Glue code of add a constant offset to a vector for 8-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
 */

void plp_offset_i8(const int8_t * pSrc,  int8_t offset,  int8_t * pDst, uint32_t blockSize) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_offset_i8s_rv32im(pSrc, offset, pDst, blockSize);
    } else {
        plp_offset_i8s_xpulpv2(pSrc, offset, pDst, blockSize);
    }
}

/**
  @} end of BasicOffset group
 */
