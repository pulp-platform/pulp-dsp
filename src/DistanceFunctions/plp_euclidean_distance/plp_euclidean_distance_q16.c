/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_q32.c
 * Description:  32-bit fixed-point Euclidean distance glue code
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
  @defgroup Euclidean distance
  Euclidean distance
 */

/**
  @addtogroup Euclidean
  @{
 */

/**
  @brief Glue code for euclidean distance of 16-bit fixed point vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits   number of fixed point fractional bits
  @param[out] pRes     output result returned here
  @return     none
 */

void plp_euclidean_distance_q16(  const int16_t *__restrict__ pSrcA,
                                  const int16_t *__restrict__ pSrcB,
                                  uint16_t blockSize,
                                  uint16_t fracBits,
                                  int32_t *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_euclidean_distance_q16s_rv32im(pSrcA, pSrcB, blockSize, fracBits, pRes);
    } else {
        plp_euclidean_distance_q16s_xpulpv2(pSrcA, pSrcB, blockSize, fracBits, pRes);
    }
}

/**
  @} end of Euclidean group
 */
