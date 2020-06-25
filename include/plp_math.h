/** ==========================================================================
 * @file     plp_math.h
 * @brief    Public header file for PULP DSP Library
 * @version  V0
 * @date     16. May 2019
 * =========================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna. All rights reserved.
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

/**
   \mainpage PULP DSP Software Library
   *
   * Introduction
   * ------------
   *
   * This user manual describes the PULP DSP software library,
   * a suite of common signal processing functions for use on PULP-based processors.
   *
   * The library is divided into a number of functions each covering a specific category:
   * - Basic math functions
   * - Fast math functions
   * - Complex math functions
   * - Filters
   * - Matrix functions
   * - Transform functions
   * - Motor control functions
   * - Statistical functions
   * - Support functions
   * - Interpolation functions
   *
   * The library has separate functions for operating on 8-bit integers, 16-bit integers,
   * 32-bit integer and 32-bit floating-point values.
   *
   * The library is released under Apache v2.0 license.
   *
   */

/**
 * @defgroup groupMath Basic Math Functions
 * The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s_rv32im):
 <pre>
 \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

 data type = {f, i, q} respectively for floats, integers, fixed points

 precision = {32, 16, 8} bits

 method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

 isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

 </pre>

 */

/**
 * @defgroup groupFilters Filtering Functions
 */

/**
 * @defgroup groupMatrix Matrix Functions
 * The naming scheme of the functions follows the following pattern (for example plp_mat_mult_i32s_rv32im):
 <pre>
 \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

 data type = {f, i, q} respectively for floats, integers, fixed points

 precision = {32, 16, 8} bits

 method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

 isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

 </pre>

 *
 * This set of functions provides basic matrix math operations.
 *

 */

/**
 * @defgroup groupTransforms Transform Functions
 */

/**
 * @defgroup groupStats Statistics Functions
 */

/**
 * @defgroup groupSupport Support Functions
 */


#ifndef __PLP_MATH_H__
#define __PLP_MATH_H__

#include "rt/rt_api.h"
#include "math.h"

typedef float float32_t;

#define PLP_MATH_IBEX // previously called zero-riscy
//#define PLP_MATH_RISCY
#define PLP_MATH_LOOPUNROLL


/** -------------------------------------------------------
    @struct plp_dot_prod_instance_i32
    @brief Instance structure for integer parallel dot product.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blkSizePE  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] resBuffer  pointer to the result buffer
 */
typedef struct
{
  int32_t * pSrcA;     // pointer to the first vector
  int32_t * pSrcB;     // pointer to the second vector
  uint32_t blkSizePE;     // number of samples in each vector
  uint32_t nPE;        // number of processing units
  int32_t * resBuffer;      // pointer to result vector
} plp_dot_prod_instance_i32;

/** -------------------------------------------------------
    @brief Instance structure for fixed point parallel dot product.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blkSizePE  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] resBuffer  pointer to the result buffer
 */
typedef struct
{
  int32_t * pSrcA;     // pointer to the first vector
  int32_t * pSrcB;     // pointer to the second vector
  uint32_t blkSizePE;     // number of samples in each vector
  uint32_t deciPoint;    // decimal point for right shift
  uint32_t nPE;        // number of processing units
  int32_t * resBuffer;      // pointer to result vector
} plp_dot_prod_instance_q32;

/** -------------------------------------------------------
    @struct plp_dot_prod_instance_f32
    @brief Instance structure for float parallel dot product.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blkSizePE  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] resBuffer  pointer to the result buffer
*/
typedef struct
{
  const float32_t * pSrcA; // pointer to the first vector
  const float32_t * pSrcB; // pointer to the second vector
  uint32_t blkSizePE;      // number of samples in each vector
  uint32_t nPE;            // number of processing units
  float32_t * resBuffer;   // pointer to result vector
} plp_dot_prod_instance_f32;

/** -------------------------------------------------------
    @brief Instance structure for basic integer convolution.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  srcALen    length of the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  srcBLen    length of the second input vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes       output result returned here
 */
typedef struct {
  const int32_t * pSrcA;     // pointer to the first vector
  uint32_t srcALen;
  const int32_t * pSrcB;     // pointer to the second vector
  uint32_t srcBLen;     // number of samples in each vector
  uint8_t nPE;        // number of processing units
  int32_t * pRes;      // pointer to result vector
} plp_conv_instance_i32;

