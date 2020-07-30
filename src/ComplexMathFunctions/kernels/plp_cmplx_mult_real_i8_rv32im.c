/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cmplx_mult_real_f32_xpulpv2.c
 * Description:  8-bit integer complex-by-real multiplication glue code
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
  @ingroup groupCmplxMath
 */

/**
  @defgroup CmplxByRealMult Complex-by-Real Multiplication
  Multiplies a complex vector by a real vector and generates a complex result.
  The data in the complex arrays is stored in an interleaved fashion
  (real, imag, real, imag, ...).
  The parameter <code>numSamples</code> represents the number of complex
  samples processed.  The complex arrays have a total of <code>2*numSamples</code>
  real values while the real array has a total of <code>numSamples</code>
  real values.
  The underlying algorithm is used:
  <pre>
  for (n = 0; n < numSamples; n++) {
      pCmplxDst[(2*n)+0] = pSrcCmplx[(2*n)+0] * pSrcReal[n];
      pCmplxDst[(2*n)+1] = pSrcCmplx[(2*n)+1] * pSrcReal[n];
  }
  </pre>
  There are separate functions for floating point, integer, and fixed point 32- 16- 8-bit data types.
 */

/**
  @addtogroup CmplxByRealMult
  @{
 */

/**
  @brief         8-bit integer complex-by-real multiplication
  @param[in]     pSrcCmplx   points to complex input vector
  @param[in]     pSrcReal    points to real input vector
  @param[out]    pCmplxDst   points to complex output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_mult_real_i8_rv32im(
  const int8_t * __restrict__  pSrcCmplx,
  const int8_t * __restrict__  pSrcReal,
        int8_t * __restrict__  pDst,
        uint32_t numSamples)
{
  uint32_t blkCnt;                               /* Loop counter */
  int8_t in;                                  /* Temporary variable */

  /* Initialize blkCnt with number of samples */
  blkCnt = 2*numSamples;
  int8_t even = 1;
  while (blkCnt > 0U)
  {
    /* C[2 * i    ] = A[2 * i    ] * B[i]. */
    /* C[2 * i + 1] = A[2 * i + 1] * B[i]. */

    if(even == 1)
    {
      in = *pSrcReal++;
      /* store result in destination buffer. */
      *pDst++ = *pSrcCmplx++ * in;  
    } else
    {
      *pDst++ = *pSrcCmplx++ * in;
    }
    even = !even;
    /* Decrement loop counter */
    blkCnt--;
  }

}

/**
  @} end of cmplx_conj group
 */