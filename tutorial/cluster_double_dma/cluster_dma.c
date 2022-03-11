#include "rtos_hal.h"
#include "stdio.h"
#include "plp_math.h"

#include "data.h"
#define VLEN_DMA 870

RT_CL_DATA int32_t a_cldma[VLEN_DMA];
RT_CL_DATA int32_t b_cldma[VLEN_DMA];

void cluster_entry_i32(void* args) {

  printf("Cluster entered. Compute for i32.\n\n");

  printf("Initialize the values to 0. The vector length is %d\n", VLEN);
  for (int i=0; i<VLEN; i++){
    a[i] = 0;
    b[i] = 0;
  }

  printf("\nCompute with 8 parallel cores\n\n");


  rt_perf_t perf;
  rt_perf_init(&perf);
  rt_perf_conf(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
 
  rt_perf_reset(&perf);
  rt_perf_start(&perf);
  int32_t* idx_ext_a = &a[1];
  int32_t* idx_ext_b = &b[1];
  int32_t result=0,result_par=0;
  
  /* DOUBLE BUFFERING DMA TRASFER */

  rt_dma_copy_t id;
  // Loads the first bunch of data in the L1 memory
  rt_dma_memcpy((int)idx_ext_a, (int)a_cldma, VLEN_DMA*sizeof(int32_t), RT_DMA_DIR_EXT2LOC, 0, &id);
  rt_dma_memcpy((int)idx_ext_b, (int)b_cldma, VLEN_DMA*sizeof(int32_t), RT_DMA_DIR_EXT2LOC, 0, &id);
  rt_dma_wait(&id);

  for(int dma_itr = 1; dma_itr<VLEN/VLEN_DMA; dma_itr++)
  {

      // Loads the subsequent bunch of data...
      rt_dma_memcpy((int)idx_ext_a, (int)a_cldma, VLEN_DMA*sizeof(int32_t), RT_DMA_DIR_EXT2LOC, 0, &id);
      
      // ... in the meantime executes computation.
      rt_dma_memcpy((int)idx_ext_b, (int)b_cldma, VLEN_DMA*sizeof(int32_t), RT_DMA_DIR_EXT2LOC, 0, &id);
      plp_dot_prod_i32_parallel(a_cldma, b_cldma, VLEN_DMA, 8, &result_par);
      result = result + result_par;
      
      // Updates pointers to memory address to be read
      idx_ext_a = idx_ext_a+VLEN_DMA;
      idx_ext_b = idx_ext_b+VLEN_DMA;
      rt_dma_wait(&id);	
	
  }
  
  // The last bunch of data still has to be computed
  plp_dot_prod_i32_parallel(a_cldma, b_cldma, VLEN_DMA, 8, &result_par);
  result = result + result_par;

  rt_perf_stop(&perf);
  printf("The calculated result is %d\n", result);
  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

  return;


}
