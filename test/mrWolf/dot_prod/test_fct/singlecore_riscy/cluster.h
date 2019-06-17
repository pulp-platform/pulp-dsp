#ifndef __INC_CLUSTER_H__
#define __INC_CLUSTER_H__

static void do_bench_0(rt_perf_t *perf, int events);
//static void cluster_entry();
void cluster_entry(void *arg);
static void do_bench_0_pe(void *arg);
//void cluster_entry(void *arg, void * v_p, void * u_p);

#endif
