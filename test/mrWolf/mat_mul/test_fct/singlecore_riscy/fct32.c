#include "fct32.h"
#include <stdio.h>


// #define BLOCK_VERSION
#define BETTER_BLOCK
// #define ASM
// #define ADVANCED_ASM


#ifdef BLOCK_VERSION

#define STEP_SIZE 2 // do not change, only for readability

void plp_mat_mult_i32s_xpulpv2(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O

        for(i=0; i < M/STEP_SIZE; i++){
          for(k=0; k < O/STEP_SIZE; k++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;

            for(j=0; j<N/STEP_SIZE; j++){
              int32_t AVal00 = pSrcA[(i*2  )*N + (j*2  )];
              int32_t AVal01 = pSrcA[(i*2  )*N + (j*2+1)];
              int32_t AVal10 = pSrcA[(i*2+1)*N + (j*2  )];
              int32_t AVal11 = pSrcA[(i*2+1)*N + (j*2+1)];

              int32_t BVal00 = pSrcB[(j*2  )*O+(k*2  )];
              int32_t BVal01 = pSrcB[(j*2  )*O+(k*2+1)];
              int32_t BVal10 = pSrcB[(j*2+1)*O+(k*2  )];
              int32_t BVal11 = pSrcB[(j*2+1)*O+(k*2+1)];

              sum00 = sum00 + AVal00*BVal00;
              sum00 = sum00 + AVal01*BVal10;

              sum01 = sum01 + AVal00*BVal01;
              sum01 = sum01 + AVal01*BVal11;

              sum10 = sum10 + AVal10*BVal00;
              sum10 = sum10 + AVal11*BVal10;

              sum11 = sum11 + AVal10*BVal01;
              sum11 = sum11 + AVal11*BVal11;              

            }
            pDstC[(i*2  )*O +(k*2  )] = sum00;
            pDstC[(i*2  )*O +(k*2+1)] = sum01;
            pDstC[(i*2+1)*O +(k*2  )] = sum10;
            pDstC[(i*2+1)*O +(k*2+1)] = sum11;

          }
        }

        i = i*STEP_SIZE;
        j = j*STEP_SIZE;
        k = k*STEP_SIZE;

        // printf("i: %i, j: %i, k: %i\n", i,j,k);

        // clean up code
        //check if every index is nicely finished
        // clean up code
        //check if every index is nicely finished
        if(i == M && j == N && k == O){
          return;
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k;
          uint32_t iReset = i==M ? M-3 : i;
          uint32_t jReset = j==N ? N-STEP_SIZE : j;
          uint32_t kReset = k==O ? O-2 : k;

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
            for(i = 0; i < iEnd; i++){
              for(k = 0; k < kEnd; k++){
                int32_t sum = 0;
                for(j = jEnd; j < N; j++){
                  sum += sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O+k] += sum;
              }
            }
            // clean up for k
            for(i = 0; i < iEnd; i++){
              for(k = kEnd; k < O; k++){
                int32_t sum = 0;
                for(j=0; j<N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O + k] = sum;
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

#elif defined(BETTER_BLOCK)

void plp_mat_mult_i32s_xpulpv2(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
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

            for(j=0; j<N; j++){
              int32_t AVal0 = pSrcA[i*2*N     + (j  )];
              int32_t AVal1 = pSrcA[i*2*N + N + (j  )];

              int32_t BVal0 = pSrcB[j*O + (k*2  )];
              int32_t BVal1 = pSrcB[j*O + (k*2 +1)];

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
            for(i = 0; i < iEnd; i++){
              for(k = 0; k < kEnd; k++){
                int32_t sum = 0;
                for(j = jEnd; j < N; j++){
                  sum += sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O+k] += sum;
              }
            }
            // clean up for k
            for(i = 0; i < iEnd; i++){
              for(k = kEnd; k < O; k++){
                int32_t sum = 0;
                for(j=0; j<N; j++){
                  sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
                }
                pDstC[i*O + k] = sum;
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

#elif defined(ASM)

void plp_mat_mult_i32s_xpulpv2(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O

        uint32_t kLoop = O/3;
        uint32_t iLoop = M/3;

        for(i=0; i < iLoop; i++){
          uint32_t Oindex1 = i*3*O;
          uint32_t Oindex2 = Oindex1 + O;
          uint32_t Oindex3 = Oindex1 + 2*O;
          uint32_t Aindex1 = i*3*N;
          uint32_t Aindex2 = i*3*N + N;
          uint32_t Aindex3 = i*3*N + 2*N;
          for(k=0; k < kLoop; k++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum12 = 0;
            int32_t sum20 = 0;
            int32_t sum21 = 0;
            int32_t sum22 = 0;

            uint32_t Aindex1 = i*3*N;
            uint32_t Aindex2 = i*3*N + N;
            uint32_t Aindex3 = i*3*N + 2*N;

            int32_t* Bpoint = pSrcB + k*3;

            for(j=0; j<N; j++){
              int32_t AVal0 = pSrcA[Aindex1++];
              int32_t AVal1 = pSrcA[Aindex2++];
              int32_t AVal2 = pSrcA[Aindex3++];

              int32_t BVal0 = *(Bpoint);
              int32_t BVal1 = *(Bpoint+1);
              int32_t BVal2 = *(Bpoint+2);
              Bpoint += O;

              asm volatile(
                // code
                "p.mac %[sum00], %[AVal0], %[BVal0];"
                "p.mac %[sum01], %[AVal0], %[BVal1];"
                "p.mac %[sum02], %[AVal0], %[BVal2];"
                "p.mac %[sum10], %[AVal1], %[BVal0];"
                "p.mac %[sum11], %[AVal1], %[BVal1];"
                "p.mac %[sum12], %[AVal1], %[BVal2];"
                "p.mac %[sum20], %[AVal2], %[BVal0];"
                "p.mac %[sum21], %[AVal2], %[BVal1];"
                "p.mac %[sum22], %[AVal2], %[BVal2];"

                // output arguments, +r means kept in register and modified the previous value (meaning )
                : [sum00] "+r" (sum00), [sum01] "+r" (sum01), [sum02] "+r" (sum02),
                  [sum10] "+r" (sum10), [sum11] "+r" (sum11), [sum12] "+r" (sum12),
                  [sum20] "+r" (sum20), [sum21] "+r" (sum21), [sum22] "+r" (sum22),
                  [AVal0] "+r" (AVal0), [BVal0] "+r" (BVal0),
                  [AVal1] "+r" (AVal1), [BVal1] "+r" (BVal1),
                  [AVal2] "+r" (AVal2), [BVal2] "+r" (BVal2)
                :
              );
            }
            
            pDstC[Oindex1++] = sum00;
            pDstC[Oindex1++] = sum01;
            pDstC[Oindex1++] = sum02;
            pDstC[Oindex2++] = sum10;
            pDstC[Oindex2++] = sum11;
            pDstC[Oindex2++] = sum12;
            pDstC[Oindex3++] = sum20;
            pDstC[Oindex3++] = sum21;
            pDstC[Oindex3++] = sum22;

          }
        }

        k=k*3;
        i=i*3;

        // clean up code
        //check if every index is nicely finished
        if(i == M && k == O){
          return;
        } else {
          uint32_t resetI = i==M ? M-3 : i;
          uint32_t resetK = k==O ? O-3 : k;

          for(i=0; i < resetI; i++){
            for(k = resetK; k < O; k++){
              int32_t sum = 0;
              for(j = 0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }
          for(; i < M; i++){
            for(k = 0; k < O; k++){
              int32_t sum = 0;
              for(j = 0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }
        }

}

#elif defined(ADVANCED_ASM)

void plp_mat_mult_i32s_xpulpv2(
                              const int32_t * __restrict__ pSrcA,
                              const int32_t * __restrict__ pSrcB,
                              uint32_t M,
                              uint32_t N,
                              uint32_t O,
                              int32_t * __restrict__ pDstC) {
        
        uint32_t i; // loop counter for M
        uint32_t j; // loop counter for N
        uint32_t k; // loop counter for O

        uint32_t kLoop = O/3;
        uint32_t iLoop = M/3;

        for(i=0; i < iLoop; i++){
          uint32_t Oindex1 = i*3*O;
          uint32_t Oindex2 = Oindex1 + O;
          uint32_t Oindex3 = Oindex1 + 2*O;
          uint32_t Aindex1 = i*3*N;
          uint32_t Aindex2 = i*3*N + N;
          uint32_t Aindex3 = i*3*N + 2*N;
          for(k=0; k < kLoop; k++){

            int32_t sum00 = 0;
            int32_t sum01 = 0;
            int32_t sum02 = 0;
            int32_t sum10 = 0;
            int32_t sum11 = 0;
            int32_t sum12 = 0;
            int32_t sum20 = 0;
            int32_t sum21 = 0;
            int32_t sum22 = 0;

            uint32_t Aindex1 = i*3*N;
            uint32_t Aindex2 = i*3*N + N;
            uint32_t Aindex3 = i*3*N + 2*N;

            uint32_t O2 = O-2;
            uint32_t BCount = k;
            int32_t* Bpoint = pSrcB + k*3;

            for(j=0; j<N; j++){
              int32_t AVal0 = pSrcA[Aindex1++];
              int32_t AVal1 = pSrcA[Aindex2++];
              int32_t AVal2 = pSrcA[Aindex3++];

              // int32_t BVal0 = pSrcB[j*O + (3*k  )];
              // int32_t BVal1 = pSrcB[j*O + (3*k+1)];
              // int32_t BVal2 = pSrcB[j*O + (3*k+2)];

              // int32_t BVal0 = *(Bpoint++);
              // int32_t BVal1 = *(Bpoint++);
              // int32_t BVal2 = *(Bpoint);
              // Bpoint += O2;

              // int32_t BVal0 = *(Bpoint);
              // int32_t BVal1 = *(Bpoint+1);
              // int32_t BVal2 = *(Bpoint+2);
              Bpoint += O;

              asm volatile(
                // code
                // "p.lw t0, %[O](%[Bpoint]!);"
                // "lw t0, 0(%[Bpoint]);"
                // "p.lw t1, 4(%[Bpoint]);"
                // "lw t1, 4(%[Bpoint]);"
                // "p.lw t2, 8(%[Bpoint]);"
                // "lw t2, 8(%[Bpoint]);"
                // "p.mac %[sum00], %[AVal0], t0;"
                // "p.mac %[sum01], %[AVal0], t1;"
                // "p.mac %[sum02], %[AVal0], t2;"
                // "p.mac %[sum10], %[AVal1], t0;"
                // "p.mac %[sum11], %[AVal1], t1;"
                // "p.mac %[sum12], %[AVal1], t2;"
                // "p.mac %[sum20], %[AVal2], t0;"
                // "p.mac %[sum21], %[AVal2], t1;"
                // "p.mac %[sum22], %[AVal2], t2;"

                "p.mac %[sum00], %[AVal0], %[BVal0];"
                "p.mac %[sum01], %[AVal0], %[BVal1];"
                "p.mac %[sum02], %[AVal0], %[BVal2];"
                "p.mac %[sum10], %[AVal1], %[BVal0];"
                "p.mac %[sum11], %[AVal1], %[BVal1];"
                "p.mac %[sum12], %[AVal1], %[BVal2];"
                "p.mac %[sum20], %[AVal2], %[BVal0];"
                "p.mac %[sum21], %[AVal2], %[BVal1];"
                "p.mac %[sum22], %[AVal2], %[BVal2];"

                // output arguments, +r means kept in register and modified the previous value (meaning )
                : [sum00] "+r" (sum00), [sum01] "+r" (sum01), [sum02] "+r" (sum02),
                  [sum10] "+r" (sum10), [sum11] "+r" (sum11), [sum12] "+r" (sum12),
                  [sum20] "+r" (sum20), [sum21] "+r" (sum21), [sum22] "+r" (sum22),
                  [AVal0] "+r" (AVal0), [BVal0] "+r" (BVal0),
                  [AVal1] "+r" (AVal1), [BVal1] "+r" (BVal1),
                  [AVal2] "+r" (AVal2), [BVal2] "+r" (BVal2),
                  // [Bpoint] "+r" (Bpoint)
                // inputs
                // : [O2] "r" (O2)
                // : "t0", "t1", "t2"
              );

              // sum00 = sum00 + AVal0*BVal0;
              // sum01 = sum01 + AVal0*BVal1;
              // sum02 = sum02 + AVal0*BVal2;
              // sum10 = sum10 + AVal1*BVal0;
              // sum11 = sum11 + AVal1*BVal1;
              // sum12 = sum12 + AVal1*BVal2;
              // sum20 = sum20 + AVal2*BVal0;
              // sum21 = sum21 + AVal2*BVal1;
              // sum22 = sum22 + AVal2*BVal2;

            }
            
            pDstC[Oindex1++] = sum00;
            pDstC[Oindex1++] = sum01;
            pDstC[Oindex1++] = sum02;
            pDstC[Oindex2++] = sum10;
            pDstC[Oindex2++] = sum11;
            pDstC[Oindex2++] = sum12;
            pDstC[Oindex3++] = sum20;
            pDstC[Oindex3++] = sum21;
            pDstC[Oindex3++] = sum22;

          }
        }

        k=k*3;
        i=i*3;
        // printf("i: %i, j: %i, k: %i\n", i,j,k);

        // clean up code
        //check if every index is nicely finished
        if(i == M && k == O){
          return;
        } else {
          uint32_t resetI = i==M ? M-3 : i;
          uint32_t resetK = k==O ? O-3 : k;

          for(i=0; i < resetI; i++){
            for(k = resetK; k < O; k++){
              int32_t sum = 0;
              for(j = 0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }
          for(; i < M; i++){
            for(k = 0; k < O; k++){
              int32_t sum = 0;
              for(j = 0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
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
