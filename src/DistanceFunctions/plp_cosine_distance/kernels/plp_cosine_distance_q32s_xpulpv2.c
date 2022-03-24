/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cosine_distance_q32s_xpulpv2.c
 * Description:  32-bit fixed-point cosine distance for XPULPV2
 *
 * $Date:        21. Mar 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2022 ETH Zurich and University of Bologna.
 *
 * Author: Marco Bertuletti, ETH Zurich
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
  @brief      cosine distance of 32-bit fixed-point vectors kernel for XPULPV2 extension.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits   number of fixed point fractional bits
  @param[out] pRes       output result returned here
  @return     none
 */

void plp_cosine_distance_q32s_xpulpv2(   const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t blockSize,
                                            uint32_t fracBits,
                                            int32_t *__restrict__ pRes) {
    
  int32_t pwrA, pwrB;
  int32_t dot, tmp;
  plp_power_q32s_xpulpv2(pSrcA, blockSize, fracBits, &pwrA);
  plp_power_q32s_xpulpv2(pSrcB, blockSize, fracBits, &pwrB);
  tmp = pwrA*pwrB >> fracBits;

  plp_dot_prod_q32s_xpulpv2(pSrcA, pSrcB, blockSize, fracBits, &dot);
  plp_sqrt_q32s_xpulpv2(&tmp, fracBits, &tmp);
  *pRes = 1 - dot/tmp;

}


/**
   @} end of cosine group
*/
