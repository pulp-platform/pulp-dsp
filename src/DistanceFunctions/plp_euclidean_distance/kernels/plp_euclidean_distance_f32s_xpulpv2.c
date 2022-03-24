/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_f32p_xpulpv2.c
 * Description:  32-bit floating point Euclidean distance kernel for RV32IM
 *
 * $Date:        15. March 2022
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
  @defgroup Euclidean distance
  Euclidean distance
 */

/**
  @addtogroup Euclidean
  @{
 */

/**
  @brief        32-bit floating point Euclidean distance between two vectors
  @param[in]    pA         First vector
  @param[in]    pB         Second vector
  @param[in]    blockSize  vector length
  @param[out]   pRes       output result returned here
  @return       none
 */

void plp_euclidean_distance_f32s_xpulpv2( const float32_t *__restrict__ pSrcA,
                                          const float32_t *__restrict__ pSrcB,
                                          uint32_t blockSize,
                                          float32_t *__restrict__ pRes) {

  float32_t result = 0.0f;
  float32_t accum = 0.0f, tmp;
  while(blockSize > 0)
     {
        tmp = (float32_t)*pSrcA++ - (float32_t)*pSrcB++;
        accum += tmp*tmp;
        blockSize --;
     }
     plp_sqrt_f32(&accum, pRes);
}

/**
   @} end of Euclidean group
*/