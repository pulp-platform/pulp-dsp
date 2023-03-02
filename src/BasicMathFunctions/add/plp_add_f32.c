/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_add_f32.c
 * Description:  32-bit floating-point vector addition kernel
 *
 * $Date:        13. December 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. 
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


#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"

// #include "common.h"

/**
  @ingroup groupMath
 */

/**
  @addtogroup BasicAdd
  @{
 */

/**
  @brief Glue code for element-by-element addition of 32-bit floating-point vectors.
  @param[in]     pSrcA      points to first input vector
  @param[in]     pSrcB      points to second input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_add_f32(volatile float * pSrcA,
                 volatile float * pSrcB,
                 volatile float * pDst,
                 uint32_t blockSize) {


    if (hal_cluster_id() == ARCHI_FC_CID) {
      printf("FC does not have an FPU!.\n");
    } else {
      // printf("Cluster has an FPU!.\n");
      plp_add_f32_rv32im(pSrcA, pSrcB, pDst, blockSize);
    }
}

void plp_add_f32_test(volatile float * pSrcA,
                 volatile float * pSrcB,
                 volatile float * pDst,
                 uint32_t blockSize) {

    printf("I am invoked\n");

    printf("pSrcA = %f\n", *pSrcA);
    printf("pSrcB = %f\n", *pSrcB);

    printf("pSrcA + pSrcB = %f\n", *pSrcA + *pSrcB);

    pDst[0] = *pSrcA + *pSrcB;

    // pDst[0] = 1;

    printf("pDst pointer: %p\n", pDst);
    printf("pDst[0] = %f\n", (float)pDst[0]);
    printf("pDst[0] = %d\n", pDst[0]);
}

/**
  @} end of BasicAdd group
 */
