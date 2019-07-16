#include "rt/rt_api.h"
#include "fct.h"

#define __CPLXMULS(x, y)            (v2s) {((signed short) ((((int) (x)[0]*(int) (y)[0]) - ((int) (x)[1]*(int) (y)[1]))>>15))>>1, ((signed short) ((((int) (x)[0]*(int) (y)[1]) + ((int) (x)[1]*(int) (y)[0]))>>15))>>1}
#define __CPLXMULSDIV2(x, y)            (__CPLXMULS(x, y)>>(v2s){1,1})

void Radix2FFT_DIF_args(int16_t *__restrict__ Data, int16_t *__restrict__ Twiddles, int32_t N_FFT)
{
    int32_t iLog2N  = __FL1(N_FFT2);
    uint32_t iCnt1, iCnt2, iCnt3,
    iQ,    iL,    iM,
    iA,    iB;
    v2s *CoeffV = (v2s *) Twiddles;
    v2s *DataV  = (v2s *) Data;
    iL = 1; // difference of consecutive twiddle factors
    iM = N_FFT2 / 2; // distance from first to second sample
    
    // loop over log2(N) stages
    for (iCnt1 = 0; iCnt1 < (iLog2N-1); iCnt1++) {
        iQ = 0; // Twiddle factor index
        
        // loop over N/2 Butterflies mechanisms
        for (iCnt2 = 0; iCnt2 < iM; iCnt2++) {
            v2s W = CoeffV[iQ];
            iA = iCnt2; // index of first input
            for (iCnt3 = 0; iCnt3 < iL; iCnt3++) {
                v2s Tmp;
                iB = iA + iM; // iB = 0 + N/2, index of second input
                Tmp = DataV[iA] - DataV[iB]; // Tmp = DataV[0] - DataV[/2], second temp output
                DataV[iA] = (DataV[iA] + DataV[iB]) >> (v2s) {FFT2_SCALEDOWN, FFT2_SCALEDOWN}; // DataV[0] = DataV[0] + DataV[N/2], first output
                DataV[iB] = (v2s) __CPLXMULSDIV2(Tmp, W); // DataV[N/2] = (DataV[0] - DataV[N/2])*W
                iA = iA + 2 * iM; // in order to load identical twiddle factor only once
            }
            iQ += iL;
        }
        iL <<= 1;
        iM >>= 1;
    }
    iA = 0;
    /* Last Layer: W = (1, 0) */
    for (iCnt3 = 0; iCnt3 < (N_FFT2>>1); iCnt3++) {
        v2s Tmp;
        iB = iA + 1;
        Tmp = DataV[iA] - DataV[iB];
        DataV[iA] = (DataV[iA] + DataV[iB]);
        DataV[iB] = Tmp;
        iA = iA + 2;
    }
}


/* Reorder from natural indexes to digitally-reversed one. Uses a pre computed LUT */
void SwapSamples_args(        v2s *__restrict__ Data,
                      int16_t *__restrict__ SwapTable ,
                      int32_t N_FFT)
{
    int i;
    
    for (i = 0; i < N_FFT; i++) {
        v2s S = Data[i];
        int32_t SwapIndex = SwapTable[i];
        //printf("%d swapindex %d S %d %d\n",i,SwapIndex,S[0],S[1]);
        if (i < SwapIndex) {
            Data[i] = Data[SwapIndex]; Data[SwapIndex] = S;
        }
    }
}
