#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"
#include "../../test_data/vec_data_i_1000.h"

static int cores_events;
RT_CL_DATA static v_type * v_a_l1;// __attribute__ ((aligned(32)));
RT_CL_DATA static v_type * v_b_l1;// __attribute__ ((aligned(32)));

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  v_type result=0;

  //printf("dot product i32s cl\n");

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  //plp_dot_prod_q32_parallel(v_a_l1, v_b_l1, LENGTH, 2, 8, &result);
  //plp_dot_prod_i32_parallel(v_a_l1, v_b_l1, LENGTH, 8, &result);
  //plp_dot_prod_f32(v_a_l1, v_b_l1, LENGTH, &result);
  //plp_dot_prod_f32_parallel(v_a_l1, v_b_l1, LENGTH, 8, &result);
  //plp_dot_prod_q32(v_a_l1, v_b_l1, LENGTH, 1, &result);
  //plp_dot_prod_f32s_xpulpv2(v_a_l1, v_b_l1, LENGTH, &result);
  //plp_dot_prod_q32s_xpulpv2(v_a_l1, v_b_l1, LENGTH, 2, &result);
  plp_dot_prod_i32s_xpulpv2(v_a_l1, v_b_l1, LENGTH, &result);
  

  rt_perf_stop(perf);

  printf("result is %d, expected result is %d\n", result, exp_result);

}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  v_a_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(v_a));
  v_b_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(v_b));
  
  // Transfer to L1 memory
  rt_dma_copy_t copy;
  rt_dma_memcpy(v_a, v_a_l1, sizeof(v_a), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(v_b, v_b_l1, sizeof(v_b), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);

  rt_perf_t perf;
  rt_perf_init(&perf);
  
  for (int i=0; i < 10; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  }
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  return;
}


