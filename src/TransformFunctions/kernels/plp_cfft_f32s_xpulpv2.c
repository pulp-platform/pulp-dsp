/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_f32s_xpulpv2.c
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
 * Author: Giuseppe Tagliavini, University of Bologna
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

static HAL_CL_L1 float32_t ROT_CONST = 0.707106781f;

/* HELPER FUNCTIONS */

int bit_rev_radix2(int index, int log2FFTLen);
int bit_rev_radix4(int index, int log2FFTLen);
int bit_rev_radix8(int index, int log2FFTLen);

static inline Complex_type_f32 complex_mul(Complex_type_f32 A, Complex_type_f32 B);

static inline void process_butterfly_radix2(Complex_type_f32 *input,
                                            Complex_type_f32 *output,
                                            int twiddle_index,
                                            int index,
                                            int distance,
                                            Complex_type_f32 *twiddle_ptr);

static inline void process_butterfly_last_radix2(Complex_type_f32 *input, Complex_type_f32 *output, int outindex);

static inline void process_butterfly_radix4(Complex_type_f32 *input,
                                            Complex_type_f32 *output,
                                            int twiddle_index,
                                            int index,
                                            int distance,
                                            Complex_type_f32 *twiddle_ptr);

static inline void process_butterfly_last_radix4(Complex_type_f32 *input, Complex_type_f32 *output, int outindex);

static inline void process_butterfly_radix8(Complex_type_f32 *input,
                                            Complex_type_f32 *output,
                                            int twiddle_index,
                                            int index,
                                            int distance,
                                            Complex_type_f32 *twiddle_ptr);

static inline void process_butterfly_last_radix8(Complex_type_f32 *input, Complex_type_f32 *output, int outindex);

static void plp_cfft_radix2_f32s_xpulpv2(const plp_cfft_instance_f32 *S,
                                        const float32_t *pSrc,
                                        float32_t *pDst);

static void plp_cfft_radix4_f32s_xpulpv2(const plp_cfft_instance_f32 *S,
                                        const float32_t *pSrc,
                                        float32_t *pDst);

static void plp_cfft_radix8_f32s_xpulpv2(const plp_cfft_instance_f32 *S,
                                        const float32_t *pSrc,
                                        float32_t *pDst);

/**
  @ingroup fft
 */

/**
  @defgroup complexFFTKernels FFT kernels on complex input values
  These kernels calculate the FFT transform on complex input data.
  If the dimension of the transform is FFTLen, both the input and the output
  buffer must contain at least (2*FFTLen) float32 values, corresponding to
  FFTLen complex values in the form (real part, complex part).
  Input and output can refer to the same memory location (in-place computation).
  The best algorithm is executed based on the val FFTLen.
  Supported algorithms: radix-2, radix-4, radix-8
*/

/**
  @addtogroup complexFFTKernels
  @{
 */

