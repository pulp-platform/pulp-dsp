/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i8s_xpulpv2.c
 * Description:  16-bit integer singlecore convolution (valid) for XPULPV2
 *
 * $Date:        2. May 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
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
#define shufflemask2 (v2s){1,2}


/**
 * @ingroup BasicConvolution
 */

/**
 * @addtogroup BasicConvolutionKernels
 * @{
 */

/**
 * @brief Convolution of 16-bit integer vectors kernel for XPULPV2 extension.
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

void plp_conv_valid_i16s_xpulpv2(const int16_t*  pSrcA,
                                 const uint32_t srcALen,
                                 const int16_t*  pSrcB,
                                 const uint32_t srcBLen,
                                 int32_t *  pRes){

    const int16_t *pIn1 = pSrcA;                 /* InputA pointer */
    const int16_t *pIn2 = pSrcB;                 /* InputB pointer */
    int32_t *pOut = pRes;                        /* Output pointer */
    const int16_t *px;                           /* Intermediate inputA pointer */
    const int16_t *py;                           /* Intermediate inputB pointer */
    const int16_t *pSrc1, *pSrc2;                /* Intermediate pointers */
    int32_t sum;                                 /* Accumulators */
    uint32_t blockSize1, blockSize2, blockSize3; /* Loop counters */
    uint32_t j, k, count, blkCnt;                /* Loop counters */

#if defined (PLP_MATH_LOOPUNROLL)
    int32_t acc0, acc1, acc2, acc3;              /* Accumulators */
    int16_t x0, x1, x2, x3, c0;                  /* Temporary variables to hold state and coefficient values */
#endif

    v2s _x1, _x2, _x3, _x4, _x5, _x6, _x7;
    v2s _y1, _y2;

    int16_t y0, y1;
  
    blockSize1 = srcBLen - 1U;
    blockSize2 = srcALen - (srcBLen - 1U);
    blockSize3 = blockSize1;

    /* --------------------------
     * Initializations of stage2
     * ------------------------*/

    /* sum = x[0] * y[srcBLen-1] + x[1] * y[srcBLen-2] +...+ x[srcBLen-1] * y[0]
     * sum = x[1] * y[srcBLen-1] + x[2] * y[srcBLen-2] +...+ x[srcBLen]   * y[0]
     * ....
     * sum = x[srcALen-srcBLen-2] * y[srcBLen-1] + x[srcALen] * y[srcBLen-2] +...+ x[srcALen-1] * y[0]
     */

    /* Working pointer of inputA */
    px = pIn1;

    /* Working pointer of inputB */
    pSrc2 = pIn2 + (srcBLen - 1U);
    py = pSrc2;

    /* count is index by which the pointer pIn1 to be incremented */
    count = 0U;

    /* -------------------
     * Stage2 process
     * ------------------*/

    /* Stage2 depends on srcBLen as in this stage srcBLen number of MACS are performed.
     * So, to loop unroll over blockSize2,
     * srcBLen should be greater than or equal to 4 */
    if (srcBLen >= 4U) {
   
#if defined (PLP_MATH_LOOPUNROLL)

        /* Loop unrolling: Compute 4 outputs at a time */
        blkCnt = blockSize2 >> 2U;
        while (blkCnt > 0U) {
            /* Set all accumulators to zero */
            acc0 = 0;
            acc1 = 0;
            acc2 = 0;
            acc3 = 0;

            /* Apply loop unrolling and compute 4 MACs simultaneously. */
            k = srcBLen >> 2U;

            /* First part of the processing with loop unrolling.  Compute 4 MACs at a time.
            ** a second loop below computes MACs for the remaining 1 to 3 samples. */
            do {

                _y1 = *((v2s*)(py-1)); // { y[srcBLen - 2] , y[srcBLen - 1] }
                _y2 = *((v2s*)(py-3)); // { y[srcBLen - 4] , y[srcBLen - 3] }

                _x3 = *((v2s*)(px+2)); // {x[2], x[3]}
                _x5 = *((v2s*)(px+4)); // {x[4], x[5]}
                _x7 = *((v2s*)(px+6)); // {x[6], x[7]}
          
                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1); // { y[srcBLen - 1] , y[srcBLen - 2] }

                // Load _x1 later to keep it in the register
                _x1 = *((v2s*)(px)); // {x[0], x[1]}

                _x4 = __builtin_shuffle(_x3, _x5,shufflemask2); // {x[3], x[4]}
                _x2 = __builtin_shuffle(_x1, _x3,shufflemask2); // {x[1], x[2]}

                /* acc0 +=  x[0] * y[srcBLen - 1] +  x[1] * y[srcBLen - 2] */
                acc0 = __SUMDOTP2(_x1, _y1, acc0);
                /* acc1 +=  x[1] * y[srcBLen - 1] +  x[2] * y[srcBLen - 2] */
                acc1 = __SUMDOTP2(_x2, _y1, acc1);          
                /* acc2 +=  x[2] * y[srcBLen - 1] +  x[3] * y[srcBLen - 2]*/
                acc2 = __SUMDOTP2(_x3, _y1, acc2);
                /* acc3 +=  x[3] * y[srcBLen - 1] +  x[4] * y[srcBLen - 2] */
                acc3 = __SUMDOTP2(_x4, _y1, acc3);
                /* Perform the multiply-accumulate */

                // Shuffle _x6 later to make sure that _x5 and _x6 are in the register
                _x6 = __builtin_shuffle(_x5, _x7,shufflemask2); // {x[5], x[6]}

                // Shuffle _y2 later to be sure it is in the register
                _y2 = __builtin_shuffle(_y2,_y2,shufflemask1); // { y[srcBLen - 3] , y[srcBLen - 4] }

                /* acc0 +=  x[2] * y[srcBLen - 3] + x[3] * y[srcBLen - 4]  */
                acc0 = __SUMDOTP2(_x3, _y2, acc0);
                /* acc1 +=  x[3] * y[srcBLen - 3] + x[4] * y[srcBLen - 4] */
                acc1 = __SUMDOTP2(_x4, _y2, acc1);
                /* acc2 +=  x[4] * y[srcBLen - 3] + x[5] * y[srcBLen - 4]  */
                acc2 = __SUMDOTP2(_x5, _y2, acc2);
                /* acc3 +=  x[5] * y[srcBLen - 3] + x[6] * y[srcBLen - 4] */
                acc3 = __SUMDOTP2(_x6, _y2, acc3);

                px += 4U;
                py -= 4U;
          
            } while (--k);

            /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
            ** No loop unrolling is used. */
            k = srcBLen % 0x4U;

            while (k > 0U) {
                /* Read y[srcBLen - 5] sample */
                c0 = *py--;

                _x1 = *((v2s*)(px)); // { x[0] , x[1] }
                _x2 = *((v2s*)(px+2)); // { x[2] , x[3] }

                px++;
          
                /* Perform the multiply-accumulate */
                /* acc0 +=  x[4] * y[srcBLen - 5] */
                acc0 += _x1[0] * c0;
                /* acc1 +=  x[5] * y[srcBLen - 5] */
                acc1 += _x1[1] * c0;
                /* acc2 +=  x[6] * y[srcBLen - 5] */
                acc2 += _x2[0] * c0;
                /* acc3 +=  x[7] * y[srcBLen - 5] */
                acc3 += _x2[1] * c0;

                /* Decrement the loop counter */
                k--;
            }

            /* Store the result in the accumulator in the destination buffer. */

            *pOut++ = acc0;
            *pOut++ = acc1;
            *pOut++ = acc2;
            *pOut++ = acc3;
          
            /* Increment the pointer pIn1 index, count by 4 */
            count += 4U;

            /* Update the inputA and inputB pointers for next MAC calculation */
            px = pIn1 + count;
            py = pSrc2;

            /* Decrement the loop counter */
            blkCnt--;
        }

        /* If the blockSize2 is not a multiple of 4, compute any remaining output samples here.
        ** No loop unrolling is used. */
        blkCnt = blockSize2 % 0x4U;

