/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_I_stride_q16.c
 * Description:  16-bit fix-point strided identity matrix creation glue code
 *
 * $Date:        17. July 2020
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
  @ingroup groupMatrixStride
 */

/**
  @addtogroup MatFillIStride
  @{
 */

/**
  @brief      Glue code for creating a strided 16-bit fix-point identity matrix
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
 */

void plp_mat_fill_I_stride_q16(uint32_t N,
                               uint32_t stride,
                               int32_t fracBits,
                               int16_t *__restrict__ pDst) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        plp_mat_fill_I_stride_q16s_rv32im(N, stride, fracBits, pDst);
    } else {
        plp_mat_fill_I_stride_q16s_xpulpv2(N, stride, fracBits, pDst);
    }
}

/**
  @} end of MatFillIStride group
 */
