/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_cfft_f32.c
 * Description:  Floating-point FFT on complex input data
 *
 * $Date:        4. August 2020
 * $Revision:    V1
 *
 * Target Processor: PULP cores with "F" support (wolfe, vega)
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Giuseppe Tagliavini, University of Bologna
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
  @defgroup fft  FFT transforms
  This module contains the code to perform FFT transforms.


 */

/**
   @addtogroup fft
   @{
*/

/**
   @brief Floating-point FFT on complex input data.
   @param[in]   S points to an instance of the floating-point FFT structure
   @param[in]   pSrc points to the complex data buffer of size <code>2*fftLen</code>. Processing occurs in-place.
   @param[in]   ifftFlag flag that selects forwart (ifftFlag=0) or inverse (ifftFlag=1)
   @param[in]   bitReverseFlag flag that enables (bitReverseFlag=1) of disables (bitReverseFlag=0) bit reversal of output.
   @return      none
*/
void plp_cfft_f32(  const plp_cfft_instance_f32 *S,
                    float32_t *pSrc,
                    uint8_t ifftFlag,
                    uint8_t bitReverseFlag) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("F extension is supported only for cluster side\n");
        return;
    }
    plp_cfft_f32s_xpulpv2(S, pSrc, ifftFlag, bitReverseFlag);
}

/**
   @} end of FFT group
*/
