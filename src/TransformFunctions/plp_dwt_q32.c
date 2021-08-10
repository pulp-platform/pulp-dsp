/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_q32.c
 * Description:  32bit Fixed-point Discret Wavelet Transform
 *
 * $Date:        10. Juli 2021
 * $Revision:    V1
 *
 * Target Processor: PULP cores
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



void copy_coefs_q32(int32_t *dec_hi_l1, int32_t *dec_lo_l1, plp_dwt_wavelet_q32 wavelet){
   int32_t *dec_hi_l1_temp = dec_hi_l1;
   int32_t *dec_lo_l1_temp = dec_lo_l1;

   int32_t *dec_hi_temp = wavelet.dec_hi;
   int32_t *dec_lo_temp = wavelet.dec_lo;

   // Copy wavelet coefficients into l1
   for(int i = 0; i < wavelet.length; i++){
      *dec_hi_l1_temp++ = *dec_hi_temp++;
      *dec_lo_l1_temp++ = *dec_lo_temp++;
   }
}

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
   @brief  32bit Fixed-point DWT on real input data for XPULPV2 extension.
   @param[in]   pSrc     points to the input buffer (q32)
   @param[in]   length   length of input buffer
   @param[in]   wavelet  wavelet structure for calculating DWT
   @param[in]   mode     boundary extension mode

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_q32(const int32_t *__restrict__ pSrc,
                 uint32_t length,
                 const plp_dwt_wavelet_q32 wavelet,
                 plp_dwt_extension_mode mode,
                 int32_t *__restrict__ pDstA,
                 int32_t *__restrict__ pDstD) {
   
   if((mode == PLP_DWT_MODE_ANTIREFLECT || mode == PLP_DWT_MODE_REFLECT) && length <= 1){
      printf("F Cannot run [anti]reflect mode on length 1 signal.\n");
      return;
   }


   int32_t *dec_hi_l1;
   int32_t *dec_lo_l1;
   plp_dwt_wavelet_q32 temp_wavelet;

  


   if (hal_cluster_id() == ARCHI_FC_CID) {
      switch(wavelet.type) {
      case PLP_DWT_WAVELET_HAAR:
      case PLP_DWT_WAVELET_DB1:
         plp_dwt_haar_q32s_rv32im(pSrc, length, mode, pDstA, pDstD);
         break;
      default:

         // dec_hi_l1 = hal_fc_l1_malloc(sizeof(int32_t) * (wavelet.length));
         // dec_lo_l1 = hal_fc_l1_malloc(sizeof(int32_t) * (wavelet.length));

         // copy_coefs_q32(dec_hi_l1, dec_lo_l1, wavelet);
         // temp_wavelet = (plp_dwt_wavelet_q32){
         //    .length = wavelet.length,
         //    .type = wavelet.type,
         //    .dec_hi = dec_hi_l1,
         //    .dec_lo = dec_lo_l1
         // };


         // copy_coefs_q32(dec_hi_l1, dec_lo_l1, wavelet);
         plp_dwt_q32s_rv32im(pSrc, length, wavelet, mode, pDstA, pDstD);
         //plp_dwt_q32s_rv32im(pSrc, length, temp_wavelet, mode, pDstA, pDstD);
         // hal_fc_l1_free(dec_hi_l1, sizeof(int32_t) * (wavelet.length) );
         // hal_fc_l1_free(dec_lo_l1, sizeof(int32_t) * (wavelet.length) );
         break;
      }
   }else {
      switch(wavelet.type) {
      case PLP_DWT_WAVELET_HAAR:
      case PLP_DWT_WAVELET_DB1:
         plp_dwt_haar_q32s_xpulpv2(pSrc, length, mode, pDstA, pDstD);
         break;
      default:

         dec_hi_l1 = hal_cl_l1_malloc(sizeof(int32_t) * (wavelet.length));
         dec_lo_l1 = hal_cl_l1_malloc(sizeof(int32_t) * (wavelet.length));

         copy_coefs_q32(dec_hi_l1, dec_lo_l1, wavelet);
         temp_wavelet = (plp_dwt_wavelet_q32){
            .length = wavelet.length,
            .type = wavelet.type,
            .dec_hi = dec_hi_l1,
            .dec_lo = dec_lo_l1
         };


         plp_dwt_q32s_xpulpv2(pSrc, length, temp_wavelet, mode, pDstA, pDstD);

         hal_cl_l1_free(dec_hi_l1, sizeof(int32_t) * (wavelet.length) );
         hal_cl_l1_free(dec_lo_l1, sizeof(int32_t) * (wavelet.length) );
         break;
      }
   }


}

/**
   @} end of DWT group
*/
