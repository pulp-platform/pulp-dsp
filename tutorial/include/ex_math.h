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
 * The naming scheme of the functions follows the following pattern (for example
 ex_dot_prod_i32s_rv32im): <pre>
 \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

 data type = {f, i, q} respectively for floats, integers, fixed points

 precision = {32, 16, 8} bits

 method = {s, p} respectively meaning single core or parallel multicore implementation.

 isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

 </pre>

*/

/**
 * @defgroup groupCmplxMath Complex Math Functions
 */
/**


/**
 * @defgroup groupFilters Filtering Functions
 */

/**
 * @defgroup groupMatrix Matrix Functions
 * The naming scheme of the functions follows the following pattern (for example
 plp_mat_mult_i32s_rv32im): <pre>
 \<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

 data type = {f, i, q} respectively for floats, integers, fixed points

 precision = {32, 16, 8} bits

 method = {s, p} respectively meaning single core or parallel multicore implementation.

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

#include "math.h"
#include "rt/rt_api.h"

typedef float float32_t;

//#define PLP_MATH_LOOPUNROLL
//#define USE_SIMD

/**
   @brief Glue code for dot product of 8-bit integer vectors.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then
   the four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator.
*/

void ex_dot_prod_i8(const int8_t *__restrict__ pSrcA,
                     const int8_t *__restrict__ pSrcB,
                     uint32_t blockSize,
                     int32_t *__restrict__ pRes);


/**
   @brief Scalar dot product of 8-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector [8] bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   When the ISA supports, the 8 bit values are packed four by four into 32 bit vectors and then the
   four dot products are performed simultaneously on 32 bit vectors, with 32 bit accumulator. RV32IM
   doesn't support SIMD. For SIMD, check out other ISA extensions (e.g. XPULPV2).
*/

void ex_dot_prod_i8s_rv32im(const int8_t *__restrict__ pSrcA,
                             const int8_t *__restrict__ pSrcB,
                             uint32_t blockSize,
                             int32_t *__restrict__ pRes);

/**
   @brief Vectorized dot product of 8-bit integer vectors singlecore kernel for XPULPV2 extension.
   @param[in]  pSrcA      points to the first input vector [8 bit]
   @param[in]  pSrcB      points to the second input vector [8 bit]
   @param[in]  blockSize  number of samples in each vector
   @param[out] pRes     output result returned here [32 bit]
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four by four into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

void ex_dot_prod_i8s_xpulpv2(const int8_t *__restrict__ pSrcA,
                              const int8_t *__restrict__ pSrcB,
                              uint32_t blockSize,
                              int32_t *__restrict__ pRes);

#endif
