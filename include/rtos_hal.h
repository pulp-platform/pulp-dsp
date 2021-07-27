#ifndef _RTOS_HAL_H
#define _RTOS_HAL_H

#ifdef RTOS_PMSIS

#include "pmsis.h"

#define HAL_L1 PI_CL_L1 
#define HAL_CL_L1 PI_CL_L1 
#define HAL_L2 PI_L2

static inline uint32_t hal_cl_nb_pe_cores(){
  return pi_cl_cluster_nb_pe_cores();
}

static inline void hal_team_barrier()
{
  pi_cl_team_barrier(0); 
}

static inline void hal_cl_team_fork(int nb_cores, void (*entry)(void *), void *arg)
{
  pi_cl_team_fork(nb_cores, entry, arg);
}


/* MEMORY ALLOCATION */

static inline void * hal_fc_l1_malloc(int size)
{
  return pi_fc_l1_malloc(size);
}

static inline void hal_fc_l1_free(void *chunk, int size)
{
  pi_fc_l1_free(chunk, size);
}

static inline void * hal_cl_l1_malloc(int size)
{
  return pi_cl_l1_malloc(0, size);
}

static inline void hal_cl_l1_free(void *chunk, int size)
{
  pi_cl_l1_free(0, chunk, size);
}


/* DMA */

#define HAL_CL_DMA_DIR_EXT2LOC PI_CL_DMA_DIR_EXT2LOC
#define HAL_CL_DMA_DIR_LOC2EXT PI_CL_DMA_DIR_LOC2EXT

typedef pi_cl_dma_cmd_t hal_cl_dma_cmd_t;

typedef pi_cl_dma_dir_e hal_cl_dma_dir_e;

static inline void hal_cl_dma_cmd(uint32_t ext, uint32_t loc, uint32_t size, hal_cl_dma_dir_e dir, int merge __attribute__((unused)), hal_cl_dma_cmd_t * cmd)
{
  pi_cl_dma_cmd(ext, loc, size, dir, cmd);
}

static inline void hal_cl_dma_cmd_wait(hal_cl_dma_cmd_t * cmd)
{
  pi_cl_dma_cmd_wait(cmd);
}


/* PERFORMANCE COUNTERS */

#define HAL_PERF_CYCLES PI_PERF_CYCLES
#define HAL_PERF_ACTIVE_CYCLES PI_PERF_ACTIVE_CYCLES
#define HAL_PERF_INSTR PI_PERF_INSTR
#define HAL_PERF_LD_STALL PI_PERF_LD_STALL
#define HAL_PERF_JR_STALL PI_PERF_JR_STALL
#define HAL_PERF_IMISS PI_PERF_IMISS
#define HAL_PERF_WBRANCH PI_PERF_WBRANCH
#define HAL_PERF_WBRANCH_CYC PI_PERF_WBRANCH_CYC
#define HAL_PERF_LD PI_PERF_LD
#define HAL_PERF_ST PI_PERF_ST
#define HAL_PERF_JUMP PI_PERF_JUMP
#define HAL_PERF_BRANCH PI_PERF_BRANCH
#define HAL_PERF_DELAY_NOP PI_PERF_DELAY_NOP
#define HAL_PERF_LD_EXT_CYC PI_PERF_LD_EXT_CYC
#define HAL_PERF_ST_EXT_CYC PI_PERF_ST_EXT_CYC
#define HAL_PERF_TCDM_CONT PI_PERF_TCDM_CONT

typedef int hal_perf_t;


static inline void hal_perf_init(hal_perf_t * perf __attribute__((unused)))
{
}

static inline void hal_perf_conf(hal_perf_t * perf __attribute__((unused)), unsigned events)
{
  pi_perf_conf(events);
}

static inline void hal_perf_reset(hal_perf_t * perf __attribute__((unused)))
{
  pi_perf_reset();
}

static inline void hal_perf_start(hal_perf_t * perf __attribute__((unused)))
{
  pi_perf_start();
}


static inline void hal_perf_stop(hal_perf_t * perf __attribute__((unused)))
{
  pi_perf_stop();
}

