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
#include "plp_dwt_common.h"




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

   if((mode == PLP_DWT_MODE_ANTIREFLECT || mode == PLP_DWT_MODE_REFLECT) && length <= 1){
      printf("F Cannot run [anti]reflect mode on length 1 signal.\n");
      return;
   }

   float32_t *dec_hi_l1;
   float32_t *dec_lo_l1;
   plp_dwt_wavelet_f32 temp_wavelet;

   if (hal_cluster_id() == ARCHI_FC_CID) {
      printf("error: FC doesn't have FPU\n");
      return;
   } else {
      switch(wavelet.type) {
      case PLP_DWT_WAVELET_HAAR:
      case PLP_DWT_WAVELET_DB1:
         plp_dwt_haar_f32s_xpulpv2(pSrc, length, mode, pDstA, pDstD);
         break;
      default:
         dec_hi_l1 = hal_cl_l1_malloc(sizeof(float32_t) * (wavelet.length));
         dec_lo_l1 = hal_cl_l1_malloc(sizeof(float32_t) * (wavelet.length));

         copy_coefs_f32(dec_hi_l1, dec_lo_l1, wavelet);
         temp_wavelet = (plp_dwt_wavelet_f32){
            .length = wavelet.length,
            .type = wavelet.type,
            .dec_hi = dec_hi_l1,
            .dec_lo = dec_lo_l1
         };

         plp_dwt_f32s_xpulpv2(pSrc, length, temp_wavelet, mode, pDstA, pDstD);
         
         hal_cl_l1_free(dec_hi_l1, sizeof(float32_t) * (wavelet.length) );
         hal_cl_l1_free(dec_lo_l1, sizeof(float32_t) * (wavelet.length) );
         break;
      }
   }

}


void plp_dwt_dec_f32(const float32_t *__restrict__ pSrc,
                     uint32_t length,
                     const plp_dwt_wavelet_f32 wavelet,
                     plp_dwt_extension_mode mode,
                     uint32_t level,
                     float32_t *__restrict__ pTemp,
                     float32_t *__restrict__ pDst){
   if((mode == PLP_DWT_MODE_ANTIREFLECT || mode == PLP_DWT_MODE_REFLECT) && length <= 1){
      printf("F Cannot run [anti]reflect mode on length 1 signal.\n");
      return;
   }



   if (hal_cluster_id() == ARCHI_FC_CID) {
      printf("error: FC doesn't have FPU\n");
      return;
   } else {


      uint32_t dst_offset = 0;
      uint32_t out_len = length;
      uint32_t in_len;
      uint32_t quotient = (out_len/(wavelet.length - 1)) >> 1;

      float32_t *dec_hi_l1;
      float32_t *dec_lo_l1;
      plp_dwt_wavelet_f32 temp_wavelet;

      switch(wavelet.type) {
      case PLP_DWT_WAVELET_HAAR:
      case PLP_DWT_WAVELET_DB1:
         break;
      default:
         dec_hi_l1 = hal_cl_l1_malloc(sizeof(float32_t) * (wavelet.length));
         dec_lo_l1 = hal_cl_l1_malloc(sizeof(float32_t) * (wavelet.length));
         copy_coefs_f32(dec_hi_l1, dec_lo_l1, wavelet);

         temp_wavelet = (plp_dwt_wavelet_f32){
               .length = wavelet.length,
               .type = wavelet.type,
               .dec_hi = dec_hi_l1,
               .dec_lo = dec_lo_l1
         };
         break;
      }


      float32_t *pTempBuff1 = pTemp; // For holding odd A coeffs
      float32_t *pTempBuff2 = pTemp + PLP_DWT_DEC_TEMP_LEN(length, wavelet.length); // For holding even A coeffs
      

      const float32_t *pS = pSrc;
      float32_t *pTempADst = pTempBuff1;

      do {
         in_len = out_len; // Get input length (previous output length)
         out_len = PLP_DWT_OUTPUT_LENGTH(out_len, wavelet.length); // Calculate new output length 
         

         /* The signal (or previous approx. coeffs) are the input
         * Approx. coeffs are written after the detailed coeffs
         * Detailed coeffs are appended to end of dest buffer
         * 
         * Level 1: pDst = [ D1 D1 D1 D1  x  x  x  x]  ptmpADst(Buff1) = [A1 A1 A1 A1]
         * Level 2: pDst = [ D1 D1 D1 D1 D2 D2  x  x]  ptmpADst(Buff2) = [A2 A2]
         * Level 3: pDst = [ D1 D1 D1 D1 D2 D2 D3  x]  ptmpADst(Buff1) = [A3]
         */

         // printf("Q: %d, In_L: %d Out_l: %d dst_offset: %d\n", quotient, in_len, out_len, dst_offset);
         switch(wavelet.type) {
         case PLP_DWT_WAVELET_HAAR:
         case PLP_DWT_WAVELET_DB1:
            plp_dwt_haar_f32s_xpulpv2(pS, in_len, mode, pTempADst, pDst + dst_offset);
            break;
         default:
            plp_dwt_f32s_xpulpv2(pS, in_len, temp_wavelet, mode, pTempADst, pDst + dst_offset);
            break;
         }

         
         
         pS = pTempADst; // Next input will be the current Approx coeffs
         
         // Choose the other buffer as the next Approx buffer
         if(pTempADst == pTempBuff1){
            pTempADst = pTempBuff2;
         }else{
            pTempADst = pTempBuff1;
         }
   

         dst_offset += out_len;
         // In the case that level was 0, it will underflow.
         level--;
         // The while loop will then run until max_level
      } while((quotient >>= 1) && (level > 0));

      // Copy the remaining Approx coeffs from the old pTempADst
      for(int32_t i = 0; i < out_len; i++){
         pDst[dst_offset + i] = pS[i];
      }
      
      // hal_cl_dma_cmd_t copy;

      // int32_t merge = 0;

      // hal_cl_dma_cmd((uint32_t)pS, (uint32_t)(pDst + dst_offset), sizeof(flaot32_t) * out_len, HAL_CL_DMA_DIR_LOC2EXT, merge, &copy);

      switch(wavelet.type) {
      case PLP_DWT_WAVELET_HAAR:
      case PLP_DWT_WAVELET_DB1:
         break;
      default:
         hal_cl_l1_free(dec_hi_l1, sizeof(float32_t) * (wavelet.length) );
         hal_cl_l1_free(dec_lo_l1, sizeof(float32_t) * (wavelet.length) );
         break;
      }
      // hal_cl_dma_cmd_wait(&copy);
   }
}

/**
   @} end of DWT group
*/
