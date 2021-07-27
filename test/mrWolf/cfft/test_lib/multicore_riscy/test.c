#include "rtos_hal.h"
#include "stdio.h"
#include "cluster.h"



int main(){

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
