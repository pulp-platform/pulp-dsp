/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_q32_parallel.c
 * Description:  32-bit fixed-point Euclidean distance glue code
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
  @brief Glue code for parallel Euclidean distance of 32-bit fixed point vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits   number of fixed point fractional bits
  @param[in]  nPE        number of parallel processing units
  @param[out] pRes     output result returned here
  @return     none
 */

void plp_euclidean_distance_q32_parallel(   const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t blockSize,
                                            uint32_t fracBits,
                                            uint32_t nPE,
                                            uint32_t *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {

        uint32_t i;
        int32_t resBuffer[hal_cl_nb_pe_cores()];

        plp_euclidean_distance_instance_q32 S;

        // Initialize the plp_dot_prod_instance
        S.pSrcA = pSrcA;
        S.pSrcB = pSrcB;
        S.blkSizePE = blockSize/nPE;
        S.fracBits = fracBits;
        S.nPE = nPE;
        S.resBuffer = resBuffer;

        // Fork the dot product to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPE, plp_euclidean_distance_q32p_xpulpv2, (void *)&S);
        int32_t sum = 0;
        for (i = 0; i < nPE; i++) {
            sum += resBuffer[i];
        }
        plp_sqrt_q32(&sum, fracBits, pRes);

    }
}

/**
  @} end of Euclidean group
 */
