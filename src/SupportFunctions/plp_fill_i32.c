/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_fill_i32.c
 * Description:  Glue code for filling a constant value into a 32-bit integer vector
 *
 * $Date:        02. June 2019
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2019 ETH Zurich. All rights reserved.
 *
 * Author: Xiaying Wang
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "plp_math.h"

/**
  @ingroup groupSupport
 */

/**
  @defgroup Fill Vector Fill
  Fills the destination vector with a constant value.
  <pre>
      pDst[n] = value;   0 <= n < blockSize.
  </pre>
  There are separate functions for floating point, integer, and fixed point 32- 16- 8-bit data types. For lower precision integers (16- and 8-bit), functions exploiting SIMD instructions are provided.

  The naming scheme of the functions follows the following pattern (for example plp_dot_prod_i32s):
  <pre>
  <pulp> _ <function name> _ <data type> <precision> <method> _ <isa extension>, with

  data type = {f, i, q} respectively for floats, integers, fixed points

  precision = {32, 16, 8} bits

  method = {s, v, p} meaning single (or scalar, i.e. not using packed SIMD), vectorized (i.e. using SIMD instructions), and parallel (for multicore parallel computing), respectively.

  isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

 */

/**
  @addtogroup Fill
  @{
 */

/**
  @brief         Glue code for filling a constant value into a 32-bit integer vector.
  @param[in]     value      input value to be filled
  @param[out]    pDst       points to output vector
  @param[in]     blockSize  number of samples in each vector
  @return        none
 */

void plp_fill_i32(
                  int32_t value,
                  int32_t * __restrict__ pDst,
                  uint32_t blockSize){

  uint32_t blkCnt;                               /* Loop counter */

  if (rt_cluster_id() == ARCHI_FC_CID){
    plp_fill_i32s_rv32im(value, pDst, blockSize);
  }
  else{
    plp_fill_i32s_xpulpv2(value, pDst, blockSize);
  }

}

/**
  @} end of Fill group
 */
