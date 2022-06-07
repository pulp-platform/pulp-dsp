/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_inv_f32s_xpulpv2.c
 * Description:  32-bit floating-point matrix inversion for XPULPV2
 *
 * $Date:        14. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source codes
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * Apache-2.0.
 */

#include "plp_math.h"

/**
  @ingroup MatInv
 */

/**
  @defgroup MatInvKernels matrix inversion kernels
  This module contains the kernel functions for matrix inversion.

  The inverse of a matrix of shape MxN is another matrix of shape NxN, such
  that

  \f[
    I = A \cdot A^{-1}
  \f]

  The inverse is defined only if the input matrix is square and non-singular
  (the determinant is non-zero). The function checks that the input and output
  matrices are square and of the same size. Matrix inversion is numerically
  sensitive and the PULP DSP library only supports matrix inversion of
  floating-point matrices.

  @par Algorithm
  The Gauss-Jordan method is used to find the inverse. The algorithm performs a
  sequence of elementary row-operations until it reduces the input matrix to an
  identity matrix. Applying the same sequence of elementary row-operations to an
  identity matrix yields the inverse matrix.
 */

/**
  @addtogroup MatInvKernels
  @{
 */

/**
  @brief matrix inversion of 32-bit floating-point matrices kernel for XPULPV2 extension.
  @param[in]  pSrc Points to the first input matrix. pSrc is modified by this funciton
  @param[in]  N    Width and height of both matrices
  @param[out] pDst Points to the output matrix
  @return     0: Success, 1: Matrix is singular
 */

