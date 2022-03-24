/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cosine_distance_f32_parallel.c
 * Description:  32-bit floating point cosine distance kernel for RV32IM
 *
 * $Date:        21. March 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2022 ETH Zurich and University of Bologna.
 *
 * Author: Marco Bertuletti ETH Zurich
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
  @ingroup DistanceFunctions
 */

/**
  @defgroup cosine distance
  cosine distance
 */

/**
  @addtogroup cosine
  @{
 */

/**
  @brief      Glue code for parallel cosine distance between 32-bit float vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pRes       output result returned here
  @return     none
 */

void plp_cosine_distance_f32_parallel(  const float32_t *__restrict__ pSrcA,
                                        const float32_t *__restrict__ pSrcB,
                                        uint32_t blockSize,
                                        uint32_t nPE,
                                        float32_t *__restrict__ pRes) {
  float32_t pwrA, pwrB;
  float32_t dot, tmp;
  plp_power_f32_parallel(pSrcA, blockSize, nPE, &pwrA);
  plp_power_f32_parallel(pSrcB, blockSize, nPE, &pwrB);
  tmp = pwrA*pwrB;

  plp_dot_prod_f32_parallel(pSrcA, pSrcB, blockSize, nPE, &dot);
  plp_sqrt_f32(&tmp, &tmp);
  *pRes = 1.0f - dot/tmp;

}

/**
   @} end of cosine group
*/