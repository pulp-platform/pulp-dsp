#ifndef __PULP_DSP_TEST__DATA_T1_H__
#define __PULP_DSP_TEST__DATA_T1_H__

// include the common header
#include "common.h"

RT_L2_DATA int32_t t1__pSrc[24] = {
    3176, 22118, -11092, -16735, -8805, 20243, -971, 31120, -25487, -15404, -16834, 2134, 9023,
    19431, -20718, 614, -21093, -1135, 14813, 26981, -10843, -14652, -790, 14920
};

uint32_t t1__blockSize = 24;

int32_t t1__scaleFactor = 80;

int32_t t1__shift = 7;

RT_L2_DATA int32_t t1__pDst[24] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

RT_L2_DATA int32_t t1__pDst__reference[24] = {
    1985, 13823, -6933, -10460, -5504, 12651, -607, 19450, -15930, -9628, -10522, 1333, 5639, 12144,
    -12949, 383, -13184, -710, 9258, 16863, -6777, -9158, -494, 9325
};


#endif//__PULP_DSP_TEST__DATA_T1_H__
