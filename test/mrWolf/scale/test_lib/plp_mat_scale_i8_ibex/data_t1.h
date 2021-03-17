#ifndef __PULP_DSP_TEST__DATA_T1_H__
#define __PULP_DSP_TEST__DATA_T1_H__

// include the common header
#include "common.h"

RT_L2_DATA int8_t t1__pSrc[24] = {
    66, 7, 66, -36, -92, -43, -92, -27, 97, -115, -60, 36, 108, -36, -84, -62, -95, -34, -53, 74,
    110, 76, -82, -1
};

uint32_t t1__blockSize = 24;

int8_t t1__scaleFactor = 70;

int32_t t1__shift = 7;

RT_L2_DATA int8_t t1__pDst[24] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

RT_L2_DATA int8_t t1__pDst__reference[24] = {
    36, 3, 36, -20, -51, -24, -51, -15, 53, -63, -33, 19, 59, -20, -46, -34, -52, -19, -29, 40, 60,
    41, -45, -1
};


#endif//__PULP_DSP_TEST__DATA_T1_H__
