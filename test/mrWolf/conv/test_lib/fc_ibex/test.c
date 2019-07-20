#include "rt/rt_api.h"
#include "stdio.h"
#include "plp_math.h"

static uint32_t nummismatches = 0;

#define NUMBEROFTIMES 1

#define i32s 0
#define i16s 0
#define i8s 1

#if(i16s)
#include "../../test_data/conv_data16_L2.h"
#endif
#if(i32s)
#include "../../test_data/conv_data32_L2.h"
#endif
#if(i8s)
#include "../../test_data/conv_data8_L2.h"
#endif

RT_FC_DATA static int32_t  * v_r;// __attribute__ ((aligned(32)));

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  int32_t result=0;

  //printf("dot product i32s fc\n");

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



int main(){

  // This tructure will hold the configuration and also the results in the
  // cumulative mode
  rt_perf_t perf;

  v_r = rt_alloc(RT_ALLOC_FC_DATA, sizeof(int32_t)*(LENGTHA+LENGTHB-1));
  
  // It must be initiliazed at least once, this will set all values in the
  // structure to zero.
  rt_perf_init(&perf);

  // To be compatible with all platforms, we can count only 1 event at the
  // same time (the silicon as only 1 HW counter), but the total number of cyles
  // is reported by a timer, we can activate it at the same time.

  for (int i=0; i < NUMBEROFTIMES; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR) | (1<<RT_PERF_LD_STALL));
  }

  printf("Number of mismatches in results: %ld\n", nummismatches);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));
  printf("Load stalls: %d\n", rt_perf_read(RT_PERF_LD_STALL));


  return 0;

}

