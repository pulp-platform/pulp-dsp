/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mult_i8p_xpulpv2.c
 * Description:  8-bit integer multiplication for XPULPV2 with interleaved access
 *
 * $Date:        06. Mar 2023
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna.
 *
 * Author: Viviane Potocnik, ETH Zurich
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
  @ingroup BasicMult
 */

/**
  @addtogroup BasicMultKernels
  @{
 */

/**
  @brief Parallel multiplication with interleaved access of 8-bit integer vectors kernel for XPULPV2
  extension.
  @param[in]  S     points to the instance structure for integer parallel multiplication
  @return        none
 */

void plp_abs_i8p_xpulpv2(void *S) {

    uint32_t blkSizePE = ((plp_abs_instance_i8 *)S)->blkSizePE;
    uint32_t nPE = ((plp_abs_instance_i8 *)S)->nPE;
    int8_t *pSrcA = (int8_t *)(((plp_abs_instance_i8 *)S)->pSrcA) + hal_core_id() * nPE;
    int8_t *pDst = (int8_t *)(((plp_abs_instance_i8 *)S)->pDst) + hal_core_id() * nPE;

    uint32_t blkCnt, tmpBS;


    for (blkCnt = 0; blkCnt < blkSizePE; blkCnt+=4) {
        v4s a0 = *((v4s *)((void *)(pSrcA + blkCnt)));
        // printf("Core %u: a0 = [%d, %d, %d, %d]\n", hal_core_id(), a0[0], a0[1], a0[2], a0[3]);
        v4s abs_val = __ABS4(a0);
        // printf("Core %u: abs_val = [%d, %d, %d, %d]\n", hal_core_id(), abs_val[0], abs_val[1], abs_val[2], abs_val[3]);
        *((v4s *)((void *)(pDst + blkCnt))) = abs_val;
        // printf("Core %u: pDst = [%d, %d, %d, %d]\n", hal_core_id(), pDst[0], pDst[1], pDst[2], pDst[3]);
    }
}

/* #define PLP_MATH_LOOPUNROLL */

/**
   @} end of BasicMultKernels group
*/