/**
   @brief  Floating-point FFT on complex input data for XPULPV2 extension.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (complex data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_cfft_f32s_xpulpv2( const plp_cfft_instance_f32 *S,
                            const float32_t *pSrc,
                            float32_t *pDst) {
    switch(S->FFTLength) {
      case 64:
      case 512:
          plp_cfft_radix8_f32s_xpulpv2(S, pSrc, pDst);
          break;
      case 16:
      case 256:
      case 1024:
          plp_cfft_radix4_f32s_xpulpv2(S, pSrc, pDst);
          break;
      case 32:
      case 128:
      case 2048:
          plp_cfft_radix2_f32s_xpulpv2(S, pSrc, pDst);
          break;
    }
}

static void plp_cfft_radix2_f32s_xpulpv2(const plp_cfft_instance_f32 *S,
                          const float32_t *pSrc,
                          float32_t *pDst) {

    int k, j, stage, step, d, index;

    Complex_type_f32 temp;
    int dist = S->FFTLength >> 1;
    int nbutterfly = S->FFTLength >> 1;
    int butt = 2; // number of butterflies in the same group

    Complex_type_f32 *_in_ptr;
    Complex_type_f32 *_out_ptr;
    Complex_type_f32 *_tw_ptr;

    // FIRST STAGE
    stage = 1;
    _in_ptr = (Complex_type_f32 *)pSrc;
    _out_ptr = (Complex_type_f32 *)pDst;
    _tw_ptr = (Complex_type_f32 *)S->pTwiddleFactors;

    for (j = 0; j < nbutterfly; j++) {
        process_butterfly_radix2(_in_ptr, _out_ptr, j, 0, dist, _tw_ptr);
        _in_ptr++;
        _out_ptr++;
    } // j

    stage = stage + 1;
    dist = dist >> 1;

    // STAGES 2 -> n-1
    while (dist > 1) {
        step = dist << 1;
        for (j = 0; j < butt; j++) {
            _in_ptr = (Complex_type_f32 *)pDst;
            for (d = 0; d < dist; d++) {
                process_butterfly_radix2(_in_ptr, _in_ptr, d * butt, j * step, dist, _tw_ptr);
                _in_ptr++;
            } // d
        }     // j
        stage = stage + 1;
        dist = dist >> 1;
        butt = butt << 1;
    }

    // LAST STAGE
    _in_ptr = (Complex_type_f32 *)pDst;
    index = 0;
    for (j = 0; j < (S->FFTLength >> 1); j++) {
        process_butterfly_last_radix2(_in_ptr, (Complex_type_f32 *)pDst, index);
        _in_ptr += 2;
        index += 2;
    } // j

    // ORDER VALUES
    if (S->bitReverseFlag) {
        int index1, index2, index3, index4;
        _out_ptr = (Complex_type_f32 *)pDst;
        for (j = 0; j < S->FFTLength; j += 4) {
            if (S->pBitReverseLUT) {
                unsigned int index12 = *((unsigned int *)(&S->pBitReverseLUT[j]));
                unsigned int index34 = *((unsigned int *)(&S->pBitReverseLUT[j + 2]));
                index1 = index12 & 0x0000FFFF;
                index2 = index12 >> 16;
                index3 = index34 & 0x0000FFFF;
                index4 = index34 >> 16;
            } else {
                int log2FFTLen = log2(S->FFTLength);
                index1 = bit_rev_radix2(j, log2FFTLen);
                index2 = bit_rev_radix2(j + 1, log2FFTLen);
                index3 = bit_rev_radix2(j + 2, log2FFTLen);
                index4 = bit_rev_radix2(j + 3, log2FFTLen);
            }
            if (index1 > j) {
                temp = _out_ptr[j];
                _out_ptr[j] = _out_ptr[index1];
                _out_ptr[index1] = temp;
            }
            if (index2 > j + 1) {
                temp = _out_ptr[j + 1];
                _out_ptr[j + 1] = _out_ptr[index2];
                _out_ptr[index2] = temp;
            }
            if (index3 > j + 2) {
                temp = _out_ptr[j + 2];
                _out_ptr[j + 2] = _out_ptr[index3];
                _out_ptr[index3] = temp;
            }
            if (index4 > j + 3) {
                temp = _out_ptr[j + 3];
                _out_ptr[j + 3] = _out_ptr[index4];
                _out_ptr[index4] = temp;
            }
        }
    }
}

static void plp_cfft_radix4_f32s_xpulpv2(const plp_cfft_instance_f32 *S,
                                        const float32_t *pSrc,
                                        float32_t *pDst) {

    int k, j, stage, step, d, index;

    Complex_type_f32 temp;
    int dist = S->FFTLength >> 2;
    int nbutterfly = S->FFTLength >> 2;
    int butt = 4; // number of butterflies in the same group

    Complex_type_f32 *_in_ptr;
    Complex_type_f32 *_out_ptr;
    Complex_type_f32 *_tw_ptr;

    // FIRST STAGE
    stage = 1;
    _in_ptr = (Complex_type_f32 *)pSrc;
    _out_ptr = (Complex_type_f32 *)pDst;
    _tw_ptr = (Complex_type_f32 *)S->pTwiddleFactors;

    for (j = 0; j < nbutterfly; j++) {
        process_butterfly_radix4(_in_ptr, _out_ptr, j, 0, dist, _tw_ptr);
        _in_ptr++;
        _out_ptr++;
    } // j

    stage = stage + 1;
    dist = dist >> 2;

    // STAGES 2 -> n-1
    while (dist > 1) {
        step = dist << 2;
        for (j = 0; j < butt; j++) {
            _in_ptr = (Complex_type_f32 *)pDst;
            for (d = 0; d < dist; d++) {
                process_butterfly_radix4(_in_ptr, _in_ptr, d * butt, j * step, dist, _tw_ptr);
                _in_ptr++;
            } // d
        }     // j
        stage = stage + 1;
        dist = dist >> 2;
        butt = butt << 2;
    }

    // LAST STAGE
    _in_ptr = (Complex_type_f32 *)pDst;
    index = 0;
    for (j = 0; j < (S->FFTLength >> 2); j++) {
        process_butterfly_last_radix4(_in_ptr, (Complex_type_f32 *)pDst, index);
        _in_ptr += 4;
        index += 4;
    } // j

    // ORDER VALUES
    if (S->bitReverseFlag) {
          int index1, index2, index3, index4;
        _out_ptr = (Complex_type_f32 *)pDst;
        for (j = 0; j < S->FFTLength; j += 4) {
            if (S->pBitReverseLUT) {
                unsigned int index12 = *((unsigned int *)(&S->pBitReverseLUT[j]));
                unsigned int index34 = *((unsigned int *)(&S->pBitReverseLUT[j + 2]));
                index1 = index12 & 0x0000FFFF;
                index2 = index12 >> 16;
                index3 = index34 & 0x0000FFFF;
                index4 = index34 >> 16;
            } else {
                int log2FFTLen = log2(S->FFTLength);
                index1 = bit_rev_radix4(j, log2FFTLen);
                index2 = bit_rev_radix4(j + 1, log2FFTLen);
                index3 = bit_rev_radix4(j + 2, log2FFTLen);
                index4 = bit_rev_radix4(j + 3, log2FFTLen);
            }
            if (index1 > j) {
                temp = _out_ptr[j];
                _out_ptr[j] = _out_ptr[index1];
                _out_ptr[index1] = temp;
            }
            if (index2 > j + 1) {
                temp = _out_ptr[j + 1];
                _out_ptr[j + 1] = _out_ptr[index2];
                _out_ptr[index2] = temp;
            }
            if (index3 > j + 2) {
                temp = _out_ptr[j + 2];
                _out_ptr[j + 2] = _out_ptr[index3];
                _out_ptr[index3] = temp;
            }
            if (index4 > j + 3) {
                temp = _out_ptr[j + 3];
                _out_ptr[j + 3] = _out_ptr[index4];
                _out_ptr[index4] = temp;
            }
        }
    }
}

static void plp_cfft_radix8_f32s_xpulpv2(const plp_cfft_instance_f32 *S,
                                        const float32_t *pSrc,
                                        float32_t *pDst) {

    int k, j, stage, step, d, index;

    Complex_type_f32 temp;
    int dist = S->FFTLength >> 3;
    int nbutterfly = S->FFTLength >> 3;
    int butt = 8; // number of butterflies in the same group

    Complex_type_f32 *_in_ptr;
    Complex_type_f32 *_out_ptr;
    Complex_type_f32 *_tw_ptr;

    // FIRST STAGE
    stage = 1;
    _in_ptr = (Complex_type_f32 *)pSrc;
    _out_ptr = (Complex_type_f32 *)pDst;
    _tw_ptr = (Complex_type_f32 *)S->pTwiddleFactors;

    for (j = 0; j < nbutterfly; j++) {
        process_butterfly_radix8(_in_ptr, _out_ptr, j, 0, dist, _tw_ptr);
        _in_ptr++;
        _out_ptr++;
    } // j

    stage = stage + 1;
    dist = dist >> 3;

    // STAGES 2 -> n-1
    while (dist > 1) {
        step = dist << 3;
        for (j = 0; j < butt; j++) {
            _in_ptr = (Complex_type_f32 *)pDst;
            for (d = 0; d < dist; d++) {
                process_butterfly_radix8(_in_ptr, _in_ptr, d * butt, j * step, dist, _tw_ptr);
                _in_ptr++;
            } // d
        }     // j
        stage = stage + 1;
        dist = dist >> 3;
        butt = butt << 3;
    }

    // LAST STAGE
    _in_ptr = (Complex_type_f32 *)pDst;
    index = 0;
    for (j = 0; j < (S->FFTLength >> 3); j++) {
        process_butterfly_last_radix8(_in_ptr, (Complex_type_f32 *)pDst, index);
        _in_ptr += 8;
        index += 8;
    } // j

    // ORDER VALUES
    if (S->bitReverseFlag) {
        int index1, index2, index3, index4;
        _out_ptr = (Complex_type_f32 *)pDst;
        for (j = 0; j < S->FFTLength; j += 4) {
            if (S->pBitReverseLUT) {
                unsigned int index12 = *((unsigned int *)(&S->pBitReverseLUT[j]));
                unsigned int index34 = *((unsigned int *)(&S->pBitReverseLUT[j + 2]));
                index1 = index12 & 0x0000FFFF;
                index2 = index12 >> 16;
                index3 = index34 & 0x0000FFFF;
                index4 = index34 >> 16;
            } else {
                int log2FFTLen = log2(S->FFTLength);
                index1 = bit_rev_radix8(j, log2FFTLen);
                index2 = bit_rev_radix8(j + 1, log2FFTLen);
                index3 = bit_rev_radix8(j + 2, log2FFTLen);
                index4 = bit_rev_radix8(j + 3, log2FFTLen);
            }
            if (index1 > j) {
                temp = _out_ptr[j];
                _out_ptr[j] = _out_ptr[index1];
                _out_ptr[index1] = temp;
            }
            if (index2 > j + 1) {
                temp = _out_ptr[j + 1];
                _out_ptr[j + 1] = _out_ptr[index2];
                _out_ptr[index2] = temp;
            }
            if (index3 > j + 2) {
                temp = _out_ptr[j + 2];
                _out_ptr[j + 2] = _out_ptr[index3];
                _out_ptr[index3] = temp;
            }
            if (index4 > j + 3) {
                temp = _out_ptr[j + 3];
                _out_ptr[j + 3] = _out_ptr[index4];
                _out_ptr[index4] = temp;
            }
        }
    }
}

/**
   @} end of complexFFTKernels group
*/

