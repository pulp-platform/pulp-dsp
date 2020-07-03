/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i16_parallel.c
 * Description:  16-bit parallel integer convolution glue code
 *
 * $Date:        01. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. 
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
   @ingroup groupFilters
*/

/**
   @addtogroup BasicConvolution
   @{
*/

/**
   @brief Glue code for parallel convolution of 16-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[in]  nPE       Number of cores to compute on
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_i16_parallel(
			   const int16_t *  pSrcA,
			   const uint32_t srcALen,
			   const int16_t *  pSrcB,
			   const uint32_t srcBLen,
			   const uint8_t nPE,
			   int32_t *  pRes){
  
  if (rt_cluster_id() == ARCHI_FC_CID){
    printf("parallel processing supported only for cluster side\n");
    return;
  }  else {

    const int16_t* pIn1;
    const int16_t* pIn2;

    uint32_t pIn1Len;
    uint32_t pIn2Len;
    
    if(srcALen >= srcBLen ){
      pIn2 = pSrcA;
      pIn1 = pSrcB;
      pIn2Len = srcALen;
      pIn1Len = srcBLen;
    } else {
      pIn2 = pSrcB;
      pIn1 = pSrcA;
      pIn2Len = srcBLen;
      pIn1Len = srcALen;
    }

    uint32_t srcAoffset = ((pIn1Len+nPE-1)/nPE);
    uint32_t resultsoffset = srcAoffset + pIn2Len - 1;
    uint32_t resultsLen = resultsoffset*(nPE-1) + (pIn1Len - (srcAoffset * (nPE-1))) + pIn2Len - 1;

    int32_t* resBuf;
    
    if(nPE > 1){
      resultsBuffer = (int32_t*)rt_alloc(RT_ALLOC_CL_DATA, sizeof(int32_t)*resultsLen);
      resBuf = resultsBuffer;
      // printf("Address of resultsBuffer: 0x%x, End: 0x%x\n", resultsBuffer, resultsBuffer + sizeof(int32_t)*resultsLen);
    } else {
      resultsBuffer = pRes;
    }
    plp_conv_instance_i16 S = {
      .srcALen = pIn1Len,
      .srcBLen = pIn2Len,
      .pSrcA = pIn1,
      .pSrcB = pIn2,
      .pRes = resultsBuffer,
      .nPE = nPE
    };

    rt_team_fork(nPE, plp_conv_i16p_xpulpv2, (void*)&S);
    if(nPE > 1){

#if defined(PLP_CONV_SEQUENTIALADDING)

      for(uint32_t i=0;i<resultsoffset;i++){
      	pRes[i] = resultsBuffer[i];
      }
      
      for(uint32_t i = resultsoffset; i<srcALen+srcBLen-1;i++){
      	pRes[i] = 0;
      }

      
      for(int32_t i=1;i<nPE-1;i++){
      	for(uint32_t j=0;j<resultsoffset;j++){
	  pRes[i*srcAoffset+j] += resultsBuffer[j+i*resultsoffset];
      	}
      }
      
      for(uint32_t j=0;j<resultsLen-resultsoffset*(nPE-1);j++){
      	pRes[(nPE-1)*srcAoffset+j] += resultsBuffer[(nPE-1)*resultsoffset + j];
      }
      
#else

      /* Parallel overlap-adding */
      plp_conv_parallel_OLA(nPE, pIn1Len, pIn2Len, resultsBuffer);

#if defined(PLP_MATH_LOOPUNROLL)

      uint32_t k = (srcALen + srcBLen - 1) >> 1U;
      int32_t temp1, temp2;
      
      while(k){
	temp1 = *resultsBuffer++;
	temp2 = *resultsBuffer++;

	*pRes++ = temp1;
	*pRes++ = temp2;
	
	k--;
      }

      k = (srcALen + srcBLen - 1) % 0x2U;

      if(k){
	*pRes++ = *resultsBuffer++;
      }
      
#else
      for(uint32_t i = 0; i<srcALen + srcBLen - 1; i++){
	pRes[i] = resultsBuffer[i];
      }
#endif
      rt_free(RT_ALLOC_CL_DATA, resBuf, sizeof(int32_t)*resultsoffset*nPE);            
#endif 
      
    }
    
    return;

  }
}

/**
   @} end of BasicConvolution group
*/
