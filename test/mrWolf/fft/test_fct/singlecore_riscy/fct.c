#include "rt/rt_api.h"
#include "fct.h"

void plp_cfft_i16(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, int32_t N_FFT)
{
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    v2s *CoeffV = (v2s *) Twiddles;
    v2s *DataV  = (v2s *) Data;
    iL = 1;
    iM = N_FFT / 2; 
    
    for (iCnt1 = 0; iCnt1 < (iLog2N-1); iCnt1++) {
        iQ = 0;
        
        for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
            v2s W = CoeffV[iQ];
            iA = iCnt2; 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                v2s Tmp;
                iB = iA + iM; 
                Tmp = DataV[iA] - DataV[iB];
		//v2s TmpiA = DataV[iA];
		//v2s TmpiB = DataV[iB];

                DataV[iA] = (DataV[iA] + DataV[iB]) /*>> (v2s) {1, 1}*/;
		//if((((int16_t *)&TmpiA)[0] < 0 && ((int16_t *)&TmpiB)[0] < 0 && ((int16_t *)&DataV[iA])[0] > 0) || (((int16_t *)&TmpiA)[0] > 0 && ((int16_t *)&TmpiB)[0] > 0 && ((int16_t *)&DataV[iA])[0] < 0)) {
		//printf("iA_r %hi, iA_i %hi, iB_r %hi, iB_i %hi, ", ((int16_t *)&TmpiA)[0], ((int16_t *)&TmpiA)[1], ((int16_t *)&TmpiB)[0], ((int16_t *)&TmpiB)[1]);
		//printf("iA_r + iB_r %hi, iA_i + iB_i %hi\n", ((int16_t *)&DataV[iA])[0], ((int16_t *)&DataV[iA])[1]);
		//}
		//if((((int16_t *)&TmpiA)[0] < 0 && ((int16_t *)&TmpiB)[0] > 0 && ((int16_t *)&Tmp)[0] > 0) || (((int16_t *)&TmpiA)[0] > 0 && ((int16_t *)&TmpiB)[0] < 0 && ((int16_t *)&Tmp)[0] < 0)) {
		//printf("iA_r %hi, iA_i %hi, iB_r %hi, iB_i %hi, ", ((int16_t *)&TmpiA)[0], ((int16_t *)&TmpiA)[1], ((int16_t *)&TmpiB)[0], ((int16_t *)&TmpiB)[1]);
		//printf("iA_r - iB_r %hi, iA_i - iB_i %hi\n", ((int16_t *)&Tmp)[0], ((int16_t *)&Tmp)[1]);
		//}
                DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>15)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>15))} /*>> (v2s) {1, 1}*/; 
                iA = iA + 2 * iM;
            }
            iQ += iL;
        }
        iL <<= 1;
        iM >>= 1;
    }
    iA = 0;
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3++) {
        v2s Tmp;
        iB = iA + 1;
        Tmp = DataV[iA] - DataV[iB];
        DataV[iA] = (DataV[iA] + DataV[iB]);
        DataV[iB] = Tmp;
        iA = iA + 2;
    }

}

void plp_cfft_i16_parallel(void * S)
{
    int16_t *__restrict__ Data = (int16_t*)(((plp_cfft_instance_i16 *)S)->Data);
    int16_t *__restrict__ Twiddles = (int16_t*)(((plp_cfft_instance_i16 *)S)->Twiddles);
    int32_t N_FFT = (int32_t)(((plp_cfft_instance_i16 *)S)->N_FFT);
    uint32_t nPE = (uint32_t)(((plp_cfft_instance_i16 *)S)->nPE);
  
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iLog2nPE = __FL1(nPE);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    v2s *CoeffV = (v2s *) Twiddles;
    v2s *DataV  = (v2s *) Data;
    iL = 1;         // how many blocks of butterflies
    iM = N_FFT / 2; // height of butterfly, unaffected by parallelization
    
    for (iCnt1 = 0; iCnt1 < iLog2N - iLog2nPE; iCnt1++) {
        iQ = iL * rt_core_id();       
        for (iCnt2 = 0; iCnt2 < iM; iCnt2+=nPE) {
            v2s W = CoeffV[iQ];
            iA = iCnt2 + rt_core_id(); 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                v2s Tmp;
                iB = iA + iM; 
                Tmp = DataV[iA] - DataV[iB]; 
                DataV[iA] = (DataV[iA] + DataV[iB]); 
                DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>15)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>15))}; 
                iA = iA + 2 * iM;
            }
            iQ += iL * nPE;
        }
        iL <<= 1;
        iM >>= 1;
	
	rt_team_barrier();
    }

    for (iCnt1 = iLog2N - iLog2nPE; iCnt1 < (iLog2N-1); iCnt1++) {
	for(iCnt2 = 0; iCnt2 < iL; iCnt2+=nPE) {
	  iQ = 0;
	  iA = (iCnt2 + rt_core_id()) * 2 * iM;
	  for(iCnt3 = 0; iCnt3 < iM; iCnt3++) {
	    v2s Tmp, W = CoeffV[iQ];
	    iB = iA + iM;
	    Tmp = DataV[iA] - DataV[iB]; 
            DataV[iA] = (DataV[iA] + DataV[iB]); 
            DataV[iB] = (v2s) {((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[0]) - ((int32_t) (Tmp)[1]*(int32_t) (W)[1]))>>15)), ((int16_t) ((((int32_t) (Tmp)[0]*(int32_t) (W)[1]) + ((int) (Tmp)[1]*(int32_t) (W)[0]))>>15))};
	    iA += 1;
	    iQ += iL;
	  }
	}
        iL <<= 1;
        iM >>= 1;

	rt_team_barrier();
    }
    
    iA = rt_core_id() * 2;
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3+=nPE) {
        v2s Tmp;
        iB = iA + 1;
        Tmp = DataV[iA] - DataV[iB];
        DataV[iA] = (DataV[iA] + DataV[iB]);
        DataV[iB] = Tmp;
        iA = iA + 2 * nPE;
    }

}

