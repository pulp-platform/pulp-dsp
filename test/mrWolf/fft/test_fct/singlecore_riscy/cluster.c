#include "rt/rt_api.h"
#include "stdio.h"
#include "fct.h"
#include "plp_cfft_i16s_rv32im.c"
#include "plp_cfft_i16v_xpulpv2.c"
//#include "plp_cfft_i16v_xpulpv2cplx.c"
#include "plp_cfft_i16vp_xpulpv2.c"
//#include "plp_cfft_i16vp_xpulpv2cplx.c"
#include "plp_cfft_i32s_rv32im.c"
#include "plp_cfft_i32s_xpulpv2.c"
#include "plp_cfft_i32p_xpulpv2.c"
#include "SwapTable.h"

#define N_BITS 16
#define LENGTH 512
#define PARALLEL 8

#define PRINT_RESULT


#if N_BITS == 16
   #if LENGTH == 128
      #include "fft_data_i16_128.h"
      #define TWIDLE_COEFF twiddleCoef_i16_128
   #elif LENGTH == 256
      #include "fft_data_i16_256.h"
      #define TWIDLE_COEFF twiddleCoef_i16_256
   #elif LENGTH == 512
      #include "fft_data_i16_512.h"
      #define TWIDLE_COEFF twiddleCoef_i16_512
   #endif
#endif

#if N_BITS == 32
   #if LENGTH == 128
      #include "fft_data_i32_128.h"
      #define TWIDLE_COEFF twiddleCoef_i32_128
   #elif LENGTH == 256
      #include "fft_data_i32_256.h"
      #define TWIDLE_COEFF twiddleCoef_i32_256
   #elif LENGTH == 512
      #include "fft_data_i32_512.h"
      #define TWIDLE_COEFF twiddleCoef_i32_512
   #endif
#endif

#if LENGTH == 128
   #define SWAP_TABLE SwapTable_128
#elif LENGTH == 256
   #define SWAP_TABLE SwapTable_256
#elif LENGTH == 512
   #define SWAP_TABLE SwapTable_512
#endif

#if N_BITS == 16
   #define DATA_TYPE int16_t
#elif N_BITS == 32
   #define DATA_TYPE int32_t
#endif

static int cores_events;
RT_CL_DATA static DATA_TYPE * X_l1;
RT_CL_DATA static DATA_TYPE * exp_result_l1;
RT_CL_DATA static DATA_TYPE * twiddleCoef_l1;
RT_CL_DATA static uint16_t * SwapTable_l1;


// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function rt_perf_read
static void do_bench_0(rt_perf_t *perf, int events)
{
#if PARALLEL > 1
  printf("cfft_i%i%c_%i\n", N_BITS, 'p', LENGTH);
#else
  printf("cfft_i%i_%i\n", N_BITS, LENGTH);
#endif

  // Activate specified events
  rt_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  rt_perf_reset(perf);
  rt_perf_start(perf);

#if N_BITS == 16 && PARALLEL == 1
  //plp_cfft_i16s_rv32im(X_l1, twiddleCoef_l1, SwapTable_l1, LENGTH);
  plp_cfft_i16v_xpulpv2(X_l1, twiddleCoef_l1, SwapTable_l1, LENGTH);
  //plp_cfft_i16v_xpulpv2cplx(X_l1, twiddleCoef_l1, SwapTable_l1, LENGTH);
#elif N_BITS == 32 && PARALLEL == 1
  //plp_cfft_i32s_rv32im(X_l1, twiddleCoef_l1, SwapTable_l1, LENGTH);
  plp_cfft_i32s_xpulpv2(X_l1, twiddleCoef_l1, SwapTable_l1, LENGTH);
#elif N_BITS == 16 && PARALLEL > 1
  
  plp_cfft_instance_i16 S;

  S.Data = X_l1;
  S.Twiddles = twiddleCoef_l1;
  S.SwapTable = SwapTable_l1;
  S.N_FFT = LENGTH;
  S.nPE = PARALLEL;

  rt_team_fork(PARALLEL, plp_cfft_i16vp_xpulpv2, (void *)&S);
  //rt_team_fork(PARALLEL, plp_cfft_i16vp_xpulpv2cplx, (void *)&S);

#elif N_BITS == 32 && PARALLEL > 1
  
  plp_cfft_instance_i32 S;

  S.Data = X_l1;
  S.Twiddles = twiddleCoef_l1;
  S.SwapTable = SwapTable_l1;
  S.N_FFT = LENGTH;
  S.nPE = PARALLEL;

  rt_team_fork(PARALLEL, plp_cfft_i32p_xpulpv2, (void *)&S);

#endif
  rt_perf_stop(perf);


#ifdef PRINT_RESULT
  printf("expected result:\n");
  
  for(int i = 0; i < 2 * LENGTH; i++)
    printf("%i, ", exp_result_l1[i]);
  printf("\n\n");
  
  printf("result:\n");
  
  for(int i = 0; i < 2 * LENGTH; i++)
    printf("%i, ", X_l1[i]);
  printf("\n\n");
#endif
  
}

void cluster_entry(void *arg){

  printf("(%d, %d) Hello! Cluster entered\n", rt_cluster_id(), rt_core_id());

  X_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(x));
  exp_result_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(exp_result));
  twiddleCoef_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(TWIDLE_COEFF));
  SwapTable_l1 = rt_alloc(RT_ALLOC_CL_DATA, sizeof(SWAP_TABLE));
  
  // Transfer to L1 memory
  rt_dma_copy_t copy;
  rt_dma_memcpy(x, X_l1, sizeof(x), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(exp_result, exp_result_l1, sizeof(exp_result), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(TWIDLE_COEFF, twiddleCoef_l1, sizeof(TWIDLE_COEFF), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);
  rt_dma_memcpy(SWAP_TABLE, SwapTable_l1, sizeof(SWAP_TABLE), RT_DMA_DIR_EXT2LOC, 0, &copy);
  rt_dma_wait(&copy);

  rt_perf_t perf;
  rt_perf_init(&perf);
  do_bench_0(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

}


