/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i32s_xpulpv2.c
 * Description:  32-bit integer matrix multiplication for XPULPV2
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
  @addtogroup BasicMatMultKernels
  @{
 */

/**
  @brief Matrix multiplication of 32-bit integer matrices kernel for XPULPV2 extension.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[out] pDstC     points to the output matrix
  @return     none
 */

// define BASIC_VERSION // if used don't forget to also use the undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               int32_t *__restrict__ pDstC) {

    uint32_t i; // loop counter
    uint32_t j; // loop counter
    uint32_t k; // loop counter

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

void plp_mat_mult_i32s_xpulpv2(const int32_t *__restrict__ pSrcA,
                               const int32_t *__restrict__ pSrcB,
                               uint32_t M,
                               uint32_t N,
                               uint32_t O,
                               int32_t *__restrict__ pDstC) {

    uint32_t i = 0; // loop counter for M
    uint32_t j = 0; // loop counter for N
    uint32_t k = 0; // loop counter for O

    for (i = 0; i < M / 2; i++) {
        for (k = 0; k < O / 2; k++) {

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;

            for (j = 0; j < N; j++) {
                int32_t AVal0 = pSrcA[i * 2 * N + (j)];
                int32_t AVal1 = pSrcA[i * 2 * N + N + (j)];

                int32_t BVal0 = pSrcB[j * O + (k * 2)];
                int32_t BVal1 = pSrcB[j * O + (k * 2 + 1)];

                sum00 = sum00 + AVal0 * BVal0;
                sum01 = sum01 + AVal0 * BVal1;
                sum10 = sum10 + AVal1 * BVal0;
                sum11 = sum11 + AVal1 * BVal1;
            }

            pDstC[(i * 2) * O + k * 2] = sum00;
            pDstC[(i * 2) * O + k * 2 + 1] = sum01;
            pDstC[(i * 2 + 1) * O + k * 2] = sum10;
            pDstC[(i * 2 + 1) * O + k * 2 + 1] = sum11;
        }
    }

    // clean up code
    i = i * 2;
    k = k * 2;
    // check if every index is nicely finished
    if (i == M && j == N && k == O) {

    } else {
        uint32_t iEnd = i;
        uint32_t kEnd = k;

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

// undefine BASIC_VERSION
/**
   @} end of BasicMatMultKernels group
*/
