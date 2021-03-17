#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"

#include "common.h"
#include "data_t0.h"
#include "data_t1.h"
#include "data_t2.h"
#include "data_t3.h"
#include "data_t4.h"

static int t0__do_bench(rt_perf_t *perf, int events, int do_check) {
    // setup variables (like resetting InplaceArguments)


    // start the performance counters
    rt_perf_conf(perf, events);
    rt_perf_reset(perf);
    rt_perf_start(perf);

    // call the function-under-test
    plp_mat_scale_i16(t0__pSrc, t0__blockSize, t0__scaleFactor, t0__shift, t0__pDst);

    rt_perf_stop(perf);

    // check the result
    int passed = 1;
    if (do_check) {
        for (int i = 0; i < 1; i++) {
            if (t0__pDst__reference[i] != t0__pDst[i]) {
                passed = 0;
                printf("\n#@# mismatch pDst[%d]: acq=%d, exp=%d\n",
                       i, t0__pDst[i], t0__pDst__reference[i]);
            }
        }

    }
    return passed;
}

static int t1__do_bench(rt_perf_t *perf, int events, int do_check) {
    // setup variables (like resetting InplaceArguments)


    // start the performance counters
    rt_perf_conf(perf, events);
    rt_perf_reset(perf);
    rt_perf_start(perf);

    // call the function-under-test
    plp_mat_scale_i16(t1__pSrc, t1__blockSize, t1__scaleFactor, t1__shift, t1__pDst);

    rt_perf_stop(perf);

    // check the result
    int passed = 1;
    if (do_check) {
        for (int i = 0; i < 24; i++) {
            if (t1__pDst__reference[i] != t1__pDst[i]) {
                passed = 0;
                printf("\n#@# mismatch pDst[%d]: acq=%d, exp=%d\n",
                       i, t1__pDst[i], t1__pDst__reference[i]);
            }
        }

    }
    return passed;
}

static int t2__do_bench(rt_perf_t *perf, int events, int do_check) {
    // setup variables (like resetting InplaceArguments)


    // start the performance counters
    rt_perf_conf(perf, events);
    rt_perf_reset(perf);
    rt_perf_start(perf);

    // call the function-under-test
    plp_mat_scale_i16(t2__pSrc, t2__blockSize, t2__scaleFactor, t2__shift, t2__pDst);

    rt_perf_stop(perf);

    // check the result
    int passed = 1;
    if (do_check) {
        for (int i = 0; i < 25; i++) {
            if (t2__pDst__reference[i] != t2__pDst[i]) {
                passed = 0;
                printf("\n#@# mismatch pDst[%d]: acq=%d, exp=%d\n",
                       i, t2__pDst[i], t2__pDst__reference[i]);
            }
        }

    }
    return passed;
}

static int t3__do_bench(rt_perf_t *perf, int events, int do_check) {
    // setup variables (like resetting InplaceArguments)


    // start the performance counters
    rt_perf_conf(perf, events);
    rt_perf_reset(perf);
    rt_perf_start(perf);

    // call the function-under-test
    plp_mat_scale_i16(t3__pSrc, t3__blockSize, t3__scaleFactor, t3__shift, t3__pDst);

    rt_perf_stop(perf);

    // check the result
    int passed = 1;
    if (do_check) {
        for (int i = 0; i < 26; i++) {
            if (t3__pDst__reference[i] != t3__pDst[i]) {
                passed = 0;
                printf("\n#@# mismatch pDst[%d]: acq=%d, exp=%d\n",
                       i, t3__pDst[i], t3__pDst__reference[i]);
            }
        }

    }
    return passed;
}

static int t4__do_bench(rt_perf_t *perf, int events, int do_check) {
    // setup variables (like resetting InplaceArguments)


    // start the performance counters
    rt_perf_conf(perf, events);
    rt_perf_reset(perf);
    rt_perf_start(perf);

    // call the function-under-test
    plp_mat_scale_i16(t4__pSrc, t4__blockSize, t4__scaleFactor, t4__shift, t4__pDst);

    rt_perf_stop(perf);

    // check the result
    int passed = 1;
    if (do_check) {
        for (int i = 0; i < 27; i++) {
            if (t4__pDst__reference[i] != t4__pDst[i]) {
                passed = 0;
                printf("\n#@# mismatch pDst[%d]: acq=%d, exp=%d\n",
                       i, t4__pDst[i], t4__pDst__reference[i]);
            }
        }

    }
    return passed;
}


