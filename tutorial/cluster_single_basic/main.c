#include "rtos_hal.h"
#include "stdio.h"
#include "cluster.h"
#include "defines.h"

int main(){

  int32_t result=0;

  printf("\nActivating cluster for computing i32 dot prod on single CV32E40P core\n\n");

  // mount the cluster
  rt_cluster_mount(1, 0, 0, NULL);
  // assign the job to cluster
  rt_cluster_call(NULL, 0, cluster_entry_i32, NULL, NULL, 0, 0, 0, NULL);
  // unmount the cluster
  rt_cluster_mount(0, 0, 0, NULL);

  printf("\nCluster shut down\n\n");

  return 0;

}
