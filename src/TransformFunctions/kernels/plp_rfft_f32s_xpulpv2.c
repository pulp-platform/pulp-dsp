/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_rfft_f32s_xpulpv2.c
 * Description:  Floating-point FFT on real input data for XPULPV2
 *
 * $Date:        10. Aug 2020
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

/* HELPER FUNCTIONS */
int bit_rev_radix2(int index, int log2FFTLen);
int bit_rev_radix4(int index, int log2FFTLen);

static inline Complex_type_f32 complex_mul(Complex_type_f32 A, Complex_type_f32 B) {
    Complex_type_f32 result;
    result.re = A.re * B.re - A.im * B.im;
    result.im = A.re * B.im + A.im * B.re;
    return result;
}
static inline Complex_type_f32 complex_mul_real(float32_t A, Complex_type_f32 B) {
    Complex_type_f32 result;
    result.re = A * B.re;
    result.im = A * B.im;
    return result;
}

void plp_rfft_f32s_xpulpv2(const plp_fft_instance_f32 *S, const float32_t *__restrict__ pSrc, float32_t *__restrict__ pDst);

/* RADIX2 */
void plp_radix2_rfft_f32s_xpulpv2(const plp_fft_instance_f32 *S, const float32_t *__restrict__ pSrc, float32_t *__restrict__ pDst);
void process_butterfly_real_radix2(Complex_type_f32 *input, int twiddle_index, int distance, Complex_type_f32 *twiddle_ptr);
void process_butterfly_radix2(Complex_type_f32 *input, int twiddle_index, int index, int distance, Complex_type_f32 *twiddle_ptr);
void process_butterfly_last_radix2(const plp_fft_instance_f32 *S, Complex_type_f32 *input, Complex_type_f32 *output, int outindex);


/* RADIX4 */
static void plp_radix4_rfft_f32s_xpulpv2(const plp_fft_instance_f32 *S, const float32_t *__restrict__ pSrc, float32_t *__restrict__ pDst);
static inline void process_butterfly_real_radix4 (Complex_type_f32* input, Complex_type_f32* output, int twiddle_index, int index, int distance, Complex_type_f32* twiddle_ptr);
static inline void process_butterfly_radix4 (Complex_type_f32* input, Complex_type_f32* output, int twiddle_index, int index, int distance, Complex_type_f32* twiddle_ptr);
static inline void process_butterfly_last_radix4 (Complex_type_f32* input, Complex_type_f32* output, int outindex );

/**
  @ingroup fft
 */

/**
  @defgroup realFFTKernels FFT kernels on real input values
  These kernels calculate the FFT transform on real input data.
  If the dimension of input is FFTLen float32 numbers, the output buffer must contain
  at least (2*FFTLen) float32 values (used for intermediate computations).
  Due to the symmetry of real FFT only the first (FFTLen + 2) values of the result
  are computed in the last stage, corresponding to (FFTLen / 2 + 1) complex values.
  Supported algorithms: radix-2 radix-4 radix-8
*/

/**
  @addtogroup realFFTKernels
  @{
 */

/**
   @brief  Floating-point FFT on real input data for XPULPV2 extension.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (real data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32s_xpulpv2( const plp_fft_instance_f32 *S,
                            const float32_t *__restrict__ pSrc,
                            float32_t *__restrict__ pDst) {
    switch( S->FFTLength ) {

        case 16:
        case 256:
        case 1024:
            plp_radix4_rfft_f32s_xpulpv2(S, pSrc, pDst);
            break;
        case 32:
        case 128:
        case 2048:
        case 64:
        case 512:
            plp_radix2_rfft_f32s_xpulpv2(S, pSrc, pDst);
            break;
    }
}
/**
   @} end of realFFTKernels group
*/


/* RADIX-2 */

int bit_rev_radix2(int index, int log2FFTLen) {

    unsigned int revNum = 0;
    unsigned i;
    for (i = 0; i < log2FFTLen; i++) {
        unsigned int temp = (index & (1 << i));
        if (temp != 0)
            revNum |= (1 << ((log2FFTLen - 1) - i));
    }
    return revNum;
}

void process_butterfly_real_radix2( Complex_type_f32 *input,
                                    int twiddle_index,
                                    int distance,
                                    Complex_type_f32 *twiddle_ptr) {
    int index = 0;
    float32_t d0 = input[index].re;
    float32_t d1 = input[index + distance].re;
    Complex_type_f32 r0, r1;
    // Re(c1*c2) = c1.re*c2.re - c1.im*c2.im, since c1 is real = c1.re*c2.re
    r0.re = d0 + d1;
    // r0.im = 0.0f;
    r1.re = d0 - d1;
    Complex_type_f32 tw0 = twiddle_ptr[twiddle_index];
    input[index] = r0;
    input[index + distance] = complex_mul_real(r1.re, tw0);
}

void process_butterfly_radix2(  Complex_type_f32 *input,
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
    input[index] = r0;
    input[index + distance] = complex_mul(tw0, r1);
}

void process_butterfly_last_radix2 (    const plp_fft_instance_f32 *S,
                                        Complex_type_f32 *input,
                                        Complex_type_f32 *output,
                                        int outindex) {
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
    if (!(S->bitReverseFlag)) {
        if (S->pBitReverseLUT) {
            unsigned int index12 = *((unsigned int *)(&S->pBitReverseLUT[outindex]));
            unsigned int index1  = index12 & 0x0000FFFF;
            unsigned int index2  = index12 >> 16;
            output[index1] = r0;
            output[index2] = r1;
        } else {
            output[bit_rev_radix2(outindex, log2(S->FFTLength))] = r0;
            output[bit_rev_radix2(outindex+1, log2(S->FFTLength))] = r1;
        }
    } else {
        output[outindex  ] = r0;
        output[outindex+1] = r1;
    }
}

