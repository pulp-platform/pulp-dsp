/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cosine_distance_f32_parallel.c
 * Description:  32-bit floating point cosine distance kernel for RV32IM
 *
 * $Date:        21. March 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2022 ETH Zurich and University of Bologna.
 *
 * Author: Marco Bertuletti ETH Zurich
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
  @brief      Glue code for parallel cosine distance between 32-bit float vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pRes       output result returned here
  @return     none
 */

void plp_cosine_distance_f32_parallel(  const float32_t *__restrict__ pSrcA,
                                        const float32_t *__restrict__ pSrcB,
                                        uint32_t blockSize,
                                        uint32_t nPE,
                                        float32_t *__restrict__ pRes) {
  /*float32_t pwrA, pwrB;
  float32_t dot, tmp;
  plp_power_f32_parallel(pSrcA, blockSize, nPE, &pwrA);
  plp_power_f32_parallel(pSrcB, blockSize, nPE, &pwrB);
  tmp = pwrA*pwrB;

  plp_dot_prod_f32_parallel(pSrcA, pSrcB, blockSize, nPE, &dot);
  plp_sqrt_f32(&tmp, &tmp);
  *pRes = 1.0f - dot/tmp;*/

  if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {


        uint32_t i;
        uint32_t tmpblkSizePE = blockSize / 2;
        float32_t resBuffer_A[2];
        float32_t resBuffer_B[2];
        float32_t resBuffer_dot[2];
        plp_cosine_distance_instance_f32 S;

        // Initialize the plp_cosine_distance_instance
        S.pSrcA = pSrcA;
        S.pSrcB = pSrcB;
        S.blkSizePE = tmpblkSizePE;
        S.nPE = 2;
        S.resBuffer_A = resBuffer_A;
        S.resBuffer_B = resBuffer_B;
        S.resBuffer_dot = resBuffer_dot;

        hal_cl_team_fork(2, plp_cosine_distance_f32p_xpulpv2, (void *)&S);

        float32_t pwrA = 0, pwrB=0;
        float32_t dot = 0;
        for (i = 0; i < 2; i++) { // not necessary hal_cl_nb_pe_cores()
            pwrA += resBuffer_A[i];
            pwrB += resBuffer_B[i];
            dot += resBuffer_dot[i];
        }


        /*uint32_t nPEdot = nPE;
        uint32_t nPEpwr = nPE;

        uint32_t i;
        uint32_t tmpblkSizePE_pwr = blockSize / nPEpwr;
        float32_t resBuffer_pwr[nPEpwr];
        plp_power_instance_f32 S_pwr;
        // Initialize the plp_power_instance
        S_pwr.blkSizePE = tmpblkSizePE_pwr;
        S_pwr.nPE = nPE;
        S_pwr.resBuffer = resBuffer_pwr;

        // POWER OF THE FIRST VECTOR
        S_pwr.pSrc = pSrcA;
        // Fork the dot product to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPEpwr, plp_power_f32p_xpulpv2, (void *)&S_pwr);
        float32_t pwrA = 0, tmpA;
        for (i = 0; i < nPE; i++) { // not necessary hal_cl_nb_pe_cores()
            pwrA += resBuffer_pwr[i];
        }
        for (i = (tmpblkSizePE_pwr)*nPEpwr; i < blockSize; i++) {
            tmpA = pSrcA[i];
            pwrA += tmpA*tmpA;
        }

        // POWER OF THE SECOND VECTOR
        S_pwr.pSrc = pSrcB;
        // Fork the dot product to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPE, plp_power_f32p_xpulpv2, (void *)&S_pwr);
        float32_t pwrB = 0, tmpB;
        for (i = 0; i < nPE; i++) { // not necessary hal_cl_nb_pe_cores()
            pwrB += resBuffer_pwr[i];
        }
        for (i = (tmpblkSizePE_pwr)*nPEpwr; i < blockSize; i++) {
            tmpB = pSrcB[i];
            pwrB += tmpB*tmpB;
        }

        // DOT PRODUCT
        float32_t dot = 0;
        plp_dot_prod_f32s_xpulpv2(pSrcA, pSrcB, blockSize, &dot);

        // DOT PRODUCT
        uint32_t tmpblkSizePE_dot = blockSize / nPEdot;
        float32_t resBuffer_dot[nPEdot];
        plp_dot_prod_instance_f32 S_dot;
        // Initialize the plp_dot_prod_instance
        S_dot.pSrcA = pSrcA;
        S_dot.pSrcB = pSrcB;
        S_dot.blkSizePE = tmpblkSizePE_dot;
        S_dot.nPE = nPEdot;
        S_dot.resBuffer = resBuffer_dot;

        // Fork the dot product to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPEdot, plp_dot_prod_f32p_xpulpv2, (void *)&S_dot);
        float32_t dot = 0;
        for (i = 0; i < nPEdot; i++) { // not necessary hal_cl_nb_pe_cores()
            dot += resBuffer_dot[i];
        }
        for (i = (tmpblkSizePE_dot)*nPEdot; i < blockSize; i++) {
            dot += pSrcA[i] * pSrcB[i];
        }*/

        float32_t tmp = pwrA*pwrB;
        plp_sqrt_f32(&tmp, &tmp);
        *pRes = 1.0f - dot/tmp;
    }

}

/**
   @} end of cosine group
*/