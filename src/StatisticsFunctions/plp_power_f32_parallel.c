/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_power_f32_parallel.c
 * Description:  32-bit floating-point parallel power glue code
 *
 * $Date:        22.03.2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2022 ETH Zurich and University of Bologna.
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */

#include "plp_math.h"

/**
   @ingroup groupStats
*/

/**
   @defgroup power Power
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
   @addtogroup power
   @{
*/

/**
  @brief Glue code for parallel power of 32-bit floating point vectors.
  @param[in]  pSrc       points to the input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits   number of fixed point fractional bits
  @param[in]  nPE        number of parallel processing units
  @param[out] pRes       output result returned here
  @return     none
 */

void plp_power_f32_parallel(    const float32_t *__restrict__ pSrc,
                                uint32_t blockSize,
                                uint32_t nPE,
                                float32_t *__restrict__ pRes) {
    
    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {

        uint32_t i, tmpblkSizePE = blockSize / nPE;
        float32_t resBuffer[hal_cl_nb_pe_cores()];

        plp_power_instance_f32 S;

        // Initialize the plp_power_instance
        S.pSrc = pSrc;
        S.blkSizePE = tmpblkSizePE;
        S.nPE = nPE;
        S.resBuffer = resBuffer;

        // Fork the dot product to nPE cores (i.e. processing units)
        hal_cl_team_fork(nPE, plp_power_f32p_xpulpv2, (void *)&S);

        float32_t sum = 0, tmp;
        for (i = 0; i < nPE; i++) { // not necessary hal_cl_nb_pe_cores()
            sum += resBuffer[i];
        }
        for (i = (tmpblkSizePE)*nPE; i < blockSize; i++) {
            tmp = pSrc[i];
            sum += tmp*tmp;
        }
        *pRes = sum;
    }

}

/**
  @} end of power group
 */
