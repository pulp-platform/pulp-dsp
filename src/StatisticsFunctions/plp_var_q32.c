/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_var_q32.c
 * Description:  Variance of a 32-bit fixed point vector glue code
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
   @defgroup var Var
*/

/**
   @addtogroup var
   @{
*/

/**
   @brief         Glue code for var value of a 32-bit integer vector.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    variance value returned here
   @return        none
 */

void plp_var_q32(const int32_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int32_t *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_var_q32s_rv32im(pSrc, blockSize, fracBits, pRes);
    } else {
        plp_var_q32s_xpulpv2(pSrc, blockSize, fracBits, pRes);
    }
}

/**
  @} end of mean group
 */
