/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i32.c
 * Description:  32-bit floating-point convolution glue code
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
#define OLARATIO32 10 // Eight is optimal in terms of overhead minimization

static float32_t *_pRes1_32;

/**
   @ingroup groupFilters
*/

/**
   @defgroup BasicConvolution Basic Convolution
   This module contains the glue code for Basic Convolution. The kernel codes (kernels) are in the
   Moducle Basic Convolution Kernels.


*/

/**
   @addtogroup BasicConvolution
   @{
*/

/**
   @brief Glue code for convolution of 32-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/
void plp_conv_f32(const float32_t *pSrcA,
                  const uint32_t srcALen,
                  const float32_t *pSrcB,
                  const uint32_t srcBLen,
                  float32_t *__restrict__ pRes) {

    uint32_t in1Len, in2Len;
    const float32_t *pIn1;
    const float32_t *pIn2;

    if (srcALen >= srcBLen) {
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

    uint32_t nPE = (OLARATIO32 / (in1Len / in2Len));
    nPE = nPE > 0 ? nPE : 1;
    uint32_t src2Offset = ((in2Len + nPE - 1) / nPE);
    uint32_t resultsoffset = src2Offset + in1Len - 1;
    uint32_t lastresultLen = (in2Len - (src2Offset * (nPE - 1))) + in1Len - 1;

    uint32_t k;
    float32_t temp1, temp2;

    for (uint32_t i = 0; i < srcALen + srcBLen - 1; i++) {
        pRes[i] = 0;
    }

    if (hal_cluster_id() == ARCHI_FC_CID) {

        printf("FC does not have an FPU!\n");

        // _pRes1_32 = hal_fc_l1_malloc(sizeof(float32_t) * (resultsoffset));

        // float32_t *pOut = pRes;
        // float32_t *_pRes = _pRes1_32;

        // for (uint32_t i = 0; i < nPE - 1; i++) {
        //     plp_conv_f32s_rv32im(pIn1, in1Len, pIn2 + i * src2Offset, src2Offset, _pRes1_32);

        //     pOut = pRes + i * src2Offset;
        //     _pRes = _pRes1_32;

        //     k = resultsoffset >> 1;
        //     while (k) {

        //         temp1 = *_pRes++;
        //         temp2 = *_pRes++;

        //         *pOut++ += temp1;
        //         *pOut++ += temp2;

        //         k--;
        //     }

        //     k = resultsoffset % 2U;

        //     if (k) {
        //         *pOut++ += *_pRes++;
        //     }
        // }

        // plp_conv_f32s_rv32im(pIn1, in1Len, pIn2 + (nPE - 1) * src2Offset,
        //                      in2Len - (src2Offset * (nPE - 1)), _pRes1_32);

        // pOut = pRes + (nPE - 1) * src2Offset;
        // _pRes = _pRes1_32;

        // k = lastresultLen >> 1;

        // while (k) {

        //     temp1 = *_pRes++;
        //     temp2 = *_pRes++;

        //     *pOut++ += temp1;
        //     *pOut++ += temp2;

        //     k--;
        // }

        // k = lastresultLen % 2U;

        // if (k) {
        //     *pOut++ += *_pRes++;
        // }

    } else {

        _pRes1_32 = hal_fc_l1_malloc(sizeof(float32_t) * (resultsoffset));

        float32_t *pOut = pRes;
        float32_t *_pRes = _pRes1_32;

        for (uint32_t i = 0; i < nPE - 1; i++) {
            plp_conv_f32s_rv32im(pIn1, in1Len, pIn2 + i * src2Offset, src2Offset, _pRes1_32);

            pOut = pRes + i * src2Offset;
            _pRes = _pRes1_32;

            k = resultsoffset >> 1;
            while (k) {

                temp1 = *_pRes++;
                temp2 = *_pRes++;

                *pOut++ += temp1;
                *pOut++ += temp2;

                k--;
            }

            k = resultsoffset % 2U;

            if (k) {
                *pOut++ += *_pRes++;
            }
        }

        plp_conv_f32s_rv32im(pIn1, in1Len, pIn2 + (nPE - 1) * src2Offset,
                             in2Len - (src2Offset * (nPE - 1)), _pRes1_32);

        pOut = pRes + (nPE - 1) * src2Offset;
        _pRes = _pRes1_32;

        k = lastresultLen >> 1;

        while (k) {

            temp1 = *_pRes++;
            temp2 = *_pRes++;

            *pOut++ += temp1;
            *pOut++ += temp2;

            k--;
        }

        k = lastresultLen % 2U;

        if (k) {
            *pOut++ += *_pRes++;
        }
    }
    hal_cl_l1_free(_pRes1_32, sizeof(float32_t) * (resultsoffset));
}

/**
   @} end of BasicConvolution group
*/
