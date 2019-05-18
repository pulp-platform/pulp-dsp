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
 * The naming of the functions follows the following pattern (for example plp_dot_prod_i32s):
 <pre>
 pulp _ function name _ data type precision method, with

 data type = {f, i, q} respectively for floats, integers, fixed points

 precision = {32, 16, 8} bits

 method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

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


#ifndef __PLP_MATH_H__
#define __PLP_MATH_H__

#include "rt/rt_api.h"
#include "math.h"

#define PLP_MATH_IBEX // previously called zero-riscy
//#define PLP_MATH_RISCY
#define PLP_MATH_LOOPUNROLL

/** -------------------------------------------------------
* @brief Scalar dot product of 32-bit integer vectors.
* @param[in]  pSrcA      points to the first input vector
* @param[in]  pSrcB      points to the second input vector
* @param[in]  blockSize  number of samples in each vector
* @param[out] result     output result returned here
*/
void plp_dot_prod_i32s(
                      const int32_t * pSrcA,
                      const int32_t * pSrcB,
                      uint32_t blockSize,
                      int32_t * result
                       );

/** -------------------------------------------------------
 * @brief Scalar dot product of 32-bit integer vectors.
 * @param[in]  pSrcA      points to the first input vector
 * @param[in]  pSrcB      points to the second input vector
 * @param[in]  blockSize  number of samples in each vector
 * @param[in]  deciPoint  decimal point for fixed point shifting
 * @param[out] result     output result returned here
 */
void plp_dot_prod_q32s(
                       const int32_t * pSrcA,
                       const int32_t * pSrcB,
                       uint32_t blockSize,
                       uint32_t deciPoint,
                       int32_t * result
                       );

/** -------------------------------------------------------
 * @brief Vectorized dot product of 16-bit integer vectors.
 * @param[in]  pSrcA      points to the first input vector [16 bit]
 * @param[in]  pSrcB      points to the second input vector [16 bit]
 * @param[in]  blockSize  number of samples in each vector
 * @param[out] result     output result returned here [32 bit]
 */
void plp_dot_prod_i16v(
                       const int16_t * pSrcA,
                       const int16_t * pSrcB,
                       uint32_t blockSize,
                       int32_t * result
                       );


#endif // __PLP_MATH_H__
