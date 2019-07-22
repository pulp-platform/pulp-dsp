#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"
#include "fft_data_i32_512.h"

//static int cores_events;
RT_CL_DATA static int32_t * x_l1;// __attribute__ ((aligned(32)));
RT_CL_DATA static int32_t * Twiddles_l1;// __attribute__ ((aligned(32)));
RT_CL_DATA static uint16_t * Swap_l1;// __attribute__ ((aligned(32)));

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  //printf("fft i16 512 cl\n");

  // Activate specified events
  rt_perf_conf(perf, events);
  
  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);



  plp_cfft_i32_parallel(x, 512, 8);

  rt_perf_stop(perf);

  printf("result\n");
  for(int i = 0; i < 2 * 512; i++)
    printf("%i, ", x[i]);
  printf("\n\n");

  printf("expected result\n");
  for(int i = 0; i < 2 * 512; i++)
    printf("%i, ", exp_result[i]);
  printf("\n\n");
}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  Twiddles_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(twiddleCoef_i16_512));
  Swap_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(SwapTable_512));
  x_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(x));
  
  // Transfer to L1 memory
  rt_dma_copy_t copy;
  rt_dma_memcpy(twiddleCoef_i16_512, Twiddles_l1, sizeof(twiddleCoef_i16_512), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(SwapTable_512, Swap_l1, sizeof(SwapTable_512), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(x, x_l1, sizeof(x), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);

  rt_perf_t perf;
  rt_perf_init(&perf);
  
  for (int i=0; i < 1; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  }
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  return;
}