/** -------------------------------------------------------
    @brief Instance structure for basic integer convolution.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  srcALen    length of the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  srcBLen    length of the second input vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes       output result returned here
 */
typedef struct {
  const int16_t * pSrcA;     // pointer to the first vector
  uint32_t srcALen;
  const int16_t * pSrcB;     // pointer to the second vector
  uint32_t srcBLen;     // number of samples in each vector
  uint8_t nPE;        // number of processing units
  int32_t * pRes;      // pointer to result vector
} plp_conv_instance_i16;

/** -------------------------------------------------------
    @brief Instance structure for basic integer convolution.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  srcALen    length of the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  srcBLen    length of the second input vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes       output result returned here
 */
typedef struct {
  const int8_t * pSrcA;     // pointer to the first vector
  uint32_t srcALen;
  const int8_t * pSrcB;     // pointer to the second vector
  uint32_t srcBLen;     // number of samples in each vector
  uint8_t nPE;        // number of processing units
  int32_t * pRes;      // pointer to result vector
} plp_conv_instance_i8;

/** -------------------------------------------------------
    @brief Instance structure for basic integer convolution.
    @param[in]  addOffset
    @param[in]  addLengthfirst
    @param[in]  addLengthsecond
    @param[in]  numVectors
    @param[in]  blockOffset
    @param[out] pRes       output result returned here
    @param[in]  coresPerVector
 */
typedef struct{
  uint32_t addOffset;
  uint32_t addLengthfirst;
  uint32_t addLengthsecond;
  uint32_t numVectors;
  uint32_t blockOffset;
  int32_t* pRes;
  uint8_t coresPerVector;
} plp_conv_tree_add_instance;

/** -------------------------------------------------------
    @struct plp_rfft_instance_f32
    @brief Instance structure for floating-point FFT
    @param[in]  length data length of the FFT
    @param[in]  bitReverseFlag  flag that enables (bitReverseFlagR=1) or disables (bitReverseFlagR=0) bit reversal of output
    @param[in]  pTwiddleFactors pointer to the twiddle factors.
                These values must be computed using this formula:
                \f$W_N^k =   e^{-j \frac{\pi}{N} k}\f$,
                where \f$N\f$ is the data length and \f$k\f$ is the index.
                The user must provide \f$\frac{N}{2}\f$ values (\f$k = 0 .. \frac{N}{2}-1\f$).
    @param[in]  pBitReverseLUT  pointer to the lookup table used for the bit reversal of output.
                This table must include \f$N\f$ elements in the range \f$0 .. N-1\f$,
                where each location \f$k\f$ contains the value \f$bitreverse(k)\f$.
 */
typedef struct{
  uint32_t          FFTLength;
  uint8_t 	        bitReverseFlag;
  const float32_t * pTwiddleFactors;
  const uint16_t  * pBitReverseLUT;
} plp_rfft_instance_f32;

typedef struct{
  plp_rfft_instance_f32 * S;
  const float32_t * pSrc;
  const uint32_t nPE;
  float32_t * pDst;
} plp_rfft_parallel_arg_f32;

typedef struct{
  float32_t re;
  float32_t im;
} Complex_type_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix multiplication.
 */
typedef struct
{
  const int8_t * __restrict__ pSrcA;
  const int8_t * __restrict__ pSrcB;
  uint32_t M;
  uint32_t N;
  uint32_t O;
  uint32_t nPE;
  int32_t * __restrict__ pDstC;
}plp_mat_mult_instance_i8;



/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix multiplication.
 */
typedef struct
{
  const int16_t * __restrict__ pSrcA;
  const int16_t * __restrict__ pSrcB;
  uint32_t M;
  uint32_t N;
  uint32_t O;
  uint32_t nPE;
  int32_t * __restrict__ pDstC;
}plp_mat_mult_instance_i16;



/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix multiplication.
 */
typedef struct
{
  const int32_t * __restrict__ pSrcA;
  const int32_t * __restrict__ pSrcB;
  uint32_t M;
  uint32_t N;
  uint32_t O;
  uint32_t nPE;
  int32_t * __restrict__ pDstC;
}plp_mat_mult_instance_i32;



