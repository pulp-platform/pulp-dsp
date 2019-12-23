#include "fct32.h"
#include <stdio.h>

// #define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_mult_i32s_xpulpv2(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
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

void plp_mat_mult_i32s_xpulpv2(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter
        uint32_t j; // loop counter
        uint32_t k; // loop counter

        if(N & 0x1){
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/2; j++){
                sum1 = sum1 + pSrcA[i*N + j*2]*pSrcB[k*N+j*2];
                sum2 = sum2 + pSrcA[i*N + j*2+1]*pSrcB[k*N+j*2+1];
              }
              pDstC[i*O +k] = sum1 + sum2 + pSrcA[i*N + j*2]*pSrcB[k*N+j*2];
            }
          }
        } else {
          for(i=0; i < M; i++){
            for(k=0; k < O; k++){
              int32_t sum1 = 0;
              int32_t sum2 = 0;
              for(j=0; j<N/2; j++){
                sum1 = sum1 + pSrcA[i*N + j*2]*pSrcB[k*N+j*2];
                sum2 = sum2 + pSrcA[i*N + j*2+1]*pSrcB[k*N+j*2+1];
              }
              pDstC[i*O +k] = sum1 + sum2;
            }
          }
        }
}

#endif
