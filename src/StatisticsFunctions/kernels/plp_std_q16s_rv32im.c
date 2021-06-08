/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_std_q16s_rv32im.c
 * Description:  Kernel to calculate the standard deviation of a 16-bit fixed point vector glue code
 *on RV32IM
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
   @ingroup std
*/

/**
   @defgroup stdKernels Std Kernels
*/

/**
   @addtogroup stdKernels
   @{
*/

/**
   @brief         Standard deviation of a 16-bit fixed point vector for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    standard deviation returned here
   @return        none
*/

void plp_std_q16s_rv32im(const int16_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int16_t *__restrict__ pRes) {

    int16_t variance;
    plp_var_q16(pSrc, blockSize, fracBits, &variance);
    plp_sqrt_q16(&variance, fracBits, pRes);
}
