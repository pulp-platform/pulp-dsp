#include "fma_fct32.h"
#include <stdio.h>

#define STEP_SIZE 2

// #define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_fma_i32s_rv32im(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i = 0; // loop counter
        uint32_t j = 0; // loop counter
        uint32_t k = 0; // loop counter

        for(i=0; i < M; i++){
          for(k=0; k < O; k++){
            int32_t sum = pDstC[i*O +k];
            for(j=0; j<N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[j*O+k];
            }
            pDstC[i*O +k] = sum;
          }
        }
}

#else

#define iStep 2
#define jStep 2
#define kStep 2

void plp_mat_fma_i32s_rv32im(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i = 0; // loop counter
        uint32_t j = 0; // loop counter
        uint32_t k = 0; // loop counter
        
        for(i=0; i < M/iStep; i++){
          for(k=0; k < O/kStep; k++){

            int32_t sum00 = pDstC[(i*iStep  )*O +(k*kStep  )];
            int32_t sum01 = pDstC[(i*iStep  )*O +(k*kStep+1)];
            int32_t sum10 = pDstC[(i*iStep+1)*O +(k*kStep  )];
            int32_t sum11 = pDstC[(i*iStep+1)*O +(k*kStep+1)];

            for(j=0; j<N/jStep; j++){
              int32_t AVal00 = pSrcA[(i*iStep  )*N + (j*jStep  )];
              int32_t AVal10 = pSrcA[(i*iStep+1)*N + (j*jStep  )];
              int32_t AVal01 = pSrcA[(i*iStep  )*N + (j*jStep+1)];
              int32_t AVal11 = pSrcA[(i*iStep+1)*N + (j*jStep+1)];
              int32_t BVal00 = pSrcB[(j*jStep  )*O + (k*kStep  )];
              int32_t BVal01 = pSrcB[(j*jStep  )*O + (k*kStep+1)];
              int32_t BVal10 = pSrcB[(j*jStep+1)*O + (k*kStep  )];
              int32_t BVal11 = pSrcB[(j*jStep+1)*O + (k*kStep+1)];

              sum00 = sum00 + AVal00*BVal00;
              sum00 = sum00 + AVal01*BVal10;
              sum01 = sum01 + AVal00*BVal01;
              sum01 = sum01 + AVal01*BVal11;
              sum10 = sum10 + AVal10*BVal00;
              sum10 = sum10 + AVal11*BVal10;
              sum11 = sum11 + AVal10*BVal01;
              sum11 = sum11 + AVal11*BVal11;             

            }
            pDstC[(i*iStep  )*O +(k*kStep  )] = sum00;
            pDstC[(i*iStep  )*O +(k*kStep+1)] = sum01;
            pDstC[(i*iStep+1)*O +(k*kStep  )] = sum10;
            pDstC[(i*iStep+1)*O +(k*kStep+1)] = sum11;
          }
        }

        // clean up code
        i = i*iStep;
        j = j*jStep;
        k = k*kStep;

        // clean up code
        //check if every index is nicely finished
        if(i == M && j == N && k == O){
          return;
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k;

          // clean up for j
          if(jEnd != N){
            for(i = 0; i < iEnd; i++){
              for(k = 0; k < kEnd; k++){
                int32_t sum = pDstC[i*O+k];
                for(j = jEnd; j < N; j++){
                  sum += sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O+k] += sum;
              }
            }
          }

          // clean up for k
          if(kEnd != O){
            for(i = 0; i < iEnd; i++){
              for(k = kEnd; k < O; k++){
                int32_t sum = 0;
                for(j=0; j<N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O + k] = sum;
              }
            }
          }

          // clean up for i
          for(i = iEnd; i < M; i++){
            for(k = 0; k < O; k++){
              int32_t sum = 0;
              for(j = 0; j < N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }
        }

}

#undef iStep
#undef jStep
#undef kStep

#endif