static void t0__run_test(void) {
    printf("\n#@# testcase 0 {\n");

    // setup the test
    rt_dma_copy_t copy;



    // setup performance counter
    rt_perf_t perf;
    rt_perf_init(&perf);

    // run 1: check result and get numebr of cycles / instructions
    int passed = t0__do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);
    printf("\n#@# passed: %d\n", passed);
    printf("#@# cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
    printf("#@# instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

    // run 2: count load stalls
    t0__do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);
    printf("\n#@# load_stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));

    // run 3: count instruction cache misses
    t0__do_bench(&perf, 1<<RT_PERF_IMISS, 0);
    printf("\n#@# icache_miss: %d\n", rt_perf_read(RT_PERF_IMISS));

    // run 4: count TCDM contentions
    printf("\n#@# output start\n");
    t0__do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);
    printf("\n#@# output end\n");
    printf("#@# tcdm_cont: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));

    // free up all memory


    printf("\n#@# }\n");
}

static void t1__run_test(void) {
    printf("\n#@# testcase 1 {\n");

    // setup the test
    rt_dma_copy_t copy;



    // setup performance counter
    rt_perf_t perf;
    rt_perf_init(&perf);

    // run 1: check result and get numebr of cycles / instructions
    int passed = t1__do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);
    printf("\n#@# passed: %d\n", passed);
    printf("#@# cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
    printf("#@# instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

    // run 2: count load stalls
    t1__do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);
    printf("\n#@# load_stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));

    // run 3: count instruction cache misses
    t1__do_bench(&perf, 1<<RT_PERF_IMISS, 0);
    printf("\n#@# icache_miss: %d\n", rt_perf_read(RT_PERF_IMISS));

    // run 4: count TCDM contentions
    printf("\n#@# output start\n");
    t1__do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);
    printf("\n#@# output end\n");
    printf("#@# tcdm_cont: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));

    // free up all memory


    printf("\n#@# }\n");
}

static void t2__run_test(void) {
    printf("\n#@# testcase 2 {\n");

    // setup the test
    rt_dma_copy_t copy;



    // setup performance counter
    rt_perf_t perf;
    rt_perf_init(&perf);

    // run 1: check result and get numebr of cycles / instructions
    int passed = t2__do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);
    printf("\n#@# passed: %d\n", passed);
    printf("#@# cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
    printf("#@# instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

    // run 2: count load stalls
    t2__do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);
    printf("\n#@# load_stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));

    // run 3: count instruction cache misses
    t2__do_bench(&perf, 1<<RT_PERF_IMISS, 0);
    printf("\n#@# icache_miss: %d\n", rt_perf_read(RT_PERF_IMISS));

    // run 4: count TCDM contentions
    printf("\n#@# output start\n");
    t2__do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);
    printf("\n#@# output end\n");
    printf("#@# tcdm_cont: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));

    // free up all memory


    printf("\n#@# }\n");
}

static void t3__run_test(void) {
    printf("\n#@# testcase 3 {\n");

    // setup the test
    rt_dma_copy_t copy;



    // setup performance counter
    rt_perf_t perf;
    rt_perf_init(&perf);

    // run 1: check result and get numebr of cycles / instructions
    int passed = t3__do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);
    printf("\n#@# passed: %d\n", passed);
    printf("#@# cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
    printf("#@# instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

    // run 2: count load stalls
    t3__do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);
    printf("\n#@# load_stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));

    // run 3: count instruction cache misses
    t3__do_bench(&perf, 1<<RT_PERF_IMISS, 0);
    printf("\n#@# icache_miss: %d\n", rt_perf_read(RT_PERF_IMISS));

    // run 4: count TCDM contentions
    printf("\n#@# output start\n");
    t3__do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);
    printf("\n#@# output end\n");
    printf("#@# tcdm_cont: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));

    // free up all memory


    printf("\n#@# }\n");
}

static void t4__run_test(void) {
    printf("\n#@# testcase 4 {\n");

    // setup the test
    rt_dma_copy_t copy;



    // setup performance counter
    rt_perf_t perf;
    rt_perf_init(&perf);

    // run 1: check result and get numebr of cycles / instructions
    int passed = t4__do_bench(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR), 1);
    printf("\n#@# passed: %d\n", passed);
    printf("#@# cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
    printf("#@# instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

    // run 2: count load stalls
    t4__do_bench(&perf, 1<<RT_PERF_LD_STALL, 0);
    printf("\n#@# load_stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));

    // run 3: count instruction cache misses
    t4__do_bench(&perf, 1<<RT_PERF_IMISS, 0);
    printf("\n#@# icache_miss: %d\n", rt_perf_read(RT_PERF_IMISS));

    // run 4: count TCDM contentions
    printf("\n#@# output start\n");
    t4__do_bench(&perf, 1<<RT_PERF_TCDM_CONT, 0);
    printf("\n#@# output end\n");
    printf("#@# tcdm_cont: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));

    // free up all memory


    printf("\n#@# }\n");
}


void test_entry(void) {
    t0__run_test();
    t1__run_test();
    t2__run_test();
    t3__run_test();
    t4__run_test();
}


int main(void) {
test_entry();
return 0;
}
