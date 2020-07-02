/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_q16s_rv32im.c
 * Description:  16-bit fixed point Fast Fourier Transform on Compled Input Data
 *
 * $Date:        30. June 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Michael Rogenmoser, ETH Zurich
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
 * @ingroup groupTransforms
 */

/**
 * @addtogroup fft
 * @{
 */

/**
  @brief         In-place 16 bit reversal function.
  @param[in,out] pSrc        points to in-place buffer of unknown 16-bit data type
  @param[in]     bitRevLen   bit reversal table length
  @param[in]     pBitRevTab  points to bit reversal table
  @return        none
*/

void arm_bitreversal_16(
        uint16_t *pSrc,
  const uint16_t bitRevLen,
  const uint16_t *pBitRevTab)
{
  uint16_t a, b, i, tmp;

  for (i = 0; i < bitRevLen; )
  {
     a = pBitRevTab[i    ] >> 2;
     b = pBitRevTab[i + 1] >> 2;

     //real
     tmp = pSrc[a];
     pSrc[a] = pSrc[b];
     pSrc[b] = tmp;

     //complex
     tmp = pSrc[a+1];
     pSrc[a+1] = pSrc[b+1];
     pSrc[b+1] = tmp;

    i += 2;
  }
}


static void plp_cfft_radix4by2_q16(
	int16_t * pSrc,
	uint32_t fftLen,
	const int16_t * pCoef);

static void plp_radix4_butterfly_q16(
	int16_t * pSrc16,
	uint32_t fftLen,
	int16_t * pCoef16,
	uint32_t twidCoefModifier);

void plp_cfft_q16s_rv32im(
	const plp_cfft_instance_q16 *S,
	int16_t * p1,
	uint8_t ifftFlag,
	uint8_t bitReverseFlag,
	uint32_t deciPoint) {

	uint32_t L = S->fftLen;

	if (ifftFlag == 0) {
		switch(L){
			case 16:
			case 64:
			case 256:
			case 1024:
			case 4096:
			plp_radix4_butterfly_q16(p1, L, (int16_t*)S->pTwiddle, 1);
			break;
			case 32:
			case 128:
			case 512:
			case 2048:
			plp_cfft_radix4by2_q16(p1, L, (int16_t*)S->pTwiddle);
			break;
		}
	}

	if ( bitReverseFlag )
		arm_bitreversal_16 ((uint16_t*) p1, S->bitRevLength, S->pBitRevTable);
}


void plp_cfft_radix4by2_q16(
	int16_t * pSrc,
	uint32_t fftLen,
	const int16_t * pCoef) {

	uint32_t i;
	uint32_t n2;
	int16_t p0, p1, p2, p3;

	uint32_t ia, l;
	int16_t xt, yt, cosVal, sinVal;

	n2 = fftLen >> 1;

	ia = 0;
	for (i = 0; i < n2; i++)
	{
		cosVal = pCoef[ia * 2];
		sinVal = pCoef[(ia * 2) + 1];
		ia++;

		l = i + n2;

		xt = (pSrc[2 * i] >> 1U) - (pSrc[2 * l] >> 1U);
		pSrc[2 * i] = ((pSrc[2 * i] >> 1U) + (pSrc[2 * l] >> 1U)) >> 1U;

		yt = (pSrc[2 * i + 1] >> 1U) - (pSrc[2 * l + 1] >> 1U);
		pSrc[2 * i + 1] =
		((pSrc[2 * l + 1] >> 1U) + (pSrc[2 * i + 1] >> 1U)) >> 1U;

		pSrc[2U * l] = (((int16_t) (((int32_t) xt * cosVal) >> 16)) +
			((int16_t) (((int32_t) yt * sinVal) >> 16)));

		pSrc[2U * l + 1U] = (((int16_t) (((int32_t) yt * cosVal) >> 16)) -
			((int16_t) (((int32_t) xt * sinVal) >> 16)));
	}

    // first col
	plp_radix4_butterfly_q16( pSrc, n2, (int16_t*)pCoef, 2U);
    // second col
	plp_radix4_butterfly_q16( pSrc + fftLen, n2, (int16_t*)pCoef, 2U);

	for (i = 0; i < fftLen >> 1; i++)
	{
		p0 = pSrc[4*i+0];
		p1 = pSrc[4*i+1];
		p2 = pSrc[4*i+2];
		p3 = pSrc[4*i+3];

		p0 <<= 1;
		p1 <<= 1;
		p2 <<= 1;
		p3 <<= 1;

		pSrc[4*i+0] = p0;
		pSrc[4*i+1] = p1;
		pSrc[4*i+2] = p2;
		pSrc[4*i+3] = p3;
	}
}

