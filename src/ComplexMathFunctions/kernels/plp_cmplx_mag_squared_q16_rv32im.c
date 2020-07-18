/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cmplx_mag_squared_q16_rv32im.c
 * Description:  16-bit fixed-point squared magnitude glue code
 *
 * $Date:        13. July 2020
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
 /


#include "plp_math.h"

/**
  @ingroup groupCmplxMath
 */

/**
  @defgroup cmplx_mag_squared Complex Magnitude Squared
  Computes the magnitude squared of the elements of a complex data vector.
  The <code>pSrc</code> points to the source data and
  <code>pDst</code> points to the where the result should be written.
  <code>numSamples</code> specifies the number of complex samples
  in the input array and the data is stored in an interleaved fashion
  (real, imag, real, imag, ...).
  The input array has a total of <code>2*numSamples</code> values;
  the output array has a total of <code>numSamples</code> values.
  The underlying algorithm is used:
  <pre>
  for (n = 0; n < numSamples; n++) {
      pDst[n] = pSrc[(2*n)+0]^2 + pSrc[(2*n)+1]^2;
  }
  </pre>
  There are separate functions for floating-point, Q15, and Q31 data types.
 */

/**
  @addtogroup cmplx_mag_squared
  @{
 */

/**
  @brief         16-bit fixed-point complex magnitude squared.
  @param[in]     pSrc        points to input vector
  @param[out]    pDst        points to output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q16_rv32im(
  const int16_t * __restrict__  pSrc,
        int16_t * __restrict__  pDst,
        uint32_t deciPoint,
        uint32_t numSamples)
{
  uint32_t blkCnt;                               /* Loop counter */
  int16_t real, imag;                          /* Temporary input variables */

  /* Initialize blkCnt with number of samples */
  blkCnt = numSamples;
  while (blkCnt > 0U)
  {
    /* C[0] = (A[0] * A[0] + A[1] * A[1]) */

    real = *pSrc++;
    imag = *pSrc++;

    /* store result in destination buffer. */
    *pDst++ = ((real * real + (1<<(deciPoint-1))) >> deciPoint) + ((imag * imag + (1<<(deciPoint-1))) >> deciPoint);

    /* Decrement loop counter */
    blkCnt--;
  }

}

/**
  @} end of cmplx_conj group
 */