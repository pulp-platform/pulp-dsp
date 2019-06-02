/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i8.c
 * Description:  8-bit integer dot product glue code
 *
 * $Date:        25. May 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich. All rights reserved.
 *
 * Author: Xiaying Wang
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
  @ingroup groupMath
 */


/**
  @addtogroup BasicDotProd
  @{
 */

/**
  @brief Glue code for dot product of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector [8 bit]
  @param[in]  pSrcB      points to the second input vector [8 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[out] result     output result returned here [32 bit]
  @return        none

  @par Exploiting SIMD instructions
       When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
 */

void plp_dot_prod_i8(
                      const int8_t * __restrict__ pSrcA,
                      const int8_t * __restrict__ pSrcB,
                      uint32_t blockSize,
                      int32_t * __restrict__ pRes){
  
  if (rt_cluster_id() == ARCHI_FC_CID){
    plp_dot_prod_i8s_rv32im(pSrcA, pSrcB, blockSize, pRes);
  }
  else{
    plp_dot_prod_i8v_xpulpv2(pSrcA, pSrcB, blockSize, pRes);
  }
}

/**
  @} end of BasicDotProd group
 */


