/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cmplx_mag_q16.c
 * Description:  Calculates the sum of squares of an input vector
 *
 * $Date:        09.07.2020
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
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
 * @brief      Glue code for complex magnitude calculation in 16-bit quantized integer
 *
 * @param[in]  pSrc        pointer to source
 * @param[in]  fracBits    fractional bits -> Q(32-fracBits).fracBits
 * @param      pRes        pointer to result
 * @param[in]  numSamples  The number of samples
 */

void plp_cmplx_mag_q16(const int16_t *pSrc,
                       const uint32_t fracBits,
                       int16_t *pRes,
                       uint32_t numSamples) {

    if (rt_cluster_id() == ARCHI_FC_CID){
        plp_cmplx_mag_q16s_rv32im(pSrc, fracBits, pRes, numSamples);
    }
    else{
        plp_cmplx_mag_q16s_xpulpv2(pSrc, fracBits, pRes, numSamples);
    }
}