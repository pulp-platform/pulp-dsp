/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i16p_xpulpv2cplx.c
 * Description:  16-bit integer vectorized complex fast fourier transform for XPULPV2 and CPLX extensions
 *
 * $Date:        18. July 2019
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
   @addtogroup FastFourierTransformKernels
   @{
*/

/**
   @brief Complex Fourier Transform of vectorized 16-bit integers for XPULPV2, CPLX extension.
   @param[in,out]  Data   points to the complex data buffer of size <code>2*N_FFT</code> [16 bit]. Processing occurs in-place
   @param[in]  Twiddles   points to the Twiddles-factor LUT [16 bit]
   @param[in]  SwapTable  points to the SwapTable LUT [16 bit]
   @param[in]  N_FFT      Size of input data
   @return        none

*/

/* #if !defined(ARCHI_CORE_HAS_CPLX) */
/* #define __CPLXMULSDIV2(x, y) (v2s) {((int16_t) ((((int32_t) (x)[0]*(int32_t) (y)[0]) - ((int32_t) (x)[1]*(int32_t) (y)[1]))>>16)), ((int16_t) ((((int32_t) (x)[0]*(int32_t) (y)[1]) + ((int) (x)[1]*(int32_t) (y)[0]))>>16))} */
/* #endif */

void plp_cfft_i16v_xpulpv2cplx(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, uint16_t * SwapTable, uint32_t N_FFT)
{
  uint32_t iLog2N  = __FL1(N_FFT);
  uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
  v2s *CoeffV = (v2s *) Twiddles;
  v2s *DataV  = (v2s *) Data;
  iL = 1;
  iM = N_FFT / 2;

  iQ = 0;
  for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
    v2s W = CoeffV[iQ];
    iA = iCnt2; 
    v2s Tmp;
    iB = iA + iM; 
    Tmp = DataV[iA] - DataV[iB];
    DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1};
    DataV[iB] = (v2s) __CPLXMULSDIV2(Tmp, W);
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
	DataV[iB] = (v2s) __CPLXMULSDIV2(Tmp1, W);
	DataV[iB2] = (v2s) __CPLXMULSDIV2(Tmp2, W);
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
