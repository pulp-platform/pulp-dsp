#include "fct8.h"
#include <stdio.h>

// #define BLOCK_VERSION_BIG_4
#define BLOCK_VERSION_BIG
// #define BLOCK_VERSION

RT_CL_DATA static v4s mask0 = {0,1,4,5};
RT_CL_DATA static v4s mask1 = {2,3,6,7};
RT_CL_DATA static v4s mask2 = {0,2,4,6};
RT_CL_DATA static v4s mask3 = {1,3,5,7};

#if defined(BLOCK_VERSION_BIG_4)

void plp_mat_mult_i8v_xpulpv2(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i=0; // loop counter for M
        uint32_t j=0; // loop counter for N
        uint32_t k=0; // loop counter for O

        for(i=0; i < M/3; i++){
          for(k=0; k < O/4; k++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum03 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum12 = 0;
            int32_t sum13 = 0;
            int32_t sum20 = 0;
            int32_t sum21 = 0;
            int32_t sum22 = 0;
            int32_t sum23 = 0;

            // v2s* Bpoint = (v2s*) &(pSrcB[k]);

            for(j=0; j<N/4; j++){
              
              v4s aVec0 = *((v4s*)&(pSrcA[(i*3  )*N + (j*4  )]));
              v4s aVec1 = *((v4s*)&(pSrcA[(i*3+1)*N + (j*4  )]));
              v4s aVec2 = *((v4s*)&(pSrcA[(i*3+2)*N + (j*4  )]));

              v4s temp0 = *((v4s*)&(pSrcB[(j*4  )*O + (k*4  )]));
              v4s temp1 = *((v4s*)&(pSrcB[(j*4+1)*O + (k*4  )]));
              v4s temp2 = *((v4s*)&(pSrcB[(j*4+2)*O + (k*4  )]));
              v4s temp3 = *((v4s*)&(pSrcB[(j*4+3)*O + (k*4  )]));

              v4s temp4 = __builtin_shuffle(temp0,temp1,mask0); // 0,1,4,5
              v4s temp5 = __builtin_shuffle(temp2,temp3,mask0); // 8,9,12,13
              v4s temp6 = __builtin_shuffle(temp0,temp1,mask1); // 2,3,6,7
              v4s temp7 = __builtin_shuffle(temp2,temp3,mask1); // 3,7,11,15

              v4s bVec0 = __builtin_shuffle(temp4,temp5,mask2);
              v4s bVec1 = __builtin_shuffle(temp4,temp5,mask3);
              v4s bVec2 = __builtin_shuffle(temp6,temp7,mask2);
              v4s bVec3 = __builtin_shuffle(temp6,temp7,mask3);

              sum00 = __SUMDOTP4(aVec0,bVec0,sum00);
              sum01 = __SUMDOTP4(aVec0,bVec1,sum01);
              sum02 = __SUMDOTP4(aVec0,bVec2,sum02);
              sum03 = __SUMDOTP4(aVec0,bVec3,sum03);
              sum10 = __SUMDOTP4(aVec1,bVec0,sum10);
              sum11 = __SUMDOTP4(aVec1,bVec1,sum11);
              sum12 = __SUMDOTP4(aVec1,bVec2,sum12);
              sum13 = __SUMDOTP4(aVec1,bVec3,sum13);

              sum20 = __SUMDOTP4(aVec2,bVec0,sum20);
              sum21 = __SUMDOTP4(aVec2,bVec1,sum21);
              sum22 = __SUMDOTP4(aVec2,bVec2,sum22);
              sum23 = __SUMDOTP4(aVec2,bVec3,sum23);

            }

            pDstC[(i*3  )*O +(k*4  )] = sum00;
            pDstC[(i*3  )*O +(k*4+1)] = sum01;
            pDstC[(i*3  )*O +(k*4+2)] = sum02;
            pDstC[(i*3  )*O +(k*4+3)] = sum03;
            pDstC[(i*3+1)*O +(k*4  )] = sum10;
            pDstC[(i*3+1)*O +(k*4+1)] = sum11;
            pDstC[(i*3+1)*O +(k*4+2)] = sum12;
            pDstC[(i*3+1)*O +(k*4+3)] = sum13;
            pDstC[(i*3+2)*O +(k*4  )] = sum20;
            pDstC[(i*3+2)*O +(k*4+1)] = sum21;
            pDstC[(i*3+2)*O +(k*4+2)] = sum22;
            pDstC[(i*3+2)*O +(k*4+3)] = sum23;

          }
        }
                
        // clean up code
        i = i*3;
        j = j*4;
        k = k*4;
        //check if every index is nicely finished
        if(i == M && j == N && k == O){
          return;
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k;

          if(i == 0 || k == 0 || j == 0){
            for(; i < M; i++){
              for(; k < O; k++){
                int32_t sum = 0;
                for(; j<N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O + k] = sum;
              }
            }
          } else {
            // clean up for j
            if(jEnd != N){
              for(i = 0; i < iEnd; i++){
                for(k = 0; k < kEnd; k++){
                  int32_t sum = 0;
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
}

#elif defined(BLOCK_VERSION_BIG)

void plp_mat_mult_i8v_xpulpv2(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i=0; // loop counter for M
        uint32_t j=0; // loop counter for N
        uint32_t k=0; // loop counter for O
        
        for(i=0; i < M/2; i++){
          for(k=0; k < O/4; k++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum03 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum12 = 0;
            int32_t sum13 = 0;

            // v2s* Bpoint = (v2s*) &(pSrcB[k]);

            for(j=0; j<N/4; j++){
              
              v4s aVec0 = *((v4s*)&(pSrcA[(i*2  )*N + (j*4  )]));
              v4s aVec1 = *((v4s*)&(pSrcA[(i*2+1)*N + (j*4  )]));

              v4s temp0 = *((v4s*)&(pSrcB[(j*4  )*O + (k*4  )]));
              v4s temp1 = *((v4s*)&(pSrcB[(j*4+1)*O + (k*4  )]));
              v4s temp2 = *((v4s*)&(pSrcB[(j*4+2)*O + (k*4  )]));
              v4s temp3 = *((v4s*)&(pSrcB[(j*4+3)*O + (k*4  )]));

              v4s temp4 = __builtin_shuffle(temp0,temp1,mask0); // 0,1,4,5
              v4s temp5 = __builtin_shuffle(temp2,temp3,mask0); // 8,9,12,13
              v4s temp6 = __builtin_shuffle(temp0,temp1,mask1); // 2,3,6,7
              v4s temp7 = __builtin_shuffle(temp2,temp3,mask1); // 3,7,11,15

              v4s bVec0 = __builtin_shuffle(temp4,temp5,mask2); // 0,4,8,12
              v4s bVec1 = __builtin_shuffle(temp4,temp5,mask3); // 1,5,9,13
              v4s bVec2 = __builtin_shuffle(temp6,temp7,mask2); // 2,6,10,14
              v4s bVec3 = __builtin_shuffle(temp6,temp7,mask3); // 3,7,11,15

              sum00 = __SUMDOTP4(aVec0,bVec0,sum00);
              sum01 = __SUMDOTP4(aVec0,bVec1,sum01);
              sum02 = __SUMDOTP4(aVec0,bVec2,sum02);
              sum03 = __SUMDOTP4(aVec0,bVec3,sum03);
              sum10 = __SUMDOTP4(aVec1,bVec0,sum10);
              sum11 = __SUMDOTP4(aVec1,bVec1,sum11);
              sum12 = __SUMDOTP4(aVec1,bVec2,sum12);
              sum13 = __SUMDOTP4(aVec1,bVec3,sum13);

            }

            pDstC[(i*2  )*O +(k*4  )] = sum00;
            pDstC[(i*2  )*O +(k*4+1)] = sum01;
            pDstC[(i*2  )*O +(k*4+2)] = sum02;
            pDstC[(i*2  )*O +(k*4+3)] = sum03;
            pDstC[(i*2+1)*O +(k*4  )] = sum10;
            pDstC[(i*2+1)*O +(k*4+1)] = sum11;
            pDstC[(i*2+1)*O +(k*4+2)] = sum12;
            pDstC[(i*2+1)*O +(k*4+3)] = sum13;

          }
        }
                
        // clean up code
        i = i*2;
        j = j*4;
        k = k*4;
        //check if every index is nicely finished
        if(i == M && j == N && k == O){
          
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k;

          // clean up for j
          if(jEnd != N){
            for(i = 0; i < iEnd; i++){
              for(k = 0; k < kEnd; k++){
                int32_t sum = 0;
                for(j = jEnd; j < N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
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

#elif defined(BLOCK_VERSION)

void plp_mat_mult_i8v_xpulpv2(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O
        
        for(i=0; i < M/2; i++){
          for(k=0; k < O/2; k++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;

            // v2s* Bpoint = (v2s*) &(pSrcB[k]);

            for(j=0; j<N/4; j++){
              
              v4s aVec0 = *((v4s*)&(pSrcA[(i*2  )*N + (j*4  )]));
              v4s aVec1 = *((v4s*)&(pSrcA[(i*2+1)*N + (j*4  )]));

              int8_t BVal00 = pSrcB[(j*4  )*O+(k*2  )];
              int8_t BVal01 = pSrcB[(j*4  )*O+(k*2+1)];

              int8_t BVal10 = pSrcB[(j*4+1)*O+(k*2  )];
              int8_t BVal11 = pSrcB[(j*4+1)*O+(k*2+1)];

              int8_t BVal20 = pSrcB[(j*4+2)*O+(k*2  )];
              int8_t BVal21 = pSrcB[(j*4+2)*O+(k*2+1)];

              int8_t BVal30 = pSrcB[(j*4+3)*O+(k*2  )];
              int8_t BVal31 = pSrcB[(j*4+3)*O+(k*2+1)];

              v4s bVec0 = {BVal00, BVal10 ,BVal20 ,BVal30};
              v4s bVec1 = {BVal01, BVal11 ,BVal21 ,BVal31};

              sum00 = __SUMDOTP4(aVec0,bVec0,sum00);
              sum01 = __SUMDOTP4(aVec0,bVec1,sum01);
              sum10 = __SUMDOTP4(aVec1,bVec0,sum10);
              sum11 = __SUMDOTP4(aVec1,bVec1,sum11);

            }

            pDstC[(i*2  )*O +(k*2  )] = sum00;
            pDstC[(i*2  )*O +(k*2+1)] = sum01;
            pDstC[(i*2+1)*O +(k*2  )] = sum10;
            pDstC[(i*2+1)*O +(k*2+1)] = sum11;

          }
        }
                
        // clean up code
        i = i*2;
        j = j*4;
        k = k*2;
        //check if every index is nicely finished
        if(i == M && j == N && k == O){
          return;
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k;

          if(i == 0 || k == 0 || j == 0){
            for(; i < M; i++){
              for(; k < O; k++){
                int32_t sum = 0;
                for(; j<N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O + k] = sum;
              }
            }
          } else {
            // clean up for j
            if(jEnd != N){
              for(i = 0; i < iEnd; i++){
                for(k = 0; k < kEnd; k++){
                  int32_t sum = 0;
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
}

#else

void plp_mat_mult_i8v_xpulpv2(
                              const int8_t * __restrict__ pSrcA,
                              const int8_t * __restrict__ pSrcB,
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
              sum = sum + pSrcA[i*N + j]*pSrcB[j*O+k];
            }
            pDstC[i*O +k] = sum;
          }
        }
}

#endif
