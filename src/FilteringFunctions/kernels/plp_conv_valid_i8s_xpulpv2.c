/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i8s_xpulpv2.c
 * Description:  8-bit integer singlecore convolution (valid) for XPULPV2
 *
 * $Date:        24. April 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Moritz Scherer, Tibor Schneider, ETH Zurich
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

#define shufflemask1                                                                               \
    (v4s) { 3, 2, 1, 0 }
#define shufflemask2                                                                               \
    (v4s) { 1, 2, 3, 4 }
#define shufflemask3                                                                               \
    (v4s) { 2, 3, 4, 5 }
#define shufflemask4                                                                               \
    (v4s) { 3, 4, 5, 6 }

/**
 * @ingroup BasicConvolution
 */

/**
 * @addtogroup BasicConvolutionKernels
 * @{
 */

/**
 * @brief Convolution of 8-bit integer vectors kernel for XPULPV2 extension.
 * @param[in]  pSrcA   points to the first input vector
 * @param[in]  srcALen Length of the first input vector
 * @param[in]  pSrcB   points to the second input vector
 * @param[in]  srcBLen Length of the second input vector
 * @param[out] pRes    output result returned here
 * @return     none
 */

// Pre-condition: psrcALen >= psrcBLen, established by calling function plp_conv_i32
// Pre-condition: pRes has enough allocated memory, i.e. srcALen + srcBLen-1u
// Pre-condition: srcALen >= 2 and srcBLen >= 2, otherwise use vector dot product

