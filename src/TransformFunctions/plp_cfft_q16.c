/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cfft_q16.c
 * Description:  16-bit fixed point Fast Fourier Transform on Compled Input Data
 *
 * $Date:        27. June 2020
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
 * @brief         Glue code for quantized 16 bit complex fast fourier transform
 * @param[in]     S               points to an instance of the 16bit quantized CFFT structure
 * @param[in,out] p1              points to the complex data buffer of size <code>2*fftLen</code>.
 * Processing occurs in-place.
 * @param[in]     ifftFlag        flag that selects forward (ifftFlag=0) or inverse (ifftFlag=1)
 * transform.
 * @param[in]     bitReverseFlag  flag that enables (bitReverseFlag=1) of disables
 * (bitReverseFlag=0) bit reversal of output.
 * @param[in]     deciPoint       decimal point for right shift
 */

void plp_cfft_q16(const plp_cfft_instance_q16 *S,
                  int16_t *p1,
                  uint8_t ifftFlag,
                  uint8_t bitReverseFlag,
                  uint32_t deciPoint) {

    if (deciPoint != 15) {
        printf("Only Q1.15 fixed point supported currently.\n");
        return;
    }

    if (rt_cluster_id() == ARCHI_FC_CID) {
        plp_cfft_q16s_rv32im(S, p1, ifftFlag, bitReverseFlag, deciPoint);
    } else {
        plp_cfft_q16v_xpulpv2(S, p1, ifftFlag, bitReverseFlag, deciPoint);
    }
}

/**
 * @} end of FFT group
 */
