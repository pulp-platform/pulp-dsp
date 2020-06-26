/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i32p_xpulpv2.c
 * Description:  3parallel 2-bit integer matrix multiplication for XPULPV2
 *
 * $Date:        22. December 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and Ubiversity of Bologna. All rights reserved.
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
  @ingroup BasicMatMultTrans
 */

/**
  @defgroup BasicMatMultTransKernels Matrix Multiplication Kernels
  Computes the product of two matrices, the second of which is transposed.

  The Matrix Matrix Multiplication computes the product of two matrices with dimensions MxN and NxO, the second one is stored transposed in memory.
  The first matrix is accessed row wise, the second column wise, all values form the first are multiplied with the values of the second and then sum of the result gives the value for the result matrix.
  <pre>
      pDst[i,k] = pSrcA[i*M]*pSrcB[k*N] + pSrcA[i*M+1]*pSrcB[k*N+1] + ... + pSrcA[i*M+N-1]*pSrcB[k*N+N-1]
  </pre>
  There are separate functions int8, int16, and int32 data types. For lower precision integers (int8, int16), functions exploiting SIMD instructions are provided.

  The naming of the functions follows the following pattern (for example plp_dot_prod_i32s_rv32im):
  <pre>
      \<pulp\> _ \<function name\> _ \<data type\>\<precision\>\<method\>_\<isa extension\>, with

      data type = {f, i, q} respectively for floats, integers, fixed points

      precision = {32, 16, 8} bits

      method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

      isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

  </pre>


 */


/**
  @addtogroup BasicMatMultTransKernels
  @{
 */

/**
   @brief         Parallel matrix transposed matrix multiplication of a 32-bit integer matrices for RV32IM extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i32 struct initialized by plp_mat_mult_i32_parallel
   @return        none
*/

// define BASIC_VERSION // if used don't forget to also use the undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_trans_i32p_xpulpv2( void* args) {
        plp_mat_mult_instance_i32* arguments = (plp_mat_mult_instance_i32*) args;
        const int32_t * __restrict__ pSrcA = arguments->pSrcA;
        const int32_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O

        int core_id = rt_core_id();
        int step = (M-1+nPE)/nPE;
        uint32_t START = step*core_id;
        uint32_t END = (core_id != nPE-1) ? START+step : M;

        for(i=START; i < END; i++){
          for(k=0; k < M; k++){
            int32_t sum = 0;
            for(j=0; j < N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[k*N + j];
            }
            pDstC[i*O + k] = sum;
          }
        }

        rt_team_barrier();
}

#else 

void plp_mat_mult_trans_i32p_xpulpv2( void* args) {
        plp_mat_mult_instance_i32* arguments = (plp_mat_mult_instance_i32*) args;
        const int32_t * __restrict__ pSrcA = arguments->pSrcA;
        const int32_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;

        uint32_t m; // loop counter for M
        uint32_t n; // loop counter for N
        uint32_t o; // loop counter for O

        int core_id = rt_core_id();

        // first, to the major part of the computation:
        //for (m = core_id * 2; m < M; m += nPE * 2) {
        m = core_id * 2;
        do {
            //for (o = 0; o < O; o += 2) {
            o = 0;
            do {
                int32_t sum_m0_o0 = 0;
                int32_t sum_m0_o1 = 0;
                int32_t sum_m1_o0 = 0;
                int32_t sum_m1_o1 = 0;
                //for (n = 0; n < N; n++) {
                n = 0;
                do {
                    // load all 4 values
                    int32_t a_m0 = pSrcA[m * N + n];
                    int32_t a_m1 = pSrcA[(m + 1) * N + n];
                    int32_t b_o0 = pSrcB[o * N + n];
                    int32_t b_o1 = pSrcB[(o + 1) * N + n];

                    // compute all 4 macs
                    sum_m0_o0 += a_m0 * b_o0;
                    sum_m0_o1 += a_m0 * b_o1;
                    sum_m1_o0 += a_m1 * b_o0;
                    sum_m1_o1 += a_m1 * b_o1;

                    n++;
                } while (n < N);

                // store the values
                pDstC[m * O + o]           = sum_m0_o0;
                pDstC[m * O + o + 1]       = sum_m0_o1;
                pDstC[(m + 1) * O + o]     = sum_m1_o0;
                pDstC[(m + 1) * O + o + 1] = sum_m1_o1;

                o += 2;
            } while (o < O - 1);

            m += nPE * 2;
        } while (m < M - 1);

        // clean up the odd O (o = O - 1)
        if (O & 0x1) {
            o = O - 1;
            // loop over all m, unrolling two elements
            //for (m = core_id * 2; m < M - 1; m += nPE * 2) {
            m = core_id * 2;
            do {
                int32_t sum_m0 = 0;
                int32_t sum_m1 = 0;
                for (n = 0; n < N; n++) {
                    // load all 3values
                    int32_t b    = pSrcB[o * N + n];
                    int32_t a_m0 = pSrcA[m * N + n];
                    int32_t a_m1 = pSrcA[(m + 1) * N + n];
                    
                    // compute the two MACs
                    sum_m0 += a_m0 * b;
                    sum_m1 += a_m1 * b;
                }
                pDstC[m * O + o]       = sum_m0;
                pDstC[(m + 1) * O + o] = sum_m1;

                m += nPE * 2;
            } while (m < M - 1);
        }

        // clean up the odd M (m = M - 1)
        if (M & 0x1) {
            m = M - 1;
            // loop over all m, unrolling two elements
            //for (o = core_id * 2; o < O - 1; o += nPE * 2) {
            o = core_id * 2;
            do {
                int32_t sum_o0 = 0;
                int32_t sum_o1 = 0;
                for (n = 0; n < N; n++) {
                    // load all 3values
                    int32_t a    = pSrcA[m * N + n];
                    int32_t b_o0 = pSrcB[o * N + n];
                    int32_t b_o1 = pSrcB[(o + 1) * N + n];
                    
                    // compute the two MACs
                    sum_o0 += a * b_o0;
                    sum_o1 += a * b_o1;
                }
                pDstC[m * O + o]     = sum_o0;
                pDstC[m * O + o + 1] = sum_o1;

                o += nPE * 2;
            } while (o < O - 1);
        }

        // clean up the odd M and odd O (m = M - 1, o = O - 1)
        if ((M & 0x1) && (O & 0x1) && core_id == nPE - 1)  {
            m = M - 1;
            o = O - 1;
            int32_t sum = 0;

            //for (n = core_id * 2; n < N; n += nPE * 2) {
            n = 0;
            do {
                int32_t a0 = pSrcA[m * N + n];
                int32_t a1 = pSrcA[m * N + n + 1];
                int32_t b0 = pSrcB[o * N + n];
                int32_t b1 = pSrcB[o * N + n + 1];

                // compute the dot product
                sum += a0 * b0 + a1 * b1;

                n += 2;
            } while (n < N - 1);

            // if N is odd, we need to add the last element to the sum
            if (N & 0x1) {
                // N is odd
                n = N - 1;
                sum += pSrcA[m * N + n] * pSrcB[o * N + n];
            }
            pDstC[m * O + o] = sum;
        }

        rt_team_barrier();
}

#endif

// undefine BASIC_VERSION
/**
   @} end of BasicMatMultTransKernels group
*/
