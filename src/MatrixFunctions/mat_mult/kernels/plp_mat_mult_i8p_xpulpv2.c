/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer matrix multiplication for XPULPV2
 *
 * $Date:        July 2022
 * $Revision:    V1
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and University of Bologna.
 *
 * Author: Emmet Murphy, ETH Zurich
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
   @brief Parallel matrix multiplication of 8-bit integer matrices kernel for XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i8 struct initialized by
                     plp_mat_mult_i8_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

// define BASIC_VERSION // if used don't forget to also use the undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_i8p_xpulpv2(void *args) {

    plp_mat_mult_instance_i8 *arguments = (plp_mat_mult_instance_i8 *)args;
    const int8_t *__restrict__ pSrcA = arguments->pSrcA;
    const int8_t *__restrict__ pSrcB = arguments->pSrcB;
    uint32_t M = arguments->M;
    uint32_t N = arguments->N;
    uint32_t O = arguments->O;
    uint32_t nPE = arguments->nPE;
    int32_t *__restrict__ pDstC = arguments->pDstC;

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

    hal_team_barrier();
}

#else

HAL_CL_L1 static v4s mask0 = { 0, 1, 4, 5 };
HAL_CL_L1 static v4s mask1 = { 2, 3, 6, 7 };
HAL_CL_L1 static v4s mask2 = { 0, 2, 4, 6 };
HAL_CL_L1 static v4s mask3 = { 1, 3, 5, 7 };

