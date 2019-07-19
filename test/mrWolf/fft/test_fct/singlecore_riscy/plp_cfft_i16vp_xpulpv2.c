/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i16vp_xpulpv2.c
 * Description:  16-bit integer vectorized parallel complex fast fourier transform for XPULPV2
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
  @brief Parallel Complex Fourier Transform of vectorized 16-bit integers for XPULPV2 extension.
  @param[in]  Data  points to an instance of the CFFT structure
  @return        none

 */

void plp_cfft_i16vp_xpulpv2(void * S)
{
    int16_t *__restrict__ Data = (int16_t*)(((plp_cfft_instance_i16 *)S)->Data);
    int16_t *__restrict__ Twiddles = (int16_t*)(((plp_cfft_instance_i16 *)S)->Twiddles);
    uint16_t * __restrict__ SwapTable = (uint16_t*)(((plp_cfft_instance_i16 *)S)->SwapTable);
    uint32_t N_FFT = (uint32_t)(((plp_cfft_instance_i16 *)S)->N_FFT);
    uint32_t nPE = (uint32_t)(((plp_cfft_instance_i16 *)S)->nPE);
  
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iLog2nPE = __FL1(nPE);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    v2s *CoeffV = (v2s *) Twiddles;
    v2s *DataV  = (v2s *) Data;
    iL = 1;
    iM = N_FFT / 2;
    
    for (iCnt1 = 0; iCnt1 < iLog2N - iLog2nPE; iCnt1++) {
        iQ = iL * rt_core_id();       
        for (iCnt2 = 0; iCnt2 < iM; iCnt2+=nPE) {
            v2s W = CoeffV[iQ];
            iA = iCnt2 + rt_core_id(); 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                v2s Tmp;
                iB = iA + iM; 
                Tmp = DataV[iA] - DataV[iB]; 
                DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1}; 
                DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>16))}; 
                iA = iA + 2 * iM;
            }
            iQ += iL * nPE;
        }
        iL <<= 1;
        iM >>= 1;
	
	rt_team_barrier();
    }

    for (iCnt1 = iLog2N - iLog2nPE; iCnt1 < (iLog2N-1); iCnt1++) {
	for(iCnt2 = 0; iCnt2 < iL; iCnt2+=nPE) {
	  iQ = 0;
	  iA = (iCnt2 + rt_core_id()) * 2 * iM;
	  for(iCnt3 = 0; iCnt3 < iM; iCnt3++) {
	    v2s Tmp, W = CoeffV[iQ];
	    iB = iA + iM;
	    Tmp = DataV[iA] - DataV[iB]; 
            DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1}; 
            DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>16))};
	    iA += 1;
	    iQ += iL;
	  }
	}
        iL <<= 1;
        iM >>= 1;

	rt_team_barrier();
    }
    
    iA = rt_core_id() * 2;
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3+=nPE) {
        v2s Tmp;
        iB = iA + 1;
        Tmp = DataV[iA] - DataV[iB];
        DataV[iA] = (DataV[iA] + DataV[iB]);
        DataV[iB] = Tmp;
        iA = iA + 2 * nPE;
    }


    for (uint32_t i = rt_core_id(); i < N_FFT; i+=nPE) {
      v2s S = DataV[i];
      uint16_t SwapIndex = SwapTable[i];
      if (i < SwapIndex) {
	DataV[i] = DataV[SwapIndex];
	DataV[SwapIndex] = S;
      }
    }

}



/**
  @} end of FastFourierTransformKernels group
 */
