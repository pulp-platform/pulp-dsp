/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sqrt_f32s_xpulpv2.c
 * Description:  32-Bit floating point square root kernel
 *
 * $Date:        02.07.2020
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */

#include "plp_math.h"

/**
   @ingroup sqrt
*/

/**
   @defgroup sqrtKernels Sqrt Kernels
*/

/**
   @addtogroup sqrtKernels
   @{
*/

/**
   @brief         Square root of a 32-bit floating point number for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pRes    Square root returned here
   @return        none
*/

void plp_sqrt_f32s_xpulpv2(const float *__restrict__ pSrc, float *__restrict__ pRes) {

    const float threehalfs = 1.5f;
    float x2, y;

    union {
        float f;
        int32_t i;
    } conv;

    if (*pSrc > 0) {
        /* fast inverse square root with proper type punning */
        x2 = *pSrc * 0.5f;
        conv.f = *pSrc;
        conv.i = 0x5f3759df - (conv.i >> 1); /* evil floating point bit level hacking */
        y = conv.f;
        y = y * (threehalfs - (x2 * y * y)); /* newton 1st iter */
        y = y * (threehalfs - (x2 * y * y)); /* newton 2nd iter */
        *pRes = *pSrc * y;                   /* to square root */
    } else {
        *pRes = 0.f;
    }
}
