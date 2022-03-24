/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cosine_distance_q16s_rv32im.c
 * Description:  16-bit fixed-point cosine_distance kernel for RV32IM
 *
 * $Date:        21 mar 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
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
  @ingroup  DistanceFunctions
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
  @brief cosine distance of 16-bit fixed point vectors kernel for RV32IM extension.
  @param[in]  pSrcA      points to the first input vector [16 bit]
  @param[in]  pSrcB      points to the second input vector [16 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits  decimal point for right shift
  @param[out] pRes     output result returned here [32 bit]
  @return     none

  @par Exploiting SIMD instructions
  When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the
  two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM
  doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
 */

void plp_cosine_distance_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t fracBits,
                              int32_t *__restrict__ pRes) {

    int32_t pwrA, pwrB;
    int32_t dot, tmp;
    plp_power_q16s_rv32im(pSrcA, blockSize, fracBits, &pwrA);
    plp_power_q16s_rv32im(pSrcB, blockSize, fracBits, &pwrB);
    tmp = pwrA*pwrB >> fracBits;

    plp_dot_prod_q16s_rv32im(pSrcA, pSrcB, blockSize, fracBits, &dot);
    plp_sqrt_q32s_rv32im(&tmp, fracBits, &tmp);
    *pRes = 1 - dot/tmp;

}

/**
   @} end of cosine group
*/
