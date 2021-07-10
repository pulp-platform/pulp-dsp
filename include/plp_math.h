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
 *  \mainpage PULP DSP Software Library
 * 
 *   Introduction
 *   ------------
 *
 *   This user manual describes the PULP DSP software library,
 *   a suite of common signal processing functions for use on PULP-based processors.
 *
 *   The library is divided into a number of functions each covering a specific category:
 *   - Basic math functions
 *   - Fast math functions
 *   - Complex math functions
 *   - Filters
 *   - Matrix functions
 *   - Transform functions
 *   - Motor control functions
 *   - Statistical functions
 *   - Support functions
 *   - Interpolation functions
 *
 *   ..
 *
 *
 *   The library has separate functions for operating on 8-bit integers, 16-bit integers,
 *   32-bit integer and 32-bit floating-point values.
 *
 *   The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s):
 *
 *   <pre>
 *   < plp > _ < function name > _ < data type > < precision > < method > _ < isa extension >,
 *   </pre>
 *
 *   with
 *
 *   - data type = {f, i, q} respectively for floats, integers, fixed points
 *   - precision = {32, 16, 8} bits
 *   - method = {s, p} respectively meaning single core or parallel multicore implementation.
 *   - isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.
 *
 *   ..
 *
 *
 *   If the user wants to use a parallel implementation, they can call the glue code functions with '_parallel'
 *   in the function name.
 *
 *
 *   The library is released under Apache v2.0 license. More details can be found in `LICENSE`.
 *
 */

/**
 * @defgroup groupMath Basic Math Functions
*/

/**
 * @defgroup groupCmplxMath Complex Math Functions
 */

/**
 * @defgroup groupFilters Filtering Functions
 */

/**
 * @defgroup groupMatrix Matrix Functions
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

#include "math.h"
#include "rtos_hal.h"

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
typedef struct {
    int32_t *pSrcA;     // pointer to the first vector
    int32_t *pSrcB;     // pointer to the second vector
    uint32_t blkSizePE; // number of samples in each vector
    uint32_t nPE;       // number of processing units
    int32_t *resBuffer; // pointer to result vector
} plp_dot_prod_instance_i32;

/** -------------------------------------------------------
    @brief Instance structure for fixed point parallel dot product.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blkSizePE  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] resBuffer  pointer to the result buffer
*/
typedef struct {
    int32_t *pSrcA;     // pointer to the first vector
    int32_t *pSrcB;     // pointer to the second vector
    uint32_t blkSizePE; // number of samples in each vector
    uint32_t deciPoint; // decimal point for right shift
    uint32_t nPE;       // number of processing units
    int32_t *resBuffer; // pointer to result vector
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
typedef struct {
    const float32_t *pSrcA; // pointer to the first vector
    const float32_t *pSrcB; // pointer to the second vector
    uint32_t blkSizePE;     // number of samples in each vector
    uint32_t nPE;           // number of processing units
    float32_t *resBuffer;   // pointer to result vector
} plp_dot_prod_instance_f32;

/** -------------------------------------------------------
    @struct plp_mult_instance_f32
    @brief Instance structure for float parallel multiplication.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blkSizePE  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] resBuffer  pointer to the result buffer
*/
typedef struct {
    const float32_t *pSrcA; // pointer to the first vector
    const float32_t *pSrcB; // pointer to the second vector
    uint32_t blkSizePE;     // number of samples in each vector
    uint32_t nPE;           // number of processing units
    float32_t *pDst;        // pointer to result vector
} plp_mult_instance_f32;

/** -------------------------------------------------------
    @struct plp_log_instance_f32
    @brief Instance structure for float parallel log.
    @param[in]  pSrc      points to the input vector
    @param[in]  blkSizePE  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pDst       pointer to the output vector
*/
typedef struct {
    const float32_t *pSrc; // pointer to the vector
    uint32_t blkSizePE;     // number of samples in each vector
    uint32_t nPE;           // number of processing units
    float32_t *pDst;        // pointer to result vector
} plp_log_instance_f32;

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
    const int32_t *pSrcA; // pointer to the first vector
    uint32_t srcALen;
    const int32_t *pSrcB; // pointer to the second vector
    uint32_t srcBLen;     // number of samples in each vector
    uint8_t nPE;          // number of processing units
    int32_t *pRes;        // pointer to result vector
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
    const int16_t *pSrcA; // pointer to the first vector
    uint32_t srcALen;
    const int16_t *pSrcB; // pointer to the second vector
    uint32_t srcBLen;     // number of samples in each vector
    uint8_t nPE;          // number of processing units
    int32_t *pRes;        // pointer to result vector
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
    const int8_t *pSrcA; // pointer to the first vector
    uint32_t srcALen;
    const int8_t *pSrcB; // pointer to the second vector
    uint32_t srcBLen;    // number of samples in each vector
    uint8_t nPE;         // number of processing units
    int32_t *pRes;       // pointer to result vector
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
typedef struct {
    uint32_t addOffset;
    uint32_t addLengthfirst;
    uint32_t addLengthsecond;
    uint32_t numVectors;
    uint32_t blockOffset;
    int32_t *pRes;
    uint8_t coresPerVector;
} plp_conv_tree_add_instance;

/**
 * @brief Instance structure for the fixed-point CFFT/CIFFT function.
 * @param[in]   fftLen              length of the FFT
 * @param[in]   pTwiddle            points to the Twiddle factor table
 * @param[in]   pBitRevTable        points to the bit reversal table
 * @param[in]   bitRevTableLength   bit reversal table length
 */
typedef struct {
    uint16_t fftLen;             /*< length of the FFT. */
    const int16_t *pTwiddle;     /*< points to the Twiddle factor table. */
    const int16_t *pBitRevTable; /*< points to the bit reversal table. */
    uint16_t bitRevLength;       /*< bit reversal table length. */
} plp_cfft_instance_q16;

/**
 * @brief Instance structure for the parallel CFFT Q16
 * @param[in]       fft_struct          cfft_q16 struct
 * @param[in/out]   p1                  points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]       ifftFlag            flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]       bitReverseFlag      flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]       deciPoint           decimal point for right shift
 * @param[in]       nPE                 number of cores to use
 */
typedef struct {
    plp_cfft_instance_q16 *S;
    int16_t *p1;
    uint8_t ifftFlag;
    uint8_t bitReverseFlag;
    uint32_t deciPoint;
    uint32_t nPE;
} plp_cfft_instance_q16_parallel;

/**
 * @brief Instance structure for the fixed-point CFFT/CIFFT function.
 * @param[in]   fftLen              length of the FFT
 * @param[in]   pTwiddle            points to the Twiddle factor table
 * @param[in]   pBitRevTable        points to the bit reversal table
 * @param[in]   bitRevTableLength   bit reversal table length
 */
typedef struct {
    uint16_t fftLen;             /*< length of the FFT. */
    const int32_t *pTwiddle;     /*< points to the Twiddle factor table. */
    const int16_t *pBitRevTable; /*< points to the bit reversal table. */
    uint16_t bitRevLength;       /*< bit reversal table length. */
} plp_cfft_instance_q32;

/** -------------------------------------------------------
    @struct plp_fft_instance_f32
    @brief Instance structure for floating-point FFT
    @param[in]  length data length of the FFT
    @param[in]  bitReverseFlag  flag that enables (bitReverseFlagR=1) or disables
    (bitReverseFlagR=0) bit reversal of output
    @param[in]  pTwiddleFactors pointer to the twiddle factors.
    These values must be computed using this formula:
    \f$W_N^k =   e^{-j \frac{\pi}{N} k}\f$,
    where \f$N\f$ is the data length and \f$k\f$ is the index.
    The user must provide \f$\frac{N}{2}\f$ values (\f$k = 0 .. \frac{N}{2}-1\f$).
    @param[in]  pBitReverseLUT  pointer to the lookup table used for the bit reversal of output.
    This table must include \f$N\f$ elements in the range \f$0 .. N-1\f$,
    where each location \f$k\f$ contains the value \f$bitreverse(k)\f$.
*/
typedef struct {
    uint32_t FFTLength;
    uint8_t bitReverseFlag;
    const float32_t *pTwiddleFactors;
    const uint16_t *pBitReverseLUT;
} plp_fft_instance_f32;

/** -------------------------------------------------------
    @struct plp_fft_instance_f32_parallel
    @brief Instance structure for floating-point FFT (parallel version)
    @param[in]  S         pointer to a plp_fft_instance_f32 data structure (FFT parameters)
    @param[in]  pSrc      pointer to the input data buffer
    @param[in]  nPE       number of cores
    @param[out] pDst      pointer to the output data buffer
*/
typedef struct {
    plp_fft_instance_f32 *S;
    const float32_t *pSrc;
    const uint32_t nPE;
    float32_t *pDst;
} plp_fft_instance_f32_parallel;

/** -------------------------------------------------------
    @struct plp_triangular_filter_f32
    @brief structure containing non-zero values of triangular filterbanks
    @param  V               pointer to an array containing all non-zero filter
    			    coefficients of the triangular filters
    @param  firstValue      pointer to array containing indexes of the
    			    first non-zero coefficients of the filters
    @param  filterLength    pointer to array containing lengths of the
    			    non-zero region of each filter
    @param  nFilters        total amount of triangular filters (n_mels)
*/
typedef struct {
    const float32_t *V;
    const uint16_t *firstValue;
    const uint16_t *filterLength;
    const uint8_t nFilters;
} plp_triangular_filter_f32;

/** -------------------------------------------------------
    @struct Complex_type_f32
    @brief Helper type to represent complex values with float32 components.
    @param  re  Real part
    @param  im  Imaginary part
*/
typedef struct {
    float32_t re;
    float32_t im;
} Complex_type_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel matrix multiplication.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    float *__restrict__ pDstC;
} plp_mat_mult_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for 8-bit fix-point parallel matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t shift;
    uint32_t nPE;
    int8_t *__restrict__ pDstC;
} plp_mat_mult_instance_q8;

/** -------------------------------------------------------
 * @brief Instance structure for 16-bit fix-point parallel matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t shift;
    uint32_t nPE;
    int16_t *__restrict__ pDstC;
} plp_mat_mult_instance_q16;

/** -------------------------------------------------------
 * @brief Instance structure for 32-bit fix-point parallel matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t shift;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_instance_q32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel complex matrix matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel complex matrix matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel complex matrix matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel complex matrix matrix multiplication.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    float *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for 8-bit fix-point parallel complex matrix matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t shift;
    uint32_t nPE;
    int8_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_q8;

/** -------------------------------------------------------
 * @brief Instance structure for 16-bit fix-point parallel complex matrix matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t shift;
    uint32_t nPE;
    int16_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_q16;

/** -------------------------------------------------------
 * @brief Instance structure for 32-bit fix-point parallel complex matrix matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t shift;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_instance_q32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix addition.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_add_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix addition.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_add_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix addition.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_add_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel matrix addition.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_add_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix subtraction.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_sub_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix subtraction.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_sub_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix subtraction.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_sub_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel matrix subtraction.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_sub_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix scale.
 */
