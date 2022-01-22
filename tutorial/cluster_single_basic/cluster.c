#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"

#include "data.h"
#include "defines.h"

void cluster_entry_i32(void* args) {

  printf("Cluster entered. Compute for i32.\n\n");

  int32_t result=0;

  // We also count the number of cycles taken to compute it.
  // This tructure will hold the configuration and also the results in the
  // cumulative mode
  rt_perf_t perf;

  // It must be initiliazed at least once, this will set all values in the
  // structure to zero.
  rt_perf_init(&perf);

  // Activate specified events
  rt_perf_conf(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR)); // Note: on gvsoc you can actiate as many counters as you want, while when you run on board, there is only one HW counter.

#ifdef SLOW

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(&perf);
  rt_perf_start(&perf);

  plp_dot_prod_i32s_xpulpv2(a, b, VLEN, &result);

  rt_perf_stop(&perf);

  printf("The true result is %d, the calculated result is %d.\n", res, result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  printf("\nThe number of cycles is extremely high! What is happening?\n\n");

#endif //SLOW

#ifdef L2DATA

  printf("\nBy default the data is stored in L2 memory in the SoC, the access from the cluster to L2 memory takes many cycles. Let's now store the vectors in L1 memory.\n\n");

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(&perf);
  rt_perf_start(&perf);

  plp_dot_prod_i32s_xpulpv2(a_cl, b_cl, VLEN, &result);

  rt_perf_stop(&perf);

  printf("The true result is %d, the calculated result is %d.\n", res, result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  printf("\nThe number of cycles is significantly reduced.\n\n");

#endif //L2DATA

  return;


}
