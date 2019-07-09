#include "fct.h"
#include <stdio.h>

#define STEP_SIZE 2

#define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_mult_i32s_rv32im(
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
            for(j=0; j < O; j++){
              int32_t sum = 0;
              for(k=0; k<N; k++){
                sum = sum + pSrcA[i*N + k]*pSrcB[k*O+j];
              }
              pDstC[i*O +j] = sum;
            }
          }
        }

}

#else

void plp_mat_mult_i32s_rv32im(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter
        uint32_t j; // loop counter
        uint32_t k; // loop counter
        for(i=0; i < M+1-STEP_SIZE; i+=STEP_SIZE){
          for(j=0; j < O+1-STEP_SIZE; j+=STEP_SIZE){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            for(k=0; k<N+1-STEP_SIZE; k+=STEP_SIZE){
              int32_t AVal00 = pSrcA[(i  )*N + (k  )];
              int32_t AVal01 = pSrcA[(i  )*N + (k+1)];
              int32_t AVal10 = pSrcA[(i+1)*N + (k  )];
              int32_t AVal11 = pSrcA[(i+1)*N + (k+1)];

              int32_t BVal00 = pSrcB[(k  )*O+(j  )];
              int32_t BVal01 = pSrcB[(k  )*O+(j+1)];
              int32_t BVal10 = pSrcB[(k+1)*O+(j  )];
              int32_t BVal11 = pSrcB[(k+1)*O+(j+1)];

              sum00 = sum00 + AVal00*BVal00;
              sum00 = sum00 + AVal01*BVal10;

              sum01 = sum01 + AVal00*BVal01;
              sum01 = sum01 + AVal01*BVal11;

              sum10 = sum10 + AVal10*BVal00;
              sum10 = sum10 + AVal11*BVal10;

              sum11 = sum11 + AVal10*BVal01;
              sum11 = sum11 + AVal11*BVal11;              

            }
            pDstC[(i  )*O +(j  )] = sum00;
            pDstC[(i  )*O +(j+1)] = sum01;
            pDstC[(i+1)*O +(j  )] = sum10;
            pDstC[(i+1)*O +(j+1)] = sum11;

            // int32_t sum1 = 0;
            // for(k=0; k < N; k++){
            //   int32_t AVal = pSrcA[i*N + k];
            //   int32_t BVal = pSrcB[k*O + j];
            //   sum1 = sum1 + AVal*BVal;
            // }
            // pDstC[i*O + j] = sum1;
          }
        }

        // clean up code
        //check if every index is nicely finished
        if(i == M && j == O && k == N){
          return;
        } else {
          i = i==M ? M-STEP_SIZE : i-STEP_SIZE;
          j = j==O ? O-STEP_SIZE : j-STEP_SIZE;
          k = k==N ? N-STEP_SIZE : k-STEP_SIZE;


          for(; i < M; i++){
            for(; j < O; j++){
              int32_t sum = 0;
              for(k; k<N; k++){
                sum = sum + pSrcA[i*N + k]*pSrcB[k*O+j];
              }
              pDstC[i*O +j] = sum;
            }
          }
        }

}

#endif