void plp_conv_valid_i8s_xpulpv2(const int8_t *pSrcA,
                                const uint32_t srcALen,
                                const int8_t *pSrcB,
                                const uint32_t srcBLen,
                                int32_t *pRes) {

    const int8_t *p_a_iter; // intermediate inputA pointer
    const int8_t *p_b_iter; // intermediate inputB pointer

    int res_len = srcALen - srcBLen + 1;

#ifdef PLP_MATH_LOOPUNROLL

    const int8_t *p_b_tmp;      // Intermediate pointers
    int32_t sum;                // Accumulators
    uint32_t k, count, blk_cnt; // Loop counters

    // for loop unroll
    int32_t acc0, acc1, acc2, acc3; // Accumulators

    v4s xmask[] = { (v4s){ 0, 0, 0, 0 }, (v4s){ 0xff, 0, 0, 0 }, (v4s){ 0xff, 0xff, 0, 0 },
                    (v4s){ 0xff, 0xff, 0xff, 0 } };
    v4s ymask[] = { (v4s){ 0, 0, 0, 0 }, (v4s){ 0, 0, 0, 0xff }, (v4s){ 0, 0, 0xff, 0xff },
                    (v4s){ 0, 0xff, 0xff, 0xff } };
    v4s mask;

    v4s _x1, _x2, _x3, _x4; // local registers
    v4s _y1;                // local registers

    // Working pointer of inputA
    p_a_iter = pSrcA;

    // Working pointer of inputB
    p_b_tmp = pSrcB + (srcBLen - 1U);
    p_b_iter = p_b_tmp;

    // count is index by which the pointer p_a to be incremented
    count = 0U;

    if (srcBLen >= 4U) {

        // compute 4 outputs at the same time
        blk_cnt = res_len >> 2U;
        while (blk_cnt > 0U) {

            // Set all accumulators to zero
            acc0 = 0;
            acc1 = 0;
            acc2 = 0;
            acc3 = 0;

            // Apply loop unrolling and compute 4 MACs simultaneously.
            k = srcBLen >> 2U;

            /* First part of the processing with loop unrolling. Compute 4 MACs at a
             * a second loop below computes MACs for the remaining 1 to 3 samples.
             */

            do {
                // Read y[srcBLen - 1] sample
                _x1 = *((v4s *)p_a_iter);       // {x[0],x[1],x[2],x[3]}
                _x4 = *((v4s *)(p_a_iter + 4)); // {x[4],x[5],x[6],x[7]}
                _y1 = *((v4s *)(p_b_iter - 3)); // {y[srcBLen - 4],y[srcBLen - 3],y[srcBLen -
                                                // 2],y[srcBLen - 1]}

                p_a_iter += 4U;
                p_b_iter -= 4U;

                _x2 = __builtin_shuffle(_x1, _x4, shufflemask2); // {x[1],x[2],x[3],x[4]}
                _x3 = __builtin_shuffle(_x1, _x4, shufflemask3); // {x[2],x[3],x[4],x[5]}
                _x4 = __builtin_shuffle(_x1, _x4, shufflemask4); // {x[2],x[3],x[4],x[5]}

                _y1 =
                    __builtin_shuffle(_y1, _y1, shufflemask1); // {y[srcBLen - 1],y[srcBLen -
                                                               // 2],y[srcBLen - 3],y[srcBLen - 4]}

                // Perform the multiply-accumulate

                acc0 = __SUMDOTP4(_x1, _y1, acc0);
                acc1 = __SUMDOTP4(_x2, _y1, acc1);
                acc2 = __SUMDOTP4(_x3, _y1, acc2);
                acc3 = __SUMDOTP4(_x4, _y1, acc3);

            } while (--k);

            /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
             * No loop unrolling is used.
             */

            k = srcBLen % 0x4U;

            if (k > 0) {
                _x1 = *((v4s *)p_a_iter);       // {x[0],x[1],x[2],x[3]}
                _x4 = *((v4s *)(p_a_iter + 4)); // {x[4],x[5],x[6],x[7]}
                _y1 = *((v4s *)(p_b_iter - 3)); // {y[srcBLen - 4],y[srcBLen - 3],y[srcBLen -
                                                // 2],y[srcBLen - 1]}

                mask = ymask[k];

                _x2 = __builtin_shuffle(_x1, _x4, shufflemask2); // {x[1],x[2],x[3],x[4]}
                _x3 = __builtin_shuffle(_x1, _x4, shufflemask3); // {x[2],x[3],x[4],x[5]}
                _x4 = __builtin_shuffle(_x1, _x4, shufflemask4); // {x[3],x[4],x[5],x[6]}

                _y1 = __AND4(_y1, mask);
                _y1 = __builtin_shuffle(_y1, _y1, shufflemask1);

                // Perform the multiply-accumulate

                acc0 = __SUMDOTP4(_x1, _y1, acc0);
                acc1 = __SUMDOTP4(_x2, _y1, acc1);
                acc2 = __SUMDOTP4(_x3, _y1, acc2);
                acc3 = __SUMDOTP4(_x4, _y1, acc3);
            }

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = acc0;
            *pRes++ = acc1;
            *pRes++ = acc2;
            *pRes++ = acc3;

            /* Increment the pointer p_a index, count by 4 */
            count += 4U;

            /* Update the inputA and inputB pointers for next MAC calculation */
            p_a_iter = pSrcA + count;
            p_b_iter = p_b_tmp;

            /* Decrement the loop counter */
            blk_cnt--;
        }

        /* If the res_len is not a multiple of 4, compute any remaining output samples here.
         * No loop unrolling is used.
         */
        blk_cnt = res_len % 0x4U;

        while (blk_cnt > 0U) {

            // Accumulator is made zero for every iteration

            _y1 = *((v4s *)(p_b_iter - 3));
            _x1 = *((v4s *)(p_a_iter));
            sum = 0;
            _y1 = __builtin_shuffle(_y1, _y1, shufflemask1);

            /* Loop unrolling: Compute 8 outputs at a time */
            k = srcBLen >> 2U;
            while (k > 0U) {
                sum = __SUMDOTP4(_x1, _y1, sum);

                _y1 = *((v4s *)(p_b_iter - 7));
                _x1 = *((v4s *)(p_a_iter + 4));

                p_a_iter += 4U;
                p_b_iter -= 4U;

                _y1 = __builtin_shuffle(_y1, _y1, shufflemask1);
                k--;
            }

            // Loop unrolling: Compute remaining outputs
            k = srcBLen % 0x4U;

            mask = xmask[k];
            _x1 = __AND4(_x1, mask);
            sum = __SUMDOTP4(_x1, _y1, sum);

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = sum;

            /* Increment the MAC count */
            count++;

            /* Update the inputA and inputB pointers for next MAC calculation */
            p_a_iter = pSrcA + count;
            p_b_iter = p_b_tmp;

            /* Decrement the loop counter */
            blk_cnt--;
        }

    } else { // case: srcBLen < 4

        /* If the srcBLen is smaller than 4
         * the res_len loop cannot be unrolled by 4
         * TODO yes, it can!
         */
        blk_cnt = res_len;

        while (blk_cnt > 0U) {
            /* Accumulator is made zero for every iteration */
            sum = 0;

            /* srcBLen number of MACS should be performed */
            k = srcBLen;
            mask = xmask[k];

            _y1 = *((v4s *)(p_b_iter - 3));
            _x1 = *((v4s *)(p_a_iter));

            _x1 = __AND4(_x1, mask);
            _y1 = __builtin_shuffle(_y1, _y1, shufflemask1);

            sum = __SUMDOTP4(_x1, _y1, sum);

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = sum;

            /* Increment the MAC count */
            count++;

            /* Update the inputA and inputB pointers for next MAC calculation */
            p_a_iter = pSrcA + count;
            p_b_iter = p_b_tmp;

            /* Decrement the loop counter */
            blk_cnt--;
        }
    }

#else // PLP_MATH_LOOPUNROLL

    for (int i_out = 0; i_out < res_len; i_out++) {

        p_a_iter = pSrcA + i_out;
        p_b_iter = pSrcB + srcBLen - 1;

        int32_t acc = 0;

        for (int i_in = 0; i_in < srcBLen; i_in++) {
            acc += (*(p_a_iter++)) * (*(p_b_iter--));
        }

        pRes[i_out] = acc;
    }

#endif // PLP_MATH_LOOPUNROLL
}

/**
   @} end of BasicConvolutionKernels
*/
