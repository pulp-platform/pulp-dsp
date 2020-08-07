#include "rt/rt_api.h"
#include "stdio.h"
#include "cluster.h"

#define STACK_SIZE      1024

int main(){

  // Before being used, the cluster must be mounter, for example in case it must be
  // turned on.
  rt_cluster_mount(1, 0, 0, NULL);

    void *stacks = rt_alloc(RT_ALLOC_CL_DATA, STACK_SIZE*rt_nb_pe());
  if (stacks == NULL) return -1;

  // This is the most basic call we can do to the cluster with all default
  // parameters (default stack size, max number of cores, etc) and is
  // synchronous (last event parameter is NULL) which means we are blocked
  // until the call is finished
  rt_cluster_call(NULL, 0, cluster_entry, NULL, stacks, STACK_SIZE, STACK_SIZE, 0, NULL);

  // It must then be unmounted when it is not needed anymore so that it is turned off
  rt_cluster_mount(0, 0, 0, NULL);


  return 0;

}
