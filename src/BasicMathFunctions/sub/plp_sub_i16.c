/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sub_i16.c
 * Description:  16-bit integer vector subtraction glue code
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
  @defgroup BasicSub vector subtraction
  This module contains the glue code for vector subtraction. The kernel codes (kernels) are in the Module
  vector subtraction Kernels.
  Element-by-element subtraction of two vectors.
  <pre>
      pDst[n] = pSrcA[n] - pSrcB[n],   0 <= n < blockSize.
  </pre>
 */

/**
  @addtogroup BasicSub
  @{
 */

/**
  @brief      Glue code of vector substraction for 16-bit integers
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
 */

void plp_sub_i16(const int16_t * pSrcA, const int16_t * pSrcB, int32_t * pDst, uint32_t blockSize) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_sub_i16s_rv32im(pSrcA, pSrcB, pDst, blockSize);
    } else {
        plp_sub_i16s_xpulpv2(pSrcA, pSrcB, pDst, blockSize);
    }
}

/**
  @} end of BasicSub group
 */
