/** =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_trans_i16.c
 * Description:  16-bit integer matrix transpose glue code
 *
 * $Date:        14. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/**
 * Copyright (C) 2020 ETH Zurich and Ubiversity of Bologna. All rights reserved.
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
  @defgroup MatTrans matrix transpose
  This module contains the glue code for matrix transpose. The kernel codes
  (kernels) are in the Module matrix transpose Kernels.

  The transpose of a matrix of shape MxN is another matrix of shape NxM, where
  the the matrix is flipped:

  <pre>
    pDst[n, m] = pSrc[m, n]
  </pre>

  There are functions for integer 32- 16- and 8-bit data types, as well as for
  floating-point. These functions can also be used for fix-point matrices.
 */

/**
  @addtogroup MatTrans
  @{
 */

/**
  @brief Glue code for matrix transpose of 16-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
 */

void plp_mat_trans_i16(const int16_t* __restrict__ pSrc,
    uint32_t M,
    uint32_t N,
    int16_t* __restrict__ pDst){

    if (rt_cluster_id() == ARCHI_FC_CID){
        plp_mat_trans_i16s_rv32im(pSrc, M, N, pDst);
    }
    else{
        plp_mat_trans_i16v_xpulpv2(pSrc, M, N, pDst);
    }

}

/**
  @} end of MatTrans group
 */


