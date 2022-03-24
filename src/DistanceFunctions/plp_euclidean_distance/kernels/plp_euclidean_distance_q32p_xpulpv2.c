/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_q32p_xpulpv2.c
 * Description:  32-bit integer scalar Euclidean distance for XPULPV2 with interleaved access
 *
 * $Date:        17. Mar 2022
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
  @brief          Parallel euclidean distance with interleaved access 32-bit fixed point vectors.
                  vectors kernel for XPULPV2 extension.
  @param[in]  S   points to the instance structure for integer parallel Euclidean distance
  @return         none
 */

void plp_euclidean_distance_q32p_xpulpv2(void *S) {

    int core_id = hal_core_id();
    uint32_t blkCnt;
    int32_t sum = 0;
    
    uint32_t blkSizePE = ((plp_euclidean_distance_instance_q32 *)S)->blkSizePE;
    int32_t *pSrcA = (int32_t *)(((plp_euclidean_distance_instance_q32 *)S)->pSrcA)+ hal_core_id()*blkSizePE;
    int32_t *pSrcB = (int32_t *)(((plp_euclidean_distance_instance_q32 *)S)->pSrcB)+ hal_core_id()*blkSizePE;
    uint32_t nPE = ((plp_euclidean_distance_instance_q32 *)S)->nPE;
    uint32_t fracBits = ((plp_euclidean_distance_instance_q32 *)S)->fracBits;
    int32_t *resBufferPE = &(((plp_euclidean_distance_instance_q32 *)S)->resBuffer[hal_core_id()]);

#if defined(PLP_MATH_LOOPUNROLL)

    for (blkCnt = 0; blkCnt < blkSizePE - 1; blkCnt += 2) {
        int32_t tmp0 = pSrcA[blkCnt] - pSrcB[blkCnt];
        int32_t tmp1 = pSrcA[blkCnt + 1] - pSrcB[blkCnt + 1];
        sum += __ADDROUNDNORM_REG(tmp0*tmp0, tmp1*tmp1, fracBits);
    }

    while (blkCnt != blkSizePE) {
        int32_t tmp = pSrcA[blkCnt++] - pSrcB[blkCnt++];
        sum += __ROUNDNORM_REG(tmp*tmp, fracBits);
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt++) {
        int32_t tmp = pSrcA[blkCnt] - pSrcB[blkCnt];
        sum += __ROUNDNORM_REG(tmp*tmp, fracBits);
    }

#endif // PLP_MATH_LOOPUNROLL

    *resBufferPE = sum;

}

/**
   @} end of Euclidean group
*/
