#ifndef __PULP_DSP_TEST__COMMON_H__
#define __PULP_DSP_TEST__COMMON_H__

typedef union {
    uint32_t u;
    float f;
} __u2f;

#define ABS(x) (x > 0 ? x : -x)

#endif//__PULP_DSP_TEST__COMMON_H__
