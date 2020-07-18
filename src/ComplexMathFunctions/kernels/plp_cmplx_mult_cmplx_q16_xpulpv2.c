/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cmplx_mult_cmplx_f32_xpulpv2.c
 * Description:  16-bit integer complex-by-complex multiplication glue code
 *
 * $Date:        29. June 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and Ubiversity of Bologna. 
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
  @defgroup CmplxByCmplxMult Complex-by-Complex Multiplication
  Multiplies a complex vector by another complex vector and generates a complex result.
  The data in the complex arrays is stored in an interleaved fashion
  (real, imag, real, imag, ...).
  The parameter <code>numSamples</code> represents the number of complex
  samples processed.  The complex arrays have a total of <code>2*numSamples</code>
  real values.
  The underlying algorithm is used:
  <pre>
  for (n = 0; n < numSamples; n++) {
      pDst[(2*n)+0] = pSrcA[(2*n)+0] * pSrcB[(2*n)+0] - pSrcA[(2*n)+1] * pSrcB[(2*n)+1];
      pDst[(2*n)+1] = pSrcA[(2*n)+0] * pSrcB[(2*n)+1] + pSrcA[(2*n)+1] * pSrcB[(2*n)+0];
  }
  </pre>
  There are separate functions for floating-point, Q15, and Q31 data types.
 */

/**
  @addtogroup CmplxByCmplxMult
  @{
 *//**
  @brief         16-bit integer complex-by-complex multiplication
  @param[in]     pSrcA       points to first input vector
  @param[in]     pSrcB       points to second input vector
  @param[out]    pDst        points to output vector
  @param[in]     deciPoint  decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_mult_cmplx_q16_xpulpv2(
  const int16_t * __restrict__  pSrcA,
  const int16_t * __restrict__  pSrcB,
        int16_t * __restrict__  pDst,
        uint32_t deciPoint,
        uint32_t numSamples)
{
  uint32_t blkCnt;                               /* Loop counter */
  int16_t a, b, c, d;  /* Temporary variables to store real and imaginary values */

  /* Initialize blkCnt with number of samples */
  blkCnt = numSamples;
  while (blkCnt > 0U)
  {
    /* C[2 * i    ] = A[2 * i] * B[2 * i    ] - A[2 * i + 1] * B[2 * i + 1]. */
    /* C[2 * i + 1] = A[2 * i] * B[2 * i + 1] + A[2 * i + 1] * B[2 * i    ]. */

    a = *pSrcA++;
    b = *pSrcA++;
    c = *pSrcB++;
    d = *pSrcB++;

    /* store result in destination buffer. */
    *pDst++ = __ROUNDNORM_REG((a * c), deciPoint) - __ROUNDNORM_REG((b * d), deciPoint);
    *pDst++ = __ROUNDNORM_REG((a * d), deciPoint) + __ROUNDNORM_REG((b * c), deciPoint);

    /* Decrement loop counter */
    blkCnt--;
  }

}

/**
  @} end of CmplxByCmplxMult
 */