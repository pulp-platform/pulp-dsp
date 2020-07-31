// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include <stdio.h>
#include "pulp.h"
#include "ex_math.h"

#define NELEM 1000

int8_t vecA[NELEM];
int8_t vecB[NELEM];

unsigned int GOLDEN_VALUE = 5457416;

void init_vec(int8_t* V, int n, unsigned char off)
{
    int i;
    for(i=0;i<n;i++)
        V[i] = (int8_t)i + off;
}

int main()
{


  rt_perf_t perf;
  rt_perf_init(&perf);
  rt_perf_conf(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  rt_perf_reset(&perf);

  unsigned int res;

    init_vec(vecA,NELEM,0);
    init_vec(vecB,NELEM,1);

    rt_perf_start(&perf);

    ex_dot_prod_i8(vecA, vecB, NELEM, &res);

    rt_perf_stop(&perf);

    if(res != GOLDEN_VALUE)
      printf("dot product is %d instead of %d\n", res, GOLDEN_VALUE);
    else
      printf("Result correct\n");

    printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
    printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));


  return res != GOLDEN_VALUE;
}

