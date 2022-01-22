#include "rtos_hal.h"
#include "stdio.h"
#include "cluster.h"
#include "defines.h"

int main(){

  int32_t result=0;

  printf("\nActivating cluster for computing i32 dot prod on single CV32E40P core\n\n");

#if defined(CLPERF) && !defined(PERF)

  rt_perf_t perf;
  rt_perf_init(&perf);
  rt_perf_conf(&perf, (1<<RT_PERF_CYCLES) | (1<<RT_PERF_INSTR));
  rt_perf_reset(&perf);
  rt_perf_start(&perf);

#endif // CLPERF and not(PERF)

  // mount the cluster
  rt_cluster_mount(1, 0, 0, NULL);
  // assign the job to cluster
  rt_cluster_call(NULL, 0, cluster_entry_i32, NULL, NULL, 0, 0, 0, NULL);
  // unmount the cluster
  rt_cluster_mount(0, 0, 0, NULL);

#if defined(CLPERF) && !defined(PERF)

  rt_perf_stop(&perf);

  printf("Total cycles: %d\n", rt_perf_read(RT_PERF_CYCLES));
  printf("Instructions: %d\n", rt_perf_read(RT_PERF_INSTR));

#endif // CLPERF and not(PERF)

  printf("\nCluster shut down\n\n");

  return 0;

}
