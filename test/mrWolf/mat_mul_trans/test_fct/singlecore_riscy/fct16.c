#include "fct16.h"
#include <stdio.h>

// #define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_mult_i16v_xpulpv2(
                              const int16_t * __restrict__ pSrcA,
                              const int16_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter
        uint32_t j; // loop counter
        uint32_t k; // loop counter

        for(i=0; i < M; i++){
          for(k=0; k < O; k++){
            int32_t sum = 0;
            for(j=0; j<N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[k*N+j];
            }
            pDstC[i*O +k] = sum;
          }
        }
}

#else

void plp_mat_mult_i16v_xpulpv2(
                              const int16_t * __restrict__ pSrcA,
                              const int16_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter
        uint32_t j; // loop counter
        uint32_t k; // loop counter

        uint32_t mod = N & 0x3;

        if(mod == 3){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/4; j++){
                v2s aVec1 = *((v2s*)&(pSrcA[i*N + j*4]));
                v2s bVec1 = *((v2s*)&(pSrcB[k*N + j*4]));
                v2s aVec2 = *((v2s*)&(pSrcA[i*N + j*4+2]));
                v2s bVec2 = *((v2s*)&(pSrcB[k*N + j*4+2]));
                
                sum1 = __SUMDOTP2(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP2(aVec2, bVec2, sum2);
              }
              v2s aRem = *((v2s*)&(pSrcA[i*N + j*4]));
              v2s bRem = *((v2s*)&(pSrcB[k*N + j*4]));
              int32_t remainder = __SUMDOTP2(aRem,bRem,sum1) + pSrcA[i*N + j*4+2]*pSrcB[k*N + j*4+2];
              pDstC[i*O +k] = sum2 + remainder;
            }
          }
        } else if (mod == 2){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/4; j++){
                v2s aVec1 = *((v2s*)&(pSrcA[i*N + j*4]));
                v2s bVec1 = *((v2s*)&(pSrcB[k*N + j*4]));
                v2s aVec2 = *((v2s*)&(pSrcA[i*N + j*4+2]));
                v2s bVec2 = *((v2s*)&(pSrcB[k*N + j*4+2]));
                
                sum1 = __SUMDOTP2(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP2(aVec2, bVec2, sum2);
              }
              v2s aRem = *((v2s*)&(pSrcA[i*N + j*4]));
              v2s bRem = *((v2s*)&(pSrcB[k*N + j*4]));
              int32_t remainder = __SUMDOTP2(aRem,bRem,sum1);
              pDstC[i*O +k] = sum2 + remainder;
            }
          }
        } else if (mod == 1){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/4; j++){
                v2s aVec1 = *((v2s*)&(pSrcA[i*N + j*4]));
                v2s bVec1 = *((v2s*)&(pSrcB[k*N + j*4]));
                v2s aVec2 = *((v2s*)&(pSrcA[i*N + j*4+2]));
                v2s bVec2 = *((v2s*)&(pSrcB[k*N + j*4+2]));
                
                sum1 = __SUMDOTP2(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP2(aVec2, bVec2, sum2);
              }
              int32_t remainder = pSrcA[i*N + j*4]*pSrcB[k*N + j*4];
              pDstC[i*O +k] = sum1 + sum2 + remainder;
            }
          }
        } else {
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/4; j++){
                v2s aVec1 = *((v2s*)&(pSrcA[i*N + j*4]));
                v2s bVec1 = *((v2s*)&(pSrcB[k*N + j*4]));
                v2s aVec2 = *((v2s*)&(pSrcA[i*N + j*4+2]));
                v2s bVec2 = *((v2s*)&(pSrcB[k*N + j*4+2]));
                
                sum1 = __SUMDOTP2(aVec1, bVec1, sum1);
                sum2 = __SUMDOTP2(aVec2, bVec2, sum2);
              }
              pDstC[i*O +k] = sum1 + sum2;
            }
          }
        }
}

#endif
