#ifndef __PULP_DSP_TEST__DATA_T1_H__
#define __PULP_DSP_TEST__DATA_T1_H__

// include the common header
#include "common.h"

int16_t* t1__pSrc;
RT_L2_DATA int16_t t1__pSrc__l2[24] = {
    27913, -16551, -9383, -15947, 24248, -18244, -2183, 31236, 31800, -26671, 10871, -7495, 31576,
    25225, -14699, 29517, 15367, 23024, 8512, 22782, -19974, 24233, 19381, 12935
};
                
int16_t t1__scaleFactor = -49;

int32_t t1__shift = 7;

int16_t* t1__pDst;
RT_L2_DATA int16_t t1__pDst__l2[24] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
uint32_t t1__blockSize = 24;

RT_L2_DATA int16_t t1__pDst__reference[24] = {
    -10686, 6335, 3591, 6104, -9283, 6984, 835, -11958, -12174, 10209, -4162, 2869, -12088, -9657,
    5626, -11300, -5883, -8814, -3259, -8722, 7646, -9277, -7420, -4952
};


#endif//__PULP_DSP_TEST__DATA_T1_H__
