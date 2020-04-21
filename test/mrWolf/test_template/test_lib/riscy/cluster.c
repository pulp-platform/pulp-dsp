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

  // Reset HW counters now and start and stop counters so that we benchmark
  // not around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  FSIG;

  rt_perf_stop(perf);

  int passed = 1;

  CHECK

  printf("Test passed: %d\n", passed);

}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  rt_perf_t perf;
  rt_perf_init(&perf);
  
  do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));

  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  return;
}


