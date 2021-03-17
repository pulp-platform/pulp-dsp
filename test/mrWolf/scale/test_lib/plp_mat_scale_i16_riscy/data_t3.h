#ifndef __PULP_DSP_TEST__DATA_T3_H__
#define __PULP_DSP_TEST__DATA_T3_H__

// include the common header
#include "common.h"

int16_t* t3__pSrc;
RT_L2_DATA int16_t t3__pSrc__l2[26] = {
    -14010, -8686, 21879, 31273, -21888, -2069, -10073, 4329, -12486, -5462, 12000, 3555, -19087,
    3162, 18783, -24472, -28418, 12175, 10645, -13448, -2102, 22297, 1408, 20198, 31683, 28098
};
                
int16_t t3__scaleFactor = 1;

int32_t t3__shift = 7;

int16_t* t3__pDst;
RT_L2_DATA int16_t t3__pDst__l2[26] = {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
                
uint32_t t3__blockSize = 26;

RT_L2_DATA int16_t t3__pDst__reference[26] = {
    -110, -68, 170, 244, -171, -17, -79, 33, -98, -43, 93, 27, -150, 24, 146, -192, -223, 95, 83,
    -106, -17, 174, 11, 157, 247, 219
};


#endif//__PULP_DSP_TEST__DATA_T3_H__