/*
* Radix-4 FFT algorithm used is :
*
* Input real and imaginary data:
* x(n) = xa + j * ya
* x(n+N/4 ) = xb + j * yb
* x(n+N/2 ) = xc + j * yc
* x(n+3N 4) = xd + j * yd
*
*
* Output real and imaginary data:
* x(4r) = xa'+ j * ya'
* x(4r+1) = xb'+ j * yb'
* x(4r+2) = xc'+ j * yc'
* x(4r+3) = xd'+ j * yd'
*
*
* Twiddle factors for radix-4 FFT:
* Wn = co1 + j * (- si1)
* W2n = co2 + j * (- si2)
* W3n = co3 + j * (- si3)

* The real and imaginary output values for the radix-4 butterfly are
* xa' = xa + xb + xc + xd
* ya' = ya + yb + yc + yd
* xb' = (xa+yb-xc-yd)* co1 + (ya-xb-yc+xd)* (si1)
* yb' = (ya-xb-yc+xd)* co1 - (xa+yb-xc-yd)* (si1)
* xc' = (xa-xb+xc-xd)* co2 + (ya-yb+yc-yd)* (si2)
* yc' = (ya-yb+yc-yd)* co2 - (xa-xb+xc-xd)* (si2)
* xd' = (xa-yb-xc+yd)* co3 + (ya+xb-yc-xd)* (si3)
* yd' = (ya+xb-yc-xd)* co3 - (xa-yb-xc+yd)* (si3)
*
*/

/**
 * @brief  Core function for the Q15 CFFT butterfly process.
 * @param[in, out] *pSrc16          points to the in-place buffer of Q15 data type.
 * @param[in]      fftLen           length of the FFT.
 * @param[in]      *pCoef16         points to twiddle coefficient buffer.
 * @param[in]      twidCoefModifier twiddle coefficient modifier that supports different size FFTs with the same twiddle factor table.
 * @return none.
 */

