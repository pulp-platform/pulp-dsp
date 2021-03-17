#ifndef __PULP_DSP_TEST__DATA_T1_H__
#define __PULP_DSP_TEST__DATA_T1_H__

// include the common header
#include "common.h"

int32_t* t1__pSrc;
RT_L2_DATA int32_t t1__pSrc__l2[24] = {
    -5815, 13067, 13764, -31150, 29658, 12867, -21816, 5411, 12893, 5255, -26167, -24351, 14175,
    26357, 11839, -5946, -2728, -21348, 7329, -15002, 1640, 32022, -19382, 25223
};
                
uint32_t t1__blockSize = 24;

int32_t t1__scaleFactor = -32;

int32_t t1__shift = 7;

int32_t* t1__pDst;
RT_L2_DATA int32_t t1__pDst__l2[24] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int32_t t1__pDst__reference[24] = {
    1453, -3267, -3441, 7787, -7415, -3217, 5454, -1353, -3224, -1314, 6541, 6087, -3544, -6590,
    -2960, 1486, 682, 5337, -1833, 3750, -410, -8006, 4845, -6306
};


#endif//__PULP_DSP_TEST__DATA_T1_H__
