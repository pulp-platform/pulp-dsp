#ifndef __PULP_DSP_TEST__DATA_T3_H__
#define __PULP_DSP_TEST__DATA_T3_H__

// include the common header
#include "common.h"

int8_t* t3__pSrc;
RT_L2_DATA int8_t t3__pSrc__l2[26] = {
    9, 69, 18, -72, 77, -71, -18, -93, 48, 112, 107, 118, -97, -124, 45, -94, -49, 88, 120, -27,
    -114, 118, 76, -52, -25, -39
};
                
uint32_t t3__blockSize = 26;

int8_t t3__scaleFactor = -123;

int32_t t3__shift = 7;

int8_t* t3__pDst;
RT_L2_DATA int8_t t3__pDst__l2[26] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int8_t t3__pDst__reference[26] = {
    -9, -67, -18, 69, -74, 68, 17, 89, -47, -108, -103, -114, 93, 119, -44, 90, 47, -85, -116, 25,
    109, -114, -74, 49, 24, 37
};


#endif//__PULP_DSP_TEST__DATA_T3_H__
