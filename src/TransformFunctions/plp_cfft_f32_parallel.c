/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_cfft_f32_parallel.c
 * Description:  Floating-point FFT on complex input data (parallel version)
 *
 * $Date:        4. August 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores with "F" support (wolfe, vega)
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Giuseppe Tagliavini, University of Bologna
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
  @ingroup groupTransforms
 */

/**
  @defgroup fft  FFT transforms
  This module contains the code to perform FFT transforms.


 */

/**
   @addtogroup fft
   @{
*/

/**
   @brief Floating-point FFT on complex input data (parallel version).
   @param[in]   S       points to an instance of the floating-point FFT structure
   @param[in]   pSrc    points to the input buffer (complex data)
   @param[in]   nPE     number of parallel processing units
   @param[out]  pDst    points to the output buffer (complex data)
   @return      none
*/
void plp_cfft_f32_parallel(const plp_cfft_instance_f32 *S,
                           const float32_t *__restrict__ pSrc,
                           const uint32_t nPE,
                           float32_t *__restrict__ pDst) {

    if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("Parallel processing supported only for cluster side\n");
        return;
    }

    plp_cfft_instance_f32_parallel arg = (plp_cfft_instance_f32_parallel){ S, pSrc, nPE, pDst };

    hal_cl_team_fork(nPE, plp_cfft_f32p_xpulpv2, (void *)&arg);
}

/**
   @} end of FFT group
*/