void plp_radix4_butterfly_q16(
	int16_t * pSrc16,
	uint32_t fftLen,
	int16_t * pCoef16,
	uint32_t twidCoefModifier)
{
	int16_t R0, R1, S0, S1, T0, T1, U0, U1;
	int16_t Co1, Si1, Co2, Si2, Co3, Si3, out1, out2;
	uint32_t n1, n2, ic, i0, i1, i2, i3, j, k;

	/* Total process is divided into three stages */

	/* process first stage, middle stages, & last stage */

	/* Initializations for the first stage */
	n2 = fftLen;
	n1 = n2;

	/* n2 = fftLen/4 */
	n2 >>= 2U;

	/*Index for twiddle coefficient */ 
	ic = 0U;

	/*Index for input read and output write */
	i0 = 0U;
	j = n2;

	/* Input is in 1.15(q15) format */

	/* start of first stage process */
	do
	{
		/* Butterfly implementation */

		/* index calculation for the input as, */
		/* pSrc16[i0 + 0], pSrc16[i0 + fftLen/4], pSrc16[i0 + fftLen/2], pSrc16[i0 + 3fftLen/4] */
		i1 = i0 + n2;
		i2 = i1 + n2;
		i3 = i2 + n2;

		/* Reading i0, i0+fftLen/2 inputs */

		/* input is down scale by 4 to avoid overflow */
		/* Read ya (real), xa (imag) input */
		T0 = pSrc16[i0 * 2U] >> 2U;
		T1 = pSrc16[(i0 * 2U) + 1U] >> 2U;

		/* input is down scale by 4 to avoid overflow */
    	/* Read yc (real), xc(imag) input */
		S0 = pSrc16[i2 * 2U] >> 2U;
		S1 = pSrc16[(i2 * 2U) + 1U] >> 2U;

		/* R0 = (ya + yc) */
		R0 = __CLIP(T0 + S0, 15);
    	/* R1 = (xa + xc) */
		R1 = __CLIP(T1 + S1, 15);

    	/* S0 = (ya - yc) */
		S0 = __CLIP(T0 - S0, 15);
    	/* S1 = (xa - xc) */
		S1 = __CLIP(T1 - S1, 15);

    	/*  Reading i0+fftLen/4 , i0+3fftLen/4 inputs */
    	/* input is down scale by 4 to avoid overflow */
    	/* Read yb (real), xb(imag) input */
		T0 = pSrc16[i1 * 2U] >> 2U;
		T1 = pSrc16[(i1 * 2U) + 1U] >> 2U;

    	/* input is down scale by 4 to avoid overflow */
    	/* Read yd (real), xd(imag) input */
		U0 = pSrc16[i3 * 2U] >> 2U;
		U1 = pSrc16[(i3 * 2U) + 1] >> 2U;

		/* T0 = (yb + yd) */
		T0 = __CLIP(T0 + U0, 15);
    	/* T1 = (xb + xd) */
		T1 = __CLIP(T1 + U1, 15);

    	/*  writing the butterfly processed i0 sample */
    	/* ya' = ya + yb + yc + yd */
    	/* xa' = xa + xb + xc + xd */
		pSrc16[i0 * 2U] = (R0 >> 1U) + (T0 >> 1U);
		pSrc16[(i0 * 2U) + 1U] = (R1 >> 1U) + (T1 >> 1U);

    	/* R0 = (ya + yc) - (yb + yd) */
    	/* R1 = (xa + xc) - (xb + xd) */
		R0 = __CLIP(R0 - T0, 15);
		R1 = __CLIP(R1 - T1, 15);

    	/* co2 & si2 are read from Coefficient pointer */
		Co2 = pCoef16[2U * ic * 2U];
		Si2 = pCoef16[(2U * ic * 2U) + 1];

    	/* xc' = (xa-xb+xc-xd)* co2 + (ya-yb+yc-yd)* (si2) */
		out1 = (int16_t) ((Co2 * R0 + Si2 * R1) >> 16U);
    	/* yc' = (ya-yb+yc-yd)* co2 - (xa-xb+xc-xd)* (si2) */
		out2 = (int16_t) ((-Si2 * R0 + Co2 * R1) >> 16U);

    	/*  Reading i0+fftLen/4 */
    	/* input is down scale by 4 to avoid overflow */
    	/* T0 = yb, T1 =  xb */
		T0 = pSrc16[i1 * 2U] >> 2;
		T1 = pSrc16[(i1 * 2U) + 1] >> 2;

    	/* writing the butterfly processed i0 + fftLen/4 sample */
    	/* writing output(xc', yc') in little endian format */
		pSrc16[i1 * 2U] = out1;
		pSrc16[(i1 * 2U) + 1] = out2;

    	/*  Butterfly calculations */
    	/* input is down scale by 4 to avoid overflow */
    	/* U0 = yd, U1 = xd */
		U0 = pSrc16[i3 * 2U] >> 2;
		U1 = pSrc16[(i3 * 2U) + 1] >> 2;
    	/* T0 = yb-yd */
		T0 = __CLIP(T0 - U0, 15);
    	/* T1 = xb-xd */
		T1 = __CLIP(T1 - U1, 15);

    	/* R1 = (ya-yc) + (xb- xd),  R0 = (xa-xc) - (yb-yd)) */
		R0 = (int16_t) __CLIP((int32_t) (S0 - T1), 15);
		R1 = (int16_t) __CLIP((int32_t) (S1 + T0), 15);

    	/* S1 = (ya-yc) - (xb- xd), S0 = (xa-xc) + (yb-yd)) */
		S0 = (int16_t) __CLIP(((int32_t) S0 + T1), 15);
		S1 = (int16_t) __CLIP(((int32_t) S1 - T0), 15);

    	/* co1 & si1 are read from Coefficient pointer */
		Co1 = pCoef16[ic * 2U];
		Si1 = pCoef16[(ic * 2U) + 1];
    	/*  Butterfly process for the i0+fftLen/2 sample */
    	/* xb' = (xa+yb-xc-yd)* co1 + (ya-xb-yc+xd)* (si1) */
		out1 = (int16_t) ((Si1 * S1 + Co1 * S0) >> 16);
    	/* yb' = (ya-xb-yc+xd)* co1 - (xa+yb-xc-yd)* (si1) */
		out2 = (int16_t) ((-Si1 * S0 + Co1 * S1) >> 16);

    	/* writing output(xb', yb') in little endian format */
		pSrc16[i2 * 2U] = out1;
		pSrc16[(i2 * 2U) + 1] = out2;

    	/* Co3 & si3 are read from Coefficient pointer */
		Co3 = pCoef16[3U * (ic * 2U)];
		Si3 = pCoef16[(3U * (ic * 2U)) + 1];
    	/*  Butterfly process for the i0+3fftLen/4 sample */
    	/* xd' = (xa-yb-xc+yd)* Co3 + (ya+xb-yc-xd)* (si3) */
		out1 = (int16_t) ((Si3 * R1 + Co3 * R0) >> 16U);
    	/* yd' = (ya+xb-yc-xd)* Co3 - (xa-yb-xc+yd)* (si3) */
		out2 = (int16_t) ((-Si3 * R0 + Co3 * R1) >> 16U);
    	/* writing output(xd', yd') in little endian format */
		pSrc16[i3 * 2U] = out1;
		pSrc16[(i3 * 2U) + 1] = out2;

    	/*  Twiddle coefficients index modifier */
		ic = ic + twidCoefModifier;

    	/*  Updating input index */
		i0 = i0 + 1U;

	} while (--j);
  	/* data is in 4.11(q11) format */

  	/* end of first stage process */


  	/* start of middle stage process */

  	/*  Twiddle coefficients index modifier */
	twidCoefModifier <<= 2U;

  	/*  Calculation of Middle stage */
	for (k = fftLen / 4U; k > 4U; k >>= 2U)
	{
    	/*  Initializations for the middle stage */
		n1 = n2;
		n2 >>= 2U;
		ic = 0U;

		for (j = 0U; j <= (n2 - 1U); j++)
		{
      		/*  index calculation for the coefficients */
			Co1 = pCoef16[ic * 2U];
			Si1 = pCoef16[(ic * 2U) + 1U];
			Co2 = pCoef16[2U * (ic * 2U)];
			Si2 = pCoef16[(2U * (ic * 2U)) + 1U];
			Co3 = pCoef16[3U * (ic * 2U)];
			Si3 = pCoef16[(3U * (ic * 2U)) + 1U];

      		/*  Twiddle coefficients index modifier */
			ic = ic + twidCoefModifier;

      		/*  Butterfly implementation */
			for (i0 = j; i0 < fftLen; i0 += n1)
			{
        		/*  index calculation for the input as, */
        		/*  pSrc16[i0 + 0], pSrc16[i0 + fftLen/4], pSrc16[i0 + fftLen/2], pSrc16[i0 + 3fftLen/4] */
				i1 = i0 + n2;
				i2 = i1 + n2;
				i3 = i2 + n2;

        		/*  Reading i0, i0+fftLen/2 inputs */
        		/* Read ya (real), xa(imag) input */
				T0 = pSrc16[i0 * 2U];
				T1 = pSrc16[(i0 * 2U) + 1U];

        		/* Read yc (real), xc(imag) input */
				S0 = pSrc16[i2 * 2U];
				S1 = pSrc16[(i2 * 2U) + 1U];

        		/* R0 = (ya + yc), R1 = (xa + xc) */
				R0 = __CLIP(T0 + S0, 15);
				R1 = __CLIP(T1 + S1, 15);

        		/* S0 = (ya - yc), S1 =(xa - xc) */
				S0 = __CLIP(T0 - S0, 15);
				S1 = __CLIP(T1 - S1, 15);

        		/*  Reading i0+fftLen/4 , i0+3fftLen/4 inputs */
        		/* Read yb (real), xb(imag) input */
				T0 = pSrc16[i1 * 2U];
				T1 = pSrc16[(i1 * 2U) + 1U];

        		/* Read yd (real), xd(imag) input */
				U0 = pSrc16[i3 * 2U];
				U1 = pSrc16[(i3 * 2U) + 1U];


        		/* T0 = (yb + yd), T1 = (xb + xd) */
				T0 = __CLIP(T0 + U0, 15);
				T1 = __CLIP(T1 + U1, 15);

        		/*  writing the butterfly processed i0 sample */

        		/* xa' = xa + xb + xc + xd */
        		/* ya' = ya + yb + yc + yd */
				out1 = ((R0 >> 1U) + (T0 >> 1U)) >> 1U;
				out2 = ((R1 >> 1U) + (T1 >> 1U)) >> 1U;

				pSrc16[i0 * 2U] = out1;
				pSrc16[(2U * i0) + 1U] = out2;

        		/* R0 = (ya + yc) - (yb + yd), R1 = (xa + xc) - (xb + xd) */
				R0 = (R0 >> 1U) - (T0 >> 1U);
				R1 = (R1 >> 1U) - (T1 >> 1U);

        		/* (ya-yb+yc-yd)* (si2) + (xa-xb+xc-xd)* co2 */
				out1 = (int16_t) ((Co2 * R0 + Si2 * R1) >> 16U);

        		/* (ya-yb+yc-yd)* co2 - (xa-xb+xc-xd)* (si2) */
				out2 = (int16_t) ((-Si2 * R0 + Co2 * R1) >> 16U);

        		/*  Reading i0+3fftLen/4 */
        		/* Read yb (real), xb(imag) input */
				T0 = pSrc16[i1 * 2U];
				T1 = pSrc16[(i1 * 2U) + 1U];

        		/*  writing the butterfly processed i0 + fftLen/4 sample */
        		/* xc' = (xa-xb+xc-xd)* co2 + (ya-yb+yc-yd)* (si2) */
        		/* yc' = (ya-yb+yc-yd)* co2 - (xa-xb+xc-xd)* (si2) */
				pSrc16[i1 * 2U] = out1;
				pSrc16[(i1 * 2U) + 1U] = out2;

        		/*  Butterfly calculations */

       	 		/* Read yd (real), xd(imag) input */
				U0 = pSrc16[i3 * 2U];
				U1 = pSrc16[(i3 * 2U) + 1U];

        		/* T0 = yb-yd, T1 = xb-xd */
				T0 = __CLIP(T0 - U0, 15);
				T1 = __CLIP(T1 - U1, 15);

        		/* R0 = (ya-yc) + (xb- xd), R1 = (xa-xc) - (yb-yd)) */
				R0 = (S0 >> 1U) - (T1 >> 1U);
				R1 = (S1 >> 1U) + (T0 >> 1U);

        		/* S0 = (ya-yc) - (xb- xd), S1 = (xa-xc) + (yb-yd)) */
				S0 = (S0 >> 1U) + (T1 >> 1U);
				S1 = (S1 >> 1U) - (T0 >> 1U);

        		/*  Butterfly process for the i0+fftLen/2 sample */
				out1 = (int16_t) ((Co1 * S0 + Si1 * S1) >> 16U);

				out2 = (int16_t) ((-Si1 * S0 + Co1 * S1) >> 16U);

        		/* xb' = (xa+yb-xc-yd)* co1 + (ya-xb-yc+xd)* (si1) */
        		/* yb' = (ya-xb-yc+xd)* co1 - (xa+yb-xc-yd)* (si1) */
				pSrc16[i2 * 2U] = out1;
				pSrc16[(i2 * 2U) + 1U] = out2;

        		/*  Butterfly process for the i0+3fftLen/4 sample */
				out1 = (int16_t) ((Si3 * R1 + Co3 * R0) >> 16U);

				out2 = (int16_t) ((-Si3 * R0 + Co3 * R1) >> 16U);
        		/* xd' = (xa-yb-xc+yd)* Co3 + (ya+xb-yc-xd)* (si3) */
        		/* yd' = (ya+xb-yc-xd)* Co3 - (xa-yb-xc+yd)* (si3) */
				pSrc16[i3 * 2U] = out1;
				pSrc16[(i3 * 2U) + 1U] = out2;
			}
		}
    	/*  Twiddle coefficients index modifier */
		twidCoefModifier <<= 2U;
	}
  	/* end of middle stage process */


  	/* data is in 10.6(q6) format for the 1024 point */
  	/* data is in 8.8(q8) format for the 256 point */
  	/* data is in 6.10(q10) format for the 64 point */
  	/* data is in 4.12(q12) format for the 16 point */

  	/*  Initializations for the last stage */
	n1 = n2;
	n2 >>= 2U;

  	/* start of last stage process */

  	/*  Butterfly implementation */
	for (i0 = 0U; i0 <= (fftLen - n1); i0 += n1)
	{
    	/*  index calculation for the input as, */
    	/*  pSrc16[i0 + 0], pSrc16[i0 + fftLen/4], pSrc16[i0 + fftLen/2], pSrc16[i0 + 3fftLen/4] */
		i1 = i0 + n2;
		i2 = i1 + n2;
		i3 = i2 + n2;

    	/*  Reading i0, i0+fftLen/2 inputs */
    	/* Read ya (real), xa(imag) input */
		T0 = pSrc16[i0 * 2U];
		T1 = pSrc16[(i0 * 2U) + 1U];

    	/* Read yc (real), xc(imag) input */
		S0 = pSrc16[i2 * 2U];
		S1 = pSrc16[(i2 * 2U) + 1U];

    	/* R0 = (ya + yc), R1 = (xa + xc) */
		R0 = __CLIP(T0 + S0, 15);
		R1 = __CLIP(T1 + S1, 15);

    	/* S0 = (ya - yc), S1 = (xa - xc) */
		S0 = __CLIP(T0 - S0, 15);
		S1 = __CLIP(T1 - S1, 15);

    	/*  Reading i0+fftLen/4 , i0+3fftLen/4 inputs */
    	/* Read yb (real), xb(imag) input */
		T0 = pSrc16[i1 * 2U];
		T1 = pSrc16[(i1 * 2U) + 1U];
    	/* Read yd (real), xd(imag) input */
		U0 = pSrc16[i3 * 2U];
		U1 = pSrc16[(i3 * 2U) + 1U];

    	/* T0 = (yb + yd), T1 = (xb + xd)) */
		T0 = __CLIP(T0 + U0, 15);
		T1 = __CLIP(T1 + U1, 15);

    	/*  writing the butterfly processed i0 sample */
    	/* xa' = xa + xb + xc + xd */
    	/* ya' = ya + yb + yc + yd */
		pSrc16[i0 * 2U] = (R0 >> 1U) + (T0 >> 1U);
		pSrc16[(i0 * 2U) + 1U] = (R1 >> 1U) + (T1 >> 1U);

    	/* R0 = (ya + yc) - (yb + yd), R1 = (xa + xc) - (xb + xd) */
		R0 = (R0 >> 1U) - (T0 >> 1U);
		R1 = (R1 >> 1U) - (T1 >> 1U);
    	/* Read yb (real), xb(imag) input */
		T0 = pSrc16[i1 * 2U];
		T1 = pSrc16[(i1 * 2U) + 1U];

    	/*  writing the butterfly processed i0 + fftLen/4 sample */
    	/* xc' = (xa-xb+xc-xd) */
    	/* yc' = (ya-yb+yc-yd) */
		pSrc16[i1 * 2U] = R0;
		pSrc16[(i1 * 2U) + 1U] = R1;

    	/* Read yd (real), xd(imag) input */
		U0 = pSrc16[i3 * 2U];
		U1 = pSrc16[(i3 * 2U) + 1U];
    	/* T0 = (yb - yd), T1 = (xb - xd)  */
		T0 = __CLIP(T0 - U0, 15);
		T1 = __CLIP(T1 - U1, 15);

    	/*  writing the butterfly processed i0 + fftLen/2 sample */
    	/* xb' = (xa+yb-xc-yd) */
    	/* yb' = (ya-xb-yc+xd) */
		pSrc16[i2 * 2U] = (S0 >> 1U) + (T1 >> 1U);
		pSrc16[(i2 * 2U) + 1U] = (S1 >> 1U) - (T0 >> 1U);

    	/*  writing the butterfly processed i0 + 3fftLen/4 sample */
    	/* xd' = (xa-yb-xc+yd) */
    	/* yd' = (ya+xb-yc-xd) */
		pSrc16[i3 * 2U] = (S0 >> 1U) - (T1 >> 1U);
		pSrc16[(i3 * 2U) + 1U] = (S1 >> 1U) + (T0 >> 1U);

	}

  	/* end of last stage process */

  	/* output is in 11.5(q5) format for the 1024 point */
  	/* output is in 9.7(q7) format for the 256 point   */
  	/* output is in 7.9(q9) format for the 64 point  */
  	/* output is in 5.11(q11) format for the 16 point  */
}







/**
 * @} end of FFT group
 */
