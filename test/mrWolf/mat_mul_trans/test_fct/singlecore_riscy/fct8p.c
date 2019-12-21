#include "fct8p.h"
#include <stdio.h>

// #define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_mult_i8vp_xpulpv2(void* args) {
        
        mat_mult_p_args* arguments = (mat_mult_p_args*) args;
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

void plp_mat_mult_i8vp_xpulpv2(void* args) {
        
        mat_mult_p_args* arguments = (mat_mult_p_args*) args;
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
