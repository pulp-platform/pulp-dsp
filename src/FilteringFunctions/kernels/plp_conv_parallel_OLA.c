/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_parallel_OLA.c
 * Description:  Parallel integer convolution for XPULPV2 using OLA method
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
#include "rtos_hal.h"

/**
   @ingroup BasicConvolution
*/

/**
   @addtogroup BasicConvolutionKernels
   @{
*/

/**
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] nPE Number of processing cores
   @param[in] srcALen Length of the first original input vector
   @param[in] srcBLen Length of the second original input vector
   @param[in] resultsBuffer resultsBuffer array from plp_conv_i[XX]_parallel
   @return none
*/

void plp_conv_parallel_OLA(uint32_t nPE,
                           uint32_t srcALen,
                           uint32_t srcBLen,
                           int32_t *resultsBuffer) {

    uint32_t srcAoffset = ((srcALen + nPE - 1) / nPE);
    uint32_t resultsoffset = srcAoffset + srcBLen - 1;
    uint32_t resultsLen =
        resultsoffset * (nPE - 1) + (srcALen - (srcAoffset * (nPE - 1))) + srcBLen - 1;

    uint32_t cycles = nPE;
    uint32_t remainingcycles = cycles;
    uint32_t participants = nPE >> (1);

    plp_conv_tree_add_instance S = { .addOffset = srcAoffset,
                                     .addLengthfirst = resultsoffset,
                                     .addLengthsecond =
                                         (srcALen - (srcAoffset * (nPE - 1))) + srcBLen - 1,
                                     .numVectors = nPE,
                                     .pRes = resultsBuffer,
                                     .blockOffset = resultsoffset,
                                     .coresPerVector = 2 * ((nPE) / ((S.numVectors >> 1) << 1)) };

    while (remainingcycles > 1U) {

        hal_cl_team_fork((S.coresPerVector * (S.numVectors >> 1)), plp_conv_parallel_OLA_kernel,
                     (void *)&S);

        S.numVectors = S.numVectors - participants;
        S.blockOffset *= 2;
        S.addLengthfirst = S.addLengthfirst + S.addOffset;
        S.addOffset *= 2;
        remainingcycles = (remainingcycles + 1) >> 1;
        participants = S.numVectors >> 1;
        S.coresPerVector = ((2 * nPE) / ((S.numVectors >> 1) << 1));
    }
}

/**
   @} end of BasicConvolutionKernels
*/