/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel matrix multiplication.
 */
typedef struct
{
  const float * __restrict__ pSrcA;
  const float * __restrict__ pSrcB;
  uint32_t M;
  uint32_t N;
  uint32_t O;
  uint32_t nPE;
  float * __restrict__ pDstC;
}plp_mat_mult_instance_f32;



/** -------------------------------------------------------
   @brief Glue code for parallel dot product of 32-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  nPE        number of parallel processing units
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_i32_parallel(
                               const int32_t * __restrict__ pSrcA,
                               const int32_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t nPE,
                               int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Glue code for parallel dot product of 32-bit fixed point vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[in]  nPE        number of parallel processing units
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_q32_parallel(
                               const int32_t * __restrict__ pSrcA,
                               const int32_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               uint32_t nPE,
                               int32_t * __restrict__ pRes);


/** -------------------------------------------------------
    @brief Glue code for parallel dot product of 32-bit float vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes     output result returned here
    @return        none
*/

void plp_dot_prod_f32_parallel(
                               const float32_t * __restrict__ pSrcA,
                               const float32_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t nPE,
                               float32_t * __restrict__ pRes);


/** -------------------------------------------------------
   @brief Scalar dot product with interleaved access of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_i32p_xpulpv2(void * S);



/** -------------------------------------------------------
   @brief Scalar dot product with interleaved access of 32-bit fixed point vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_q32p_xpulpv2(void * S);



/** -------------------------------------------------------
   @brief Scalar dot product with interleaved access of 32-bit float vectors kernel for XPULPV2 extension.
   @param[in]  S     points to the instance structure for float parallel dot product
   @return        none
*/

void plp_dot_prod_f32p_xpulpv2(void * S);



/** -------------------------------------------------------
* @brief Glue code for dot product of 32-bit integer vectors.
* @param[in]  pSrcA      points to the first input vector
* @param[in]  pSrcB      points to the second input vector
* @param[in]  blockSize  number of samples in each vector
* @param[out] pRes     output result returned here
*/
void plp_dot_prod_i32(
                       const int32_t * __restrict__ pSrcA,
                       const int32_t * __restrict__ pSrcB,
                       uint32_t blockSize,
                       int32_t * __restrict__ pRes);



/** -------------------------------------------------------
 * @brief Scalar dot product of 32-bit integer vectors kernel for RV32IM extension.
 * @param[in]  pSrcA      points to the first input vector
 * @param[in]  pSrcB      points to the second input vector
 * @param[in]  blockSize  number of samples in each vector
 * @param[out] pRes     output result returned here
 */
void plp_dot_prod_i32s_rv32im(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t blockSize,
                              int32_t * __restrict__ pRes);



/** -------------------------------------------------------
 * @brief Scalar dot product of 32-bit integer vectors kernel for XPULPV2 extension.
 * @param[in]  pSrcA      points to the first input vector
 * @param[in]  pSrcB      points to the second input vector
 * @param[in]  blockSize  number of samples in each vector
 * @param[out] pRes     output result returned here
 */
void plp_dot_prod_i32s_xpulpv2(
                               const int32_t * __restrict__ pSrcA,
                               const int32_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               int32_t * __restrict__ pRes);


/** -------------------------------------------------------
   @brief Glue code for dot product of 32-bit fixed point vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_q32(
                       const int32_t * __restrict__ pSrcA,
                       const int32_t * __restrict__ pSrcB,
                       uint32_t blockSize,
                       uint32_t deciPoint,
                       int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Scalar dot product of 32-bit fixed point vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_q32s_rv32im(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t deciPoint,
                              int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Scalar dot product of 32-bit fixed point vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_q32s_xpulpv2(
                               const int32_t * __restrict__ pSrcA,
                               const int32_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               int32_t * __restrict__ pRes);


/** -------------------------------------------------------
   @brief Glue code for dot product of 32-bit float vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_dot_prod_f32(
                      const float32_t * __restrict__ pSrcA,
                      const float32_t * __restrict__ pSrcB,
                      uint32_t blockSize,
                      float32_t * __restrict__ pRes);


/** -------------------------------------------------------
    @brief Glue code for dot product of 32-bit float vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes     output result returned here
    @return        none
*/

