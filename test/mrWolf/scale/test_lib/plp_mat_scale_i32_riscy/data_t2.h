#ifndef __PULP_DSP_TEST__DATA_T2_H__
#define __PULP_DSP_TEST__DATA_T2_H__

// include the common header
#include "common.h"

int32_t* t2__pSrc;
RT_L2_DATA int32_t t2__pSrc__l2[25] = {
    10643, 30715, 24743, -4600, -9721, 30998, 23164, 18365, -14821, 26848, -23505, 9150, -13452,
    22267, 11137, 19130, 3688, 32417, 30440, -18073, 24065, -8100, 15902, 5175, -11643
};
                
uint32_t t2__blockSize = 25;

int32_t t2__scaleFactor = -39;

int32_t t2__shift = 7;

int32_t* t2__pDst;
RT_L2_DATA int32_t t2__pDst__l2[25] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
RT_L2_DATA int32_t t2__pDst__reference[25] = {
    -3243, -9359, -7539, 1401, 2961, -9445, -7058, -5596, 4515, -8181, 7161, -2788, 4098, -6785,
    -3394, -5829, -1124, -9878, -9275, 5506, -7333, 2467, -4846, -1577, 3547
};


#endif//__PULP_DSP_TEST__DATA_T2_H__
