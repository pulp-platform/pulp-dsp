#include "fct32p.h"
#include <stdio.h>
#include "rt/rt_api.h"

// #define BASIC_VERSION

#ifdef BASIC_VERSION

void plp_mat_mult_i32p_xpulpv2( void* args) {
        mat_mult_p_args* arguments = (mat_mult_p_args*) args;
        const int32_t * __restrict__ pSrcA = arguments->pSrcA;
        const int32_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O

        int core_id = rt_core_id();
        int step = (O-1+nPE)/nPE;
        uint32_t START = step*core_id;
        uint32_t END = (core_id != rt_nb_pe()-1) ? START+step : M;

        for(i=START; i < END; i++){
          for(k=0; k < M; k++){
            int32_t sum = 0;
            for(j=0; j < N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[k*N + j];
            }
            pDstC[i*O + k] = sum;
          }
        }

        rt_team_barrier();
}

#else 

void plp_mat_mult_i32p_xpulpv2( void* args) {
        mat_mult_p_args* arguments = (mat_mult_p_args*) args;
        const int32_t * __restrict__ pSrcA = arguments->pSrcA;
        const int32_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O

        int core_id = rt_core_id();
        int step = (O-1+nPE)/nPE;
        uint32_t START = step*core_id;
        uint32_t END = (core_id != rt_nb_pe()-1) ? START+step : M;

        if(N & 0x1){
          for(i=START; i < END; i++){
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
          for(i=START; i < END; i++){
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

        rt_team_barrier();
}

#endif