int bit_rev_radix2(int index, int log2FFTLen) {
    int i;
    unsigned int revNum = 0;

    for (i = 0; i < log2FFTLen; i++) {
        unsigned int temp = (index & (1 << i));
        if (temp != 0)
            revNum |= (1 << ((log2FFTLen - 1) - i));
    }

    return revNum;
}

int bit_rev_radix4(int index, int log2FFTLen) //digit reverse 2 bit blocks
{
  int i;
  unsigned int revNum = 0;

  for (i = 0; i < log2FFTLen/2; i++)
  {
      revNum <<= 2;
      revNum |= (index & 0x3);
      index >>= 2;
  }
  return revNum;
}

int bit_rev_radix8(int index, int log2FFTLen) //digit reverse 3 bit blocks
{
  int i;
  unsigned int revNum = 0;

  for (i = 0; i < log2FFTLen/3; i++)
  {
    revNum <<= 3;
    revNum |= (index & 0x7);
    index >>= 3;
  }
  return revNum;
}

static inline Complex_type_f32 complex_mul(Complex_type_f32 A, Complex_type_f32 B) {

    Complex_type_f32 result;
    result.re = A.re * B.re - A.im * B.im;
    result.im = A.re * B.im + A.im * B.re;
    return result;
}

static inline void process_butterfly_radix2(Complex_type_f32 *input,
                                            Complex_type_f32 *output,
                                            int twiddle_index,
                                            int index,
                                            int distance,
                                            Complex_type_f32 *twiddle_ptr) {

    Complex_type_f32 r0, r1;

    float32_t d0 = input[index].re;
    float32_t d1 = input[index + distance].re;
    float32_t e0 = input[index].im;
    float32_t e1 = input[index + distance].im;

    // Re(c1*c2) = c1.re*c2.re - c1.im*c2.im

    r0.re = d0 + d1;
    r1.re = d0 - d1;

    // Im(c1*c2) = c1.re*c2.im + c1.im*c2.re

    r0.im = e0 + e1;
    r1.im = e0 - e1;

    Complex_type_f32 tw0 = twiddle_ptr[twiddle_index];

    output[index] = r0;
    output[index + distance] = complex_mul(tw0, r1);
}

