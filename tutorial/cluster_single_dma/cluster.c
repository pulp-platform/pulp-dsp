#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"

#include "data.h"
#include "defines.h"

#ifdef USEDMA

RT_L1_BSS int32_t a_cldma[VLEN]; // for small sizes it doesn't matter too much. you can also use RT_L1_DATA
RT_L1_BSS int32_t b_cldma[VLEN];

#endif //USEDMA


void cluster_entry_i32(void* args) {

  printf("Cluster entered. Compute for i32.\n\n");

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

#ifdef USEDMA

  // For dma transfer
  rt_dma_copy_t id; // the id can be used to e.g. wait for a dma transfer to finish with rt_dma_wait(&id);
  // You can issue simultaneously up to 16 transfers.

  rt_dma_memcpy((int)a, (int)a_cldma, VLEN*sizeof(int32_t), RT_DMA_DIR_EXT2LOC, 0, &id);
  rt_dma_memcpy((int)b, (int)b_cldma, VLEN*sizeof(int32_t), RT_DMA_DIR_EXT2LOC, 0, &id);

  rt_dma_wait(&id);

  rt_perf_stop(&perf);
  printf("The DMA transfer takes\n");
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  // Reset HW counters now and start and stop counters so that we benchmark
  rt_perf_reset(&perf);
  rt_perf_start(&perf);

  plp_dot_prod_i32s_xpulpv2(a_cldma, b_cldma, VLEN, &result);

#else

  plp_dot_prod_i32s_xpulpv2(a_cl, b_cl, VLEN, &result);

#endif //USEDMA

  rt_perf_stop(&perf);

  printf("The true result is %d, the calculated result is %d.\n", res, result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  return;


}
