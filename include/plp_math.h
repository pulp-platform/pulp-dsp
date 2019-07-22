/** ==========================================================================
 * @file     plp_math.h
 * @brief    Public header file for PULP DSP Library
 * @version  V0
 * @date     16. May 2019
 * =========================================================================== */
/*
 * Copyright (C) 2019 Xiaying Wang, IIS, ETH Zurich. All rights reserved.
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
   */

/**
 * @defgroup groupMath Basic Math Functions
 * The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s_rv32im):
 <pre>
 <pulp> _ <function name> _ <data type> <precision> <method> _ <isa extension>, with

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

#define PLP_MATH_IBEX // previously called zero-riscy
//#define PLP_MATH_RISCY
#define PLP_MATH_LOOPUNROLL


/** -------------------------------------------------------
 * @brief Instance structure for integer parallel dot product.
 */
typedef struct
{
  int32_t * pSrcA;     // pointer to the first vector
  int32_t * pSrcB;     // pointer to the second vector
  uint32_t blkSizePE;     // number of samples in each vector
  uint32_t nPE;        // number of processing units
  int32_t * resBuffer;      // pointer to result vector
} plp_dot_prod_instance_i32;

typedef struct {
  const int32_t * pSrcA;     // pointer to the first vector
  uint32_t srcALen;
  const int32_t * pSrcB;     // pointer to the second vector
  uint32_t srcBLen;     // number of samples in each vector
  uint8_t nPE;        // number of processing units
  int32_t * pRes;      // pointer to result vector
} plp_conv_instance_i32;

typedef struct {
  const int16_t * pSrcA;     // pointer to the first vector
  uint32_t srcALen;
  const int16_t * pSrcB;     // pointer to the second vector
  uint32_t srcBLen;     // number of samples in each vector
  uint8_t nPE;        // number of processing units
  int32_t * pRes;      // pointer to result vector
} plp_conv_instance_i16;

typedef struct {
  const int8_t * pSrcA;     // pointer to the first vector
  uint32_t srcALen;
  const int8_t * pSrcB;     // pointer to the second vector
  uint32_t srcBLen;     // number of samples in each vector
  uint8_t nPE;        // number of processing units
  int32_t * pRes;      // pointer to result vector
} plp_conv_instance_i8;

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
 * @brief Instance structure for fixed point parallel dot product.
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
   @brief Glue code for parallel dot product of 32-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  nPE        number of parallel processing units
   @param[out] result     output result returned here
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
   @param[out] result     output result returned here
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
   @brief Scalar dot product with interleaved access of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[out] result     output result returned here
   @return        none
*/

void plp_dot_prod_i32p_xpulpv2(void * S);



/** -------------------------------------------------------
   @brief Scalar dot product with interleaved access of 32-bit fixed point vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  blockSize  number of samples in each vector
   @param[in]  deciPoint  decimal point for right shift
   @param[out] result     output result returned here
   @return        none
*/

void plp_dot_prod_q32p_xpulpv2(void * S);



/** -------------------------------------------------------
* @brief Glue code for dot product of 32-bit integer vectors.
* @param[in]  pSrcA      points to the first input vector
* @param[in]  pSrcB      points to the second input vector
* @param[in]  blockSize  number of samples in each vector
* @param[out] result     output result returned here
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
 * @param[out] result     output result returned here
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
 * @param[out] result     output result returned here
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
   @param[out] result     output result returned here
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
   @param[out] result     output result returned here
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
   @param[out] result     output result returned here
   @return        none
*/

void plp_dot_prod_q32s_xpulpv2(
                               const int32_t * __restrict__ pSrcA,
                               const int32_t * __restrict__ pSrcB,
                               uint32_t blockSize,
                               uint32_t deciPoint,
                               int32_t * __restrict__ pRes);



/** -------------------------------------------------------
 * @brief Glue code for dot product of 16-bit integer vectors.
 * @param[in]  pSrcA      points to the first input vector [16 bit]
 * @param[in]  pSrcB      points to the second input vector [16 bit]
 * @param[in]  blockSize  number of samples in each vector
 * @param[out] result     output result returned here [32 bit]
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
  @param[out] result     output result returned here [32 bit]
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
  @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
    @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out] result     output result returned here [32 bit]
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
   @param[out]    pResult    mean value returned here
   @return        none
*/

void plp_mean_i32s_xpulpv2(
                           const int32_t * __restrict__ pSrc,
                           uint32_t blockSize,
                           int32_t * __restrict__ pRes);

/**
  @brief Glue code for convolution of 32-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[out] result     output result returned here
  @return        none
 */

void plp_conv_i32(
                       const int32_t * pSrcA,
		       const uint32_t srcALen,
                       const int32_t * pSrcB,
		       const uint32_t srcBLen,
                       int32_t * pRes);

