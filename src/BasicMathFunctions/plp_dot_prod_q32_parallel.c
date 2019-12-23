/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_q32_parallel.c
 * Description:  32-bit fixed point parallel dot product glue code
 *
 * $Date:        04. Jun 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. All rights reserved.
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
  @brief Glue code for parallel dot product of 32-bit fixed point vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  deciPoint  decimal point for right shift
  @param[in]  nPE        number of parallel processing units
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_dot_prod_q32_parallel(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t blockSize,
                         uint32_t deciPoint,
                         uint32_t nPE,
                         int32_t * __restrict__ pRes){

  if (rt_cluster_id() == ARCHI_FC_CID){
    printf("parallel processing supported only for cluster side\n");
    return;
  }
  else{

    uint32_t i;
    int32_t resBuffer[rt_nb_pe()];
    // initialize results buffer
    /* not necessary
    for (i=0; i<rt_nb_pe(); i++){
      resBuffer[i]=0;
      //printf("i %d, buffer %d, rt_nb_pe %d, rt_core_id %d\n", i, resBuffer[i], rt_nb_pe(), rt_core_id());
    }
    */

    plp_dot_prod_instance_q32 S;

    // Initialize the plp_dot_prod_instance
    S.pSrcA = pSrcA;
    S.pSrcB = pSrcB;
    S.blkSizePE = blockSize/nPE;
    S.deciPoint = deciPoint;
    S.nPE = nPE;
    S.resBuffer = resBuffer;

    // Fork the dot product to nPE cores (i.e. processing units)
    rt_team_fork(nPE, plp_dot_prod_q32p_xpulpv2, (void *)&S);

    int sum = 0;
    for (i=0; i<nPE; i++){ // not necessary rt_nb_pe()
      sum += resBuffer[i];
    }
#if defined(PLP_MATH_LOOPUNROLL)
    //uint32_t blkCnt = blockSize/nPE/2 * 2 * nPE;
    //printf("blkCnt %d\n", blkCnt);
    for (i= (blockSize/nPE/2) * 2* nPE; i<blockSize; i++){
      //printf("i %d, blockSize/nPE %d, (blockSize/nPE) * nPE %d\n", i, (blockSize/nPE), (blockSize/nPE) * nPE);
      sum += pSrcA[i]*pSrcB[i];
    }
#else // PLP_MATH_LOOPUNROLL
    for (i= (blockSize/nPE) * nPE; i<blockSize; i++){
      sum += pSrcA[i]*pSrcB[i];
    }
#endif


    *pRes = sum;


  }

}

/**
  @} end of BasicDotProd group
 */
