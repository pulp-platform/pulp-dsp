RT_L2_DATA int16_t pSrc[129] = {
    1434, -2345, -23394, -17960, 31594, -10280, 9354, -22791, -16343, 1060, -25846, -3011, 16955,
    -26421, 417, -2758, -23633, -1900, -18250, -18403, -13985, 18267, -12634, 16666, 4687, 24003, 6381,
    22394, -30535, -14441, -26403, -24737, -18811, -3888, -20010, -1917, 22235, 26559, 14449, 2175,
    -720, -26419, -29765, -23507, -11497, -21220, -17353, 884, -7844, 19613, -2607, -20841, -18494,
    3125, 9148, -20982, 20026, -22055, -1828, -2403, -18327, -27551, -16530, -23901, 12877, -21997,
    21513, -10210, -15419, -22086, -5291, 18977, 9841, 21763, -22349, -7679, -17494, 14319, 23902,
    -9744, -19695, 5203, -17751, 1318, 24586, -12716, 8653, 4227, -30609, -10703, -3605, -23747, 18511,
    -11599, -13133, 20878, -1095, 17872, 3944, -2199, -3943, 373, 7201, -14891, 14342, -25847, -7389,
    -29216, 9133, -22931, -30415, -2008, 588, -26422, 8208, -19537, 27305, -739, -13984, -18526, 5016,
    8100, -11457, 9785, 11060, 5810, -14631, -758, -11164
};

L2_DATA uint32_t blockSize = 129;

L2_DATA uint32_t deciPoint = 7;

RT_L2_DATA int32_t pRes[1] = {
    0
};

RT_L2_DATA int32_t pRes_reference[1] = {
    283295113
};

#define CHECK {\
    for (int i = 0; i < 1; i++) {\
        if (pRes[i] != pRes_reference[i]) {\
            passed=0;\
            printf("<Mismatch> pRes[%d]: acq=%d, exp=%d\n", i, pRes[i], pRes_reference[i]);\
        }\
    }\
}

#define FSIG {\
    plp_power_q16(pSrc, blockSize, deciPoint, pRes);\
}

#define BENCH {\
    rt_perf_t perf;\
    rt_perf_init(&perf);\
    int passed = do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);\
    printf("passed: %d\n", passed);\
    printf("cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));\
    printf("instructions: %d\n", rt_perf_read(RT_PERF_INSTR));\
    do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);\
    printf("load_stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));\
    do_bench(&perf, 1<<RT_PERF_IMISS, 0);\
    printf("icache_miss: %d\n", rt_perf_read(RT_PERF_IMISS));\
    do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);\
    printf("tcdm_cont: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));\
}\

#define ABS(x) (x > 0 ? x : -x)