/**
   @brief Convolution of 32-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

void plp_conv_i32s_rv32im(const int32_t * pSrcA,
			      const uint32_t srcALen,
			      const int32_t * pSrcB,
			      const uint32_t srcBLen,
			      int32_t * pRes);

/**
   @brief Convolution of 32-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

void plp_conv_i32s_xpulpv2(const int32_t * __restrict__ pSrcA,
			      const uint32_t srcALen,
			      const int32_t * __restrict__ pSrcB,
			      const uint32_t srcBLen,
			      int32_t * __restrict__ pRes);


/**
  @brief Glue code for convolution of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[out] result     output result returned here
  @return        none
 */

void plp_conv_i16(const int16_t *  pSrcA,
		  const uint32_t srcALen,
		  const int16_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);

/**
   @brief Convolution of 16-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

void plp_conv_i16s_xpulpv2(const int16_t *  pSrcA,
			   const uint32_t srcALen,
			   const int16_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);
/**
   @brief Convolution of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

void plp_conv_i16s_rv32im(const int16_t *  pSrcA,
			  const uint32_t srcALen,
			  const int16_t *  pSrcB,
			  const uint32_t srcBLen,
			  int32_t *  pRes);

/**
  @brief Glue code for convolution of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[out] result     output result returned here
  @return        none
 */

void plp_conv_i8(const int8_t *  pSrcA,
		  const uint32_t srcALen,
		  const int8_t *  pSrcB,
		  const uint32_t srcBLen,
		  int32_t *  pRes);

/**
   @brief Convolution of 8-bit integer vectors kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

void plp_conv_i8s_xpulpv2(const int8_t *  pSrcA,
			   const uint32_t srcALen,
			   const int8_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes);

/**
   @brief Convolution of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

void plp_conv_i8s_rv32im(const int8_t *  pSrcA,
			  const uint32_t srcALen,
			  const int8_t *  pSrcB,
			  const uint32_t srcBLen,
			  int32_t *  pRes);

/**
  @brief Glue code for parallel convolution of 32-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[in]  nPe       Number of cores to compute on
  @param[out] result     output result returned here
  @return        none
 */

void plp_conv_i32_parallel(
                       const int32_t *  pSrcA,
		       const uint32_t srcALen,
                       const int32_t *  pSrcB,
		       const uint32_t srcBLen,
		       const uint8_t nPE,
                       int32_t *  pRes);

/**
  @brief Setup code for parallel convolution of 32-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i32 struct initialized by plp_conv_i32_parallel
  @return        none
 */

void plp_conv_i32p_xpulpv2(void* task_args);

/**
  @brief Glue code for parallel convolution of 16-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[in]  nPe       Number of cores to compute on
  @param[out] result     output result returned here
  @return        none
 */

void plp_conv_i16_parallel(
                       const int16_t *  pSrcA,
		       const uint32_t srcALen,
                       const int16_t *  pSrcB,
		       const uint32_t srcBLen,
		       const uint8_t nPE,
                       int32_t *  pRes);
/**
  @brief Setup code for parallel convolution of 16-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i16 struct initialized by plp_conv_i16_parallel
  @return        none
 */

void plp_conv_i16p_xpulpv2(void* task_args);

/**
  @brief Glue code for parallel convolution of 8-bit integer vectors.
  @param[in]  pSrcA      points to the first input vector
  @param[in]  SrcALen   Length of the first input vector
  @param[in]  pSrcB      points to the second input vector
  @param[in]  SrcBLen   Length of the second input vector
  @param[in]  nPe       Number of cores to compute on
  @param[out] result     output result returned here
  @return        none
 */

void plp_conv_i8_parallel(
                       const int8_t *  pSrcA,
		       const uint32_t srcALen,
                       const int8_t *  pSrcB,
		       const uint32_t srcBLen,
		       const uint8_t nPE,
                       int32_t *  pRes);
/**
  @brief Setup code for parallel convolution of 8-bit integer vectors.
  @param[in]  task_args      pointer to plp_conv_instance_i8 struct initialized by plp_conv_i8_parallel
  @return        none
 */
void plp_conv_i8p_xpulpv2(void* task_args);

/**
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] nPE Number of processing cores
   @param[in] srcALen Length of the first original input vector
   @param[in] srcBLen Length of the second original input vector
   @param[in] resultsBuffer resultsBuffer array from plp_conv_i[XX]_parallel
   @return none
*/

void plp_conv_parallel_OLA(uint32_t nPE, uint32_t srcALen, uint32_t srcBLen, int32_t* resultsBuffer);

/**
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] task_args  Holds the plp_conv_tree_add_instance that describes the vector parameters
   @return none
*/
void plp_conv_parallel_OLA_kernel(void* task_args);

#endif // __PLP_MATH_H__
