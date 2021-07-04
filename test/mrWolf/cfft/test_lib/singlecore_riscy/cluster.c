#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"

#include "cluster.h"

#if TEST == 1
#include "data_signal.h"
#include "twiddle_factors.h"
#include "bit_reverse.h"
#elif TEST == 2
#include "data_signal_2.h"
#include "twiddle_factors_2.h"
#include "bit_reverse_2.h"
#elif TEST == 3
#include "data_signal_3.h"
#include "twiddle_factors_3.h"
#include "bit_reverse_3.h"
#endif

static int cores_events;

HAL_CL_L1 Complex_type_f32 Buffer_Signal_Out[FFT_LEN];

// This benchmark is a single shot so we can read the value directly out of the
// HW counter using the function hal_perf_read
static void do_bench_0(hal_perf_t *perf, int events)
{
  plp_fft_instance_f32 S;
  S.FFTLength = FFT_LEN;
  S.bitReverseFlag = 1;
  S.pTwiddleFactors = (float32_t *) twiddle_factors;
  S.pBitReverseLUT = bit_rev_LUT;

  // Activate specified events
  hal_perf_conf(perf, events);

  // Reset HW counters now and start and stop counters so that we benchmark
  // only around the printf
  hal_perf_reset(perf);
  hal_perf_start(perf);

  plp_cfft_f32(&S, (float32_t *)Input_Signal, (float32_t *)Buffer_Signal_Out);

  hal_perf_stop(perf);


  float32_t real_acc = 0;
  float32_t imag_acc = 0;
  for(int i=0;i<FFT_LEN;i++)
  {
    printf("%f, %f\n", Buffer_Signal_Out[i].re, Buffer_Signal_Out[i].im);
    real_acc += Buffer_Signal_Out[i].re;
    imag_acc += Buffer_Signal_Out[i].im;
  }
  printf("ACC = %f, %f\n", real_acc, imag_acc);


}

void cluster_entry(void *arg){

  hal_perf_t perf;
  hal_perf_init(&perf);

  for (int i=0; i < 1; i++){
    do_bench_0(&perf, (1<<HAL_PERF_CYCLES) | (1<<HAL_PERF_INSTR));
  }

  printf("Total cycles: %d\n", hal_perf_read(HAL_PERF_CYCLES));
  printf("Instructions: %d\n", hal_perf_read(HAL_PERF_INSTR));

}
