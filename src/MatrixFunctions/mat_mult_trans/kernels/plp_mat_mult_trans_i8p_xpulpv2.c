/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer matrix multiplication for XPULPV2
 *
 * $Date:        22. December 2019
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
  @ingroup MatMultTrans
 */

/**
  @addtogroup MatMultTransKernels
  @{
 */

/**
   @brief      Parallel matrix transposed matrix multiplication of a 8-bit integer matrices for
               XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_mult_instance_i8 struct initialized by
                     plp_mat_mult_i8_parallel
   @return     none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are
   performed on 32 bit vectors, with 32 bit accumulator.
*/

//#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

void plp_mat_mult_trans_i8p_xpulpv2(void *args) {

    uint32_t core_id = hal_core_id();

    plp_mat_mult_instance_i8 *arguments = (plp_mat_mult_instance_i8 *)args;
    const int8_t *__restrict__ pSrcA = arguments->pSrcA;
    const int8_t *__restrict__ pSrcB = arguments->pSrcB;
    uint32_t M = arguments->M;
    uint32_t N = arguments->N;
    uint32_t O = arguments->O;
    uint32_t nPE = arguments->nPE;
    int32_t *__restrict__ pDstC = arguments->pDstC;



    uint32_t m; // loop counter for M
    uint32_t n; // loop counter for N
    uint32_t o; // loop counter for O

    for (m = core_id; m < M; m += nPE) {
        for (o = 0; o < O; o++) {
            int32_t sum = 0;
            for (n = 0; n < N; n++) {
                sum = sum + pSrcA[m * N + n] * pSrcB[o * N + n];
            }
            pDstC[m * O + o] = sum;
        }
    }

    hal_team_barrier();
}

#else

void plp_mat_mult_trans_i8p_xpulpv2(void *args) {

    uint32_t core_id = hal_core_id();

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

    for(i = core_id; i < M/2; i += nPE){
        for(k = 0; k < O/4; k++){
            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum03 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum12 = 0;
            int32_t sum13 = 0;

            for(j = 0; j < N/4; j++){
                v4s aVec0 = *((v4s *)&(pSrcA[(i * 2) * N + (j * 4)]));
                v4s aVec1 = *((v4s *)&(pSrcA[(i * 2 + 1) * N + (j * 4)]));

                v4s bVec0 = *((v4s *)&(pSrcB[(k * 4) * N + (j * 4)]));
                v4s bVec1 = *((v4s *)&(pSrcB[(k * 4 + 1) * N + (j * 4)]));
                v4s bVec2 = *((v4s *)&(pSrcB[(k * 4 + 2) * N + (j * 4)]));
                v4s bVec3 = *((v4s *)&(pSrcB[(k * 4 + 3) * N + (j * 4)]));

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

                int32_t bVal0 = pSrcB[(k * 4) * N + j];
                int32_t bVal1 = pSrcB[(k * 4 + 1) * N + j];
                int32_t bVal2 = pSrcB[(k * 4 + 2) * N + j];
                int32_t bVal3 = pSrcB[(k * 4 + 3) * N + j];

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

        for(k = k * 4;k < O; k++){
            int32_t sum00 = 0;
            int32_t sum10 = 0;

            for(j = 0; j < N/4; j++){
                v4s aVec0 = *((v4s *)&(pSrcA[(i * 2) * N + (j * 4)]));
                v4s aVec1 = *((v4s *)&(pSrcA[(i * 2 + 1) * N + (j * 4)]));

                v4s bVec0 = *((v4s *)&(pSrcB[k * N + (j * 4)]));

                sum00 = __SUMDOTP4(aVec0, bVec0, sum00);
                sum10 = __SUMDOTP4(aVec1, bVec0, sum10);
            }

            for(j = j * 4; j < N; j++){
                int32_t aVal0 = pSrcA[(i * 2) * N + j];
                int32_t aVal1 = pSrcA[(i * 2 + 1) * N + j];

                int32_t bVal0 = pSrcB[k * N + j];

                sum00 += aVal0 * bVal0;
                sum10 += aVal1 * bVal0;
            }

            pDstC[(i * 2) * O + k] = sum00;
            pDstC[(i * 2 + 1) * O + k] = sum10;
        }
    }
    for(i = i * 2;i < M; i++){
        for(k = 0; k < O/4; k++){
            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum03 = 0;

            for(j = 0; j < N/4; j++){
                v4s aVec0 = *((v4s *)&(pSrcA[i * N + (j * 4)]));

                v4s bVec0 = *((v4s *)&(pSrcB[(k * 4) * N + (j * 4)]));
                v4s bVec1 = *((v4s *)&(pSrcB[(k * 4 + 1) * N + (j * 4)]));
                v4s bVec2 = *((v4s *)&(pSrcB[(k * 4 + 2) * N + (j * 4)]));
                v4s bVec3 = *((v4s *)&(pSrcB[(k * 4 + 3) * N + (j * 4)]));

                sum00 = __SUMDOTP4(aVec0, bVec0, sum00);
                sum01 = __SUMDOTP4(aVec0, bVec1, sum01);
                sum02 = __SUMDOTP4(aVec0, bVec2, sum02);
                sum03 = __SUMDOTP4(aVec0, bVec3, sum03);
            }

            for(j = j * 4; j < N; j++){
                int32_t aVal0 = pSrcA[i * N + j];

                int32_t bVal0 = pSrcB[(k * 4) * N + j];
                int32_t bVal1 = pSrcB[(k * 4 + 1) * N + j];
                int32_t bVal2 = pSrcB[(k * 4 + 2) * N + j];
                int32_t bVal3 = pSrcB[(k * 4 + 3) * N + j];

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

        for(k = k * 4;k < O; k++){
            int32_t sum00 = 0;
            int32_t sum10 = 0;

            for(j = 0; j < N/4; j++){
                v4s aVec0 = *((v4s *)&(pSrcA[i * N + (j * 4)]));
                v4s bVec0 = *((v4s *)&(pSrcB[k * N + (j * 4)]));

                sum00 = __SUMDOTP4(aVec0, bVec0, sum00);
            }

            for(j = j * 4; j < N; j++){
                int32_t aVal0 = pSrcA[i * N + j];
                int32_t bVal0 = pSrcB[k * N + j];

                sum00 += aVal0 * bVal0;
            }

            pDstC[i * O + k] = sum00;
        }
    }
}


#endif
//#undef BASIC_VERSION


/**
   @} end of MatMultTransKernels group
*/
