/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mult_i8_parallel.c
 * Description:  8-bit integer parallel multiplication glue code
 *
 * $Date:        06. Mar 2023
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna.
 *
 * Author: Viviane Potocnik, ETH Zurich
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
  @addtogroup BasicMult
  @{
 */

/**
  @brief Glue code for parallel dot product of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pDst       points to output vector
  @return        none
 */

void plp_abs_i16_parallel(const int16_t *__restrict__ pSrcA,
                                int16_t *__restrict__ pDst,
                               uint32_t blockSize,
                               uint32_t nPE) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {

        uint32_t i, tmpblkSizePE = blockSize / nPE;

        plp_abs_instance_i16 S;

        // Initialize the plp_dot_prod_instance
        S.pSrcA = pSrcA;
        S.blkSizePE = tmpblkSizePE;
        S.nPE = nPE;
        S.pDst = pDst;

        // Fork the function to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPE, plp_abs_i16p_xpulpv2, (void *)&S);

        // clean up
        for (i = (tmpblkSizePE)*nPE; i < blockSize; i++) {
            pDst[i] = __builtin_abs(pSrcA[i]);
        }
    }
}

/**
  @} end of BasicMult group
 */