static inline void
process_butterfly_last_radix2(Complex_type_f32 *input, Complex_type_f32 *output, int outindex) {

    int index = 0;
    Complex_type_f32 r0, r1;
    float32_t d0 = input[index].re;
    float32_t d1 = input[index + 1].re;
    float32_t e0 = input[index].im;
    float32_t e1 = input[index + 1].im;
    // Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
    r0.re = d0 + d1;
    r1.re = d0 - d1;

    // Im(c1*c2) = c1.re*c2.im + c1.im*c2.re

    r0.im = e0 + e1;
    r1.im = e0 - e1;

    /* In the Last step, twiddle factors are all 1 */
    output[outindex] = r0;
    output[outindex + 1] = r1;
}

static inline void process_butterfly_radix4 (Complex_type_f32* input, Complex_type_f32* output, int twiddle_index, int index, int distance, Complex_type_f32* twiddle_ptr)
{
     Complex_type_f32 r0, r1, r2, r3;
     float32_t d0, d1, d2, d3;
     float32_t e0, e1, e2, e3;
     Complex_type_f32 tw1, tw2, tw3;

     d0         = input[index].re;
     d1         = input[index+distance].re;
     d2         = input[index+2*distance].re;
     d3         = input[index+3*distance].re;

     e0         = input[index].im;
     e1         = input[index+distance].im;
     e2         = input[index+2*distance].im;
     e3         = input[index+3*distance].im;


     // Basic buttefly rotation
     /*
     r0   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i
     r1   1.0000 + 0.0000i   0.7071 - 0.7071i   0.0000 - 1.0000i  -0.7071 - 0.7071i  -1.0000 - 0.0000i  -0.7071 + 0.7071i   0.0000 + 1.0000i   0.7071 + 0.7071i
     r2   1.0000 + 0.0000i   0.0000 - 1.0000i  -1.0000 - 0.0000i   0.0000 + 1.0000i   1.0000 + 0.0000i   0.0000 - 1.0000i   -1.0000 - 0.0000i  0.0000 + 1.0000i
     r3   1.0000 + 0.0000i  -0.7071 - 0.7071i  -0.0000 + 1.0000i   0.7071 - 0.7071i  -1.0000 - 0.0000i   0.7071 + 0.7071i   0.0000 - 1.0000i  -0.7071 + 0.7071i
     */

     //Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
     r0.re = d0 + d1 + d2 + d3;
     r1.re = d0 - d2 - ( e3 - e1 );
     r2.re = d0 - d1 + d2 - d3;
     r3.re = d0 - d2 - ( e1 - e3 );

     //Im(c1*c2) = c1.re*c2.im + c1.im*c2.re

     r0.im = e0 + e1 + e2 + e3;
     output[index] = r0;

     r1.im = -d1 + d3 + e0 - e2;
     r2.im = e0 - e1 + e2 - e3;
     r3.im = d1 - d3 + e0 - e2;

     tw1 = twiddle_ptr[twiddle_index];
     tw2 = twiddle_ptr[twiddle_index*2];
     tw3 = twiddle_ptr[twiddle_index*3];

     output[index+distance]   = complex_mul(tw1, r1);
     output[index+2*distance] = complex_mul(tw2, r2);
     output[index+3*distance] = complex_mul(tw3, r3);
}

