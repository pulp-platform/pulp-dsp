/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_sin_q16.c
 * Description:  Calculates sine of a q16 scaled input
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

/**
 * @brief      Glue code for q16 sine function
 *
 * @param[in]  x     Scaled input value: Q1.15 value in range [0, +0.9999] and is mapped to [0, 2*PI)
 *
 * @return     sin(x)
 */

int16_t plp_sin_q16(int16_t x){

	if (rt_cluster_id() == ARCHI_FC_CID) {
        return plp_sin_q16s_rv32im(x);
    } else {
        return plp_sin_q16s_xpulpv2(x);
    }
}
