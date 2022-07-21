/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_power_f32p_xpulpv2.c
 * Description:  Calculates the sum of squares on XPULPV2 cores
 *
 * $Date:        22.03.2022
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Marco Bertuletti, ETH Zurich
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
   @ingroup groupStat
*/

/**
   @defgroup powerKernels Power Kernels
   Calculates the sum of squares of the input vector.
   There are separate functions for floating point, integer, and fixed point 32- 16- 8-bit data
   types. For lower precision integers (16- and 8-bit), functions exploiting SIMD instructions are
   provided.

   The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s):
   <pre>
   \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

   data type = {f, i, q} respectively for floats, integers, fixed points

   precision = {32, 16, 8} bits

   method = {s, p} respectively meaning single core or parallel multicore implementation.

   isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

   </pre>

*/

/**
   @addtogroup powerKernels
   @{
*/

/**
   @brief          Parallel sum of squares of a 32-bit float vector for XPULPV2 extension.
   @param[in]  S   points to the instance structure for floating-point parallel power
   @return         none
*/

void plp_power_f32p_xpulpv2(void* S) {

    float32_t *pSrc = (float32_t *)(((plp_power_instance_f32 *)S)->pSrc) + hal_core_id();
    uint32_t blkSizePE = ((plp_power_instance_f32 *)S)->blkSizePE;
    uint32_t nPE = ((plp_power_instance_f32 *)S)->nPE;
    float32_t *resBufferPE = &(((plp_power_instance_f32 *)S)->resBuffer[hal_core_id()]);

    uint32_t blkCnt = 0;
    float32_t accum = 0.0f, tmp;
    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt++) {
        tmp = pSrc[nPE * blkCnt];
        accum += tmp*tmp;
    }
    *resBufferPE = accum;
}
