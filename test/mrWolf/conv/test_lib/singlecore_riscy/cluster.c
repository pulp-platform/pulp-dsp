#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"

static int cores_events;
static uint32_t nummismatches = 0;

#define NUMBEROFTIMES 1
#define NUMCORES 2

#define i32s 0
#define i32p 0
#define i16s 0
#define i16p 0
#define i8s 0
#define i8p 1

#if(i16s || i16p)
#include "../../test_data/conv_data16_L1.h"
#endif
#if(i32s || i32p)
#include "../../test_data/conv_data32_L1.h"
#endif
#if(i8s || i8p)
#include "../../test_data/conv_data8_L1.h"
#endif


RT_CL_DATA static int32_t  * v_r;// __attribute__ ((aligned(32)));
// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  //printf("dot product i32s cl\n");
  
  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);
  
#if(i32s)
  plp_conv_i32(v_a,LENGTHA,v_b,LENGTHB,v_r);
#endif
#if(i16s)
  plp_conv_i16(v_a,LENGTHA,v_b,LENGTHB,v_r);
  #endif
#if(i8s)
  plp_conv_i8(v_a,LENGTHA,v_b,LENGTHB,v_r);
#endif
#if(i32p)
  plp_conv_i32_parallel(v_a,LENGTHA,v_b,LENGTHB,NUMCORES,v_r);
#endif
#if(i16p)
  plp_conv_i16_parallel(v_a,LENGTHA,v_b,LENGTHB,NUMCORES,v_r);
#endif
#if(i8p)
  plp_conv_i8_parallel(v_a,LENGTHA,v_b,LENGTHB,NUMCORES,v_r);
#endif
  
  rt_perf_stop(perf);

  for(int i=0;i<LENGTHA+LENGTHB-1;i++){
    if(v_r[i]!=r[i]){
      nummismatches++;
      /* printf("Mismatch at %d, expected %li, got %li\n", i, r[i], v_r[i]); */
    } else {
      /* printf("Expected %ld, got %li\n", r[i], v_r[i]); */
    }
  }
}
void cluster_entry(void *arg){

  /* printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id()); */

  v_r = rt_alloc(RT_ALLOC_CL_DATA, sizeof(int32_t)*(LENGTHA+LENGTHB-1));

  // Transfer to L1 memory
  /* rt_dma_copy_t copy; */
  /* rt_dma_memcpy(v_a, v_a_l1, sizeof(v_a), RT_DMA_DIR_EXT2LOC, 0, &copy); */
  /* rt_dma_wait(&copy); */
  /* rt_dma_memcpy(v_b, v_b_l1, sizeof(v_b), RT_DMA_DIR_EXT2LOC, 0, &copy); */
  /* rt_dma_wait(&copy); */

  rt_perf_t perf;
  rt_perf_init(&perf);
  
  for (int i=0; i < NUMBEROFTIMES; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR) | (1<<RT_PERF_LD_STALL) | (1<<RT_PERF_TCDM_CONT) | (1<<RT_PERF_LD_EXT));
  }

  printf("Number of mismatches in results: %ld\n", nummismatches);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  //printf("Load stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));
  //printf("TCDM Contentions: %d\n", rt_perf_read(RT_PERF_TCDM_CONT));
  //printf("External loads: %d\n", rt_perf_read(RT_PERF_LD_EXT));
  return;
}


