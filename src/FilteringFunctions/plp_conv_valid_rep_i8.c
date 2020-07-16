/* =====================================================================
 * Project:      PULP DSP Library
 * Title:        plp_dot_prod_i8.c
 * Description:  8-bit integer convolution (valid with data replication)
 *               glue code
 *
 * $Date:        24. April 2020
 * $Revision:    V0
 *
 * Target Processor: PULP cores
 * ===================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna.
 *
 * Author: Moritz Scherer, Tibor Schneider
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
 * @ingroup groupFilters
 */

/**
 * @addtogroup BasicConvolution
 * @{
 */

/**
 * @brief Glue code for convolution of 8-bit integer vectors in valid range.
 * @param[in]  pSrcA   points to the first input vector, must be on L2
 * @param[in]  srcALen ength of the first input vector
 * @param[in]  pSrcB   points to the second input vector, must be on L2
 * @param[in]  srcBLen Length of the second input vector
 * @param[out] pRes    output result returned here, of size |srcALen - srcBLen| + 1, preferably in
 * L1
 * @return     none
 */
void plp_conv_valid_rep_i8(const int8_t *pSrcA,
                           const uint32_t srcALen,
                           const int8_t *pSrcB,
                           const uint32_t srcBLen,
                           int32_t *pRes) {

    uint32_t in1Len, in2Len;
    const int8_t *pIn1;
    const int8_t *pIn2;

    if (srcALen >= srcBLen) {
        in1Len = srcALen;
        in2Len = srcBLen;
        pIn1 = pSrcA;
        pIn2 = pSrcB;
    } else {
        in2Len = srcALen;
        in1Len = srcBLen;
        pIn2 = pSrcA;
        pIn1 = pSrcB;
    }

    if (rt_cluster_id() == ARCHI_FC_CID) {

        printf("Errorr: Not Implemented!");

    } else {

        /*
         * because of data replication, the first copy starts at index 0, and must go up to index
         * in1Len - 4, therefore, it is in1Len - 3 long. The last copy starts at index 3 and goes
         * up to index in1Len - 1.
         */

        // compute required memory size
        uint32_t len_align = ((in1Len + 3) >> 2) << 2; // compute aligned memory size
        uint32_t mem_size = len_align << 2;            // memory size for all 4 replications

        int8_t *p_1_loc = rt_alloc(RT_ALLOC_CL_DATA, sizeof(int8_t) * mem_size);
        int8_t *p_2_loc = rt_alloc(RT_ALLOC_CL_DATA, sizeof(int8_t) * in2Len);

        if (p_1_loc == NULL || p_2_loc == NULL) {
            printf("Error: insufficient L1 memory!\n");
            return;
        }

        // copy the data over to the L1 data, replicated 4 times
        rt_dma_copy_t copy;
        int merge = 0;

        for (int i = 0; i < 4; i++) {
            rt_dma_memcpy((unsigned int)(pIn1 + i), (unsigned int)(p_1_loc + i * len_align),
                          sizeof(int8_t) * (in1Len - i), RT_DMA_DIR_EXT2LOC, merge, &copy);
            merge = 1;
        }

        rt_dma_memcpy((unsigned int)pIn2, (unsigned int)p_2_loc, sizeof(int8_t) * in2Len,
                      RT_DMA_DIR_EXT2LOC, merge, &copy);

        rt_dma_wait(&copy);

        plp_conv_valid_rep_i8s_xpulpv2(p_1_loc, in1Len, len_align, p_2_loc, in2Len, pRes);

        rt_free(RT_ALLOC_CL_DATA, p_1_loc, sizeof(int8_t) * mem_size);
        rt_free(RT_ALLOC_CL_DATA, p_2_loc, sizeof(int8_t) * in2Len);
    }
}

/**
 * @} end of BasicConvolution group
 */
