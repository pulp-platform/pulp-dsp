#include "rt/rt_api.h"
#include "stdio.h"
#include "cluster.h"
int main(){
    rt_cluster_mount(1, 0, 0, NULL);
    rt_cluster_call(NULL, 0, cluster_entry, NULL, NULL, 0, 0, 0, NULL);
    rt_cluster_mount(0, 0, 0, NULL);
    return 0;
}
