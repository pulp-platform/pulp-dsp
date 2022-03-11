#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"

#include "data.h"

void cluster_entry_i8(void* args) {

  printf("Cluster entered. Compute for i8.\n\n");

  int32_t result=0;

  // We also count the number of cycles taken to compute it.
  // This structure will hold the configuration and also the results in the
  // cumulative mode
  rt_perf_t perf;

  // It must be initiliazed at least once, this will set all values in the
  // structure to zero.
  rt_perf_init(&perf);

  // Activate specified events
  rt_perf_conf(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR)); // Note: on gvsoc you can activate as many counters as you want, while when you run on board, there is only one HW counter.

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(&perf);
  rt_perf_start(&perf);

  plp_dot_prod_i8s_xpulpv2(a_cl, b_cl, VLEN, &result);

  rt_perf_stop(&perf);

  printf("The true result is %d, the calculated result is %d.\n", res_cl, result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  printf("\nBoth cycles and instructions are reduced.\n\n");

  return;


}
