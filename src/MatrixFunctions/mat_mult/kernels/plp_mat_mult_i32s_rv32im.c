/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i32s_rv32im.c
 * Description:  32-bit matrix nultiplication kernel for RV32IM
 *
 * $Date:        18. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Tom Kuchler, ETH Zurich
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
  @ingroup BasicMatMult
 */

/**
  @defgroup BasicMatMultKernels Matrix Multiplication Kernels
  This module contains the kernels for matrix matrix multiplication.

  The Matrix Matrix Multiplication computes the product of two matrices with dimensions MxN and NxO.
  The first matrix is accessed row wise, the second column wise, all values form the first are
  multiplied with the values of the second and then sum of the result gives the value for the result
  matrix.

      'pDst[m,o] = pSrcA[m,0]*pSrcB[0,o] + pSrcA[m,1]*pSrcB[1,o] + ... + pSrcA[m,N-1]*pSrcB[N-1,o]`

  There are functions for integer 32- 16- and 8-bit data types. For lower precision integers (16-
  and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example
  `plp_mat_mult_i32s_xpulpv2`):

      `plp_<function name>_<data type><precision><method>_<isa_extension>`

  name          | description
  ------------- | ---------------------------------------------------------------------------
  function_name | `mat_mult`
  data type     | {`f`, `i`, `q`} respectively for floats, integers, fixed points
  precision     | {`32`, `16`, `8`} bits
  method        | {`s`, `v`, `p`} meaning scalar, vectorized (i.e. SIMD) and parallel, respectively
  isa_extension | {`rv32im`, `xpulpv2`} respectively for ibex and riscy
 */

/**
  @addtogroup BasicMatMultKernels
  @{
 */

/**
  @brief Matrix multiplication of 32-bit integer matrices kernel for RV32IM extension.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[out] pDstC     points to the output matrix
  @return     none
 */

// #define BASIC_VERSION // if used don' forget to also use undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t *__restrict__ pDstC) {

    uint32_t i = 0; // loop counter
    uint32_t j = 0; // loop counter
    uint32_t k = 0; // loop counter

    for (i = 0; i < M; i++) {
        for (k = 0; k < O; k++) {
            int32_t sum = 0;
            for (j = 0; j < N; j++) {
                sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
            }
            pDstC[i * O + k] = sum;
        }
    }
}

#else

void plp_mat_mult_i32s_rv32im(const int32_t *__restrict__ pSrcA,
                              const int32_t *__restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t *__restrict__ pDstC) {

    uint32_t i = 0; // loop counter
    uint32_t j = 0; // loop counter
    uint32_t k = 0; // loop counter

    for (i = 0; i < M / 2; i++) {
        for (k = 0; k < O / 2; k++) {

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;

            for (j = 0; j < N / 2; j++) {
                int32_t AVal00 = pSrcA[(i * 2) * N + j * 2];
                int32_t AVal10 = pSrcA[(i * 2 + 1) * N + j * 2];
                int32_t AVal01 = pSrcA[(i * 2) * N + j * 2 + 1];
                int32_t AVal11 = pSrcA[(i * 2 + 1) * N + j * 2 + 1];
                int32_t BVal00 = pSrcB[(j * 2) * O + (k * 2)];
                int32_t BVal01 = pSrcB[(j * 2) * O + (k * 2 + 1)];
                int32_t BVal10 = pSrcB[(j * 2 + 1) * O + (k * 2)];
                int32_t BVal11 = pSrcB[(j * 2 + 1) * O + (k * 2 + 1)];

                sum00 = sum00 + AVal00 * BVal00;
                sum00 = sum00 + AVal01 * BVal10;
                sum01 = sum01 + AVal00 * BVal01;
                sum01 = sum01 + AVal01 * BVal11;
                sum10 = sum10 + AVal10 * BVal00;
                sum10 = sum10 + AVal11 * BVal10;
                sum11 = sum11 + AVal10 * BVal01;
                sum11 = sum11 + AVal11 * BVal11;
            }
            pDstC[(i * 2) * O + (k * 2)] = sum00;
            pDstC[(i * 2) * O + (k * 2 + 1)] = sum01;
            pDstC[(i * 2 + 1) * O + (k * 2)] = sum10;
            pDstC[(i * 2 + 1) * O + (k * 2 + 1)] = sum11;
        }
    }

    // clean up code
    i = i * 2;
    j = j * 2;
    k = k * 2;

    // clean up code
    // check if every index is nicely finished
    if (i == M && j == N && k == O) {

    } else {
        uint32_t iEnd = i;
        uint32_t jEnd = j;
        uint32_t kEnd = k;

        // clean up for j
        if (jEnd != N) {
            for (i = 0; i < iEnd; i++) {
                for (k = 0; k < kEnd; k++) {
                    int32_t sum = 0;
                    for (j = jEnd; j < N; j++) {
                        sum += sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                    }
                    pDstC[i * O + k] += sum;
                }
            }
        }

        // clean up for k
        if (kEnd != O) {
            for (i = 0; i < iEnd; i++) {
                for (k = kEnd; k < O; k++) {
                    int32_t sum = 0;
                    for (j = 0; j < N; j++) {
                        sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                    }
                    pDstC[i * O + k] = sum;
                }
            }
        }

        // clean up for i
        for (i = iEnd; i < M; i++) {
            for (k = 0; k < O; k++) {
                int32_t sum = 0;
                for (j = 0; j < N; j++) {
                    sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                }
                pDstC[i * O + k] = sum;
            }
        }
    }
}

#endif

// #undef BASIC_VERSION

/**
   @} end of BasicDotProdKernels group
*/
