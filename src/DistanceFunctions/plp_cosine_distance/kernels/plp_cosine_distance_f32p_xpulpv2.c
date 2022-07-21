/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cosine_distance_f32p_xpulpv2.c
 * Description:  32-bit floating-point cosine distance for XPULPV2
 *
 * $Date:        28 Mar 2022
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
  @brief        32-bit floating-point parallel cosine distance between two vectors (computes power in parallel)
  @param[in]    S points to the instance structure for float cosine distance
  @return       none
 */

void plp_cosine_distance_f32p_xpulpv2(void *S) {

    float32_t *pSrcA = (float32_t *)(((plp_euclidean_distance_instance_f32 *)S)->pSrcA) + hal_core_id();
    float32_t *pSrcB = (float32_t *)(((plp_euclidean_distance_instance_f32 *)S)->pSrcB) + hal_core_id();
    uint32_t blkSizePE = ((plp_euclidean_distance_instance_f32 *)S)->blkSizePE;
    uint32_t nPE = ((plp_euclidean_distance_instance_f32 *)S)->nPE;
    float32_t *resBufferPE_A = &(((plp_cosine_distance_instance_f32 *)S)->resBuffer_A[hal_core_id()]);
    float32_t *resBufferPE_B = &(((plp_cosine_distance_instance_f32 *)S)->resBuffer_B[hal_core_id()]);
    float32_t *resBufferPE_dot = &(((plp_cosine_distance_instance_f32 *)S)->resBuffer_dot[hal_core_id()]);

    uint32_t blkCnt = 0;
    float32_t accum_A = 0.0f, accum_B = 0.0f, accum_dot = 0.0f, tmp_A, tmp_B;
    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt++) {
        tmp_A = pSrcA[nPE * blkCnt];
        tmp_B = pSrcB[nPE * blkCnt];
        accum_A += tmp_A*tmp_A;
        accum_B += tmp_B*tmp_B;
        accum_dot += tmp_A*tmp_B;
    }
    *resBufferPE_A = accum_A;
    *resBufferPE_B = accum_B;
    *resBufferPE_dot = accum_dot;
}


/**
   @} end of cosine group
*/
