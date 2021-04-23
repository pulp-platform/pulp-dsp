/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_q16.c
 * Description:  16-bit fixed point Fast Fourier Transform on Complex Input Data
 *
 * $Date:        05. August 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Michael Rogenmoser, ETH Zurich
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
 * @brief      Glue code for quantized 16 bit complex fast fourier transform
 *
 * Fixed point units input -> output dependent on length:
 * len=16:    Q1.15 -> Q5.11
 * len=32:    Q1.15 -> Q6.10
 * len=64:    Q1.15 -> Q7.9
 * len=128:   Q1.15 -> Q8.8
 * len=256:   Q1.15 -> Q9.7
 * len=512:   Q1.15 -> Q10.6
 * len=1024:  Q1.15 -> Q11.5
 * len=2048:  Q1.15 -> Q12.4
 * len=4096:  Q1.15 -> Q13.3
 *
 * @param[in]  		S               points to an instance of the 16bit quantized CFFT structure
 * @param[in,out] 	p1           points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]  		ifftFlag        flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]  		bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]  		deciPoint       decimal point for right shift
 * @param[in]  		nPE             Number of cores to use
 */

void plp_cfft_q16_parallel(const plp_cfft_instance_q16 *S,
                           int16_t *p1,
                           uint8_t ifftFlag,
                           uint8_t bitReverseFlag,
                           uint32_t deciPoint,
                           uint32_t nPE){

	if (hal_cluster_id() == ARCHI_FC_CID) {
        printf("parallel processing supported only for cluster side\n");
        return;
    } else {
        plp_cfft_instance_q16_parallel args = {
            .S = S, .p1 = p1, .ifftFlag = ifftFlag, .bitReverseFlag = bitReverseFlag, .deciPoint = deciPoint, .nPE = nPE
        };

        hal_cl_team_fork(nPE, plp_cfft_q16p_xpulpv2, (void *)&args);
    }
}

/**
 * @} end of FFT group
 */