static inline void process_butterfly_radix8 (Complex_type_f32* input, Complex_type_f32* output, int twiddle_index, int index, int distance, Complex_type_f32* twiddle_ptr)
{
  float32_t d0, d1, d2, d3, d4, d5, d6, d7;
  float32_t e0, e1, e2, e3, e4, e5, e6, e7;

  Complex_type_f32 r0, r1, r2, r3, r4, r5, r6, r7;
  Complex_type_f32 tw1, tw2, tw3, tw4, tw5, tw6, tw7;

  d0         = input[index].re;
  d1         = input[index+distance].re;
  d2         = input[index+2*distance].re;
  d3         = input[index+3*distance].re;
  d4         = input[index+4*distance].re;
  d5         = input[index+5*distance].re;
  d6         = input[index+6*distance].re;
  d7         = input[index+7*distance].re;

  e0         = input[index].im;
  e1         = input[index+distance].im;
  e2         = input[index+2*distance].im;
  e3         = input[index+3*distance].im;
  e4         = input[index+4*distance].im;
  e5         = input[index+5*distance].im;
  e6         = input[index+6*distance].im;
  e7         = input[index+7*distance].im;

  // Basic buttefly rotation
  /*
  r0   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i
  r1   1.0000 + 0.0000i   0.7071 - 0.7071i   0.0000 - 1.0000i  -0.7071 - 0.7071i  -1.0000 - 0.0000i  -0.7071 + 0.7071i   0.0000 + 1.0000i   0.7071 + 0.7071i
  r2   1.0000 + 0.0000i   0.0000 - 1.0000i  -1.0000 - 0.0000i   0.0000 + 1.0000i   1.0000 + 0.0000i   0.0000 - 1.0000i   -1.0000 - 0.0000i  0.0000 + 1.0000i
  r3   1.0000 + 0.0000i  -0.7071 - 0.7071i  -0.0000 + 1.0000i   0.7071 - 0.7071i  -1.0000 - 0.0000i   0.7071 + 0.7071i   0.0000 - 1.0000i  -0.7071 + 0.7071i
  r4   1.0000 + 0.0000i  -1.0000 - 0.0000i   1.0000 + 0.0000i  -1.0000 - 0.0000i   1.0000 + 0.0000i  -1.0000 - 0.0000i   1.0000 + 0.0000i  -1.0000 - 0.0000i
  r5   1.0000 + 0.0000i  -0.7071 + 0.7071i   0.0000 - 1.0000i   0.7071 + 0.7071i  -1.0000 - 0.0000i   0.7071 - 0.7071i  -0.0000 + 1.0000i  -0.7071 - 0.7071i
  r6   1.0000 + 0.0000i   0.0000 + 1.0000i  -1.0000 - 0.0000i   0.0000 - 1.0000i   1.0000 + 0.0000i   0.0000 + 1.0000i  -1.0000 - 0.0000i   0.0000 - 1.0000i
  r7   1.0000 + 0.0000i   0.7071 + 0.7071i  -0.0000 + 1.0000i  -0.7071 + 0.7071i  -1.0000 - 0.0000i  -0.7071 - 0.7071i   0.0000 - 1.0000i   0.7071 - 0.7071i
  */

  //Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
  float32_t d13 = d1 + d3;
  float32_t d1_3 = d1 - d3;
  float32_t e13 = e1 + e3;
  float32_t e57 = e5 + e7;
  float32_t e1_3 = e1 - e3;
  float32_t e_57 = e7 - e5;
  float32_t d57 = d5 + d7;
  float32_t d_57 = d7 - d5;
  float32_t temp1 = ROT_CONST*(d1_3+d_57);
  float32_t temp1b = ROT_CONST*(e57 - e13);
  float32_t temp2 = ROT_CONST*(d57-d13);
  float32_t temp2b = ROT_CONST*(e1_3 + e_57);
  float32_t d04   = d0 + d4;
  float32_t d0_4  = d0 - d4;
  float32_t d26  = d2 + d6;
  float32_t d_26  = d6 - d2;
  float32_t d0246 = d04 + d26;
  float32_t d1357 = d13 + d57;
  float32_t e0246 = e0 + e2 + e4 + e6;
  float32_t e0_4  = e0 - e4;
  float32_t e0_24_6 = e0 - e2 + e4 - e6;
  float32_t e1357 = e13 + e57;
  float32_t e_13_57 = e_57 - e1_3;
  float32_t e2_6 = e2 - e6 ;
  float32_t e_26 = e6 - e2 ;

  r0.re = d0246 + d1357;

  //r1.re = d0 + ROT_CONST*d1 - ROT_CONST*d3 - d4 - ROT_CONST*d5 + ROT_CONST*d7;
  r1.re = d0_4 + temp1;
  r7.re = r1.re + (e_26 + temp1b);
  r1.re = r1.re - (e_26 + temp1b);

  r2.re = d04 - d26;
  r6.re = r2.re + e_13_57;
  r2.re = r2.re - e_13_57;

  //r3.re = d0 - ROT_CONST*d1 + ROT_CONST*d3 - d4 + ROT_CONST*d5 - ROT_CONST*d7;
  r3.re = d0_4 - temp1;
  r5.re = r3.re + (e2_6 + temp1b);
  r3.re = r3.re - (e2_6 + temp1b);
  r4.re = d0246 - d1357;


  //Im(c1*c2) = c1.re*c2.im + c1.im*c2.re
  r0.im = e0246 + e1357;
  //r1.im = -ROT_CONST*d1 - d2 - ROT_CONST*d3 + ROT_CONST*d5 + d6 + ROT_CONST*d7;
  r1.im = d_26 + temp2;
  r7.im = -r1.im + ( e0_4 + temp2b);
  r1.im =  r1.im + ( e0_4 + temp2b);

  r2.im = d_57 - d1_3;
  r6.im = -r2.im + e0_24_6;
  r2.im =  r2.im + e0_24_6;

  //r3.im = -ROT_CONST*d1 + d2 - ROT_CONST*d3 + ROT_CONST*d5 - d6 + ROT_CONST*d7;
  r3.im =  temp2 - d_26;
  r5.im = -r3.im + (e0_4 - temp2b);
  r3.im =  r3.im + (e0_4 - temp2b);

  r4.im = e0246 - e1357;

  // TWIDDLES
  tw1 = twiddle_ptr[twiddle_index*1];
  tw2 = twiddle_ptr[twiddle_index*2];
  tw3 = twiddle_ptr[twiddle_index*3];
  tw4 = twiddle_ptr[twiddle_index*4];
  tw5 = twiddle_ptr[twiddle_index*5];
  tw6 = twiddle_ptr[twiddle_index*6];
  tw7 = twiddle_ptr[twiddle_index*7];

  output[index]            = r0;
  output[index+distance]   = complex_mul(tw1, r1);
  output[index+2*distance] = complex_mul(tw2, r2);
  output[index+3*distance] = complex_mul(tw3, r3);
  output[index+4*distance] = complex_mul(tw4, r4);
  output[index+5*distance] = complex_mul(tw5, r5);
  output[index+6*distance] = complex_mul(tw6, r6);
  output[index+7*distance] = complex_mul(tw7, r7);
}

