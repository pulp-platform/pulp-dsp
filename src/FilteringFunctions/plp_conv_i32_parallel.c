/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i32_parallel.c
 * Description:  32-bit paralell integer convolution glue code
 *
 * $Date:        01. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich. All rights reserved.
 *
 * Author: Moritz Scherer
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
#include "rt/rt_api.h"

RT_CL_DATA int32_t* resultsBuffer;

/**
   @ingroup groupMath
*/

/**
   @addtogroup BasicConvolution
   @{
*/

/**
   @brief Glue code for parallel convolution of 32-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  SrcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  SrcBLen   Length of the second input vector
   @param[in]  nPe       Number of cores to compute on
   @param[out] result     output result returned here
   @return        none
*/

void plp_conv_i32_parallel(
			   const int32_t *  pSrcA,
			   const uint32_t srcALen,
			   const int32_t *  pSrcB,
			   const uint32_t srcBLen,
			   const uint8_t nPE,
			   int32_t *  pRes){
  
  if (rt_cluster_id() == ARCHI_FC_CID){
    printf("parallel processing supported only for cluster side\n");
    return;
  }  else {

    int32_t* pIn1;
    int32_t* pIn2;

    uint32_t pIn1Len;
    uint32_t pIn2Len;
    
    if(srcALen >= srcBLen ){
      pIn1 = pSrcA;
      pIn2 = pSrcB;
      pIn1Len = srcALen;
      pIn2Len = srcBLen;
    } else {
      pIn1 = pSrcB;
      pIn2 = pSrcA;
      pIn1Len = srcBLen;
      pIn2Len = srcALen;
    }

    uint32_t srcAoffset = ((pIn1Len+nPE-1)/nPE);
    uint32_t resultsoffset = srcAoffset + pIn2Len - 1;
    uint32_t resultsLen = resultsoffset*(nPE-1) + (pIn1Len - (srcAoffset * (nPE-1))) + pIn2Len - 1;
    
    if(nPE > 1){
      resultsBuffer = (int32_t*)rt_alloc(RT_ALLOC_CL_DATA, sizeof(int32_t)*resultsLen);
      printf("Address of resultsBuffer: 0x%x, End: 0x%x\n", resultsBuffer, resultsBuffer + sizeof(int32_t)*resultsLen);
    } else {
      resultsBuffer = pRes;
    }
    plp_conv_instance_i32 S = {
      .srcALen = pIn1Len,
      .srcBLen = pIn2Len,
      .pSrcA = pIn1,
      .pSrcB = pIn2,
      .pRes = resultsBuffer,
      .nPE = nPE
    };

    
    rt_team_fork(nPE, plp_conv_i32p_xpulpv2, (void*)&S);

    if(nPE > 1){

      for(int i=0;i<resultsoffset;i++){
	pRes[i] = resultsBuffer[i];
      }
      
      for(int i = resultsoffset; i<srcALen+srcBLen-1;i++){
	pRes[i] = 0;
      }

      for(int i=1;i<nPE-1;i++){
	for(int j=0;j<resultsoffset;j++){
	   pRes[i*srcAoffset+j] += resultsBuffer[j+i*resultsoffset];
	}
      }
      for(int j=0;j<resultsLen-resultsoffset*(nPE-1);j++){
      	pRes[(nPE-1)*srcAoffset+j] += resultsBuffer[(nPE-1)*resultsoffset + j];
      }
      
      /* for(int i=0;i<resultsoffset;i++){ */
      /* 	pRes[i] = resultsBuffer[i]; */
      /* } */
      /* for(int i=1;i<nPE-1;i++){ */
      /* 	for(int j=0;j<pIn2Len-1;j++){ */
      /* 	  pRes[i*srcAoffset+j] += resultsBuffer[j+i*resultsoffset]; */
      /* 	} */
      /* 	for(int j=pIn2Len-1;j<resultsoffset;j++){ */
      /* 	  pRes[i*srcAoffset+j] = resultsBuffer[j+i*resultsoffset]; */
      /* 	} */
      /* } */
      /* for(int j=0;j<(pIn1Len - (srcAoffset * (nPE-1)));j++){ */
      /* 	pRes[(nPE-1)*srcAoffset+j] += resultsBuffer[j+(nPE-1)*resultsoffset]; */
      /* } */
      /* for(int j=0;j<pIn2Len;j++){ */
      /* 	pRes[srcALen+srcBLen-1-j-1] = resultsBuffer[resultsLen-1-j]; */
      /* } */
      
    }
    return;
  }
}

/**
   @} end of BasicConvolution group
*/