int plp_mat_inv_f32s_xpulpv2(float *__restrict__ pSrc, float *__restrict__ pDst, uint32_t N) {

    /*--------------------------------------------------------------------------------------------------------------
     * Matrix Inverse can be solved using elementary row operations.
     *
     *  Gauss-Jordan Method:
     *
     *      1. First combine the identity matrix and the input matrix separated by a bar to form an
     *        augmented matrix as follows:
     *                      _                  _         _         _
     *                     |  a11  a12 | 1   0  |       |  X11 X12  |
     *                     |           |        |   =   |           |
     *                     |_ a21  a22 | 0   1 _|       |_ X21 X21 _|
     *
     *      2. In our implementation, pDst Matrix is used as identity matrix.
     *
     *      3. Begin with the first row. Let i = 1.
     *
     *      4. Check to see if the pivot for row i is zero.
     *         The pivot is the element of the main diagonal that is on the current row.
     *         For instance, if working with row i, then the pivot element is aii.
     *         If the pivot is zero, exchange that row with a row below it that does not
     *         contain a zero in column i. If this is not possible, then an inverse
     *         to that matrix does not exist.
     *
     *      5. Divide every element of row i by the pivot.
     *
     *      6. For every row below and  row i, replace that row with the sum of that row and
     *         a multiple of row i so that each new element in column i below row i is zero.
     *
     *      7. Move to the next row and column and repeat steps 2 through 5 until you have zeros
     *         for every element below and above the main diagonal.
     *
     *      8. Now an identical matrix is formed to the left of the bar(input matrix, pSrc).
     *         Therefore, the matrix to the right of the bar is our solution(pDst matrix, pDst).
     *----------------------------------------------------------------------------------------------------------------*/

    float *pSrcT1, *pSrcT2;                    /* Temporary input data matrix pointer */
    float *pDstT1, *pDstT2;                    /* Temporary output data matrix pointer */
    float *pPivotRowIn;                        /* Temporary input and output data matrix pointer */
    float *pPRT_in, *pPivotRowDst, *pPRT_pDst; /* Temporary input and output data matrix pointer */

    float Xchg, in = 0.0f, in1;                      /* Temporary input values  */
    uint32_t i, rowCnt, flag = 0U, j, loopCnt, k, l; /* loop counters */

    uint32_t M = N; /* M is the number of rows. However, the matirces must be square. */

    /* Working pointer for destination matrix */
    pDstT1 = pDst;

    /* Loop over the number of rows */
    rowCnt = M;

    /* Making the destination matrix as identity matrix */
    while (rowCnt > 0U) {
        /* Writing all zeroes in lower triangle of the destination matrix */
        j = M - rowCnt;
        while (j > 0U) {
            *pDstT1++ = 0.0f;
            j--;
        }

        /* Writing all ones in the diagonal of the destination matrix */
        *pDstT1++ = 1.0f;

        /* Writing all zeroes in upper triangle of the destination matrix */
        j = rowCnt - 1U;
        while (j > 0U) {
            *pDstT1++ = 0.0f;
            j--;
        }

        /* Decrement loop counter */
        rowCnt--;
    }

    /* Loop over the number of columns of the input matrix.
       All the elements in each column are processed by the row operations */
    loopCnt = N;

    /* Index modifier to navigate through the columns */
    l = 0U;

    while (loopCnt > 0U) {
        /* Check if the pivot element is zero..
         * If it is zero then interchange the row with non zero row below.
         * If there is no non zero element to replace in the rows below,
         * then the matrix is Singular. */

        /* Working pointer for the input matrix that points
         * to the pivot element of the particular row  */
        pSrcT1 = pSrc + (l * N);

        /* Working pointer for the destination matrix that points
         * to the pivot element of the particular row  */
        pDstT1 = pDst + (l * N);

        /* Temporary variable to hold the pivot value */
        in = *pSrcT1;

        /* Destination pointer modifier */
        k = 1U;

        /* Check if the pivot element is zero */
        if (*pSrcT1 == 0.0f) {
            /* Loop over the number rows present below */

            for (i = (l + 1U); i < M; i++) {
                /* Update the input and destination pointers */
                pSrcT2 = pSrcT1 + (N * i);
                pDstT2 = pDstT1 + (N * k);

                /* Check if there is a non zero pivot element to
                 * replace in the rows below */
                if (*pSrcT2 != 0.0f) {
                    /* Loop over number of columns
                     * to the right of the pilot element */
                    j = N - l;

                    while (j > 0U) {
                        /* Exchange the row elements of the input matrix */
                        Xchg = *pSrcT2;
                        *pSrcT2++ = *pSrcT1;
                        *pSrcT1++ = Xchg;

                        /* Decrement the loop counter */
                        j--;
                    }

                    /* Loop over number of columns of the destination matrix */
                    j = N;

                    while (j > 0U) {
                        /* Exchange the row elements of the destination matrix */
                        Xchg = *pDstT2;
                        *pDstT2++ = *pDstT1;
                        *pDstT1++ = Xchg;

                        /* Decrement loop counter */
                        j--;
                    }

                    /* Flag to indicate whether exchange is done or not */
                    flag = 1U;

                    /* Break after exchange is done */
                    break;
                }

                /* Update the destination pointer modifier */
                k++;

                /* Decrement loop counter */
            }
        }

        /* Update the status if the matrix is singular */
        if ((flag != 1U) && (in == 0.0f)) {
            return 1;
        }

        /* Points to the pivot row of input and destination matrices */
        pPivotRowIn = pSrc + (l * N);
        pPivotRowDst = pDst + (l * N);

        /* Temporary pointers to the pivot row pointers */
        pSrcT1 = pPivotRowIn;
        pSrcT2 = pPivotRowDst;

        /* Pivot element of the row */
        in = *pPivotRowIn;

        /* Loop over number of columns
         * to the right of the pilot element */
        j = (N - l);

        while (j > 0U) {
            /* Divide each element of the row of the input matrix
             * by the pivot element */
            in1 = *pSrcT1;
            *pSrcT1++ = in1 / in;

            /* Decrement the loop counter */
            j--;
        }

        /* Loop over number of columns of the destination matrix */
        j = N;

        while (j > 0U) {
            /* Divide each element of the row of the destination matrix
             * by the pivot element */
            in1 = *pSrcT2;
            *pSrcT2++ = in1 / in;

            /* Decrement the loop counter */
            j--;
        }

        /* Replace the rows with the sum of that row and a multiple of row i
         * so that each new element in column i above row i is zero.*/

        /* Temporary pointers for input and destination matrices */
        pSrcT1 = pSrc;
        pSrcT2 = pDst;

        /* index used to check for pivot element */
        i = 0U;

        /* Loop over number of rows */
        /*  to be replaced by the sum of that row and a multiple of row i */
        k = M;

        while (k > 0U) {
            /* Check for the pivot element */
            if (i == l) {
                /* If the processing element is the pivot element,
                   only the columns to the right are to be processed */
                pSrcT1 += N - l;

                pSrcT2 += N;
            } else {
                /* Element of the reference row */
                in = *pSrcT1;

                /* Working pointers for input and destination pivot rows */
                pPRT_in = pPivotRowIn;
                pPRT_pDst = pPivotRowDst;

                /* Loop over the number of columns to the right of the pivot element,
                   to replace the elements in the input matrix */
                j = (N - l);

                while (j > 0U) {
                    /* Replace the element by the sum of that row
                       and a multiple of the reference row  */
                    in1 = *pSrcT1;
                    *pSrcT1++ = in1 - (in * *pPRT_in++);

                    /* Decrement the loop counter */
                    j--;
                }

                /* Loop over the number of columns to
                   replace the elements in the destination matrix */
                j = N;

                while (j > 0U) {
                    /* Replace the element by the sum of that row
                       and a multiple of the reference row  */
                    in1 = *pSrcT2;
                    *pSrcT2++ = in1 - (in * *pPRT_pDst++);

                    /* Decrement loop counter */
                    j--;
                }
            }

            /* Increment temporary input pointer */
            pSrcT1 = pSrcT1 + l;

            /* Decrement loop counter */
            k--;

            /* Increment pivot index */
            i++;
        }

        /* Increment the input pointer */
        pSrc++;

        /* Decrement the loop counter */
        loopCnt--;

        /* Increment the index modifier */
        l++;
    }

    if ((flag != 1U) && (in == 0.0f)) {
        for (i = 0; i < M * N; i++) {
            if (pSrc[i] != 0.0f)
                break;
        }

        if (i == M * N)
            return 1;
    }

    return 0;
}

/**
   @} end of MatInvKernels group
*/
