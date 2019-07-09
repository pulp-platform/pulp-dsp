#include "rt/rt_api.h"
#include "stdio.h"
#include "fct.h"
// change to fit the tests, use mult_data32.h or fma_data32.h with the according numbers
#include "../../test_data/mul_data32_L2.h"


// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  
  int32_t* result = (int32_t*) rt_alloc(RT_ALLOC_FC_DATA, sizeof(uint32_t)*M_LENGTH*O_LENGTH);

  printf("matrix mult i32s fc\n");

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  
  plp_mat_mult_i32s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);

  rt_perf_stop(perf);

  int errors = 0;
  for(int i = 0; i < M_LENGTH*O_LENGTH; i++){
    if(result[i] != m_c[i]){
      printf("error at index: %i result is %i, expected result is %i\n", i, result[i], m_c[i]);
    }
  }

  if(errors == 0){
    printf("Success, no errors!\n");
  } else {
    printf("Total Errors: %i\n", errors);
  }
}



int main(){

  // This tructure will hold the configuration and also the results in the
  // cumulative mode
  rt_perf_t perf;

  // It must be initiliazed at least once, this will set all values in the
  // structure to zero.
  rt_perf_init(&perf);

  // To be compatible with all platforms, we can count only 1 event at the
  // same time (the silicon as only 1 HW counter), but the total number of cyles
  // is reported by a timer, we can activate it at the same time.
  for (int i=0; i<10; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  }

  unsigned int ops = M_LENGTH*O_LENGTH*(N_LENGTH*2);
  unsigned int cycles = rt_perf_read(RT_PERF_CYCLES);
  unsigned int instr = rt_perf_read(RT_PERF_INSTR);
  printf("Total cycles: %d\n", cycles);
  printf("Instructions: %d\n", instr);
  printf("Operations %d\n", ops);
  printf("Ops per Instructions: %d.%d \n", ops/instr, (ops*100)/instr);
  printf("Ops per Cycle: %d.%d \n", ops/cycles, (ops*100)/cycles);


  return 0;

}

