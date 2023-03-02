/** ==========================================================================
 * @file     plp_helpers.h
 * @brief    File containing constant structs, initialized for user convenience
 * @version  V0
 * @date     28. June 2020
 * =========================================================================== */
/*
 * Copyright (C) 2020 ETH Zurich and University of Bologna. All rights reserved.
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


/* Macros for pulp builtins */
// add two signed 4-bit integers
#define add8(a, b)                                             __builtin_pulp_add8(a, b)
// add two unsigned 4-bit integers
#define addu8(a, b)                                            __builtin_pulp_adduN(a, b, 4)

/* Helper functions for debugging purposes */
// print binary representation of a 32-bit integer
void bin32(int32_t n)
{
    unsigned i;
    for (i = 1 << 31; i > 0; i = i / 2) {
        (n & i) ? printf("1") : printf("0");
    }
    printf("\n");
    
}

// print binary representation of a 8 x 4-bit integer vector
void bin32_4vec(int32_t n)
{
    printf("[ ");
    for(int j=0; j<8; j++) {
        for (int i = 1 << 3; i > 0; i = i / 2) {
            (n & i) ? printf("1") : printf("0");
        }
        printf(" ");
        n = n >> 4;
    }
    printf("]\n");
    
}