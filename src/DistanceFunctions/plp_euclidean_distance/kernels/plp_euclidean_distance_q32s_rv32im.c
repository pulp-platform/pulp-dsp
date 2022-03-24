/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_euclidean_distance_q32s_rv32im.c
 * Description:  32-bit fixed-point Euclidean distance kernel for RV32IM
 *
 * $Date:        17. Mar 2022
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
  @ingroup DistanceFunctions
 */

/**
  @defgroup Euclidean distance
  Euclidean distance
 */

/**
  @addtogroup Euclidean
  @{
 */

/**
  @brief      Euclidean distance of 32-bit fixed point vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  fracBits   number of fixed point fractional bits
  @param[out] pRes     output result returned here
  @return     none
 */

void plp_euclidean_distance_q32s_rv32im(    const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t blockSize,
                                            uint32_t fracBits,
                                            int32_t *__restrict__ pRes) {
    uint32_t blkCnt; /* Loop counter */
    int32_t sum = 0; /* Temporary return variable */

#if defined(PLP_MATH_LOOPUNROLL)

    for (blkCnt = 0; blkCnt < (blockSize >> 1); blkCnt++) {
        int32_t tmp1, tmp2, tmp3, tmp4;
        tmp1 = (*pSrcA++) - (*pSrcB++);
        tmp2 = (*pSrcA++) - (*pSrcB++);
        //tmp3 = (*pSrcA++) - (*pSrcB++);
        //tmp4 = (*pSrcA++) - (*pSrcB++);
        sum += (tmp1*tmp1) >> fracBits;
        sum += (tmp2*tmp2) >> fracBits;
        //sum += (tmp3*tmp3) >> fracBits;
        //sum += (tmp4*tmp4) >> fracBits;
    }

    for (blkCnt = 0; blkCnt < (blockSize % 2U); blkCnt++) {
        int32_t tmp;
        tmp = (*pSrcA++) - (*pSrcB++);
        sum += (tmp*tmp) >> fracBits;
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        int32_t tmp;
        tmp = (*pSrcA++) - (*pSrcB++);
        sum += (tmp*tmp) >> fracBits;
    }

#endif // PLP_MATH_LOOPUNROLL
    
    plp_sqrt_q32(&sum, fracBits, pRes);

}

/**
   @} end of Euclidean group
*/
