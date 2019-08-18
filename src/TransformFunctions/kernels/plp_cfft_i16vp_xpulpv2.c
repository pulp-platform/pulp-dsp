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

#include "plp_math.h"


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
  iM = N_FFT >> 1;
  
  /* iQ = iL * rt_core_id(); */
  /* for (iCnt2 = 0; iCnt2 < (iM >> iLog2nPE); iCnt2++) { */
  /*   v2s W = CoeffV[iQ]; */
  /*   iA = (iCnt2 << iLog2nPE) + rt_core_id(); */
  /*   for (iCnt3 = 0; iCnt3 < iL; iCnt3++) { */
  /*     v2s Tmp; */
  /*     iB = iA + iM; */
  /*     Tmp = DataV[iA] - DataV[iB]; */
  /*     DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1}; */
  /*     DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>16))}; */
  /*   } */
  /*   iQ += iL * nPE; */
  /* } */
  /* iL <<= 1; */
  /* iM >>= 1; */
  
  /* rt_team_barrier(); */

  /* for (iCnt1 = 1; iCnt1 < iLog2N - iLog2nPE; iCnt1++) {  */
  /*   iQ = iL * rt_core_id(); */
  /*   for (iCnt2 = 0; iCnt2 < (iM >> iLog2nPE); iCnt2++) { */
  /*     v2s W = CoeffV[iQ]; */
  /*     iA = (iCnt2 << iLog2nPE) + rt_core_id(); */
  /*     for (iCnt3 = 0; iCnt3 < iL>>1; iCnt3++) { */
  /* 	v2s Tmp1, Tmp2; */
  /* 	uint32_t iA2, iB2; */
  /* 	iB = iA + iM; */
  /* 	iA2 = iA + 2 * iM; */
  /* 	iB2 = iA2 + iM; */
  /* 	Tmp1 = DataV[iA] - DataV[iB]; */
  /* 	Tmp2 = DataV[iA2] - DataV[iB2]; */
  /* 	DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1}; */
  /* 	DataV[iA2] = (DataV[iA2] + DataV[iB2]) >> (v2s) {1, 1}; */
  /* 	DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp1)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp1)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp1)[0]*(int32_t) (W)[1]) + ((int) (Tmp1)[1]*(int32_t) (W)[0]))>>16))}; */
  /* 	DataV[iB2] = (v2s) {((int16_t) ((((int32_t) (Tmp2)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp2)[1]*(int32_t) (W)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp2)[0]*(int32_t) (W)[1]) + ((int) (Tmp2)[1]*(int32_t) (W)[0]))>>16))}; */
  /* 	iA += iM << 2; */
  /*     } */
  /*     iQ += iL * nPE; */
  /*   } */
  /*   iL <<= 1; */
  /*   iM >>= 1; */
      
  /*   rt_team_barrier(); */
  /* } */
  
  /* for (iCnt1 = iLog2N - iLog2nPE; iCnt1 < (iLog2N-1); iCnt1++) { */
  /*   for(iCnt2 = 0; iCnt2 < (iL >> iLog2nPE); iCnt2++) { */
  /*     iQ = 0; */
  /*     iA = ((iCnt2 << iLog2nPE) + rt_core_id()) * 2 * iM; */
  /*     for(iCnt3 = 0; iCnt3 < (iM>>1); iCnt3++) { */
  /* 	v2s Tmp1, W1 = CoeffV[iQ]; */
  /* 	v2s Tmp2, W2 = CoeffV[iQ+iL]; */
  /* 	uint32_t iA2, iB2; */
  /* 	iB = iA + iM; */
  /* 	iA2 = iA + 1; */
  /* 	iB2 = iA2 + iM; */
  /* 	Tmp1 = DataV[iA] - DataV[iB]; */
  /* 	Tmp2 = DataV[iA2] - DataV[iB2]; */
  /* 	DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {1, 1}; */
  /* 	DataV[iA2] = (DataV[iA2] + DataV[iB2]) >> (v2s) {1, 1}; */
  /* 	DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp1)[0]*(int32_t) (W1)[0]) - ((int32_t) (Tmp1)[1]*(int32_t) (W1)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp1)[0]*(int32_t) (W1)[1]) + ((int) (Tmp1)[1]*(int32_t) (W1)[0]))>>16))}; */
  /* 	DataV[iB2] = (v2s) {((int16_t) ((((int32_t) (Tmp2)[0]*(int32_t) (W2)[0]) - ((int32_t) (Tmp2)[1]*(int32_t) (W2)[1]))>>16)), ((int16_t) ((((int32_t) (Tmp2)[0]*(int32_t) (W2)[1]) + ((int) (Tmp2)[1]*(int32_t) (W2)[0]))>>16))}; */
  /* 	iA += 2; */
  /* 	iQ += iL << 1; */
  /*     } */
  /*   } */
  /*   iL <<= 1; */
  /*   iM >>= 1; */
      
  /*   rt_team_barrier(); */
  /* } */

  for (iCnt1 = 0; iCnt1 < iLog2N - iLog2nPE; iCnt1++) {
    iQ = iL * rt_core_id();
    for (iCnt2 = 0; iCnt2 < (iM>>iLog2nPE); iCnt2++) {
      v2s W = CoeffV[iQ];
      iA = (iCnt2<<iLog2nPE) + rt_core_id();
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
    for(iCnt2 = 0; iCnt2 < (iL>>iLog2nPE); iCnt2++) {
      iQ = 0;
      iA = ((iCnt2<<iLog2nPE) + rt_core_id()) * 2 * iM;
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
  
  
  
  //iA = rt_core_id() * 2;

  /* /\* Last Layer: W = (1, 0) *\/ */
  /* for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3+=nPE) { */
  /*   v2s Tmp; */
  /*   iB = iA + 1; */
  /*   Tmp = DataV[iA] - DataV[iB]; */
  /*   DataV[iA] = (DataV[iA] + DataV[iB]); */
  /*   DataV[iB] = Tmp; */
  /*   iA = iA + 2 * nPE; */
  /* } */

  /* rt_team_barrier(); */

  /* Last Layer: W = (1, 0) */
  /* for (iCnt3 = 0; iCnt3 < (N_FFT>>(1+iLog2nPE)); iCnt3++) { */
  /*   v2s Tmp; */
  /*   iB = iA + 1; */
  /*   Tmp = DataV[iA] - DataV[iB]; */
  /*   DataV[iA] = (DataV[iA] + DataV[iB]); */
  /*   DataV[iB] = Tmp; */
  /*   iA = iA + 2 * nPE; */
  /* } */

  /* rt_team_barrier(); */


  iA = rt_core_id() * 4;
  /* Last Layer: W = (1, 0) */
  for (iCnt3 = 0; iCnt3 < (N_FFT>>(2+iLog2nPE)); iCnt3++) {
    v2s Tmp1, Tmp2;
    iB = iA + 1;
    Tmp1 = DataV[iA] - DataV[iB];
    Tmp2 = DataV[iA + 2] - DataV[iB + 2];
    DataV[iA] = (DataV[iA] + DataV[iB]);
    DataV[iA + 2] = (DataV[iA + 2] + DataV[iB + 2]);
    DataV[iB] = Tmp1;
    DataV[iB + 2] = Tmp2;
    iA = iA + 4 * nPE;
  }

  rt_team_barrier();

  
  

  uint16_t SwapTable_length = SwapTable[0];
  SwapTable++;
  for (uint16_t i = rt_core_id()*2; i < SwapTable_length; i+=2*nPE) {
    v2s S = DataV[SwapTable[i]];
    DataV[SwapTable[i]] = DataV[SwapTable[i+1]];
    DataV[SwapTable[i+1]] = S;
  }

  /* for (uint16_t i = 0; i < (SwapTable_length>>(1+iLog2nPE)); i++) { */
  /*   uint16_t index = (i<<(1+iLog2nPE)) + rt_core_id()*2; */
  /*   v2s S = DataV[SwapTable[index]]; */
  /*   DataV[SwapTable[index]] = DataV[SwapTable[index+1]]; */
  /*   DataV[SwapTable[index+1]] = S; */
  /* } */

}



/**
   @} end of FastFourierTransformKernels group
*/
