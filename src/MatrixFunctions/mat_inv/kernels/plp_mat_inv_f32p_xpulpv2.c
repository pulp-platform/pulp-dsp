/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_inv_f32p_xpulpv2.c
 * Description:  parallel 32-bit floating-point matrix inversion for XPULPV2
 *
 * $Date:        14. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Marco Bertuletti, ETH Zurich
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
  @ingroup MatInv
 */

/**
  @addtogroup MatInvKernels
  @{
 */

/**
   @brief Parallel matrix inversion of 32-bit floating-point matrices kernel for XPULPV2 extension.
   @param[in]  args  pointer to plp_mat_inv_instance_f32 struct initialized by
                    plp_mat_inv_f32_parallel
   @return     0: Success, 1: Matrix is singular

   @warn Not yet implemented
*/

int plp_mat_inv_f32p_xpulpv2(void *args) {

    int core_id = hal_core_id();
    plp_mat_inv_instance_f32 *a = (plp_mat_inv_instance_f32 *)args;
    float *__restrict__ pSrc = a -> pSrc;
    float *__restrict__ pDst = a -> pDst;
    uint32_t *flag = a -> flag;
    uint32_t N = a -> N;
    uint32_t nPE = a -> nPE;
    float *pSrcT1, *pSrcT2;                         /* Temporary input data matrix pointer */
    float *pDstT1, *pDstT2;                         /* Temporary output data matrix pointer */
    float *pPivotRowIn;                             /* Temporary input and output data matrix pointer */
    float *pPRT_in, *pPivotRowDst, *pPRT_pDst;      /* Temporary input and output data matrix pointer */
    float Xchg, in = 0.0f, in1;                     /* Temporary input values  */
    uint32_t i, rowCnt, j, loopCnt, k, l;   /* loop counters */
    uint32_t M = N;                         /* M is the number of rows. However, the matirces must be square. */
    pDstT1 = pDst;                          /* Working pointer for destination matrix */

    /* CREATE IDENTITY MATRIX */

    for (int i = core_id; i < M; i += nPE) {
        for (int j = 0; j < M; j++) {
            pDstT1[i * M + j] = (float)(i == j);
        }
    }
    hal_team_barrier();

    /* Loop over the number of columns of the input matrix.
       All the elements in each column are processed by the row operations */
    loopCnt = N;
    l = 0U; // Column index
    while (loopCnt > 0U) {

        /* SEARCH FOR 0 AND SWITCH ROWS */

        pSrcT1 = pSrc + (l * N); // Input pivot
        pDstT1 = pDst + (l * N); // Destination pivot

        in = *pSrcT1;
        k = 1U;
        /* Check if the pivot element is zero */
        if (*pSrcT1 == 0.0f) {
            /* Loop over the number rows present below */
            for (i = (l + 1U) + core_id; i < M; i += nPE) {
                pSrcT2 = pSrcT1 + (N * i);
                /* Check if there is element to exchange */
                if (*pSrcT2 != 0.0f)
                    *flag = k;
                if (*flag != 0) {
                    pSrcT2 = pSrcT1 + (N * *flag + l);
                    pDstT2 = pDstT1 + (N * *flag);
                    /* Loop over number of columns
                     * to the right of the pilot element */
                    for (j = core_id; j < N - l; j += nPE) {
                        /* Exchange the row elements of the input matrix */
                        Xchg = pSrcT2[j];
                        pSrcT2[j] = pSrcT1[j];
                        pSrcT1[j] = Xchg;
                    }
                    pSrcT1 += N - l;
                    pSrcT2 += N - l;
                    /* Loop over number of columns of the destination matrix */
                    for(j = core_id; j < N; j += nPE) {
                        /* Exchange the row elements of the destination matrix */
                        Xchg = pDstT2[j];
                        pDstT2[j] = pDstT1[j];
                        pDstT1[j] = Xchg;
                    }
                    pDstT2 += N;
                    pDstT1 += N;
                    break;
                }
            }
            k++;
            hal_team_barrier();
        }

        /* Update the status if the matrix is singular */
        if ((*flag == 0U) && (in == 0.0f)) {
            return 1;
        }

        /* DIVIDE BY PIVOT */

        /* Points to the pivot row of input and destination matrices */
        pPivotRowIn = pSrc + (l * N);
        pPivotRowDst = pDst + (l * N);
        /* Temporary pointers to the pivot row pointers */
        pSrcT1 = pPivotRowIn;
        pSrcT2 = pPivotRowDst;
        /* Pivot element of the row */
        in = *pPivotRowIn;
        /* Loop over number of columns to the right of the pilot element */
        for(j = core_id; j < N - l; j += nPE) {
            in1 = pSrcT1[j];
            pSrcT1[j] = in1 / in;
        }
        /* Loop over number of columns of the destination matrix */
        for(j = core_id; j < N; j += nPE) {
            in1 = pSrcT2[j];
            pSrcT2[j] = in1 / in;
        }
        hal_team_barrier();

        /*REPLACE ROWS */

        pSrcT1 = pSrc + core_id * N;
        pSrcT2 = pDst + core_id * N;
        i = core_id;
        k = M;
        for(k = core_id; k < M; k += nPE) {
            if (i != l) {
                /* Element of the reference row */
                in = *pSrcT1;
                /* Working pointers for input and destination pivot rows */
                pPRT_in = pPivotRowIn;
                pPRT_pDst = pPivotRowDst;
                /* Loop over the number of columns to the right of the pivot element,
                   to replace the elements in the input matrix */
                for (j = 0; j < N - l; j++) {
                    in1 = pSrcT1[j];
                    pSrcT1[j] = in1 - (in * pPRT_in[j]);
                }
                /* Loop over the number of columns to
                   replace the elements in the destination matrix */
                for (j = 0; j < N; j++) {
                    in1 = pSrcT2[j];
                    pSrcT2[j] = in1 - (in * pPRT_pDst[j]);
                }
            }
            i += nPE;
            pSrcT1 += nPE * N;
            pSrcT2 += nPE * N;
        }
        /* Increment the input pointer */
        pSrc++;
        /* Decrement the loop counter */
        loopCnt--;
        /* Increment the index modifier */
        l++;
        hal_team_barrier();
    }
    
    if ((*flag == 0) && (in == 0.0f)) {
        for (i = 0; i < M * N; i++) {
            if (pSrc[i] != 0.0f)
                break;
        }
        if (i == M * N)
            return 1;
        hal_team_barrier();
    }
    return 0;
}

/**
   @} end of MatInvKernels group
*/
