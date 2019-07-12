#include "rt/rt_api.h"
#include "stdio.h"
//#include "fct.h"
#include "../../test_data/mfcc_test_data.h"
#include "MFCC_Processing.h"

static int cores_events;
//RT_CL_DATA static int16_t * v_a_l1;// __attribute__ ((aligned(32)));
//RT_CL_DATA static int16_t * v_b_l1;// __attribute__ ((aligned(32)));
RT_CL_DATA short int * Data_In_L1;
RT_CL_DATA v2s  W_Frame[N_FFT+4];
RT_CL_DATA short int Frame[FRAME];
RT_CL_DATA short int FEAT_LIST[N_FRAME * NUMCEP];


// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  int32_t result=0;

  printf("MFCC Processing\n");

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  MFCC_Processing(Data_In_L1, W_Frame, Frame, FEAT_LIST);

  rt_perf_stop(perf);


  printf("finished\n");
  printf("W_Frame:\n");
  for(int i = 0; i < N_FFT + 4; i++)
     printf("%i ", W_Frame[i]);
  printf("\n");
}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  //v_a_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(v_a));
  //v_b_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(v_b));
  
  Data_In_L1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(DataIn));

  if (Data_In_L1 == NULL) printf("memory allocation failed\n");
  else printf("memory allocation succeded\n");


  // Transfer to L1 memory
  rt_dma_copy_t copy;
  rt_dma_memcpy(DataIn, Data_In_L1, sizeof(DataIn), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  //rt_dma_memcpy(v_a, v_a_l1, sizeof(v_a), RT_DMA_DIR_EXT2LOC, 0, &copy);
  //rt_dma_wait(&copy);
  //rt_dma_memcpy(v_b, v_b_l1, sizeof(v_b), RT_DMA_DIR_EXT2LOC, 0, &copy);
  //rt_dma_wait(&copy);

  printf("data copy succeeded\n");

  rt_perf_t perf;
  rt_perf_init(&perf);
  do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

}


