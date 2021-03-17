#ifndef __PULP_DSP_TEST__DATA_T2_H__
#define __PULP_DSP_TEST__DATA_T2_H__

// include the common header
#include "common.h"

int16_t* t2__pSrc;
RT_L2_DATA int16_t t2__pSrc__l2[25] = {
    24215, -13033, -5442, -28822, 11311, -6424, 5474, -828, -14060, -31989, -6854, -15323, 29483,
    29856, 10514, 4858, -25420, 32597, 7054, 23322, 24733, -31143, -22748, 23513, -14276
};
                
int16_t t2__scaleFactor = -83;

int32_t t2__shift = 7;

int16_t* t2__pDst;
RT_L2_DATA int16_t t2__pDst__l2[25] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
uint32_t t2__blockSize = 25;

RT_L2_DATA int16_t t2__pDst__reference[25] = {
    -15702, 8451, 3528, 18689, -7335, 4165, -3550, 536, 9117, 20742, 4444, 9936, -19118, -19360,
    -6818, -3151, 16483, -21138, -4575, -15123, -16038, 20194, 14750, -15247, 9257
};


#endif//__PULP_DSP_TEST__DATA_T2_H__
