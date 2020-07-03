/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_valid_rep_i16s_xpulpv2.c
 * Description:  16-bit integer singlecore convolution (valid with data
 *               replication) for XPULPV2
 *
 * $Date:        3. May 2020
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

#define shufflemask1 (v2s){1,0}
#define ymask (v2s){0xFFFF, 0x0000}


/**
 * @ingroup BasicConvolution
 */

/**
 * @addtogroup BasicConvolutionKernels
 * @{
 */

/**
 * @brief Convolution of 16-bit integer vectors kernel for XPULPV2 extension.
 * @param[in]  pSrcA   points to the first input vector of the replicated data
 * @param[in]  srcALen Number of elements in (unreplicated) vector a
 * @param[in]  srcAMem Number of elements between each replication
 * @param[in]  pSrcB   points to the second input vector
 * @param[in]  srcBLen Length of the second input vector
 * @param[out] pRes    output result returned here
 * @return     none
 */

// Pre-condition: pSrcA with data replicated 4 times, shifted by 1 element.
// Pre-condition: srcALen >= srcBLen, established by calling function plp_conv_i32
// Pre-condition: pRes has enough allocated memory, i.e. srcALen + srcBLen-1u
// Pre-condition: srcALen >= 2 and srcBLen >= 2, otherwise use vector dot product

