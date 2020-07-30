/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cmplx_conj_f32.c
 * Description:  32-bit float complex conjugate glue code
 *
 * $Date:        29. Jun 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Hanna Mueller, ETH Zurich
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
  ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 released under Copyright (C) 2010-2019 ARM Limited or its affiliates
  with Apache-2.0.
 */

#include "plp_math.h"

/**
  @ingroup groupCmplxMath
 */

/**
  @defgroup cmplx_dot_prod Complex Dot Product
  Computes the dot product of two complex vectors.
  The vectors are multiplied element-by-element and then summed.
  The <code>pSrcA</code> points to the first complex input vector and
  <code>pSrcB</code> points to the second complex input vector.
  <code>numSamples</code> specifies the number of complex samples
  and the data in each array is stored in an interleaved fashion
  (real, imag, real, imag, ...).
  Each array has a total of <code>2*numSamples</code> values.
  The underlying algorithm is used:
  <pre>
  realResult = 0;
  imagResult = 0;
  for (n = 0; n < numSamples; n++) {
      realResult += pSrcA[(2*n)+0] * pSrcB[(2*n)+0] - pSrcA[(2*n)+1] * pSrcB[(2*n)+1];
      imagResult += pSrcA[(2*n)+0] * pSrcB[(2*n)+1] + pSrcA[(2*n)+1] * pSrcB[(2*n)+0];
  }
  </pre>
  There are separate functions for floating point, integer, and fixed point 32- 16- 8-bit data
  types.
 */

/**
  @addtogroup cmplx_dot_prod
  @{
 */

/**
  @brief Glue code for complex dot product of 32-bit float vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second input vector
  @param[in]     numSamples  number of samples in each vector
  @param[out]    realResult  real part of the result returned here
  @param[out]    imagResult  imaginary part of the result returned here
  @return        none
 */
void plp_cmplx_dot_prod_i16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t numSamples,
                            int16_t *__restrict__ realResult,
                            int16_t *__restrict__ imagResult) {

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_cmplx_dot_prod_i16_rv32im(pSrcA, pSrcB, numSamples, realResult, imagResult);
    } else {
        plp_cmplx_dot_prod_i16_xpulpv2(pSrcA, pSrcB, numSamples, realResult, imagResult);
    }
}

/**
  @} end of BasicDotProd group
 */
