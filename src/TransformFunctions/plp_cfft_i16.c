/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_i16.c
 * Description:  16-bit integer complex fourier transform glue code
 *
 * $Date:        19. Aug. 2019
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
  @ingroup groupTransforms
 */

/**
  @defgroup FourierTransform Complex Fast Fourier Transform
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
  @addtogroup FourierTransform
  @{
 */


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

  RT_CL_DATA static uint16_t * Swap_LUT_l1;
  RT_CL_DATA static int16_t * Twiddles_LUT_l1;
  
  if (rt_cluster_id() != ARCHI_FC_CID) {
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
  }
  

#ifdef PLP_FFT_SHIFT_INPUT

  #ifndef Abs
  #define Abs(a) (((a)<0)?(-a):(a))
  #endif
  
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


#endif //PLP_FFT_SHIFT_INPUT
    
  if (rt_cluster_id() == ARCHI_FC_CID){
    plp_cfft_i16s_rv32im(Data, (int16_t *)Twiddles_LUT, Swap_LUT, N_FFT);
  }
  else{
#ifdef ARCHI_CORE_HAS_CPLX
    plp_cfft_i16v_xpulpv2cplx(Data, (int16_t *)Twiddles_LUT_l1, Swap_LUT_l1, N_FFT);
#else
    plp_cfft_i16v_xpulpv2(Data, (int16_t *)Twiddles_LUT_l1, Swap_LUT_l1, N_FFT);
#endif
    
  }
  
  if (rt_cluster_id() != ARCHI_FC_CID) {
    rt_free(RT_ALLOC_CL_DATA, Swap_LUT_l1, sizeof(Swap_LUT));
    rt_free(RT_ALLOC_CL_DATA, Twiddles_LUT_l1, sizeof(Twiddles_LUT));
  }
}

/**
   @} end of FourierTransform group
*/

