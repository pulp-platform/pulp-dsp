/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mult_i32s_xpulpv2.c
 * Description:  32-bit integer vector multiplication kernel for XPULPV2
 *
 * $Date:        30. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. 
 *
 * Author: Xiaying Wang, ETH Zurich
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
  @ingroup BasicMult
 */

/**
  @addtogroup BasicMultKernels
  @{
 */

/**
  @brief Element-by-element multiplication of 32-bit integer vectors kernel for XPULPV2 extension.
  @param[in]     pSrcA      points to first input vector
  @param[in]     pSrcB      points to second input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_mult_f32s_xpulpv2(const float32_t * pSrcA,
                 const float32_t * pSrcB,
                 float32_t * pDst,
                 uint32_t blockSize) {
  for (int i;i<blockSize;i++) {
    pDst[i] = pSrcA[i] * pSrcB[i];
  }
}

/**
  @} end of BasicMultKernels group
 */