static inline void process_butterfly_last_radix4 (Complex_type_f32* input, Complex_type_f32* output, int outindex )
{
  int index = 0;
  Complex_type_f32 r0, r1, r2, r3;
  float32_t d0         = input[index].re;
  float32_t d1         = input[index+1].re;
  float32_t d2         = input[index+2].re;
  float32_t d3         = input[index+3].re;
  float32_t e0         = input[index].im;
  float32_t e1         = input[index+1].im;
  float32_t e2         = input[index+2].im;
  float32_t e3         = input[index+3].im;

  /* twiddles are all 1s*/

  // Basic buttefly rotation
  /*
r0   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i
r1   1.0000 + 0.0000i   0.7071 - 0.7071i   0.0000 - 1.0000i  -0.7071 - 0.7071i  -1.0000 - 0.0000i  -0.7071 + 0.7071i   0.0000 + 1.0000i   0.7071 + 0.7071i
r2   1.0000 + 0.0000i   0.0000 - 1.0000i  -1.0000 - 0.0000i   0.0000 + 1.0000i   1.0000 + 0.0000i   0.0000 - 1.0000i   -1.0000 - 0.0000i  0.0000 + 1.0000i
r3   1.0000 + 0.0000i  -0.7071 - 0.7071i  -0.0000 + 1.0000i   0.7071 - 0.7071i  -1.0000 - 0.0000i   0.7071 + 0.7071i   0.0000 - 1.0000i  -0.7071 + 0.7071i
  */

  // Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
  r0.re = d0 + d1 + d2 + d3;
  r1.re = d0 - d2 - ( e3 - e1 );
  r2.re = d0 - d1 + d2 - d3;
  r3.re = d0 - d2 - ( e1 - e3 );

  // Im(c1*c2) = c1.re*c2.im + c1.im*c2.re
  r0.im = e0 + e1 + e2 + e3;
  r1.im = -d1 + d3 + e0 - e2;
  r2.im = e0 - e1 + e2 - e3;
  r3.im = d1 - d3 + e0 - e2;

  output[outindex  ] = r0;
  output[outindex+1] = r1;
  output[outindex+2] = r2;
  output[outindex+3] = r3;
}