/* void plp_cfft_i16_cplx(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, int32_t N_FFT) */
/* { */
/*     uint32_t iLog2N  = __FL1(N_FFT); */
/*     uint32_t iCnt1, iCnt2, iCnt3, */
/*     iQ,    iL,    iM, */
/*     iA,    iB; */
/*     v2s *CoeffV = (v2s *) Twiddles; */
/*     v2s *DataV  = (v2s *) Data; */
/*     iL = 1; */
/*     iM = N_FFT / 2;  */
    
/*     for (iCnt1 = 0; iCnt1 < (iLog2N-1); iCnt1++) { */
/*         iQ = 0; */
        
/*         for (iCnt2 = 0; iCnt2 < iM; iCnt2++) { */
/*             v2s W = CoeffV[iQ]; */
/*             iA = iCnt2;  */
/*             for (iCnt3 = 0; iCnt3 < iL; iCnt3++) { */
/*                 v2s Tmp; */
/*                 iB = iA + iM;  */
/*                 Tmp = DataV[iA] - DataV[iB];  */
/*                 DataV[iA] = (DataV[iA] + DataV[iB]);  */
/*                 DataV[iB] = __CPLXMULS(Tmp, W);  */
/*                 iA = iA + 2 * iM; */
/*             } */
/*             iQ += iL; */
/*         } */
/*         iL <<= 1; */
/*         iM >>= 1; */
/*     } */
/*     iA = 0; */
/*     /\* Last Layer: W = (1, 0) *\/ */
/*     for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3++) { */
/*         v2s Tmp; */
/*         iB = iA + 1; */
/*         Tmp = DataV[iA] - DataV[iB]; */
/*         DataV[iA] = (DataV[iA] + DataV[iB]); */
/*         DataV[iB] = Tmp; */
/*         iA = iA + 2; */
/*     } */

/* } */


void plp_cfft_i32(int32_t *__restrict__ Data, int32_t *__restrict__ Twiddles, int32_t N_FFT)
{
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    int32_t *CoeffV = Twiddles;
    int32_t *DataV  = Data;
    iL = 1;
    iM = N_FFT / 2; 
   
    for (iCnt1 = 0; iCnt1 < (iLog2N-1); iCnt1++) {
        iQ = 0;
        for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
	    int32_t  W[2] = {CoeffV[iQ], CoeffV[iQ+1]};
            iA = iCnt2 * 2;
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                int32_t Tmp[2];
                iB = iA + 2 * iM;
                Tmp[0] = DataV[iA] - DataV[iB];
		Tmp[1] = DataV[iA+1] - DataV[iB+1];
                DataV[iA] = (DataV[iA] + DataV[iB]);
		DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
                DataV[iB] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[0] - (int64_t)(Tmp)[1]*(int64_t)(W)[1])>>31);
		DataV[iB+1] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[1] + (int64_t)(Tmp)[1]*(int64_t)(W)[0])>>31);
                iA = iA + 4 * iM;
            }
            iQ += 2 * iL;
        }
        iL <<= 1;
        iM >>= 1;
    }
    iA = 0;
    
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3++) {
        int32_t Tmp[2];
        iB = iA + 2;
        Tmp[0] = DataV[iA] - DataV[iB];
	Tmp[1] = DataV[iA+1] - DataV[iB+1];
        DataV[iA] = (DataV[iA] + DataV[iB]);
	DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
        DataV[iB] = Tmp[0];
	DataV[iB+1] = Tmp[1];
        iA = iA + 4;
    }
}

