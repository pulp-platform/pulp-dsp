/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i32p_xpulpv2.c
 * Description:  32-bit integer parallel complex fast fourier transform for XPULPV2
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
  @ingroup FastFourierTransform
 */


/**
  @addtogroup FastFourierTransformKernels
  @{
 */

/**
  @brief Parallel Complex Fourier Transform of 32-bit integers for XPULPV2 extension.
  @param[in]  Data  points to an instance of the CFFT structure
  @return        none

 */


void plp_cfft_i32p_xpulpv2(void * S)
{
    int32_t *__restrict__ Data = (int32_t*)(((plp_cfft_instance_i32 *)S)->Data);
    int32_t *__restrict__ Twiddles = (int32_t*)(((plp_cfft_instance_i32 *)S)->Twiddles);
    uint16_t *__restrict__ SwapTable = (uint16_t*)(((plp_cfft_instance_i32 *)S)->SwapTable);
    uint32_t N_FFT = (uint32_t)(((plp_cfft_instance_i32 *)S)->N_FFT);
    uint32_t nPE = (uint32_t)(((plp_cfft_instance_i32 *)S)->nPE);
  
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iLog2nPE = __FL1(nPE);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    int32_t *CoeffV = Twiddles;
    int32_t *DataV  = Data;
    iL = 1;
    iM = N_FFT / 2;
    
    for (iCnt1 = 0; iCnt1 < iLog2N - iLog2nPE; iCnt1++) {
        iQ = iL * rt_core_id() * 2;       
        for (iCnt2 = 0; iCnt2 < iM; iCnt2+=nPE) {
	    int32_t W[2] = {CoeffV[iQ], CoeffV[iQ+1]};
            iA = (iCnt2 + rt_core_id()) * 2; 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                int32_t Tmp[2];
                iB = iA + 2 * iM; 
                Tmp[0] = DataV[iA] - DataV[iB];
		Tmp[1] = DataV[iA+1] - DataV[iB+1];
                DataV[iA] = (DataV[iA] + DataV[iB]) >> 1;
		DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]) >> 1;
                DataV[iB] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[0] - (int64_t)(Tmp)[1]*(int64_t)(W)[1])>>32);
		DataV[iB+1] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[1] + (int64_t)(Tmp)[1]*(int64_t)(W)[0])>>32);
                iA = iA + 4 * iM;
            }
            iQ += 2 * iL * nPE;
        }
        iL <<= 1;
        iM >>= 1;
	
	rt_team_barrier();
    }

    for (iCnt1 = iLog2N - iLog2nPE; iCnt1 < (iLog2N-1); iCnt1++) {
	for(iCnt2 = 0; iCnt2 < iL; iCnt2+=nPE) {
	  iQ = 0;
	  iA = (iCnt2 + rt_core_id()) * 4 * iM;
	  for(iCnt3 = 0; iCnt3 < iM; iCnt3++) {
	    int32_t Tmp[2], W[2] = {CoeffV[iQ], CoeffV[iQ+1]};
	    iB = iA + 2 * iM;
	    Tmp[0] = DataV[iA] - DataV[iB];
	    Tmp[1] = DataV[iA+1] - DataV[iB+1];
	    DataV[iA] = (DataV[iA] + DataV[iB]) >> 1;
	    DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]) >> 1;
	    DataV[iB] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[0] - (int64_t)(Tmp)[1]*(int64_t)(W)[1])>>32);
	    DataV[iB+1] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[1] + (int64_t)(Tmp)[1]*(int64_t)(W)[0])>>32);
	    iA += 2;
	    iQ += 2 * iL;
	  }
	}
        iL <<= 1;
        iM >>= 1;

	rt_team_barrier();
    }
    
    iA = rt_core_id() * 4;
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3+=nPE) {
        int32_t Tmp[2];
        iB = iA + 2;
        Tmp[0] = DataV[iA] - DataV[iB];
	Tmp[1] = DataV[iA+1] - DataV[iB+1];
        DataV[iA] = (DataV[iA] + DataV[iB]);
	DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
        DataV[iB] = Tmp[0];
	DataV[iB+1] = Tmp[1];
        iA = iA + 4 * nPE;
    }

    /* for (uint32_t i = rt_core_id(); i < N_FFT; i+=nPE) { */
    /*   uint16_t SwapIndex = SwapTable[i]; */
    /*   if (i < SwapIndex) { */
    /* 	int32_t Tmp[2] = {DataV[2*i], DataV[2*i+1]}; */
    /* 	DataV[2*i] = DataV[2*SwapIndex]; */
    /* 	DataV[2*i+1] = DataV[2*SwapIndex+1]; */
    /* 	DataV[2*SwapIndex] = Tmp[0]; */
    /* 	DataV[2*SwapIndex+1] = Tmp[1]; */
    /*   } */
    /* } */
    
    uint16_t SwapTable_length = SwapTable[0];
    SwapTable++;
    for (uint16_t i = rt_core_id()*2; i < SwapTable_length; i+=2*nPE) {
      int32_t Tmp[2] = {DataV[2*SwapTable[i]], DataV[2*SwapTable[i]+1]};
      DataV[2*SwapTable[i]] = DataV[2*SwapTable[i+1]];
      DataV[2*SwapTable[i]+1] = DataV[2*SwapTable[i+1]+1];
      DataV[2*SwapTable[i+1]] = Tmp[0];
      DataV[2*SwapTable[i+1]+1] = Tmp[1];
    }
}

/**
  @} end of FastFourierTransformKernels group
 */