static inline void process_butterfly_last_radix8 (Complex_type_f32* input, Complex_type_f32* output, int outindex )
{
  int index = 0;

  float32_t d0, d1, d2, d3, d4, d5, d6, d7;
  float32_t e0, e1, e2, e3, e4, e5, e6, e7;

  Complex_type_f32 r0, r1, r2, r3, r4, r7, r6, r5 ;

  d0         = input[index].re;
  d1         = input[index+1].re;
  d2         = input[index+2].re;
  d3         = input[index+3].re;
  d4         = input[index+4].re;
  d5         = input[index+5].re;
  d6         = input[index+6].re;
  d7         = input[index+7].re;

  e0         = input[index].im;
  e1         = input[index+1].im;
  e2         = input[index+2].im;
  e3         = input[index+3].im;
  e4         = input[index+4].im;
  e5         = input[index+5].im;
  e6         = input[index+6].im;
  e7         = input[index+7].im;

  /* twiddles are all 1s */
  // Basic buttefly rotation
  /*
r0   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i
r1   1.0000 + 0.0000i   0.7071 - 0.7071i   0.0000 - 1.0000i  -0.7071 - 0.7071i  -1.0000 - 0.0000i  -0.7071 + 0.7071i   0.0000 + 1.0000i   0.7071 + 0.7071i
r2   1.0000 + 0.0000i   0.0000 - 1.0000i  -1.0000 - 0.0000i   0.0000 + 1.0000i   1.0000 + 0.0000i   0.0000 - 1.0000i   -1.0000 - 0.0000i  0.0000 + 1.0000i
r3   1.0000 + 0.0000i  -0.7071 - 0.7071i  -0.0000 + 1.0000i   0.7071 - 0.7071i  -1.0000 - 0.0000i   0.7071 + 0.7071i   0.0000 - 1.0000i  -0.7071 + 0.7071i
r4   1.0000 + 0.0000i  -1.0000 - 0.0000i   1.0000 + 0.0000i  -1.0000 - 0.0000i   1.0000 + 0.0000i  -1.0000 - 0.0000i   1.0000 + 0.0000i  -1.0000 - 0.0000i
r5   1.0000 + 0.0000i  -0.7071 + 0.7071i   0.0000 - 1.0000i   0.7071 + 0.7071i  -1.0000 - 0.0000i   0.7071 - 0.7071i  -0.0000 + 1.0000i  -0.7071 - 0.7071i
r6   1.0000 + 0.0000i   0.0000 + 1.0000i  -1.0000 - 0.0000i   0.0000 - 1.0000i   1.0000 + 0.0000i   0.0000 + 1.0000i  -1.0000 - 0.0000i   0.0000 - 1.0000i
r7   1.0000 + 0.0000i   0.7071 + 0.7071i  -0.0000 + 1.0000i  -0.7071 + 0.7071i  -1.0000 - 0.0000i  -0.7071 - 0.7071i   0.0000 - 1.0000i   0.7071 - 0.7071i
  */

  // Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
  float32_t d13 = d1 + d3;
  float32_t d1_3 = d1 - d3;
  float32_t e13 = e1 + e3;
  float32_t e57 = e5 + e7;
  float32_t e1_3 = e1 - e3;
  float32_t e_57 = e7 - e5;
  float32_t d57 = d5 + d7;
  float32_t d_57 = d7 - d5;
  float32_t temp1 = ROT_CONST*(d1_3+d_57);
  float32_t temp1b = ROT_CONST*(e57 - e13);
  float32_t temp2 = ROT_CONST*(d57-d13);
  float32_t temp2b = ROT_CONST*(e1_3 + e_57);
  float32_t d04   = d0 + d4;
  float32_t d0_4  = d0 - d4;
  float32_t d26  = d2 + d6;
  float32_t d_26  = d6 - d2;
  float32_t d0246 = d04 + d26;
  float32_t d1357 = d13 + d57;
  float32_t e0246 = e0 + e2 + e4 + e6;
  float32_t e0_4  = e0 - e4;
  float32_t e0_24_6 = e0 - e2 + e4 - e6;
  float32_t e1357 = e13 + e57;
  float32_t e_13_57 = e_57 - e1_3;
  float32_t e2_6 = e2 - e6 ;
  float32_t e_26 = e6 - e2 ;

  r0.re = d0246 + d1357;

  // r1.re = d0 + ROT_CONST*d1 - ROT_CONST*d3 - d4 - ROT_CONST*d5 + ROT_CONST*d7;
  r1.re = d0_4 + temp1;
  r7.re = r1.re + (e_26 + temp1b);
  r1.re = r1.re - (e_26 + temp1b);

  r2.re = d04 - d26;
  r6.re = r2.re + e_13_57;
  r2.re = r2.re - e_13_57;

  // r3.re = d0 - ROT_CONST*d1 + ROT_CONST*d3 - d4 + ROT_CONST*d5 - ROT_CONST*d7;
  r3.re = d0_4 - temp1;
  r5.re = r3.re + (e2_6 + temp1b);
  r3.re = r3.re - (e2_6 + temp1b);

  r4.re = d0246 - d1357;


  // Im(c1*c2) = c1.re*c2.im + c1.im*c2.re
  r0.im = e0246 + e1357;

  // r1.im = -ROT_CONST*d1 - d2 - ROT_CONST*d3 + ROT_CONST*d5 + d6 + ROT_CONST*d7;
  r1.im = d_26 + temp2;
  r7.im = -r1.im + ( e0_4 + temp2b);
  r1.im =  r1.im + ( e0_4 + temp2b);

  r2.im = d_57 - d1_3;
  r6.im = -r2.im + e0_24_6;
  r2.im =  r2.im + e0_24_6;

  // r3.im = -ROT_CONST*d1 + d2 - ROT_CONST*d3 + ROT_CONST*d5 - d6 + ROT_CONST*d7;
  r3.im =  temp2 - d_26;
  r5.im = -r3.im + (e0_4 - temp2b);
  r3.im =  r3.im + (e0_4 - temp2b);

  r4.im = e0246 - e1357;

  /* In the Last step, twiddle factors are all 1 */
   output[outindex    ] = r0;
   output[outindex+1  ] = r1;
   output[outindex+2*1] = r2;
   output[outindex+3*1] = r3;
   output[outindex+4*1] = r4;
   output[outindex+5*1] = r5;
   output[outindex+6*1] = r6;
   output[outindex+7*1] = r7;
}
