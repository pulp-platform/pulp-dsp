/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i32_parallel.c
 * Description:  32-bit integer parallel dot product glue code
 *
 * $Date:        03. Jun 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
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
  @ingroup groupMath
 */

/**
  @addtogroup BasicDotProd
  @{
 */

/**
  @brief Glue code for parallel dot product of 32-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_dot_prod_i32_parallel(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t nPE,
                               int32_t *__restrict__ pRes) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {

        uint32_t i, tmpblkSizePE = blockSize / nPE;
        int32_t resBuffer[hal_cl_nb_pe_cores()];
        // initialize results buffer
        /* not necessary
        for (i=0; i<hal_cl_nb_pe_cores(); i++){
          resBuffer[i]=0;
          //printf("i %d, buffer %d, hal_cl_nb_pe_cores %d, hal_core_id %d\n", i, resBuffer[i], hal_cl_nb_pe_cores(),
        hal_core_id());
        }
        */

        plp_dot_prod_instance_i32 S;

        // Initialize the plp_dot_prod_instance
        S.pSrcA = pSrcA;
        // printf("pSrcA[0] %d\n", pSrcA[0]);
        S.pSrcB = pSrcB;
        S.blkSizePE = tmpblkSizePE;
        S.nPE = nPE;
        S.resBuffer = resBuffer;

        // Fork the dot product to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPE, plp_dot_prod_i32p_xpulpv2, (void *)&S);

        int sum = 0;
        for (i = 0; i < nPE; i++) { // not necessary hal_cl_nb_pe_cores()
            sum += resBuffer[i];
        }
#if defined(PLP_MATH_LOOPUNROLL)
        // uint32_t blkCnt = blockSize/nPE/2 * 2 * nPE;
        // printf("blkCnt %d\n", blkCnt);
        for (i = ((tmpblkSizePE >> 1) << 1) * nPE; i < blockSize; i++) {
            sum = __MAC(sum, pSrcA[i], pSrcB[i]);
        }
#else // PLP_MATH_LOOPUNROLL
        for (i = (tmpblkSizePE)*nPE; i < blockSize; i++) {
            sum += pSrcA[i] * pSrcB[i];
        }
#endif

        *pRes = sum;
    }
}

/**
  @} end of BasicDotProd group
 */
