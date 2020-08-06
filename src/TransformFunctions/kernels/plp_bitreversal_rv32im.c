/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_bitreversal_rv32im.c
 * Description:  Bitreversal functions
 *
 * $Date:        3. July 2020
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
  @brief         In-place 16 bit reversal function.
  @param[in,out] pSrc        points to in-place buffer of unknown 16-bit data type
  @param[in]     bitRevLen   bit reversal table length
  @param[in]     pBitRevTab  points to bit reversal table
  @return        none
*/

void plp_bitreversal_16s_rv32im(uint16_t *pSrc,
                                const uint16_t bitRevLen,
                                const uint16_t *pBitRevTab) {
    uint16_t a, b, i, tmp;

    for (i = 0; i < bitRevLen; i += 2) {
        a = pBitRevTab[i] >> 2;
        b = pBitRevTab[i + 1] >> 2;

        // real
        tmp = pSrc[a];
        pSrc[a] = pSrc[b];
        pSrc[b] = tmp;

        // complex
        tmp = pSrc[a + 1];
        pSrc[a + 1] = pSrc[b + 1];
        pSrc[b + 1] = tmp;

        // i += 2;
    }
}

/**
  @brief         In-place 32 bit reversal function.
  @param[in,out] pSrc        points to in-place buffer of unknown 32-bit data type
  @param[in]     bitRevLen   bit reversal table length
  @param[in]     pBitRevTab  points to bit reversal table
  @return        none
*/

void plp_bitreversal_32s_rv32im(uint32_t *pSrc,
                                const uint16_t bitRevLen,
                                const uint16_t *pBitRevTab) {
    uint32_t a, b, i, tmp;

    for (i = 0; i < bitRevLen; i+= 2)
    {
        a = pBitRevTab[i    ] >> 2;
        b = pBitRevTab[i + 1] >> 2;

        //real
        tmp = pSrc[a];
        pSrc[a] = pSrc[b];
        pSrc[b] = tmp;

        //complex
        tmp = pSrc[a+1];
        pSrc[a+1] = pSrc[b+1];
        pSrc[b+1] = tmp;

        // i += 2;
    }
}

/**
 * @} end of FFT group
 */
