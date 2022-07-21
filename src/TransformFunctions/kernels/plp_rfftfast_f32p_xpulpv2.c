/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_rfftfast_f32p_xpulpv2.c
 * Description:  Floating-point parallel FFT on complex input data for XPULPV2
 *
 * $Date:        29. April 2022
 * $Revision:    V1
 *
 * Target Processor: PULP cores with "F" support (wolfe, vega)
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Marco Bertuletti, Thorir Ingolfsson ETH Zurich
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

void stage_rfft_f32( const plp_fft_fast_instance_f32 * S, float32_t * pSrc, float32_t * pDst, uint32_t nPE);

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))


void plp_rfftfast_f32p_xpulpv2( void *arg )
{
      plp_fft_fast_instance_f32 * S = ((plp_fft_fast_instance_f32_parallel*)arg)->S;
      const plp_cfft_instance_f32 * Sint = (S->Sint);
      float32_t *pSrc = ((plp_fft_fast_instance_f32_parallel*)arg)->pSrc;
      float32_t *pDst = ((plp_fft_fast_instance_f32_parallel*)arg)->pDst;
      uint32_t nPE = ((plp_fft_fast_instance_f32_parallel*)arg)->nPE;

      /* Calculation of RFFT of input */
      plp_cfft_instance_f32_parallel arg_cfft = (plp_cfft_instance_f32_parallel){ Sint, pSrc, 0, 1, nPE };
      plp_cfft_f32p_xpulpv2((void *)&arg_cfft);
      hal_team_barrier();
      /*  Real FFT extraction */
      stage_rfft_f32(S, pSrc, pDst, nPE);
      hal_team_barrier();
}

void stage_rfft_f32( const plp_fft_fast_instance_f32 * S, float32_t * p, float32_t * pDst, uint32_t nPE)
{
        uint32_t fftLen = (*(S->Sint)).fftLen;
        uint32_t step;
        uint32_t core_id = hal_core_id();
        int32_t  k;                                   /* Loop Counter */
        float32_t twR, twI;                           /* RFFT Twiddle coefficients */
  const float32_t * pCoeff = S->pTwiddleFactorsRFFT;  /* Points to RFFT Twiddle factors */
        float32_t *pA = p;                            /* increasing pointer */
        float32_t *pB = p + 2*(fftLen - 1);           /* decreasing pointer */
        float32_t xAR, xAI, xBR, xBI;                 /* temporary variables */
        float32_t t1a, t1b;                           /* temporary variables */
        float32_t p0, p1, p2, p3;                     /* temporary variables */

   /* Pack first and last sample of the frequency domain together */
   if(core_id==0) 
   {
      xBR = p[0];
      xBI = p[1];
      xAR = p[0];
      xAI = p[1];
      twR = pCoeff[0];
      twI = pCoeff[1];
      // U1 = XA(1) + XB(1); % It is real
      t1a = xBR + xAR;
      // U2 = XB(1) - XA(1); % It is imaginary
      t1b = xBI + xAI;
      // real(tw * (xB - xA)) = twR * (xBR - xAR) - twI * (xBI - xAI);
      // imag(tw * (xB - xA)) = twI * (xBR - xAR) + twR * (xBI - xAI);
      pDst[0] = 0.5f * ( t1a + t1b );
      pDst[1] = 0.5f * ( t1a - t1b );
      //*pDst++ = 0;
      //*pDst++ = 0.5f * ( xBR - xAR - xAI + xBI);
   }
   pA     +=2;
   pDst   +=2;
   pCoeff +=2;
   hal_team_barrier();
   
   // XA(1) = 1/2*( U1 - imag(U2) +  i*( U1 +imag(U2) ));
   step = (fftLen+nPE-1)/nPE;
   pB -= 2*(core_id*step);
   pA += 2*(core_id*step);
   pDst += 2*(core_id*step);
   pCoeff += 2*(core_id*step);
   for(k = core_id*step; k < MIN(fftLen-1,(core_id+1)*step); k++)
   {
      /*
         function X = my_split_rfft(X, ifftFlag)
         % X is a series of real numbers
         L  = length(X);
         XC = X(1:2:end) +i*X(2:2:end);
         XA = fft(XC);
         XB = conj(XA([1 end:-1:2]));
         TW = i*exp(-2*pi*i*[0:L/2-1]/L).';
         for l = 2:L/2
            XA(l) = 1/2 * (XA(l) + XB(l) + TW(l) * (XB(l) - XA(l)));
         end
         XA(1) = 1/2* (XA(1) + XB(1) + TW(1) * (XB(1) - XA(1))) + i*( 1/2*( XA(1) + XB(1) + i*( XA(1) - XB(1))));
         X = XA;
      */

      xBR = pB[0];
      xBI = pB[1];
      xAR = pA[0];
      xAI = pA[1];
      twR = *pCoeff++;
      twI = *pCoeff++;
      t1a = xBR - xAR ;
      t1b = xBI + xAI ;
      // real(tw * (xB - xA)) = twR * (xBR - xAR) - twI * (xBI - xAI);
      // imag(tw * (xB - xA)) = twI * (xBR - xAR) + twR * (xBI - xAI);
      p0 = twR * t1a;
      p1 = twI * t1a;
      p2 = twR * t1b;
      p3 = twI * t1b;
      *pDst++ = 0.5f * (xAR + xBR + p0 + p3 ); //xAR
      *pDst++ = 0.5f * (xAI - xBI + p1 - p2 ); //xAI
      pA += 2;
      pB -= 2;
   }

}