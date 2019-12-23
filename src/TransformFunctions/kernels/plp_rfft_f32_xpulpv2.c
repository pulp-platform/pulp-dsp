/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_rfft_f32_xpulpv2.c
 * Description:  Floating-point FFT on real input data for XPULPV2
 *
 * $Date:        16. Dec 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores with "F" support (wolfe, vega)
 * ===================================================================== */
 /*
  * Copyright (C) 2019 ETH Zurich and University of Bologna. All rights reserved.
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
static inline Complex_type_f32 complex_mul (Complex_type_f32 A, Complex_type_f32 B);
static inline Complex_type_f32 complex_mul_real (float32_t A, Complex_type_f32 B);
static inline void process_butterfly_real_radix2 (const float32_t * input,  Complex_type_f32 * output, int twiddle_index, int distance, Complex_type_f32 * twiddle_ptr);
static inline void process_butterfly_radix2 (Complex_type_f32 * input, int twiddle_index, int index, int distance, Complex_type_f32 * twiddle_ptr);
static inline void process_butterfly_last_radix2 (Complex_type_f32 * input,  Complex_type_f32 * output, int outindex);


/**
  @ingroup fft
 */

/**
  @defgroup fftKernels FFT Kernels
  These kernels calculate the FFT transform on the input data.
  Supported algorithms: radix-2
*/

/**
  @addtogroup fftKernels
  @{
 */