#else

        /* Initialize blkCnt with number of samples */
        blkCnt = blockSize2;

#endif /* #if defined (PLP_MATH_LOOPUNROLL)*/

        while (blkCnt > 0U) {
            /* Accumulator is made zero for every iteration */
            _y1 = *((v2s*)(py-1));
            _x1 = *((v2s*)(px));
            sum = 0;

#if  defined (PLP_MATH_LOOPUNROLL)
            /* Loop unrolling: Compute 4 outputs at a time */
            k = srcBLen >> 1U;
            while (k > 0U) {
                /* Perform the multiply-accumulate */
                _y1 = __builtin_shuffle(_y1,_y1,shufflemask1);

                sum = __SUMDOTP2(_x1,_y1,sum);

                py -= 2;          
                px += 2;
          
                _y1 = *((v2s*)(py-1));
                _x1 = *((v2s*)(px));
          
                k--;

            }

            /* Loop unrolling: Compute remaining outputs */
            k = srcBLen % 0x2U;

            if(k) {
                sum = __MAC(sum,_x1[0],_y1[1]);
            }

#else
            /* Initialize blkCnt with number of samples */
            k = srcBLen;

            while(k){
                sum = __MAC(sum,*px++,*py--);
                k--;
            }

#endif /* #if defined (PLP_MATH_LOOPUNROLL) */
      
            /* Store the result in the accumulator in the destination buffer. */
            *pOut++ = sum;

            /* Increment the MAC count */
            count++;

            /* Update the inputA and inputB pointers for next MAC calculation */
            px = pIn1 + count;
            py = pSrc2;

            /* Decrement the loop counter */
            blkCnt--;
        }
    } else {
        /* If the srcBLen is not a multiple of 4,
         * the blockSize2 loop cannot be unrolled by 4 */
        blkCnt = blockSize2;

        while (blkCnt > 0U) {
            /* Accumulator is made zero for every iteration */
            sum = 0;

            /* srcBLen number of MACS should be performed */
            k = srcBLen;

            while (k > 0U) {
                /* Perform the multiply-accumulate */
                /* sum += *px++ * *py--; */
                sum = __MAC(sum, *px++, *py--);
                /* Decrement the loop counter */
                k--;
            }

            /* Store the result in the accumulator in the destination buffer. */
            *pOut++ = sum;

            /* Increment the MAC count */
            count++;

            /* Update the inputA and inputB pointers for next MAC calculation */
            px = pIn1 + count;
            py = pSrc2;

            /* Decrement the loop counter */
            blkCnt--;
        }
    }
}

/**
   @} end of BasicConvolutionKernels
*/
