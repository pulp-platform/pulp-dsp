/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i16.c
 * Description:  16-bit integer complex fourier transform glue code
 *
 * $Date:        25. May 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich. All rights reserved.
 *
 * Author: Tim Fischer
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
  @ingroup groupMath
 */


/**
  @addtogroup FourierTransform
  @{
 */


#define Abs(a) (((a)<0)?(-a):(a))

/**
  @brief Glue code for Complex Fourier Transform of 16-bit integer vectors
  @param[in,out]  Data   points to the complex data buffer of size <code>2*N_FFT</code> [16 bit]. Processing occurs in-place
  @param[in]  N_FFT      Size of input data
  @return        none
 */

void plp_cfft_i16(int16_t * __restrict__ Data,
		  uint32_t N_FFT)
{

  uint32_t argmax, shift, maxlog2N = 0;
  int32_t max = 0;
  uint32_t N = N_FFT;
  uint16_t * SwapTable;
  int16_t * twiddleCoef;

  /* Declare length and precision specific LUTs */
  switch(N_FFT) {
  case 128:
    SwapTable = SwapTable_128;
    twiddleCoef = twiddleCoef_i16_128;
    break;
  case 256:
    SwapTable = SwapTable_256;
    twiddleCoef = twiddleCoef_i16_256;
    break;
  case 512:
    SwapTable = SwapTable_512;
    twiddleCoef = twiddleCoef_i16_512;
    break;
  case 1024:
    SwapTable = SwapTable_1024;
    twiddleCoef = twiddleCoef_i16_1024;
    break;
  }

  /* find maximum absolute value of input data */
  for(uint32_t i = 0; i < 2 * N_FFT; i++) {
    if(Abs(Data[i]) > max)
      max = Abs(Data[i]);
  }

  /* log2 of maximum absolute value */
  while(max >>= 1) maxlog2N++;

  /* shift input data to 14-bit precision  */
  if (maxlog2N <= 13) {
    shift = 13 - maxlog2N;
    for(uint32_t i = 0; i < 2 * N_FFT; i++)
      Data[i] <<= shift;
  }
  else {
    shift = maxlog2N - 13;
    for(uint32_t i = 0; i < 2 * N_FFT; i++) {
      Data[i] >>= shift;
    }
  }

  
  if (rt_cluster_id() == ARCHI_FC_CID){
    plp_cfft_i16s_rv32im(Data, twiddleCoef, SwapTable, N_FFT);
  }
  else{
#ifdef ARCHI_CORE_HAS_CPLX
    plp_cfft_i16v_xpulpv2cplx(Data, twiddleCoef, SwapTable, N_FFT);
#else
    plp_cfft_i16v_xpulpv2(Data, twiddleCoef, SwapTable, N_FFT);
#endif
    
  }
}