/**
   @brief  Floating-point FFT on real input data for XPULPV2 extension.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrcA   points to the input buffer (real data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32_xpulpv2(
        const plp_rfft_instance_f32 *S,
        const float32_t * __restrict__ pSrc,
        float32_t * __restrict__ pDst){

  int k, j, stage, step, d, index;

  Complex_type_f32  temp;
  int dist = S->FFTLength >> 1;
  int nbutterfly = S->FFTLength >> 1;
  int butt = 2; //number of butterflies in the same group

  const float32_t * _in_ptr_real;
  Complex_type_f32 * _in_ptr;
  Complex_type_f32 * _out_ptr;
  Complex_type_f32 * _tw_ptr;

  // FIRST STAGE, input is real, stage=1
  stage = 1;

  _in_ptr_real = pSrc;
  _in_ptr = (Complex_type_f32 *) pDst;
  _tw_ptr = (Complex_type_f32 *) S->pTwiddleFactors;

  for(j=0; j<nbutterfly; j++){
    process_butterfly_real_radix2(_in_ptr_real, _in_ptr, j, dist, _tw_ptr);
    _in_ptr_real++;
    _in_ptr++;
  } //j

  stage = stage + 1;
  dist  = dist >> 1;

  // STAGES 2 -> n-1
  while(dist > 1)
  {
    step = dist << 1;
    for(j=0;j<butt;j++)
    {
      _in_ptr = (Complex_type_f32 *) pDst;
      for(d = 0; d < dist; d++)
      {
         process_butterfly_radix2(_in_ptr, d*butt, j*step, dist, _tw_ptr);
         _in_ptr++;
       } //d
    } //j
    stage = stage + 1;
    dist  = dist >> 1;
    butt = butt  << 1;
  }

  // LAST STAGE
  _in_ptr = (Complex_type_f32 *) pDst;
  index=0;
  for(j=0; j<S->FFTLength>>1; j++){
    process_butterfly_last_radix2(_in_ptr, (Complex_type_f32 *) pDst, index);
    _in_ptr += 2;
    index   += 2;
   } //j

   // ORDER VALUES
  if(S->bitReverseFlag){
    int index1, index2, index3, index4;
    _out_ptr = (Complex_type_f32 *) pDst;
    for(j=0; j<S->FFTLength; j+=4){
      if(S->pBitReverseLUT){
        unsigned int index12 = *((unsigned int *)(& S->pBitReverseLUT[j]));
        unsigned int index34 = *((unsigned int *)(& S->pBitReverseLUT[j+2]));
        index1  = index12 & 0x0000FFFF;
        index2  = index12 >> 16;
        index3  = index34 & 0x0000FFFF;
        index4  = index34 >> 16;
      }
      else{
        int log2FFTLen = log2(S->FFTLength);
        index1 = bit_rev_radix2(j,  log2FFTLen);
        index2 = bit_rev_radix2(j+1,log2FFTLen);
        index3 = bit_rev_radix2(j+2,log2FFTLen);
        index4 = bit_rev_radix2(j+3,log2FFTLen);
      }
      if(index1 > j)
      {
        temp         = _out_ptr[j];
        _out_ptr[j]      = _out_ptr[index1];
        _out_ptr[index1] = temp;
      }
      if(index2 > j+1)
      {
        temp         = _out_ptr[j+1];
        _out_ptr[j+1]    = _out_ptr[index2];
        _out_ptr[index2] = temp;
      }
      if(index3 > j+2)
      {
        temp         = _out_ptr[j+2];
        _out_ptr[j+2]    = _out_ptr[index3];
        _out_ptr[index3] = temp;
      }
      if(index4 > j+3)
      {
        temp         = _out_ptr[j+3];
        _out_ptr[j+3]    = _out_ptr[index4];
        _out_ptr[index4] = temp;
      }
    }
  }

}

/**
   @brief  Floating-point FFT on real input data for XPULPV2 extension.
   @param[in]   S      points to an instance of the floating-point FFT structure
   @param[in]   pSrcA  points to the input buffer (real data)
   @param[out]  pDst   points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32_xpulpv2_parallel(plp_rfft_parallel_arg_f32 *arg){

  int k, j, stage, step, d, index;

  plp_rfft_instance_f32 * S = arg->S;
  const float32_t * pSrc = arg->pSrc;
  const uint32_t nPE  = arg->nPE;
  float32_t * pDst = arg->pDst;

  Complex_type_f32  temp;
  int dist = S->FFTLength >> 1;
  int nbutterfly = S->FFTLength >> 1;
  int butt = 2; //number of butterflies in the same group

  const float32_t * _in_ptr_real;
  Complex_type_f32 * _in_ptr;
  Complex_type_f32 * _out_ptr;
  Complex_type_f32 * _tw_ptr;

  int core_id = rt_core_id();

  // FIRST STAGE, input is real, stage=1
  stage = 1;
  _in_ptr_real = &pSrc[core_id];
  _in_ptr = (Complex_type_f32 *) &pDst[2*core_id];
  _tw_ptr = (Complex_type_f32 *) S->pTwiddleFactors;

  for(j = 0; j < nbutterfly/nPE; j++){
    process_butterfly_real_radix2(_in_ptr_real, _in_ptr, j*nPE+core_id, dist, _tw_ptr);
    _in_ptr_real+=nPE;
    _in_ptr+=nPE;
  } //j

  stage = stage + 1;
  dist  = dist >> 1;

  // STAGES 2 -> n-1
  while(dist > nPE/2)
  {
    rt_team_barrier();
    step = dist << 1;
    for(j=0;j<butt;j++)
    {
      _in_ptr = (Complex_type_f32 *) &pDst[2*core_id];
      for(d = 0; d < dist/nPE; d++)
      {
        process_butterfly_radix2(_in_ptr, (d*nPE+core_id)*butt, j*step,dist, _tw_ptr);
        _in_ptr+=nPE;
       } //d
    } //j
    stage = stage + 1;
    dist  = dist >> 1;
    butt = butt  << 1;
  }

  while(dist > 1)
  {
    rt_team_barrier();
    step = dist << 1;
    for(j = 0; j < butt/nPE; j++)
    {
      _in_ptr = _in_ptr = (Complex_type_f32 *) pDst;;
      for(d = 0; d < dist; d++)
      {
        process_butterfly_radix2(_in_ptr, butt*d, (j*nPE+core_id)*step, dist, _tw_ptr);
        _in_ptr++;
      } //d
    } //j
    stage = stage + 1;
    dist  = dist >> 1;
    butt = butt  << 1;
  }

  rt_team_barrier();

  // LAST STAGE
  _in_ptr = (Complex_type_f32 *) &pDst[4*core_id];
  index   = 2*core_id;
  for(j=0; j<S->FFTLength/(2*nPE); j++){
    process_butterfly_last_radix2(_in_ptr, (Complex_type_f32 *) pDst, index);
    _in_ptr +=2*nPE;
    index   +=2*nPE;
  } //j

  rt_team_barrier();

   // ORDER VALUES
  if(S->bitReverseFlag){

    int index1, index2, index3, index4;
    _out_ptr = (Complex_type_f32 *) pDst;
    for(j=4*core_id; j<S->FFTLength; j+=nPE*4){
      if(S->pBitReverseLUT){
        unsigned int index12 = *((unsigned int *)(& S->pBitReverseLUT[j]));
        unsigned int index34 = *((unsigned int *)(& S->pBitReverseLUT[j+2]));
        index1  = index12 & 0x0000FFFF;
        index2  = index12 >> 16;
        index3  = index34 & 0x0000FFFF;
        index4  = index34 >> 16;
      }
      else{
        int log2FFTLen = log2(S->FFTLength);
        index1 = bit_rev_radix2(j,  log2FFTLen);
        index2 = bit_rev_radix2(j+1,log2FFTLen);
        index3 = bit_rev_radix2(j+2,log2FFTLen);
        index4 = bit_rev_radix2(j+3,log2FFTLen);
      }
      if(index1 > j)
      {
        temp         = _out_ptr[j];
        _out_ptr[j]      = _out_ptr[index1];
        _out_ptr[index1] = temp;
      }
      if(index2 > j+1)
      {
        temp         = _out_ptr[j+1];
        _out_ptr[j+1]    = _out_ptr[index2];
        _out_ptr[index2] = temp;
      }
      if(index3 > j+2)
      {
        temp         = _out_ptr[j+2];
        _out_ptr[j+2]    = _out_ptr[index3];
        _out_ptr[index3] = temp;
      }
      if(index4 > j+3)
      {
        temp         = _out_ptr[j+3];
        _out_ptr[j+3]    = _out_ptr[index4];
        _out_ptr[index4] = temp;
      }
    }
    rt_team_barrier();
  }

}

/**
   @} end of fftKernels group
*/

