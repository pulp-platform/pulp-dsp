/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_copy_f32.c
 * Description:  Glue code for copying the elements of a 32-bit float vector
 *
 * $Date:        14. Jan 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Xiaying Wang, ETH Zurich
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
  @ingroup groupSupport
 */

/**
  @addtogroup Copy
  @{
 */

/**
  @brief         Glue code for copying the elements of a 32-bit integer vector
  @param[in]     pSrc       points to input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
*/

void plp_copy_f32(float32_t *__restrict__ pSrc, float32_t *__restrict__ pDst, uint32_t blockSize) {

    uint32_t blkCnt; /* Loop counter */

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("error: FC doesn't have FPU\n");
        return;
    } else {
        plp_copy_f32s_xpulpv2(pSrc, pDst, blockSize);
    }
}

/**
  @} end of Copy group
 */
