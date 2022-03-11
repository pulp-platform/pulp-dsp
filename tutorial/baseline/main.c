#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"
#include "data.h"

int main(){

  int32_t result=0;

  printf("\nComputing dot prod of i32 numbers\n\n"); // it's better to always end with \n

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

  plp_dot_prod_i32(a, b, VLEN, &result);

  rt_perf_stop(&perf);

  printf("The true result is %d, the calculated result is %d.\n", res, result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  printf("\nThe glue code also took few cycles. If we call directly the kernel function to compute the dot product we have:\n");

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(&perf);
  rt_perf_start(&perf);

  plp_dot_prod_i32s_rv32im(a, b, VLEN, &result);

  rt_perf_stop(&perf);

  printf("The true result is %d, the calculated result is %d.\n", res, result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  printf("(The effect might be more evident with SIMD and parallel computation.)\n");

  return 0;

}
