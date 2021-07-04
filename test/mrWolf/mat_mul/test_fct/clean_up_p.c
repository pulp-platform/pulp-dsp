        
        // clean up code
        i = i*iSTEP;
        j = j*jSTEP;
        k = k*kSTEP;
        //check if every index is nicely finished
        if(i == M && j == N && k >= O){
          
        } else {
          uint32_t iEnd = i;
          uint32_t jEnd = j;
          uint32_t kEnd = k >= O ? O : k;

          // clean up for j
          if(jEnd != N){
            for(k = core_id*kSTEP; k < kEnd; k+=nPE*kSTEP){
              for(int step = 0; step < kSTEP; step++){
                for(i = 0; i < iEnd; i++){
                  int32_t sum = 0;
                  for(j = jEnd; j < N; j++){
                    sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k + step];
                  }
                  pDstC[i*O+k+step] += sum;
                }
              }
            }
          }

          // clean up for i
          if(iEnd != M){
            for(k = core_id*kSTEP; k < kEnd; k+=nPE*kSTEP){
              for(int step = 0; step < kSTEP; step++){
                for(i = iEnd; i < M; i++){
                  int32_t sum = 0;
                  for(j = 0; j < N; j++){
                    sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k + step];
                  }
                  pDstC[i*O + k + step] = sum;
                }
              }
            }
          }

          // clean up for k
          for(k = kEnd; k < O; k++){
            for(i = 0; i < M; i++){
              int32_t sum = 0;
              for(j=0; j<N; j++){
                sum = sum + pSrcA[i*N + j]*pSrcB[j*O + k];
              }
              pDstC[i*O + k] = sum;
            }
          }

        }

        hal_team_barrier();