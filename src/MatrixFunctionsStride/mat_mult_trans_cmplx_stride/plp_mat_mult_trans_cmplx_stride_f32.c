/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_trans_cmplx_stride_f32.c
 * Description:  32-bit floating-point complex strided matrix transpose matrix multiplication glue
 * code
 *
 * $Date:        18. July 2020
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
  @addtogroup MatMultTransCmplxStride
  @{
 */

/**
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
 */

void plp_mat_mult_trans_cmplx_stride_f32(const float *__restrict__ pSrcA,
                                         const float *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         float *__restrict__ pDstC) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        printf("Floating point is supported only for cluster side\n");
        return;
    } else {
        plp_mat_mult_trans_cmplx_stride_f32s_xpulpv2(pSrcA, pSrcB, M, N, O, strideA, strideB,
                                                     strideC, pDstC);
    }
}

/**
  @} end of MatMultTransCmplxStride group
 */
