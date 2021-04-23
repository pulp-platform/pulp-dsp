#include "rtos_hal.h"
#include "stdio.h"
#include "cluster.h"

#define STACK_SIZE      1024

int main(){
/*
  // Before being used, the cluster must be mounter, for example in case it must be
  // turned on.
  rt_cluster_mount(1, 0, 0, NULL);

    void *stacks = hal_cl_l1_malloc(STACK_SIZE*hal_cl_nb_pe_cores());
  if (stacks == NULL) return -1;

  // This is the most basic call we can do to the cluster with all default
  // parameters (default stack size, max number of cores, etc) and is
  // synchronous (last event parameter is NULL) which means we are blocked
  // until the call is finished
  rt_cluster_call(NULL, 0, cluster_entry, NULL, stacks, STACK_SIZE, STACK_SIZE, 0, NULL);

  // It must then be unmounted when it is not needed anymore so that it is turned off
  rt_cluster_mount(0, 0, 0, NULL);
*/

#ifdef RTOS_PMSIS
    struct pi_device cluster_dev = {0};
    struct pi_cluster_conf conf;
    struct pi_cluster_task cluster_task = {0};
    pi_cluster_task(&cluster_task, cluster_entry, NULL);
    pi_cluster_conf_init(&conf);
    conf.id=0;
    pi_open_from_conf(&cluster_dev, &conf);
    pi_cluster_open(&cluster_dev);
    pi_cluster_send_task_to_cl(&cluster_dev, &cluster_task);
    pi_cluster_close(&cluster_dev);
#else
    rt_cluster_mount(1, 0, 0, NULL);
    rt_cluster_call(NULL, 0, cluster_entry, NULL, NULL, 0, 0, 0, NULL);
    rt_cluster_mount(0, 0, 0, NULL);
#endif
  

  return 0;

}
