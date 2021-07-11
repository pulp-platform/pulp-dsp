/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_log_f32_parallel.c
 * Description:  32-bit float parallel log glue code
 *
 * $Date:        10. July 2021
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna.
 *
 * Author: Aron Szakacs, ETH Zurich
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
  @ingroup groupMath
 */

/**
  @addtogroup BasicLog
  @{
 */

/**
  @brief Glue code for parallel log of 32-bit float vectors.
  @param[in]  pSrc       points to the input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pDst       points to output vector
  @return        none
 */

void plp_log_f32_parallel(const float32_t *__restrict__ pSrc,
                               uint32_t blockSize,
                               uint32_t nPE,
                               float32_t *__restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {

        uint32_t i, tmpblkSizePE = blockSize / nPE;

        plp_log_instance_f32 S;

        // Initialize the plp_dot_prod_instance
        S.pSrc = pSrc;
        // printf("pSrcA[0] %d\n", pSrcA[0]);
        S.blkSizePE = tmpblkSizePE;
        S.nPE = nPE;
        S.pDst = pDst;

        // Fork the dot product to nPE cores (i.e. processing units)
        rt_team_fork(nPE, plp_log_f32p_xpulpv2, (void *)&S);

        /* #if defined(PLP_MATH_LOOPUNROLL) */
        /* #undef PLP_MATH_LOOPUNROLL */
        /* #endif */

        /* #if defined(PLP_MATH_LOOPUNROLL) */
        /*     //uint32_t blkCnt = blockSize/nPE/2 * 2 * nPE; */
        /*     //printf("blkCnt %d\n", blkCnt); */
        /*     for (i= ((tmpblkSizePE>>1) <<1) * nPE; i<blockSize; i++){ */
        /*       sum += pSrcA[i] * pSrcB[i]; */
        /*     } */
        /* #else // PLP_MATH_LOOPUNROLL */
        for (i = (tmpblkSizePE)*nPE; i < blockSize; i++) {
            pDst[i] = log(pSrc[i]);
        }
        /* #endif */

        /* #define PLP_MATH_LOOPUNROLL */
    }
}

/**
  @} end of BasicMult group
 */
