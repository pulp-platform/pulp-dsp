/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_mult_i8p_xpulpv2.c
 * Description:  parallel 8-bit integer matrix multiplication for XPULPV2
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
   @brief         Parallel matrix transposed matrix multiplication of a 8-bit integer matrices for XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_mult_instance_i8 struct initialized by plp_mat_mult_i8_parallel
   @return        none

   @par Exploiting SIMD instructions
   The 8 bit values are packed four each into 32 bit vectors and then the four dot products are performed on 32 bit vectors, with 32 bit accumulator.
*/

// define BASIC_VERSION // if used don't forget to also use the undefine at end of file

#ifdef BASIC_VERSION

void plp_mat_mult_trans_i8vp_xpulpv2(void* args) {
        
        plp_mat_mult_instance_i8* arguments = (plp_mat_mult_instance_i8*) args;
        const int8_t * __restrict__ pSrcA = arguments->pSrcA;
        const int8_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;

        uint32_t i=0; // loop counter for M
        uint32_t j=0; // loop counter for N
        uint32_t k=0; // loop counter for O
        
        uint32_t core_id = rt_core_id();
        int step = (O-1+nPE)/nPE;
        uint32_t START = step*core_id;
        uint32_t END = (core_id != rt_nb_pe()-1) ? START+step : M;

        for(i=START; i < END; i++){
          for(k=0; k < O; k++){
            int32_t sum = 0;
            for(j=0; j<N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[k*N+j];
            }
            pDstC[i*O +k] = sum;
          }
        }

        rt_team_barrier();
}

#else

void plp_mat_mult_trans_i8vp_xpulpv2(void* args) {
        
        plp_mat_mult_instance_i8* arguments = (plp_mat_mult_instance_i8*) args;
        const int8_t * __restrict__ pSrcA = arguments->pSrcA;
        const int8_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;

        uint32_t i=0; // loop counter for M
        uint32_t j=0; // loop counter for N
        uint32_t k=0; // loop counter for O
        
        uint32_t core_id = rt_core_id();
        int step = (O-1+nPE)/nPE;
        uint32_t START = step*core_id;
        uint32_t END = (core_id != rt_nb_pe()-1) ? START+step : M;

        uint32_t mod = N & 0x7;

        if(mod == 7){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              v4s aRem = *((v4s*)&(pSrcA[i*N + j*8]));
              v4s bRem = *((v4s*)&(pSrcB[k*N + j*8]));
              sum1 = __SUMDOTP4(aRem,bRem,sum1);
              sum1 += pSrcA[i*N+j*8+4]*pSrcB[k*N+j*8+4];
              sum1 += pSrcA[i*N+j*8+5]*pSrcB[k*N+j*8+5];
              sum1 += pSrcA[i*N+j*8+6]*pSrcB[k*N+j*8+6];
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else if(mod == 6){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              v4s aRem = *((v4s*)&(pSrcA[i*N + j*8]));
              v4s bRem = *((v4s*)&(pSrcB[k*N + j*8]));
              sum1 = __SUMDOTP4(aRem,bRem,sum1);
              sum1 += pSrcA[i*N+j*8+4]*pSrcB[k*N+j*8+4];
              sum1 += pSrcA[i*N+j*8+5]*pSrcB[k*N+j*8+5];
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else if(mod == 5){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              v4s aRem = *((v4s*)&(pSrcA[i*N + j*8]));
              v4s bRem = *((v4s*)&(pSrcB[k*N + j*8]));
              sum1 = __SUMDOTP4(aRem,bRem,sum1);
              sum1 += pSrcA[i*N+j*8+4]*pSrcB[k*N+j*8+4];
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else if(mod == 4){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              v4s aRem = *((v4s*)&(pSrcA[i*N + j*8]));
              v4s bRem = *((v4s*)&(pSrcB[k*N + j*8]));
              sum1 = __SUMDOTP4(aRem,bRem,sum1);
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else if(mod == 3){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              sum1 += pSrcA[i*N+j*8]*pSrcB[k*N+j*8];
              sum1 += pSrcA[i*N+j*8+1]*pSrcB[k*N+j*8+1];
              sum1 += pSrcA[i*N+j*8+2]*pSrcB[k*N+j*8+2];
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else if(mod == 2){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              sum1 += pSrcA[i*N+j*8]*pSrcB[k*N+j*8];
              sum1 += pSrcA[i*N+j*8+1]*pSrcB[k*N+j*8+1];
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else if(mod == 1){  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              sum1 += pSrcA[i*N+j*8]*pSrcB[k*N+j*8];
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        } else {  
          for(i=START; i < END; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/8; j++){
                v4s aVec1 = *((v4s*)&(pSrcA[i*N + j*8]));
                v4s bVec1 = *((v4s*)&(pSrcB[k*N + j*8]));
                v4s aVec2 = *((v4s*)&(pSrcA[i*N + j*8+4]));
                v4s bVec2 = *((v4s*)&(pSrcB[k*N + j*8+4]));
                
                sum1 = __SUMDOTP4(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP4(aVec2, bVec2, sum2);
              }
              pDstC[i*O +k] = sum1+sum2;
            }
          }
        }

      rt_team_barrier();
}

#endif

// undefine BASIC_VERSION
/**
   @} end of MatMultTransKernels group
*/
