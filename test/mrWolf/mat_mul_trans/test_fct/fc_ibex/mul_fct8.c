#include "mul_fct32.h"
#include <stdio.h>

// #define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_mult_i8s_rv32im(
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

void plp_mat_mult_i8s_rv32im(
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