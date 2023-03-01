/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer matrix multiplication for XPULPV2
 *
 * $Date:        July. 2022
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

    for (i = core_id; i < M; i += nPE) {
        for (k = 0; k < O / 4; k++) {
            int32_t sum0 = 0;
            int32_t sum1 = 0;
            int32_t sum2 = 0;
            int32_t sum3 = 0;

            for (j = 0; j < N / 4; j++) {
                v4s aVec = *(v4s *)&(pSrcA[(i + 0) * N + (j * 4)]);
                ;

                v4s bVec0 = *((v4s *)&(pSrcB[(k * 4 + 0) * N + (j * 4)]));
                v4s bVec1 = *((v4s *)&(pSrcB[(k * 4 + 1) * N + (j * 4)]));
                v4s bVec2 = *((v4s *)&(pSrcB[(k * 4 + 2) * N + (j * 4)]));
                v4s bVec3 = *((v4s *)&(pSrcB[(k * 4 + 3) * N + (j * 4)]));

                sum0 = __SUMDOTP4(aVec, bVec0, sum0);
                sum1 = __SUMDOTP4(aVec, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec, bVec2, sum2);
                sum3 = __SUMDOTP4(aVec, bVec3, sum3);
            }

            for (j = j * 4; j < N; j++) {
                int32_t aVal = pSrcA[i * N + j];

                int32_t bVal0 = pSrcB[(k * 4 + 0) * N + j];
                int32_t bVal1 = pSrcB[(k * 4 + 1) * N + j];
                int32_t bVal2 = pSrcB[(k * 4 + 2) * N + j];
                int32_t bVal3 = pSrcB[(k * 4 + 3) * N + j];

                sum0 += aVal * bVal0;
                sum1 += aVal * bVal1;
                sum2 += aVal * bVal2;
                sum3 += aVal * bVal3;
            }

            pDstC[i * O + (k * 4 + 0)] = sum0;
            pDstC[i * O + (k * 4 + 1)] = sum1;
            pDstC[i * O + (k * 4 + 2)] = sum2;
            pDstC[i * O + (k * 4 + 3)] = sum3;
        }

        for (k = k * 4; k < O; k++) {
            int32_t sum = 0;

            for (j = 0; j < N / 4; j++) {
                v4s aVec = *((v4s *)&(pSrcA[i * N + (j * 4)]));

                v4s bVec = *((v4s *)&(pSrcB[k * N + (j * 4)]));

                sum = __SUMDOTP4(aVec, bVec, sum);
            }

            for (j = j * 4; j < N; j++) {
                int32_t aVal = pSrcA[i * N + j];

                int32_t bVal = pSrcB[k * N + j];

                sum += aVal * bVal;
            }

            pDstC[i * O + k] = sum;
        }
    }
}

#endif
//#undef BASIC_VERSION

/**
   @} end of MatMultTransKernels group
*/