void plp_mat_mult_i8p_xpulpv2(void *args) {

    plp_mat_mult_instance_i8 *arguments = (plp_mat_mult_instance_i8 *)args;
    const int8_t *__restrict__ pSrcA = arguments->pSrcA;
    const int8_t *__restrict__ pSrcB = arguments->pSrcB;
    uint32_t M = arguments->M;
    uint32_t N = arguments->N;
    uint32_t O = arguments->O;
    uint32_t nPE = arguments->nPE;
    int32_t *__restrict__ pDstC = arguments->pDstC;

    uint32_t i = 0; // loop counter for M
    uint32_t j = 0; // loop counter for N
    uint32_t k = 0; // loop counter for O

    uint32_t core_id = hal_core_id();
    for (k = core_id; k < O / 4; k += nPE) {

        //shuffled data not dependent on i
        //preshuffle and store
        v4s bVecs[(N/4)*4];
        for(j = 0; j < N / 4; j++){
            v4s temp0 = *((v4s *)&(pSrcB[(j * 4) * O + (k * 4)]));
            v4s temp1 = *((v4s *)&(pSrcB[(j * 4 + 1) * O + (k * 4)]));
            v4s temp2 = *((v4s *)&(pSrcB[(j * 4 + 2) * O + (k * 4)]));
            v4s temp3 = *((v4s *)&(pSrcB[(j * 4 + 3) * O + (k * 4)]));

            v4s temp4 = __builtin_shuffle(temp0, temp1, mask0); // 0,1,4,5
            v4s temp5 = __builtin_shuffle(temp2, temp3, mask0); // 8,9,12,13
            v4s temp6 = __builtin_shuffle(temp0, temp1, mask1); // 2,3,6,7
            v4s temp7 = __builtin_shuffle(temp2, temp3, mask1); // 3,7,11,15

            bVecs[(j * 4)] = __builtin_shuffle(temp4, temp5, mask2);
            bVecs[(j * 4) + 1] = __builtin_shuffle(temp4, temp5, mask3);
            bVecs[(j * 4) + 2] = __builtin_shuffle(temp6, temp7, mask2);
            bVecs[(j * 4) + 3] = __builtin_shuffle(temp6, temp7, mask3);
        }

        for (i = 0; i < M / 2; i++) {

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum03 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum12 = 0;
            int32_t sum13 = 0;

            for (j = 0; j < N / 4; j++) {

                v4s aVec0 = *((v4s *)&(pSrcA[(i * 2) * N + (j * 4)]));
                v4s aVec1 = *((v4s *)&(pSrcA[(i * 2 + 1) * N + (j * 4)]));

                v4s bVec0 = bVecs[(j * 4)];
                v4s bVec1 = bVecs[(j * 4) + 1];
                v4s bVec2 = bVecs[(j * 4) + 2];
                v4s bVec3 = bVecs[(j * 4) + 3];

                sum00 = __SUMDOTP4(aVec0, bVec0, sum00);
                sum01 = __SUMDOTP4(aVec0, bVec1, sum01);
                sum02 = __SUMDOTP4(aVec0, bVec2, sum02);
                sum03 = __SUMDOTP4(aVec0, bVec3, sum03);
                sum10 = __SUMDOTP4(aVec1, bVec0, sum10);
                sum11 = __SUMDOTP4(aVec1, bVec1, sum11);
                sum12 = __SUMDOTP4(aVec1, bVec2, sum12);
                sum13 = __SUMDOTP4(aVec1, bVec3, sum13);
            }

            for(j = j * 4; j < N; j++){
                int32_t aVal0 = pSrcA[(i * 2) * N + j];
                int32_t aVal1 = pSrcA[(i * 2 + 1) * N + j];

                int32_t bVal0 = pSrcB[j * O + (k * 4)];
                int32_t bVal1 = pSrcB[j * O + (k * 4) + 1];
                int32_t bVal2 = pSrcB[j * O + (k * 4) + 2];
                int32_t bVal3 = pSrcB[j * O + (k * 4) + 3];

                sum00 += aVal0 * bVal0;
                sum01 += aVal0 * bVal1;
                sum02 += aVal0 * bVal2;
                sum03 += aVal0 * bVal3;
                sum10 += aVal1 * bVal0;
                sum11 += aVal1 * bVal1;
                sum12 += aVal1 * bVal2;
                sum13 += aVal1 * bVal3;
            }

            pDstC[(i * 2) * O + (k * 4)] = sum00;
            pDstC[(i * 2) * O + (k * 4 + 1)] = sum01;
            pDstC[(i * 2) * O + (k * 4 + 2)] = sum02;
            pDstC[(i * 2) * O + (k * 4 + 3)] = sum03;
            pDstC[(i * 2 + 1) * O + (k * 4)] = sum10;
            pDstC[(i * 2 + 1) * O + (k * 4 + 1)] = sum11;
            pDstC[(i * 2 + 1) * O + (k * 4 + 2)] = sum12;
            pDstC[(i * 2 + 1) * O + (k * 4 + 3)] = sum13;
        }

        for(i = i * 2; i < M; i++){
            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum03 = 0;

            for (j = 0; j < N / 4; j++) {

                v4s aVec0 = *((v4s *)&(pSrcA[i * N + (j * 4)]));

                v4s bVec0 = bVecs[(j * 4)];
                v4s bVec1 = bVecs[(j * 4) + 1];
                v4s bVec2 = bVecs[(j * 4) + 2];
                v4s bVec3 = bVecs[(j * 4) + 3];

                sum00 = __SUMDOTP4(aVec0, bVec0, sum00);
                sum01 = __SUMDOTP4(aVec0, bVec1, sum01);
                sum02 = __SUMDOTP4(aVec0, bVec2, sum02);
                sum03 = __SUMDOTP4(aVec0, bVec3, sum03);
            }

            for(j = j * 4; j < N; j++){
                int32_t aVal0 = pSrcA[i * N + j];

                int32_t bVal0 = pSrcB[j * O + (k * 4)];
                int32_t bVal1 = pSrcB[j * O + (k * 4) + 1];
                int32_t bVal2 = pSrcB[j * O + (k * 4) + 2];
                int32_t bVal3 = pSrcB[j * O + (k * 4) + 3];

                sum00 += aVal0 * bVal0;
                sum01 += aVal0 * bVal1;
                sum02 += aVal0 * bVal2;
                sum03 += aVal0 * bVal3;
            }

            pDstC[i * O + (k * 4)] = sum00;
            pDstC[i * O + (k * 4 + 1)] = sum01;
            pDstC[i * O + (k * 4 + 2)] = sum02;
            pDstC[i * O + (k * 4 + 3)] = sum03;
        }
        
    }

    for(k = k * 4; k < O; k++){
        for(i = 0; i < M/4; i++){
            int32_t sum0 = 0;
            int32_t sum1 = 0;
            int32_t sum2 = 0;
            int32_t sum3 = 0;

            for(j = 0; j < N; j++){
                int32_t aVal0 = pSrcA[(i * 4) * N + j];
                int32_t aVal1 = pSrcA[(i * 4 + 1) * N + j];
                int32_t aVal2 = pSrcA[(i * 4 + 2) * N + j];
                int32_t aVal3 = pSrcA[(i * 4 + 3) * N + j];

                int32_t bVal0 = pSrcB[j * O + k];

                sum0 += aVal0 * bVal0;
                sum1 += aVal1 * bVal0;
                sum2 += aVal2 * bVal0;
                sum3 += aVal3 * bVal0;
            }

            pDstC[(i * 4) * O + k] = sum0;
            pDstC[(i * 4 + 1) * O + k] = sum1;
            pDstC[(i * 4 + 2) * O + k] = sum2;
            pDstC[(i * 4 + 3) * O + k] = sum3;
        }

        for(i = i*4; i < M; i++){
            int32_t sum0 = 0;

            for(j = 0; j < N; j++){
                int32_t aVal0 = pSrcA[i * N + j];
                int32_t bVal0 = pSrcB[j * O + k];

                sum0 += aVal0 * bVal0;
            }

            pDstC[i * O + k] = sum0;
        }
    }
    hal_team_barrier();
}

#endif

// undefine BASIC_VERSION
/**
   @} end of BasicMatMultKernels group
*/
