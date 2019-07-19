/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i16s_rv32im.c
 * Description:  16-bit integer scalar complex fourier transform for RV32IM
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
  @brief Complex Fourier Transform of 16-bit integer vectors kernel for RV32IM extension
  @param[in,out]  Data   points to the complex data buffer of size <code>2*N_FFT</code> [16 bit]. Processing occurs in-place
  @param[in]  Twiddles   points to the Twiddles-factor LUT [16 bit]
  @param[in]  SwapTable  points to the SwapTable LUT [16 bit]
  @param[in]  N_FFT      Size of input data
  @return        none
 */


void plp_cfft_i16s_rv32im(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, uint16_t * __restrict__ SwapTable, uint32_t N_FFT)
{
    uint32_t iLog2N  = 0;
    uint32_t N = N_FFT;
    while(N >>= 1) iLog2N++;
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    int16_t *CoeffV = Twiddles;
    int16_t *DataV  =  Data;
    iL = 1;
    iM = N_FFT / 2; 
    
    for (iCnt1 = 0; iCnt1 < (iLog2N-1); iCnt1++) {
        iQ = 0;
        for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
	    int16_t W[2] = {CoeffV[iQ], CoeffV[iQ+1]};
            iA = iCnt2 * 2; 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                int16_t Tmp[2];
                iB = iA + 2 * iM; 
                Tmp[0] = DataV[iA] - DataV[iB];
		Tmp[1] = DataV[iA+1] - DataV[iB+1];
                DataV[iA] = (DataV[iA] + DataV[iB]) >> 1;
		DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]) >> 1;
                DataV[iB] = (int16_t)(((int32_t)(Tmp)[0]*(int32_t)(W)[0] - (int32_t)(Tmp)[1]*(int32_t)(W)[1])>>16);
		DataV[iB+1] = (int16_t)(((int32_t)(Tmp)[0]*(int32_t)(W)[1] + (int32_t)(Tmp)[1]*(int32_t)(W)[0])>>16);
                iA = iA + 4 * iM;
            }
            iQ += 2 *iL;
        }
        iL <<= 1;
        iM >>= 1;
    }
    iA = 0;
    
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3++) {
        int16_t Tmp[2];
        iB = iA + 2;
        Tmp[0] = DataV[iA] - DataV[iB];
	Tmp[1] = DataV[iA+1] - DataV[iB+1];
        DataV[iA] = (DataV[iA] + DataV[iB]);
	DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
        DataV[iB] = Tmp[0];
	DataV[iB+1] = Tmp[1];
        iA = iA + 4;
    }
  
    for (uint16_t i = 0; i < N_FFT; i++) {
      uint16_t SwapIndex = SwapTable[i];
      if (i < SwapIndex) {
	int16_t Tmp[2] = {Data[2*i], Data[2*i+1]};
	Data[2*i] = Data[2*SwapIndex];
	Data[2*i+1] = Data[2*SwapIndex+1];
	Data[2*SwapIndex] = Tmp[0];
	Data[2*SwapIndex+1] = Tmp[1];
      }
  }
}


/**
  @} end of FastFourierTransformKernels group
 */
