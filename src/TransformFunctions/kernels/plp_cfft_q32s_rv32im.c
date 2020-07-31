/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_q32s_rv32im.c
 * Description:  32-bit fixed point Fast Fourier Transform on Compled Input Data
 *
 * $Date:        30. July 2020
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

#define multAcc_32x32_keep32_R(a, x, y) \
	a = (int32_t) (((((int64_t) a) << 32) + ((int64_t) x * y) + 0x80000000LL ) >> 32)

#define multSub_32x32_keep32_R(a, x, y) \
	a = (int32_t) (((((int64_t) a) << 32) - ((int64_t) x * y) + 0x80000000LL ) >> 32)

#define mult_32x32_keep32_R(a, x, y) \
	a = (int32_t) (((int64_t) x * y + 0x80000000LL ) >> 32)


static void plp_cfft_radix4by2_q32(int32_t *pSrc, uint32_t fftLen, const int32_t *pCoef);

static void plp_radix4_butterfly_q32(int32_t *pSrc,
	uint32_t fftLen,
	int32_t *pCoef,
	uint32_t twidCoefModifier);

/**
 * @brief      Quantized 32-bit complex fast fourier transform for RV32IM
 *
 * @param[in]  S               points to an instance of the 32bit quantized CFFT structure
 * @param      p1              points to the complex data buffer of size <code>2*fftLen</code>. Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forwart (ifftFlag=0) or inverse (ifftFlag=1)
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  fracBits        decimal point for right shift (input format Q(32-fracBits).fracBits)
 */

void plp_cfft_q32s_rv32im(const plp_cfft_instance_q32 *S,
	int32_t *p1,
	uint8_t ifftFlag,
	uint8_t bitReverseFlag,
	uint32_t fracBits){
	uint32_t L = S->fftLen;

	if (ifftFlag == 0) {
		switch (L) {
			case 16:
			case 64:
			case 256:
			case 1024:
			case 4096:
			plp_radix4_butterfly_q32(p1, L, (int32_t *)S->pTwiddle, 1);
			break;
			case 32:
			case 128:
			case 512:
			case 2048:
			plp_cfft_radix4by2_q32(p1, L, (int32_t *)S->pTwiddle);
			break;
		}
	}

	if (bitReverseFlag)
		plp_bitreversal_32s_rv32im((uint32_t *)p1, S->bitRevLength, S->pBitRevTable);
}

void plp_cfft_radix4by2_q32(int32_t *pSrc, uint32_t fftLen, const int32_t *pCoef){
	uint32_t i, l;
	uint32_t n2;
	int32_t xt, yt, cosVal, sinVal;
	int32_t p0, p1;

	n2 = fftLen >> 1U;
	for (i = 0; i < n2; i++)
	{
		cosVal = pCoef[2 * i];
		sinVal = pCoef[2 * i + 1];

		l = i + n2;

		xt =          (pSrc[2 * i] >> 2U) - (pSrc[2 * l] >> 2U);
		pSrc[2 * i] = (pSrc[2 * i] >> 2U) + (pSrc[2 * l] >> 2U);

		yt =              (pSrc[2 * i + 1] >> 2U) - (pSrc[2 * l + 1] >> 2U);
		pSrc[2 * i + 1] = (pSrc[2 * l + 1] >> 2U) + (pSrc[2 * i + 1] >> 2U);

		mult_32x32_keep32_R(p0, xt, cosVal);
		mult_32x32_keep32_R(p1, yt, cosVal);
		multAcc_32x32_keep32_R(p0, yt, sinVal);
		multSub_32x32_keep32_R(p1, xt, sinVal);

		pSrc[2 * l]     = p0 << 1;
		pSrc[2 * l + 1] = p1 << 1;
	}


    /* first col */
	plp_radix4_butterfly_q32 (pSrc,          n2, (int32_t*)pCoef, 2U);

    /* second col */
	plp_radix4_butterfly_q32 (pSrc + fftLen, n2, (int32_t*)pCoef, 2U);

	n2 = fftLen >> 1U;
	for (i = 0; i < n2; i++)
	{
		p0 = pSrc[4 * i + 0];
		p1 = pSrc[4 * i + 1];
		xt = pSrc[4 * i + 2];
		yt = pSrc[4 * i + 3];

		p0 <<= 1U;
		p1 <<= 1U;
		xt <<= 1U;
		yt <<= 1U;

		pSrc[4 * i + 0] = p0;
		pSrc[4 * i + 1] = p1;
		pSrc[4 * i + 2] = xt;
		pSrc[4 * i + 3] = yt;
	}
}

