/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_f32.c
 * Description:  Floating-point Discret Wavelet Transform
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

/**
  @ingroup groupTransforms
 */

/**
  @defgroup dwt  DWT transforms
  This module contains the code to perform DWT transforms.


 */

/**
   @addtogroup dwt
   @{
*/

// typedef enum {
//    PLP_DWT_HAAR,
//    PLP_DWT_DB1,
//    PLP_DWT_DB1
// } plp_dwt_wavelet;

// typedef struct {

//    uint32_t length;

//    float32_t *dec_lo; /* decomposition lowpass */
//    float32_t *dec_hi; /* decomposition highpass */
// } plp_dwt_wavelet_f32;

const plp_dwt_wavelet_f32 PLP_DWT_DB1 = {
    .length = 2,
    .dec_lo = (float32_t[]){ 0.7071067811865476f, 0.7071067811865476f },
    .dec_hi = (float32_t[]){ -0.7071067811865476f, 0.7071067811865476f }
};

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
void plp_dwt_f32(const float32_t *__restrict__ pSrc,
                 uint32_t length,
                 const plp_dwt_wavelet_f32 wavelet,
                 plp_dwt_extension_mode mode,
                 float32_t *__restrict__ pDstA,
                 float32_t *__restrict__ pDstD) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("F extension is supported only for cluster side\n");
        return;
    }

    plp_dwt_f32_xpulpv2(pSrc, length, wavelet, mode, pDstA, pDstD);
}

/**
   @} end of DWT group
*/
