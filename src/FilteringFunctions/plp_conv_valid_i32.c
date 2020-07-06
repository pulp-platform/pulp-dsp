/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i32.c
 * Description:  32-bit integer convolution (valid) glue code
 *
 * $Date:        2. May 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. 
 *
 * Author: Moritz Scherer, Tibor Schneider
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
 * @ingroup groupFilters
 */

/**
 * @addtogroup BasicConvolution
 * @{
 */

/**
 * @brief Glue code for convolution of 32-bit integer vectors in valid range.
 * @param[in]  pSrcA   points to the first input vector
 * @param[in]  srcALen ength of the first input vector
 * @param[in]  pSrcB   points to the second input vector
 * @param[in]  srcBLen Length of the second input vector
 * @param[out] pRes    output result returned here, of size |srcALen - srcBLen| + 1
 * @return     none
 */
void plp_conv_valid_i32(const int32_t*  pSrcA,
                        const uint32_t srcALen,
                        const int32_t*  pSrcB,
                        const uint32_t srcBLen,
                        int32_t *  pRes){
    
    uint32_t in1Len, in2Len;
    const int32_t* pIn1;
    const int32_t* pIn2;

    if(srcALen >= srcBLen){
        in1Len = srcALen;
        in2Len = srcBLen;
        pIn1 = pSrcA;
        pIn2 = pSrcB;
    } else {
        in2Len = srcALen;
        in1Len = srcBLen;
        pIn2 = pSrcA;
        pIn1 = pSrcB;
    }

    if (rt_cluster_id() == ARCHI_FC_CID){

        printf("Errorr: Not Implemented!");

    } else {

        plp_conv_valid_i32s_xpulpv2(pIn1, in1Len, pIn2, in2Len, pRes);

    }
}


/**
 * @} end of BasicConvolution group
 */
