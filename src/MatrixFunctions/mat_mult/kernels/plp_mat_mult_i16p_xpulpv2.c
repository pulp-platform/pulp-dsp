/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i16p_xpulpv2.c
 * Description:  parallel 16-bit integer matrix multiplication for XPULPV2
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
   @brief Parallel matrix multiplication of 16-bit integer matrices kernel for XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i16 struct initialized by
                     plp_mat_mult_i16_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

// define BASIC_VERSION // if used don't forget to also use the undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_i16p_xpulpv2(void *args) {
    plp_mat_mult_instance_i16 *arguments = (plp_mat_mult_instance_i16 *)args;
    const int16_t *__restrict__ pSrcA = arguments->pSrcA;
    const int16_t *__restrict__ pSrcB = arguments->pSrcB;
    uint32_t M = arguments->M;
    uint32_t N = arguments->N;
    uint32_t O = arguments->O;
    uint32_t nPE = arguments->nPE;
    int32_t *__restrict__ pDstC = arguments->pDstC;

    uint32_t i; // loop counter
    uint32_t j; // loop counter
    uint32_t k; // loop counter

    int core_id = hal_core_id();

    for (i = core_id; i < M; i += nPE) {
        for (k = 0; k < O; k++) {
            int16_t sum = 0;
            for (j = 0; j < N; j++) {
                sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
            }
            pDstC[i * O + k] = sum;
        }
    }

    hal_team_barrier();
}

#else

void plp_mat_mult_i16p_xpulpv2(void *args) {
    plp_mat_mult_instance_i16 *arguments = (plp_mat_mult_instance_i16 *)args;
    const int16_t *__restrict__ pSrcA = arguments->pSrcA;
    const int16_t *__restrict__ pSrcB = arguments->pSrcB;
    uint32_t M = arguments->M;
    uint32_t N = arguments->N;
    uint32_t O = arguments->O;
    uint32_t nPE = arguments->nPE;
    int32_t *__restrict__ pDstC = arguments->pDstC;

    uint32_t i = 0; // loop counter for M
    uint32_t j = 0; // loop counter for N
    uint32_t k = 0; // loop counter for O

    int core_id = hal_core_id();

    for (k = core_id; k < O / 2; k += nPE) {
        for (i = 0; i < M / 4; i++) {

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum20 = 0;
            int32_t sum21 = 0;
            int32_t sum30 = 0;
            int32_t sum31 = 0;

            // v2s* Bpoint = (v2s*) &(pSrcB[k]);

            for (j = 0; j < N / 2; j++) {

                v2s aVec0 = *((v2s *)&(pSrcA[(i * 4) * N + (j * 2)]));
                v2s aVec1 = *((v2s *)&(pSrcA[(i * 4 + 1) * N + (j * 2)]));
                v2s aVec2 = *((v2s *)&(pSrcA[(i * 4 + 2) * N + (j * 2)]));
                v2s aVec3 = *((v2s *)&(pSrcA[(i * 4 + 3) * N + (j * 2)]));

                v2s bTemp0 = *((v2s *)&(pSrcB[(j * 2) * O + (k * 2)]));
                v2s bTemp1 = *((v2s *)&(pSrcB[(j * 2 + 1) * O + (k * 2)]));

                v2s bVec0 = __builtin_shuffle(bTemp0, bTemp1, (v2s){ 0, 2 });
                v2s bVec1 = __builtin_shuffle(bTemp0, bTemp1, (v2s){ 1, 3 });

                sum00 = __SUMDOTP2(aVec0, bVec0, sum00);
                sum01 = __SUMDOTP2(aVec0, bVec1, sum01);
                sum10 = __SUMDOTP2(aVec1, bVec0, sum10);
                sum11 = __SUMDOTP2(aVec1, bVec1, sum11);
                sum20 = __SUMDOTP2(aVec2, bVec0, sum20);
                sum21 = __SUMDOTP2(aVec2, bVec1, sum21);
                sum30 = __SUMDOTP2(aVec3, bVec0, sum30);
                sum31 = __SUMDOTP2(aVec3, bVec1, sum31);
            }

            pDstC[(i * 4) * O + (k * 2)] = sum00;
            pDstC[(i * 4) * O + (k * 2 + 1)] = sum01;
            pDstC[(i * 4 + 1) * O + (k * 2)] = sum10;
            pDstC[(i * 4 + 1) * O + (k * 2 + 1)] = sum11;
            pDstC[(i * 4 + 2) * O + (k * 2)] = sum20;
            pDstC[(i * 4 + 2) * O + (k * 2 + 1)] = sum21;
            pDstC[(i * 4 + 3) * O + (k * 2)] = sum30;
            pDstC[(i * 4 + 3) * O + (k * 2 + 1)] = sum31;
        }
    }

    // clean up code
    i = i * 4;
    j = j * 2;
    k = k * 2;
    // check if every index is nicely finished
    if (i == M && j == N && k >= O) {

    } else {
        uint32_t iEnd = i;
        uint32_t jEnd = j;
        uint32_t kEnd = k >= O ? O : k;

        // clean up for j
        if (jEnd != N) {
            for (k = core_id * 2; k < kEnd; k += nPE * 2) {
                for (int step = 0; step < 2; step++) {
                    for (i = 0; i < iEnd; i++) {
                        int32_t sum = 0;
                        for (j = jEnd; j < N; j++) {
                            sum += sum + pSrcA[i * N + j] * pSrcB[j * O + k + step];
                        }
                        pDstC[i * O + k + step] += sum;
                    }
                }
            }
        }

        // clean up for i
        if (iEnd != M) {
            for (k = core_id * 2; k < kEnd; k += nPE * 2) {
                for (int step = 0; step < 2; step++) {
                    for (i = iEnd; i < M; i++) {
                        int32_t sum = 0;
                        for (j = 0; j < N; j++) {
                            sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k + step];
                        }
                        pDstC[i * O + k + step] = sum;
                    }
                }
            }
        }

        // clean up for k
        for (k = kEnd; k < O; k++) {
            for (i = 0; i < M; i++) {
                int32_t sum = 0;
                for (j = 0; j < N; j++) {
                    sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                }
                pDstC[i * O + k] = sum;
            }
        }
    }

    hal_team_barrier();
}

#endif

// undefine BASIC_VERSION
/**
   @} end of BasicMatMultKernels group
*/
