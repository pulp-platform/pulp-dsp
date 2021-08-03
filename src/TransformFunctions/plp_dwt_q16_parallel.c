/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_q16_parallel.c
 * Description:  16bit Fixed-point Discret Wavelet Transform
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
  @defgroup dwt DWT transforms
  This module contains the code to perform DWT transforms.


 */

/**
   @addtogroup dwt
   @{
*/

/**
   @brief  16bit Parallel Fixed-point DWT on real input data for XPULPV2 extension.
   @param[in]   pSrc     points to the input buffer (q16)
   @param[in]   length   length of input buffer
   @param[in]   wavelet  wavelet structure for calculating DWT
   @param[in]   mode     boundary extension mode
   @param[in]   nPE      Number of cores to use

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_q16_parallel(const int16_t *__restrict__ pSrc,
                 uint32_t length,
                 const plp_dwt_wavelet_q16 wavelet,
                 plp_dwt_extension_mode mode,
                 uint32_t nPE,
                 int16_t *__restrict__ pDstA,
                 int16_t *__restrict__ pDstD) {

   if((mode == PLP_DWT_MODE_ANTIREFLECT || mode == PLP_DWT_MODE_REFLECT) && length <= 1){
      printf("F Cannot run [anti]reflect mode on length 1 signal.\n");
      return;
   }

   if (hal_cluster_id() == ARCHI_FC_CID) {
      printf("parallel processing supported only for cluster side\n");
      return;
   } else {
      plp_dwt_instance_q16 args = {
         .pSrc = pSrc,
         .length = length,
         .wavelet = wavelet,
         .mode = mode,
         .nPE = nPE,
         .pDstA = pDstA,
         .pDstD = pDstD
      };

      switch(wavelet.type) {
      case PLP_DWT_WAVELET_HAAR:
      case PLP_DWT_WAVELET_DB1:
         hal_cl_team_fork(nPE, plp_dwt_haar_q16p_xpulpv2, (void *)&args);
         break;
      default:
         hal_cl_team_fork(nPE, plp_dwt_q16p_xpulpv2, (void *)&args);

         break;
      }
   }
}

/**
   @} end of DWT group
*/
