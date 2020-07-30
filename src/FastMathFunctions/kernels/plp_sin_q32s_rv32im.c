/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_cos_q32s_rv32im.c
 * Description:  Calculates cosine of a q32 scaled input for RV32IM
 *
 * $Date:        30.07.2020
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
 *
 * Notice: project inspired by ARM CMSIS DSP and parts of source code
 * ported and adopted for RISC-V PULP platform from ARM CMSIS DSP
 * released under Copyright (C) 2010-2019 ARM Limited or its affiliates
 * with Apache-2.0.
 */

#include "plp_math.h"
#include "plp_common_tables.h"

/**
 * @brief      q32 sine function for RV32IM
 *
 * @param[in]  x     Scaled input value: Q1.31 value in range [0, +0.9999] and is mapped to [0, 2*PI)
 *
 * @return     sin(x)
 */

int32_t plp_sin_q32s_rv32im(int32_t x){

    int32_t sinVal;                                  /* Temporary variables for input, output */
    int32_t index;                                   /* Index variable */
    int32_t a, b;                                    /* Two nearest output values */
    int32_t fract;                                   /* Temporary values for fractional values */

    if (x < 0)
    { /* convert negative numbers to corresponding positive ones */
        x = (uint32_t)x + 0x80000000;
    }

    /* Calculate the nearest index */
    index = (uint32_t)x >> FAST_MATH_Q32_SHIFT;

    /* Calculation of fractional value */
    fract = (x - (index << FAST_MATH_Q32_SHIFT)) << 9;

    /* Read two nearest values of input value from the sin table */
    a = sinTable_q32[index];
    b = sinTable_q32[index+1];

    /* Linear interpolation process */
    sinVal = (int64_t) (0x80000000 - fract) * a >> 32;
    sinVal = (int32_t) ((((int64_t) sinVal << 32) + ((int64_t) fract * b)) >> 32);

    /* Return output value */
    return (sinVal << 1);
}
