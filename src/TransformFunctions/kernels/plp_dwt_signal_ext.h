/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_signal_ext.h
 * Description:  Signal Edge extension algorithms
 *
 * $Date:        10. Juli 2021
 * $Revision:    V1
 *
 * -------------------------------------------------------------------- */
/*
 * Copyright (C) 2021 ETH Zurich and University of Bologna. All rights reserved.
 *
 * Author: Jakub Mandula, ETH Zurich
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


/* Edge Extension Modes
 * ====================
 *  
 * These Macros implement the various edge extension modes for the Left and Right 
 * case. They don't contain any optimization, only the required edge sample 
 * calculations.
 * 
 * In order to work MAC and MSU must be defined describing code for a:
 *  - Multiply Accumulator
 *  - Multiply Subtractor
 * 
 */

/********************************************************************************
 *  Left Edge Cases
 * *****************************************************************************/
#define CONSTANT_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)     \
    for(; J < WAVELET.length ; J++){                                            \
        MAC(SUM_LO, WAVELET.dec_lo[J], SRC[0]);                                 \
        MAC(SUM_HI, WAVELET.dec_hi[J], SRC[0]);                                 \
    }                                                                           \


#define SYMMETRIC_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)    \
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=0; k < length && J < WAVELET.length; k++, J++) {                  \
            MAC(SUM_LO, WAVELET.dec_lo[J], SRC[k]);                             \
            MAC(SUM_HI, WAVELET.dec_hi[J], SRC[k]);                             \
        }                                                                       \
        for(k=0; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1-k]);                    \
            MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1-k]);                    \
        }                                                                       \
    }                                                                           \


#define REFLECT_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)      \
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=1; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            MAC(SUM_LO, WAVELET.dec_lo[J], SRC[k]);                             \
            MAC(SUM_HI, WAVELET.dec_hi[J], SRC[k]);                             \
        }                                                                       \
        for(k=1; k < LENGTH && J< WAVELET.length; k++, J++) {                   \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1-k]);                    \
            MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1-k]);                    \
        }                                                                       \
    }                                                                           \


#define ANTISYMMETRIC_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)\
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=0; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            MSU(SUM_LO, WAVELET.dec_lo[J], SRC[k]);                             \
            MSU(SUM_HI, WAVELET.dec_hi[J], SRC[k]);                             \
        }                                                                       \
        for(k=0; k < LENGTH && J< WAVELET.length; k++, J++) {                   \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1-k]);                    \
            MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1-k]);                    \
        }                                                                       \
    }                                                                           \

#define ANTIREFLECT_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET, TYPE)\
{                                                                               \
    TYPE left_edge = SRC[0];                                                    \
    TYPE tmp = 0;                                                               \
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=1; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            tmp = left_edge - (SRC[k] - SRC[0]);                                \
            MAC(SUM_LO, WAVELET.dec_lo[J], tmp);                                \
            MAC(SUM_HI, WAVELET.dec_hi[J], tmp);                                \
        }                                                                       \
        left_edge = tmp;                                                        \
        for(k=1; k < LENGTH && J< WAVELET.length; k++, J++) {                   \
            tmp = left_edge + (SRC[LENGTH-1-k] - SRC[LENGTH-1]);                \
            MAC(SUM_LO, WAVELET.dec_lo[J], tmp);                                \
            MAC(SUM_HI, WAVELET.dec_hi[J], tmp);                                \
        }                                                                       \
        left_edge = tmp;                                                        \
    }                                                                           \
}                                                                               \


/********************************************************************************
 *  Right Edge Cases
 * *****************************************************************************/
#define CONSTANT_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)    \
    for(; OFFSET - J >= LENGTH ; J++){                                          \
        MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1]);                          \
        MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1]);                          \
    }                                                                           \


#define SYMMETRIC_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)   \
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
        }                                                                       \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[k]);           \
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[k]);           \
        }                                                                       \
    }                                                                           \


#define REFLECT_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)     \
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
        }                                                                       \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[k]);           \
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[k]);           \
        }                                                                       \
    }                                                                           \


#define ANTISYMMETRIC_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)\
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
            MSU(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
            MSU(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
        }                                                                       \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[k]);           \
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[k]);           \
        }                                                                       \
    }                                                                           \


#define ANTIREFLECT_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET, TYPE) \
{                                                                               \
    TYPE right_edge = SRC[LENGTH -1];                                           \
    TYPE tmp = 0;                                                               \
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
            tmp = right_edge - (SRC[LENGTH-1-k] - SRC[LENGTH-1]);               \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], tmp);              \
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], tmp);              \
        }                                                                       \
        right_edge = tmp;                                                       \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
            tmp = right_edge + (SRC[k] - SRC[0]);                               \
            MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], tmp);              \
            MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], tmp);              \
        }                                                                       \
        right_edge = tmp;                                                       \
    }                                                                           \
}                                                                               \



