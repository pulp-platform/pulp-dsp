#include "MFCC_Processing.h"
#include "LUT.def"

#define Abs(a) (((a)<0)?(-a):(a))


void MFCC_Processing(short int *InSignal, v2s * W_Frame, short int *Frame, short int *FEAT_LIST)
{
    int i, j, k, Last;
    int FrameCount = 0;
    int FilterBanks = MFCC_BANK_CNT;
    short int lastsmp=0;
    int maxin;
    short int shift;

    for (i=0; i<FRAME_STEP*N_FRAME; i+=FRAME_STEP) {
#ifdef PRINTDEB
        DumpShortInt("Input", &InSignal[i], FRAME, FrameCount, Q15);
#endif
#ifdef PRINTINT
        printf("dump input %d\n",i);
        for (j=0; j<FRAME; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", InSignal[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif

        
        maxin=0;
        for (j=0;j<FRAME;j++) if (Abs(InSignal[i+j])>maxin) maxin=Abs(InSignal[i+j]);

        shift = __FL1(maxin);

        if (shift<=13) shift = (15-shift-2); else shift=0;

	lastsmp = (i==0)?0 : InSignal[i-1]<<shift;

#ifdef PRINTINT
        printf("shift %d max %x\n",shift,maxin);
#endif

        MFCC_PreEmphasis(InSignal+i , Frame, FRAME,lastsmp,shift);

	//for(int i = 0; i < FRAME; i++)
	//  printf("%hi ", Frame[i]);

#ifdef PRINTDEB
        DumpShortInt("Premphasis Output", Frame, FRAME, FrameCount, Q15+shift);
#endif

        MFCC_WindowedFrame(Frame, W_Frame, HammingLUT, FRAME, N_FFT);

#ifdef PRINTDEB
        DumpComplex("Windowed", W_Frame, N_FFT, FrameCount, 15+shift);
#endif

#ifdef PRINTINT
        printf("dump windowed %d\n",i);
        for (j=0; j<N_FFT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x %x ", W_Frame[j][0], W_Frame[j][1]);
            if (!((j+1)%10)) printf("\n");
        }
#endif

        Radix2FFT_DIF_args((short int*)W_Frame,  TwiddlesLUT, N_FFT);

        SwapSamples_args(W_Frame,SwapLUT,N_FFT);

#ifdef PRINTDEB
        DumpComplex("FFT", W_Frame, N_FFT, FrameCount, 7+shift);
#endif

        maxin=0;
        short int *W_FrameS=(short int*)W_Frame;

        for (j=0;j<N_FFT;j++) if (Abs(W_FrameS[j])>maxin) maxin=Abs(W_FrameS[j]);

        short int shift1 = __FL1(maxin);


        // 9.7
        MFCC_EstimatePowerInt(W_Frame, HALF_FFT, N_FFT);

        unsigned int* FramePower = ( unsigned int *) W_Frame;
#ifdef PRINTINT
        printf("dump power %d\n",i);
        for (j=0; j<N_FFT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", FramePower[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
#ifdef PRINTDEB
        //   Q18.14  * 1/512  => factor 1/(1<<19)
        DumpInt("Power", FramePower, HALF_FFT, FrameCount, 9 + 2*shift + 14);
#endif
        // compute energy
        int energy=0;
        for(j=0;j<HALF_FFT;j++) energy += FramePower[j];

#ifdef PRINTDEB_FLOAT
        printf("energy00 = %f %x log = %f\n",energy/(float)(1<<(14+9+2*shift)),energy,(log(energy/(float)(1<<(14+9+2*shift)))));
#endif

        // MFCC_Logfp(energy*(1<<(-2*shift + QN - 14 - 9)))
        energy = MFCC_Logfp(energy>>(2*shift)) + (QN-14-9)*GAPLOG2;



        unsigned int * MFCC_BASE = (unsigned int*) FramePower;
        MFCC_ComputeMFCCInt(FramePower, MFCC_BASE);


#ifdef PRINTINT
        printf("dump MFCC %d\n",i);
        for (j=0; j<MFCC_BANK_CNT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", MFCC_BASE[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
#ifdef PRINTDEB
        // coeff 6.10, data 18.14  * 1/512 => 26
        DumpInt_norm("Filtered power", MFCC_BASE, MFCC_BANK_CNT, FrameCount, 9+24+2*shift,MFCC_FilterBank  );
#endif

        // 8.24
        MFCC_ComputeLog(MFCC_BASE);

        for (j=0;j<MFCC_BANK_CNT;j++) {
            MFCC_BASE[j] -= 2*shift*GAPLOG2;
        }

#ifdef PRINTDEB
        DumpInt("LOG Filtered Power", MFCC_BASE, MFCC_BANK_CNT, FrameCount, QN);
#endif
        maxin=0;
        for (j=0;j<MFCC_BANK_CNT;j++)   if (Abs((int)MFCC_BASE[j])>maxin) maxin=Abs((int)MFCC_BASE[j]);
        shift = __FL1(maxin);


        //!!!!!!!!!!!!!!tocheck
        int rnd=0;
        if (shift<=15) shift=0; else shift = shift-14;
        if (shift) rnd = 1<<(shift-1);

        v2s * in_dct = (v2s *) MFCC_BASE;

        for (j=0;j<MFCC_BANK_CNT;j++) {
            // convert int to v2s with Im=0
            // scale/clip int 8.24 MFCC to short int 6.10 (no saturation!) and pad imaginary with 0
            in_dct[j] = (v2s) {(short int) (((int)MFCC_BASE[j] + rnd)  >> shift) , 0};

        }

        // pad with 0
        memset(in_dct+MFCC_BANK_CNT,0,(2*NDCT-MFCC_BANK_CNT)*sizeof(v2s));

        // in_dct 6.10
        //for (j=0;j<MFCC_BANK_CNT;j++) in_dct[j][0]=(short int) MFCC_BASE[j];
        //float out_dct_f[NDCT];
        //dct(in_dct,64,out_dct_f,10);
        //for(j=0;j<64;j++) printf("%d %f\n",j,out_dct_f[j]/(2.0*sqrt(2)));
#ifdef PRINTINT
        printf("dump input dct %d\n",i);
        for (j=0; j<2*NDCT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x %x ", in_dct[j][0],in_dct[j][1]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
        MFCC_ComputeDCT(in_dct, (v2s *)twidend,  (v2s *)TwiddlesLUT_128, SwapLUT_128);

        //for(j=0;j<64;j++) in_dct[j][0] = (short int) floor(out_dct_f[j] * (1<<6) + 0.5);


        // NORMDCT Q15
        in_dct[0][0] = (in_dct[0][0] * NORMDCT) >> 15;
        for(j=0;j<64;j++) in_dct[j][0] = (in_dct[j][0] * NORMDCT) >> 15;

        int *LIFTED = (int*) in_dct;

        for(j=0;j<NUMCEP;j++) LIFTED[j] = (int) in_dct[j][0];

#ifdef PRINTDEB
        DumpInt("DCT", LIFTED, MFCC_BANK_CNT, FrameCount, 6+(14-shift));
        //for (j=1; j<NUMCEP; j++) printf("lift coeff[%d] = %f\n",j,lift_coeff[j]/(float) (1<<11));
#endif
        //lifting coeff Q5.11 ([-10..12] MFCC 6+(14-shift)
        for (j=0; j<NUMCEP; j++) LIFTED[j] = (lift_coeff[j]*LIFTED[j]) >> (19-shift);

        // replace first coeff by log of frame energy (which is in QN)
        // energy is QN
        LIFTED[0] = energy>>(QN-12);

#ifdef PRINTDEB
        DumpInt("LIFTED", LIFTED, NUMCEP, FrameCount, 12);
#endif
#ifdef PRINTINT
        printf("dump lifted %d\n",i);
        for (j=0; j<NUMCEP; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", LIFTED[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
        // copy MFCC to feature list as short int 9.7 => 9.0
        for (j=0; j<NUMCEP; j++)
            FEAT_LIST[FrameCount*NUMCEP + j] = (short int) (LIFTED[j]>>(12));

        FrameCount++;
    }
}




void MFCC_Processing_parallel(short int *InSignal, v2s * W_Frame, short int *Frame, short int *FEAT_LIST, unsigned short nPE)
{
    int i, j, k, Last;
    int FrameCount = 0;
    int FilterBanks = MFCC_BANK_CNT;
    short int lastsmp=0;
    int maxin;
    short int shift;
    
    for (i=0; i<FRAME_STEP*N_FRAME; i+=FRAME_STEP) {
#ifdef PRINTDEB
        DumpShortInt("Input", &InSignal[i], FRAME, FrameCount, Q15);
#endif
#ifdef PRINTINT
        printf("dump input %d\n",i);
        for (j=0; j<FRAME; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", InSignal[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
        

        maxin=0;
        for (j=0;j<FRAME;j++) if (Abs(InSignal[i+j])>maxin) maxin=Abs(InSignal[i+j]);
        
        shift = __FL1(maxin);
        
        if (shift<=13) shift = (15-shift-2); else shift=0;

	lastsmp = (i==0)?0 : InSignal[i-1]<<shift;
        
#ifdef PRINTINT
        printf("shift %d max %x\n",shift,maxin);
#endif
        MFCC_PreEmphasis_instance S_PreEmphasis;
        
        S_PreEmphasis.Frame = InSignal+i;
        S_PreEmphasis.Out = Frame;
        S_PreEmphasis.FrameSize = FRAME;
        S_PreEmphasis.last_sample = lastsmp;
        S_PreEmphasis.shift = shift;
        S_PreEmphasis.nPE = nPE;
        
        rt_team_fork(nPE, MFCC_PreEmphasis_parallel, (void *)&S_PreEmphasis);

	//for(int i = 0; i < FRAME; i++)
	//printf("%hi ", Frame[i]);
        // MFCC_PreEmphasis(InSignal+i , Frame, FRAME,lastsmp,shift);
        
#ifdef PRINTDEB
        DumpShortInt("Premphasis Output", Frame, FRAME, FrameCount, Q15+shift);
#endif
        MFCC_WindowedFrame_instance S_WindowedFrame;

	S_WindowedFrame.Frame = Frame;
	S_WindowedFrame.OutFrame = W_Frame;
	S_WindowedFrame.Window = HammingLUT;
	S_WindowedFrame.FrameSize = FRAME;
	S_WindowedFrame.FFT_Dim = N_FFT;
	S_WindowedFrame.nPE = nPE;
	rt_team_fork(nPE, MFCC_WindowedFrame_parallel, (void *)&S_WindowedFrame);
        //MFCC_WindowedFrame(Frame, W_Frame, HammingLUT, FRAME, N_FFT);
	//for(int i = 0; i < N_FFT; i++)
	//  printf("%hi ", Frame[i]);
        
#ifdef PRINTDEB
        DumpComplex("Windowed", W_Frame, N_FFT, FrameCount, 15+shift);
#endif
        
#ifdef PRINTINT
        printf("dump windowed %d\n",i);
        for (j=0; j<N_FFT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x %x ", W_Frame[j][0], W_Frame[j][1]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
        
        Radix2FFT_DIF_args((short int*)W_Frame,  TwiddlesLUT, N_FFT);
        
        SwapSamples_args(W_Frame,SwapLUT,N_FFT);
        
#ifdef PRINTDEB
        DumpComplex("FFT", W_Frame, N_FFT, FrameCount, 7+shift);
#endif
        
        maxin=0;
        short int *W_FrameS=(short int*)W_Frame;
        
        for (j=0;j<N_FFT;j++) if (Abs(W_FrameS[j])>maxin) maxin=Abs(W_FrameS[j]);
        
        short int shift1 = __FL1(maxin);
        
        
        // 9.7
        MFCC_EstimatePowerInt(W_Frame, HALF_FFT, N_FFT);
        
        unsigned int* FramePower = ( unsigned int *) W_Frame;
#ifdef PRINTINT
        printf("dump power %d\n",i);
        for (j=0; j<N_FFT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", FramePower[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
#ifdef PRINTDEB
        //   Q18.14  * 1/512  => factor 1/(1<<19)
        DumpInt("Power", FramePower, HALF_FFT, FrameCount, 9 + 2*shift + 14);
#endif
        // compute energy
        int energy=0;
        for(j=0;j<HALF_FFT;j++) energy += FramePower[j];
        
#ifdef PRINTDEB_FLOAT
        printf("energy00 = %f %x log = %f\n",energy/(float)(1<<(14+9+2*shift)),energy,(log(energy/(float)(1<<(14+9+2*shift)))));
#endif
        
        // MFCC_Logfp(energy*(1<<(-2*shift + QN - 14 - 9)))
        energy = MFCC_Logfp(energy>>(2*shift)) + (QN-14-9)*GAPLOG2;
        
        
        
        unsigned int * MFCC_BASE = (unsigned int*) FramePower;
        MFCC_ComputeMFCCInt(FramePower, MFCC_BASE);
        
        
#ifdef PRINTINT
        printf("dump MFCC %d\n",i);
        for (j=0; j<MFCC_BANK_CNT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", MFCC_BASE[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
#ifdef PRINTDEB
        // coeff 6.10, data 18.14  * 1/512 => 26
        DumpInt_norm("Filtered power", MFCC_BASE, MFCC_BANK_CNT, FrameCount, 9+24+2*shift,MFCC_FilterBank  );
#endif
        
        // 8.24
        MFCC_ComputeLog(MFCC_BASE);
        
        for (j=0;j<MFCC_BANK_CNT;j++) {
            MFCC_BASE[j] -= 2*shift*GAPLOG2;
        }
        
#ifdef PRINTDEB
        DumpInt("LOG Filtered Power", MFCC_BASE, MFCC_BANK_CNT, FrameCount, QN);
#endif
        maxin=0;
        for (j=0;j<MFCC_BANK_CNT;j++)   if (Abs((int)MFCC_BASE[j])>maxin) maxin=Abs((int)MFCC_BASE[j]);
        shift = __FL1(maxin);
        
        
        //!!!!!!!!!!!!!!tocheck
        int rnd=0;
        if (shift<=15) shift=0; else shift = shift-14;
        if (shift) rnd = 1<<(shift-1);
        
        v2s * in_dct = (v2s *) MFCC_BASE;
        
        for (j=0;j<MFCC_BANK_CNT;j++) {
            // convert int to v2s with Im=0
            // scale/clip int 8.24 MFCC to short int 6.10 (no saturation!) and pad imaginary with 0
            in_dct[j] = (v2s) {(short int) (((int)MFCC_BASE[j] + rnd)  >> shift) , 0};
            
        }
        
        // pad with 0
        memset(in_dct+MFCC_BANK_CNT,0,(2*NDCT-MFCC_BANK_CNT)*sizeof(v2s));
        
        // in_dct 6.10
        //for (j=0;j<MFCC_BANK_CNT;j++) in_dct[j][0]=(short int) MFCC_BASE[j];
        //float out_dct_f[NDCT];
        //dct(in_dct,64,out_dct_f,10);
        //for(j=0;j<64;j++) printf("%d %f\n",j,out_dct_f[j]/(2.0*sqrt(2)));
#ifdef PRINTINT
        printf("dump input dct %d\n",i);
        for (j=0; j<2*NDCT; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x %x ", in_dct[j][0],in_dct[j][1]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
        MFCC_ComputeDCT(in_dct, (v2s *)twidend,  (v2s *)TwiddlesLUT_128, SwapLUT_128);
        
        //for(j=0;j<64;j++) in_dct[j][0] = (short int) floor(out_dct_f[j] * (1<<6) + 0.5);
        
        
        // NORMDCT Q15
        in_dct[0][0] = (in_dct[0][0] * NORMDCT) >> 15;
        for(j=0;j<64;j++) in_dct[j][0] = (in_dct[j][0] * NORMDCT) >> 15;
        
        int *LIFTED = (int*) in_dct;
        
        for(j=0;j<NUMCEP;j++) LIFTED[j] = (int) in_dct[j][0];
        
#ifdef PRINTDEB
        DumpInt("DCT", LIFTED, MFCC_BANK_CNT, FrameCount, 6+(14-shift));
        //for (j=1; j<NUMCEP; j++) printf("lift coeff[%d] = %f\n",j,lift_coeff[j]/(float) (1<<11));
#endif
        //lifting coeff Q5.11 ([-10..12] MFCC 6+(14-shift)
        for (j=0; j<NUMCEP; j++) LIFTED[j] = (lift_coeff[j]*LIFTED[j]) >> (19-shift);
        
        // replace first coeff by log of frame energy (which is in QN)
        // energy is QN
        LIFTED[0] = energy>>(QN-12);
        
#ifdef PRINTDEB
        DumpInt("LIFTED", LIFTED, NUMCEP, FrameCount, 12);
#endif
#ifdef PRINTINT
        printf("dump lifted %d\n",i);
        for (j=0; j<NUMCEP; j++) {
            if (!(j%10)) printf("%d == ",j);
            printf(" %x ", LIFTED[j]);
            if (!((j+1)%10)) printf("\n");
        }
#endif
        // copy MFCC to feature list as short int 9.7 => 9.0
        for (j=0; j<NUMCEP; j++)
            FEAT_LIST[FrameCount*NUMCEP + j] = (short int) (LIFTED[j]>>(12));
        
        FrameCount++;
    }
}
