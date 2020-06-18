#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"
#include "data.h"

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static int do_bench(rt_perf_t *perf, int events, int do_check)
{
    // Activate specified events
    rt_perf_conf(perf, events);
    
    // Reset HW counters now and start and stop counters so that we benchmark
    // not around the printf
    rt_perf_reset(perf);
    rt_perf_start(perf);
    
    FSIG
    
    rt_perf_stop(perf);
    
    int passed = 1;

    if (do_check) {
        CHECK
    }

    return passed;
}

int main(){

    BENCH

    return 0;
}
