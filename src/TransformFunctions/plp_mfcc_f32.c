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
#define PI 3.14159265358979323846
void print_vec_t(float32_t *V, int n)
{
  printf("[");
  for(int i=0;i<7;i++)
  {
    printf("%d: ", i);
    printf("%e, ", V[i]);
  }
  printf("... ");
  for(int i=7;i>0;i--)
  {
    printf("%d: ", n-i);
    printf("%e, ", V[n-i]);
  }
  printf("]\n");
}


/**
  @ingroup groupTransforms
 */

/**
  @defgroup fft  FFT transforms
  This module contains the code to perform FFT transforms.


 */

/**
   @addtogroup fft
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
   @param[in]   pSrc        points to the input buffer (real data, size n_fft)
   @param[out]  pDst        points to the output buffer (complex data).
   			    Must be of length at least 3*n_fft.
			    pSrc and pDst must not overlap, the calculation can
			    not be done in place. 
			    MFCCs are returned in the first n_mels spots.
   @return      none
*/
void plp_mfcc_f32(const plp_fft_instance_f32 *SFFT,
                  const plp_fft_instance_f32 *SDCT,
		  const Complex_type_f32 *__restrict__ pShift,
		  const plp_triangular_filter_f32 *__restrict__ filterBank,
		  const float32_t *__restrict__ window,
                  const float32_t *__restrict__ pSrc,
                  float32_t *__restrict__ pDst) {


	// Step 0: Periodic Hann windowing (could be left to user, 
	// also should be precomputed).
	// Stored in buffer space of pDst.
	uint32_t n_fft = SFFT->FFTLength;
	float32_t *fft_in = pDst + 2*n_fft;
	plp_mult_f32(window, pSrc, fft_in, n_fft);
	//for (int i=0;i<n_fft;i++){
		//fft_in[i] = pSrc[i]*(0.5f*(1-plp_cos_f32(2*PI*i/(n_fft))));
	//}
	//printf("AFTER HANN, BEFORE FFT\n"); //remove!
	//print_vec_t(fft_in, n_fft); //remove!
	

	// Step 1: FFT
	plp_rfft_f32(SFFT, fft_in, pDst);
	//printf("AFTER FFT, BEFORE MAG\n"); //remove!
	//print_vec_t(pDst, n_fft+2); //remove!
	

	// Step 2: ||.||^2 of each RFFT point / Take squared magnitude.
	// Stores result in free buffer space of pDst, right behind
	// the RFFT's (n_fft+2)-long output. 
	float32_t *fft_mag = pDst + n_fft+2;
	plp_cmplx_mag_squared_f32(pDst, fft_mag, n_fft/2 + 1);
	//printf("AFTER MAG, BEFORE FB\n"); //remove!
	//print_vec_t(fft_mag, n_fft/2 + 1); //remove!


	// Step 3: Apply triangular filter bank.
	// results are stored in the beginning of pDst.
	float32_t *fb_out = pDst;
	uint16_t n_mels = filterBank->nFilters;
	float32_t *filter_start = (float32_t*)filterBank->V;
	for (int i=0;i<n_mels;i++){
		uint16_t current_length = filterBank->filterLength[i];
		plp_dot_prod_f32(
                          fft_mag+filterBank->firstValue[i], 
                          filter_start,
                          current_length, 
                          fb_out+i);
		filter_start += current_length;
  	}
	//printf("AFTER FB, BEFORE LOG\n"); //remove!
	//print_vec_t(fb_out, n_mels); //remove!


	// Step 4: Take the log of the computed mel scale. 
	// the offset is copied from pytorch
	plp_offset_f32(fb_out, 1e-6f, fb_out, 32);
	float32_t *mel_logs = fb_out;
	for (int i=0;i<n_mels;i++){
        	float32_t log_i = log(fb_out[i]);
        	mel_logs[i] = log_i;
        	//fft_h_out[n_dct-1-i] = log_i;	// why tf did I do this?
	}
	//printf("AFTER LOG, BEFORE DCT\n"); //remove!
	//print_vec_t(fb_out, n_mels); //remove!


	// Step 5: DCT of log mels
	// corresponds to using pytorch MFCC with norm = None
	float32_t *dct_inout = mel_logs;
	float32_t *dct_buffer = pDst + n_mels;
	plp_dct2_f32(SDCT, pShift, dct_inout, dct_buffer, dct_inout);
	//printf("AFTER DCT\n"); //remove!
	//print_vec_t(dct_inout, n_mels); //remove!
}

/**
   @} end of FFT group
*/
