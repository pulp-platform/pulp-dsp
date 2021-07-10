/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_f32_xpulpv2.c
 * Description:  Floating-point Discret Wavelet Transform on real input data for XPULPV2
 *
 * $Date:        10. Juli 2021
 * $Revision:    V1
 *
 * Target Processor: PULP cores with "F" support (wolfe)
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Jakub Mandula, ETH Zurich
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

/* HELPER FUNCTIONS */

/**
  @ingroup dwt
 */

/**
  @defgroup realDWTKernels DWT kernels on real input values
  These kernels calculate the DWT transform on real input data.
*/

/**
  @addtogroup realDWTKernels
  @{
 */

/**
   @brief  Floating-point DWT on real input data for XPULPV2 extension.
   @param[in]   pSrc     points to the input buffer (real data)
   @param[in]   length   length of input buffer
   @param[in]   wavelet  wavelet structure for calculating DWT
   @param[in]   mode     boundary extension mode

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_f32_xpulpv2(const float32_t *__restrict__ pSrc,
                         uint32_t length,
                         const plp_dwt_wavelet_f32 wavelet,
                         plp_dwt_extension_mode mode,
                         float32_t *__restrict__ pDstA,
                         float32_t *__restrict__ pDstD) {
    float32_t *pCurrentA = pDstA;
    float32_t *pCurrentD = pDstD;

    static uint32_t step = 2;

    int32_t offset, j;

    // We start convolving from the frist element and skip over by one.
    // Make sure not to roll over the Array length and the wavelet length
    // offset is the element in pSrc which alligns with current filter offset (can go beyond end)
    for (offset = step - 1; offset < length + wavelet.length - 1; offset += step) {

        float32_t sum_lo = 0;
        float32_t sum_hi = 0;

        // = wavelet.length - 1; // Filter counter start at end of filter
        printf("Computing Left\n===============\n");

        j = wavelet.length - 1;
        // Compute Left edge extension
        switch (mode) {
        case PLP_DWT_MODE_CONSTANT:

            for (; j > offset; j--) {
                printf("Constat +=wavelet[%d] * pSrc[%d]\n", j, 0);
                sum_lo += wavelet.dec_lo[j] * pSrc[0];
                sum_hi += wavelet.dec_hi[j] * pSrc[0];
            }

            break;
        case PLP_DWT_MODE_SYMMETRIC:
            break;
        case PLP_DWT_MODE_REFELCT:
            break;
        case PLP_DWT_MODE_PERIODIC:
            break;
        case PLP_DWT_MODE_ANTISYMMETRIC:
            break;
        case PLP_DWT_MODE_ANTIREFLECT:
            break;
        case PLP_DWT_MODE_ZERO:
        default:
            break;
        }

        // Compute convolution on both hi and lo filter
        // Compute Center

        // At center we start at the offset'th offset or wavelet end
        j = MIN(offset, wavelet.length - 1);
        printf("Computing Center\n===============\n");
        printf("Offset %d, Starting at j: %d\n", offset, j);

        for (; j >= 0 && offset - j < length; j--) {
            printf("+=wavelet[%d] * pSrc[%d]\n", j, offset - j);
            sum_lo += wavelet.dec_lo[j] * pSrc[offset - j];
            sum_hi += wavelet.dec_hi[j] * pSrc[offset - j];
        }

        printf("Computing Right\n===============\n");

        // Compute Right edge extension
        switch (mode) {
        case PLP_DWT_MODE_CONSTANT:
            for (j = offset - length; j >= 0; j--) {
                printf("Constat += wavelet[%d] * pSrc[%d]\n", j, length - 1);
                sum_lo += wavelet.dec_lo[j] * pSrc[length - 1];
                sum_hi += wavelet.dec_hi[j] * pSrc[length - 1];
            }

            break;
        case PLP_DWT_MODE_SYMMETRIC:
            break;
        case PLP_DWT_MODE_REFELCT:
            break;
        case PLP_DWT_MODE_PERIODIC:
            break;
        case PLP_DWT_MODE_ANTISYMMETRIC:
            break;
        case PLP_DWT_MODE_ANTIREFLECT:
            break;
        case PLP_DWT_MODE_ZERO:
        default:
            break;
        }

        *pCurrentA++ = sum_lo;
        *pCurrentD++ = sum_hi;
    }
}
