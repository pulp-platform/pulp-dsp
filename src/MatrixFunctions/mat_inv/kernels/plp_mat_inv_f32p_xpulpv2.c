/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_mat_inv_f32p_xpulpv2.c
 * Description:  parallel 32-bit floating-point matrix inversion for XPULPV2
 *
 * $Date:        14. July 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
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
  @ingroup MatInv
 */

/**
  @addtogroup MatInvKernels
  @{
 */

/**
   @brief Parallel matrix inversion of 32-bit floating-point matrices kernel for XPULPV2 extension.
   @param[in]  args      pointer to plp_mat_inv_instance_f32 struct initialized by plp_mat_inv_f32_parallel
   @return     0: Success, 1: Matrix is singular

   @warn Not yet implemented
*/

int plp_mat_inv_f32p_xpulpv2(void* args) {

    // TODO

    return 1;

}


/**
   @} end of MatInvKernels group
*/
