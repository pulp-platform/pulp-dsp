/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i8.c
 * Description:  8-bit integer convolution glue code
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


/**
  @ingroup groupMath
 */

/**
  @addtogroup BasicConvolution
  @{
 */

/**
  @brief Glue code for convolution of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[out] result     output result returned here
  @return        none
 */
void plp_conv_i8(
                       const int8_t *  pSrcA,
		       const uint32_t srcALen,
                       const int8_t *  pSrcB,
		       const uint32_t srcBLen,
                       int32_t *  pRes){
  if (rt_cluster_id() == ARCHI_FC_CID){
    if(srcALen >= srcBLen){
      plp_conv_i8s_rv32im(pSrcA, srcALen, pSrcB, srcBLen, pRes);
    } else {
      plp_conv_i8s_rv32im(pSrcB, srcBLen, pSrcA, srcALen, pRes);
    }
  }
  else{
    if(srcALen >= srcBLen){
      plp_conv_i8s_xpulpv2(pSrcA, srcALen, pSrcB, srcBLen, pRes);
    } else {
      plp_conv_i8s_xpulpv2(pSrcB, srcBLen, pSrcA, srcALen, pRes);
    }
  }  
}

/**
  @} end of BasicConvolution group
 */
