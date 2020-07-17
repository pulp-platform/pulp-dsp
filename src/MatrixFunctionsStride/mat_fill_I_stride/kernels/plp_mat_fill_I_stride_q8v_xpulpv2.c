/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_I_stride_q8v_xpulpv2.c
 * Description:  8-bit fix-point strided identity matrix creation for XPULPV2
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
  @ingroup MatFillIStride
 */

/**
  @addtogroup MatFillIStrideKernels
  @{
 */

/**
  @brief      Create a strided 8-bit fix-point identity matrix on XpulpV2
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
 */

void plp_mat_fill_I_stride_q8v_xpulpv2(uint32_t N,
                                       uint32_t stride,
                                       int32_t fracBits,
                                       int8_t *__restrict__ pDst) {

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            pDst[i * stride + j] = (int8_t)(i == j) << fracBits;
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}
/**
   @} end of MatFillIStrideKernels group
*/
