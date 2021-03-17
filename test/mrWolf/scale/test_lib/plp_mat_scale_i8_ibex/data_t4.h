#ifndef __PULP_DSP_TEST__DATA_T4_H__
#define __PULP_DSP_TEST__DATA_T4_H__

// include the common header
#include "common.h"

RT_L2_DATA int8_t t4__pSrc[27] = {
    13, 26, -29, -50, -6, 58, -28, -65, 88, 70, -125, -116, 116, -21, -119, -10, -57, 4, -122, -91,
    -9, 54, 51, -113, -11, -106, -127
};

uint32_t t4__blockSize = 27;

int8_t t4__scaleFactor = -54;

int32_t t4__shift = 7;

RT_L2_DATA int8_t t4__pDst[27] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

RT_L2_DATA int8_t t4__pDst__reference[27] = {
    -6, -11, 12, 21, 2, -25, 11, 27, -38, -30, 52, 48, -49, 8, 50, 4, 24, -2, 51, 38, 3, -23, -22,
    47, 4, 44, 53
};


#endif//__PULP_DSP_TEST__DATA_T4_H__
