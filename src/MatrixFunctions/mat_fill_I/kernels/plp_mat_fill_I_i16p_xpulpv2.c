/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_fill_I_i16p_xpulpv2.c
 * Description:  parallel 16-bit integer identity matrix creation for XPULPV2
 *
 * $Date:        16. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and Ubiversity of Bologna. All rights reserved.
 *
 * Author: Tibor Schneider, ETH Zurich
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
  @ingroup MatFillI
 */

/**
  @addtogroup MatFillIKernels
  @{
 */

/**
  @brief      Create a 16-bit integer identity matrix in parallel on XpulpV2
  @param[in]  args  pointer to plp_mat_fill_I_instance_i16 struct initialized by
                    plp_mat_fill_I_i16_parallel
  @return     none

  @par Exploiting SIMD instructions
  The 16 bit values are packed two each into 32 bit vectors and then the two dot products are
  performed on 32 bit vectors, with 32 bit accumulator.
*/

void plp_mat_fill_I_i16p_xpulpv2(void *args) {

    int core_id = hal_core_id();

    plp_mat_fill_I_instance_i16 *a = (plp_mat_fill_I_instance_i16 *)args;

    uint32_t N = a->N;
    uint32_t nPE = a->nPE;
    int16_t *__restrict__ pDst = a->pDst;

#define BASIC_VERSION // if used don't forget to also use the undefine at end of file
#ifdef BASIC_VERSION

    for (int i = core_id; i < N; i += nPE) {
        for (int j = 0; j < N; j++) {
            pDst[i * N + j] = (int16_t)(i == j);
        }
    }

#else

    // TODO: Hackathon

#endif
#undef BASIC_VERSION
}

/**
   @} end of MatFillIKernels group
*/
