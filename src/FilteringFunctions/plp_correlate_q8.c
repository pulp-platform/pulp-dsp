/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_correlate_q8.c
 * Description:  Correlation glue code for 8-Bit fixed point vectors
 *
 * $Date:        03.07.2020
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
   @ingroup groupFilters
*/

/**
   @defgroup BasicCorrelation Basic Correlation
   This module contains the glue code for Basic Correlation. The kernel codes (kernels) are in the
   Moducle Basic Correlation Kernels.


*/

/**
   @addtogroup BasicCorrelation
   @{
*/

/**
   @brief Glue code for correlation of 8-bit fixed point vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/
void plp_correlate_q8(const int8_t *pSrcA,
                      const uint32_t srcALen,
                      const int8_t *pSrcB,
                      const uint32_t srcBLen,
                      uint32_t fracBits,
                      int32_t *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_correlate_q8s_rv32im(pSrcA, srcALen, pSrcB, srcBLen, fracBits, pRes);
    } else {
        plp_correlate_q8s_xpulpv2(pSrcA, srcALen, pSrcB, srcBLen, fracBits, pRes);
    }
}

/**
   @} end of BasicCorrelation group
*/