void plp_radix4_butterfly_q32(int32_t *pSrc,
	uint32_t fftLen,
	int32_t *pCoef,
	uint32_t twidCoefModifier){
	uint32_t n1, n2, ia1, ia2, ia3, i0, i1, i2, i3, j, k;
	int32_t t1, t2, r1, r2, s1, s2, co1, co2, co3, si1, si2, si3;

	int32_t xa, xb, xc, xd;
	int32_t ya, yb, yc, yd;
	int32_t xa_out, xb_out, xc_out, xd_out;
	int32_t ya_out, yb_out, yc_out, yd_out;

	int32_t *ptr1;

  /* Total process is divided into three stages */

  /* process first stage, middle stages, & last stage */


  /* start of first stage process */

  /*  Initializations for the first stage */
	n2 = fftLen;
	n1 = n2;
  /* n2 = fftLen/4 */
	n2 >>= 2U;
	i0 = 0U;
	ia1 = 0U;

	j = n2;

  /*  Calculation of first stage */
	do
	{
    /*  index calculation for the input as, */
    /*  pSrc[i0 + 0], pSrc[i0 + fftLen/4], pSrc[i0 + fftLen/2U], pSrc[i0 + 3fftLen/4] */
		i1 = i0 + n2;
		i2 = i1 + n2;
		i3 = i2 + n2;

    /* input is in 1.31(q31) format and provide 4 guard bits for the input */

    /*  Butterfly implementation */
    /* xa + xc */
		r1 = (pSrc[(2U * i0)] >> 4U) + (pSrc[(2U * i2)] >> 4U);
    /* xa - xc */
		r2 = (pSrc[(2U * i0)] >> 4U) - (pSrc[(2U * i2)] >> 4U);

    /* xb + xd */
		t1 = (pSrc[(2U * i1)] >> 4U) + (pSrc[(2U * i3)] >> 4U);

    /* ya + yc */
		s1 = (pSrc[(2U * i0) + 1U] >> 4U) + (pSrc[(2U * i2) + 1U] >> 4U);
    /* ya - yc */
		s2 = (pSrc[(2U * i0) + 1U] >> 4U) - (pSrc[(2U * i2) + 1U] >> 4U);

    /* xa' = xa + xb + xc + xd */
		pSrc[2U * i0] = (r1 + t1);
    /* (xa + xc) - (xb + xd) */
		r1 = r1 - t1;
    /* yb + yd */
		t2 = (pSrc[(2U * i1) + 1U] >> 4U) + (pSrc[(2U * i3) + 1U] >> 4U);

    /* ya' = ya + yb + yc + yd */
		pSrc[(2U * i0) + 1U] = (s1 + t2);

    /* (ya + yc) - (yb + yd) */
		s1 = s1 - t2;

    /* yb - yd */
		t1 = (pSrc[(2U * i1) + 1U] >> 4U) - (pSrc[(2U * i3) + 1U] >> 4U);
    /* xb - xd */
		t2 = (pSrc[(2U * i1)] >> 4U) - (pSrc[(2U * i3)] >> 4U);

    /*  index calculation for the coefficients */
		ia2 = 2U * ia1;
		co2 = pCoef[(ia2 * 2U)];
		si2 = pCoef[(ia2 * 2U) + 1U];

    /* xc' = (xa-xb+xc-xd)co2 + (ya-yb+yc-yd)(si2) */
		pSrc[2U * i1] = (((int32_t) (((int64_t) r1 * co2) >> 32)) +
			((int32_t) (((int64_t) s1 * si2) >> 32))) << 1U;

    /* yc' = (ya-yb+yc-yd)co2 - (xa-xb+xc-xd)(si2) */
		pSrc[(2U * i1) + 1U] = (((int32_t) (((int64_t) s1 * co2) >> 32)) -
			((int32_t) (((int64_t) r1 * si2) >> 32))) << 1U;

    /* (xa - xc) + (yb - yd) */
		r1 = r2 + t1;
    /* (xa - xc) - (yb - yd) */
		r2 = r2 - t1;

    /* (ya - yc) - (xb - xd) */
		s1 = s2 - t2;
    /* (ya - yc) + (xb - xd) */
		s2 = s2 + t2;

		co1 = pCoef[(ia1 * 2U)];
		si1 = pCoef[(ia1 * 2U) + 1U];

    /* xb' = (xa+yb-xc-yd)co1 + (ya-xb-yc+xd)(si1) */
		pSrc[2U * i2] = (((int32_t) (((int64_t) r1 * co1) >> 32)) +
			((int32_t) (((int64_t) s1 * si1) >> 32))) << 1U;

    /* yb' = (ya-xb-yc+xd)co1 - (xa+yb-xc-yd)(si1) */
		pSrc[(2U * i2) + 1U] = (((int32_t) (((int64_t) s1 * co1) >> 32)) -
			((int32_t) (((int64_t) r1 * si1) >> 32))) << 1U;

    /*  index calculation for the coefficients */
		ia3 = 3U * ia1;
		co3 = pCoef[(ia3 * 2U)];
		si3 = pCoef[(ia3 * 2U) + 1U];

    /* xd' = (xa-yb-xc+yd)co3 + (ya+xb-yc-xd)(si3) */
		pSrc[2U * i3] = (((int32_t) (((int64_t) r2 * co3) >> 32)) +
			((int32_t) (((int64_t) s2 * si3) >> 32))) << 1U;

    /* yd' = (ya+xb-yc-xd)co3 - (xa-yb-xc+yd)(si3) */
		pSrc[(2U * i3) + 1U] = (((int32_t) (((int64_t) s2 * co3) >> 32)) -
			((int32_t) (((int64_t) r2 * si3) >> 32))) << 1U;

    /*  Twiddle coefficients index modifier */
		ia1 = ia1 + twidCoefModifier;

    /*  Updating input index */
		i0 = i0 + 1U;

	} while (--j);

  /* end of first stage process */

  /* data is in 5.27(q27) format */


  /* start of Middle stages process */


  /* each stage in middle stages provides two down scaling of the input */

	twidCoefModifier <<= 2U;


	for (k = fftLen / 4U; k > 4U; k >>= 2U)
	{
    /*  Initializations for the first stage */
		n1 = n2;
		n2 >>= 2U;
		ia1 = 0U;

    /*  Calculation of first stage */
		for (j = 0U; j <= (n2 - 1U); j++)
		{
      /*  index calculation for the coefficients */
			ia2 = ia1 + ia1;
			ia3 = ia2 + ia1;
			co1 = pCoef[(ia1 * 2U)];
			si1 = pCoef[(ia1 * 2U) + 1U];
			co2 = pCoef[(ia2 * 2U)];
			si2 = pCoef[(ia2 * 2U) + 1U];
			co3 = pCoef[(ia3 * 2U)];
			si3 = pCoef[(ia3 * 2U) + 1U];
      /*  Twiddle coefficients index modifier */
			ia1 = ia1 + twidCoefModifier;

			for (i0 = j; i0 < fftLen; i0 += n1)
			{
        /*  index calculation for the input as, */
        /*  pSrc[i0 + 0], pSrc[i0 + fftLen/4], pSrc[i0 + fftLen/2U], pSrc[i0 + 3fftLen/4] */
				i1 = i0 + n2;
				i2 = i1 + n2;
				i3 = i2 + n2;

        /*  Butterfly implementation */
        /* xa + xc */
				r1 = pSrc[2U * i0] + pSrc[2U * i2];
        /* xa - xc */
				r2 = pSrc[2U * i0] - pSrc[2U * i2];

        /* ya + yc */
				s1 = pSrc[(2U * i0) + 1U] + pSrc[(2U * i2) + 1U];
        /* ya - yc */
				s2 = pSrc[(2U * i0) + 1U] - pSrc[(2U * i2) + 1U];

        /* xb + xd */
				t1 = pSrc[2U * i1] + pSrc[2U * i3];

        /* xa' = xa + xb + xc + xd */
				pSrc[2U * i0] = (r1 + t1) >> 2U;
        /* xa + xc -(xb + xd) */
				r1 = r1 - t1;

        /* yb + yd */
				t2 = pSrc[(2U * i1) + 1U] + pSrc[(2U * i3) + 1U];
        /* ya' = ya + yb + yc + yd */
				pSrc[(2U * i0) + 1U] = (s1 + t2) >> 2U;

        /* (ya + yc) - (yb + yd) */
				s1 = s1 - t2;

        /* (yb - yd) */
				t1 = pSrc[(2U * i1) + 1U] - pSrc[(2U * i3) + 1U];
        /* (xb - xd) */
				t2 = pSrc[2U * i1] - pSrc[2U * i3];

        /* xc' = (xa-xb+xc-xd)co2 + (ya-yb+yc-yd)(si2) */
				pSrc[2U * i1] = (((int32_t) (((int64_t) r1 * co2) >> 32)) +
					((int32_t) (((int64_t) s1 * si2) >> 32))) >> 1U;

        /* yc' = (ya-yb+yc-yd)co2 - (xa-xb+xc-xd)(si2) */
				pSrc[(2U * i1) + 1U] = (((int32_t) (((int64_t) s1 * co2) >> 32)) -
					((int32_t) (((int64_t) r1 * si2) >> 32))) >> 1U;

        /* (xa - xc) + (yb - yd) */
				r1 = r2 + t1;
        /* (xa - xc) - (yb - yd) */
				r2 = r2 - t1;

        /* (ya - yc) -  (xb - xd) */
				s1 = s2 - t2;
        /* (ya - yc) +  (xb - xd) */
				s2 = s2 + t2;

        /* xb' = (xa+yb-xc-yd)co1 + (ya-xb-yc+xd)(si1) */
				pSrc[2U * i2] = (((int32_t) (((int64_t) r1 * co1) >> 32)) +
					((int32_t) (((int64_t) s1 * si1) >> 32))) >> 1U;

        /* yb' = (ya-xb-yc+xd)co1 - (xa+yb-xc-yd)(si1) */
				pSrc[(2U * i2) + 1U] = (((int32_t) (((int64_t) s1 * co1) >> 32)) -
					((int32_t) (((int64_t) r1 * si1) >> 32))) >> 1U;

        /* xd' = (xa-yb-xc+yd)co3 + (ya+xb-yc-xd)(si3) */
				pSrc[2U * i3] = (((int32_t) (((int64_t) r2 * co3) >> 32)) +
					((int32_t) (((int64_t) s2 * si3) >> 32))) >> 1U;

        /* yd' = (ya+xb-yc-xd)co3 - (xa-yb-xc+yd)(si3) */
				pSrc[(2U * i3) + 1U] = (((int32_t) (((int64_t) s2 * co3) >> 32)) -
					((int32_t) (((int64_t) r2 * si3) >> 32))) >> 1U;
			}
		}
		twidCoefModifier <<= 2U;
	}

  /* End of Middle stages process */

  /* data is in 11.21(q21) format for the 1024 point as there are 3 middle stages */
  /* data is in 9.23(q23) format for the 256 point as there are 2 middle stages */
  /* data is in 7.25(q25) format for the 64 point as there are 1 middle stage */
  /* data is in 5.27(q27) format for the 16 point as there are no middle stages */


  /* start of Last stage process */
  /*  Initializations for the last stage */
	j = fftLen >> 2;
	ptr1 = &pSrc[0];

  /*  Calculations of last stage */
	do
	{
    /* Read xa (real), ya(imag) input */
		xa = *ptr1++;
		ya = *ptr1++;

    /* Read xb (real), yb(imag) input */
		xb = *ptr1++;
		yb = *ptr1++;

    /* Read xc (real), yc(imag) input */
		xc = *ptr1++;
		yc = *ptr1++;

    /* Read xc (real), yc(imag) input */
		xd = *ptr1++;
		yd = *ptr1++;

    /* xa' = xa + xb + xc + xd */
		xa_out = xa + xb + xc + xd;

    /* ya' = ya + yb + yc + yd */
		ya_out = ya + yb + yc + yd;

    /* pointer updation for writing */
		ptr1 = ptr1 - 8U;

    /* writing xa' and ya' */
		*ptr1++ = xa_out;
		*ptr1++ = ya_out;

		xc_out = (xa - xb + xc - xd);
		yc_out = (ya - yb + yc - yd);

    /* writing xc' and yc' */
		*ptr1++ = xc_out;
		*ptr1++ = yc_out;

		xb_out = (xa + yb - xc - yd);
		yb_out = (ya - xb - yc + xd);

    /* writing xb' and yb' */
		*ptr1++ = xb_out;
		*ptr1++ = yb_out;

		xd_out = (xa - yb - xc + yd);
		yd_out = (ya + xb - yc - xd);

    /* writing xd' and yd' */
		*ptr1++ = xd_out;
		*ptr1++ = yd_out;


	} while (--j);

  /* output is in 11.21(q21) format for the 1024 point */
  /* output is in 9.23(q23) format for the 256 point */
  /* output is in 7.25(q25) format for the 64 point */
  /* output is in 5.27(q27) format for the 16 point */

  /* End of last stage process */

}

/**
 * @} end of FFT group
 */
