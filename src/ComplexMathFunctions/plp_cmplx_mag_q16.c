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
 * @brief      calculates the complex magnitude. 
 *
 * @param[in]  pSrc        The source
 * @param[in]  deciPoint   The decimal point. Fromat: Q(16-deciPoint).deciPoint
 * @param      pRes        The result
 * @param[in]  numSamples  The number of samples
 */

void plp_cmplx_mag_q16(
	const int16_t * pSrc,
	const uint32_t deciPoint, 
	int16_t * pRes,
	uint32_t numSamples){

	// Initial implementation, needs improvement
	int16_t real, cmplx, sqr;
	for (int i = 0; i < numSamples; i++) {

		real = (pSrc[2*i] * pSrc[2*i])>>16;
		cmplx = (pSrc[2*i + 1] * pSrc[2*i + 1])>>16;
		if (deciPoint % 2 == 0) {
			sqr = __CLIP(real + cmplx, 15);
		} else {
			sqr = __CLIP((real + cmplx) << 1, 15);
		}
		plp_sqrt_q16(&sqr, 16-deciPoint, &pRes[i]);
		pRes[i] = pRes[i] << ((16-deciPoint)/2);
	}
}