typedef struct {
    const int8_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    int8_t scaleFactor;
    int32_t shift;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_scale_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix scale.
 */
typedef struct {
    const int16_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    int16_t scaleFactor;
    int32_t shift;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_scale_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix scale.
 */
typedef struct {
    const int32_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    int32_t scaleFactor;
    int32_t shift;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_scale_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel matrix scale.
 */
typedef struct {
    const float *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    float scaleFactor;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_scale_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix transpose.
 */
typedef struct {
    const int8_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_trans_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix transpose.
 */
typedef struct {
    const int16_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_trans_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel matrix transpose.
 */
typedef struct {
    const int32_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_trans_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_fill_I_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_fill_I_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_fill_I_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_fill_I_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for fix-point parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    int32_t fracBits;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_fill_I_instance_q8;

/** -------------------------------------------------------
 * @brief Instance structure for fix-point parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t fracBits;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_fill_I_instance_q16;

/** -------------------------------------------------------
 * @brief Instance structure for fix-point parallel identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t fracBits;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_fill_I_instance_q32;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for strided floating-point parallel matrix multiplication.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    float *__restrict__ pDstC;
} plp_mat_mult_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for strided 8-bit fix-point parallel matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t shift;
    uint32_t nPE;
    int8_t *__restrict__ pDstC;
} plp_mat_mult_stride_instance_q8;

/** -------------------------------------------------------
 * @brief Instance structure for strided 16-bit fix-point parallel matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t shift;
    uint32_t nPE;
    int16_t *__restrict__ pDstC;
} plp_mat_mult_stride_instance_q16;

/** -------------------------------------------------------
 * @brief Instance structure for strided 32-bit fix-point parallel matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t shift;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_stride_instance_q32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel complex strided matrix matrix multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel complex strided matrix matrix multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel complex strided matrix matrix multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel complex strided matrix matrix
 * multiplication.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t nPE;
    float *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for 8-bit fix-point parallel complex strided matrix matrix
 * multiplication.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t shift;
    uint32_t nPE;
    int8_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_q8;

/** -------------------------------------------------------
 * @brief Instance structure for 16-bit fix-point parallel complex strided matrix matrix
 * multiplication.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t shift;
    uint32_t nPE;
    int16_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_q16;

/** -------------------------------------------------------
 * @brief Instance structure for 32-bit fix-point parallel complex strided matrix matrix
 * multiplication.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideC;
    uint32_t shift;
    uint32_t nPE;
    int32_t *__restrict__ pDstC;
} plp_mat_mult_cmplx_stride_instance_q32;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix addition.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_add_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix addition.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_add_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix addition.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_add_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for strided floating-point parallel matrix addition.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_add_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix subtraction.
 */
typedef struct {
    const int8_t *__restrict__ pSrcA;
    const int8_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_sub_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix subtraction.
 */
typedef struct {
    const int16_t *__restrict__ pSrcA;
    const int16_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_sub_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix subtraction.
 */
typedef struct {
    const int32_t *__restrict__ pSrcA;
    const int32_t *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_sub_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for strided floating-point parallel matrix subtraction.
 */
typedef struct {
    const float *__restrict__ pSrcA;
    const float *__restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t strideA;
    uint32_t strideB;
    uint32_t strideY;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_sub_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix scale.
 */
typedef struct {
    const int8_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    int8_t scaleFactor;
    int32_t shift;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_scale_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix scale.
 */
typedef struct {
    const int16_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    int16_t scaleFactor;
    int32_t shift;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_scale_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for strided integer parallel matrix scale.
 */
typedef struct {
    const int32_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    int32_t scaleFactor;
    int32_t shift;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_scale_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for strided floating-point parallel matrix scale.
 */
typedef struct {
    const float *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    float scaleFactor;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_scale_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for 8-bit fix-point parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    int32_t fracBits;
    int8_t *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_q8;

/** -------------------------------------------------------
 * @brief Instance structure for 16-bit fix-point parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    int32_t fracBits;
    int16_t *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_q16;

/** -------------------------------------------------------
 * @brief Instance structure for 32-bit fix-point parallel strided identity matrix creation.
 */
typedef struct {
    uint32_t N;
    uint32_t stride;
    uint32_t nPE;
    int32_t fracBits;
    int32_t *__restrict__ pDst;
} plp_mat_fill_I_stride_instance_q32;

/** -------------------------------------------------------
 * @brief Instance structure for filling an integer matrix in parallel.
 */
typedef struct {
    uint32_t M;
    uint32_t N;
    uint32_t stride;
    int8_t value;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_fill_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for filling an integer matrix in parallel.
 */
typedef struct {
    uint32_t M;
    uint32_t N;
    uint32_t stride;
    int16_t value;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_fill_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for filling an integer matrix in parallel.
 */
typedef struct {
    uint32_t M;
    uint32_t N;
    uint32_t stride;
    int32_t value;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_fill_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for filling a floating-point matrix in parallel.
 */
typedef struct {
    uint32_t M;
    uint32_t N;
    uint32_t stride;
    float value;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_fill_stride_instance_f32;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel strided matrix copy.
 */
typedef struct {
    const int8_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    uint32_t nPE;
    int8_t *__restrict__ pDst;
} plp_mat_copy_stride_instance_i8;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel strided matrix copy.
 */
typedef struct {
    const int16_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    uint32_t nPE;
    int16_t *__restrict__ pDst;
} plp_mat_copy_stride_instance_i16;

/** -------------------------------------------------------
 * @brief Instance structure for integer parallel strided matrix copy.
 */
typedef struct {
    const int32_t *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    uint32_t nPE;
    int32_t *__restrict__ pDst;
} plp_mat_copy_stride_instance_i32;

/** -------------------------------------------------------
 * @brief Instance structure for floating-point parallel strided matrix copy.
 */
typedef struct {
    const float *__restrict__ pSrc;
    uint32_t M;
    uint32_t N;
    uint32_t strideSrc;
    uint32_t strideDst;
    uint32_t nPE;
    float *__restrict__ pDst;
} plp_mat_copy_stride_instance_f32;


typedef struct {

   uint32_t length;

   float32_t *dec_lo; /* decomposition lowpass */
   float32_t *dec_hi; /* decomposition highpass */
} plp_dwt_wavelet_f32;


typedef enum {
    PLP_DWT_MODE_ZERO,
    PLP_DWT_MODE_CONSTANT,
    PLP_DWT_MODE_SYMMETRIC,
    PLP_DWT_MODE_REFELCT,
    PLP_DWT_MODE_PERIODIC,
    PLP_DWT_MODE_ANTISYMMETRIC,
    PLP_DWT_MODE_ANTIREFLECT
} plp_dwt_extension_mode;



/** -------------------------------------------------------
    @brief Glue code for parallel dot product of 32-bit integer vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes     output result returned here
    @return     none
*/

void plp_dot_prod_i32_parallel(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t nPE,
                               int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for parallel dot product of 32-bit fixed point vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes     output result returned here
    @return     none
*/

void plp_dot_prod_q32_parallel(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               uint32_t nPE,
                               int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for parallel dot product of 32-bit float vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  nPE        number of parallel processing units
    @param[out] pRes     output result returned here
    @return     none
*/

void plp_dot_prod_f32_parallel(const float32_t *__restrict__ pSrcA,
                               const float32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t nPE,
                               float32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Parallel dot product with interleaved access of 32-bit integer vectors kernel for XPULPV2
    extension.
    @param[in]  S     points to the instance structure for integer parallel dot product
    @return     none
*/

void plp_dot_prod_i32p_xpulpv2(void *S);

/** -------------------------------------------------------
    @brief Parallel dot product with interleaved access of 32-bit fixed point vectors kernel for
    XPULPV2 extension.
    @param[in]  S     points to the instance structure for fixed point parallel dot product
    @return     none
*/

void plp_dot_prod_q32p_xpulpv2(void *S);

/** -------------------------------------------------------
    @brief Parallel dot product with interleaved access of 32-bit float vectors kernel for XPULPV2
    extension.
    @param[in]  S     points to the instance structure for float parallel dot product
    @return     none
*/

void plp_dot_prod_f32p_xpulpv2(void *S);

/** -------------------------------------------------------
    @brief Glue code for dot product of 32-bit integer vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here
*/
void plp_dot_prod_i32(const int32_t *__restrict__ pSrcA,
                      const int32_t *__restrict__ pSrcB,
                      uint32_t blockSize,
                      int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 32-bit integer vectors kernel for RV32IM extension.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here
*/
void plp_dot_prod_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 32-bit integer vectors kernel for XPULPV2 extension.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here
*/
void plp_dot_prod_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 32-bit fixed point vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here
    @return     none
*/

void plp_dot_prod_q32(const int32_t *__restrict__ pSrcA,
                      const int32_t *__restrict__ pSrcB,
                      uint32_t blockSize,
                      uint32_t deciPoint,
                      int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 32-bit fixed point vectors kernel for RV32IM extension.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here
    @return     none
*/

void plp_dot_prod_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t deciPoint,
                              int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 32-bit fixed point vectors kernel for XPULPV2 extension.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here
    @return     none
*/

void plp_dot_prod_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 32-bit float vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here
    @return     none
*/

void plp_dot_prod_f32(const float32_t *__restrict__ pSrcA,
                      const float32_t *__restrict__ pSrcB,
                      uint32_t blockSize,
                      float32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 32-bit float vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here
    @return     none
*/

void plp_dot_prod_f32s_xpulpv2(const float32_t *__restrict__ pSrcA,
                               const float32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               float32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 32-bit float vectors.
    @param[in]  pSrcA      points to the first input vector
    @param[in]  pSrcB      points to the second input vector
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here
    @return     none
*/

void plp_dot_prod_f32s_rv32im(const float32_t *__restrict__ pSrcA,
                               const float32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               float32_t *__restrict__ pRes);


/** -------------------------------------------------------
    @brief Glue code for dot product of 16-bit integer vectors.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here [32 bit]

    @par Exploiting SIMD instructions
    When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the
    two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/
void plp_dot_prod_i16(const int16_t *pSrcA,
                      const int16_t *pSrcB,
                      uint32_t blockSize,
                      int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Vectorized dot product of 16-bit integer vectors kernel for RV32IM extension.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the
    two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM
    doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Vectorized dot product of 16-bit integer vectors kernel singlecore for XPULPV2 extension.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are
    performed simultaneously on 32 bit vectors.
*/

void plp_dot_prod_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 16-bit fixed point vectors.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are
    performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q16(const int16_t *__restrict__ pSrcA,
                      const int16_t *__restrict__ pSrcB,
                      uint32_t blockSize,
                      uint32_t deciPoint,
                      int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 16-bit fixed point vectors kernel for RV32IM extension.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    When the ISA supports, the 16 bit values are packed two by two into 32 bit vectors and then the
    two dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM
    doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t deciPoint,
                              int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Vectorized dot product of 16-bit fixed point vectors singlecore kernel for XPULPV2
   extension.
    @param[in]  pSrcA      points to the first input vector [16 bit]
    @param[in]  pSrcB      points to the second input vector [16 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two by two into 32 bit vectors and then the two dot products are
    performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 8-bit integer vectors.
    @param[in]  pSrcA      points to the first input vector [8 bit]
    @param[in]  pSrcB      points to the second input vector [8 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the
    four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_i8(const int8_t *__restrict__ pSrcA,
                     const int8_t *__restrict__ pSrcB,
                     uint32_t blockSize,
                     int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Vectorized dot product of 8-bit integer vectors kernel for RV32IM extension.
    @param[in]  pSrcA      points to the first input vector [8] bit]
    @param[in]  pSrcB      points to the second input vector [8 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the
    four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
    RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t blockSize,
                             int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Vectorized dot product of 8-bit integer vectors singlecore kernel for XPULPV2 extension.
    @param[in]  pSrcA      points to the first input vector [8 bit]
    @param[in]  pSrcB      points to the second input vector [8 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    The 8 bit values are packed four by four into 32 bit vectors and then the four dot products are
    performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Glue code for dot product of 8-bit fixed point vectors.
    @param[in]  pSrcA      points to the first input vector [8 bit]
    @param[in]  pSrcB      points to the second input vector [8 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the
    four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q8(const int8_t *__restrict__ pSrcA,
                     const int8_t *__restrict__ pSrcB,
                     uint32_t blockSize,
                     uint32_t deciPoint,
                     int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 8-bit fixed point vectors kernel for RV32IM extension.
    @param[in]  pSrcA      points to the first input vector [8 bit]
    @param[in]  pSrcB      points to the second input vector [8 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the
    four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
    RV32IM doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void plp_dot_prod_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t blockSize,
                             uint32_t deciPoint,
                             int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief Scalar dot product of 8-bit fixed point vectors singlecore kernel for XPULPV2 extension.
    @param[in]  pSrcA      points to the first input vector [8 bit]
    @param[in]  pSrcB      points to the second input vector [8 bit]
    @param[in]  blockSize  number of samples in each vector
    @param[in]  deciPoint  decimal point for right shift
    @param[out] pRes       output result returned here [32 bit]
    @return     none

    @par Exploiting SIMD instructions
    The 8 bit values are packed four by four into 32 bit vectors and then the four dot products are
    performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_dot_prod_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              uint32_t deciPoint,
                              int32_t *__restrict__ pRes);

/** -------------------------------------------------------
   @brief Glue code for absolute value of 32-bit integer vectors.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i32(const int32_t * pSrc,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
   @brief Element-by-element absolute value of 32-bit integer vectors kernel for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i32s_rv32im(const int32_t * pSrc,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
   @brief Element-by-element absolute value of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i32s_xpulpv2(const int32_t * pSrc,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
   @brief Glue code for absolute value of 16-bit integer vectors.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i16(const int16_t * pSrc,
                 int16_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
   @brief Element-by-element absolute value of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i16s_rv32im(const int16_t * pSrc,
                         int16_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
   @brief Element-by-element absolute value of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i16s_xpulpv2(const int16_t * pSrc,
                          int16_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
   @brief Glue code for absolute value of 8-bit integer vectors.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i8(const int8_t * pSrc,
                 int8_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
   @brief Element-by-element absolute value of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i8s_rv32im(const int8_t * pSrc,
                         int8_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
   @brief Element-by-element absolute value of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]     pSrc       points to the input vector
   @param[out]    pDst       points to the output vector
   @param[in]     blockSize  number of samples in each vector
   @return        none
*/

void plp_abs_i8s_xpulpv2(const int8_t * pSrc,
                          int8_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element addition of 32-bit integer vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i32(const int32_t * pSrcA,
                 const int32_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element addition of 32-bit integer vectors kernel for RV32IM extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i32s_rv32im(const int32_t * pSrcA,
                         const int32_t * pSrcB,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element addition of 32-bit integer vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i32s_xpulpv2(const int32_t * pSrcA,
                          const int32_t * pSrcB,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element addition of 16-bit integer vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i16(const int16_t * pSrcA,
                 const int16_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element addition of 16-bit integer vectors kernel for RV32IM extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i16s_rv32im(const int16_t * pSrcA,
                         const int16_t * pSrcB,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element addition of 16-bit integer vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i16s_xpulpv2(const int16_t * pSrcA,
                          const int16_t * pSrcB,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element addition of 8-bit integer vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i8(const int8_t * pSrcA,
                 const int8_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element addition of 8-bit integer vectors kernel for RV32IM extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i8s_rv32im(const int8_t * pSrcA,
                         const int8_t * pSrcB,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element addition of 8-bit integer vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_add_i8s_xpulpv2(const int8_t * pSrcA,
                          const int8_t * pSrcB,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element multiplication of 32-bit integer vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i32(const int32_t * pSrcA,
                 const int32_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 32-bit integer vectors kernel for RV32IM extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i32s_rv32im(const int32_t * pSrcA,
                         const int32_t * pSrcB,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 32-bit integer vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i32s_xpulpv2(const int32_t * pSrcA,
                          const int32_t * pSrcB,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element multiplication of 16-bit integer vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i16(const int16_t * pSrcA,
                 const int16_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 16-bit integer vectors kernel for RV32IM extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i16s_rv32im(const int16_t * pSrcA,
                         const int16_t * pSrcB,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 16-bit integer vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i16s_xpulpv2(const int16_t * pSrcA,
                          const int16_t * pSrcB,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element multiplication of 8-bit integer vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i8(const int8_t * pSrcA,
                 const int8_t * pSrcB,
                 int32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 8-bit integer vectors kernel for RV32IM extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i8s_rv32im(const int8_t * pSrcA,
                         const int8_t * pSrcB,
                         int32_t * pDst,
                         uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 8-bit integer vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_i8s_xpulpv2(const int8_t * pSrcA,
                          const int8_t * pSrcB,
                          int32_t * pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief Glue code for element-by-element multiplication of 32-bit float vectors.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_f32(const float32_t * pSrcA,
                 const float32_t * pSrcB,
                 float32_t * pDst,
                 uint32_t blockSize);

/** -------------------------------------------------------
    @brief Element-by-element multiplication of 32-bit float vectors kernel for XPULPV2 extension.
    @param[in]     pSrcA      points to first input vector
    @param[in]     pSrcB      points to second input vector
    @param[out]    pDst       points to output vector
    @param[in]     blockSize  number of samples in each vector
    @return        none
*/

void plp_mult_f32s_xpulpv2(const float32_t * pSrcA,
                          const float32_t * pSrcB,
                          float32_t * pDst,
                          uint32_t blockSize);

/**
  @brief Glue code for parallel dot product of 32-bit float vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pDst       points to output vector
  @return        none
 */

void plp_mult_f32_parallel(const float32_t *__restrict__ pSrcA,
                               const float32_t *__restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t nPE,
                               float32_t *__restrict__ pDst);
/**
 *   @brief Parallel multiplication with interleaved access of 32-bit float vectors kernel for XPULPV2
 *     extension.
 *       @param[in]  S     points to the instance structure for float parallel multiplication
 *         @return        none
 *          */

void plp_mult_f32p_xpulpv2(void *S);

/**
  @brief Glue code for parallel log of 32-bit float vectors.
  @param[in]  pSrc       points to the input vector
  @param[in]  blockSize  number of samples in each vector
  @param[in]  nPE        number of parallel processing units
  @param[out] pDst       points to output vector
  @return        none
 */

void plp_log_f32_parallel(const float32_t *__restrict__ pSrc,
                               uint32_t blockSize,
                               uint32_t nPE,
                               float32_t *__restrict__ pDst);

/**
  @brief Parallel log with interleaved access of 32-bit float vectors kernel for XPULPV2
  extension.
  @param[in]  S     points to the instance structure for float parallel log
  @return        none
 */

void plp_log_f32p_xpulpv2(void *S);

/** -------------------------------------------------------
    @brief      Glue code of negate the elements of a vector for 32-bit integers
    @param[in]     pSrc       points to input vector.
    @param[out]    pDst       points to output vector.
    @param[in]     blockSize  number of samples in each vector.
    @return     none
*/

void plp_negate_i32(const int32_t * pSrc, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      negate the elements of a vector for 32-bit integers on RV32IM
    @param[in]     pSrc       points to input vector.
    @param[out]    pDst       points to output vector.
    @param[in]     blockSize  number of samples in each vector.
    @return     none
*/

void plp_negate_i32s_rv32im(const int32_t * pSrc, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      negate the elements of a vector for 32-bit integers on XpulpV2
    @param[in]     pSrc       points to input vector.
    @param[out]    pDst       points to output vector.
    @param[in]     blockSize  number of samples in each vector.
    @return     none
*/

void plp_negate_i32s_xpulpv2(const int32_t * pSrc, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of negate the elements of a vector for 16-bit integers
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none
*/

void plp_negate_i16(const int16_t * pSrc, int16_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      negate the elements of a vector for 16-bit integers on RV32IM
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none
*/

void plp_negate_i16s_rv32im(const int16_t * pSrc, int16_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      negate the elements of a vector for 16-bit integers on XpulpV2
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_negate_i16s_xpulpv2(const int16_t * pSrc, int16_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of negate the elements of a vector for 8-bit integers
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none
*/

void plp_negate_i8(const int8_t * pSrc, int8_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      negate the elements of a vector for 8-bit integers on RV32IM
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none
*/

void plp_negate_i8s_rv32im(const int8_t * pSrc, int8_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      negate the elements of a vector for 8-bit integers on XpulpV2
  @param[in]     pSrc       points to input vector.
  @param[out]    pDst       points to output vector.
  @param[in]     blockSize  number of samples in each vector.
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_negate_i8s_xpulpv2(const int8_t * pSrc, int8_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Glue code of negate the elements of a vector for 32-bit floats
    @param[in]     pSrc       points to input vector.
    @param[out]    pDst       points to output vector.
    @param[in]     blockSize  number of samples in each vector.
    @return     none
*/

void plp_negate_f32(const float32_t * pSrc, float32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      negate the elements of a vector for 32-bit floats on XpulpV2
    @param[in]     pSrc       points to input vector.
    @param[out]    pDst       points to output vector.
    @param[in]     blockSize  number of samples in each vector.
    @return     none
*/

void plp_negate_f32s_xpulpv2(const float32_t * pSrc, float32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of add a constant offset to a vector for 32-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i32(const int32_t * pSrc, int32_t offset, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 32-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i32s_rv32im(const int32_t * pSrc, int32_t offset, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 32-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i32s_xpulpv2(const int32_t * pSrc, int32_t offset, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of add a constant offset to a vector for 16-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i16(const int16_t * pSrc, int16_t offset, int16_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 16-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i16s_rv32im(const int16_t * pSrc, int16_t offset, int16_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 16-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_offset_i16s_xpulpv2(const int16_t * pSrc, int16_t offset, int16_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of add a constant offset to a vector for 8-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i8(const int8_t * pSrc, int8_t offset, int8_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 8-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_i8s_rv32im(const int8_t * pSrc, int8_t offset, int8_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 8-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_offset_i8s_xpulpv2(const int8_t * pSrc, int8_t offset, int8_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of add a constant offset to a vector for 32-bit floats
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_f32(const float32_t * pSrc, float32_t offset, float32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      add a constant offset to a vector for 32-bit floats on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     offset     is the offset to be added
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_offset_f32s_xpulpv2(const float32_t * pSrc, float32_t offset, float32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of vector substraction for 32-bit integers
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i32(const int32_t * pSrcA, const int32_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 32-bit integers on RV32IM
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i32s_rv32im(const int32_t * pSrcA, const int32_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 32-bit integers on XpulpV2
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i32s_xpulpv2(const int32_t * pSrcA, const int32_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of vector substraction for 16-bit integers
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i16(const int16_t * pSrcA, const int16_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 16-bit integers on RV32IM
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i16s_rv32im(const int16_t * pSrcA, const int16_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 16-bit integers on XpulpV2
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_sub_i16s_xpulpv2(const int16_t * pSrcA, const int16_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of vector substraction for 8-bit integers
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i8(const int8_t * pSrcA, const int8_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 8-bit integers on RV32IM
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_i8s_rv32im(const int8_t * pSrcA, const int8_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 8-bit integers on XpulpV2
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_sub_i8s_xpulpv2(const int8_t * pSrcA, const int8_t * pSrcB, int32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of vector substraction for 32-bit floats
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_f32(const float32_t * pSrcA, const float32_t * pSrcB, float32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      vector substraction for 32-bit floats on XpulpV2
  @param[in]     pSrcA      points to the first input vector
  @param[in]     pSrcB      points to the second input vector
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_sub_f32s_xpulpv2(const float32_t * pSrcA, const float32_t * pSrcB, float32_t * pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of multiply a vector by a scalar for 32-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i32(const int32_t *__restrict__ pSrc, int32_t scaleFactor, int32_t shift, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 32-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i32s_rv32im(const int32_t *__restrict__ pSrc, int32_t scaleFactor, int32_t shift, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 32-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i32s_xpulpv2(const int32_t *__restrict__ pSrc, int32_t scaleFactor, int32_t shift, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of multiply a vector by a scalar for 16-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i16(const int16_t *__restrict__ pSrc, int16_t scaleFactor, int32_t shift, int16_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 16-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i16s_rv32im(const int16_t *__restrict__ pSrc, int16_t scaleFactor, int32_t shift, int16_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 16-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_scale_i16s_xpulpv2(const int16_t *__restrict__ pSrc, int16_t scaleFactor, int32_t shift, int16_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of multiply a vector by a scalar for 8-bit integers
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i8(const int8_t *__restrict__ pSrc, int8_t scaleFactor, int32_t shift, int8_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 8-bit integers on RV32IM
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_i8s_rv32im(const int8_t *__restrict__ pSrc, int8_t scaleFactor, int32_t shift, int8_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 8-bit integers on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[in]     shift      number of bits to shift the result by
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_scale_i8s_xpulpv2(const int8_t *__restrict__ pSrc, int8_t scaleFactor, int32_t shift, int8_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      Glue code of multiply a vector by a scalar for 32-bit floats
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_f32(const float32_t *__restrict__ pSrc, float32_t scaleFactor, float32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
  @brief      multiply a vector by a scalar for 32-bit floats on XpulpV2
  @param[in]     pSrc       points to the input vector
  @param[in]     scaleFactor Factor to multiply all elements before shifting
  @param[out]    pDst       points to the output vector
  @param[in]     blockSize  number of samples in each vector
  @return     none
*/

void plp_scale_f32s_xpulpv2(const float32_t *__restrict__ pSrc, float32_t scaleFactor, float32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Glue code for filling a constant value into a 32-bit integer vector.
    @param[in]  value      input value to be filled
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_fill_i32(int32_t value, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Fills a constant value into a 32-bit integer vector for RV32IM extension.
    @param[in]  value      input value to be filled
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_fill_i32s_rv32im(int32_t value, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Fills a constant value into a 32-bit integer vector for XPULPV2 extension.
    @param[in]  value      input value to be filled
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_fill_i32s_xpulpv2(int32_t value, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Glue code for copying the elements of a 32-bit integer vector
    @param[in]  pSrc       points to input vector
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_copy_i32(int32_t *__restrict__ pSrc, int32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Copies the elements of a 32-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to input vector
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_copy_i32s_rv32im(int32_t *__restrict__ pSrc,
                          int32_t *__restrict__ pDst,
                          uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Copies the elements of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to input vector
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_copy_i32s_xpulpv2(int32_t *__restrict__ pSrc,
                           int32_t *__restrict__ pDst,
                           uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Glue code for copying the elements of a 32-bit float vector
    @param[in]  pSrc       points to input vector
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_copy_f32(float32_t *__restrict__ pSrc, float32_t *__restrict__ pDst, uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Copies the elements of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to input vector
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_copy_f32s_xpulpv2(float32_t *__restrict__ pSrc,
                           float32_t *__restrict__ pDst,
                           uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Copies the elements of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to input vector
    @param[out] pDst       points to output vector
    @param[in]  blockSize  number of samples in each vector
    @return     none
*/

void plp_copy_f32s_rv32im(float32_t *__restrict__ pSrc,
                           float32_t *__restrict__ pDst,
                           uint32_t blockSize);

/** -------------------------------------------------------
    @brief      Glue code for mean value of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for mean value of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_f32s_xpulpv2(const float *__restrict__ pSrc,
                           uint32_t blockSize,
                           float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for mean value of a 32-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_i32(const int32_t *__restrict__ pSrc, uint32_t blockSize, int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Mean value of a 32-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_i32s_rv32im(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Mean value of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    mean value returned here
    @return     none
*/

void plp_mean_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for mean value of a 16-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_i16(const int16_t *__restrict__ pSrc, uint32_t blockSize, int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Mean value of a 16-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_i16s_rv32im(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Mean value of a 16-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    mean value returned here
    @return     none
*/

void plp_mean_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for mean value of a 8-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_i8(const int8_t *__restrict__ pSrc, uint32_t blockSize, int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Mean value of a 8-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    mean value returned here
    @return     none
*/

void plp_mean_i8s_rv32im(const int8_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Mean value of a 8-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    mean value returned here
    @return     none
*/

void plp_mean_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for max value of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Kernel for max value of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_f32s_xpulpv2(const float *__restrict__ pSrc,
                          uint32_t blockSize,
                          float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for max value of a 32-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_i32(const int32_t *__restrict__ pSrc, uint32_t blockSize, int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Max value of a 32-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_i32s_rv32im(const int32_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Max value of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    max value returned here
    @return     none
*/

void plp_max_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for max value of a 16-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_i16(const int16_t *__restrict__ pSrc, uint32_t blockSize, int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Max value of a 16-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_i16s_rv32im(const int16_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Max value of a 16-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    max value returned here
    @return     none
*/

void plp_max_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for max value of a 8-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_i8(const int8_t *__restrict__ pSrc, uint32_t blockSize, int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Max value of a 8-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    max value returned here
    @return     none
*/

void plp_max_i8s_rv32im(const int8_t *__restrict__ pSrc,
                        uint32_t blockSize,
                        int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Max value of a 8-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    max value returned here
    @return     none
*/

void plp_max_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for min value of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Kernel for min value of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_f32s_xpulpv2(const float *__restrict__ pSrc,
                          uint32_t blockSize,
                          float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for min value of a 32-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_i32(const int32_t *__restrict__ pSrc, uint32_t blockSize, int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Min value of a 32-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_i32s_rv32im(const int32_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Min value of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    min value returned here
    @return     none
*/

void plp_min_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for min value of a 16-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_i16(const int16_t *__restrict__ pSrc, uint32_t blockSize, int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Min value of a 16-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_i16s_rv32im(const int16_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Min value of a 16-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    min value returned here
    @return     none
*/

void plp_min_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for min value of a 8-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_i8(const int8_t *__restrict__ pSrc, uint32_t blockSize, int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Min value of a 8-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    min value returned here
    @return     none
*/

void plp_min_i8s_rv32im(const int8_t *__restrict__ pSrc,
                        uint32_t blockSize,
                        int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Min value of a 8-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    min value returned here
    @return     none
*/

void plp_min_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Kernel for Sum of squares of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_f32s_xpulpv2(const float *__restrict__ pSrc,
                           uint32_t blockSize,
                           float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 32-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_i32(const int32_t *__restrict__ pSrc,
                   uint32_t blockSize,
                   int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 32-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_i32s_rv32im(const int32_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 32-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    Sum of squares returned here
    @return     none
*/

void plp_power_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                            uint32_t blockSize,
                            int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 16-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_i16(const int16_t *__restrict__ pSrc,
                   uint32_t blockSize,
                   int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 16-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_i16s_rv32im(const int16_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 16-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    Sum of squares returned here
    @return     none
*/

void plp_power_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                            uint32_t blockSize,
                            int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 8-bit integer vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_i8(const int8_t *__restrict__ pSrc, uint32_t blockSize, int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 8-bit integer vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_i8s_rv32im(const int8_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 8-bit integer vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes    Sum of squares value returned here
    @return     none
*/

void plp_power_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 32-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_q32(const int32_t *__restrict__ pSrc,
                   uint32_t blockSize,
                   uint32_t fracBits,
                   int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 32-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares value returned here
    @return     none
*/

void plp_power_q32s_rv32im(const int32_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           uint32_t fracBits,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 32-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Sum of squares returned here
    @return     none
*/

void plp_power_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                            uint32_t blockSize,
                            uint32_t fracBits,
                            int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 16-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_q16(const int16_t *__restrict__ pSrc,
                   uint32_t blockSize,
                   uint32_t fracBits,
                   int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 16-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_q16s_rv32im(const int16_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           uint32_t fracBits,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 16-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Sum of squares returned here
    @return     none
*/

void plp_power_q16s_xpulpv2(const int16_t *__restrict__ pSrc,
                            uint32_t blockSize,
                            uint32_t fracBits,
                            int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Sum of squares of a 8-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_q8(const int8_t *__restrict__ pSrc,
                  uint32_t blockSize,
                  uint32_t fracBits,
                  int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 8-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Sum of squares returned here
    @return     none
*/

void plp_power_q8s_rv32im(const int8_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Sum of squares of a 8-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Sum of squares value returned here
    @return     none
*/

void plp_power_q8s_xpulpv2(const int8_t *__restrict__ pSrc,
                           uint32_t blockSize,
                           uint32_t fracBits,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical variance of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Kernel for Statisical variance of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_f32s_xpulpv2(const float *__restrict__ pSrc,
                         uint32_t blockSize,
                         float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical variance of a 32-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_q32(const int32_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical variance of a 32-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance value returned here
    @return     none
*/

void plp_var_q32s_rv32im(const int32_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical variance of a 32-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical variance returned here
    @return     none
*/

void plp_var_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical variance of a 16-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_q16(const int16_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical variance of a 16-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_q16s_rv32im(const int16_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical variance of a 16-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical variance returned here
    @return     none
*/

void plp_var_q16s_xpulpv2(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical variance of a 8-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_q8(const int8_t *__restrict__ pSrc,
                uint32_t blockSize,
                uint32_t fracBits,
                int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical variance of a 8-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical variance returned here
    @return     none
*/

void plp_var_q8s_rv32im(const int8_t *__restrict__ pSrc,
                        uint32_t blockSize,
                        uint32_t fracBits,
                        int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical variance of a 8-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical variance value returned here
    @return     none
*/

void plp_var_q8s_xpulpv2(const int8_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 32-bit floating point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Kernel for Statisical standard deviation of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_f32s_xpulpv2(const float *__restrict__ pSrc,
                         uint32_t blockSize,
                         float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 32-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_q32(const int32_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 32-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation value returned here
    @return     none
*/

void plp_std_q32s_rv32im(const int32_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 32-bit fixed point vector for XPULPV2
    extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical standard deviation returned here
    @return     none
*/

void plp_std_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 16-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_q16(const int16_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 16-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_q16s_rv32im(const int16_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 16-bit fixed point vector for XPULPV2
    extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical standard deviation returned here
    @return     none
*/

void plp_std_q16s_xpulpv2(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 8-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_q8(const int8_t *__restrict__ pSrc,
                uint32_t blockSize,
                uint32_t fracBits,
                int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 8-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_std_q8s_rv32im(const int8_t *__restrict__ pSrc,
                        uint32_t blockSize,
                        uint32_t fracBits,
                        int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 8-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical standard deviation value returned here
    @return     none
*/

void plp_std_q8s_xpulpv2(const int8_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int8_t *__restrict__ pRes);
/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 32-bit floating point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_f32(const float *__restrict__ pSrc, uint32_t blockSize, float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Kernel for Statisical standard deviation of a 32-bit float vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_f32s_xpulpv2(const float *__restrict__ pSrc,
                         uint32_t blockSize,
                         float *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 32-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q32(const int32_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 32-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation value returned here
    @return     none
*/

void plp_rms_q32s_rv32im(const int32_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 32-bit fixed point vector for XPULPV2
    extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 16-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q16(const int16_t *__restrict__ pSrc,
                 uint32_t blockSize,
                 uint32_t fracBits,
                 int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 16-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q16s_rv32im(const int16_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 16-bit fixed point vector for XPULPV2
    extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q16s_xpulpv2(const int16_t *__restrict__ pSrc,
                          uint32_t blockSize,
                          uint32_t fracBits,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for Statisical standard deviation of a 8-bit fixed point vector.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q8(const int8_t *__restrict__ pSrc,
                uint32_t blockSize,
                uint32_t fracBits,
                int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 8-bit fixed point vector for RV32IM extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pResult    Statisical standard deviation returned here
    @return     none
*/

void plp_rms_q8s_rv32im(const int8_t *__restrict__ pSrc,
                        uint32_t blockSize,
                        uint32_t fracBits,
                        int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Statisical standard deviation of a 8-bit fixed point vector for XPULPV2 extension.
    @param[in]  pSrc       points to the input vector
    @param[in]  blockSize  number of samples in input vector
    @param[out] pRes       Statisical standard deviation value returned here
    @return     none
*/

void plp_rms_q8s_xpulpv2(const int8_t *__restrict__ pSrc,
                         uint32_t blockSize,
                         uint32_t fracBits,
                         int8_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for square root of a 32-bit fixed point number.
    @param[in]  in   32-Bit input integer
    @param[out] out  Square root of the input
    @return     none
*/

void plp_sqrt_q32(const int32_t *__restrict__ pSrc,
                  const uint32_t fracBits,
                  int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Square root of a 32-bit fixed point number for XPULPV2 extension.
    @param[in]  in   32-Bit input integer
    @param[out] out  Square root of the input
    @return     none
*/

void plp_sqrt_q32s_rv32im(const int32_t *__restrict__ pSrc,
                          const uint32_t fracBits,
                          int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Square root of a 32-bit fixed point number for XPULPV2 extension.
    @param[in]  in   32-Bit input integer
    @param[out] out  Square root of the input
    @return     none
*/

void plp_sqrt_q32s_xpulpv2(const int32_t *__restrict__ pSrc,
                           const uint32_t fracBits,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Glue code for square root of a 16-bit fixed point number.
    @param[in]  in   16-Bit input integer
    @param[out] out  Square root of the input
    @return     none
*/

void plp_sqrt_q16(const int16_t *__restrict__ pSrc,
                  const uint32_t fracBits,
                  int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Square root of a 16-bit fixed point number for XPULPV2 extension.
    @param[in]  in   16-Bit input integer
    @param[out] out  Square root of the input
    @return     none
*/

void plp_sqrt_q16s_rv32im(const int16_t *__restrict__ pSrc,
                          const uint32_t fracBits,
                          int16_t *__restrict__ pRes);

/** -------------------------------------------------------
    @brief      Square root of a 16-bit fixed point number for XPULPV2 extension.
    @param[in]  in   16-Bit input integer
    @param[out] out  Square root of the input
    @return     none
*/

void plp_sqrt_q16s_xpulpv2(const int16_t *__restrict__ pSrc,
                           const uint32_t fracBits,
                           int16_t *__restrict__ pRes);


/**
   @brief         Glue code for square root of a 32-bit floating point number.
   @param[in]     pSrc       points to the input vector
   @param[out]    pRes    Square root returned here
   @return        none
 */

void plp_sqrt_f32(const float *__restrict__ pSrc, 
                  float *__restrict__ pRes);


/**
   @brief         Kernel for square root of a 32-bit floating point number.
   @param[in]     pSrc       points to the input vector
   @param[out]    pRes    Square root returned here
   @return        none
 */
void plp_sqrt_f32s_xpulpv2(const float *__restrict__ pSrc,
                           float *__restrict__ pRes);


/**
   @brief         Glue code for square root of a 32-bit floating point number.
   @param[in]     pSrc       points to the input vectoro
   @param[out]    pRes    Square root returned here
   @return        none
 */


/**
 * @brief Macros required for SINE and COSINE Fast math approximations
 */

#define FAST_MATH_TABLE_SIZE 512
#define FAST_MATH_Q32_SHIFT (32 - 10)
#define FAST_MATH_Q16_SHIFT (16 - 10)
#define CONTROLLER_Q32_SHIFT (32 - 9)
#define TABLE_SPACING_Q32 0x400000
#define TABLE_SPACING_Q16 0x80

/**
 * @brief      Glue code for q32 cosine function
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     cos(x)
 */

int32_t plp_cos_q32(int32_t x);

/**
 * @brief      q32 cosine function for RV32IM
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     cos(x)
 */

int32_t plp_cos_q32s_rv32im(int32_t x);

/**
 * @brief      q32 cosine function for XPULPV2
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     cos(x)
 */

int32_t plp_cos_q32s_xpulpv2(int32_t x);

/**
 * @brief      Glue code for q16 cosine function
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     cos(x)
 */

int16_t plp_cos_q16(int16_t x);

/**
 * @brief      q16 cosine function for RV32IM
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     cos(x)
 */

int16_t plp_cos_q16s_rv32im(int16_t x);

/**
 * @brief      q16 cosine function for XPULPV2
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     cos(x)
 */

int16_t plp_cos_q16s_xpulpv2(int16_t x);

/**
 * @brief      Glue code for f32 cosine function
 *
 * @param[in]  x     input value in radians
 *
 * @return     cos(x)
 */

float32_t plp_cos_f32(float32_t x);

/**
 * @brief      F32 cosine function for XPULPV2
 *
 * @param[in]  x     input value in radians
 *
 * @return     cos(x)
 */

float32_t plp_cos_f32s_xpulpv2(float32_t x);

/**
 * @brief      Glue code for q32 sine function
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     sin(x)
 */

int32_t plp_sin_q32(int32_t x);

/**
 * @brief      q32 sine function for RV32IM
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     sin(x)
 */

int32_t plp_sin_q32s_rv32im(int32_t x);

/**
 * @brief      q32 sine function for XPULPV2
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     sin(x)
 */

int32_t plp_sin_q32s_xpulpv2(int32_t x);

/**
 * @brief      Glue code for q16 sine function
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     sin(x)
 */

int16_t plp_sin_q16(int16_t x);

/**
 * @brief      q16 sine function for RV32IM
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     sin(x)
 */

int16_t plp_sin_q16s_rv32im(int16_t x);

/**
 * @brief      q16 sine function for XPULPV2
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0,
 * 2*PI)
 *
 * @return     sin(x)
 */

int16_t plp_sin_q16s_xpulpv2(int16_t x);

/**
 * @brief      Glue code for f32 sine function
 *
 * @param[in]  x     input value in radians
 *
 * @return     sin(x)
 */

float32_t plp_sin_f32(float32_t x);

/**
 * @brief      F32 sine function for XPULPV2
 *
 * @param[in]  x     input value in radians
 *
 * @return     sin(x)
 */

float32_t plp_sin_f32s_xpulpv2(float32_t x);

/** -------------------------------------------------------
    @brief Glue code for correlation of 32-bit integer vectors.
    @param[in]  pSrcA   points to the first input vector
    @param[in]  srcALen Length of the first input vector
    @param[in]  pSrcB   points to the second input vector
    @param[in]  srcBLen Length of the second input vector
    @param[out] pRes    output result returned here
    @return     none
*/

void plp_correlate_i32(const int32_t *pSrcA,
                       const uint32_t srcALen,
                       const int32_t *pSrcB,
                       const uint32_t srcBLen,
                       int32_t *pRes);

/** -------------------------------------------------------
    @brief Correlation of 32-bit integer vectors kernel for RV32IM extension.
    @param[in]  pSrcA   points to the first input vector
    @param[in]  srcALen Length of the first input vector
    @param[in]  pSrcB   points to the second input vector
    @param[in]  srcBLen Length of the second input vector
    @param[out] pRes    output result returned here
    @return     none
*/

void plp_correlate_i32s_rv32im(const int32_t *pSrcA,
                               const uint32_t srcALen,
                               const int32_t *pSrcB,
                               const uint32_t srcBLen,
                               int32_t *pRes);

/** -------------------------------------------------------
    @brief Correlation of 32-bit integer vectors kernel for XPULPV2 extension.
    @param[in]  pSrcA   points to the first input vector
    @param[in]  srcALen Length of the first input vector
    @param[in]  pSrcB   points to the second input vector
    @param[in]  srcBLen Length of the second input vector
    @param[out] pRes    output result returned here
    @return     none */

void plp_correlate_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                const uint32_t srcALen,
                                const int32_t *__restrict__ pSrcB,
                                const uint32_t srcBLen,
                                int32_t *__restrict__ pRes);

/** -------------------------------------------------------
  @brief Glue code for correlation of 16-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    result returned here
  @return     none
 */

void plp_correlate_i16(const int16_t *pSrcA,
                       const uint32_t srcALen,
                       const int16_t *pSrcB,
                       const uint32_t srcBLen,
                       int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_i16s_xpulpv2(const int16_t *pSrcA,
                                const uint32_t srcALen,
                                const int16_t *pSrcB,
                                const uint32_t srcBLen,
                                int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_i16s_rv32im(const int16_t *pSrcA,
                               const uint32_t srcALen,
                               const int16_t *pSrcB,
                               const uint32_t srcBLen,
                               int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for correlation of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_correlate_i8(const int8_t *pSrcA,
                      const uint32_t srcALen,
                      const int8_t *pSrcB,
                      const uint32_t srcBLen,
                      int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for correlation (valid) of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_correlate_valid_i8(const int8_t *pSrcA,
                            const uint32_t srcALen,
                            const int8_t *pSrcB,
                            const uint32_t srcBLen,
                            int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_i8s_xpulpv2(const int8_t *pSrcA,
                               const uint32_t srcALen,
                               const int8_t *pSrcB,
                               const uint32_t srcBLen,
                               int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_i8s_rv32im(const int8_t *pSrcA,
                              const uint32_t srcALen,
                              const int8_t *pSrcB,
                              const uint32_t srcBLen,
                              int32_t *pRes);


/** -------------------------------------------------------
    @brief Glue code for correlation of 32-bit integer vectors.
    @param[in]  pSrcA   points to the first input vector
    @param[in]  srcALen Length of the first input vector
    @param[in]  pSrcB   points to the second input vector
    @param[in]  srcBLen Length of the second input vector
    @param[out] pRes    output result returned here
    @return     none
*/

void plp_correlate_q32(const int32_t *pSrcA,
                       const uint32_t srcALen,
                       const int32_t *pSrcB,
                       const uint32_t srcBLen,
		       const uint32_t fracBits,
                       int32_t *pRes);

/** -------------------------------------------------------
    @brief Correlation of 32-bit integer vectors kernel for RV32IM extension.
    @param[in]  pSrcA   points to the first input vector
    @param[in]  srcALen Length of the first input vector
    @param[in]  pSrcB   points to the second input vector
    @param[in]  srcBLen Length of the second input vector
    @param[out] pRes    output result returned here
    @return     none
*/

void plp_correlate_q32s_rv32im(const int32_t *pSrcA,
                               const uint32_t srcALen,
                               const int32_t *pSrcB,
                               const uint32_t srcBLen,
			       const uint32_t fracBits,
                               int32_t *pRes);

/** -------------------------------------------------------
    @brief Correlation of 32-bit integer vectors kernel for XPULPV2 extension.
    @param[in]  pSrcA   points to the first input vector
    @param[in]  srcALen Length of the first input vector
    @param[in]  pSrcB   points to the second input vector
    @param[in]  srcBLen Length of the second input vector
    @param[out] pRes    output result returned here
    @return     none */

void plp_correlate_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                const uint32_t srcALen,
                                const int32_t *__restrict__ pSrcB,
                                const uint32_t srcBLen,
				const uint32_t fracBits,
                                int32_t *__restrict__ pRes);

/** -------------------------------------------------------
  @brief Glue code for correlation of 16-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    result returned here
  @return     none
 */

void plp_correlate_q16(const int16_t *pSrcA,
                       const uint32_t srcALen,
                       const int16_t *pSrcB,
                       const uint32_t srcBLen,
		       const uint32_t fracBits,
                       int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_q16s_xpulpv2(const int16_t *pSrcA,
                                const uint32_t srcALen,
                                const int16_t *pSrcB,
                                const uint32_t srcBLen,
				const uint32_t fracBits,
                                int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_q16s_rv32im(const int16_t *pSrcA,
                               const uint32_t srcALen,
                               const int16_t *pSrcB,
                               const uint32_t srcBLen,
			       const uint32_t fracBits,
                               int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for correlation of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_correlate_q8(const int8_t *pSrcA,
                      const uint32_t srcALen,
                      const int8_t *pSrcB,
                      const uint32_t srcBLen,
		      const uint32_t fracBits,
                      int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for correlation (valid) of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_correlate_valid_q8(const int8_t *pSrcA,
                            const uint32_t srcALen,
                            const int8_t *pSrcB,
                            const uint32_t srcBLen,
			    const uint32_t fracBits,
                            int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_q8s_xpulpv2(const int8_t *pSrcA,
                               const uint32_t srcALen,
                               const int8_t *pSrcB,
                               const uint32_t srcBLen,
			       const uint32_t fracBits,
                               int32_t *pRes);

/** -------------------------------------------------------
   @brief Correlation of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_correlate_q8s_rv32im(const int8_t *pSrcA,
                              const uint32_t srcALen,
                              const int8_t *pSrcB,
                              const uint32_t srcBLen,
			      const uint32_t fracBits,
                              int32_t *pRes);


/** -------------------------------------------------------
  @brief Glue code for convolution of 32-bit integer vectors.
  @param[in]  pSrcA    points to the first input vector
  @param[in]  srcALen  Length of the first input vector
  @param[in]  pSrcB    points to the second input vector
  @param[in]  srcBLen  Length of the second input vector
  @param[out] pRes     result returned here
  @return     none
 */

void plp_conv_i32(const int32_t *pSrcA,
                  const uint32_t srcALen,
                  const int32_t *pSrcB,
                  const uint32_t srcBLen,
                  int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution (valid) of 32-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_valid_i32(const int32_t *pSrcA,
                        const uint32_t srcALen,
                        const int32_t *pSrcB,
                        const uint32_t srcBLen,
                        int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution of 32-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_i32s_rv32im(const int32_t *pSrcA,
                          const uint32_t srcALen,
                          const int32_t *pSrcB,
                          const uint32_t srcBLen,
                          int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                           const uint32_t srcALen,
                           const int32_t *__restrict__ pSrcB,
                           const uint32_t srcBLen,
                           int32_t *__restrict__ pRes);

/** -------------------------------------------------------
   @brief Convolution (valid) of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none */

void plp_conv_valid_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                 const uint32_t srcALen,
                                 const int32_t *__restrict__ pSrcB,
                                 const uint32_t srcBLen,
                                 int32_t *__restrict__ pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution of 16-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_i16(const int16_t *pSrcA,
                  const uint32_t srcALen,
                  const int16_t *pSrcB,
                  const uint32_t srcBLen,
                  int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution (valid) of 16-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_valid_i16(const int16_t *pSrcA,
                        const uint32_t srcALen,
                        const int16_t *pSrcB,
                        const uint32_t srcBLen,
                        int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution (valid with replication) of 16-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_valid_rep_i16(const int16_t *pSrcA,
                            const uint32_t srcALen,
                            const int16_t *pSrcB,
                            const uint32_t srcBLen,
                            int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_i16s_xpulpv2(const int16_t *pSrcA,
                           const uint32_t srcALen,
                           const int16_t *pSrcB,
                           const uint32_t srcBLen,
                           int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution (valid) of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_valid_i16s_xpulpv2(const int16_t *pSrcA,
                                 const uint32_t srcALen,
                                 const int16_t *pSrcB,
                                 const uint32_t srcBLen,
                                 int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution (valid with data replication) of 16-bit integer vectors kernel for XPULPV2
   extension.
   @param[in]  pSrcA   points to the first input vector of the replicated data
   @param[in]  srcALen Number of elements in (unreplicated) vector a
   @param[in]  srcAMem Number of elements between each replication
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_valid_rep_i16s_xpulpv2(const int16_t *pSrcA,
                                     const uint32_t srcALen,
                                     const uint32_t srcAMem,
                                     const int16_t *pSrcB,
                                     const uint32_t srcBLen,
                                     int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_i16s_rv32im(const int16_t *pSrcA,
                          const uint32_t srcALen,
                          const int16_t *pSrcB,
                          const uint32_t srcBLen,
                          int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_i8(const int8_t *pSrcA,
                 const uint32_t srcALen,
                 const int8_t *pSrcB,
                 const uint32_t srcBLen,
                 int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution (valid) of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_valid_i8(const int8_t *pSrcA,
                       const uint32_t srcALen,
                       const int8_t *pSrcB,
                       const uint32_t srcBLen,
                       int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for convolution (valid with data replication) of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector (in L2)
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector (in L2)
  @param[in]  srcBLen Length of the second input vector
  @param[out] pRes    output result returned here (preferably in L1)
  @return     none
 */

void plp_conv_valid_rep_i8(const int8_t *pSrcA,
                           const uint32_t srcALen,
                           const int8_t *pSrcB,
                           const uint32_t srcBLen,
                           int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_i8s_xpulpv2(const int8_t *pSrcA,
                          const uint32_t srcALen,
                          const int8_t *pSrcB,
                          const uint32_t srcBLen,
                          int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution (valid) of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_valid_i8s_xpulpv2(const int8_t *pSrcA,
                                const uint32_t srcALen,
                                const int8_t *pSrcB,
                                const uint32_t srcBLen,
                                int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution (valid with data replication) of 8-bit integer vectors kernel for XPULPV2
   extension.
   @param[in]  pSrcA   points to the first input vector of the replicated data
   @param[in]  srcALen Number of elements in (unreplicated) vector a
   @param[in]  srcAMem Number of elements between each replication
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_valid_rep_i8s_xpulpv2(const int8_t *pSrcA,
                                    const uint32_t srcALen,
                                    const uint32_t srcAMem,
                                    const int8_t *pSrcB,
                                    const uint32_t srcBLen,
                                    int32_t *pRes);

/** -------------------------------------------------------
   @brief Convolution of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA   points to the first input vector
   @param[in]  srcALen Length of the first input vector
   @param[in]  pSrcB   points to the second input vector
   @param[in]  srcBLen Length of the second input vector
   @param[out] pRes    output result returned here
   @return     none
*/

void plp_conv_i8s_rv32im(const int8_t *pSrcA,
                         const uint32_t srcALen,
                         const int8_t *pSrcB,
                         const uint32_t srcBLen,
                         int32_t *pRes);

/** -------------------------------------------------------
  @brief Glue code for parallel convolution of 32-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[in]  nPE     Number of cores to compute on
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_i32_parallel(const int32_t *pSrcA,
                           const uint32_t srcALen,
                           const int32_t *pSrcB,
                           const uint32_t srcBLen,
                           const uint8_t nPE,
                           int32_t *pRes);

/** -------------------------------------------------------
  @brief Setup code for parallel convolution of 32-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i32 struct initialized by
                             plp_conv_i32_parallel
  @return     none
 */

void plp_conv_i32p_xpulpv2(void *task_args);

/** -------------------------------------------------------
  @brief Glue code for parallel convolution of 16-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[in]  nPE     Number of cores to compute on
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_i16_parallel(const int16_t *pSrcA,
                           const uint32_t srcALen,
                           const int16_t *pSrcB,
                           const uint32_t srcBLen,
                           const uint8_t nPE,
                           int32_t *pRes);
/** -------------------------------------------------------
  @brief Setup code for parallel convolution of 16-bit integer vectors.
  @param[in]  task_args  pointer to plp_conv_instance_i16 struct initialized by
                         plp_conv_i16_parallel
  @return     none
 */

void plp_conv_i16p_xpulpv2(void *task_args);

/** -------------------------------------------------------
  @brief Glue code for parallel convolution of 8-bit integer vectors.
  @param[in]  pSrcA   points to the first input vector
  @param[in]  srcALen Length of the first input vector
  @param[in]  pSrcB   points to the second input vector
  @param[in]  srcBLen Length of the second input vector
  @param[in]  nPE     Number of cores to compute on
  @param[out] pRes    output result returned here
  @return     none
 */

void plp_conv_i8_parallel(const int8_t *pSrcA,
                          const uint32_t srcALen,
                          const int8_t *pSrcB,
                          const uint32_t srcBLen,
                          const uint8_t nPE,
                          int32_t *pRes);
/** -------------------------------------------------------
  @brief Setup code for parallel convolution of 8-bit integer vectors.
  @param[in]  task_args  pointer to plp_conv_instance_i8 struct initialized by
                         plp_conv_i8_parallel
  @return     none
 */

void plp_conv_i8p_xpulpv2(void *task_args);

/** -------------------------------------------------------
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] nPE Number of processing cores
   @param[in] srcALen Length of the first original input vector
   @param[in] srcBLen Length of the second original input vector
   @param[in] resultsBuffer resultsBuffer array from plp_conv_i[XX]_parallel
   @return none
*/

void plp_conv_parallel_OLA(uint32_t nPE,
                           uint32_t srcALen,
                           uint32_t srcBLen,
                           int32_t *resultsBuffer);

/** -------------------------------------------------------
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] task_args  Holds the plp_conv_tree_add_instance that describes the vector parameters
   @return none
*/
void plp_conv_parallel_OLA_kernel(void *task_args);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i32(const int32_t *__restrict__ pSrcA,
                      const int32_t *__restrict__ pSrcB,
                      uint32_t M,
                      uint32_t N,
                      uint32_t O,
                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 32-bit integer matrices for RV32IM extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 32-bit integer matrices for XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 16-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i16(const int16_t *__restrict__ pSrcA,
                      const int16_t *__restrict__ pSrcB,
                      uint32_t M,
                      uint32_t N,
                      uint32_t O,
                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 16-bit integer matrices for RV32IM extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 16-bit integer matrices for XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 8-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i8(const int8_t *__restrict__ pSrcA,
                     const int8_t *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     uint32_t O,
                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 8-bit integer matrices for RV32IM extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 8-bit integer matrices for XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i32_parallel(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t nPE,
                               int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel matrix matrix multiplication of a 32-bit integer matrices for XPULPV2
               extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i32 struct initialized by
                     plp_mat_mult_i32_parallel
   @return     none
*/

void plp_mat_mult_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 16-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i16_parallel(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t nPE,
                               int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 16-bit integer matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_i16 struct initialized by
                      plp_mat_mult_i16_parallel
    @return     none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
    performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 8-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_i8_parallel(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              uint32_t nPE,
                              int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 32-bit floating-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_f32(const float *__restrict__ pSrcA,
                      const float *__restrict__ pSrcB,
                      uint32_t M,
                      uint32_t N,
                      uint32_t O,
                      float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 32-bit floating-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_f32s_xpulpv2(const float *__restrict__ pSrcA,
                               const float *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 32-bit floating-point
   matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_f32_parallel(const float *__restrict__ pSrcA,
                               const float *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t nPE,
                               float *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel matrix multiplication of 32-bit floating-point matrices kernel for XPULPV2
                extension.
    @param[in]  args  pointer to plp_mat_mult_instance_f32 struct initialized by
                      plp_mat_mult_f32_parallel
    @return     none
*/

void plp_mat_mult_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Parallel matrix multiplication of 8-bit integer matrices kernel for XPULPV2
               extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i8 struct initialized by
                     plp_mat_mult_i8_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 32-bit fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_q32(const int32_t *__restrict__ pSrcA,
                      const int32_t *__restrict__ pSrcB,
                      uint32_t M,
                      uint32_t N,
                      uint32_t O,
                      uint32_t shift,
                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 32-bit fix-point
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_q32_parallel(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t shift,
                               uint32_t nPE,
                               int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 32-bit fix-point matrices for RV32IM extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              uint32_t shift,
                              int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 32-bit fix-point matrices for XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t shift,
                               int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 32-bit fix-point matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_q32 struct initialized by
                      plp_mat_mult_q32_parallel
    @return     none
*/

void plp_mat_mult_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 16-bit fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_q16(const int16_t *__restrict__ pSrcA,
                      const int16_t *__restrict__ pSrcB,
                      uint32_t M,
                      uint32_t N,
                      uint32_t O,
                      uint32_t shift,
                      int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 16-bit fix-point
  matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_q16_parallel(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t shift,
                               uint32_t nPE,
                               int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 16-bit fix-point matrices for RV32IM extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              uint32_t shift,
                              int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 16-bit fix-point matrices for XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                               const int16_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               uint32_t shift,
                               int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 16-bit fix-point matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_q16 struct initialized by
                      plp_mat_mult_q16_parallel
    @return     none
*/

void plp_mat_mult_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix matrix multiplication of a 8-bit fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_q8(const int8_t *__restrict__ pSrcA,
                     const int8_t *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     uint32_t O,
                     uint32_t shift,
                     int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 8-bit fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_q8_parallel(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              uint32_t shift,
                              uint32_t nPE,
                              int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 8-bit fix-point matrices for RV32IM extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t shift,
                             int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix matrix multiplication of a 8-bit fix-point matrices for XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              uint32_t shift,
                              int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 8-bit fix-point matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_q8 struct initialized by
                      plp_mat_mult_q8_parallel
    @return     none
*/

void plp_mat_mult_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 32-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i32(const int32_t *__restrict__ pSrcA,
                            const int32_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 32-bit integers on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                    const int32_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 32-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i32_parallel(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_i32 struct initialized by
                    plp_mat_mult_cmplx_i32_parallel
  @return     none
*/

void plp_mat_mult_cmplx_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 16-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 16-bit integers on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                    const int16_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 16-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i16_parallel(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_i16 struct initialized by
                    plp_mat_mult_cmplx_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 8-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i8(const int8_t *__restrict__ pSrcA,
                           const int8_t *__restrict__ pSrcB,
                           uint32_t M,
                           uint32_t N,
                           uint32_t O,
                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 8-bit integers on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                   const int8_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 8-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_i8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t nPE,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_i8 struct initialized by
                    plp_mat_mult_cmplx_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_f32(const float *__restrict__ pSrcA,
                            const float *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_f32_parallel(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_f32 struct initialized by
                    plp_mat_mult_cmplx_f32_parallel
  @return     none
*/

void plp_mat_mult_cmplx_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 32-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q32(const int32_t *__restrict__ pSrcA,
                            const int32_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            uint32_t shift,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 32-bit fix-point on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                    const int32_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 32-bit fix-point on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 32-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q32_parallel(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 32-bit fix-point on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_q32 struct initialized by
                    plp_mat_mult_cmplx_q32_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 16-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            uint32_t shift,
                            int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 16-bit fix-point on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                    const int16_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 16-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q16_parallel(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     uint32_t nPE,
                                     int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_q16 struct initialized by
                    plp_mat_mult_cmplx_q16_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix matrix multiplication for complex 8-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q8(const int8_t *__restrict__ pSrcA,
                           const int8_t *__restrict__ pSrcB,
                           uint32_t M,
                           uint32_t N,
                           uint32_t O,
                           uint32_t shift,
                           int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 8-bit fix-point on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                   const int8_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t shift,
                                   int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Matrix matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix matrix multiplication for complex 8-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape NxO
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and height of matrix SrcB
  @param[in]  O     Width of matrix SrcB and DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_q8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    uint32_t nPE,
                                    int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_q8 struct initialized by
                    plp_mat_mult_cmplx_q8_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 32-bit integer
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i32(const int32_t *__restrict__ pSrcA,
                            const int32_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix transposed matrix multiplication of a 32-bit integer matrices for RV32IM
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                    const int32_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix transposed matrix multiplication of a 32-bit integer matrices for XPULPV2
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 16-bit integer
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix transposed matrix multiplication of a 16-bit integer matrices for RV32IM
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                    const int16_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix transposed matrix multiplication of a 16-bit integer matrices for XPULPV2
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 8-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i8(const int8_t *__restrict__ pSrcA,
                           const int8_t *__restrict__ pSrcB,
                           uint32_t M,
                           uint32_t N,
                           uint32_t O,
                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix transposed matrix multiplication of a 8-bit integer matrices for RV32IM
   extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                   const int8_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Matrix transposed matrix multiplication of a 8-bit integer matrices for XPULPV2
   extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i32_parallel(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel matrix transposed matrix multiplication of a 32-bit integer matrices for
               RV32IM extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i32 struct initialized by
                     plp_mat_mult_i32_parallel
   @return     none
*/

void plp_mat_mult_trans_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix transposed matrix multiplication of a 16-bit integer
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i16_parallel(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel matrix transposed matrix multiplication of a 16-bit integer matrices for
               XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i16 struct initialized by
                     plp_mat_mult_i16_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix transposed matrix multiplication of a 8-bit integer
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_i8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t nPE,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel matrix transposed matrix multiplication of a 8-bit integer matrices for
               XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i8 struct initialized by
                     plp_mat_mult_i8_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 32-bit fix-point
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_trans_q32(const int32_t *__restrict__ pSrcA,
                            const int32_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            uint32_t shift,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix transposed matrix multiplication of a 32-bit
               fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_trans_q32_parallel(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 32-bit fix-point matrices for RV32IM
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_trans_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                    const int32_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 32-bit fix-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_trans_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel matrix transposed matrix multiplication of 32-bit fix-point matrices kernel
                for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_q32 struct initialized by
                      plp_mat_mult_trans_q32_parallel
    @return     none
*/

void plp_mat_mult_trans_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 16-bit fix-point
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_q16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            uint32_t shift,
                            int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix transposed matrix multiplication of a 16-bit
               fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_q16_parallel(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     uint32_t nPE,
                                     int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 16-bit fix-point matrices for RV32IM
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                    const int16_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 16-bit fix-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t shift,
                                     int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel matrix transposed matrix multiplication of 16-bit fix-point matrices kernel
                for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_q16 struct initialized by
                      plp_mat_mult_trans_q16_parallel
    @return     none
*/

void plp_mat_mult_trans_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 8-bit fix-point
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_q8(const int8_t *__restrict__ pSrcA,
                           const int8_t *__restrict__ pSrcB,
                           uint32_t M,
                           uint32_t N,
                           uint32_t O,
                           uint32_t shift,
                           int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix transposed matrix multiplication of a 8-bit
               fix-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_q8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    uint32_t nPE,
                                    int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 8-bit fix-point matrices for RV32IM
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                   const int8_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t shift,
                                   int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 8-bit fix-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  shift Amount to shift the result of each multiplication.
   @param[out] pDstC Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t shift,
                                    int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel matrix transposed matrix multiplication of 8-bit fix-point matrices kernel
                for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_q8 struct initialized by
                      plp_mat_mult_trans_q8_parallel
    @return     none
*/

void plp_mat_mult_trans_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for matrix transposed matrix multiplication of a 32-bit floating-point
               matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_f32(const float *__restrict__ pSrcA,
                            const float *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      matrix transposed matrix multiplication of a 32-bit floating-point matrices for
               XPULPV2 extension.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel matrix transposed matrix multiplication of a 32-bit
               floating-point matrices.
   @param[in]  pSrcA points to first the input matrix
   @param[in]  pSrcB points to second the input matrix
   @param[in]  M     Height of first matrix
   @param[in]  N     Width of first and heigt of second matrix
   @param[in]  O     Width of second matrix
   @param[in]  nPE   Number of cores to use
   @param[out] pDstC Output is written here
   @return     none
*/

void plp_mat_mult_trans_f32_parallel(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t nPE,
                                     float *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel matrix transposed matrix multiplication of 32-bit floating-point matrices
                kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_instance_f32 struct initialized by
                      plp_mat_mult_trans_f32_parallel
    @return     none
*/

void plp_mat_mult_trans_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 32-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i32(const int32_t *__restrict__ pSrcA,
                                  const int32_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 32-bit integers on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                          const int32_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 32-bit
              integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i32_parallel(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t nPE,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_i32 struct initialized by
                    plp_mat_mult_trans_cmplx_i32_parallel
  @return     none
*/

void plp_mat_mult_trans_cmplx_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 16-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i16(const int16_t *__restrict__ pSrcA,
                                  const int16_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 16-bit integers on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                          const int16_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 16-bit
              integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i16_parallel(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t nPE,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_i16 struct initialized by
                    plp_mat_mult_trans_cmplx_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 8-bit integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i8(const int8_t *__restrict__ pSrcA,
                                 const int8_t *__restrict__ pSrcB,
                                 uint32_t M,
                                 uint32_t N,
                                 uint32_t O,
                                 int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 8-bit integers on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                         const int8_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 8-bit
              integers
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_i8_parallel(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t nPE,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_i8 struct initialized by
                    plp_mat_mult_trans_cmplx_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_f32(const float *__restrict__ pSrcA,
                                  const float *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                           const float *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_f32_parallel(const float *__restrict__ pSrcA,
                                           const float *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t nPE,
                                           float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_f32 struct initialized by
                    plp_mat_mult_trans_cmplx_f32_parallel
  @return     none
*/

void plp_mat_mult_trans_cmplx_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 32-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q32(const int32_t *__restrict__ pSrcA,
                                  const int32_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  uint32_t shift,
                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 32-bit fix-point on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                          const int32_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t shift,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 32-bit fix-point on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t shift,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 32-bit
              fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q32_parallel(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t shift,
                                           uint32_t nPE,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 32-bit fix-point on
              XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_q32 struct initialized by
                    plp_mat_mult_trans_cmplx_q32_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 16-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q16(const int16_t *__restrict__ pSrcA,
                                  const int16_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  uint32_t shift,
                                  int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 16-bit fix-point on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                          const int16_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t shift,
                                          int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t shift,
                                           int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 16-bit
              fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q16_parallel(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t shift,
                                           uint32_t nPE,
                                           int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 16-bit fix-point on
              XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_q16 struct initialized by
                    plp_mat_mult_trans_cmplx_q16_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of matrix transpose matrix multiplication for complex 8-bit fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q8(const int8_t *__restrict__ pSrcA,
                                 const int8_t *__restrict__ pSrcB,
                                 uint32_t M,
                                 uint32_t N,
                                 uint32_t O,
                                 uint32_t shift,
                                 int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 8-bit fix-point on RV32IM
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                         const int8_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t shift,
                                         int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      matrix transpose matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t shift,
                                          int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel matrix transpose matrix multiplication for complex 8-bit
              fix-point
  @param[in]  pSrcA Points to the first input matrix of shape MxN
  @param[in]  pSrcB Points to the second input matrix of shape OxN
  @param[in]  M     Height of matrix SrcA and DstC
  @param[in]  N     Width of matrix SrcA and SrcB
  @param[in]  O     Height of matrix SrcB and width of matrix DstC
  @param[in]  shift Amount to shift the result of each multiplication ot the right
  @param[in]  nPE   Number of cores to use for computation
  @param[out] pDstC Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_q8_parallel(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t shift,
                                          uint32_t nPE,
                                          int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel matrix transpose matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  args  pointer to plp_mat_mult_cmplx_instance_q8 struct initialized by
                    plp_mat_mult_trans_cmplx_q8_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_q8p_xpulpv2(void *args);

/**
 * @brief      Glue code for complex magnitude calculation in float32
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_f32(const float32_t *pSrc,
                       float32_t *pRes,
                       uint32_t numSamples);

/**
 * @brief      complex magnitude for float32 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_f32s_xpulpv2(const float32_t *pSrc,
                                float32_t *pRes,
                                uint32_t numSamples);

/**
 * @brief      Glue code for complex magnitude calculation for 32 bit fixpoint
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_q32(const int32_t *pSrc,
                       const uint32_t fracBits,
                       int32_t *pRes,
                       uint32_t numSamples);

/**
 * @brief      complex magnitude for q32 on RV32IM
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_q32s_rv32im(const int32_t *pSrc,
                               const uint32_t fracBits,
                               int32_t *pRes,
                               uint32_t numSamples);

/**
 * @brief      complex magnitude for q32 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_q32s_xpulpv2(const int32_t *pSrc,
                                const uint32_t fracBits,
                                int32_t *pRes,
                                uint32_t numSamples);

/**
 * @brief      Glue code for complex magnitude calculation for 8 bit fixpoint
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(8-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_q8(const int8_t *pSrc,
                       const uint32_t fracBits,
                       int8_t *pRes,
                       uint32_t numSamples);

/**
 * @brief      complex magnitude for q8 on RV32IM
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(8-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_q8s_rv32im(const int8_t *pSrc,
                               const uint32_t fracBits,
                               int8_t *pRes,
                               uint32_t numSamples);

/**
 * @brief      complex magnitude for q8 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(8-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_q8s_xpulpv2(const int8_t *pSrc,
                                const uint32_t fracBits,
                                int8_t *pRes,
                                uint32_t numSamples);

/**
 * @brief      Glue code for complex magnitude calculation in 16-bit integer
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i16(const int16_t *pSrc,
                       int16_t *pRes,
                       uint32_t numSamples);

/**
 * @brief      complex magnitude for i16 on RV32IM
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i16s_rv32im(const int16_t *pSrc,
                               int16_t *pRes,
                               uint32_t numSamples);

/**
 * @brief      complex magnitude for i16 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i16s_xpulpv2(const int16_t *pSrc,
                                int16_t *pRes,
                                uint32_t numSamples);

/**
 * @brief      Glue code for complex magnitude calculation in 32-bit integer
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i32(const int32_t *pSrc,
                       int32_t *pRes,
                       uint32_t numSamples);

/**
 * @brief      complex magnitude for i32 on RV32IM
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i32s_rv32im(const int32_t *pSrc,
                               int32_t *pRes,
                               uint32_t numSamples);

/**
 * @brief      complex magnitude for i32 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i32s_xpulpv2(const int32_t *pSrc,
                                int32_t *pRes,
                                uint32_t numSamples);

/**
 * @brief      Glue code for complex magnitude calculation in 8-bit integer
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i8(const int8_t *pSrc,
                      int8_t *pRes,
                      uint32_t numSamples);

/**
 * @brief      complex magnitude for i8 on RV32IM
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i8s_rv32im(const int8_t *pSrc,
                              int8_t *pRes,
                              uint32_t numSamples);

/**
 * @brief      complex magnitude for i8 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number samples
 */

void plp_cmplx_mag_i8s_xpulpv2(const int8_t *pSrc,
                               int8_t *pRes,
                               uint32_t numSamples);

/**
 * @brief      Glue code for complex magnitude calculation in 16-bit quantized integer
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number of samples
 */

void plp_cmplx_mag_q16(const int16_t *pSrc,
                       const uint32_t fracBits,
                       int16_t *pRes,
                       uint32_t numSamples);

/**
 * @brief      complex magnitude for q16 on RV32IM
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number of samples
 */

void plp_cmplx_mag_q16s_rv32im(const int16_t *pSrc,
                               const uint32_t fracBits,
                               int16_t *pRes,
                               uint32_t numSamples);

/**
 * @brief      complex magnitude for q16 on XPULPV2
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number of samples
 */

void plp_cmplx_mag_q16s_xpulpv2(const int16_t *pSrc,
                                const uint32_t fracBits,
                                int16_t *pRes,
                                uint32_t numSamples);

/**
  @brief      In-place 16 bit reversal function for RV32IM
  @param[in,out] pSrc        points to in-place buffer of unknown 16-bit data type
  @param[in]  bitRevLen   bit reversal table length
  @param[in]  pBitRevTab  points to bit reversal table
  @return     none
*/

void plp_bitreversal_16s_rv32im(uint16_t *pSrc,
                                const uint16_t bitRevLen,
                                const uint16_t *pBitRevTab);

/**
  @brief      In-place 16 bit reversal function for XPULPV2
  @param[in,out] pSrc        points to in-place buffer of unknown 16-bit data type
  @param[in]  bitRevLen   bit reversal table length
  @param[in]  pBitRevTab  points to bit reversal table
  @return     none
*/

void plp_bitreversal_16s_xpulpv2(uint16_t *pSrc,
                                 const uint16_t bitRevLen,
                                 const uint16_t *pBitRevTab);

/**
  @brief         In-place 16 bit reversal function.
  @param[in,out] pSrc        points to in-place buffer of unknown 16-bit data type
  @param[in]     bitRevLen   bit reversal table length
  @param[in]     pBitRevTab  points to bit reversal table
  @param[in]     nPE         number of cores
  @return        none
*/

void plp_bitreversal_16p_xpulpv2(uint16_t *pSrc,
                                 const uint16_t bitRevLen,
                                 const uint16_t *pBitRevTab,
                                 uint32_t nPE);

/**
 * @brief      Glue code for quantized 16 bit complex fast fourier transform
 *
 * Fixed point units input -> output dependent on length:
 * len=16:    Q1.15 -> Q5.11
 * len=32:    Q1.15 -> Q6.10
 * len=64:    Q1.15 -> Q7.9
 * len=128:   Q1.15 -> Q8.8
 * len=256:   Q1.15 -> Q9.7
 * len=512:   Q1.15 -> Q10.6
 * len=1024:  Q1.15 -> Q11.5
 * len=2048:  Q1.15 -> Q12.4
 * len=4096:  Q1.15 -> Q13.3
 *
 * @param[in]  S               points to an instance of the 16bit quantized CFFT structure
 * @param[in,out] p1              points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  deciPoint       decimal point for right shift
 */

void plp_cfft_q16(const plp_cfft_instance_q16 *S,
                  int16_t *p1,
                  uint8_t ifftFlag,
                  uint8_t bitReverseFlag,
                  uint32_t deciPoint);

/**
 * @brief      Glue code for quantized 16 bit complex fast fourier transform
 *
 * Fixed point units input -> output dependent on length:
 * len=16:    Q1.15 -> Q5.11
 * len=32:    Q1.15 -> Q6.10
 * len=64:    Q1.15 -> Q7.9
 * len=128:   Q1.15 -> Q8.8
 * len=256:   Q1.15 -> Q9.7
 * len=512:   Q1.15 -> Q10.6
 * len=1024:  Q1.15 -> Q11.5
 * len=2048:  Q1.15 -> Q12.4
 * len=4096:  Q1.15 -> Q13.3
 *
 * @param[in]  S               points to an instance of the 16bit quantized CFFT structure
 * @param[in,out] p1           points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  deciPoint       decimal point for right shift
 * @param[in]  nPE             Number of cores to use
 */

void plp_cfft_q16_parallel(const plp_cfft_instance_q16 *S,
                           int16_t *p1,
                           uint8_t ifftFlag,
                           uint8_t bitReverseFlag,
                           uint32_t deciPoint,
                           uint32_t nPE);

/**
 * @brief      Quantized 16 bit complex fast fourier transform for RV32IM
 * @param[in]  S               points to an instance of the 16bit quantized CFFT structure
 * @param[in,out] p1              points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  deciPoint       decimal point for right shift
 */

void plp_cfft_q16s_rv32im(const plp_cfft_instance_q16 *S,
                          int16_t *p1,
                          uint8_t ifftFlag,
                          uint8_t bitReverseFlag,
                          uint32_t deciPoint);

/**
 * @brief      Quantized 16 bit complex fast fourier transform for XPULPV2
 * @param[in]  S               points to an instance of the 16bit quantized CFFT structure
 * @param[in,out] p1              points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  deciPoint       decimal point for right shift
 */

void plp_cfft_q16s_xpulpv2(const plp_cfft_instance_q16 *S,
                           int16_t *p1,
                           uint8_t ifftFlag,
                           uint8_t bitReverseFlag,
                           uint32_t deciPoint);

/**
 * @brief      Parallel quantized 16 bit complex fast fourier transform for XPULPV2
 * @param[in]   args    points to the plp_cfft_instance_q16_parallel
 */

void plp_cfft_q16p_xpulpv2(void *args);

/**
  @brief      In-place 32 bit reversal function for RV32IM
  @param[in,out] pSrc        points to in-place buffer of unknown 32-bit data type
  @param[in]  bitRevLen   bit reversal table length
  @param[in]  pBitRevTab  points to bit reversal table
  @return     none
*/

void
plp_bitreversal_32s_rv32im(uint32_t *pSrc, const uint16_t bitRevLen, const uint16_t *pBitRevTab);

/**
  @brief      In-place 32 bit reversal function for XPULPV2
  @param[in,out] pSrc        points to in-place buffer of unknown 32-bit data type
  @param[in]  bitRevLen   bit reversal table length
  @param[in]  pBitRevTab  points to bit reversal table
  @return     none
*/

void
plp_bitreversal_32s_xpulpv2(uint32_t *pSrc, const uint16_t bitRevLen, const uint16_t *pBitRevTab);

/**
 * @brief      Glue code for quantized 32-bit complex fast fourier transform
 * 
 * Fixed point units input -> output dependent on length:
 * len=16:    Q1.31 -> Q5.27
 * len=32:    Q1.31 -> Q6.26
 * len=64:    Q1.31 -> Q7.25
 * len=128:   Q1.31 -> Q8.24
 * len=256:   Q1.31 -> Q9.23
 * len=512:   Q1.31 -> Q10.22
 * len=1024:  Q1.31 -> Q11.21
 * len=2048:  Q1.31 -> Q12.20
 * len=4096:  Q1.31 -> Q13.19
 *
 * @param[in]  S               points to an instance of the 32bit quantized CFFT structure
 * @param      p1              points to the complex data buffer of size <code>2*fftLen</code>. Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forwart (ifftFlag=0) or inverse (ifftFlag=1)
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  fracBits        decimal point for right shift (input format Q(32-fracBits).fracBits)
 */

void plp_cfft_q32(const plp_cfft_instance_q32 *S,
                      int32_t *p1,
                      uint8_t ifftFlag,
                      uint8_t bitReverseFlag,
                      uint32_t fracBits);

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
                      uint32_t fracBits);

/**
 * @brief      Quantized 32-bit complex fast fourier transform for XPULPV2
 *
 * @param[in]  S               points to an instance of the 32bit quantized CFFT structure
 * @param      p1              points to the complex data buffer of size <code>2*fftLen</code>. Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forwart (ifftFlag=0) or inverse (ifftFlag=1)
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  fracBits        decimal point for right shift (input format Q(32-fracBits).fracBits)
 */

void plp_cfft_q32s_xpulpv2(const plp_cfft_instance_q32 *S,
                      int32_t *p1,
                      uint8_t ifftFlag,
                      uint8_t bitReverseFlag,
                      uint32_t fracBits);

/**
   @brief Floating-point FFT on real input data.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (real data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32(const plp_fft_instance_f32 *S,
                  const float32_t *__restrict__ pSrc,
                  float32_t *__restrict__ pDst);

/**
   @brief Floating-point FFT on real input data (parallel version).
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (real data)
   @param[in]   nPE     number of parallel processing units
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32_parallel(const plp_fft_instance_f32 *S,
                           const float32_t *__restrict__ pSrc,
                           const uint32_t nPE,
                           float32_t *__restrict__ pDst);

/**
   @brief  Floating-point FFT on real input data for XPULPV2 extension.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrcA   points to the input buffer (real data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_rfft_f32_xpulpv2(const plp_fft_instance_f32 *S,
                          const float32_t *__restrict__ pSrc,
                          float32_t *__restrict__ pDst);

/**
   @brief  Floating-point FFT on real input data for XPULPV2 extension (parallel version).
   @param[in]   arg       points to an instance of the floating-point FFT structure
   @return      none
*/
void plp_rfft_f32_xpulpv2_parallel(plp_fft_instance_f32_parallel *arg);

/**
   @brief Floating-point FFT on complex input data.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (complex data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_cfft_f32(const plp_fft_instance_f32 *S,
                  const float32_t *pSrc,
                  float32_t *pDst);

/**
   @brief Floating-point FFT on complex input data (parallel version).
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (complex data)
   @param[in]   nPE     number of parallel processing units
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_cfft_f32_parallel(const plp_fft_instance_f32 *S,
                           const float32_t *pSrc,
                           const uint32_t nPE,
                           float32_t *pDst);

/**
   @brief  Floating-point FFT on complex input data for XPULPV2 extension.
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrcA   points to the input buffer (complex data)
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_cfft_f32_xpulpv2(const plp_fft_instance_f32 *S,
                          const float32_t *pSrc,
                          float32_t *pDst);

/**
   @brief  Floating-point FFT on complex input data for XPULPV2 extension (parallel version).
   @param[in]   arg       points to an instance of the floating-point FFT structure
   @return      none
*/
void plp_cfft_f32_xpulpv2_parallel(plp_fft_instance_f32_parallel *arg);

/**
   @brief Floating-point DCT on real input data. Implementation of
                        John Makhoul's "A Fast Cosine Transform in One
                        and Two Dimensions" 1980 IEEE paper.
   @param[in]   S       points to an instance of the floating-point FFT
                        structure with FFTLength = DCTLength
   @param[in]   pShift  points to twiddle coefficient table of 4*FFTLength,
                        of which only the first quarter is necessary.
   @param[in]   pSrc    points to the input buffer (real data) of size
                        FFTLength 
   @param[out]  pBuf    points to buffer of size 2*FFTLength, used for 
                        computation.
   @param[out]  pDst    points to output buffer (real data) of size FFTLength,
                        may be the same as pSrc.
   @return      none
*/
void plp_dct2_f32(const plp_fft_instance_f32 *S,
                  const Complex_type_f32 *pShift,
                  const uint8_t orthoNorm,
                  const float32_t *__restrict__ pSrc,
                  float32_t *__restrict__ pBuf,
                  float32_t *__restrict__ pDst);

/**
   @brief Floating-point DCT on real input data. Implementation of
                        John Makhoul's "A Fast Cosine Transform in One
                        and Two Dimensions" 1980 IEEE paper.
   @param[in]   S       points to an instance of the floating-point FFT
                        structure with FFTLength = DCTLength
   @param[in]   pShift  points to twiddle coefficient table of 4*FFTLength,
                        of which only the first quarter is necessary.
   @param[in]   pSrc    points to the input buffer (real data) of size
                        FFTLength 
   @param[in]   nPE     number of parallel processing units
   @param[out]  pBuf    points to buffer of size 2*FFTLength, used for 
                        computation.
   @param[out]  pDst    points to output buffer (real data) of size FFTLength,
                        may be the same as pSrc.
   @return      none
*/
void plp_dct2_f32_parallel(const plp_fft_instance_f32 *S,
                  	   const Complex_type_f32 *pShift,
                  	   const uint8_t orthoNorm,
                  	   const float32_t *__restrict__ pSrc,
			   const uint32_t nPE,
                  	   float32_t *__restrict__ pBuf,
                  	   float32_t *__restrict__ pDst);

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
   @param[out]  pDst        points to the output buffer 
                            of length at least 3*n_fft.
                            pSrc and pDst must not overlap, the calculation can
                            not be done in place. 
                            MFCCs are returned in the first n_mels spots.
   @return      none
*/


void plp_mfcc_f32(const plp_fft_instance_f32 *SFFT,
                  const plp_fft_instance_f32 *SDCT,
                  const Complex_type_f32 *pShift,
                  const plp_triangular_filter_f32 *filterBank,
		  const float32_t *window,
		  const uint8_t *orthoNorm,
                  const float32_t *__restrict__ pSrc,
                  float32_t *__restrict__ pDst);

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
                	   float32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/


/**
   @brief  Floating-point DWT on real input data for XPULPV2 extension.
   @param[in]   pSrc     points to the input buffer (real data)
   @param[in]   length   length of input buffer
   @param[in]   wavelet  wavelet structure for calculating DWT
   @param[in]   mode     boundary extension mode

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_f32(const float32_t *__restrict__ pSrc,
                  uint32_t length,
                  const plp_dwt_wavelet_f32 wavelet,
                  plp_dwt_extension_mode mode,
                  float32_t *__restrict__ pDstA,
                  float32_t *__restrict__ pDstD);



/**
   @brief  Floating-point DWT on real input data for XPULPV2 extension.
   @param[in]   pSrc     points to the input buffer (real data)
   @param[in]   length   length of input buffer
   @param[in]   wavelet  wavelet structure for calculating DWT
   @param[in]   mode     boundary extension mode

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_f32_xpulpv2(const float32_t *__restrict__ pSrc,
                  uint32_t length,
                  const plp_dwt_wavelet_f32 wavelet,
                  plp_dwt_extension_mode mode,
                  float32_t *__restrict__ pDstA,
                  float32_t *__restrict__ pDstD);




void plp_mat_add_i32(const int32_t *__restrict__ pSrcA,
                     const int32_t *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                             const int32_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i32_parallel(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t nPE,
                              int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel matrix addition of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_add_instance_i32 struct initialized by
                    plp_mat_add_i32_parallel
  @return     none
*/

void plp_mat_add_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i16(const int16_t *__restrict__ pSrcA,
                     const int16_t *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                             const int16_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i16_parallel(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t nPE,
                              int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix addition of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_add_instance_i16 struct initialized by
                    plp_mat_add_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i8(const int8_t *__restrict__ pSrcA,
                    const int8_t *__restrict__ pSrcB,
                    uint32_t M,
                    uint32_t N,
                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                            const int8_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_i8_parallel(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t nPE,
                             int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix addition of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_add_instance_i8 struct initialized by
                    plp_mat_add_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_f32(const float *__restrict__ pSrcA,
                     const float *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_f32s_xpulpv2(const float *__restrict__ pSrcA,
                              const float *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_f32_parallel(const float *__restrict__ pSrcA,
                              const float *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t nPE,
                              float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix addition of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_add_instance_f32 struct initialized by
                    plp_mat_add_f32_parallel
  @return     none
*/

void plp_mat_add_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i32(const int32_t *__restrict__ pSrcA,
                     const int32_t *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                             const int32_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i32_parallel(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t nPE,
                              int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel matrix subtraction of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_sub_instance_i32 struct initialized by
                    plp_mat_sub_i32_parallel
  @return     none
*/

void plp_mat_sub_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i16(const int16_t *__restrict__ pSrcA,
                     const int16_t *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                             const int16_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i16_parallel(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t nPE,
                              int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix subtraction of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_sub_instance_i16 struct initialized by
                    plp_mat_sub_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i8(const int8_t *__restrict__ pSrcA,
                    const int8_t *__restrict__ pSrcB,
                    uint32_t M,
                    uint32_t N,
                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                            const int8_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_i8_parallel(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t nPE,
                             int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix subtraction of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_sub_instance_i8 struct initialized by
                    plp_mat_sub_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_f32(const float *__restrict__ pSrcA,
                     const float *__restrict__ pSrcB,
                     uint32_t M,
                     uint32_t N,
                     float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_f32s_xpulpv2(const float *__restrict__ pSrcA,
                              const float *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_f32_parallel(const float *__restrict__ pSrcA,
                              const float *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t nPE,
                              float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix subtraction of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_sub_instance_f32 struct initialized by
                    plp_mat_sub_f32_parallel
  @return     none
*/

void plp_mat_sub_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief   Glue code for matrix scale of a 32-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return  none
*/

void plp_mat_scale_i32(const int32_t *__restrict__ pSrc,
                       uint32_t M,
                       uint32_t N,
                       int32_t scaleFactor,
                       int32_t shift,
                       int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief   matrix scale of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return  none
*/

void plp_mat_scale_i32s_rv32im(const int32_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int32_t scaleFactor,
                               int32_t shift,
                               int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix scale of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int32_t scaleFactor,
                                int32_t shift,
                                int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix scale of a 32-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i32_parallel(const int32_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int32_t scaleFactor,
                                int32_t shift,
                                uint32_t nPE,
                                int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel matrix scale of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_scale_instance_i32 struct initialized by
                    plp_mat_scale_i32_parallel
  @return     none
*/

void plp_mat_scale_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix scale of a 16-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i16(const int16_t *__restrict__ pSrc,
                       uint32_t M,
                       uint32_t N,
                       int16_t scaleFactor,
                       int32_t shift,
                       int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix scale of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i16s_rv32im(const int16_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int16_t scaleFactor,
                               int32_t shift,
                               int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix scale of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int16_t scaleFactor,
                                int32_t shift,
                                int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix scale of a 16-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i16_parallel(const int16_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int16_t scaleFactor,
                                int32_t shift,
                                uint32_t nPE,
                                int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix scale of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_scale_instance_i16 struct initialized by
                    plp_mat_scale_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix scale of a 8-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i8(const int8_t *__restrict__ pSrc,
                      uint32_t M,
                      uint32_t N,
                      int8_t scaleFactor,
                      int32_t shift,
                      int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix scale of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i8s_rv32im(const int8_t *__restrict__ pSrc,
                              uint32_t M,
                              uint32_t N,
                              int8_t scaleFactor,
                              int32_t shift,
                              int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix scale of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int8_t scaleFactor,
                               int32_t shift,
                               int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix scale of a 8-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_i8_parallel(const int8_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int8_t scaleFactor,
                               int32_t shift,
                               uint32_t nPE,
                               int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix scale of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_scale_instance_i8 struct initialized by
                    plp_mat_scale_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix scale of a 32-bit floating-point matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_f32(const float *__restrict__ pSrc,
                       uint32_t M,
                       uint32_t N,
                       float scaleFactor,
                       float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix scale of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_f32s_xpulpv2(const float *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                float scaleFactor,
                                float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix scale of a 32-bit floating-point matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_f32_parallel(const float *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                float scaleFactor,
                                uint32_t nPE,
                                float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix scale of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_scale_instance_f32 struct initialized by
                    plp_mat_scale_f32_parallel
  @return  none
*/

void plp_mat_scale_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief   Glue code for matrix transpose of a 32-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return  none
*/

void plp_mat_trans_i32(const int32_t *__restrict__ pSrc,
                       uint32_t M,
                       uint32_t N,
                       int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief   matrix transpose of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return  none
*/

void plp_mat_trans_i32s_rv32im(const int32_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix transpose of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix transpose of a 32-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i32_parallel(const int32_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                uint32_t nPE,
                                int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel matrix transpose of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_trans_instance_i32 struct initialized by
                    plp_mat_trans_i32_parallel
  @return     none
*/

void plp_mat_trans_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix transpose of a 16-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i16(const int16_t *__restrict__ pSrc,
                       uint32_t M,
                       uint32_t N,
                       int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix transpose of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i16s_rv32im(const int16_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix transpose of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_trans_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix transpose of a 16-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i16_parallel(const int16_t *__restrict__ pSrc,
                                uint32_t M,
                                uint32_t N,
                                uint32_t nPE,
                                int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix transpose of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_trans_instance_i16 struct initialized by
                    plp_mat_trans_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_trans_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix transpose of a 8-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i8(const int8_t *__restrict__ pSrc,
                      uint32_t M,
                      uint32_t N,
                      int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix transpose of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i8s_rv32im(const int8_t *__restrict__ pSrc,
                              uint32_t M,
                              uint32_t N,
                              int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix transpose of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_trans_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix transpose of a 8-bit integer matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none
*/

void plp_mat_trans_i8_parallel(const int8_t *__restrict__ pSrc,
                               uint32_t M,
                               uint32_t N,
                               uint32_t nPE,
                               int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix transpose of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_trans_instance_i8 struct initialized by
  plp_mat_trans_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_trans_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix transpose of a 32-bit float*ing-point matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none

  @par This function will use plp_mat_trans_i32s_xpulpv2 for its computation.
*/

void plp_mat_trans_f32(const float *__restrict__ pSrc,
                       uint32_t M,
                       uint32_t N,
                       float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix transpose of a 32-bit float*ing-point matrices.
  @param[in]  pSrc Points to the input matrix of shape MxN
  @param[in]  M    Height of the input matrix and width of the output matrix
  @param[in]  N    Width of the input matrix and height of the output matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxM
  @return     none

  @par This function will use plp_mat_trans_i32p_xpulpv2 for its computation.
*/

void plp_mat_trans_f32_parallel(
    const float *__restrict__ pSrc, uint32_t M, uint32_t N, uint32_t nPE, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for matrix inverse of a 32-bit floating-point matrices.
  @param[in]  pSrc Points to the first input matrix. pSrc is modified by this funciton
  @param[in]  N    Width and height of both matrices
  @param[out] pDst Points to the output matrix
  @return     none
*/

int plp_mat_inv_f32(float *__restrict__ pSrc, uint32_t N, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix inverse of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrc Points to the first input matrix. pSrc is modified by this funciton
  @param[in]  N    Width and height of both matrices
  @param[out] pDst Points to the output matrix
  @return     0: Success, 1: Matrix is singular
*/

int plp_mat_inv_f32s_xpulpv2(float *__restrict__ pSrc, uint32_t N, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix inverse of a 32-bit floating-point matrices.
  @param[in]  pSrc Points to the first input matrix. pSrc is modified by this funciton
  @param[in]  N    Width and height of both matrices
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix
  @return     0: Success, 1: Matrix is singular, 2: operation not supported
*/

int plp_mat_inv_f32_parallel(float *__restrict__ pSrc,
                             uint32_t N,
                             uint32_t nPE,
                             float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix inverse of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  args  pointer to plp_mat_inv_instance_f32 struct initialized by
                    plp_mat_inv_f32_parallel
  @return     0: Success, 1: Matrix is singular
*/

int plp_mat_inv_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 32-bit integer identity matrix
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i32(uint32_t N, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit integer identity matrix on RV32IM
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i32s_rv32im(uint32_t N, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit integer identity matrix on XpulpV2
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i32s_xpulpv2(uint32_t N, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 32-bit integer identity matrix in parallel
  @param[in]  N    Width and height of the matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i32_parallel(uint32_t N, uint32_t nPE, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit integer identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_i32 struct initialized by
                    plp_mat_fill_I_i32_parallel
  @return     none
*/

void plp_mat_fill_I_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 16-bit integer identity matrix
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i16(uint32_t N, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 16-bit integer identity matrix on RV32IM
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i16s_rv32im(uint32_t N, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 16-bit integer identity matrix on XpulpV2
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_i16s_xpulpv2(uint32_t N, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 16-bit integer identity matrix in parallel
  @param[in]  N    Width and height of the matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i16_parallel(uint32_t N, uint32_t nPE, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 16-bit integer identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_i16 struct initialized by
                    plp_mat_fill_I_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 8-bit integer identity matrix
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i8(uint32_t N, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 8-bit integer identity matrix on RV32IM
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i8s_rv32im(uint32_t N, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 8-bit integer identity matrix on XpulpV2
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_i8s_xpulpv2(uint32_t N, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 8-bit integer identity matrix in parallel
  @param[in]  N    Width and height of the matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_i8_parallel(uint32_t N, uint32_t nPE, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 8-bit integer identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_i8 struct initialized by
                    plp_mat_fill_I_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 32-bit float identity matrix
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_f32(uint32_t N, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit float identity matrix on XpulpV2
  @param[in]  N    Width and height of the matrix
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_f32s_xpulpv2(uint32_t N, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 32-bit float identity matrix in parallel
  @param[in]  N    Width and height of the matrix
  @param[in]  nPE  Number of cores to use for computation
  @param[out] pDst Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_f32_parallel(uint32_t N, uint32_t nPE, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit float identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_f32 struct initialized by
                    plp_mat_fill_I_f32_parallel
  @return     none
*/

void plp_mat_fill_I_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 32-bit fix-point identity matrix
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q32(uint32_t N, int32_t fracBits, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit fix-point identity matrix on RV32IM
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q32s_rv32im(uint32_t N, int32_t fracBits, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit fix-point identity matrix on XpulpV2
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q32s_xpulpv2(uint32_t N, int32_t fracBits, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 32-bit fix-point identity matrix in parallel
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[in]  nPE       Number of cores to use for computation
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q32_parallel(uint32_t N,
                                 int32_t fracBits,
                                 uint32_t nPE,
                                 int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 32-bit fix-point identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_q32 struct initialized by
                    plp_mat_fill_I_q32_parallel
  @return     none
*/

void plp_mat_fill_I_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 16-bit fix-point identity matrix
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q16(uint32_t N, int32_t fracBits, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 16-bit fix-point identity matrix on RV32IM
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q16s_rv32im(uint32_t N, int32_t fracBits, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 16-bit fix-point identity matrix on XpulpV2
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_q16s_xpulpv2(uint32_t N, int32_t fracBits, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 16-bit fix-point identity matrix in parallel
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[in]  nPE       Number of cores to use for computation
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q16_parallel(uint32_t N,
                                 int32_t fracBits,
                                 uint32_t nPE,
                                 int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 16-bit fix-point identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_q16 struct initialized by
                    plp_mat_fill_I_q16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a 8-bit fix-point identity matrix
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q8(uint32_t N, int32_t fracBits, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 8-bit fix-point identity matrix on RV32IM
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q8s_rv32im(uint32_t N, int32_t fracBits, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 8-bit fix-point identity matrix on XpulpV2
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_q8s_xpulpv2(uint32_t N, int32_t fracBits, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a 8-bit fix-point identity matrix in parallel
  @param[in]  N         Width and height of the matrix
  @param[in]  fracBits  decimal point for the appropriate scale
  @param[in]  nPE       Number of cores to use for computation
  @param[out] pDst      Points to the output matrix of shape NxN
  @return     none
*/

void plp_mat_fill_I_q8_parallel(uint32_t N,
                                int32_t fracBits,
                                uint32_t nPE,
                                int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a 8-bit fix-point identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_q8 struct initialized by
                    plp_mat_fill_I_q8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 32-bit integer matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i32(const int32_t *__restrict__ pSrcA,
                             const int32_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t strideA,
                             uint32_t strideB,
                             uint32_t strideC,
                             int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 32-bit integer matrices for RV32IM
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 32-bit integer matrices for XPULPV2
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                      const int32_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 16-bit integer matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i16(const int16_t *__restrict__ pSrcA,
                             const int16_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t strideA,
                             uint32_t strideB,
                             uint32_t strideC,
                             int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 16-bit integer matrices for RV32IM
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 16-bit integer matrices for XPULPV2
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                      const int16_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 8-bit integer matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i8(const int8_t *__restrict__ pSrcA,
                            const int8_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideC,
                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 8-bit integer matrices for RV32IM
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideC,
                                    int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 8-bit integer matrices for XPULPV2
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                     const int8_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 32-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i32_parallel(const int32_t *__restrict__ pSrcA,
                                      const int32_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t nPE,
                                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel strided matrix matrix multiplication of a 32-bit integer matrices for
               XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_mult_stride_instance_i32 struct initialized by
                         plp_mat_mult_stride_i32_parallel
   @return     none
*/

void plp_mat_mult_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 16-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i16_parallel(const int16_t *__restrict__ pSrcA,
                                      const int16_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t nPE,
                                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 16-bit integer matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_stride_instance_i16 struct initialized by
                      plp_mat_mult_stride_i16_parallel
    @return     none

    @par Exploiting SIMD instructions
    The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
    performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 8-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                     const int8_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 32-bit floating-point
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_f32(const float *__restrict__ pSrcA,
                             const float *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t strideA,
                             uint32_t strideB,
                             uint32_t strideC,
                             float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 32-bit floating-point matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                      const float *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 32-bit
               floating-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_stride_f32_parallel(const float *__restrict__ pSrcA,
                                      const float *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t nPE,
                                      float *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 32-bit floating-point matrices kernel for XPULPV2
           extension.
    @param[in]  args pointer to plp_mat_mult_stride_instance_f32 struct initialized by
                     plp_mat_mult_stride_f32_parallel
    @return     none
*/

void plp_mat_mult_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief Parallel matrix multiplication of 8-bit integer matrices kernel for XPULPV2 extension.
   @param[in]  args pointer to plp_mat_mult_stride_instance_i8 struct initialized by
                    plp_mat_mult_stride_i8_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 32-bit fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_stride_q32(const int32_t *__restrict__ pSrcA,
                             const int32_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t strideA,
                             uint32_t strideB,
                             uint32_t strideC,
                             uint32_t shift,
                             int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 32-bit fix-point
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_stride_q32_parallel(const int32_t *__restrict__ pSrcA,
                                      const int32_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t shift,
                                      uint32_t nPE,
                                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 32-bit fix-point matrices for RV32IM
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_stride_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     uint32_t shift,
                                     int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 32-bit fix-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_stride_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                      const int32_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t shift,
                                      int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 32-bit fix-point matrices kernel for XPULPV2 extension.
    @param[in]  args pointer to plp_mat_mult_stride_instance_q32 struct initialized by
                     plp_mat_mult_stride_q32_parallel
    @return     none
*/

void plp_mat_mult_stride_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 16-bit fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

  The output of the matrix multiplication will also be stored as an 16-bit array.
  Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_stride_q16(const int16_t *__restrict__ pSrcA,
                             const int16_t *__restrict__ pSrcB,
                             uint32_t M,
                             uint32_t N,
                             uint32_t O,
                             uint32_t strideA,
                             uint32_t strideB,
                             uint32_t strideC,
                             uint32_t shift,
                             int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 16-bit fix-point
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_stride_q16_parallel(const int16_t *__restrict__ pSrcA,
                                      const int16_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t shift,
                                      uint32_t nPE,
                                      int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 16-bit fix-point matrices for RV32IM
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_stride_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     uint32_t shift,
                                     int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 16-bit fix-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_stride_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                      const int16_t *__restrict__ pSrcB,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t O,
                                      uint32_t strideA,
                                      uint32_t strideB,
                                      uint32_t strideC,
                                      uint32_t shift,
                                      int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 16-bit fix-point matrices kernel for XPULPV2 extension.
    @param[in]  args      pointer to plp_mat_mult_stride_instance_q16 struct initialized by
   plp_mat_mult_stride_q16_parallel
    @return     none
*/

void plp_mat_mult_stride_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix matrix multiplication of a 8-bit fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_stride_q8(const int8_t *__restrict__ pSrcA,
                            const int8_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t O,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideC,
                            uint32_t shift,
                            int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 8-bit fix-point
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_stride_q8_parallel(const int8_t *__restrict__ pSrcA,
                                     const int8_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     uint32_t shift,
                                     uint32_t nPE,
                                     int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 8-bit fix-point matrices for RV32IM
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_stride_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t O,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideC,
                                    uint32_t shift,
                                    int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix matrix multiplication of a 8-bit fix-point matrices for XPULPV2
               extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_stride_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                     const int8_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t O,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideC,
                                     uint32_t shift,
                                     int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief Parallel matrix multiplication of 8-bit fix-point matrices kernel for XPULPV2 extension.
    @param[in]  args pointer to plp_mat_mult_stride_instance_q8 struct initialized by
                     plp_mat_mult_stride_q8_parallel
    @return     none
*/

void plp_mat_mult_stride_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 32-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i32(const int32_t *__restrict__ pSrcA,
                                   const int32_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 32-bit integer matrices for
               RV32IM extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 32-bit integer matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 16-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i16(const int16_t *__restrict__ pSrcA,
                                   const int16_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 16-bit integer matrices for
               RV32IM extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 16-bit integer matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 8-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i8(const int8_t *__restrict__ pSrcA,
                                  const int8_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  uint32_t strideA,
                                  uint32_t strideB,
                                  uint32_t strideC,
                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 8-bit integer matrices for
               RV32IM extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t strideA,
                                          uint32_t strideB,
                                          uint32_t strideC,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 8-bit integer matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix matrix multiplication of a 32-bit integer
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i32_parallel(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t nPE,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel strided matrix transposed matrix multiplication of a 32-bit integer
               matrices for RV32IM extension.
   @param[in]  args  pointer to plp_mat_mult_stride_instance_i32 struct initialized by
                     plp_mat_mult_stride_i32_parallel
   @return     none
*/

void plp_mat_mult_trans_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix transposed matrix multiplication of a 16-bit
               integer matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i16_parallel(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t nPE,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel strided matrix transposed matrix multiplication of a 16-bit integer
               matrices for XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_stride_instance_i16 struct initialized by
                     plp_mat_mult_stride_i16_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix transposed matrix multiplication of a 8-bit
               integer matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t nPE,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Parallel strided matrix transposed matrix multiplication of a 8-bit integer
               matrices for XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_stride_instance_i8 struct initialized by
                     plp_mat_mult_stride_i8_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 32-bit
               fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_trans_stride_q32(const int32_t *__restrict__ pSrcA,
                                   const int32_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   uint32_t shift,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix transposed matrix multiplication of a 32-bit
               fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
 */

void plp_mat_mult_trans_stride_q32_parallel(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            uint32_t nPE,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 32-bit fix-point matrices for
               RV32IM extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_trans_stride_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 32-bit fix-point matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).
*/

void plp_mat_mult_trans_stride_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel strided matrix transposed matrix multiplication of 32-bit fix-point
                matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_stride_instance_q32 struct initialized by
                      plp_mat_mult_trans_stride_q32_parallel
    @return     none
*/

void plp_mat_mult_trans_stride_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 16-bit
               fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_stride_q16(const int16_t *__restrict__ pSrcA,
                                   const int16_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   uint32_t shift,
                                   int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix transposed matrix multiplication of a 16-bit
               fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_stride_q16_parallel(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            uint32_t nPE,
                                            int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 16-bit fix-point matrices for
               RV32IM extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_stride_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 16-bit fix-point matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 16-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_stride_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel strided matrix transposed matrix multiplication of 16-bit fix-point
   matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_stride_instance_q16 struct initialized by
                      plp_mat_mult_trans_stride_q16_parallel
    @return     none
*/

void plp_mat_mult_trans_stride_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 8-bit fix-point
               matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_stride_q8(const int8_t *__restrict__ pSrcA,
                                  const int8_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  uint32_t strideA,
                                  uint32_t strideB,
                                  uint32_t strideC,
                                  uint32_t shift,
                                  int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix transposed matrix multiplication of a 8-bit
               fix-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
 */

void plp_mat_mult_trans_stride_q8_parallel(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           uint32_t nPE,
                                           int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 8-bit fix-point matrices for
               RV32IM extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_stride_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t strideA,
                                          uint32_t strideB,
                                          uint32_t strideC,
                                          uint32_t shift,
                                          int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 8-bit fix-point matrices for
               XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  shift      Amount to shift the result of each multiplication.
   @param[out] pDstC      Output is written here
   @return     none

   @par Fix-Point and Shifting
   The result will be shifted by the parameter `shift` to the right (multiplied
   by 2^-shift). Assume that matrix A is represented as pSrcA * 2^-x, and matrix
   B as pSrcB * 2^-y (in other words, A has it's x last digits after the binary
   point). Then, the output is represented as pDstC * 2^-(x + y - shift).

   The output of the matrix multiplication will also be stored as an 8-bit array.
   Set the `shift` parameter such that no overflow ocurrs.
*/

void plp_mat_mult_trans_stride_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel strided matrix transposed matrix multiplication of 8-bit fix-point matrices
                kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_stride_instance_q8 struct initialized by
                      plp_mat_mult_trans_stride_q8_parallel
    @return     none
*/

void plp_mat_mult_trans_stride_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
   @brief      Glue code for strided matrix transposed matrix multiplication of a 32-bit
               floating-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_f32(const float *__restrict__ pSrcA,
                                   const float *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      strided matrix transposed matrix multiplication of a 32-bit floating-point
               matrices for XPULPV2 extension.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                            const float *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            float *__restrict__ pDstC);

/** -------------------------------------------------------
   @brief      Glue code for parallel strided matrix transposed matrix multiplication of a 32-bit
               floating-point matrices.
   @param[in]  pSrcA      points to first the input matrix
   @param[in]  pSrcB      points to second the input matrix
   @param[in]  M          Height of first matrix
   @param[in]  N          Width of first and heigt of second matrix
   @param[in]  O          Width of second matrix
   @param[in]  strideA    Stride of matrix A (elements between each row)
   @param[in]  strideB    Stride of matrix B (elements between each row)
   @param[in]  strudeY    Stride of output matrix (elements between each row)
   @param[in]  nPE        Number of cores to use
   @param[out] pDstC      Output is written here
   @return     none
*/

void plp_mat_mult_trans_stride_f32_parallel(const float *__restrict__ pSrcA,
                                            const float *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t nPE,
                                            float *__restrict__ pDstC);

/** -------------------------------------------------------
    @brief      Parallel strided matrix transposed matrix multiplication of 32-bit floating-point
                matrices kernel for XPULPV2 extension.
    @param[in]  args  pointer to plp_mat_mult_stride_instance_f32 struct initialized by
                      plp_mat_mult_trans_stride_f32_parallel
    @return     none
*/

void plp_mat_mult_trans_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 32-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i32(const int32_t *__restrict__ pSrcA,
                                   const int32_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 32-bit integers on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 32-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i32_parallel(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t nPE,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_i32 struct initialized by
                    plp_mat_mult_cmplx_stride_i32_parallel
  @return     none
*/

void plp_mat_mult_cmplx_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 16-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i16(const int16_t *__restrict__ pSrcA,
                                   const int16_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 16-bit integers on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 16-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i16_parallel(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t nPE,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_i16 struct initialized by
                    plp_mat_mult_cmplx_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 8-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i8(const int8_t *__restrict__ pSrcA,
                                  const int8_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  uint32_t strideA,
                                  uint32_t strideB,
                                  uint32_t strideC,
                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 8-bit integers on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t strideA,
                                          uint32_t strideB,
                                          uint32_t strideC,
                                          int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 8-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t nPE,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_i8 struct initialized by
                    plp_mat_mult_cmplx_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_f32(const float *__restrict__ pSrcA,
                                   const float *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                            const float *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_cmplx_stride_f32_parallel(const float *__restrict__ pSrcA,
                                            const float *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t nPE,
                                            float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_f32 struct initialized by
                    plp_mat_mult_cmplx_stride_f32_parallel
  @return     none
*/

void plp_mat_mult_cmplx_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 32-bit fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q32(const int32_t *__restrict__ pSrcA,
                                   const int32_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   uint32_t shift,
                                   int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 32-bit fix-point on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                           const int32_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 32-bit fix-point on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 32-bit
              fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q32_parallel(const int32_t *__restrict__ pSrcA,
                                            const int32_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            uint32_t nPE,
                                            int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 32-bit fix-point on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_q32 struct initialized by
                    plp_mat_mult_cmplx_stride_q32_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 16-bit fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q16(const int16_t *__restrict__ pSrcA,
                                   const int16_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t O,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideC,
                                   uint32_t shift,
                                   int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 16-bit fix-point on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                           const int16_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 16-bit
              fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q16_parallel(const int16_t *__restrict__ pSrcA,
                                            const int16_t *__restrict__ pSrcB,
                                            uint32_t M,
                                            uint32_t N,
                                            uint32_t O,
                                            uint32_t strideA,
                                            uint32_t strideB,
                                            uint32_t strideC,
                                            uint32_t shift,
                                            uint32_t nPE,
                                            int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_q16 struct initialized by
                    plp_mat_mult_cmplx_stride_q16_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix matrix multiplication for complex 8-bit fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q8(const int8_t *__restrict__ pSrcA,
                                  const int8_t *__restrict__ pSrcB,
                                  uint32_t M,
                                  uint32_t N,
                                  uint32_t O,
                                  uint32_t strideA,
                                  uint32_t strideB,
                                  uint32_t strideC,
                                  uint32_t shift,
                                  int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 8-bit fix-point on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                          const int8_t *__restrict__ pSrcB,
                                          uint32_t M,
                                          uint32_t N,
                                          uint32_t O,
                                          uint32_t strideA,
                                          uint32_t strideB,
                                          uint32_t strideC,
                                          uint32_t shift,
                                          int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Strided strided matrix matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix matrix multiplication for complex 8-bit fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape NxO
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and height of matrix SrcB
  @param[in]  O       Width of matrix SrcB and DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_cmplx_stride_q8_parallel(const int8_t *__restrict__ pSrcA,
                                           const int8_t *__restrict__ pSrcB,
                                           uint32_t M,
                                           uint32_t N,
                                           uint32_t O,
                                           uint32_t strideA,
                                           uint32_t strideB,
                                           uint32_t strideC,
                                           uint32_t shift,
                                           uint32_t nPE,
                                           int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_q8 struct initialized by
                    plp_mat_mult_cmplx_stride_q8_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_stride_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 32-bit
              integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i32(const int32_t *__restrict__ pSrcA,
                                         const int32_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 32-bit integers on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                                 const int32_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 32-bit integers on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                                  const int32_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex
              32-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i32_parallel(const int32_t *__restrict__ pSrcA,
                                                  const int32_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t nPE,
                                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 32-bit integers on
              XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_i32 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_i32_parallel
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 16-bit
              integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i16(const int16_t *__restrict__ pSrcA,
                                         const int16_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 16-bit integers on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                                 const int16_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 16-bit integers on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                                  const int16_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex
              16-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i16_parallel(const int16_t *__restrict__ pSrcA,
                                                  const int16_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t nPE,
                                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 16-bit integers on
              XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_i16 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 8-bit integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i8(const int8_t *__restrict__ pSrcA,
                                        const int8_t *__restrict__ pSrcB,
                                        uint32_t M,
                                        uint32_t N,
                                        uint32_t O,
                                        uint32_t strideA,
                                        uint32_t strideB,
                                        uint32_t strideC,
                                        int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 8-bit integers on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                                const int8_t *__restrict__ pSrcB,
                                                uint32_t M,
                                                uint32_t N,
                                                uint32_t O,
                                                uint32_t strideA,
                                                uint32_t strideB,
                                                uint32_t strideC,
                                                int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 8-bit integers on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                                 const int8_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex 8-bit
              integers
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                                 const int8_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 uint32_t nPE,
                                                 int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 8-bit integers on
              XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_i8 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 32-bit floats
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_f32(const float *__restrict__ pSrcA,
                                         const float *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 32-bit floats on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                                  const float *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex
              32-bit floats
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_f32_parallel(const float *__restrict__ pSrcA,
                                                  const float *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t nPE,
                                                  float *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 32-bit floats on
              XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_f32 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_f32_parallel
  @return     none
*/

void plp_mat_mult_trans_cmplx_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 32-bit
              fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q32(const int32_t *__restrict__ pSrcA,
                                         const int32_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         uint32_t shift,
                                         int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 32-bit fix-point on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q32s_rv32im(const int32_t *__restrict__ pSrcA,
                                                 const int32_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 uint32_t shift,
                                                 int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 32-bit fix-point on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                                  const int32_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t shift,
                                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex
              32-bit fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q32_parallel(const int32_t *__restrict__ pSrcA,
                                                  const int32_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t shift,
                                                  uint32_t nPE,
                                                  int32_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 32-bit fix-point
              on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_q32 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_q32_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 16-bit
              fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q16(const int16_t *__restrict__ pSrcA,
                                         const int16_t *__restrict__ pSrcB,
                                         uint32_t M,
                                         uint32_t N,
                                         uint32_t O,
                                         uint32_t strideA,
                                         uint32_t strideB,
                                         uint32_t strideC,
                                         uint32_t shift,
                                         int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 16-bit fix-point on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q16s_rv32im(const int16_t *__restrict__ pSrcA,
                                                 const int16_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 uint32_t shift,
                                                 int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_q16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                                  const int16_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t shift,
                                                  int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex
              16-bit fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q16_parallel(const int16_t *__restrict__ pSrcA,
                                                  const int16_t *__restrict__ pSrcB,
                                                  uint32_t M,
                                                  uint32_t N,
                                                  uint32_t O,
                                                  uint32_t strideA,
                                                  uint32_t strideB,
                                                  uint32_t strideC,
                                                  uint32_t shift,
                                                  uint32_t nPE,
                                                  int16_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 16-bit fix-point
              on XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_q16 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_q16_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code of strided matrix transpose matrix multiplication for complex 8-bit
              fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q8(const int8_t *__restrict__ pSrcA,
                                        const int8_t *__restrict__ pSrcB,
                                        uint32_t M,
                                        uint32_t N,
                                        uint32_t O,
                                        uint32_t strideA,
                                        uint32_t strideB,
                                        uint32_t strideC,
                                        uint32_t shift,
                                        int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 8-bit fix-point on RV32IM
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q8s_rv32im(const int8_t *__restrict__ pSrcA,
                                                const int8_t *__restrict__ pSrcB,
                                                uint32_t M,
                                                uint32_t N,
                                                uint32_t O,
                                                uint32_t strideA,
                                                uint32_t strideB,
                                                uint32_t strideC,
                                                uint32_t shift,
                                                int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      strided matrix transpose matrix multiplication for complex 8-bit fix-point on XpulpV2
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_q8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                                 const int8_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 uint32_t shift,
                                                 int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      Glue code of parallel strided matrix transpose matrix multiplication for complex 8-bit
              fix-point
  @param[in]  pSrcA   Points to the first input matrix of shape MxN
  @param[in]  pSrcB   Points to the second input matrix of shape OxN
  @param[in]  M       Height of matrix SrcA and DstC
  @param[in]  N       Width of matrix SrcA and SrcB
  @param[in]  O       Height of matrix SrcB and width of matrix DstC
  @param[in]  strideA Stride of input matrix A (elements between each row)
  @param[in]  strideB Stride of input matrix B (elements between each row)
  @param[in]  strideC Stride of output matrix C (Elements between each row)
  @param[in]  shift   Amount to shift the result of each multiplication ot the right
  @param[in]  nPE     Number of cores to use for computation
  @param[out] pDstC   Points to the output matrix of shape MxO
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.
*/

void plp_mat_mult_trans_cmplx_stride_q8_parallel(const int8_t *__restrict__ pSrcA,
                                                 const int8_t *__restrict__ pSrcB,
                                                 uint32_t M,
                                                 uint32_t N,
                                                 uint32_t O,
                                                 uint32_t strideA,
                                                 uint32_t strideB,
                                                 uint32_t strideC,
                                                 uint32_t shift,
                                                 uint32_t nPE,
                                                 int8_t *__restrict__ pDstC);

/** -------------------------------------------------------
  @brief      parallel strided matrix transpose matrix multiplication for complex 8-bit fix-point on
              XpulpV2
  @param[in]  args    pointer to plp_mat_mult_cmplx_stride_instance_q8 struct initialized by
                    plp_mat_mult_trans_cmplx_stride_q8_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`.
  The output matrix is also stored with the same number of bits as the inputs. Set the
  `shift` parameter such that no overflow occurrs.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_trans_cmplx_stride_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief   Glue code for matrix addition of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i32(const int32_t *__restrict__ pSrcA,
                            const int32_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideY,
                            int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief   matrix addition of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                    const int32_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i32_parallel(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel matrix addition of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_add_stride_instance_i32 struct initialized by
                        plp_mat_add_stride_i32_parallel
  @return     none
*/

void plp_mat_add_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideY,
                            int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                    const int16_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i16_parallel(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     uint32_t nPE,
                                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix addition of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_add_stride_instance_i16 struct initialized by
                        plp_mat_add_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i8(const int8_t *__restrict__ pSrcA,
                           const int8_t *__restrict__ pSrcB,
                           uint32_t M,
                           uint32_t N,
                           uint32_t strideA,
                           uint32_t strideB,
                           uint32_t strideY,
                           int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                   const int8_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideY,
                                   int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    uint32_t nPE,
                                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix addition of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_add_stride_instance_i8 struct initialized by
                        plp_mat_add_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_add_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix addition of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_f32(const float *__restrict__ pSrcA,
                            const float *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideY,
                            float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix addition of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix addition of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_add_stride_f32_parallel(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     uint32_t nPE,
                                     float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix addition of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_add_stride_instance_f32 struct initialized by
                        plp_mat_add_stride_f32_parallel
  @return     none
*/

void plp_mat_add_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief   Glue code for matrix subtraction of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i32(const int32_t *__restrict__ pSrcA,
                            const int32_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideY,
                            int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief   matrix subtraction of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                                    const int32_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 32-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i32_parallel(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     uint32_t nPE,
                                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel matrix subtraction of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_sub_stride_instance_i32 struct initialized by
                        plp_mat_sub_stride_i32_parallel
  @return     none
*/

void plp_mat_sub_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i16(const int16_t *__restrict__ pSrcA,
                            const int16_t *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideY,
                            int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i16s_rv32im(const int16_t *__restrict__ pSrcA,
                                    const int16_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 16-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i16_parallel(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     uint32_t nPE,
                                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix subtraction of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_sub_stride_instance_i16 struct initialized by
                        plp_mat_sub_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i8(const int8_t *__restrict__ pSrcA,
                           const int8_t *__restrict__ pSrcB,
                           uint32_t M,
                           uint32_t N,
                           uint32_t strideA,
                           uint32_t strideB,
                           uint32_t strideY,
                           int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                                   const int8_t *__restrict__ pSrcB,
                                   uint32_t M,
                                   uint32_t N,
                                   uint32_t strideA,
                                   uint32_t strideB,
                                   uint32_t strideY,
                                   int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 8-bit integer matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_i8_parallel(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideA,
                                    uint32_t strideB,
                                    uint32_t strideY,
                                    uint32_t nPE,
                                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix subtraction of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_sub_stride_instance_i8 struct initialized by
                        plp_mat_sub_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_sub_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for matrix subtraction of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_f32(const float *__restrict__ pSrcA,
                            const float *__restrict__ pSrcB,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideA,
                            uint32_t strideB,
                            uint32_t strideY,
                            float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      matrix subtraction of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_f32s_xpulpv2(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel matrix subtraction of a 32-bit floating-point matrices.
  @param[in]  pSrcA   Points to the first input matrix
  @param[in]  pSrcB   Points to the second input matrix
  @param[in]  M       Height of the matrices
  @param[in]  N       Width of the matrices
  @param[in]  strideA Stride of matrix A (elements between each row)
  @param[in]  strideB Stride of matrix B (elements between each row)
  @param[in]  strideY Stride of output matrix (elements between each row)
  @param[in]  nPE     Number of cores to use
  @param[out] pDst    Points to the output matrix
  @return     none
*/

void plp_mat_sub_stride_f32_parallel(const float *__restrict__ pSrcA,
                                     const float *__restrict__ pSrcB,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideA,
                                     uint32_t strideB,
                                     uint32_t strideY,
                                     uint32_t nPE,
                                     float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel matrix subtraction of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_sub_stride_instance_f32 struct initialized by
                        plp_mat_sub_stride_f32_parallel
  @return     none
*/

void plp_mat_sub_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief   Glue code for strided matrix scale of a 32-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  strideSrc   Stride of input matrix (elements between each row)
  @param[in]  strideDst   Stride of output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return  none
*/

void plp_mat_scale_stride_i32(const int32_t *__restrict__ pSrc,
                              uint32_t M,
                              uint32_t N,
                              uint32_t strideSrc,
                              uint32_t strideDst,
                              int32_t scaleFactor,
                              int32_t shift,
                              int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief   strided matrix scale of a 32-bit integer matrices for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return  none
*/

void plp_mat_scale_stride_i32s_rv32im(const int32_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      int32_t scaleFactor,
                                      int32_t shift,
                                      int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      strided matrix scale of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       int32_t scaleFactor,
                                       int32_t shift,
                                       int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel strided matrix scale of a 32-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i32_parallel(const int32_t *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       int32_t scaleFactor,
                                       int32_t shift,
                                       uint32_t nPE,
                                       int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Parallel strided matrix scale of a 32-bit integer matrices for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_scale_stride_instance_i32 struct initialized by
                        plp_mat_scale_stride_i32_parallel
  @return     none
*/

void plp_mat_scale_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for strided matrix scale of a 16-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i16(const int16_t *__restrict__ pSrc,
                              uint32_t M,
                              uint32_t N,
                              uint32_t strideSrc,
                              uint32_t strideDst,
                              int16_t scaleFactor,
                              int32_t shift,
                              int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      strided matrix scale of a 16-bit integer matrices for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i16s_rv32im(const int16_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      int16_t scaleFactor,
                                      int32_t shift,
                                      int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      strided matrix scale of a 16-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       int16_t scaleFactor,
                                       int32_t shift,
                                       int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel strided matrix scale of a 16-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i16_parallel(const int16_t *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       int16_t scaleFactor,
                                       int32_t shift,
                                       uint32_t nPE,
                                       int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel strided matrix scale of 16-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_scale_stride_instance_i16 struct initialized by
                        plp_mat_scale_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for strided matrix scale of a 8-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i8(const int8_t *__restrict__ pSrc,
                             uint32_t M,
                             uint32_t N,
                             uint32_t strideSrc,
                             uint32_t strideDst,
                             int8_t scaleFactor,
                             int32_t shift,
                             int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      strided matrix scale of a 8-bit integer matrices for RV32IM extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i8s_rv32im(const int8_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     int8_t scaleFactor,
                                     int32_t shift,
                                     int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      strided matrix scale of a 8-bit integer matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[out] pDst        Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      int8_t scaleFactor,
                                      int32_t shift,
                                      int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel strided matrix scale of a 8-bit integer matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements before shifting
  @param[in]  shift       Amount to shift each element
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_i8_parallel(const int8_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      int8_t scaleFactor,
                                      int32_t shift,
                                      uint32_t nPE,
                                      int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel strided matrix scale of 8-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  args      pointer to plp_mat_scale_stride_instance_i8 struct initialized by
                        plp_mat_scale_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_scale_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for strided matrix scale of a 32-bit floating-point matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_f32(const float *__restrict__ pSrc,
                              uint32_t M,
                              uint32_t N,
                              uint32_t strideSrc,
                              uint32_t strideDst,
                              float scaleFactor,
                              float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      strided matrix scale of a 32-bit floating-point matrices for XPULPV2 extension.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_f32s_xpulpv2(const float *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       float scaleFactor,
                                       float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for parallel strided matrix scale of a 32-bit floating-point matrices.
  @param[in]  pSrc        Points to the input matrix
  @param[in]  M           Height of both matrices
  @param[in]  N           Width of both matrices
  @param[in]  strideSrc   Stride for input matrix (elements between each row)
  @param[in]  strideDst   Stride for output matrix (elements between each row)
  @param[in]  scaleFactor Factor to mulitply all elements
  @param[in]  nPE         Number of cores to use for computation
  @param[out] pDst        Points to the output matrix
  @return     none
*/

void plp_mat_scale_stride_f32_parallel(const float *__restrict__ pSrc,
                                       uint32_t M,
                                       uint32_t N,
                                       uint32_t strideSrc,
                                       uint32_t strideDst,
                                       float scaleFactor,
                                       uint32_t nPE,
                                       float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief Parallel strided matrix scale of 32-bit floating-point matrices kernel for XPULPV2
         extension.
  @param[in]  args      pointer to plp_mat_scale_stride_instance_f32 struct initialized by
                        plp_mat_scale_stride_f32_parallel
  @return  none
*/

void plp_mat_scale_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 32-bit integers identity matrix
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i32(uint32_t N, uint32_t stride, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit integers identity matrix on RV32IM
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i32s_rv32im(uint32_t N, uint32_t stride, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit integers identity matrix on XpulpV2
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i32s_xpulpv2(uint32_t N, uint32_t stride, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 32-bit integers identity matrix in parallel
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for computation
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i32_parallel(uint32_t N,
                                        uint32_t stride,
                                        uint32_t nPE,
                                        int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit integers identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_i32 struct initialized by
                    plp_mat_fill_I_stride_i32_parallel
  @return     none
*/

void plp_mat_fill_I_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 16-bit integers identity matrix
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i16(uint32_t N, uint32_t stride, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 16-bit integers identity matrix on RV32IM
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i16s_rv32im(uint32_t N, uint32_t stride, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 16-bit integers identity matrix on XpulpV2
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_i16s_xpulpv2(uint32_t N, uint32_t stride, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 16-bit integers identity matrix in parallel
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for computation
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i16_parallel(uint32_t N,
                                        uint32_t stride,
                                        uint32_t nPE,
                                        int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 16-bit integers identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_i16 struct initialized by
                    plp_mat_fill_I_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 8-bit integers identity matrix
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i8(uint32_t N, uint32_t stride, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 8-bit integers identity matrix on RV32IM
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i8s_rv32im(uint32_t N, uint32_t stride, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 8-bit integers identity matrix on XpulpV2
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_i8s_xpulpv2(uint32_t N, uint32_t stride, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 8-bit integers identity matrix in parallel
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for computation
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_i8_parallel(uint32_t N,
                                       uint32_t stride,
                                       uint32_t nPE,
                                       int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 8-bit integers identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_i8 struct initialized by
                    plp_mat_fill_I_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 32-bit floats identity matrix
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_f32(uint32_t N, uint32_t stride, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit floats identity matrix on XpulpV2
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_f32s_xpulpv2(uint32_t N, uint32_t stride, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 32-bit floats identity matrix in parallel
  @param[in]  N      Width and height of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for computation
  @param[out] pDst   Points to the output matrix
  @return     none
*/

void plp_mat_fill_I_stride_f32_parallel(uint32_t N,
                                        uint32_t stride,
                                        uint32_t nPE,
                                        float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit floats identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_f32 struct initialized by
                    plp_mat_fill_I_stride_f32_parallel
  @return     none
*/

void plp_mat_fill_I_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 32-bit fix-point identity matrix
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q32(uint32_t N,
                               uint32_t stride,
                               int32_t fracBits,
                               int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit fix-point identity matrix on RV32IM
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q32s_rv32im(uint32_t N,
                                       uint32_t stride,
                                       int32_t fracBits,
                                       int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit fix-point identity matrix on XpulpV2
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q32s_xpulpv2(uint32_t N,
                                        uint32_t stride,
                                        int32_t fracBits,
                                        int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 32-bit fix-point identity matrix in parallel
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[in]  nPE      Number of cores to use for computation
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q32_parallel(
    uint32_t N, uint32_t stride, int32_t fracBits, uint32_t nPE, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 32-bit fix-point identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_q32 struct initialized by
                    plp_mat_fill_I_stride_q32_parallel
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 16-bit fix-point identity matrix
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q16(uint32_t N,
                               uint32_t stride,
                               int32_t fracBits,
                               int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 16-bit fix-point identity matrix on RV32IM
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q16s_rv32im(uint32_t N,
                                       uint32_t stride,
                                       int32_t fracBits,
                                       int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 16-bit fix-point identity matrix on XpulpV2
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_q16s_xpulpv2(uint32_t N,
                                        uint32_t stride,
                                        int32_t fracBits,
                                        int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 16-bit fix-point identity matrix in parallel
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[in]  nPE      Number of cores to use for computation
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q16_parallel(
    uint32_t N, uint32_t stride, int32_t fracBits, uint32_t nPE, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 16-bit fix-point identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_q16 struct initialized by
                    plp_mat_fill_I_stride_q16_parallel
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_q16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 8-bit fix-point identity matrix
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q8(uint32_t N,
                              uint32_t stride,
                              int32_t fracBits,
                              int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 8-bit fix-point identity matrix on RV32IM
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q8s_rv32im(uint32_t N,
                                      uint32_t stride,
                                      int32_t fracBits,
                                      int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 8-bit fix-point identity matrix on XpulpV2
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_q8s_xpulpv2(uint32_t N,
                                       uint32_t stride,
                                       int32_t fracBits,
                                       int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for creating a strided 8-bit fix-point identity matrix in parallel
  @param[in]  N        Width and height of the matrix
  @param[in]  stride   Stride of the matrix (elements between each row)
  @param[in]  fracBits Decimal point for the appropriate scale
  @param[in]  nPE      Number of cores to use for computation
  @param[out] pDst     Points to the output matrix
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.
*/

void plp_mat_fill_I_stride_q8_parallel(
    uint32_t N, uint32_t stride, int32_t fracBits, uint32_t nPE, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Create a strided 8-bit fix-point identity matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_I_stride_instance_q8 struct initialized by
                    plp_mat_fill_I_stride_q8_parallel
  @return     none

  @par Fix-Point
  The diagonal elements will be filled with the value: `1 << fracBits`.

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_stride_q8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 32-bit integers matrix
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return  none
*/

void plp_mat_fill_stride_i32(
    uint32_t M, uint32_t N, uint32_t stride, int32_t value, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 32-bit integers matrix on RV32IM
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return  none
*/

void plp_mat_fill_stride_i32s_rv32im(
    uint32_t M, uint32_t N, uint32_t stride, int32_t value, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 32-bit integers matrix on XpulpV2
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i32s_xpulpv2(
    uint32_t M, uint32_t N, uint32_t stride, int32_t value, int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 32-bit integers matrix in parallel
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for processing
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i32_parallel(uint32_t M,
                                      uint32_t N,
                                      uint32_t stride,
                                      int32_t value,
                                      uint32_t nPE,
                                      int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 32-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_stride_instance_i32 struct initialized by
                    plp_mat_fill_stride_i32_parallel
  @return     none
*/

void plp_mat_fill_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 16-bit integers matrix
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i16(
    uint32_t M, uint32_t N, uint32_t stride, int16_t value, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 16-bit integers matrix on RV32IM
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i16s_rv32im(
    uint32_t M, uint32_t N, uint32_t stride, int16_t value, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 16-bit integers matrix on XpulpV2
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_stride_i16s_xpulpv2(
    uint32_t M, uint32_t N, uint32_t stride, int16_t value, int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 16-bit integers matrix in parallel
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for processing
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i16_parallel(uint32_t M,
                                      uint32_t N,
                                      uint32_t stride,
                                      int16_t value,
                                      uint32_t nPE,
                                      int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 16-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_stride_instance_i16 struct initialized by
                    plp_mat_fill_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 8-bit integers matrix
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i8(
    uint32_t M, uint32_t N, uint32_t stride, int8_t value, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 8-bit integers matrix on RV32IM
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i8s_rv32im(
    uint32_t M, uint32_t N, uint32_t stride, int8_t value, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 8-bit integers matrix on XpulpV2
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_stride_i8s_xpulpv2(
    uint32_t M, uint32_t N, uint32_t stride, int8_t value, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 8-bit integers matrix in parallel
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for processing
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_i8_parallel(
    uint32_t M, uint32_t N, uint32_t stride, int8_t value, uint32_t nPE, int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 8-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_stride_instance_i8 struct initialized by
                    plp_mat_fill_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 32-bit floats matrix
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_f32(
    uint32_t M, uint32_t N, uint32_t stride, float value, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 32-bit floats matrix on XpulpV2
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_f32s_xpulpv2(
    uint32_t M, uint32_t N, uint32_t stride, float value, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code for filling an MxN strided 32-bit floats matrix in parallel
  @param[in]  M      Height of the matrix
  @param[in]  N      Width of the matrix
  @param[in]  stride Stride of the matrix (elements between each row)
  @param[in]  nPE    Number of cores to use for processing
  @param[out] pSrc   Points to the output matrix
  @return     none
*/

void plp_mat_fill_stride_f32_parallel(
    uint32_t M, uint32_t N, uint32_t stride, float value, uint32_t nPE, float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Fill an MxN strided 32-bit floats matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_fill_stride_instance_f32 struct initialized by
                    plp_mat_fill_stride_f32_parallel
  @return  none
*/

void plp_mat_fill_stride_f32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 32-bit integers matrix
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return  none
*/

void plp_mat_copy_stride_i32(const int32_t *__restrict__ pSrc,
                             uint32_t M,
                             uint32_t N,
                             uint32_t strideSrc,
                             uint32_t strideDst,
                             int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 32-bit integers matrix on RV32IM
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return  none
*/

void plp_mat_copy_stride_i32s_rv32im(const int32_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 32-bit integers matrix on XpulpV2
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i32s_xpulpv2(const int32_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 32-bit integers matrix in parallel
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[in]  nPE       Number of cores to use for processing
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i32_parallel(const int32_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      uint32_t nPE,
                                      int32_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 32-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_copy_stride_instance_i32 struct initialized by
                    plp_mat_copy_stride_i32_parallel
  @return     none
*/

void plp_mat_copy_stride_i32p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 16-bit integers matrix
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i16(const int16_t *__restrict__ pSrc,
                             uint32_t M,
                             uint32_t N,
                             uint32_t strideSrc,
                             uint32_t strideDst,
                             int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 16-bit integers matrix on RV32IM
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i16s_rv32im(const int16_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 16-bit integers matrix on XpulpV2
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_copy_stride_i16s_xpulpv2(const int16_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 16-bit integers matrix in parallel
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[in]  nPE       Number of cores to use for processing
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i16_parallel(const int16_t *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      uint32_t nPE,
                                      int16_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 16-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_copy_stride_instance_i16 struct initialized by
                    plp_mat_copy_stride_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_copy_stride_i16p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 8-bit integers matrix
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i8(const int8_t *__restrict__ pSrc,
                            uint32_t M,
                            uint32_t N,
                            uint32_t strideSrc,
                            uint32_t strideDst,
                            int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 8-bit integers matrix on RV32IM
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i8s_rv32im(const int8_t *__restrict__ pSrc,
                                    uint32_t M,
                                    uint32_t N,
                                    uint32_t strideSrc,
                                    uint32_t strideDst,
                                    int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 8-bit integers matrix on XpulpV2
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_copy_stride_i8s_xpulpv2(const int8_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 8-bit integers matrix in parallel
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[in]  nPE       Number of cores to use for processing
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_i8_parallel(const int8_t *__restrict__ pSrc,
                                     uint32_t M,
                                     uint32_t N,
                                     uint32_t strideSrc,
                                     uint32_t strideDst,
                                     uint32_t nPE,
                                     int8_t *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 8-bit integers matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_copy_stride_instance_i8 struct initialized by
                    plp_mat_copy_stride_i8_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_copy_stride_i8p_xpulpv2(void *args);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 32-bit floats matrix
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_f32(const float *__restrict__ pSrc,
                             uint32_t M,
                             uint32_t N,
                             uint32_t strideSrc,
                             uint32_t strideDst,
                             float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 32-bit floats matrix on XpulpV2
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_f32s_xpulpv2(const float *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Glue code to copy an MxN strided 32-bit floats matrix in parallel
  @param[in]  pSrc      Points to the input matrix of shape MxN
  @param[in]  M         Height of both matrices
  @param[in]  N         Width of both matrices
  @param[in]  strideSrc Stride of the input matrix (elements between each row)
  @param[in]  strideDst Stride of the output matrix (elements between each row)
  @param[in]  nPE       Number of cores to use for processing
  @param[out] pDst      Points to the output matrix of shape MxN
  @return     none
*/

void plp_mat_copy_stride_f32_parallel(const float *__restrict__ pSrc,
                                      uint32_t M,
                                      uint32_t N,
                                      uint32_t strideSrc,
                                      uint32_t strideDst,
                                      uint32_t nPE,
                                      float *__restrict__ pDst);

/** -------------------------------------------------------
  @brief      Copy an MxN strided 32-bit floats matrix on XpulpV2 in parallel
  @param[in]  args  pointer to plp_mat_copy_stride_instance_f32 struct initialized by
                    plp_mat_copy_stride_f32_parallel
  @return  none
*/

void plp_mat_copy_stride_f32p_xpulpv2(void *args);

/**
  @brief Glue code for complex conjugate of 32-bit float vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_conj_f32(const float32_t *__restrict__ pSrc,
                        float32_t *__restrict__ pDst,
                        uint32_t numSamples);

/**
  @brief         Floating-point complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_f32_xpulpv2(const float32_t *__restrict__ pSrc,
                                float32_t *__restrict__ pDst,
                                uint32_t numSamples);

/**
  @brief Glue code for complex conjugate of 32-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_conj_i32(const int32_t *__restrict__ pSrc,
                        int32_t *__restrict__ pDst,
                        uint32_t numSamples);

/**
  @brief         32-bit integer complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_i32_xpulpv2(const int32_t *__restrict__ pSrc,
                                int32_t *__restrict__ pDst,
                                uint32_t numSamples);

/**
  @brief         32-bit integer complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_i32_rv32im(const int32_t *__restrict__ pSrc,
                               int32_t *__restrict__ pDst,
                               uint32_t numSamples);

/**
  @brief Glue code for complex conjugate of 16-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_conj_i16(const int16_t *__restrict__ pSrc,
                        int16_t *__restrict__ pDst,
                        uint32_t numSamples);

/**
  @brief         16-bit integer complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_i16_xpulpv2(const int16_t *__restrict__ pSrc,
                                int16_t *__restrict__ pDst,
                                uint32_t numSamples);

/**
  @brief         16-bit integer complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_i16_rv32im(const int16_t *__restrict__ pSrc,
                               int16_t *__restrict__ pDst,
                               uint32_t numSamples);

/**
  @brief Glue code for complex conjugate of 8-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_conj_i8(const int8_t *__restrict__ pSrc,
                       int8_t *__restrict__ pDst,
                       uint32_t numSamples);

/**
  @brief         8-bit integer complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_i8_xpulpv2(const int8_t *__restrict__ pSrc,
                               int8_t *__restrict__ pDst,
                               uint32_t numSamples);

/**
  @brief         8-bit integer complex conjugate.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_conj_i8_rv32im(const int8_t *__restrict__ pSrc,
                              int8_t *__restrict__ pDst,
                              uint32_t numSamples);

/**
  @brief Glue code for complex dot product of 32-bit float vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_dot_prod_f32(const float32_t *pSrcA,
                            const float32_t *pSrcB,
                            uint32_t numSamples,
                            float32_t *realResult,
                            float32_t *imagResult);

/**
  @brief         Floating-point complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_f32_xpulpv2(const float32_t *pSrcA,
                                    const float32_t *pSrcB,
                                    uint32_t numSamples,
                                    float32_t *realResult,
                                    float32_t *imagResult);

/**
  @brief Glue code for complex dot product of 32-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_dot_prod_i32(const int32_t *pSrcA,
                            const int32_t *pSrcB,
                            uint32_t numSamples,
                            int32_t *realResult,
                            int32_t *imagResult);

/**
  @brief         32-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_i32_xpulpv2(const int32_t *pSrcA,
                                    const int32_t *pSrcB,
                                    uint32_t numSamples,
                                    int32_t *realResult,
                                    int32_t *imagResult);

/**
  @brief         32-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_i32_rv32im(const int32_t *pSrcA,
                                   const int32_t *pSrcB,
                                   uint32_t numSamples,
                                   int32_t *realResult,
                                   int32_t *imagResult);

/**
  @brief Glue code for complex dot product of 16-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_dot_prod_i16(const int16_t *pSrcA,
                            const int16_t *pSrcB,
                            uint32_t numSamples,
                            int16_t *realResult,
                            int16_t *imagResult);

/**
  @brief         16-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_i16_xpulpv2(const int16_t *pSrcA,
                                    const int16_t *pSrcB,
                                    uint32_t numSamples,
                                    int16_t *realResult,
                                    int16_t *imagResult);

/**
  @brief         16-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_i16_rv32im(const int16_t *pSrcA,
                                   const int16_t *pSrcB,
                                   uint32_t numSamples,
                                   int16_t *realResult,
                                   int16_t *imagResult);

/**
  @brief Glue code for complex dot product of 8-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_dot_prod_i8(const int8_t *pSrcA,
                           const int8_t *pSrcB,
                           uint32_t numSamples,
                           int8_t *realResult,
                           int8_t *imagResult);

/**
  @brief         8-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_i8_xpulpv2(const int8_t *pSrcA,
                                   const int8_t *pSrcB,
                                   uint32_t numSamples,
                                   int8_t *realResult,
                                   int8_t *imagResult);

/**
  @brief         8-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_i8_rv32im(const int8_t *pSrcA,
                                  const int8_t *pSrcB,
                                  uint32_t numSamples,
                                  int8_t *realResult,
                                  int8_t *imagResult);

/**
  @brief Glue code for complex dot product of 32-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_dot_prod_q32(const int32_t *pSrcA,
                            const int32_t *pSrcB,
                            uint32_t numSamples,
                            uint32_t deciPoint,
                            int32_t *realResult,
                            int32_t *imagResult);

/**
  @brief         32-bit fixed-point complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_q32_xpulpv2(const int32_t *pSrcA,
                                    const int32_t *pSrcB,
                                    uint32_t numSamples,
                                    uint32_t deciPoint,
                                    int32_t *realResult,
                                    int32_t *imagResult);

/**
  @brief         32-bit integer complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_q32_rv32im(const int32_t *pSrcA,
                                   const int32_t *pSrcB,
                                   uint32_t numSamples,
                                   uint32_t deciPoint,
                                   int32_t *realResult,
                                   int32_t *imagResult);

/**
  @brief Glue code for complex dot product of 16-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */
void plp_cmplx_dot_prod_q16(const int16_t *pSrcA,
                            const int16_t *pSrcB,
                            uint32_t numSamples,
                            uint32_t deciPoint,
                            int16_t *realResult,
                            int16_t *imagResult);

/**
  @brief         16-bit fixed-point complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_q16_xpulpv2(const int16_t *pSrcA,
                                    const int16_t *pSrcB,
                                    uint32_t numSamples,
                                    uint32_t deciPoint,
                                    int16_t *realResult,
                                    int16_t *imagResult);

/**
  @brief         16-bit fixed-point complex dot product.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_dot_prod_q16_rv32im(const int16_t *pSrcA,
                                   const int16_t *pSrcB,
                                   uint32_t numSamples,
                                   uint32_t deciPoint,
                                   int16_t *realResult,
                                   int16_t *imagResult);

/**
  @brief Glue code for complex multiplied with real of 32-bit float vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_f32(const float32_t *__restrict__ pSrcCmplx,
                             const float32_t *__restrict__ pSrcReal,
                             float32_t *__restrict__ pDst,
                             uint32_t numSamples);

/**
  @brief         Floating-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_f32_xpulpv2(const float32_t *__restrict__ pSrcCmplx,
                                     const float32_t *__restrict__ pSrcReal,
                                     float32_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief Glue code for complex multiplied with real of 32-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i32(const int32_t *__restrict__ pSrcCmplx,
                             const int32_t *__restrict__ pSrcReal,
                             int32_t *__restrict__ pDst,
                             uint32_t numSamples);

/**
  @brief         32-bit integer complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i32_xpulpv2(const int32_t *__restrict__ pSrcCmplx,
                                     const int32_t *__restrict__ pSrcReal,
                                     int32_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief         32-bit integer complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i32_rv32im(const int32_t *__restrict__ pSrcCmplx,
                                    const int32_t *__restrict__ pSrcReal,
                                    int32_t *__restrict__ pDst,
                                    uint32_t numSamples);

/**
  @brief Glue code for complex multiplied with real of 16-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i16(const int16_t *__restrict__ pSrcCmplx,
                             const int16_t *__restrict__ pSrcReal,
                             int16_t *__restrict__ pDst,
                             uint32_t numSamples);

/**
  @brief         16-bit integer complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i16_xpulpv2(const int16_t *__restrict__ pSrcCmplx,
                                     const int16_t *__restrict__ pSrcReal,
                                     int16_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief         16-bit integer complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i16_rv32im(const int16_t *__restrict__ pSrcCmplx,
                                    const int16_t *__restrict__ pSrcReal,
                                    int16_t *__restrict__ pDst,
                                    uint32_t numSamples);

/**
  @brief Glue code for complex multiplied with real of 8-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i8(const int8_t *__restrict__ pSrcCmplx,
                            const int8_t *__restrict__ pSrcReal,
                            int8_t *__restrict__ pDst,
                            uint32_t numSamples);

/**
  @brief         8-bit integer complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i8_xpulpv2(const int8_t *__restrict__ pSrcCmplx,
                                    const int8_t *__restrict__ pSrcReal,
                                    int8_t *__restrict__ pDst,
                                    uint32_t numSamples);

/**
  @brief         8-bit integer complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_i8_rv32im(const int8_t *__restrict__ pSrcCmplx,
                                   const int8_t *__restrict__ pSrcReal,
                                   int8_t *__restrict__ pDst,
                                   uint32_t numSamples);

/**
  @brief Glue code for complex multiplied with real of 32-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q32(const int32_t *__restrict__ pSrcCmplx,
                             const int32_t *__restrict__ pSrcReal,
                             int32_t *__restrict__ pDst,
                             uint32_t deciPoint,
                             uint32_t numSamples);

/**
  @brief         32-bit fixed-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q32_xpulpv2(const int32_t *__restrict__ pSrcCmplx,
                                     const int32_t *__restrict__ pSrcReal,
                                     int32_t *__restrict__ pDst,
                                     uint32_t deciPoint,
                                     uint32_t numSamples);

/**
  @brief         32-bit fixed-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q32_rv32im(const int32_t *__restrict__ pSrcCmplx,
                                    const int32_t *__restrict__ pSrcReal,
                                    int32_t *__restrict__ pDst,
                                    uint32_t deciPoint,
                                    uint32_t numSamples);

/**
  @brief Glue code for complex multiplied with real of 16-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q16(const int16_t *__restrict__ pSrcCmplx,
                             const int16_t *__restrict__ pSrcReal,
                             int16_t *__restrict__ pDst,
                             uint32_t deciPoint,
                             uint32_t numSamples);

/**
  @brief         16-bit fixed-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q16_xpulpv2(const int16_t *__restrict__ pSrcCmplx,
                                     const int16_t *__restrict__ pSrcReal,
                                     int16_t *__restrict__ pDst,
                                     uint32_t deciPoint,
                                     uint32_t numSamples);

/**
  @brief         16-bit fixed-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q16_rv32im(const int16_t *__restrict__ pSrcCmplx,
                                    const int16_t *__restrict__ pSrcReal,
                                    int16_t *__restrict__ pDst,
                                    uint32_t deciPoint,
                                    uint32_t numSamples);

/**
  @brief Glue code for complex multiplied with real of 8-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q8(const int8_t *__restrict__ pSrcCmplx,
                            const int8_t *__restrict__ pSrcReal,
                            int8_t *__restrict__ pDst,
                            uint32_t deciPoint,
                            uint32_t numSamples);

/**
  @brief         8-bit fixed-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q8_xpulpv2(const int8_t *__restrict__ pSrcCmplx,
                                    const int8_t *__restrict__ pSrcReal,
                                    int8_t *__restrict__ pDst,
                                    uint32_t deciPoint,
                                    uint32_t numSamples);

/**
  @brief         8-bit fixed-point complex multiplied with real.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_real_q8_rv32im(const int8_t *__restrict__ pSrcCmplx,
                                   const int8_t *__restrict__ pSrcReal,
                                   int8_t *__restrict__ pDst,
                                   uint32_t deciPoint,
                                   uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 32-bit float vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_f32(const float32_t *__restrict__ pSrc,
                               float32_t *__restrict__ pDst,
                               uint32_t numSamples);

/**
  @brief         Floating-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_f32_xpulpv2(const float32_t *__restrict__ pSrc,
                                       float32_t *__restrict__ pDst,
                                       uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 16-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i16(const int16_t *__restrict__ pSrc,
                               int16_t *__restrict__ pDst,
                               uint32_t numSamples);

/**
  @brief         16-bit integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i16_rv32im(const int16_t *__restrict__ pSrc,
                                      int16_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief         16 bit Integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i16_xpulpv2(const int16_t *__restrict__ pSrc,
                                       int16_t *__restrict__ pDst,
                                       uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 32-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i32(const int32_t *__restrict__ pSrc,
                               int32_t *__restrict__ pDst,
                               uint32_t numSamples);

/**
  @brief         32-bit integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i32_rv32im(const int32_t *__restrict__ pSrc,
                                      int32_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief         32-bit integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i32_xpulpv2(const int32_t *__restrict__ pSrc,
                                      int32_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief         8 bit Integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i8_xpulpv2(const int8_t *__restrict__ pSrc,
                                      int8_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 32-bit integer vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i8(const int8_t *__restrict__ pSrc,
                              int8_t *__restrict__ pDst,
                              uint32_t numSamples);

/**
  @brief         8-bit integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i8_rv32im(const int8_t *__restrict__ pSrc,
                                     int8_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief         8 bit Integer complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_i8_xpulpv2(const int8_t *__restrict__ pSrc,
                                      int8_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 32-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q32(const int32_t *__restrict__ pSrc,
                               int32_t *__restrict__ pDst,
                               uint32_t deciPoint,
                               uint32_t numSamples);

/**
  @brief         32-bit fixed-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q32_rv32im(const int32_t *__restrict__ pSrc,
                                      int32_t *__restrict__ pDst,
                                      uint32_t deciPoint,
                                      uint32_t numSamples);

/**
  @brief         32 bit fixed-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q32_xpulpv2(const int32_t *__restrict__ pSrc,
                                       int32_t *__restrict__ pDst,
                                       uint32_t deciPoint,
                                       uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 16-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q16(const int16_t *__restrict__ pSrc,
                               int16_t *__restrict__ pDst,
                               uint32_t deciPoint,
                               uint32_t numSamples);

/**
  @brief         16-bit fixed-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q16_rv32im(const int16_t *__restrict__ pSrc,
                                      int16_t *__restrict__ pDst,
                                      uint32_t deciPoint,
                                      uint32_t numSamples);

/**
  @brief         16 bit fixed-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q16_xpulpv2(const int16_t *__restrict__ pSrc,
                                       int16_t *__restrict__ pDst,
                                       uint32_t deciPoint,
                                       uint32_t numSamples);

/**
  @brief Glue code for complex squared magnitude of 8-bit fixed-point vectors.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q8(const int8_t *__restrict__ pSrc,
                              int8_t *__restrict__ pDst,
                              uint32_t deciPoint,
                              uint32_t numSamples);

/**
  @brief         8-bit fixed-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q8_rv32im(const int8_t *__restrict__ pSrc,
                                     int8_t *__restrict__ pDst,
                                     uint32_t deciPoint,
                                     uint32_t numSamples);

/**
  @brief         8 bit fixed-point complex squared magnitude.
  @param[in]     pSrc        points to the input vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mag_squared_q8_xpulpv2(const int8_t *__restrict__ pSrc,
                                      int8_t *__restrict__ pDst,
                                      uint32_t deciPoint,
                                      uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 32-bit float vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_f32(const float32_t *__restrict__ pSrcA,
                              const float32_t *__restrict__ pSrcB,
                              float32_t *__restrict__ pDst,
                              uint32_t numSamples);

/**
  @brief         Floating-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_f32_xpulpv2(const float32_t *__restrict__ pSrcA,
                                      const float32_t *__restrict__ pSrcB,
                                      float32_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 32-bit integer vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i32(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              int32_t *__restrict__ pDst,
                              uint32_t numSamples);

/**
  @brief         32-bit integer complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i32_xpulpv2(const int32_t *__restrict__ pSrcA,
                                      const int32_t *__restrict__ pSrcB,
                                      int32_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief         32-bit integer complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i32_rv32im(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     int32_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 16-bit integer vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i16(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              int16_t *__restrict__ pDst,
                              uint32_t numSamples);

/**
  @brief         16-bit integer complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i16_xpulpv2(const int16_t *__restrict__ pSrcA,
                                      const int16_t *__restrict__ pSrcB,
                                      int16_t *__restrict__ pDst,
                                      uint32_t numSamples);

/**
  @brief         16-bit integer complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i16_rv32im(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     int16_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 8-bit integer vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i8(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             int8_t *__restrict__ pDst,
                             uint32_t numSamples);

/**
  @brief         8-bit integer complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i8_xpulpv2(const int8_t *__restrict__ pSrcA,
                                     const int8_t *__restrict__ pSrcB,
                                     int8_t *__restrict__ pDst,
                                     uint32_t numSamples);

/**
  @brief         8-bit integer complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_i8_rv32im(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    int8_t *__restrict__ pDst,
                                    uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 32-bit fixed-point vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q32(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              int32_t *__restrict__ pDst,
                              uint32_t deciPoint,
                              uint32_t numSamples);

/**
  @brief         32-bit fixed-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q32_xpulpv2(const int32_t *__restrict__ pSrcA,
                                      const int32_t *__restrict__ pSrcB,
                                      int32_t *__restrict__ pDst,
                                      uint32_t deciPoint,
                                      uint32_t numSamples);

/**
  @brief         32-bit fixed-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q32_rv32im(const int32_t *__restrict__ pSrcA,
                                     const int32_t *__restrict__ pSrcB,
                                     int32_t *__restrict__ pDst,
                                     uint32_t deciPoint,
                                     uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 16-bit fixed-point vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q16(const int16_t *__restrict__ pSrcA,
                              const int16_t *__restrict__ pSrcB,
                              int16_t *__restrict__ pDst,
                              uint32_t deciPoint,
                              uint32_t numSamples);

/**
  @brief         16-bit fixed-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q16_xpulpv2(const int16_t *__restrict__ pSrcA,
                                      const int16_t *__restrict__ pSrcB,
                                      int16_t *__restrict__ pDst,
                                      uint32_t deciPoint,
                                      uint32_t numSamples);

/**
  @brief         16-bit fixed-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q16_rv32im(const int16_t *__restrict__ pSrcA,
                                     const int16_t *__restrict__ pSrcB,
                                     int16_t *__restrict__ pDst,
                                     uint32_t deciPoint,
                                     uint32_t numSamples);

/**
  @brief Glue code for complex multiplied by complex of 8-bit fixed-point vectors.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q8(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             int8_t *__restrict__ pDst,
                             uint32_t deciPoint,
                             uint32_t numSamples);

/**
  @brief         8-bit fixed-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q8_xpulpv2(const int8_t *__restrict__ pSrcA,
                                     const int8_t *__restrict__ pSrcB,
                                     int8_t *__restrict__ pDst,
                                     uint32_t deciPoint,
                                     uint32_t numSamples);

/**
  @brief         8-bit fixed-point complex multiplied by complex.
  @param[in]     pSrcA       points to the first input vector
  @param[in]     pSrcB       points to the second vector
  @param[out]    pDst        points to the output vector
  @param[in]     deciPoint   decimal point for right shift
  @param[in]     numSamples  number of samples in each vector
  @return        none
 */

void plp_cmplx_mult_cmplx_q8_rv32im(const int8_t *__restrict__ pSrcA,
                                    const int8_t *__restrict__ pSrcB,
                                    int8_t *__restrict__ pDst,
                                    uint32_t deciPoint,
                                    uint32_t numSamples);

#endif // __PLP_MATH_H__
