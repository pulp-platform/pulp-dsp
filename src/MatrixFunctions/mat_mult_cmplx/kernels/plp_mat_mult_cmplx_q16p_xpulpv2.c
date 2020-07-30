/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_cmplx_q16p_xpulpv2.c
 * Description:  parallel 16-bit fix-point complex matrix matrix multiplication for XPULPV2
 *
 * $Date:        17. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and Ubiversity of Bologna. All rights reserved.
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
  @ingroup MatMultCmplx
 */

/**
  @addtogroup MatMultCmplxKernels
  @{
 */

/**
  @brief      parallel matrix matrix multiplication for complex 16-bit fix-point on XpulpV2
  @param[in]  args  pointer to plp_mat_mat_mult_cmplx_instance_q16 struct initialized by
                    plp_mat_mult_cmplx_q16_parallel
  @return     none

  @par Fix-Point
  Fix-Point and Shifting
  The result will be shifted by the parameter `shift` to the right (which corresponds to a
  multiplication by `2^-shift`). Assume that matrix A is represente as `pSrcA * 2^-x` and matrix B
  as `pSrcB * 2^-y` (which means that A has `x`, and B has `y` bits after the binary point). Then,
  the output matrix C is represented as `pDstC * 2^-(x + y - shift)`. The output matrix is also
  stored with the same number of bits as the inputs. Set the `shift` parameter such that no overflow
  occurrs.

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_mult_cmplx_q16p_xpulpv2(void *args) {

    int core_id = rt_core_id();

    plp_mat_mult_cmplx_instance_q16 *a = (plp_mat_mult_cmplx_instance_q16 *)args;

    const int16_t *__restrict__ pSrcA = a->pSrcA;
    const int16_t *__restrict__ pSrcB = a->pSrcB;
    uint32_t M = a->M;
    uint32_t N = a->N;
    uint32_t O = a->O;
    uint32_t shift = a->shift;
    uint32_t nPE = a->nPE;
    int16_t *__restrict__ pDstC = a->pDstC;

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int m = core_id; m < M; m += nPE) {
        for (int o = 0; o < O; o++) {
            int32_t sum_re = 0;
            int32_t sum_im = 0;
            for (int n = 0; n < N; n++) {
                int32_t a_re = (int32_t)pSrcA[(m * N + n) * 2 + 0];
                int32_t a_im = (int32_t)pSrcA[(m * N + n) * 2 + 1];
                int32_t b_re = (int32_t)pSrcB[(n * O + o) * 2 + 0];
                int32_t b_im = (int32_t)pSrcB[(n * O + o) * 2 + 1];
                sum_re += __ROUNDNORM_REG(a_re * b_re - a_im * b_im, shift);
                sum_im += __ROUNDNORM_REG(a_re * b_im + a_im * b_re, shift);
            }
            pDstC[(m * O + o) * 2 + 0] = (int16_t)sum_re;
            pDstC[(m * O + o) * 2 + 1] = (int16_t)sum_im;
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatMultCmplxKernels group
*/
