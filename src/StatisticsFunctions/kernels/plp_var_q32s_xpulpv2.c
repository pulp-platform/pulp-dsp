/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_var_q32s_xpulpv2.c
 * Description:  Kernel to calculate the variance of a 32-bit fixed point vector glue code on XPULPV2
 *
 * $Date:        30.06.2020
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
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
   @ingroup var
*/

/**
   @defgroup varKernels Var Kernels
*/

/**
   @addtogroup varKernels
   @{
*/

/**
   @brief         Variance of a 32-bit fixed point vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    variance returned here
   @return        none
*/

void plp_var_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int32_t *__restrict__ pRes) {

    int32_t square_of_mean;
    int32_t square_of_values;

    int32_t mean;

    plp_mean_i32(pSrc, blockSize, &mean);
    square_of_mean = (mean * mean) >> fracBits;

    plp_power_q32(pSrc, blockSize, fracBits, &square_of_values);

    *pRes = (square_of_values / blockSize - square_of_mean);
}
