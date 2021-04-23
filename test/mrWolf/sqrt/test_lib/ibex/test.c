#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"
#include "data.h"

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function hal_perf_read
static int do_bench(hal_perf_t *perf, int events, int do_check)
{
    // Activate specified events
    hal_perf_conf(perf, events);
    
    // Reset HW counters now and start and stop counters so that we benchmark
    // not around the printf
    hal_perf_reset(perf);
    hal_perf_start(perf);
    
    FSIG
    
    hal_perf_stop(perf);
    
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
