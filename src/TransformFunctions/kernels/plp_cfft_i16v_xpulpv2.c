/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i16v_xpulpv2.c
 * Description:  16-bit integer vectorized complex fast fourier transform for XPULPV2
 *
 * $Date:        19. Aug. 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 Tim Fischer, IIS, ETH Zurich. All rights reserved.
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
  @ingroup FourierTransform
 */

/**
  @defgroup FastFourierTransformKernels Complex Fast Fourier Transform Kernels
  This module contains the glue code for Complex Fast Fourier Transform. The kernel codes (kernels) are in the Module Fast Fourier kernels.

  The Complex Fast Fourier Transform performs a Fourier Transform on a complex input data buffer of size <code>2*N_FFT</code>
<pre>
      data = {real[0], imag[0], real[1], imag[1], ... , real[N], imag[N]}
  </pre>
  The transformation occurs in-place and is stored back to the data buffer.
  The functions uses Look-up-Tables for the Twiddle Factors and for the Bitreversal in the end. These Tables are compiled during compilation of the library. The length and the precision of the CFFT have to be configured beforehand in the <code>config.h</code> file. Furthermore if input shifting is used, it has to be defined.

  There are separate functions int16, and int32 data types. For 16-bit precision, functions exploiting SIMD instructions as well as complex extensions are provided.


  The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s):
  <pre>
  <pulp> _ <function name> _ <data type> <precision> <method> _ <isa extension>, with

  data type = {f, i, q} respectively for floats, integers, fixed points

  precision = {32, 16, 8} bits

  method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

  isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

  </pre>


 */

/**
  @addtogroup FastFourierTransformKernels
  @{
 */

/**
  @brief Complex Fourier Transform of vectorized 16-bit integers for XPULPV2 extension.
  @param[in,out]  Data   points to the complex data buffer of size <code>2*N_FFT</code> [16 bit]. Processing occurs in-place
  @param[in]  Twiddles   points to the Twiddles-factor LUT [16 bit]
  @param[in]  SwapTable  points to the SwapTable LUT [16 bit]
  @param[in]  N_FFT      Size of input data
  @return        none

 */


void plp_cfft_i16v_xpulpv2(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, uint16_t * __restrict__ SwapTable, uint32_t N_FFT)
{
  uint32_t iLog2N  = __FL1(N_FFT);
  uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB, iA1, iA2, iB1, iB2;
  v2s *CoeffV = (v2s *) Twiddles;
  v2s *DataV  = (v2s *) Data;
  iL = 1;
  iM = N_FFT >> 1;

  iQ = 0;
  for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
    v2s W = CoeffV[iQ];
    iA = iCnt2; 
    v2s Tmp;
    iB = iA + iM; 
    Tmp = DataV[iA] - DataV[iB];
    DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1};
    DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>16))};
    iQ += iL;
  }
  iL <<= 1;
  iM >>= 1;
  
  
  for (iCnt1 = 1; iCnt1 < (iLog2N-1); iCnt1++) {
    iQ = 0;
    for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
      v2s W = CoeffV[iQ];
      iA = iCnt2;
      for (iCnt3 = 0; iCnt3 < iL>>1; iCnt3++) {
  	v2s Tmp1, Tmp2;
	uint32_t iA2, iB2;
  	iB = iA + iM;
	iA2 = iA + 2 * iM;
	iB2 = iA2 + iM;
  	Tmp1 = DataV[iA] - DataV[iB];
  	Tmp2 = DataV[iA2] - DataV[iB2];
  	DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1};
  	DataV[iA2] = (DataV[iA2] + DataV[iB2]) >> (v2s) {1, 1};
  	DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp1)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp1)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp1)[0]*(int32_t) (W)[1]) + ((int) (Tmp1)[1]*(int32_t) (W)[0]))>>16))};
  	DataV[iB2] = (v2s) {((int16_t) ((((int32_t) (Tmp2)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp2)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp2)[0]*(int32_t) (W)[1]) + ((int) (Tmp2)[1]*(int32_t) (W)[0]))>>16))};
  	iA += iM << 2;
      }
      iQ += iL;
    }
    iL <<= 1;
    iM >>= 1;
  }
  iA = 0;
  
  
  /* Last Layer: W = (1, 0) */
  for (iCnt3 = 0; iCnt3 < (N_FFT>>2); iCnt3++) {
    v2s Tmp1, Tmp2;	       
    iB = iA + 1;
    Tmp1 = DataV[iA] - DataV[iB];
    Tmp2 = DataV[iA + 2] - DataV[iB + 2];
    DataV[iA] = (DataV[iA] + DataV[iB]);
    DataV[iA + 2] = (DataV[iA + 2] + DataV[iB + 2]);
    DataV[iB] = Tmp1;
    DataV[iB + 2] = Tmp2;
    iA += 4;
  }


  uint16_t SwapTable_length = SwapTable[0];
  SwapTable++;
  for (uint16_t i = 0; i < SwapTable_length; i+=2) {
    v2s S = DataV[SwapTable[i]];
    DataV[SwapTable[i]] = DataV[SwapTable[i+1]];
    DataV[SwapTable[i+1]] = S;
  }

}


/**
  @} end of FastFourierTransformKernels group
 */
