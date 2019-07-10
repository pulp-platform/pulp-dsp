#include "rt/rt_api.h"
#include "stdio.h"

// #define FMA_TEST_8
// #define FMA_TEST_16
// #define FMA_TEST_32
#define MUL_TEST_8
// #define MUL_TEST_16

#if defined(FMA_TEST_8)
  #include "fma_fct16.h"
  #include "../../test_data/fma_data8_L2.h"
#elif defined(FMA_TEST_16)
  #include "fma_fct16.h"
  #include "../../test_data/fma_data16_L2.h"
#elif defined(FMA_TEST_32)
  #include "fma_fct32.h"
  #include "../../test_data/fma_data32_L2.h"
#elif defined(MUL_TEST_8)
  #include "mul_fct16.h"
  #include "../../test_data/mul_data8_L2.h"
#elif defined(MUL_TEST_16)
  #include "mul_fct16.h"
  #include "../../test_data/mul_data16_L2.h"
#else // meaning MUL_TEST_32
  #include "mul_fct32.h"
  #include "../../test_data/mul_data32_L2.h"
#endif

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  
  int32_t* result = (int32_t*) rt_alloc(RT_ALLOC_FC_DATA, sizeof(uint32_t)*M_LENGTH*O_LENGTH);

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  #if defined(FMA_TEST_8)
    for(int i = 0; i < M_LENGTH*O_LENGTH; i++){
      result[i] = (int32_t)m_c_initial[i];
    }
    plp_mat_fma_i8s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #elif defined(FMA_TEST_16)
    for(int i = 0; i < M_LENGTH*O_LENGTH; i++){
      result[i] = (int32_t)m_c_initial[i];
    }
    plp_mat_fma_i16s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #elif defined(FMA_TEST_32)
    for(int i = 0; i < M_LENGTH*O_LENGTH; i++){
      result[i] = (int32_t)m_c_initial[i];
    }
    plp_mat_fma_i32s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);

  #elif defined(MUL_TEST_8)
    plp_mat_mult_i8s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #elif defined(MUL_TEST_16)
    plp_mat_mult_i16s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #else // meaning MUL_TEST_32
    plp_mat_mult_i32s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #endif

  rt_perf_stop(perf);

  int errors = 0;
  for(int i = 0; i < M_LENGTH*O_LENGTH; i++){
    if(result[i] != m_c[i]){
      printf("error at index: %i result is %i, expected result is %i\n", i, result[i], m_c[i]);
      errors++;
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
  // for (int i=0; i<10; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR) | (1<<RT_PERF_LD_STALL));
  // }

  unsigned int ops = M_LENGTH*O_LENGTH*(N_LENGTH*2);
  unsigned int cycles = rt_perf_read(RT_PERF_CYCLES);
  unsigned int instr = rt_perf_read(RT_PERF_INSTR);
  unsigned int ld_stall = rt_perf_read(RT_PERF_LD_STALL);
  printf("Total cycles: %d\n", cycles);
  printf("Instructions: %d\n", instr);
  printf("Load stalls %d\n", ld_stall);
  printf("Operations %d\n", ops);
  printf("Ops per Instructions: %d.%d \n", ops/instr, (ops*100)/instr);
  printf("Ops per Cycle: %d.%d \n", ops/cycles, (ops*100)/cycles);


  return 0;

}

