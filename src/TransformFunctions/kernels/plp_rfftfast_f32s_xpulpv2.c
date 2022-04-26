/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_rfftfast_f32s_xpulpv2.c
 * Description:  Floating-point FFT on complex input data for XPULPV2
 *
 * $Date:        10. August 2020
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

void cfft_f32( const plp_cfft_instance_f32 * S, float32_t * pSrc, uint8_t bitReverseFlag);
void stage_rfft_f32( const plp_fft_fast_instance_f32 * S, float32_t * pSrc, float32_t * pDst);
void radix8_butterfly_f32( float32_t * pSrc, uint16_t fftLen, const float32_t * pCoef, uint16_t twidCoefModifier);
void bitreversal_32( uint32_t *pSrc, const uint16_t bitRevLen, const uint16_t *pBitRevTab);


void cfft_radix8by4_f32 (plp_cfft_instance_f32 * S, float32_t * p1);
void cfft_radix8by2_f32 (plp_cfft_instance_f32 * S, float32_t * p1);




void plp_rfftfast_f32s_xpulpv2( const plp_fft_fast_instance_f32 *S,
                                 float32_t *pSrc,
                                 float32_t *pDst)
{
   const plp_cfft_instance_f32 * Sint = (S->Sint);
   /* Calculation of RFFT of input */
   plp_cfft_f32s_xpulpv2(Sint, pSrc, 0, 1);
   /*  Real FFT extraction */
   stage_rfft_f32(S, pSrc, pDst);
}

void stage_rfft_f32( const plp_fft_fast_instance_f32 * S, float32_t * p, float32_t * pDst)
{
        int32_t  k;                                   /* Loop Counter */
        float32_t twR, twI;                           /* RFFT Twiddle coefficients */
  const float32_t * pCoeff = S->pTwiddleFactorsRFFT;  /* Points to RFFT Twiddle factors */
        float32_t *pA = p;                         /* increasing pointer */
        float32_t *pB = p;                         /* decreasing pointer */
        float32_t xAR, xAI, xBR, xBI;                 /* temporary variables */
        float32_t t1a, t1b;                           /* temporary variables */
        float32_t p0, p1, p2, p3;                     /* temporary variables */


   k = (*(S->Sint)).fftLen - 1;

   /* Pack first and last sample of the frequency domain together */

   xBR = pB[0];
   xBI = pB[1];
   xAR = pA[0];
   xAI = pA[1];

   twR = *pCoeff++;
   twI = *pCoeff++;


   // U1 = XA(1) + XB(1); % It is real
   t1a = xBR + xAR  ;

   // U2 = XB(1) - XA(1); % It is imaginary
   t1b = xBI + xAI  ;

   // real(tw * (xB - xA)) = twR * (xBR - xAR) - twI * (xBI - xAI);
   // imag(tw * (xB - xA)) = twI * (xBR - xAR) + twR * (xBI - xAI);
   *pDst++ = 0.5f * ( t1a + t1b );
   *pDst++ = 0.5f * ( t1a - t1b );
   //*pDst++ = 0;
   //*pDst++ = 0.5f * ( xBR - xAR - xAI + xBI);
   
   // XA(1) = 1/2*( U1 - imag(U2) +  i*( U1 +imag(U2) ));
   pB  = p + 2*k;
   pA += 2;

   do
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

      xBI = pB[1];
      xBR = pB[0];
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
      k--;
   } while (k > 0);
}