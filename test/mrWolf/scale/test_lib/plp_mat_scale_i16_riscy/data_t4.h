#ifndef __PULP_DSP_TEST__DATA_T4_H__
#define __PULP_DSP_TEST__DATA_T4_H__

// include the common header
#include "common.h"

int16_t* t4__pSrc;
RT_L2_DATA int16_t t4__pSrc__l2[27] = {
    720, 25636, -24549, -13234, 3354, -30935, 23796, -28334, -9900, -28482, -18655, -20928, -6568,
    18253, -5867, -23879, -13726, -16295, 19049, -20659, 32343, 15722, -1234, -17787, -21288, 11996,
    -13630
};
                
int16_t t4__scaleFactor = 58;

int32_t t4__shift = 7;

int16_t* t4__pDst;
RT_L2_DATA int16_t t4__pDst__l2[27] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
uint32_t t4__blockSize = 27;

RT_L2_DATA int16_t t4__pDst__reference[27] = {
    326, 11616, -11124, -5997, 1519, -14018, 10782, -12839, -4486, -12906, -8454, -9483, -2977,
    8270, -2659, -10821, -6220, -7384, 8631, -9362, 14655, 7124, -560, -8060, -9647, 5435, -6177
};


#endif//__PULP_DSP_TEST__DATA_T4_H__
