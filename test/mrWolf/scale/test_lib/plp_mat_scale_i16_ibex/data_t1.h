#ifndef __PULP_DSP_TEST__DATA_T1_H__
#define __PULP_DSP_TEST__DATA_T1_H__

// include the common header
#include "common.h"

RT_L2_DATA int16_t t1__pSrc[24] = {
    3543, 9878, 29771, -12305, 31406, -14016, 22385, 8669, 18950, -28093, -15028, 30790, 1476, 1780,
    22571, -14719, -18755, 18955, 17992, 27977, 14961, -5057, -16955, 28719
};

uint32_t t1__blockSize = 24;

int16_t t1__scaleFactor = -37;

int32_t t1__shift = 7;

RT_L2_DATA int16_t t1__pDst[24] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

RT_L2_DATA int16_t t1__pDst__reference[24] = {
    -1025, -2856, -8606, 3556, -9079, 4051, -6471, -2506, -5478, 8120, 4344, -8901, -427, -515,
    -6525, 4254, 5421, -5480, -5201, -8088, -4325, 1461, 4901, -8302
};


#endif//__PULP_DSP_TEST__DATA_T1_H__
