/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_sub_i16.c
 * Description:  16-bit integer matrix subtraction glue code
 *
 * $Date:        1. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Tibor Schneider, ETH Zurich
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
  @ingroup groupMatrix
 */

/**
  @defgroup MatSub matrix subtraction
  This module contains the glue code for matrix subtraction. The kernel codes
  (kernels) are in the Module matrix subtraction Kernels.

  The Matrx Subtraction subtracts two matrices, element wise. Both matrices, and
  the output matrix have dimension MxN.

  <pre>
    pDst[m, n] = pSrcA[m, n] - pSrcB[m, n]
  </pre>

  There are functions for integer 32- 16- and 8-bit data types, as well as for
  floating-point. These functions can also be used for fix-point matrices, if
  they have their fix-point at the same location. The outpt matrix will then also
  have the fix-point at the same location.

 */

/**
  @addtogroup MatSub
  @{
 */

/**
  @brief Glue code for matrix subtraction of 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of all matrices
  @param[in]  N       Width of all matrices
  @param[out] pDst    Points to the output matrix
  @return     none
 */

void plp_mat_sub_i16(const int16_t * __restrict__ pSrcA,
                     const int16_t * __restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     int16_t * __restrict__ pDst){

    if (rt_cluster_id() == ARCHI_FC_CID){
        plp_mat_sub_i16s_rv32im(pSrcA, pSrcB, M, N, pDst);
    }
    else{
        plp_mat_sub_i16v_xpulpv2(pSrcA, pSrcB, M, N, pDst);
    }

}

/**
  @} end of MatSub group
 */


