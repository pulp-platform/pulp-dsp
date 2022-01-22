#include "rtos_hal.h"

#define VLEN 6960

RT_CL_DATA int32_t a_cl[VLEN]; // you can also use RT_L1_DATA
RT_CL_DATA int32_t b_cl[VLEN];

// with RT_L1_BSS you can shorten the cluster initialization
