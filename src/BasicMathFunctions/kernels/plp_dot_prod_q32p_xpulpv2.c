/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_q32p_xpulpv2.c
 * Description:  32-bit fixed point scalar dot product for XPULPV2 with interleaved access
 *
 * $Date:        04. Jun 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 Xiaying Wang, IIS, ETH Zurich. All rights reserved.
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
  @ingroup BasicDotProd
 */


/**
  @addtogroup BasicDotProdKernels
  @{
 */

/**
  @brief Scalar dot product with interleaved access of 32-bit fixed point vectors kernel for XPULPV2 extension.
  @param[in]  S     points to the instance structure for fixed point parallel dot product
  @return        none
 */

void plp_dot_prod_q32p_xpulpv2(void * S) {

  int32_t * pSrcA = (int32_t*)(((plp_dot_prod_instance_q32 *)S)->pSrcA) + rt_core_id();
  int32_t * pSrcB = (int32_t*)(((plp_dot_prod_instance_q32 *)S)->pSrcB) + rt_core_id();
  uint32_t blkSizePE = ((plp_dot_prod_instance_q32 *)S)->blkSizePE;
  uint32_t deciPoint = ((plp_dot_prod_instance_q32 *)S)->deciPoint;
  uint32_t nPE = ((plp_dot_prod_instance_q32 *)S)->nPE;
  int32_t * resBufferPE = &(((plp_dot_prod_instance_q32 *)S)->resBuffer[rt_core_id()]);


  uint32_t blkCnt, tmpBS;                      /* Loop counter, temporal BlockSize */
  int32_t sum1 = 0, sum2=0;                          /* Temporary return variable */

#if defined(PLP_MATH_LOOPUNROLL)

        tmpBS = (blkSizePE>>1);
        uint32_t tmpIdx = 2*nPE;

        for (blkCnt=0; blkCnt<tmpBS; blkCnt++){
          //printf("blkCnt %d, tmpIdx*blkCnt %d, blkSizePE %d\n", blkCnt, tmpIdx*blkCnt, blkSizePE);
          sum1 = __MAC(sum1, pSrcA[tmpIdx*blkCnt], pSrcB[tmpIdx*blkCnt]);
          sum1 = sum1 >> deciPoint;
          sum2 = __MAC(sum2, pSrcA[tmpIdx*blkCnt + nPE], pSrcB[tmpIdx*blkCnt + nPE]);
          sum2 = sum2 >> deciPoint;
        }
        /*
        tmpBS = (blkSizePE%2U);

        for (blkCnt=0; blkCnt<tmpBS; blkCnt++){
          printf("here?\n");
          sum1 = __MAC(sum1, (*pSrcA++), (*pSrcB++));
        }
        */

#else // PLP_MATH_LOOPUNROLL

        for (blkCnt=0; blkCnt<blockSize; blkCnt=blkCnt+nPE){
          sum1 = __MAC(sum1, pSrcA[blkCnt], pSrcB[blkCnt]);
        }

#endif // PLP_MATH_LOOPUNROLL

        * resBufferPE = sum1 + sum2;

        //printf("resBufferPE %d, core id %d\n", *resBufferPE, rt_core_id());

}

/**
   @} end of BasicDotProdKernels group
*/
