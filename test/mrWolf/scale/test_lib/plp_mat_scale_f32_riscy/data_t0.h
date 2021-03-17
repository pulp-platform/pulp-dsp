#ifndef __PULP_DSP_TEST__DATA_T0_H__
#define __PULP_DSP_TEST__DATA_T0_H__

// include the common header
#include "common.h"

float* t0__pSrc;
RT_L2_DATA uint32_t t0__pSrc__l2__int[1] = {
    0xbe9f8ee8
};

float* t0__pSrc__l2 = (float*)((void*)t0__pSrc__l2__int);
                
__u2f t0__scaleFactor = {.u = 0xbf1c025eU};

float* t0__pDst;
RT_L2_DATA uint32_t t0__pDst__l2__int[1] = {
    0x0
};

float* t0__pDst__l2 = (float*)((void*)t0__pDst__l2__int);
                
uint32_t t0__blockSize = 1;

RT_L2_DATA uint32_t t0__pDst__reference__int[1] = {
    0x3e42791e
};

float* t0__pDst__reference = (float*)((void*)t0__pDst__reference__int);


#endif//__PULP_DSP_TEST__DATA_T0_H__
