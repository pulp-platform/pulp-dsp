/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sqrt_q16.c
 * Description:  Calculates the square root of a 16-Bit input number
 *
 * $Date:        30.06.2020
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */

#include "plp_math.h"

/**
   @ingroup groupStats
*/

/**
   @defgroup sqrt Sqrt

*/

/**
   @addtogroup sqrt
   @{
*/

/**
   @brief         Glue code for square root of a 16-bit fixed point number.
   @param[in]     pSrc       points to the input vector
   @param[out]    pRes    Square root returned here
   @return        none
 */

void plp_sqrt_q16(const int16_t *__restrict__ pSrc,
                  const uint32_t fracBits,
                  int16_t *__restrict__ pRes) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_sqrt_q16s_rv32im(pSrc, fracBits, pRes);
    } else {
        plp_sqrt_q16s_xpulpv2(pSrc, fracBits, pRes);
    }
}

/**
  @} end of sqrt group
 */