void plp_radix2_rfft_f32s_xpulpv2(  const plp_fft_instance_f32 *S,
                                    const float32_t *__restrict__ pSrc,
                                    float32_t *__restrict__ pDst) {

    int k, j, stage, step, d, index;
    Complex_type_f32 * _in;
    Complex_type_f32 * _out;
    Complex_type_f32 temp;
    int dist = S->FFTLength >> 1;
    int nbutterfly = S->FFTLength >> 1;
    int butt = 2; // number of butterflies in the same group
    Complex_type_f32 *_in_ptr;
    Complex_type_f32 *_out_ptr;
    Complex_type_f32 *_tw_ptr;
    _in  = (Complex_type_f32 *) pSrc;
    _out = (Complex_type_f32 *) pDst;

    // FIRST STAGE, input is real
    stage = 1;
    _in_ptr = _in;
    _tw_ptr = (Complex_type_f32 *)S->pTwiddleFactors;

    for (j = 0; j < nbutterfly; j++) {
        process_butterfly_real_radix2(_in_ptr, j, dist, _tw_ptr);
        _in_ptr++;
    } // j

    stage = stage + 1;
    dist = dist >> 1;

    // STAGES 2 -> n-1
    while (dist > 1) {
        step = dist << 1;
        for (j = 0; j < butt; j++) {
            _in_ptr = _in;
            for (d = 0; d < dist; d++) {
                process_butterfly_radix2(_in_ptr, d * butt, j * step, dist, _tw_ptr);
                _in_ptr++;
            } // d
        } // j
        stage = stage + 1;
        dist = dist >> 1;
        butt = butt << 1;
    }

    //LAST STAGE
    _in_ptr = _in;
    index = 0;
    for (j = 0; j < (S->FFTLength >> 1); j++) {
        process_butterfly_last_radix2(S, _in_ptr, _out, index);
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
                temp = _out[j];
                _out[j] = _out[index1];
                _out[index1] = temp;
            }
            if (index2 > j + 1) {
                temp = _out[j + 1];
                _out[j + 1] = _out[index2];
                _out[index2] = temp;
            }
            if (index3 > j + 2) {
                temp = _out_ptr[j + 2];
                _out_ptr[j + 2] = _out_ptr[index3];
                _out_ptr[index3] = temp;
            }
            if (index4 > j + 3) {
                temp = _out[j + 3];
                _out[j + 3] = _out[index4];
                _out[index4] = temp;
            }
        }
    }
}

/* RADIX-4 */

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

static inline void process_butterfly_real_radix4 (Complex_type_f32* input, Complex_type_f32* output, int twiddle_index, int index, int distance, Complex_type_f32* twiddle_ptr)
{
     Complex_type_f32 r0, r1, r2, r3;
     float32_t d0, d1, d2, d3;
     Complex_type_f32 tw1, tw2, tw3;

     d0         = input[index].re;
     d1         = input[index+distance].re;
     d2         = input[index+2*distance].re;
     d3         = input[index+3*distance].re;

     // Basic buttefly rotation
     /*
     r0   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i   1.0000 + 0.0000i
     r1   1.0000 + 0.0000i   0.7071 - 0.7071i   0.0000 - 1.0000i  -0.7071 - 0.7071i  -1.0000 - 0.0000i  -0.7071 + 0.7071i   0.0000 + 1.0000i   0.7071 + 0.7071i
     r2   1.0000 + 0.0000i   0.0000 - 1.0000i  -1.0000 - 0.0000i   0.0000 + 1.0000i   1.0000 + 0.0000i   0.0000 - 1.0000i   -1.0000 - 0.0000i  0.0000 + 1.0000i
     r3   1.0000 + 0.0000i  -0.7071 - 0.7071i  -0.0000 + 1.0000i   0.7071 - 0.7071i  -1.0000 - 0.0000i   0.7071 + 0.7071i   0.0000 - 1.0000i  -0.7071 + 0.7071i
     */

     //Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
     r0.re = d0 + d1 + d2 + d3;
     r1.re = d0 - d2;
     r2.re = d0 - d1 + d2 - d3;
     r3.re = r1.re;

     r0.im = 0.0f;
     r1.im = -d1 + d3;
     r2.im = 0.0f;
     r3.im = d1 - d3;

     //Im(c1*c2) = c1.re*c2.im + c1.im*c2.re
     tw1 = twiddle_ptr[twiddle_index];
     tw2 = twiddle_ptr[twiddle_index*2];
     tw3 = twiddle_ptr[twiddle_index*3];

     output[index] = r0;
     output[index+distance]   = complex_mul(r1, tw1);
     output[index+2*distance] = complex_mul_real(r2.re, tw2);
     output[index+3*distance] = complex_mul(r3, tw3);
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

static void plp_radix4_rfft_f32s_xpulpv2(   const plp_fft_instance_f32 *S, 
                                            const float32_t *__restrict__ pSrc, 
                                            float32_t *__restrict__ pDst) {

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
    _out_ptr = (Complex_type_f32 *)pSrc;
    _tw_ptr = (Complex_type_f32 *)S->pTwiddleFactors;

    for (j = 0; j < nbutterfly; j++) {
        process_butterfly_real_radix4(_in_ptr, _out_ptr, j, 0, dist, _tw_ptr);
        _in_ptr++;
        _out_ptr++;
    } // j

    stage = stage + 1;
    dist = dist >> 2;

    // STAGES 2 -> n-1
    while (dist > 1) {
        step = dist << 2;
        for (j = 0; j < butt; j++) {
            _in_ptr = (Complex_type_f32 *)pSrc;
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
    _in_ptr = (Complex_type_f32 *)pSrc;
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