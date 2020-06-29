/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i8s_rv32im.c
 * Description:  8-bit matrix multiplication kernel for RV32IM
 *
 * $Date:        22. December 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2019 ETH Zurich and Ubiversity of Bologna. All rights reserved.
 *
 * Author: Tom Kuchler, ETH Zurich
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
  @ingroup MatMultTrans
 */

/**
  @addtogroup MatMultTransKernels
  @{
 */

/**
  @brief Matrix multiplication of 8-bit integer matrices kernel for RV32IM extension.
  @param[in]  pSrcA     points to the first input matrix
  @param[in]  pSrcB     points to the second input matrix
  @param[in]  M         height of the first input matrix
  @param[in]  N         width of the first input matrix and hight of the second
  @param[in]  O         width of the second input matrix
  @param[out] pDstC     points to the output matrix
  @return        none
 */


// #define BASIC_VERSION // if used don' forget to also use undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_trans_i8s_rv32im(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i = 0; // loop counter
        uint32_t j = 0; // loop counter
        uint32_t k = 0; // loop counter

        for(i=0; i < M; i++){
          for(k=0; k < O; k++){
            int32_t sum = 0;
            for(j=0; j<N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[k*N + j];
            }
            pDstC[i*O +k] = sum;
          }
        }
}

#else

void plp_mat_mult_trans_i8s_rv32im(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i= 0; // loop counter
        uint32_t j= 0; // loop counter
        uint32_t k= 0; // loop counter
        
        uint32_t mod = N & 0x3;

        if(mod == 3){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              int32_t sum3 = 0;
              int32_t sum4 = 0;
              for(j=0; j<N/4; j++){
                sum1 = sum1 + pSrcA[i*N + j*4]*pSrcB[k*N + j*4];
                sum2 = sum2 + pSrcA[i*N + j*4+1]*pSrcB[k*N + j*4+1];
                sum3 = sum3 + pSrcA[i*N + j*4+2]*pSrcB[k*N + j*4+2];
                sum4 = sum4 + pSrcA[i*N + j*4+3]*pSrcB[k*N + j*4+3];
              }
              int32_t remaining = pSrcA[i*N + N-1]*pSrcB[k*N + N-1] + pSrcA[i*N + N-2]*pSrcB[k*N + N-2] + pSrcA[i*N + N-3]*pSrcB[k*N + N-3];
              pDstC[i*O +k] = sum1 + sum2 + sum3 + sum4 + remaining;
            }
          }
        } else if(mod == 2){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              int32_t sum3 = 0;
              int32_t sum4 = 0;
              for(j=0; j<N/4; j++){
                sum1 = sum1 + pSrcA[i*N + j*4]*pSrcB[k*N + j*4];
                sum2 = sum2 + pSrcA[i*N + j*4+1]*pSrcB[k*N + j*4+1];
                sum3 = sum3 + pSrcA[i*N + j*4+2]*pSrcB[k*N + j*4+2];
                sum4 = sum4 + pSrcA[i*N + j*4+3]*pSrcB[k*N + j*4+3];
              }
              int32_t remaining = pSrcA[i*N + N-1]*pSrcB[k*N + N-1] + pSrcA[i*N + N-2]*pSrcB[k*N + N-2];
              pDstC[i*O +k] = sum1 + sum2 + sum3 + sum4 + remaining;
            }
          }
        } else if(mod == 1){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              int32_t sum3 = 0;
              int32_t sum4 = 0;
              for(j=0; j<N/4; j++){
                sum1 = sum1 + pSrcA[i*N + j*4]*pSrcB[k*N + j*4];
                sum2 = sum2 + pSrcA[i*N + j*4+1]*pSrcB[k*N + j*4+1];
                sum3 = sum3 + pSrcA[i*N + j*4+2]*pSrcB[k*N + j*4+2];
                sum4 = sum4 + pSrcA[i*N + j*4+3]*pSrcB[k*N + j*4+3];
              }
              pDstC[i*O +k] = sum1 + sum2 + sum3 + sum4 + pSrcA[i*N + N-1]*pSrcB[k*N + N-1];
            }
          }
        } else {
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              int32_t sum3 = 0;
              int32_t sum4 = 0;
              for(j=0; j<N/4; j++){
                sum1 = sum1 + pSrcA[i*N + j*4]*pSrcB[k*N + j*4];
                sum2 = sum2 + pSrcA[i*N + j*4+1]*pSrcB[k*N + j*4+1];
                sum3 = sum3 + pSrcA[i*N + j*4+2]*pSrcB[k*N + j*4+2];
                sum4 = sum4 + pSrcA[i*N + j*4+3]*pSrcB[k*N + j*4+3];
              }
              pDstC[i*O +k] = sum1 + sum2 + sum3 + sum4;
            }
          }
        }

}

#endif

// #undef BASIC_VERSION

/**
   @} end of BasicDotProdKernels group
*/

