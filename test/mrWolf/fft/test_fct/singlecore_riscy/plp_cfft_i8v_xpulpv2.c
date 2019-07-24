/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i8v_xpulpv2.c
 * Description:  8-bit integer vectorized complex fast fourier transform for XPULPV2
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

//#include "plp_math.h"


/**
  @ingroup FastFourierTransform
 */


/**
  @addtogroup FastFourierTransformKernels
  @{
 */

/**
  @brief Complex Fourier Transform of vectorized 8-bit integers for XPULPV2 extension.
  @param[in,out]  Data   points to the complex data buffer of size <code>2*N_FFT</code> [8 bit]. Processing occurs in-place
  @param[in]  Twiddles   points to the Twiddles-factor LUT [8 bit]
  @param[in]  SwapTable  points to the SwapTable LUT [8 bit]
  @param[in]  N_FFT      Size of input data
  @return        none

 */


void plp_cfft_i8v_xpulpv2(int8_t *__restrict__ Data, int8_t *__restrict__ Twiddles, uint16_t * __restrict__ SwapTable, uint32_t N_FFT)
{
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    v4s *CoeffV = (v4s *) Twiddles;
    v4s *DataV  = (v4s *) Data;
    iL = 1;
    iM = N_FFT >> 2; 
    
    for (iCnt1 = 0; iCnt1 < (iLog2N-1); iCnt1++) {
        iQ = 0;
        for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
	  v4s W = (v4s){*((int16_t *)&CoeffV[iQ]), *((int16_t *)&CoeffV[iQ] + iL)};
            iA = iCnt2; 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                v4s Tmp;
                iB = iA + iM; 
                Tmp = DataV[iA] - DataV[iB];
                DataV[iA] = (DataV[iA] + DataV[iB]) >> (v4s) {1, 1, 1, 1};
		DataV[iB] = (v4s) {((int8_t) ((((int16_t) (Tmp)[0]*(int16_t) (W)[0]) - ((int16_t) (Tmp)[1]*(int16_t) (W)[1]))>>8)),
				   ((int8_t) ((((int16_t) (Tmp)[0]*(int16_t) (W)[1]) + ((int16_t) (Tmp)[1]*(int16_t) (W)[0]))>>8)),
				   ((int8_t) ((((int16_t) (Tmp)[2]*(int16_t) (W)[2]) - ((int16_t) (Tmp)[3]*(int16_t) (W)[3]))>>8)),
				   ((int8_t) ((((int16_t) (Tmp)[2]*(int16_t) (W)[3]) + ((int16_t) (Tmp)[3]*(int16_t) (W)[2]))>>8))};
                iA = iA + (iM << 1);
            }
            iQ += iL;
        }
        iL <<= 1;
        iM >>= 1;
    }
    iA = 0;
    
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3++) {
      int8_t[2] Tmp;
      iB = iA + 2;
      Tmp[0] = *((int8_t *)&DataV[iA]) - *((int8_t *)&DataV[iA] + 2);
      Tmp[1] = *((int8_t *)&DataV[iA] + 1) - *((int8_t *)&DataV[iA] + 3);
      DataV[iA] = (DataV[iA] + DataV[iB]);
      DataV[iB] = Tmp;
      iA = iA + 2;
    }


    for (uint16_t i = 0; i < N_FFT; i++) {
      v4s S = DataV[i];
      int16_t SwapIndex = SwapTable[i];
      if (i < SwapIndex) {
	DataV[i] = DataV[SwapIndex]; DataV[SwapIndex] = S;
      }
    }
    
}


/**
  @} end of FastFourierTransformKernels group
 */
