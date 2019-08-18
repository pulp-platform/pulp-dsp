#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"
#include "fft_data_i16_512.h"

//static int cores_events;
RT_CL_DATA static int16_t * x_l1;// __attribute__ ((aligned(32)));

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  printf("fft i16 512\n");

  // Activate specified events
  rt_perf_conf(perf, events);
  
  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  plp_cfft_i16_parallel(x_l1, 512, 8);

  rt_perf_stop(perf);

  /* printf("finished\n"); */
  
  /* printf("result\n"); */
  /* for(int i = 0; i < 2 * 512; i++) */
  /*   printf("%i, ", x_l1[i]); */
  /* printf("\n\n"); */

  /* printf("expected result\n"); */
  /* for(int i = 0; i < 2 * 512; i++) */
  /*   printf("%i, ", exp_result[i]); */
  /* printf("\n\n"); */
}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  x_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(x));
  if(x_l1 == NULL)
    printf("memory allocation failed!\n");
  
  // Transfer to L1 memory
  rt_dma_copy_t copy;
  rt_dma_memcpy((unsigned int)x, (unsigned int)x_l1, sizeof(x), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  
  rt_perf_t perf;
  rt_perf_init(&perf);
  
  for (int i=0; i < 1; i++){
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
  
  return;
}