void plp_dot_prod_f32s_xpulpv2(
                                        const float32_t * __restrict__ pSrcA,
                                        const float32_t * __restrict__ pSrcB,
                                        uint32_t blockSize,
                                        float32_t * __restrict__ pRes);


/** -------------------------------------------------------
 * @brief Glue code for dot product of 16-bit integer vectors.
 * @param[in]  pSrcA      points to the first input vector [16 bit]
 * @param[in]  pSrcB      points to the second input vector [16 bit]
 * @param[in]  blockSize  number of samples in each vector
 * @param[out] pRes     output result returned here [32 bit]
 *
 * @par Exploiting SIMD instructions
 When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
 */
void plp_dot_prod_i16(
                       const int16_t * pSrcA,
                       const int16_t * pSrcB,
                       uint32_t blockSize,
                       int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Vectorized dot product of 16-bit integer vectors kernel for RV32IM extension.
  @param[in]  pSrcA      points to the first input vector [16 bit]
  @param[in]  pSrcB      points to the second input vector [16 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[out] pRes     output result returned here [32 bit]
  @return        none

  @par Exploiting SIMD instructions
  When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
 */

void plp_dot_prod_i16s_rv32im(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t blockSize,
                         int32_t * __restrict__ pRes);



/** -------------------------------------------------------
  @brief Vectorized dot product of 16-bit integer vectors kernel for XPULPV2 extension.
  @param[in]  pSrcA      points to the first input vector [16 bit]
  @param[in]  pSrcB      points to the second input vector [16 bit]
  @param[in]  blockSize  number of samples in each vector
  @param[out] pRes     output result returned here [32 bit]
  @return        none

  @par Exploiting SIMD instructions
       The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed simultaneously on 32 bit vectors.
 */

void plp_dot_prod_i16v_xpulpv2(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t blockSize,
                         int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Glue code for dot product of 16-bit fixed point vectors.
   @param[in]  pSrcA      points to the first input vector [16 bit]
   @param[in]  pSrcB      points to the second input vector [16 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q16(
                       const int16_t * __restrict__ pSrcA,
                       const int16_t * __restrict__ pSrcB,
                       uint32_t blockSize,
                       uint32_t deciPoint,
                       int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Scalar dot product of 16-bit fixed point vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector [16 bit]
   @param[in]  pSrcB      points to the second input vector [16 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_q16s_rv32im(
                              const int16_t * __restrict__ pSrcA,
                              const int16_t * __restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t deciPoint,
                              int32_t * __restrict__ pRes);



/** -------------------------------------------------------
    @brief Vectorized dot product of 16-bit fixed point vectors kernel for XPULPV2 extension.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes     output result returned here [32 bit]
    @return        none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q16v_xpulpv2(
                               const int16_t * __restrict__ pSrcA,
                               const int16_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Glue code for dot product of 8-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_i8(
                      const int8_t * __restrict__ pSrcA,
                      const int8_t * __restrict__ pSrcB,
                      uint32_t blockSize,
                      int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Vectorized dot product of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector [8] bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_i8s_rv32im(
                             const int8_t * __restrict__ pSrcA,
                             const int8_t * __restrict__ pSrcB,
                             uint32_t blockSize,
                             int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Vectorized dot product of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_i8v_xpulpv2(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t blockSize,
                              int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Glue code for dot product of 8-bit fixed point vectors.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q8(
                      const int8_t * __restrict__ pSrcA,
                      const int8_t * __restrict__ pSrcB,
                      uint32_t blockSize,
                      uint32_t deciPoint,
                      int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Scalar dot product of 8-bit fixed point vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_q8s_rv32im(
                             const int8_t * __restrict__ pSrcA,
                             const int8_t * __restrict__ pSrcB,
                             uint32_t blockSize,
                             uint32_t deciPoint,
                             int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief Scalar dot product of 8-bit fixed point vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four by four into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q8v_xpulpv2(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t deciPoint,
                              int32_t * __restrict__ pRes);
/** -------------------------------------------------------
   @brief         Glue code for filling a constant value into a 32-bit integer vector.
   @param[in]     value      input value to be filled
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_fill_i32(
                  int32_t value,
                  int32_t * __restrict__ pDst,
                  uint32_t blockSize);



/** -------------------------------------------------------
   @brief         Fills a constant value into a 32-bit integer vector for RV32IM extension.
   @param[in]     value      input value to be filled
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_fill_i32s_rv32im(
                          int32_t value,
                          int32_t * __restrict__ pDst,
                          uint32_t blockSize);



/** -------------------------------------------------------
   @brief         Fills a constant value into a 32-bit integer vector for XPULPV2 extension.
   @param[in]     value      input value to be filled
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_fill_i32s_xpulpv2(
                           int32_t value,
                           int32_t * __restrict__ pDst,
                           uint32_t blockSize);



/** -------------------------------------------------------
   @brief         Glue code for copying the elements of a 32-bit integer vector
   @param[in]     pSrc       points to input vector
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_copy_i32(
                  int32_t * __restrict__ pSrc,
                  int32_t * __restrict__ pDst,
                  uint32_t blockSize);



/** -------------------------------------------------------
   @brief         Copies the elements of a 32-bit integer vector for RV32IM extension.
   @param[in]     pSrc       points to input vector
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_copy_i32s_rv32im(
                          int32_t * __restrict__ pSrc,
                          int32_t * __restrict__ pDst,
                          uint32_t blockSize);



/** -------------------------------------------------------
   @brief         Copies the elements of a 32-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to input vector
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_copy_i32s_xpulpv2(
                           int32_t * __restrict__ pSrc,
                           int32_t * __restrict__ pDst,
                           uint32_t blockSize);


/** -------------------------------------------------------
    @brief         Glue code for copying the elements of a 32-bit float vector
    @param[in]     pSrc       points to input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_copy_f32(
                  float32_t * __restrict__ pSrc,
                  float32_t * __restrict__ pDst,
                  uint32_t blockSize);


/** -------------------------------------------------------
   @brief         Copies the elements of a 32-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to input vector
   @param[out]    pDst       points to output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_copy_f32s_xpulpv2(
                           float32_t * __restrict__ pSrc,
                           float32_t * __restrict__ pDst,
                           uint32_t blockSize);



/** -------------------------------------------------------
   @brief         Glue code for mean value of a 32-bit integer vector.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pResult    mean value returned here
   @return        none
*/

void plp_mean_i32(
                  const int32_t * __restrict__ pSrc,
                  uint32_t blockSize,
                  int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief         Mean value of a 32-bit integer vector for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pResult    mean value returned here
   @return        none
*/

void plp_mean_i32s_rv32im(
                          const int32_t * __restrict__ pSrc,
                          uint32_t blockSize,
                          int32_t * __restrict__ pRes);



/** -------------------------------------------------------
   @brief         Mean value of a 32-bit integer vector for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[in]     blockSize  number of samples in input vector
   @param[out]    pRes    mean value returned here
   @return        none
*/

void plp_mean_i32s_xpulpv2(
                           const int32_t * __restrict__ pSrc,
                           uint32_t blockSize,
                           int32_t * __restrict__ pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution of 32-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_i32(
                       const int32_t * pSrcA,
		       const uint32_t srcALen,
                       const int32_t * pSrcB,
		       const uint32_t srcBLen,
                       int32_t * pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution (valid) of 32-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_valid_i32(
                       const int32_t * pSrcA,
		       const uint32_t srcALen,
                       const int32_t * pSrcB,
		       const uint32_t srcBLen,
                       int32_t * pRes);

/** -------------------------------------------------------
   @brief Convolution of 32-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_i32s_rv32im(const int32_t * pSrcA,
			      const uint32_t srcALen,
			      const int32_t * pSrcB,
			      const uint32_t srcBLen,
			      int32_t * pRes);

/** -------------------------------------------------------
   @brief Convolution of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none */

void plp_conv_i32s_xpulpv2(const int32_t * __restrict__ pSrcA,
			      const uint32_t srcALen,
			      const int32_t * __restrict__ pSrcB,
			      const uint32_t srcBLen,
			      int32_t * __restrict__ pRes);

/** -------------------------------------------------------
   @brief Convolution (valid) of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none */

void plp_conv_valid_i32s_xpulpv2(const int32_t * __restrict__ pSrcA,
			      const uint32_t srcALen,
			      const int32_t * __restrict__ pSrcB,
			      const uint32_t srcBLen,
			      int32_t * __restrict__ pRes);


/** -------------------------------------------------------
  @brief Glue code for convolution of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_i16(const int16_t *  pSrcA,
		  const uint32_t srcALen,
		  const int16_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);


/** -------------------------------------------------------
  @brief Glue code for convolution (valid) of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_valid_i16(const int16_t *  pSrcA,
		  const uint32_t srcALen,
		  const int16_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);


/** -------------------------------------------------------
  @brief Glue code for convolution (valid with replication) of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_valid_rep_i16(const int16_t *  pSrcA,
		  const uint32_t srcALen,
		  const int16_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);

/** -------------------------------------------------------
   @brief Convolution of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_i16s_xpulpv2(const int16_t *  pSrcA,
			   const uint32_t srcALen,
			   const int16_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);

/** -------------------------------------------------------
   @brief Convolution (valid) of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_valid_i16s_xpulpv2(const int16_t *  pSrcA,
			   const uint32_t srcALen,
			   const int16_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);


/** -------------------------------------------------------
   @brief Convolution (valid with data replication) of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector of the replicated data
   @param[in]  srcALen   Number of elements in (unreplicated) vector a
   @param[in]  srcAMem   Number of elements between each replication
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_valid_rep_i16s_xpulpv2(const int16_t *  pSrcA,
			   const uint32_t srcALen,
			   const uint32_t srcAMem,
			   const int16_t*  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);

/** -------------------------------------------------------
   @brief Convolution of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_i16s_rv32im(const int16_t *  pSrcA,
			  const uint32_t srcALen,
			  const int16_t *  pSrcB,
			  const uint32_t srcBLen,
			  int32_t *  pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_i8(const int8_t *  pSrcA,
		  const uint32_t srcALen,
		  const int8_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);


/** -------------------------------------------------------
  @brief Glue code for convolution (valid) of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_valid_i8(const int8_t *  pSrcA,
		  const uint32_t srcALen,
		  const int8_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);


/** -------------------------------------------------------
  @brief Glue code for convolution (valid with data replication) of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector (in L2)
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector (in L2)
  @param[in]  srcBLen   Length of the second input vector
  @param[out] pRes     output result returned here (preferably in L1)
  @return        none
 */

void plp_conv_valid_rep_i8(const int8_t *  pSrcA,
		  const uint32_t srcALen,
		  const int8_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);


/** -------------------------------------------------------
   @brief Convolution of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_i8s_xpulpv2(const int8_t *  pSrcA,
			   const uint32_t srcALen,
			   const int8_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);


/** -------------------------------------------------------
   @brief Convolution (valid) of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_valid_i8s_xpulpv2(const int8_t *  pSrcA,
			   const uint32_t srcALen,
			   const int8_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);


/** -------------------------------------------------------
   @brief Convolution (valid with data replication) of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector of the replicated data
   @param[in]  srcALen   Number of elements in (unreplicated) vector a
   @param[in]  srcAMem   Number of elements between each replication
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_valid_rep_i8s_xpulpv2(const int8_t *  pSrcA,
			   const uint32_t srcALen,
			   const uint32_t srcAMem,
			   const int8_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);


/** -------------------------------------------------------
   @brief Convolution of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] pRes     output result returned here
   @return        none
*/

void plp_conv_i8s_rv32im(const int8_t *  pSrcA,
			  const uint32_t srcALen,
			  const int8_t *  pSrcB,
			  const uint32_t srcBLen,
			  int32_t *  pRes);

/** -------------------------------------------------------
  @brief Glue code for parallel convolution of 32-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[in]  nPE       Number of cores to compute on
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_i32_parallel(
                       const int32_t *  pSrcA,
		       const uint32_t srcALen,
                       const int32_t *  pSrcB,
		       const uint32_t srcBLen,
		       const uint8_t nPE,
                       int32_t *  pRes);

/** -------------------------------------------------------
  @brief Setup code for parallel convolution of 32-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i32 struct initialized by plp_conv_i32_parallel
  @return        none
 */

void plp_conv_i32p_xpulpv2(void* task_args);

/** -------------------------------------------------------
  @brief Glue code for parallel convolution of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[in]  nPE       Number of cores to compute on
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_i16_parallel(
                       const int16_t *  pSrcA,
		       const uint32_t srcALen,
                       const int16_t *  pSrcB,
		       const uint32_t srcBLen,
		       const uint8_t nPE,
                       int32_t *  pRes);
/** -------------------------------------------------------
  @brief Setup code for parallel convolution of 16-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i16 struct initialized by plp_conv_i16_parallel
  @return        none
 */

void plp_conv_i16p_xpulpv2(void* task_args);

/** -------------------------------------------------------
  @brief Glue code for parallel convolution of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  srcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  srcBLen   Length of the second input vector
  @param[in]  nPE       Number of cores to compute on
  @param[out] pRes     output result returned here
  @return        none
 */

void plp_conv_i8_parallel(
                       const int8_t *  pSrcA,
		       const uint32_t srcALen,
                       const int8_t *  pSrcB,
		       const uint32_t srcBLen,
		       const uint8_t nPE,
                       int32_t *  pRes);
/** -------------------------------------------------------
  @brief Setup code for parallel convolution of 8-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i8 struct initialized by plp_conv_i8_parallel
  @return        none
 */

void plp_conv_i8p_xpulpv2(void* task_args);

/** -------------------------------------------------------
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] nPE Number of processing cores
   @param[in] srcALen Length of the first original input vector
   @param[in] srcBLen Length of the second original input vector
   @param[in] resultsBuffer resultsBuffer array from plp_conv_i[XX]_parallel
   @return none
*/

void plp_conv_parallel_OLA(uint32_t nPE, uint32_t srcALen, uint32_t srcBLen, int32_t* resultsBuffer);

/** -------------------------------------------------------
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] task_args  Holds the plp_conv_tree_add_instance that describes the vector parameters
   @return none
*/
void plp_conv_parallel_OLA_kernel(void* task_args);


/** -------------------------------------------------------
   @brief         Glue code for matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i32(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);




/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 32-bit integer matrices for RV32IM extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i32s_rv32im(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 32-bit integer matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i32s_xpulpv2(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for matrix matrix multiplication of a 16-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i16(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 16-bit integer matrices for RV32IM extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i16s_rv32im(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 16-bit integer matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i16v_xpulpv2(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for matrix matrix multiplication of a 8-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i8(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 8-bit integer matrices for RV32IM extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i8s_rv32im(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 8-bit integer matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i8v_xpulpv2(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for parallel matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i32_parallel(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Parallel matrix matrix multiplication of a 32-bit integer matrices for XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i32 struct initialized by plp_mat_mult_i32_parallel
   @return        none
*/

void plp_mat_mult_i32p_xpulpv2(
                         void* args);


/** -------------------------------------------------------
   @brief         Glue code for parallel matrix matrix multiplication of a 16-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i16_parallel(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 16-bit integer matrices kernel for XPULPV2 extension.
    @param[in]  args      pointer to plp_mat_mult_instance_i16 struct initialized by plp_mat_mult_i16_parallel
    @return        none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two each into 32 bit vectors and then the two dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i16vp_xpulpv2(
                         void* args);



/** -------------------------------------------------------
   @brief         Glue code for parallel matrix matrix multiplication of a 8-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_i8_parallel(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         int32_t * __restrict__ pDstC);


/** -------------------------------------------------------
   @brief         Glue code for matrix matrix multiplication of a 32-bit floating-point matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/


void plp_mat_mult_f32(
                         const float * __restrict__ pSrcA,
                         const float * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         float * __restrict__ pDstC);


/** -------------------------------------------------------
   @brief         Matrix matrix multiplication of a 32-bit floating-point matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_f32s_xpulpv2(
                         const float * __restrict__ pSrcA,
                         const float * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         float * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for parallel matrix matrix multiplication of a 32-bit floating-point matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_f32_parallel(
                         const float * __restrict__ pSrcA,
                         const float * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         float * __restrict__ pDstC);



/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 32-bit floating-point matrices kernel for XPULPV2 extension.
    @param[in]  args      pointer to plp_mat_mult_instance_f32 struct initialized by plp_mat_mult_f32_parallel
    @return     none
*/

void plp_mat_mult_f32p_xpulpv2(
                         void* args);


/** -------------------------------------------------------
   @brief Parallel matrix multiplication of 8-bit integer matrices kernel for XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i8 struct initialized by plp_mat_mult_i8_parallel
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i8vp_xpulpv2(
                         void* args);



/** -------------------------------------------------------
   @brief         Glue code for matrix transposed matrix multiplication of a 32-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i32(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix transposed matrix multiplication of a 32-bit integer matrices for RV32IM extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i32s_rv32im(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix transposed matrix multiplication of a 32-bit integer matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i32s_xpulpv2(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for matrix transposed matrix multiplication of a 16-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i16(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix transposed matrix multiplication of a 16-bit integer matrices for RV32IM extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i16s_rv32im(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix transposed matrix multiplication of a 16-bit integer matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i16v_xpulpv2(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for matrix transposed matrix multiplication of a 8-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i8(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix transposed matrix multiplication of a 8-bit integer matrices for RV32IM extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i8s_rv32im(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Matrix transposed matrix multiplication of a 8-bit integer matrices for XPULPV2 extension.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[out]    pDstC      Output is written here
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i8v_xpulpv2(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Glue code for parallel matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i32_parallel(
                         const int32_t * __restrict__ pSrcA,
                         const int32_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Parallel matrix transposed matrix multiplication of a 32-bit integer matrices for RV32IM extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i32 struct initialized by plp_mat_mult_i32_parallel
   @return        none
*/

void plp_mat_mult_trans_i32p_xpulpv2(
                         void* args);


/** -------------------------------------------------------
   @brief         Glue code for parallel matrix transposed matrix multiplication of a 16-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i16_parallel(
                         const int16_t * __restrict__ pSrcA,
                         const int16_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Parallel matrix transposed matrix multiplication of a 16-bit integer matrices for XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i16 struct initialized by plp_mat_mult_i16_parallel
   @return        none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i16vp_xpulpv2(
                         void* args);



/** -------------------------------------------------------
   @brief         Glue code for parallel matrix transposed matrix multiplication of a 8-bit integer matrices.
   @param[in]     pSrcA      points to first the input matrix
   @param[in]     pSrcB      points to second the input matrix
   @param[in]     M          Height of first matrix
   @param[in]     N          Width of first and heigt of second matrix
   @param[in]     O          Width of second matrix
   @param[in]     nPE        Number of cores to use
   @param[out]    pDstC      Output is written here
   @return        none
*/

void plp_mat_mult_trans_i8_parallel(
                         const int8_t * __restrict__ pSrcA,
                         const int8_t * __restrict__ pSrcB,
                         uint32_t M,
                         uint32_t N,
                         uint32_t O,
                         uint32_t nPE,
                         int32_t * __restrict__ pDstC);



/** -------------------------------------------------------
   @brief         Parallel matrix transposed matrix multiplication of a 8-bit integer matrices for XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i8 struct initialized by plp_mat_mult_i8_parallel
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i8vp_xpulpv2(
                         void* args);

/**
   @brief Floating-point FFT on real input data.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (real data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32(
        const plp_rfft_instance_f32 *S,
        const float32_t * __restrict__ pSrc,
        float32_t * __restrict__ pDst);


/**
   @brief Floating-point FFT on real input data (parallel version).
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (real data)
   @param[in]   nPE     number of parallel processing units
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32_parallel(
        const plp_rfft_instance_f32 *S,
        const float32_t * __restrict__ pSrc,
        const uint32_t nPE,
        float32_t * __restrict__ pDst);

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
        float32_t * __restrict__ pDst);

/**
   @brief  Floating-point FFT on real input data for XPULPV2 extension (parallel version).
   @param[in]   arg       points to an instance of the floating-point FFT structure
   @return      none
*/
void plp_rfft_f32_xpulpv2_parallel(plp_rfft_parallel_arg_f32 *arg);


#endif // __PLP_MATH_H__