void plp_cfft_i32_parallel(void * S)
{
    int32_t *__restrict__ Data = (int32_t*)(((plp_cfft_instance_i32 *)S)->Data);
    int32_t *__restrict__ Twiddles = (int32_t*)(((plp_cfft_instance_i32 *)S)->Twiddles);
    int32_t N_FFT = (int32_t)(((plp_cfft_instance_i32 *)S)->N_FFT);
    uint32_t nPE = (uint32_t)(((plp_cfft_instance_i32 *)S)->nPE);
  
    uint32_t iLog2N  = __FL1(N_FFT);
    uint32_t iLog2nPE = __FL1(nPE);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    int32_t *CoeffV = Twiddles;
    int32_t *DataV  = Data;
    iL = 1;         // how many blocks of butterflies
    iM = N_FFT / 2; // height of butterfly, unaffected by parallelization
    
    for (iCnt1 = 0; iCnt1 < iLog2N - iLog2nPE; iCnt1++) {
        iQ = iL * rt_core_id() * 2;       
        for (iCnt2 = 0; iCnt2 < iM; iCnt2+=nPE) {
	    int32_t W[2] = {CoeffV[iQ], CoeffV[iQ+1]};
            iA = (iCnt2 + rt_core_id()) * 2; 
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                int32_t Tmp[2];
                iB = iA + 2 * iM; 
                Tmp[0] = DataV[iA] - DataV[iB];
		Tmp[1] = DataV[iA+1] - DataV[iB+1];
                DataV[iA] = (DataV[iA] + DataV[iB]);
		DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
                DataV[iB] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[0] - (int64_t)(Tmp)[1]*(int64_t)(W)[1])>>31);
		DataV[iB+1] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[1] + (int64_t)(Tmp)[1]*(int64_t)(W)[0])>>31);
                iA = iA + 4 * iM;
            }
            iQ += 2 * iL * nPE;
        }
        iL <<= 1;
        iM >>= 1;
	
	rt_team_barrier();
    }

    for (iCnt1 = iLog2N - iLog2nPE; iCnt1 < (iLog2N-1); iCnt1++) {
	for(iCnt2 = 0; iCnt2 < iL; iCnt2+=nPE) {
	  iQ = 0;
	  iA = (iCnt2 + rt_core_id()) * 4 * iM;
	  for(iCnt3 = 0; iCnt3 < iM; iCnt3++) {
	    int32_t Tmp[2], W[2] = {CoeffV[iQ], CoeffV[iQ+1]};
	    iB = iA + 2 * iM;
	    Tmp[0] = DataV[iA] - DataV[iB];
	    Tmp[1] = DataV[iA+1] - DataV[iB+1];
	    DataV[iA] = (DataV[iA] + DataV[iB]);
	    DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
	    DataV[iB] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[0] - (int64_t)(Tmp)[1]*(int64_t)(W)[1])>>31);
	    DataV[iB+1] = (int32_t)(((int64_t)(Tmp)[0]*(int64_t)(W)[1] + (int64_t)(Tmp)[1]*(int64_t)(W)[0])>>31);
	    iA += 2;
	    iQ += 2 * iL;
	  }
	}
        iL <<= 1;
        iM >>= 1;

	rt_team_barrier();
    }
    
    iA = rt_core_id() * 4;
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT>>1); iCnt3+=nPE) {
        int32_t Tmp[2];
        iB = iA + 2;
        Tmp[0] = DataV[iA] - DataV[iB];
	Tmp[1] = DataV[iA+1] - DataV[iB+1];
        DataV[iA] = (DataV[iA] + DataV[iB]);
	DataV[iA+1] = (DataV[iA+1] + DataV[iB+1]);
        DataV[iB] = Tmp[0];
	DataV[iB+1] = Tmp[1];
        iA = iA + 4 * nPE;
    }
}


/* Reorder from natural indexes to digitally-reversed one. Uses a pre computed LUT */
void SwapSamples_i16(int16_t *__restrict__ Data,
                     int16_t *__restrict__ SwapTable ,
                     int32_t N_FFT)
{

  v2s * DataV = (v2s *) Data;
  
  for (int32_t i = 0; i < N_FFT; i++) {
    v2s S = DataV[i];
    int16_t SwapIndex = SwapTable[i];
    //printf("%d swapindex %d S %d %d\n",i,SwapIndex,S[0],S[1]);
    if (i < SwapIndex) {
      DataV[i] = DataV[SwapIndex]; DataV[SwapIndex] = S;
      }
  }
}

void SwapSamples_i32(int32_t *__restrict__ Data,
                     int16_t *__restrict__ SwapTable ,
                     int32_t N_FFT)
{
  
  for (int32_t i = 0; i < N_FFT; i++) {
    int16_t SwapIndex = SwapTable[i];
    //printf("%d swapindex %d S %d %d\n",i,SwapIndex,S[0],S[1]);
    if (i < SwapIndex) {
      int32_t Tmp[2] = {Data[2*i], Data[2*i+1]};
      Data[2*i] = Data[2*SwapIndex];
      Data[2*i+1] = Data[2*SwapIndex+1];
      Data[2*SwapIndex] = Tmp[0];
      Data[2*SwapIndex+1] = Tmp[1];
      }
  }
}
