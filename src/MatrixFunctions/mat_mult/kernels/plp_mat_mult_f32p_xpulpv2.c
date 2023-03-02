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
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Tibor Schneider, ETH Zurich
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
   @brief Parallel matrix multiplication of 32-bit floating-point matrices kernel for XPULPV2
          extension.
   @param[in]  args  pointer to plp_mat_mult_instance_f32 struct initialized by
                     plp_mat_mult_f32_parallel
   @return     none
*/

void plp_mat_mult_f32p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_mult_instance_f32 *a = (plp_mat_mult_instance_f32 *)args;

    const float *__restrict__ pSrcA = a->pSrcA;
    const float *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t O = a->O;
    uint32_t nPE = a->nPE;
    float *__restrict__ pDstC = a->pDstC;

// #define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    uint32_t m, n, o;

    for (m = core_id; m < M; m += nPE) {
        for (o = 0; o < O; o++) {
            float sum = 0;
            for (n = 0; n < N; n++) {
                sum = sum + pSrcA[m * N + n] * pSrcB[n * O + o];
            }
            pDstC[m * O + o] = sum;
        }
    }

#else

    uint32_t i = 0; // loop counter for M
    uint32_t j = 0; // loop counter for N
    uint32_t k = 0; // loop counter for O

    for (k = core_id; k < O / 2; k += nPE) {
        for (i = 0; i < M / 2; i++) {

            float sum00 = 0;
            float sum01 = 0;
            float sum10 = 0;
            float sum11 = 0;

            for (j = 0; j < N; j++) {
                float AVal0 = pSrcA[i * 2 * N + (j)];
                float AVal1 = pSrcA[i * 2 * N + N + (j)];

                float BVal0 = pSrcB[j * O + (k * 2)];
                float BVal1 = pSrcB[j * O + (k * 2 + 1)];

                /* Code below will be emulated as integer operation
                *  instead of utilizing the dedicated FPU
                */
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
    j = j;
    k = k * 2;

    if (i == M && j == N && k >= O) {

    } else {
        uint32_t iEnd = i;
        uint32_t jEnd = j;
        uint32_t kEnd = k >= O ? O : k;

        // clean up for j
        if (jEnd != N) {
            for (i = 0; i < iEnd; i++) {
                for (k = 0; k < kEnd; k += nPE) {
                    float sum = 0;
                    for (j = jEnd; j < N; j++) {
                        sum += sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                    }
                    pDstC[i * O + k] += sum;
                }
            }
        }

        // clean up for i
        if (iEnd != M) {
            for (k = core_id; k < kEnd; k += nPE) {
                for (i = iEnd; i < M; i++) {
                    float sum = 0;
                    for (j = 0; j < N; j++) {
                        sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                    }
                    pDstC[i * O + k] = sum;
                }
            }
        }

        // clean up for k
        for (k = kEnd; k < O; k += nPE) {
            for (i = 0; i < M; i++) {
                float sum = 0;
                for (j = 0; j < N; j++) {
                    sum = sum + pSrcA[i * N + j] * pSrcB[j * O + k];
                }
                pDstC[i * O + k] = sum;
            }
        }
    }

    hal_team_barrier();

    // printf("Error: Optimized plp_mat_mult_f32p_xpulpv2 not implemented.\n");

    // TODO: Hackathon

#endif
// #undef BASIC_VERSION
}

/**
   @} end of BasicMatMultKernels group
*/
