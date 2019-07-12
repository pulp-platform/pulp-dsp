/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_conv_i16_xpulpv2.c
 * Description:  16-bit fixed point scalar dot product kernel for RV32IM
 *
 * $Date:        01. July 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 Moritz Scherer, IIS, ETH Zurich. All rights reserved.
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
   @ingroup BasicConvolution
*/

/**
   @addtogroup BasicConvolutionKernels
   @{
*/

/**
   @brief Convolution of 16-bit integer vectors kernel for RV32IM extension.
   @param[in]  pSrcA      points to the first input vector
   @param[in]  srcALen   Length of the first input vector
   @param[in]  pSrcB      points to the second input vector
   @param[in]  srcBLen   Length of the second input vector
   @param[out] result     output result returned here
   @return        none */

// Pre-condition: psrcALen >= psrcBLen, established by calling function plp_conv_i32
// Pre-condition: pRes has enough allocated memory, i.e. srcALen + srcBLen-1u
// Pre-condition: srcALen >= 2 and srcBLen >= 2, otherwise use vector dot product

void plp_conv_i16s_xpulpv2(const int16_t *  pSrcA,
			   const uint32_t srcALen,
			   const int16_t *  pSrcB,
			   const uint32_t srcBLen,
			   int32_t *  pRes){


  const int16_t *pIn1 = pSrcA;                               /* InputA pointer */
  const int16_t *pIn2 = pSrcB;                               /* InputB pointer */
  int32_t *pOut = pRes;                        /* Output pointer */
  const int16_t *px;                                 /* Intermediate inputA pointer */
  const int16_t *py;                           /* Intermediate inputB pointer */
  const int16_t *pSrc1, *pSrc2;                      /* Intermediate pointers */
  int32_t sum;                                 /* Accumulators */
  uint32_t blockSize1, blockSize2, blockSize3;   /* Loop counters */
  uint32_t j, k, count, blkCnt;                  /* Loop counters */

#if defined (PLP_MATH_LOOPUNROLL)
  int32_t acc0, acc1, acc2, acc3;              /* Accumulators */
  int16_t x0, x1, x2, x3, c0;                  /* Temporary variables to hold state and coefficient values */
#endif

  int16_t temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;

  v2s _x1, _x2, _x3, _x4;
  v2s _y1, _y2;

  blockSize1 = srcBLen - 1U;
  blockSize2 = srcALen - (srcBLen - 1U);
  blockSize3 = blockSize1;

  /* --------------------------
   * Initializations of stage1
   * -------------------------*/

  /* sum = x[0] * y[0]
   * sum = x[0] * y[1] + x[1] * y[0]
   * ....
   * sum = x[0] * y[srcBlen - 1] + x[1] * y[srcBlen - 2] +...+ x[srcBLen - 1] * y[0]
   */

  /* In this stage the MAC operations are increased by 1 for every iteration.
     The count variable holds the number of MAC operations performed */
  count = 1U;

  /* Working pointer of inputA */
  px = pIn1;
  
  /* Working pointer of inputB */
  py = pIn2;

  /* ------------------------
   * Stage1 process
   * ----------------------*/
  
  /* The first stage starts here */
  while (blockSize1 > 0U)
    {
      /* Accumulator is made zero for every iteration */
      sum = 0;

#if defined (PLP_MATH_LOOPUNROLL)
      /* Loop unrolling: Compute 4 outputs at a time */
      k = count >> 2U;
      while (k > 0U)
	{
	  _y1 = *((v2s*)(py-1));
	  _y2 = *((v2s*)(py-3));
	  _x1 = *((v2s*)(px));
	  _x2 = *((v2s*)(px+2));
	  
	  _y1 = __builtin_shuffle(_y1,_y1,(v2s){1,0});
	  _y2 = __builtin_shuffle(_y2,_y2,(v2s){1,0});

	  px += 4;
	  py -= 4;
	  
	  sum = __SUMDOTP2(_x1,_y1,sum);
	  sum = __SUMDOTP2(_x2,_y2,sum);

	  k--;

	}

      /* Loop unrolling: Compute remaining outputs */
      k = count % 0x4U;
#else
      /* Initialize k with number of samples */
      k = count;

#endif /* #if defined (PLP_MATH_LOOPUNROLL) */

      while (k > 0U)
	{
	  /* Perform the multiply-accumulate */
	  sum += *px++ * *py--;
	  
	  /* Decrement loop counter */
	  k--;
	}

      /* Store the result in the accumulator in the destination buffer. */
      *pOut++ = sum;

      /* Update the inputA and inputB pointers for next MAC calculation */
      py = pIn2 + count;
      px = pIn1;

      /* Increment MAC count */
      count++;

      /* Decrement loop counter */
      blockSize1--;
    }

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
  if (srcBLen >= 4U)
    {
   
#if defined (PLP_MATH_LOOPUNROLL)

      /* Loop unrolling: Compute 4 outputs at a time */
      blkCnt = blockSize2 >> 2U;
      while (blkCnt > 0U)
	{
	  /* Set all accumulators to zero */
	  acc0 = 0;
	  acc1 = 0;
	  acc2 = 0;
	  acc3 = 0;

	  /* Apply loop unrolling and compute 4 MACs simultaneously. */
	  k = srcBLen >> 2U;

	  /* First part of the processing with loop unrolling.  Compute 4 MACs at a time.
	  ** a second loop below computes MACs for the remaining 1 to 3 samples. */
	  do
	    {

	      _y1 = *((v2s*)(py-1)); // { y[srcBLen - 2] , y[srcBLen - 1] }
	      _x3 = *((v2s*)(px+2)); // { x[2] , x[3] }
	      _x1 = *((v2s*)(px)); // { x[0] , x[1] }	   
	      _y2 = *((v2s*)(py-3)); // { y[srcBLen - 4] , y[srcBLen - 3] }
	      
	      _y1 = __builtin_shuffle(_y1,_y1,(v2s){1,0}); // { y[srcBLen - 1] , y[srcBLen - 2]  }
	      _x4 = *((v2s*)(px+3)); // { x[3] , x[4] }

	      _x2 = __builtin_shuffle(_x1,_x3,(v2s){1,2}); // { x[1] , x[2] }

	      _y2 = __builtin_shuffle(_y2,_y2,(v2s){1,0}); // { y[srcBLen - 3] , y[srcBLen - 4] }
	  
	      /* acc0 +=  x[0] * y[srcBLen - 1] +  x[1] * y[srcBLen - 2] */
	      acc0 = __SUMDOTP2(_x1,_y1,acc0);
	      /* acc1 +=  x[1] * y[srcBLen - 1] +  x[2] * y[srcBLen - 2] */
	      acc1 = __SUMDOTP2(_x2,_y1,acc1);
	      
	      _x2 = *((v2s*)(px+6));
	      
	      /* acc2 +=  x[2] * y[srcBLen - 1] +  x[3] * y[srcBLen - 2]*/
	      acc2 = __SUMDOTP2(_x3,_y1,acc2);
	      /* acc3 +=  x[3] * y[srcBLen - 1] +  x[4] * y[srcBLen - 2] */
	      acc3 = __SUMDOTP2(_x4,_y1,acc3);

	      /* Re-use _x1 and _x4: */
	      _x1 = __builtin_shuffle(_x4,_x2,(v2s){1,2});
	      /* Perform the multiply-accumulate */
	      /* acc0 +=  x[2] * y[srcBLen - 3] + x[3] * y[srcBLen - 4]  */
	      acc0 = __SUMDOTP2(_x3,_y2, acc0);
	      /* acc1 +=  x[3] * y[srcBLen - 3] + x[4] * y[srcBLen - 4] */
	      acc1 = __SUMDOTP2(_x4,_y2, acc1);
	      /* acc2 +=  x[4] * y[srcBLen - 3] + x[5] * y[srcBLen - 4]  */
	      acc2 = __SUMDOTP2(_x1, _y2, acc2);
	      /* acc3 +=  x[5] * y[srcBLen - 3] + x[6] * y[srcBLen - 4] */
	      acc3 = __SUMDOTP2(_x2, _y2, acc3);
	      
	      px += 4U;
	      py -= 4U;
	      
	    } while (--k);

	  /* If the srcBLen is not a multiple of 4, compute any remaining MACs here.
	  ** No loop unrolling is used. */
	  k = srcBLen % 0x4U;

	  while (k > 0U)
	    {
	      /* Read y[srcBLen - 5] sample */
	      c0 = *py--;
	      
	      _x1 = *((v2s*)(px)); // { x[0] , x[1] }
	      _x2 = *((v2s*)(px+2)); // { x[0] , x[1] }
	      /* px++; */
	      /* px++; */
	      /* px++; */
	      /* px++; */
	      px+=2;
	      px+=2;
	      /* Perform the multiply-accumulate */
	      /* acc0 +=  x[4] * y[srcBLen - 5] */
	      acc0 += _x1[0] * c0;
	      /* acc1 +=  x[5] * y[srcBLen - 5] */
	      acc1 += _x1[1] * c0;
	      /* acc2 +=  x[6] * y[srcBLen - 5] */
	      acc2 += _x2[0] * c0;
	      /* acc3 +=  x[7] * y[srcBLen - 5] */
	      acc3 += _x2[1] * c0;

	      /* Reuse the present samples for the next MAC */
	      /* x0 = x1; */
	      /* x1 = x2; */
	      /* x2 = x3; */

	      //px+=4;

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

      while (blkCnt > 0U)
	{
	  /* Accumulator is made zero for every iteration */
	  sum = 0;

#if  defined (PLP_MATH_LOOPUNROLL)
	  /* Loop unrolling: Compute 4 outputs at a time */
	  k = srcBLen >> 2U;
	  while (k > 0U)
	    {
	      /* Perform the multiply-accumulate */
	      _y1 = *((v2s*)(py-1));
	      _x1 = *((v2s*)(px));

	      _y2 = *((v2s*)(py-3));
	      _x2 = *((v2s*)(px+2));
	    
	      _y1 = __builtin_shuffle(_y1,_y1,(v2s){1,0}); 
	      _y2 = __builtin_shuffle(_y2,_y2,(v2s){1,0});

	      py-=4;
	      px+=4;

	      sum = __SUMDOTP2(_x1,_y1,sum);
	      sum = __SUMDOTP2(_x2,_y2,sum);

	      /* Decrement loop counter */
	      k--;
	    }

	  /* Loop unrolling: Compute remaining outputs */
	  k = srcBLen % 0x4U;

#else
	  /* Initialize blkCnt with number of samples */
	  k = srcBLen;

#endif /* #if defined (PLP_MATH_LOOPUNROLL) */

	  while (k > 0U)
	    {
	      /* Perform the multiply-accumulate */
	      sum += *px++ * *py--;

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
  else
    {
      /* If the srcBLen is not a multiple of 4,
       * the blockSize2 loop cannot be unrolled by 4 */
      blkCnt = blockSize2;

      while (blkCnt > 0U)
	{
	  /* Accumulator is made zero for every iteration */
	  sum = 0;

	  /* srcBLen number of MACS should be performed */
	  k = srcBLen;

	  while (k > 0U)
	    {
	      /* Perform the multiply-accumulate */
	      sum += *px++ * *py--;

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


  /* --------------------------
   * Initializations of stage3
   * -------------------------*/

  /* sum += x[srcALen-srcBLen+1] * y[srcBLen-1] + x[srcALen-srcBLen+2] * y[srcBLen-2] +...+ x[srcALen-1] * y[1]
   * sum += x[srcALen-srcBLen+2] * y[srcBLen-1] + x[srcALen-srcBLen+3] * y[srcBLen-2] +...+ x[srcALen-1] * y[2]
   * ....
   * sum +=  x[srcALen-2] * y[srcBLen-1] + x[srcALen-1] * y[srcBLen-2]
   * sum +=  x[srcALen-1] * y[srcBLen-1]
   */

  /* In this stage the MAC operations are decreased by 1 for every iteration.
     The blockSize3 variable holds the number of MAC operations performed */

  /* Working pointer of inputA */
  pSrc1 = pIn1 + (srcALen - (srcBLen - 1U));
  px = pSrc1;

  /* Working pointer of inputB */
  pSrc2 = pIn2 + (srcBLen - 1U);
  py = pSrc2;

  /* -------------------
   * Stage3 process
   * ------------------*/
  while (blockSize3 > 0U)
    {
      /* Accumulator is made zero for every iteration */
      sum = 0;

#if defined (PLP_MATH_LOOPUNROLL)
      /* Loop unrolling: Compute 4 outputs at a time */
      k = blockSize3 >> 2U;
      while (k > 0U)
	{
	  /* Perform the multiply-accumulate */
	  
	  _y1 = *((v2s*)(py-1));
	  py-=2;
	  
	  _x1 = *((v2s*)px);
	  px+=2;
	  
	  _y2 = *((v2s*)(py-1));
	  _x2 = *((v2s*)px);
	  
	  _y1 = __builtin_shuffle(_y1,_y1,(v2s){1,0});
	  _y2 = __builtin_shuffle(_y2,_y2,(v2s){1,0});

	  py-=2;
	  px+=2;
	  
	  sum = __SUMDOTP2(_x1,_y1,sum);
	  sum = __SUMDOTP2(_x2,_y2,sum);

	  /* Decrement loop counter */
	  k--;
	  
	}

      /* Loop unrolling: Compute remaining outputs */
      k = blockSize3 % 0x4U;
#else

      /* Initialize blkCnt with number of samples */
      k = blockSize3;

#endif /* defined (PLP_MATH_LOOPUNROLL)*/

      while (k > 0U)
	{
	  /* Perform the multiply-accumulate */
	  /* sum +=  x[srcALen-1] * y[srcBLen-1] */
	  sum += *px++ * *py--;

	  /* Decrement loop counter */
	  k--;
	}

      /* Store the result in the accumulator in the destination buffer. */
      *pOut++ = sum;

      /* Update the inputA and inputB pointers for next MAC calculation */
      px = ++pSrc1;
      py = pSrc2;

      /* Decrement the loop counter */
      blockSize3--;
    }
}