int bit_rev_radix2(int index, int log2FFTLen){

  unsigned int revNum = 0;
  unsigned i;

  for (i=0; i<log2FFTLen; i++){
    unsigned int temp = (index & (1 << i));
    if (temp != 0)
      revNum |= (1 << ((log2FFTLen -1) - i));
  }

  return revNum;
 }


static inline
Complex_type_f32 complex_mul (Complex_type_f32 A, Complex_type_f32 B){

  Complex_type_f32 result;
  result.re = A.re * B.re - A.im * B.im;
  result.im = A.re * B.im + A.im * B.re;
  return result;

}

static inline
Complex_type_f32  complex_mul_real (float32_t A, Complex_type_f32 B){

  Complex_type_f32 result;
  result.re = A * B.re;
  result.im = A * B.im;
  return result;

}

static inline
void process_butterfly_real_radix2 (
         const float32_t * input,
         Complex_type_f32 * output,
         int twiddle_index,
         int distance,
         Complex_type_f32 * twiddle_ptr){

   int index = 0;
   float32_t d0         = input[index];
   float32_t d1         = input[index+distance];

   Complex_type_f32 r0, r1;

   //Re(c1*c2) = c1.re*c2.re - c1.im*c2.im, since c1 is real = c1.re*c2.re
   r0.re = d0 + d1;
   r0.im = 0.0f;
   r1.re = d0 - d1;

   Complex_type_f32 tw0 = twiddle_ptr[twiddle_index];

   output[index]            = r0;
   // printf("%f %f\n", r0.re, r0.im);
   output[index+distance]   = complex_mul_real(r1.re,tw0);

 }

static inline
void  process_butterfly_radix2 (
         Complex_type_f32 * input,
         int twiddle_index,
         int index, int distance,
         Complex_type_f32* twiddle_ptr){

  Complex_type_f32 r0, r1;

  float32_t d0         = input[index].re;
  float32_t d1         = input[index+distance].re;
  float32_t e0         = input[index].im;
  float32_t e1         = input[index+distance].im;

  //Re(c1*c2) = c1.re*c2.re - c1.im*c2.im

  r0.re = d0 + d1;
  r1.re = d0 - d1;

  //Im(c1*c2) = c1.re*c2.im + c1.im*c2.re

  r0.im = e0 + e1;
  r1.im = e0 - e1;

  Complex_type_f32 tw0 = twiddle_ptr[twiddle_index];

  input[index]           = r0;
  input[index+distance]  = complex_mul(tw0, r1);

}

static inline
void process_butterfly_last_radix2 (
          Complex_type_f32 * input,
          Complex_type_f32 * output,
          int outindex){

  int index = 0;
  Complex_type_f32 r0, r1;
  float32_t d0  = input[index].re;
  float32_t d1  = input[index+1].re;
  float32_t e0  = input[index].im;
  float32_t e1  = input[index+1].im;
  //Re(c1*c2) = c1.re*c2.re - c1.im*c2.im
  r0.re = d0 + d1;
  r1.re = d0 - d1;

  //Im(c1*c2) = c1.re*c2.im + c1.im*c2.re

  r0.im = e0 + e1;
  r1.im = e0 - e1;


  /* In the Last step, twiddle factors are all 1 */
  output[outindex  ] = r0;
  output[outindex+1] = r1;

}
