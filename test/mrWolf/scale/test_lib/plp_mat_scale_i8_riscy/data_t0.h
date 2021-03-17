#ifndef __PULP_DSP_TEST__DATA_T0_H__
#define __PULP_DSP_TEST__DATA_T0_H__

// include the common header
#include "common.h"

int8_t* t0__pSrc;
RT_L2_DATA int8_t t0__pSrc__l2[1] = {
    123
};
                
uint32_t t0__blockSize = 1;

int8_t t0__scaleFactor = -42;

int32_t t0__shift = 7;

int8_t* t0__pDst;
RT_L2_DATA int8_t t0__pDst__l2[1] = {
    0
};
                
RT_L2_DATA int8_t t0__pDst__reference[1] = {
    -41
};


#endif//__PULP_DSP_TEST__DATA_T0_H__
