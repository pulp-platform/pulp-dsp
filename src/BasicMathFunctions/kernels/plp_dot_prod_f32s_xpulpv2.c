/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_f32.c
 * Description:  32-bit float dot product glue code
 *
 * $Date:        16. December 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Fabio Montagna
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
  @addtogroup BasicDotProd
  @{
 */

/**
  @brief Glue code for dot product of 32-bit float vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_dot_prod_f32s_xpulpv2(const float32_t *__restrict__ pSrcA,
                               const float32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               float32_t *__restrict__ pRes) {

    for (int i = 0; i < blockSize; i++) {
        *pRes += *(pSrcA++) * (*(pSrcB++));
    }
}

/**
  @} end of BasicDotProd group
 */
