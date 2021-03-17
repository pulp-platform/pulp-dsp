#ifndef __PULP_DSP_TEST__DATA_T1_H__
#define __PULP_DSP_TEST__DATA_T1_H__

// include the common header
#include "common.h"

int8_t* t1__pSrc;
RT_L2_DATA int8_t t1__pSrc__l2[24] = {
    -67, 79, 85, 97, 9, 27, 21, 11, -61, 6, -61, -109, 7, 77, 66, 103, -125, 36, -108, 43, 110, 124,
    -83, 120
};
                
uint32_t t1__blockSize = 24;

int8_t t1__scaleFactor = 94;

int32_t t1__shift = 7;

int8_t* t1__pDst;
RT_L2_DATA int8_t t1__pDst__l2[24] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int8_t t1__pDst__reference[24] = {
    -50, 58, 62, 71, 6, 19, 15, 8, -45, 4, -45, -81, 5, 56, 48, 75, -92, 26, -80, 31, 80, 91, -61,
    88
};


#endif//__PULP_DSP_TEST__DATA_T1_H__