void plp_conv_valid_rep_i16s_xpulpv2(const int16_t* pSrcA,
                                     const uint32_t srcALen,
                                     const uint32_t srcAMem,
                                     const int16_t* pSrcB,
                                     const uint32_t srcBLen,
                                     int32_t * pRes){

    const int16_t* pSrcA_iter_0; // intermediate input a pointer (replication 0)
    const int16_t* pSrcA_iter_1; // intermediate input a pointer (replication 1)
    const int16_t* pSrcB_iter;   // intermediate input b pointer

    int res_len = srcALen - srcBLen + 1; // length of output vector

#ifdef PLP_MATH_LOOPUNROLL

    const int16_t* pSrcB_end;          // Intermediate pointers
    int32_t sum;                    // Accumulators
    uint32_t j, k, count, blk_cnt;  // Loop counters

    // for loop unroll
    int32_t acc0, acc1, acc2, acc3; // Accumulators

    v2s _x0, _x1, _x2, _x3, _x4, _x5; // local registers
    v2s _y1, _y2;                     // local registers

    int16_t _a0, _a1, _a2, _b0;       // local registers for non-simd computation

    // Working pointer of inputA
    pSrcA_iter_0 = pSrcA + 0 * srcAMem;
    pSrcA_iter_1 = pSrcA + 1 * srcAMem;

    // Working pointer of inputB
    pSrcB_end = pSrcB + (srcBLen - 1U);
    pSrcB_iter = pSrcB_end;

    // count is index by which the pointer pSrcA to be incremented
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
                // load the data
                _y1 = *((v2s*)(pSrcB_iter - 1)); // { y[srcBLen - 2] , y[srcBLen - 1] }
                _y2 = *((v2s*)(pSrcB_iter - 3)); // { y[srcBLen - 4] , y[srcBLen - 3] }

                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}
                _x4 = *((v2s*)(pSrcA_iter_0 + 4));  // {x[4],x[5]}
                _x5 = *((v2s*)(pSrcA_iter_1 + 4));  // {x[5],x[6]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }
                _y2 = __builtin_shuffle(_y2,_y2,shufflemask1); // { y[srcBLen - 3] , y[srcBLen - 4] }

                // update pointers
                pSrcB_iter -= 4;
                pSrcA_iter_0 += 4;
                pSrcA_iter_1 += 4;

                // Perform the multiply-accumulate
                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc1 = __SUMDOTP2(_x1,_y1,acc1);
                acc2 = __SUMDOTP2(_x2,_y1,acc2);
                acc3 = __SUMDOTP2(_x3,_y1,acc3);

                acc0 = __SUMDOTP2(_x2,_y2,acc0);
                acc1 = __SUMDOTP2(_x3,_y2,acc1);
                acc2 = __SUMDOTP2(_x4,_y2,acc2);
                acc3 = __SUMDOTP2(_x5,_y2,acc3);

            } while (--k);

            /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
             * No loop unrolling is used.
             */

            k = srcBLen % 0x4U;

            if (k == 1) {

                // load the data
                _y1 = *((v2s*)(pSrcB_iter-1));   // {y[srcBLen - 2],y[srcBLen - 1]} 
                _x0 = *((v2s*)(pSrcA_iter_0 + 0)); // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0)); // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2)); // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2)); // {x[3],x[4]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }
                _y1 = __AND2(_y1,ymask);      

                // Perform the multiply-accumulate
                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc1 = __SUMDOTP2(_x1,_y1,acc1);
                acc2 = __SUMDOTP2(_x2,_y1,acc2);
                acc3 = __SUMDOTP2(_x3,_y1,acc3);

            } else if (k == 2) {

                // load the data
                _y1 = *((v2s*)(pSrcB_iter-1));   // {y[srcBLen - 2],y[srcBLen - 1]} 
                _x0 = *((v2s*)(pSrcA_iter_0 + 0)); // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0)); // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2)); // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2)); // {x[3],x[4]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }

                // Perform the multiply-accumulate
                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc1 = __SUMDOTP2(_x1,_y1,acc1);
                acc2 = __SUMDOTP2(_x2,_y1,acc2);
                acc3 = __SUMDOTP2(_x3,_y1,acc3);

            } else if (k == 3) {

                // load the data
                _y1 = *((v2s*)(pSrcB_iter-1));   // {y[srcBLen - 2],y[srcBLen - 1]} 
                _y2 = *((v2s*)(pSrcB_iter-3));   // {y[srcBLen - 4],y[srcBLen - 3]} 
                _x0 = *((v2s*)(pSrcA_iter_0 + 0)); // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0)); // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2)); // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2)); // {x[3],x[4]}
                _x4 = *((v2s*)(pSrcA_iter_0 + 4)); // {x[4],x[5]}
                _x5 = *((v2s*)(pSrcA_iter_1 + 4)); // {x[5],x[6]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }
                _y2 = __builtin_shuffle(_y2,_y2,shufflemask1); // { y[srcBLen - 3] , y[srcBLen - 4] }
                _y2 = __AND2(_y2,ymask);

                // Perform the multiply-accumulate
                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc1 = __SUMDOTP2(_x1,_y1,acc1);
                acc2 = __SUMDOTP2(_x2,_y1,acc2);
                acc3 = __SUMDOTP2(_x3,_y1,acc3);

                acc0 = __SUMDOTP2(_x2,_y2,acc0);
                acc1 = __SUMDOTP2(_x3,_y2,acc1);
                acc2 = __SUMDOTP2(_x4,_y2,acc2);
                acc3 = __SUMDOTP2(_x5,_y2,acc3);

            }

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = acc0;
            *pRes++ = acc1;
            *pRes++ = acc2;
            *pRes++ = acc3;

            /* Increment the pointer pSrcA index, count by 4 */
            count += 4U;

            /* Update the inputA and inputB pointers for next MAC calculation */
            pSrcA_iter_0 = pSrcA + count + 0 * srcAMem;
            pSrcA_iter_1 = pSrcA + count + 1 * srcAMem;
            pSrcB_iter = pSrcB_end;

            /* Decrement the loop counter */
            blk_cnt--;
        }

        /* If the res_len is not a multiple of 4, compute any remaining output samples here.
         * No loop unrolling is used.
         */
        blk_cnt = res_len % 0x4U;

        // only one element required, only use pSrcA_iter_0
        if (blk_cnt == 1) {

            // Set all accumulators to zero
            acc0 = 0;

            // setup the iterator
            k = srcBLen >> 2U;

            do {
                // Read y[srcBLen - 1] sample
                _y1 = *((v2s*)(pSrcB_iter-1)); // {y[srcBLen - 2],y[srcBLen - 1]} 
                _y2 = *((v2s*)(pSrcB_iter-3)); // {y[srcBLen - 4],y[srcBLen - 3]} 
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }
                _y2 = __builtin_shuffle(_y2,_y2,shufflemask1); // { y[srcBLen - 3] , y[srcBLen - 4] }

                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc0 = __SUMDOTP2(_x2,_y2,acc0);

                pSrcB_iter -= 4;
                pSrcA_iter_0 += 4;

            } while (--k);

            /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
             * No loop unrolling is used.
             */

            k = srcBLen % 0x4U;

            while (k > 0) {
                _b0 = *pSrcB_iter--;
                _a0 = *pSrcA_iter_0++;
                acc0 = __MAC(acc0, _a0, _b0);
                k--;
            }

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = acc0;

        }

        // only two element required, only use pSrcA_iter_0 and pSrcA_iter_1
        else if (blk_cnt == 2) {

            // Set all accumulators to zero
            acc0 = 0;
            acc1 = 0;

            // setup the iterator
            k = srcBLen >> 2U;

            do {
                // Read y[srcBLen - 1] sample
                _y1 = *((v2s*)(pSrcB_iter-1)); // {y[srcBLen - 2],y[srcBLen - 1]} 
                _y2 = *((v2s*)(pSrcB_iter-3)); // {y[srcBLen - 4],y[srcBLen - 3]} 
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }
                _y2 = __builtin_shuffle(_y2,_y2,shufflemask1); // { y[srcBLen - 3] , y[srcBLen - 4] }

                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc1 = __SUMDOTP2(_x1,_y1,acc1);
                acc0 = __SUMDOTP2(_x2,_y2,acc0);
                acc1 = __SUMDOTP2(_x3,_y2,acc1);

                pSrcB_iter -= 4;
                pSrcA_iter_0 += 4;
                pSrcA_iter_1 += 4;
            } while (--k);

            /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
             * No loop unrolling is used.
             */

            k = srcBLen % 0x4U;

            while (k > 0) {
                _b0 = *pSrcB_iter--;
                _a0 = *pSrcA_iter_0++;
                _a1 = *pSrcA_iter_1++;
                acc0 = __MAC(acc0, _a0, _b0);
                acc1 = __MAC(acc1, _a1, _b0);
                k--;
            }

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = acc0;
            *pRes++ = acc1;

        }

        // only three element required, only use pSrcA_iter_0, pSrcA_iter_1 and pSrcA_iter_2
        else if (blk_cnt == 3) {

            // Set all accumulators to zero
            acc0 = 0;
            acc1 = 0;
            acc2 = 0;

            // setup the iterator
            k = srcBLen >> 2U;

            do {
                // Read y[srcBLen - 1] sample
                _y1 = *((v2s*)(pSrcB_iter-1)); // {y[srcBLen - 2],y[srcBLen - 1]} 
                _y2 = *((v2s*)(pSrcB_iter-3)); // {y[srcBLen - 4],y[srcBLen - 3]} 
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}
                _x4 = *((v2s*)(pSrcA_iter_0 + 4));  // {x[4],x[5]}
                _x5 = *((v2s*)(pSrcA_iter_1 + 4));  // {x[5],x[6]}

                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }
                _y2 = __builtin_shuffle(_y2,_y2,shufflemask1); // { y[srcBLen - 3] , y[srcBLen - 4] }

                acc0 = __SUMDOTP2(_x0,_y1,acc0);
                acc1 = __SUMDOTP2(_x1,_y1,acc1);
                acc2 = __SUMDOTP2(_x2,_y1,acc2);
                acc0 = __SUMDOTP2(_x2,_y2,acc0);
                acc1 = __SUMDOTP2(_x3,_y2,acc1);
                acc2 = __SUMDOTP2(_x4,_y2,acc2);

                pSrcB_iter -= 4;
                pSrcA_iter_0 += 4;
                pSrcA_iter_1 += 4;
            } while (--k);

            /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
             * No loop unrolling is used.
             */

            k = srcBLen % 0x4U;

            while (k > 0) {
                _b0 = *pSrcB_iter--;
                _a0 = *pSrcA_iter_0;
                _a1 = *pSrcA_iter_1++;
                _a2 = *((pSrcA_iter_0++) + 2);
                acc0 = __MAC(acc0, _a0, _b0);
                acc1 = __MAC(acc1, _a1, _b0);
                acc2 = __MAC(acc2, _a2, _b0);
                k--;
            }

            /* Store the result in the accumulator in the destination buffer. */
            *pRes++ = acc0;
            *pRes++ = acc1;
            *pRes++ = acc2;

        }

    } else { // case: srcBLen < 4

        blk_cnt = res_len >> 2;

        if (srcBLen == 1) {
            printf("Error: use dot product instead of convolution!\n");
        } else if (srcBLen == 2) {

            _y1 = *((v2s*)pSrcB);
            _y1 = __builtin_shuffle(_y1,_y1,shufflemask1);

            while (blk_cnt > 0) {

                // load data
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}

                // store dot product
                *pRes++ = __DOTP2(_x0, _y1);
                *pRes++ = __DOTP2(_x1, _y1);
                *pRes++ = __DOTP2(_x2, _y1);
                *pRes++ = __DOTP2(_x3, _y1);

                // update pointers
                pSrcA_iter_0 += 4;
                pSrcA_iter_1 += 4;

                // decrement iteration counter
                blk_cnt--;

            }

            // do the remaining elements without loop unrolling
            blk_cnt = res_len % 4;

            if (blk_cnt == 1) {
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                *pRes++ = __DOTP2(_x0, _y1);
            } else if (blk_cnt == 2) {
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                *pRes++ = __DOTP2(_x0, _y1);
                *pRes++ = __DOTP2(_x1, _y1);
            } else if (blk_cnt == 3) {
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                *pRes++ = __DOTP2(_x0, _y1);
                *pRes++ = __DOTP2(_x1, _y1);
                *pRes++ = __DOTP2(_x2, _y1);
            }

        } else if (srcBLen == 3) {

            _y1 = *((v2s*)(pSrcB + 1));
            _y2 = *((v2s*)(pSrcB + 0));
            _y1 = __builtin_shuffle(_y1,_y1,shufflemask1);
            _y2 = __AND2(_y2, ymask);

            while (blk_cnt > 0) {

                // load data
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}
                _x4 = *((v2s*)(pSrcA_iter_0 + 4));  // {x[4],x[5]}
                _x5 = *((v2s*)(pSrcA_iter_1 + 4));  // {x[5],x[6]}

                // compute dot product
                acc0 = __DOTP2(_x0, _y1);
                acc1 = __DOTP2(_x1, _y1);
                acc2 = __DOTP2(_x2, _y1);
                acc3 = __DOTP2(_x3, _y1);

                *pRes++ = __SUMDOTP2(_x2, _y2, acc0);
                *pRes++ = __SUMDOTP2(_x3, _y2, acc1);
                *pRes++ = __SUMDOTP2(_x4, _y2, acc2);
                *pRes++ = __SUMDOTP2(_x5, _y2, acc3);

                // update pointers
                pSrcA_iter_0 += 4;
                pSrcA_iter_1 += 4;

                // decrement iteration counter
                blk_cnt--;

            }

            // do the remaining elements without loop unrolling
            blk_cnt = res_len % 4;

            if (blk_cnt == 1) {
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                acc0 = __DOTP2(_x0, _y1);
                *pRes++ = __SUMDOTP2(_x2, _y2, acc0);
            } else if (blk_cnt == 2) {
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}
                acc0 = __DOTP2(_x0, _y1);
                acc1 = __DOTP2(_x1, _y1);
                *pRes++ = __SUMDOTP2(_x2, _y2, acc0);
                *pRes++ = __SUMDOTP2(_x3, _y2, acc1);
            } else if (blk_cnt == 3) {
                _x0 = *((v2s*)(pSrcA_iter_0 + 0));  // {x[0],x[1]}
                _x1 = *((v2s*)(pSrcA_iter_1 + 0));  // {x[1],x[2]}
                _x2 = *((v2s*)(pSrcA_iter_0 + 2));  // {x[2],x[3]}
                _x3 = *((v2s*)(pSrcA_iter_1 + 2));  // {x[3],x[4]}
                _x4 = *((v2s*)(pSrcA_iter_0 + 4));  // {x[4],x[5]}
                acc0 = __DOTP2(_x0, _y1);
                acc1 = __DOTP2(_x1, _y1);
                acc2 = __DOTP2(_x2, _y1);
                *pRes++ = __SUMDOTP2(_x2, _y2, acc0);
                *pRes++ = __SUMDOTP2(_x3, _y2, acc1);
                *pRes++ = __SUMDOTP2(_x4, _y2, acc2);
            }

        }

    }

#else//PLP_MATH_LOOPUNROLL

    // this makes no sense...
    printf("Error: not implemented!");

#endif//PLP_MATH_LOOPUNROLL

}

/**
   @} end of BasicConvolutionKernels
*/