static inline unsigned int hal_perf_read(int id)
{
  return pi_perf_read(id);
}





#else /* PULP-RT */

#include "rt/rt_api.h"

#define HAL_L1 RT_CL_DATA
#define HAL_CL_L1 RT_CL_DATA
#define HAL_L2 RT_L2_DATA

static inline uint32_t hal_cl_nb_pe_cores(){
  return rt_nb_pe();
}

static inline void hal_team_barrier()
{
  rt_team_barrier();
}


static inline void hal_cl_team_fork(int nb_cores, void (*entry)(void *), void *arg)
{
  rt_team_fork(nb_cores, entry, arg);
}


/* MEMORY ALLOCATION */

static inline void * hal_fc_l1_malloc(int size)
{
  return rt_alloc(RT_ALLOC_FC_DATA, size);
}	

static inline void hal_fc_l1_free(void *chunk, int size)
{
  rt_free(RT_ALLOC_FC_DATA, chunk, size);
}

static inline void * hal_cl_l1_malloc(int size)
{
  return rt_alloc(RT_ALLOC_CL_DATA, size);
}

static inline void hal_cl_l1_free(void *chunk, int size)
{
  rt_free(RT_ALLOC_CL_DATA, chunk, size);
}


/* DMA */

#define HAL_CL_DMA_DIR_EXT2LOC RT_DMA_DIR_EXT2LOC 
#define HAL_CL_DMA_DIR_LOC2EXT RT_DMA_DIR_LOC2EXT

typedef rt_dma_copy_t hal_cl_dma_cmd_t;

typedef rt_dma_dir_e hal_cl_dma_dir_e;

static inline void hal_cl_dma_cmd(uint32_t ext, uint32_t loc, uint32_t size, hal_cl_dma_dir_e dir, int merge, hal_cl_dma_cmd_t * cmd)
{
  rt_dma_memcpy(ext, loc, size, dir, merge, cmd);
}

static inline void hal_cl_dma_cmd_wait(hal_cl_dma_cmd_t * cmd)
{
  rt_dma_wait(cmd);
}


/* PERFORMANCE COUNTERS */

#define HAL_PERF_CYCLES RT_PERF_CYCLES
#define HAL_PERF_ACTIVE_CYCLES RT_PERF_ACTIVE_CYCLES
#define HAL_PERF_INSTR RT_PERF_INSTR
#define HAL_PERF_LD_STALL RT_PERF_LD_STALL
#define HAL_PERF_JR_STALL RT_PERF_JR_STALL
#define HAL_PERF_IMISS RT_PERF_IMISS
#define HAL_PERF_WBRANCH RT_PERF_WBRANCH
#define HAL_PERF_WBRANCH_CYC RT_PERF_WBRANCH_CYC
#define HAL_PERF_LD RT_PERF_LD
#define HAL_PERF_ST RT_PERF_ST
#define HAL_PERF_JUMP RT_PERF_JUMP
#define HAL_PERF_BRANCH RT_PERF_BRANCH
#define HAL_PERF_DELAY_NOP RT_PERF_DELAY_NOP
#define HAL_PERF_LD_EXT_CYC RT_PERF_LD_EXT_CYC
#define HAL_PERF_ST_EXT_CYC RT_PERF_ST_EXT_CYC
#define HAL_PERF_TCDM_CONT RT_PERF_TCDM_CONT

typedef rt_perf_t hal_perf_t;

static inline void hal_perf_init(hal_perf_t * perf)
{
  rt_perf_init(perf);
}

static inline void hal_perf_conf(hal_perf_t * perf, unsigned events)
{
  rt_perf_conf(perf, events);
}

static inline void hal_perf_reset(hal_perf_t * perf)
{
  rt_perf_reset(perf);
}

static inline void hal_perf_start(hal_perf_t * perf)
{
  rt_perf_start(perf);
}


static inline void hal_perf_stop(hal_perf_t * perf)
{
  rt_perf_stop(perf);
}

static inline unsigned int hal_perf_read(int id)
{
  return rt_perf_read(id);
}


#endif /* PULP-RT */

#endif
