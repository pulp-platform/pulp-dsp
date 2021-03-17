#ifndef __PULP_DSP_TEST__DATA_T2_H__
#define __PULP_DSP_TEST__DATA_T2_H__

// include the common header
#include "common.h"

RT_L2_DATA int8_t t2__pSrc[25] = {
    71, -83, -56, -75, 13, 88, 14, 124, -74, -116, -90, 87, 47, -120, 4, -12, -71, 74, 78, 67, -65,
    47, 93, 7, 63
};

uint32_t t2__blockSize = 25;

int8_t t2__scaleFactor = -50;

int32_t t2__shift = 7;

RT_L2_DATA int8_t t2__pDst[25] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

RT_L2_DATA int8_t t2__pDst__reference[25] = {
    -28, 32, 21, 29, -6, -35, -6, -49, 28, 45, 35, -34, -19, 46, -2, 4, 27, -29, -31, -27, 25, -19,
    -37, -3, -25
};


#endif//__PULP_DSP_TEST__DATA_T2_H__
