#include "MFCC.h"

void MFCC_Processing(short int *InSignal, v2s * W_Frame, short int *Frame, short int *FEAT_LIST);
void MFCC_Processing_parallel(short int *InSignal, v2s * W_Frame, short int *Frame, short int *FEAT_LIST, unsigned short nPE);
