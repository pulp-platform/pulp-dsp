/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i32_xpulpv2.c
 * Description:  32-bit fixed point scalar dot product kernel for RV32IM
 *
 * $Date:        01. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 Moritz Scherer, IIS, ETH Zurich. All rights reserved.
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
   @ingroup BasicConvolution
*/

/**
   @addtogroup BasicConvolutionKernels
   @{
*/

/**
   @brief Convolution of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

// Pre-condition: psrcALen >= psrcBLen, established by calling function plp_conv_i32
// Pre-condition: pRes has enough allocated memory, i.e. srcALen + srcBLen-1u
// Pre-condition: srcALen >= 2 and srcBLen >= 2, otherwise use vector dot product

void plp_conv_i32p_xpulpv2(void* task_args){

  //plp_conv_instance_i32* S = (plp_conv_instance_i32*)task_args;

  printf("Entered and casted!\n");
  
  /* int32_t resultoffset = ((S->srcALen+S->nPE-1)/S->nPE) + S->srcBLen - 1; */
  /* int32_t srcAoffset = ((S->srcALen+S->nPE-1)/S->nPE); */

  /* int32_t *  pSrcA; */
  /* uint32_t srcALen; */
  /* int32_t *  pSrcB; */
  /* uint32_t srcBLen; */
  /* uint8_t nPE; */
  /* int32_t *  pRes; */
  
  /* if(rt_core_id() == (S->nPE - 1)){ */

  /*   pSrcA = (S->pSrcA + srcAoffset * (S->nPE-1)); */
  /*   srcALen = S->srcALen - srcAoffset * (S->nPE-1); */
  /*   pSrcB = S->pSrcB; */
  /*   srcBLen = S->srcBLen; */
  /*   nPE = S->nPE; */
  /*   pRes = S->pRes + resultoffset*(S->nPE-1); */

  /*   //  printf("ID %i: %i %i %i %i %i\n",rt_core_id(), pSrcA, srcALen, pSrcB, srcBLen, pRes); */
    
  /* } else { */
  
  /*   srcALen = ((S->srcALen+S->nPE-1)/S->nPE); */
  /*   pSrcA = S->pSrcA + (rt_core_id()*srcALen); */
  /*   pSrcB = S->pSrcB; */
  /*   srcBLen = S->srcBLen; */
  /*   nPE = S->nPE; */
  /*   pRes = S->pRes + resultoffset*(rt_core_id()); */
  /* } */

  //plp_conv_i32s_xpulpv2(pSrcA, srcALen, pSrcB, srcBLen, pRes);

  //rt_team_barrier();
  
}
