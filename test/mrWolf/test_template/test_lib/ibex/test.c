#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"
#include "data.h"

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  // Activate specified events
  rt_perf_conf(perf, events);

  // Set up buffers needed for computation
  int32_t comp_result[1];

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf

  rt_perf_reset(perf);
  rt_perf_start(perf);

  FSIG;

  rt_perf_stop(perf);

  printf("comp_result: %u\n", comp_result[0]);
  
  int passed = 1;
  if(comp_result[0] != reference_comp_result[0]){
    passed = 0;
  }
  printf("Test passed: %d\n", passed);

}



int main(){

  // This tructure will hold the configuration and also the results in the
  // cumulative mode
  rt_perf_t perf;

  // It must be initiliazed at least once, this will set all values in the
  // structure to zero.
  rt_perf_init(&perf);

  // To be compatible with all platforms, we can count only 1 event at the
  // same time (the silicon as only 1 HW counter), but the total number of cyles
  // is reported by a timer, we can activate it at the same time.
  do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));

  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));


  return 0;

}

