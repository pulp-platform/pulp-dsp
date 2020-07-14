/** =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_inv_f32.c
 * Description:  32-bit floating-point matrix inversion glue code
 *
 * $Date:        14. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/**
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
  @defgroup MatInv matrix inversion
  This module contains the glue code for matrix inversion. The kernel codes
  (kernels) are in the Module matrix inversion Kernels.

  The inverse of a matrix of shape MxN is another matrix of shape NxN, such
  that

  \f[
    I = A \cdot A^{-1}
  \f]

  The inverse is defined only if the input matrix is square and non-singular
  (the determinant is non-zero). The function checks that the input and output
  matrices are square and of the same size. Matrix inversion is numerically
  sensitive and the PULP DSP library only supports matrix inversion of
  floating-point matrices.

  @par Algorithm
  The Gauss-Jordan method is used to find the inverse. The algorithm performs a
  sequence of elementary row-operations until it reduces the input matrix to an
  identity matrix. Applying the same sequence of elementary row-operations to an
  identity matrix yields the inverse matrix.
 */


/**
  @addtogroup MatInv
  @{
 */

/**
  @brief Glue code for matrix inversion of 32-bit floating-point matrices.
  @param[in]  pSrc Points to the input matrix. pSrc is modified by this function
  @param[in]  N    Width and height of both matrices
  @param[out] pDst Points to the output matrix
  @return     0: Success, 1: Matrix is singular, 2: operation not supported

  @par This function will use plp_mat_inv_i32s_xpulpv2 for its computation.
 */

int plp_mat_inv_f32(float* __restrict__ pSrc,
                    uint32_t N,
                    float* __restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID){
        printf("Floating point is supported only for cluster side\n");
        return 2;
    }
    else{
        return plp_mat_inv_f32s_xpulpv2(pSrc, N, pDst);
    }

}

/**
  @} end of MatInv group
 */


