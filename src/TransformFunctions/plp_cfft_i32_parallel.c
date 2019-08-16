/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i32_parallel.c
 * Description:  32-bit integer parallel complex fourier transform glue code
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
#include "kernels/SwapTable.h"
#include "kernels/TwiddleFactors.h"


/**
  @ingroup groupMath
 */


/**
  @addtogroup FourierTransform
  @{
 */


#ifndef Abs
#define Abs(a) (((a)<0)?(-a):(a))
#endif
/**
  @brief Glue code for parallel Complex Fourier Transform of 32-bit integer vectors
  @param[in,out]  Data   points to the complex data buffer of size <code>2*N_FFT</code> [32 bit]. Processing occurs in-place
  @param[in]  N_FFT      Size of input data
  @param[in]  nPE        number of parallel processing units
  @return        none
 */

void plp_cfft_i32_parallel(int32_t * __restrict__ Data,
			   uint32_t N_FFT,
			   uint32_t nPE)
{

  uint32_t argmax, shift, maxlog2N = 0;
  int32_t max = 0;
  uint32_t N = N_FFT;
  RT_CL_DATA static uint16_t * Swap_LUT_l1;
  RT_CL_DATA static int32_t * Twiddles_LUT_l1;
  
  /* L1 Memory allocation for look-up tables */
  Swap_LUT_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(Swap_LUT));
  Twiddles_LUT_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(Twiddles_LUT));
  
  if(Swap_LUT_l1 == NULL || Twiddles_LUT_l1 == NULL)
    printf("memory allocation for look-up tables failed");
  
  /* Transfer to L1 memory */
  rt_dma_copy_t copy;
  rt_dma_memcpy((unsigned int)Swap_LUT, (unsigned int)Swap_LUT_l1, sizeof(Swap_LUT), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy((unsigned int)Twiddles_LUT, (unsigned int)Twiddles_LUT_l1, sizeof(Twiddles_LUT), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);

#ifdef PLP_FFT_SHIFT_INPUT
  
  /* find maximum absolute value of input data */
  for(uint32_t i = 0; i < 2 * N_FFT; i++) {
    if(Abs(Data[i]) > max)
      max = Abs(Data[i]);
  }

  /* log2 of maximum absolute value */
  while(max >>= 1) maxlog2N++;

  /* shift input data to 30-bit precision  */
  if (maxlog2N <= 29) {
    shift = 29 - maxlog2N;
    for(uint32_t i = 0; i < 2 * N_FFT; i++)
      Data[i] <<= shift;
  }
  else {
    shift = maxlog2N - 29;
    for(uint32_t i = 0; i < 2 * N_FFT; i++) {
      Data[i] >>= shift;
    }
  }

#endif //PLP_FFT_SHIFT_INPUT
  
  if (rt_cluster_id() == ARCHI_FC_CID){
    printf("parallel processing supported only for cluster side\n");
    return;
  }
  else{

    plp_cfft_instance_i32 S = {
      .Data = Data,
      .Twiddles = Twiddles_LUT_l1,
      .SwapTable = Swap_LUT_l1,
      .N_FFT = N_FFT,
      .nPE = nPE,
    };
    
    rt_team_fork(nPE, plp_cfft_i32p_xpulpv2, (void *)&S);
    
  }
}
