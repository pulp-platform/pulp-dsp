/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_power_q32p_xpulpv2.c
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

void plp_power_q32p_xpulpv2(void* S) {

    int core_id = hal_core_id();
    plp_power_instance_q32 *args = (plp_power_instance_q32 *)S;

    int32_t *pSrc = (int32_t *)(args->pSrc);
    uint32_t blkSizePE = args->blkSizePE;
    uint32_t deciPoint = args->deciPoint;
    uint32_t nPE = args->nPE;
    int32_t *resBufferPE = &(args->resBuffer[core_id]);

    uint32_t blkSize = (blkSizePE / nPE) & 0xFFFFFFFE; // the and makes sure the block size is even
    pSrc += core_id * blkSize;
    // set the block size for the last core
    if (core_id == nPE - 1) {
        blkSize = blkSizePE - (nPE - 1) * blkSize;
    }

    if (blkSize == 0) {
        *resBufferPE = 0;
        return;
    }

    int32_t i, sum = 0;

#if defined(PLP_MATH_LOOPUNROLL)

    for (i = 0; i < blkSize - 1; i += 2) {
      //int32_t x0 = pSrc[i] * pSrc[i];
      //int32_t x1 = pSrc[i + 1] * pSrc[i + 1];
      //sum += __ADDROUNDNORM_REG(x0, x1, deciPoint);
      sum += (pSrc[i] * pSrc[i])>>deciPoint;
      sum += (pSrc[i + 1] * pSrc[i + 1])>>deciPoint;
    }

    while (i != blkSize) {
        sum += pSrc[i] * pSrc[i] >> deciPoint;
        i++;
    }

#else // PLP_MATH_LOOPUNROLL*/

    for (i = 0; i < blkSize; i++) {
        sum += (pSrc[i] * pSrc[i] >> deciPoint);
    }

#endif // PLP_MATH_LOOPUNROLL

    *resBufferPE = sum;
}
