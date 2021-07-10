/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_mfcc_f32.c
 * Description:  Floating-point MFCC on real input data
 *
 * $Date:        05. July 2021
 * $Revision:    V0
 *
 * Target Processor: PULP cores with "F" support (wolfe, vega)
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Aron Szakacs, ETH Zurich
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
  @ingroup groupTransforms
 */

/**
  @defgroup feature  feature transforms
  This module contains the code to perform feature transforms.


 */

/**
   @addtogroup feature
   @{
*/

/**
   @brief MFCC on real input data.
   @param[in]   SFFT        points to an instance of the floating-point FFT
   			    structure for the initial FFT (with FFTLength = n_fft).
			    bitReverseFlag should be on.
   @param[in]   SDCT        points to an instance of the floating-point FFT
   			    structure for the DCT (with FFTLength = n_mels).
			    bitReverseFlag should be on.
   @param[in]   pShift      points to twiddle coefficient table with
   			    FFTLength = 4*n_mels. Only first quarter necessary.
   @param[in]   filterBank  points to plp_triangular_filter_f32 instance with 
   			    nFilters = n_mels.
   @param[in]   window      vector to use for windowing
   @param[in]   orthoNorm   whether to use dct orthonormalisation or not
   @param[in]   pSrc        points to the input buffer (real data, size n_fft)
   @param[in]   nPE         number of parallel processing units
   @param[out]  pDst        points to the output buffer 
   			    of length at least 3*n_fft.
			    pSrc and pDst must not overlap, the calculation can
			    not be done in place. 
			    MFCCs are returned in the first n_mels spots.
   @return      none
*/
void plp_mfcc_f32_parallel(const plp_fft_instance_f32 *SFFT,
                  	   const plp_fft_instance_f32 *SDCT,
		  	   const Complex_type_f32 *pShift,
		  	   const plp_triangular_filter_f32 *filterBank,
		  	   const float32_t *window,
		  	   const uint8_t *orthoNorm,
                  	   const float32_t *__restrict__ pSrc,
                  	   const uint32_t nPE,
                  	   float32_t *__restrict__ pDst) {


	// Step 0: Windowing. Stored in buffer space of pDst.
	uint32_t n_fft = SFFT->FFTLength;
	float32_t *fft_in = pDst + 2*n_fft;
	plp_mult_f32_parallel(window, pSrc, n_fft, nPE, fft_in);
	

	// Step 1: FFT
	plp_rfft_f32_parallel(SFFT, fft_in, nPE, pDst);
	

	// Step 2: ||.||^2 of each RFFT point / Take squared magnitude.
	// Stores result in free buffer space of pDst, right behind
	// the RFFT's (n_fft+2)-long output. 
	float32_t *fft_mag = pDst + n_fft+2;
	plp_cmplx_mag_squared_f32(pDst, fft_mag, n_fft/2 + 1);


	// Step 3: Apply triangular filter bank.
	// results are stored in the beginning of pDst.
	float32_t *fb_out = pDst;
	uint16_t n_mels = filterBank->nFilters;
	float32_t *filter_start = (float32_t*)filterBank->V;
	for (int i=0;i<n_mels;i++){
		uint16_t current_length = filterBank->filterLength[i];
		plp_dot_prod_f32_parallel(
                          fft_mag+filterBank->firstValue[i], 
                          filter_start,
                          current_length, 
			  nPE,
                          fb_out+i);
		filter_start += current_length;
  	}


	// Step 4: Take the log of the computed mel scale. 
	// the offset is copied from pytorch
	plp_offset_f32(fb_out, 1e-6f, fb_out, 32);
	float32_t *mel_logs = fb_out;
	for (int i=0;i<n_mels;i++){
        	float32_t log_i = log(fb_out[i]);
        	mel_logs[i] = log_i;
	}


	// Step 5: DCT of log mels
	// corresponds to using pytorch MFCC with norm = None
	float32_t *dct_inout = mel_logs;
	float32_t *dct_buffer = pDst + n_mels;
	plp_dct2_f32_parallel(SDCT, pShift, orthoNorm, dct_inout, nPE, dct_buffer, dct_inout);
}

/**
   @} end of feature group
*/
