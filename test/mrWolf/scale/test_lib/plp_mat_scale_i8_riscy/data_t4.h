#ifndef __PULP_DSP_TEST__DATA_T4_H__
#define __PULP_DSP_TEST__DATA_T4_H__

// include the common header
#include "common.h"

int8_t* t4__pSrc;
RT_L2_DATA int8_t t4__pSrc__l2[27] = {
    48, 12, 46, 12, -65, -70, -56, -125, 78, -16, 86, -44, 19, -112, 37, 35, -108, -30, 122, 11, 25,
    -96, 120, 6, -22, -32, 85
};
                
uint32_t t4__blockSize = 27;

int8_t t4__scaleFactor = 69;

int32_t t4__shift = 7;

int8_t* t4__pDst;
RT_L2_DATA int8_t t4__pDst__l2[27] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int8_t t4__pDst__reference[27] = {
    25, 6, 24, 6, -36, -38, -31, -68, 42, -9, 46, -24, 10, -61, 19, 18, -59, -17, 65, 5, 13, -52,
    64, 3, -12, -18, 45
};


#endif//__PULP_DSP_TEST__DATA_T4_H__
