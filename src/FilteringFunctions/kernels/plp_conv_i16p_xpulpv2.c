/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i16_xpulpv2.c
 * Description:  16-bit parallel integer convolution kernel for XPULPV2
 *
 * $Date:        01. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Moritz Scherer, ETH Zurich
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
   @brief Parallel convolution of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  task_args     pointer to plp_conv_instance_i16 struct initialized by
   plp_conv_i16_parallel
   @return        none
*/

// Pre-condition: psrcALen >= psrcBLen, established by calling function plp_conv_i32
// Pre-condition: pRes has enough allocated memory, i.e. srcALen + srcBLen-1u
// Pre-condition: srcALen >= 2 and srcBLen >= 2, otherwise use vector dot product

void plp_conv_i16p_xpulpv2(void *task_args) {

    plp_conv_instance_i16 *S = (plp_conv_instance_i16 *)task_args;

    uint32_t resultoffset = ((S->srcALen + S->nPE - 1) / S->nPE) + S->srcBLen - 1;
    uint32_t srcAoffset = ((S->srcALen + S->nPE - 1) / S->nPE);

    int16_t *pSrcA;
    uint32_t srcALen;
    int16_t *pSrcB;
    uint32_t srcBLen;
    int32_t *pRes;

    int16_t *pIn1;
    int16_t *pIn2;
    uint32_t pIn1Len;
    uint32_t pIn2Len;

    if (rt_core_id() == (S->nPE - 1)) {

        pSrcA = (int16_t *)((S->pSrcA + srcAoffset * (S->nPE - 1)));
        srcALen = S->srcALen - (srcAoffset * (S->nPE - 1));
        pSrcB = (int16_t *)(S->pSrcB);
        srcBLen = S->srcBLen;
        pRes = (int32_t *)(S->pRes + resultoffset * (S->nPE - 1));

        // printf("ID %i: 0x%x %i 0x%x %i 0x%x\n",rt_core_id(), pSrcA, srcALen, pSrcB, srcBLen,
        // pRes);

    } else {

        srcALen = srcAoffset;
        pSrcA = (int16_t *)(S->pSrcA + (rt_core_id() * srcAoffset));
        pSrcB = (int16_t *)S->pSrcB;
        srcBLen = S->srcBLen;
        pRes = (int32_t *)(S->pRes + resultoffset * (rt_core_id()));

        // printf("ID %i: 0x%x %i 0x%x %i 0x%x\n",rt_core_id(), pSrcA, srcALen, pSrcB, srcBLen,
        // pRes);
    }

    if (srcALen >= srcBLen) {
        pIn1 = pSrcA;
        pIn1Len = srcALen;
        pIn2 = pSrcB;
        pIn2Len = srcBLen;
    } else {
        pIn1 = pSrcB;
        pIn1Len = srcBLen;
        pIn2 = pSrcA;
        pIn2Len = srcALen;
    }

    plp_conv_i16s_xpulpv2(pIn1, pIn1Len, pIn2, pIn2Len, pRes);
    rt_team_barrier();
}

/**
   @} end of BasicConvolutionKernels
*/
