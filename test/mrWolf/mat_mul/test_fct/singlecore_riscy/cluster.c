#include "rt/rt_api.h"
#include "stdio.h"

// #define TEST_8
#define TEST_16

#ifdef TEST_8
  #include "fct8.h"
  #include "../../test_data/mul_data8_L1.h"
  #define DATA_TYPE int8_t
#elif defined(TEST_16)
  #include "fct16.h"
  #include "../../test_data/mul_data16_L1.h"
  #define DATA_TYPE int16_t
#else
  #include "fct32.h"
  #include "../../test_data/mul_data32_L1.h"
  #define DATA_TYPE int32_t
#endif

static int cores_events;

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
  DATA_TYPE* result = (DATA_TYPE*)rt_alloc(RT_ALLOC_CL_DATA, sizeof(DATA_TYPE)*O_LENGTH*M_LENGTH);

  if(result == NULL){
    printf("no data allocation\n");
    return;
  }

  #ifdef TEST_8
    printf("running test for 8 bit\n");
  #elif defined(TEST_16)
    printf("running test for 16 bit\n");
  #else
    printf("running test for 32 bit\n");
  #endif

  // for(int i = 0; i < O_LENGTH*M_LENGTH; i++){
  //   result[i] = 0;
  // }

  // for(int i = 0; i < 64; i++){
  //   printf("m_a %i\n", m_a[i]);
  //   printf("m_b %i\n", m_b[i]);
  //   printf("m_c %i\n", m_c[i]);
  //   printf("result %i\n", result[i]);
  // }

  // printf("mat mult i32s cl\n");

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

  #ifdef TEST_8
    plp_mat_mult_i8v_xpulpv2(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #elif defined(TEST_16)
    plp_mat_mult_i16v_xpulpv2(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #else
    plp_mat_mult_i32s_xpulpv2(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
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

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  rt_perf_t perf;
  rt_perf_init(&perf);
  
  for (int i=0; i < 1; i++){
    do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR) | (1<<RT_PERF_LD_STALL));
  }

  unsigned int ops = M_LENGTH*O_LENGTH*(N_LENGTH*2);
  unsigned int cycles = rt_perf_read(RT_PERF_CYCLES);
  unsigned int instr = rt_perf_read(RT_PERF_INSTR);
  unsigned int ld_stall = rt_perf_read(RT_PERF_LD_STALL);
  // unsigned int misc = rt_perf_read(RT_PERF_TCDM_CONT);
  printf("Total cycles: %d\n", cycles);
  printf("Instructions: %d\n", instr);
  printf("Load stalls %d\n", ld_stall);
  // printf("misc %d\n", misc);
  printf("Operations %d\n", ops);
  printf("Ops per Instructions: %d.%d \n", ops/instr, (ops*100)/instr);
  printf("Ops per Cycle: %d.%d \n", ops/cycles, (ops*100)/cycles);

  return;
}


