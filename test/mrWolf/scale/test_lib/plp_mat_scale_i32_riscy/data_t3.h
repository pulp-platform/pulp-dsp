#ifndef __PULP_DSP_TEST__DATA_T3_H__
#define __PULP_DSP_TEST__DATA_T3_H__

// include the common header
#include "common.h"

int32_t* t3__pSrc;
RT_L2_DATA int32_t t3__pSrc__l2[26] = {
    16833, -4988, 1837, -31204, 910, 20614, -7777, 14464, 21612, -18676, 32386, -1989, 20374, 11927,
    -10286, -21003, -9489, -300, 15735, 4609, 98, 2939, 9745, -1996, 22305, 2804
};
                
uint32_t t3__blockSize = 26;

int32_t t3__scaleFactor = 52;

int32_t t3__shift = 7;

int32_t* t3__pDst;
RT_L2_DATA int32_t t3__pDst__l2[26] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int32_t t3__pDst__reference[26] = {
    6838, -2027, 746, -12677, 369, 8374, -3160, 5876, 8779, -7588, 13156, -809, 8276, 4845, -4179,
    -8533, -3855, -122, 6392, 1872, 39, 1193, 3958, -811, 9061, 1139
};


#endif//__PULP_DSP_TEST__DATA_T3_H__
