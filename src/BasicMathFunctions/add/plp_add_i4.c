/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_add_i4.c
 * Description:  4-bit integer vector addition glue code
 *
 * $Date:        17. January 2023
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. 
 *
 * Author: Viviane Potocnik, ETH Zurich
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
  @ingroup groupMath
 */

/**
  @addtogroup BasicAdd
  @{
 */

/**
  @brief Glue code for element-by-element addition of 8-bit integer vectors.
  @param[in]     pSrcA      points to first input vector
  @param[in]     pSrcB      points to second input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_add_i4(const int32_t * pSrcA,
                 const int32_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("FC does not use XPULPv2 extensions!\n");
    } else {
        plp_add_i4s_xpulpv2(pSrcA, pSrcB, pDst, blockSize);
    }
}

/**
  @} end of BasicAdd group
 */
