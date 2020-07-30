/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_q32s_xpulpv2.c
 * Description:  32-bit fixed point scalar dot product for XPULPV2
 *
 * $Date:        26. May 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
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
  @ingroup BasicDotProd
 */

/**
  @addtogroup BasicDotProdKernels
  @{
 */

/**
  @brief Scalar dot product of 32-bit fixed point vectors kernel for XPULPV2 extension.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  deciPoint  decimal point for right shift
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_dot_prod_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               int32_t *__restrict__ pRes) {
    uint32_t blkCnt, tmpBS; /* Loop counter, temporal BlockSize */
    int32_t sum = 0;        //, sum1 =0;                          /* Temporary return variable */
    // int32_t prod=0;
    // int32_t deci = deciPoint;

#if defined(PLP_MATH_LOOPUNROLL)

    tmpBS = (blockSize >> 1);

    for (blkCnt = 0; blkCnt < tmpBS; blkCnt++) {

        //	prod = (*pSrcA++) * (*pSrcB++);
        //	sum = __ADDNORMU_REG(sum, prod, deciPoint);

        //	prod = (*pSrcA++) * (*pSrcB++);
        //	sum = __ADDNORMU_REG(sum, prod, deciPoint);

        int32_t x0 = (*pSrcA++) * (*pSrcB++);
        int32_t x1 = (*pSrcA++) * (*pSrcB++);
        sum += __ADDROUNDNORM_REG(x0, x1, deciPoint);

        //	sum = __MACSN(sum, (*pSrcA++), (*pSrcB++), 0);
        //	sum1 = __MACSN(sum1, (*pSrcA++), (*pSrcB++), 0);
        /*
                  sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
                  sum = sum >> deciPoint;
                  sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
                  sum = sum >> deciPoint;
        */
    }

    for (blkCnt = 0; blkCnt < (blockSize % 2U); blkCnt++) {
        sum += __ADDROUNDNORM_REG((*pSrcA++) * (*pSrcB++), 0, deciPoint);
    }

#else // PLP_MATH_LOOPUNROLL

    for (blkCnt = 0; blkCnt < blockSize; blkCnt++) {
        sum += __ADDROUNDNORM_REG((*pSrcA++) * (*pSrcB++), 0, deciPoint);
    }

#endif // PLP_MATH_LOOPUNROLL

    *pRes = sum; // + sum1;
}

/**
   @} end of BasicDotProdKernels group
*/
