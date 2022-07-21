/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_f32p_xpulpv2.c
 * Description:  32-bit floating-point Euclidean distance for XPULPV2 with interleaved access
 *
 * $Date:        15 Mar 2022
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
  @brief        32-bit floating-point parallel Euclidean distance between two vectors
  @param[in]    S points to the instance structure for float euclidean distance
  @return       none
 */

void plp_euclidean_distance_f32p_xpulpv2(void *S) {

    float32_t *pSrcA = (float32_t *)(((plp_euclidean_distance_instance_f32 *)S)->pSrcA) + hal_core_id();
    float32_t *pSrcB = (float32_t *)(((plp_euclidean_distance_instance_f32 *)S)->pSrcB) + hal_core_id();
    uint32_t blkSizePE = ((plp_euclidean_distance_instance_f32 *)S)->blkSizePE;
    uint32_t nPE = ((plp_euclidean_distance_instance_f32 *)S)->nPE;
    float32_t *resBufferPE = &(((plp_euclidean_distance_instance_f32 *)S)->resBuffer[hal_core_id()]);

    uint32_t blkCnt, tmpBS; /* Loop counter, temporal BlockSize */

    float32_t accum = 0.0f, tmp;
    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt++) {
        tmp = pSrcA[nPE * blkCnt] - pSrcB[nPE * blkCnt];
        accum += tmp*tmp;
    }
    *resBufferPE = accum;
}


/**
   @} end of Euclidean group
*/
