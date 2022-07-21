/** ==========================================================================
 * @file     plp_common_tables.h
 * @brief    File containing extern declarations for common tables
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

#ifndef __PLP_COMMON_TABLES_H__
#define __PLP_COMMON_TABLES_H__

#include "plp_math.h"

/* Fixed-point cfft */

extern const int16_t twiddleCoef_16_q16[24];
extern const int16_t twiddleCoef_32_q16[48];
extern const int16_t twiddleCoef_64_q16[96];
extern const int16_t twiddleCoef_128_q16[192];
extern const int16_t twiddleCoef_256_q16[384];
extern const int16_t twiddleCoef_512_q16[768];
extern const int16_t twiddleCoef_1024_q16[1536];
extern const int16_t twiddleCoef_2048_q16[3072];
extern const int16_t twiddleCoef_4096_q16[6144];

extern const int32_t twiddleCoef_16_q32[24];
extern const int32_t twiddleCoef_32_q32[48];
extern const int32_t twiddleCoef_64_q32[96];
extern const int32_t twiddleCoef_128_q32[192];
extern const int32_t twiddleCoef_256_q32[384];
extern const int32_t twiddleCoef_512_q32[768];
extern const int32_t twiddleCoef_1024_q32[1536];
extern const int32_t twiddleCoef_2048_q32[3072];
extern const int32_t twiddleCoef_4096_q32[6144];

#define PLPBITREVINDEXTABLE_FIXED_16_TABLE_LENGTH ((uint16_t)12)
#define PLPBITREVINDEXTABLE_FIXED_32_TABLE_LENGTH ((uint16_t)24)
#define PLPBITREVINDEXTABLE_FIXED_64_TABLE_LENGTH ((uint16_t)56)
#define PLPBITREVINDEXTABLE_FIXED_128_TABLE_LENGTH ((uint16_t)112)
#define PLPBITREVINDEXTABLE_FIXED_256_TABLE_LENGTH ((uint16_t)240)
#define PLPBITREVINDEXTABLE_FIXED_512_TABLE_LENGTH ((uint16_t)480)
#define PLPBITREVINDEXTABLE_FIXED_1024_TABLE_LENGTH ((uint16_t)992)
#define PLPBITREVINDEXTABLE_FIXED_2048_TABLE_LENGTH ((uint16_t)1984)
#define PLPBITREVINDEXTABLE_FIXED_4096_TABLE_LENGTH ((uint16_t)4032)

extern const uint16_t plpBitRevIndexTable_fixed_16[PLPBITREVINDEXTABLE_FIXED_16_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_32[PLPBITREVINDEXTABLE_FIXED_32_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_64[PLPBITREVINDEXTABLE_FIXED_64_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_128[PLPBITREVINDEXTABLE_FIXED_128_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_256[PLPBITREVINDEXTABLE_FIXED_256_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_512[PLPBITREVINDEXTABLE_FIXED_512_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_1024[PLPBITREVINDEXTABLE_FIXED_1024_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_2048[PLPBITREVINDEXTABLE_FIXED_2048_TABLE_LENGTH];
extern const uint16_t plpBitRevIndexTable_fixed_4096[PLPBITREVINDEXTABLE_FIXED_4096_TABLE_LENGTH];

/* Floating-point cfft */

extern const Complex_type_f32 twiddleCoef_cfft_16[16];
extern const Complex_type_f32 twiddleCoef_cfft_32[32];
extern const Complex_type_f32 twiddleCoef_cfft_64[64];
extern const Complex_type_f32 twiddleCoef_cfft_128[128];
extern const Complex_type_f32 twiddleCoef_cfft_256[256];
extern const Complex_type_f32 twiddleCoef_cfft_512[512];
extern const Complex_type_f32 twiddleCoef_cfft_1024[1024];
extern const Complex_type_f32 twiddleCoef_cfft_2048[2048];

/* Floating-point rfft */

extern const uint16_t plpBitRevIndexTable_rfftfast_16[20];
extern const uint16_t plpBitRevIndexTable_rfftfast_32[48];
extern const uint16_t plpBitRevIndexTable_rfftfast_64[56];
extern const uint16_t plpBitRevIndexTable_rfftfast_128[208];
extern const uint16_t plpBitRevIndexTable_rfftfast_256[440];
extern const uint16_t plpBitRevIndexTable_rfftfast_512[448];
extern const uint16_t plpBitRevIndexTable_rfftfast_1024[1800];

extern const Complex_type_f32 twiddleCoef_rfftfast_32[16];
extern const Complex_type_f32 twiddleCoef_rfftfast_64[32];
extern const Complex_type_f32 twiddleCoef_rfftfast_128[64];
extern const Complex_type_f32 twiddleCoef_rfftfast_256[128];
extern const Complex_type_f32 twiddleCoef_rfftfast_512[256];
extern const Complex_type_f32 twiddleCoef_rfftfast_1024[512];
extern const Complex_type_f32 twiddleCoef_rfftfast_2048[1024];

extern const Complex_type_f32 twiddleCoef_rfft_32[16];
extern const Complex_type_f32 twiddleCoef_rfft_64[32];
extern const Complex_type_f32 twiddleCoef_rfft_128[64];
extern const Complex_type_f32 twiddleCoef_rfft_256[128];
extern const Complex_type_f32 twiddleCoef_rfft_512[256];
extern const Complex_type_f32 twiddleCoef_rfft_1024[512];
extern const Complex_type_f32 twiddleCoef_rfft_2048[1024];


extern short bit_rev_radix2_LUT_32[32];
extern short bit_rev_radix2_LUT_64[64];
extern short bit_rev_radix2_LUT_128[128];
extern short bit_rev_radix2_LUT_256[256];
extern short bit_rev_radix2_LUT_512[512];
extern short bit_rev_radix2_LUT_1024[1024];
extern short bit_rev_radix2_LUT_2048[2048];

extern short bit_rev_radix4_LUT_256[256];
extern short bit_rev_radix4_LUT_1024[1024];

extern short bit_rev_radix8_LUT_16[16];
extern short bit_rev_radix8_LUT_64[64];
extern short bit_rev_radix8_LUT_512[512];

extern short bit_rev_radix_2by4_LUT_32[32];
extern short bit_rev_radix_2by4_LUT_128[128];
extern short bit_rev_radix_2by4_LUT_2048[2048];

extern const float32_t sinTable_f32[FAST_MATH_TABLE_SIZE + 1];
extern const int32_t sinTable_q32[FAST_MATH_TABLE_SIZE + 1];
extern const int16_t sinTable_q16[FAST_MATH_TABLE_SIZE + 1];

extern const float32_t melFbTable_f32_23[25];
extern const float32_t melFbTable_f32_26[28];
extern const float32_t melFbTable_f32_32[34];

extern const uint16_t filterLengths_fb_32[32];
extern const uint16_t startingIndices_fb_32[32];
extern const float32_t values_fb_32[245];

extern const float32_t hannWindow_f32_len512[512];
#endif // PLP_COMMON_TABLES_H
