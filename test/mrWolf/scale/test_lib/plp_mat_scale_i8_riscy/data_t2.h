#ifndef __PULP_DSP_TEST__DATA_T2_H__
#define __PULP_DSP_TEST__DATA_T2_H__

// include the common header
#include "common.h"

int8_t* t2__pSrc;
RT_L2_DATA int8_t t2__pSrc__l2[25] = {
    -81, -102, 15, -3, 98, -65, -128, -122, 28, 12, -40, 124, -74, 20, -3, 108, 73, -37, -69, 63,
    -59, 64, 55, -113, -113
};
                
uint32_t t2__blockSize = 25;

int8_t t2__scaleFactor = 109;

int32_t t2__shift = 7;

int8_t* t2__pDst;
RT_L2_DATA int8_t t2__pDst__l2[25] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int8_t t2__pDst__reference[25] = {
    -69, -87, 12, -3, 83, -56, -109, -104, 23, 10, -35, 105, -64, 17, -3, 91, 62, -32, -59, 53, -51,
    54, 46, -97, -97
};


#endif//__PULP_DSP_TEST__DATA_T2_H__
