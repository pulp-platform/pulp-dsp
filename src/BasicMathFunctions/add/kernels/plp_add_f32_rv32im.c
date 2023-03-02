/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_add_f32_rv32im.c
 * Description:  32-bit floating addition glue code
 *
 * $Date:        13. December 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
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
  @ingroup groupMath
 */

/**
  @addtogroup BasicAdd
  @{
 */

/**
  @brief Glue code for element-by-element addition of 8-bit integer vectors.
  @param[in]     pSrcA      points to first input vector
  @param[in]     pSrcB      points to second input vector
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_add_f32_rv32im(volatile float * pSrcA,
                 volatile float * pSrcB,
                 volatile float * pDst,
                 uint32_t blockSize) {

  uint32_t blkCnt; /* Loop counter */

#if defined(PLP_MATH_LOOPUNROLL)

  /* Loop unrolling: Compute 2 outputs at a time */
  blkCnt = blockSize >> 1U;

  while (blkCnt > 0U)
    {
      /* C = A + B */

      /* Add and store result in destination buffer. */
      *pDst++ = (*pSrcA++) + (*pSrcB++);
      *pDst++ = (*pSrcA++) + (*pSrcB++);

      /* Decrement loop counter */
      blkCnt--;
    }

  /* Loop unrolling: Compute remaining outputs */
  blkCnt = blockSize % 0x2U;

#else // PLP_MATH_LOOPUNROLL

  /* Initialize blkCnt with number of samples */
  blkCnt = blockSize;

#endif // PLP_MATH_LOOPUNROLL

  while (blkCnt > 0U)
    {
      /* C = A + B */

      /* Add and store result in destination buffer. */
      *pDst++ = (*pSrcA++) + (*pSrcB++);

      /* Decrement loop counter */
      blkCnt--;
    }

    
}

/**
  @} end of BasicAdd group
 */
