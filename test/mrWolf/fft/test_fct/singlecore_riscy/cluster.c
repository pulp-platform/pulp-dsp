#include "rt/rt_api.h"
#include "stdio.h"
#include "fct.h"
#include "fft_data16.h"

static int cores_events;
RT_CL_DATA static int16_t * X_l1;
RT_CL_DATA static int16_t * exp_result_l1;
RT_CL_DATA static int16_t * twiddleCoef_512_q16_l1;
RT_CL_DATA static int16_t * SwapTable_512_q16_l1;


// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  printf("fft i16\n");

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  Radix2FFT_DIF_args(X_l1, twiddleCoef_512_q16_l1, 512);
  SwapSamples_args((v2s *) X_l1, SwapTable_512_q16, 512);

  rt_perf_stop(perf);

    printf("expected result:\n")
    
    for(int i = 0; i < 1024; i++)
        printf("%hi, ", ((int16_t *)exp_result_l1)[i]);
    printf("\n\n");
    
    printf("result:\n")
    
    for(int i = 0; i < 1024; i++)
        printf("%hi, ", ((int16_t *)X_l1)[i]);
    printf("\n\n");

}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  X_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(x));
  exp_result_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(exp_result));
  twiddleCoef_512_q16_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(twiddleCoef_512_q16));
  SwapTable_512_q16_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(SwapTable_512_q16));
  
  // Transfer to L1 memory
  rt_dma_copy_t copy;
  rt_dma_memcpy(x, X_l1, sizeof(x), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(exp_result, exp_result_l1, sizeof(exp_result), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(twiddleCoef_512_q16, twiddleCoef_512_q16_l1, sizeof(twiddleCoef_512_q16), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(SwapTable_512_q16, SwapTable_512_q16_l1, sizeof(SwapTable_512_q16), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);

  rt_perf_t perf;
  rt_perf_init(&perf);
  do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

}


