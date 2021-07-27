#include <stdio.h>
#include "pulp.h"
#include "ex_math.h"

#define NELEM 1000

RT_L1_DATA int8_t vecA[NELEM];
RT_L1_DATA int8_t vecB[NELEM];

unsigned int GOLDEN_VALUE = 5457416;

void init_vec(int8_t* V, int n, unsigned char off)
{
  int i;
  for(i=0;i<n;i++)
    V[i] = (int8_t)i + off;
}

void cluster_entry(void *arg)
{

  printf("Cluster entered\n");

  hal_perf_t perf;
  hal_perf_init(&perf);
  hal_perf_conf(&perf, (1<<HAL_PERF_CYCLES) | (1<<HAL_PERF_INSTR));
  hal_perf_reset(&perf);

  unsigned int res;

  init_vec(vecA,NELEM,0);
  init_vec(vecB,NELEM,1);

  hal_perf_start(&perf);

  ex_dot_prod_i8(vecA, vecB, NELEM, &res);

  hal_perf_stop(&perf);

  if(res != GOLDEN_VALUE)
    printf("dot product is %d instead of %d\n", res, GOLDEN_VALUE);
  else
    printf("Result correct\n");

  printf("Total cycles: %d\n", hal_perf_read(HAL_PERF_CYCLES));
  printf("Instructions: %d\n", hal_perf_read(HAL_PERF_INSTR));


  return res != GOLDEN_VALUE;
}
