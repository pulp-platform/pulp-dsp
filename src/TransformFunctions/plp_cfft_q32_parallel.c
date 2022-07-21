/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_q32_parallel.c
 * Description:  16-bit fixed point Fast Fourier Transform on Complex Input Data
 *
 * $Date:        16. May 2022
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Marco Bertuletti, ETH Zurich
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
 * @ingroup groupTransforms
 */

/**
 * @addtogroup fft
 * @{
 */

/**
 * @brief      Quantized 32-bit complex fast fourier transform for XPULPV2
 *
 * @param[in]  S               points to an instance of the 32bit quantized CFFT structure
 * @param      p1              points to the complex data buffer of size <code>2*fftLen</code>. Processing occurs in-place.
 * @param[in]  ifftFlag        flag that selects forwart (ifftFlag=0) or inverse (ifftFlag=1)
 * @param[in]  bitReverseFlag  flag that enables (bitReverseFlag=1) of disables (bitReverseFlag=0) bit reversal of output.
 * @param[in]  fracBits        decimal point for right shift (input format Q(32-fracBits).fracBits)
 * @param[in]  nPE             Number of cores to use
 */

void plp_cfft_q32_parallel( const plp_cfft_instance_q32 *S,
                            int32_t *p1,
                            uint8_t ifftFlag,
                            uint8_t bitReverseFlag,
                            uint32_t fracBits,
                            uint32_t nPE ){

	if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {
        plp_cfft_instance_q32_parallel args = {
            .S = S, .p1 = p1, .ifftFlag = ifftFlag, .bitReverseFlag = bitReverseFlag, .fracBits = fracBits, .nPE = nPE
        };

        hal_cl_team_fork(nPE, plp_cfft_q32p_xpulpv2, (void *)&args);
    }
}

/**
 * @} end of FFT group
 */
