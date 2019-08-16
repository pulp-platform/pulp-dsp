#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"
#include "../singlecore_riscy/fft_data_i32_512.h"


// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  printf("fft i32 512\n");
  
  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  plp_cfft_i32(x, 512);

  rt_perf_stop(perf);
  
  printf("finished\n");
  
  printf("result\n");
  for(int i = 0; i < 2 * 512; i++)
    printf("%i, ", x[i]);
  printf("\n\n");
  
  printf("expected result\n");
  for(int i = 0; i < 2 * 512; i++)
    printf("%i, ", exp_result[i]);
  printf("\n\n");
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
  for (int i=0; i<1; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR) | (1<<RT_PERF_LD_STALL) | (1<<RT_PERF_JR_STALL) | (1<<RT_PERF_ACTIVE_CYCLES) | (1<<RT_PERF_LD_EXT_CYC) | (1<<RT_PERF_ST_EXT_CYC) | (1<<RT_PERF_TCDM_CONT));
  }
   printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Active cycles: %d\n", rt_perf_read(RT_PERF_ACTIVE_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  printf("Load Stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));
  printf("Jump Stalls: %d\n", rt_perf_read(RT_PERF_JR_STALL));
  printf("Extern Load cycles: %d\n", rt_perf_read(RT_PERF_LD_EXT_CYC));
  printf("Extern Store cycles: %d\n", rt_perf_read(RT_PERF_ST_EXT_CYC));
  printf("TCDM contention cycles: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));


  return 0;

}

