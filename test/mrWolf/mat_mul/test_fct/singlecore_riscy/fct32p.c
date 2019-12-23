#include "fct32p.h"
#include <stdio.h>
#include "rt/rt_api.h"


// #define BETTER_BLOCK
#define BETTER_BLOCK_INTERLEAVED

#if defined(BETTER_BLOCK)

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
        uint32_t END = (core_id != rt_nb_pe()-1) ? START+step : O;

        // printf("core id: %i, start: %i, end: %i\n", core_id, START, END);

        for(k=START; k < END; k+=2){
          for(i=0; i < M/2; i++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;

            for(j=0; j<N; j++){
              int32_t AVal0 = pSrcA[i*2*N     + (j  )];
              int32_t AVal1 = pSrcA[i*2*N + N + (j  )];

              int32_t BVal0 = pSrcB[j*O + (k )];
              int32_t BVal1 = pSrcB[j*O + (k+1)];

              sum00 = sum00 + AVal0*BVal0;
              sum01 = sum01 + AVal0*BVal1;
              sum10 = sum10 + AVal1*BVal0;
              sum11 = sum11 + AVal1*BVal1;

            }
            
            pDstC[(i*2  )*O + k  ] = sum00;
            pDstC[(i*2  )*O + k+1] = sum01;
            pDstC[(i*2+1)*O + k  ] = sum10;
            pDstC[(i*2+1)*O + k+1] = sum11;
          }
        }

        // clean up code
        j = j;
        i = i*2;

        //check if every index is nicely finished
        if(i == M && j == N && k == END){
          
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k;

          // clean up for j
          if(jEnd != N){
            for(k = START; i < kEnd; k++){
              for(i = 0; i < iEnd; i++){
                int32_t sum = 0;
                for(j = jEnd; j < N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O+k] += sum;
              }
            }
          }
          // clean up for i
          for(k = START; k < kEnd; k++){
            for(i = iEnd; i < M; i++){
              int32_t sum = 0;
              for(j=0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }
          // clean up for i
          for(k = kEnd; k < END; k++){
            for(i = 0; i < M; i++){
              int32_t sum = 0;
              for(j = 0; j < N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }
        }

        rt_team_barrier();
}

#elif defined(BETTER_BLOCK_INTERLEAVED)

void plp_mat_mult_i32p_xpulpv2( void* args) {
        mat_mult_p_args* arguments = (mat_mult_p_args*) args;
        const int32_t * __restrict__ pSrcA = arguments->pSrcA;
        const int32_t * __restrict__ pSrcB = arguments->pSrcB;
        uint32_t M = arguments->M;
        uint32_t N = arguments->N;
        uint32_t O = arguments->O;
        uint32_t nPE = arguments->nPE;
        int32_t * __restrict__ pDstC = arguments->pDstC;
        
        uint32_t i=0; // loop counter for M
        uint32_t j=0; // loop counter for N
        uint32_t k=0; // loop counter for O

        int core_id = rt_core_id();

        // printf("core id: %i, start: %i, end: %i\n", core_id, START, END);

        for(k=core_id; k < O/2; k+=nPE){
          for(i=0; i < M/2; i++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;

            for(j=0; j<N; j++){
              int32_t AVal0 = pSrcA[i*2*N     + (j  )];
              int32_t AVal1 = pSrcA[i*2*N + N + (j  )];

              int32_t BVal0 = pSrcB[j*O + (k*2 )];
              int32_t BVal1 = pSrcB[j*O + (k*2+1)];

              sum00 = sum00 + AVal0*BVal0;
              sum01 = sum01 + AVal0*BVal1;
              sum10 = sum10 + AVal1*BVal0;
              sum11 = sum11 + AVal1*BVal1;

            }
            
            pDstC[(i*2  )*O + k*2  ] = sum00;
            pDstC[(i*2  )*O + k*2+1] = sum01;
            pDstC[(i*2+1)*O + k*2  ] = sum10;
            pDstC[(i*2+1)*O + k*2+1] = sum11;
          }
        }

                
        // clean up code
        i = i*2;
        j = j;
        k = k*2;
        //check if every index is nicely finished
        if(i == M && j == N && k >= O){
          
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k >= O ? O : k;

          // clean up for j
          if(jEnd != N){
            for(i = 0; i < iEnd; i++){
              for(k = 0; k < kEnd; k+=nPE){
                int32_t sum = 0;
                for(j = jEnd; j < N; j++){
                  sum += sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O+k] += sum;
              }
            }
          }

          // clean up for i
          if(iEnd != M){
            for(k = core_id; k < kEnd; k+=nPE){
              for(i = iEnd; i < M; i++){
                int32_t sum = 0;
                for(j = 0; j < N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O + k] = sum;
              }
            }
          }

          // clean up for k
          for(k = kEnd; k < O; k+= nPE){
            for(i = 0; i < M; i++){
              int32_t sum = 0;
              for(j=0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
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
        
        uint32_t i; // loop counter
        uint32_t j; // loop counter
        uint32_t k; // loop counter

        int core_id = rt_core_id();
        int step = (M-1+nPE)/nPE;
        uint32_t START = step*core_id;
        uint32_t END = (core_id != rt_nb_pe()-1) ? START+step : M;
        // printf("core id: %i, start: %i, end: %i\n", core_id, START, END);
        for(i=START; i < END; i++){
          for(k=0; k < O; k++){
            int32_t sum = 0;
            for(j=0; j<N; j++){
              sum = sum + pSrcA[i*N + j]*pSrcB[j*O+k];
            }
            pDstC[i*O +k] = sum;
          }
        }

        rt_team_barrier();
}

#endif
