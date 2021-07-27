#include "rtos_hal.h"
#include "stdio.h"

// #define FMA_TEST_8
// #define FMA_TEST_16

#if defined(FMA_TEST_8)
  #include "fma_fct8.h"
  #include "../../test_data/fma_data8_L2.h"
#elif defined(FMA_TEST_16)
  #include "fma_fct16.h"
  #include "../../test_data/fma_data16_L2.h"
#else
  #include "fma_fct32.h"
  #include "../../test_data/fma_data32_L2.h"
#endif


// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function hal_perf_read
static void do_bench_0(hal_perf_t *perf, int events)
{
  
  int32_t* result = (int32_t*) hal_fc_l1_malloc(sizeof(uint32_t)*M_LENGTH*O_LENGTH);

  #if defined FMA_TEST_8
    printf("running test for 8 bit\n");
  #elif defined(FMA_TEST_16)
    printf("running test for 16 bit\n");
  #else
    printf("running test for 32 bit\n");
  #endif

  // Activate specified events
  hal_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  hal_perf_reset(perf);
  hal_perf_start(perf);

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
  #else
    for(int i = 0; i < M_LENGTH*O_LENGTH; i++){
      result[i] = (int32_t)m_c_initial[i];
    }
    plp_mat_fma_i32s_rv32im(m_a, m_b, M_LENGTH, N_LENGTH, O_LENGTH, result);
  #endif

  hal_perf_stop(perf);

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
  hal_perf_t perf;

  // It must be initiliazed at least once, this will set all values in the
  // structure to zero.
  hal_perf_init(&perf);

  // To be compatible with all platforms, we can count only 1 event at the
  // same time (the silicon as only 1 HW counter), but the total number of cyles
  // is reported by a timer, we can activate it at the same time.
  // for (int i=0; i<10; i++){
    do_bench_0(&perf, (1<<HAL_PERF_CYCLES) | (1<<HAL_PERF_INSTR) | (1<<HAL_PERF_LD_STALL) | (1<<HAL_PERF_TCDM_CONT));
  // }

  unsigned int ops = M_LENGTH*O_LENGTH*N_LENGTH*2;
  unsigned int cycles = hal_perf_read(HAL_PERF_CYCLES);
  unsigned int instr = hal_perf_read(HAL_PERF_INSTR);
  unsigned int ld_stall = hal_perf_read(HAL_PERF_LD_STALL);
  unsigned int cont = hal_perf_read(HAL_PERF_TCDM_CONT);
  // unsigned int misc = hal_perf_read(HAL_PERF_DELAY_NOP);
  printf("Total cycles: %d\n", cycles);
  printf("Instructions: %d\n", instr);
  printf("Load stalls %d\n", ld_stall);
  printf("Contention %d\n", cont);
  // printf("Misc %d\n", misc);
  printf("Operations %d\n", ops);


  return 0;

}

