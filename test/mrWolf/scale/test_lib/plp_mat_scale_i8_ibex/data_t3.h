#ifndef __PULP_DSP_TEST__DATA_T3_H__
#define __PULP_DSP_TEST__DATA_T3_H__

// include the common header
#include "common.h"

RT_L2_DATA int8_t t3__pSrc[26] = {
    73, -92, -92, 22, 116, -116, -77, -10, -114, 0, -29, -50, -35, 11, -75, 65, -8, 91, -36, -89,
    -72, -13, 0, -100, 30, -11
};

uint32_t t3__blockSize = 26;

int8_t t3__scaleFactor = -66;

int32_t t3__shift = 7;

RT_L2_DATA int8_t t3__pDst[26] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

RT_L2_DATA int8_t t3__pDst__reference[26] = {
    -38, 47, 47, -12, -60, 59, 39, 5, 58, 0, 14, 25, 18, -6, 38, -34, 4, -47, 18, 45, 37, 6, 0, 51,
    -16, 5
};


#endif//__PULP_DSP_TEST__DATA_T3_H__
