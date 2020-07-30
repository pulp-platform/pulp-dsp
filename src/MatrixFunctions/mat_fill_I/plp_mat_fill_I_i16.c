/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_I_i16.c
 * Description:  16-bit integer identity matrix creation glue code
 *
 * $Date:        16. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
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
  @defgroup MatFillI Identity Matrix Creation
  This module contains the glue code for creating identity matrices. The kernel codes (kernels) are
  in the Module @ref matFillIKernels.

  The identity matrix is a square matrix, with the value `1` on it's main diagonal, and all other
  values `0`.

  There are functions for integer 32- 16- and 8-bit data types, as well as for floating-point. The
  naming scheme of the functions follows the following pattern (for example
  `plp_mat_fill_I_i32`):

      `plp_<function name>_<data type><precision>[_parallel]`

  name          | description
  ------------- | ---------------------------------------------------------
  function_name | `mat_fill_I`
  data type     | {f, i, q} respectively for floats, integers, fixed points
  precision     | {32, 16, 8} bits
 */

/**
  @addtogroup MatFillI
  @{
 */

/**
  @brief      Glue code for creating a 16-bit integer identity matrix
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
 */

void plp_mat_fill_I_i16(uint32_t N, int16_t *__restrict__ pDst) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_mat_fill_I_i16s_rv32im(N, pDst);
    } else {
        plp_mat_fill_I_i16s_xpulpv2(N, pDst);
    }
}

/**
  @} end of MatFillI group
 */
