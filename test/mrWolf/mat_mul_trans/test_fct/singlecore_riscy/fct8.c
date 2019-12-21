#include "fct8.h"
#include <stdio.h>

// #define BASIC_VERSION

#ifdef BASIC_VERSION

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
              sum = sum + pSrcA[i*N + j]*pSrcB[k*N+j];
            }
            pDstC[i*O +k] = sum;
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

        uint32_t mod = N & 0x7;

        if(mod == 7){  
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
          for(i=0; i < M; i++){
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
}

#endif
