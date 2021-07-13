/** ==========================================================================
 * @file     plp_const_structs.c
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

#include "plp_const_structs.h"
#include "plp_common_tables.h"

const plp_cfft_instance_q16 plp_cfft_sR_q16_len16 = { 16, twiddleCoef_16_q16,
                                                      plpBitRevIndexTable_fixed_16,
                                                      PLPBITREVINDEXTABLE_FIXED_16_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len32 = { 32, twiddleCoef_32_q16,
                                                      plpBitRevIndexTable_fixed_32,
                                                      PLPBITREVINDEXTABLE_FIXED_32_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len64 = { 64, twiddleCoef_64_q16,
                                                      plpBitRevIndexTable_fixed_64,
                                                      PLPBITREVINDEXTABLE_FIXED_64_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len128 = { 128, twiddleCoef_128_q16,
                                                       plpBitRevIndexTable_fixed_128,
                                                       PLPBITREVINDEXTABLE_FIXED_128_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len256 = { 256, twiddleCoef_256_q16,
                                                       plpBitRevIndexTable_fixed_256,
                                                       PLPBITREVINDEXTABLE_FIXED_256_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len512 = { 512, twiddleCoef_512_q16,
                                                       plpBitRevIndexTable_fixed_512,
                                                       PLPBITREVINDEXTABLE_FIXED_512_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len1024 = { 1024, twiddleCoef_1024_q16, 
                                                        plpBitRevIndexTable_fixed_1024,
                                                        PLPBITREVINDEXTABLE_FIXED_1024_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len2048 = { 2048, twiddleCoef_2048_q16,
                                                        plpBitRevIndexTable_fixed_2048,
                                                        PLPBITREVINDEXTABLE_FIXED_2048_TABLE_LENGTH };

const plp_cfft_instance_q16 plp_cfft_sR_q16_len4096 = { 4096, twiddleCoef_4096_q16,
                                                        plpBitRevIndexTable_fixed_4096,
                                                        PLPBITREVINDEXTABLE_FIXED_4096_TABLE_LENGTH };


const plp_cfft_instance_q32 plp_cfft_sR_q32_len16 = { 16, twiddleCoef_16_q32,
                                                      plpBitRevIndexTable_fixed_16,
                                                      PLPBITREVINDEXTABLE_FIXED_16_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len32 = { 32, twiddleCoef_32_q32,
                                                      plpBitRevIndexTable_fixed_32,
                                                      PLPBITREVINDEXTABLE_FIXED_32_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len64 = { 64, twiddleCoef_64_q32,
                                                      plpBitRevIndexTable_fixed_64,
                                                      PLPBITREVINDEXTABLE_FIXED_64_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len128 = { 128, twiddleCoef_128_q32,
                                                       plpBitRevIndexTable_fixed_128,
                                                       PLPBITREVINDEXTABLE_FIXED_128_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len256 = { 256, twiddleCoef_256_q32,
                                                       plpBitRevIndexTable_fixed_256,
                                                       PLPBITREVINDEXTABLE_FIXED_256_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len512 = { 512, twiddleCoef_512_q32,
                                                       plpBitRevIndexTable_fixed_512,
                                                       PLPBITREVINDEXTABLE_FIXED_512_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len1024 = { 1024, twiddleCoef_1024_q32, 
                                                        plpBitRevIndexTable_fixed_1024,
                                                        PLPBITREVINDEXTABLE_FIXED_1024_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len2048 = { 2048, twiddleCoef_2048_q32,
                                                        plpBitRevIndexTable_fixed_2048,
                                                        PLPBITREVINDEXTABLE_FIXED_2048_TABLE_LENGTH };

const plp_cfft_instance_q32 plp_cfft_sR_q32_len4096 = { 4096, twiddleCoef_4096_q32,
                                                        plpBitRevIndexTable_fixed_4096,
                                                        PLPBITREVINDEXTABLE_FIXED_4096_TABLE_LENGTH };


const plp_fft_instance_f32 plp_rfft_sR_f32_len32 = { 32, 0, (float32_t *)twiddleCoef_rfft_32,
                                                        (uint16_t *)bit_rev_radix2_LUT_32 };

const plp_fft_instance_f32 plp_rfft_sR_f32_len128 = { 128, 0, (float32_t *)twiddleCoef_rfft_128,
                                                        (uint16_t *)bit_rev_radix2_LUT_128 };

const plp_fft_instance_f32 plp_rfft_sR_f32_len512 = { 512, 0, (float32_t *)twiddleCoef_rfft_512,
                                                        (uint16_t *)bit_rev_radix2_LUT_512 };

const plp_fft_instance_f32 plp_rfft_sR_f32_len2048 = { 2048, 0, (float32_t *)twiddleCoef_rfft_2048,
                                                        (uint16_t *)bit_rev_radix2_LUT };

const plp_triangular_filter_f32 plp_triangular_filter_f32_32 = {
	values_fb_32,
	startingIndices_fb_32,
	filterLengths_fb_32,
	32
};


const plp_dwt_wavelet_f32 PLP_DWT_HAAR_f32 = {
   .length = 2,
   .type = PLP_DWT_WAVELET_HAAR,
   .dec_lo = (float32_t []){  0.7071067811865476f, 0.7071067811865476f },
   .dec_hi = (float32_t []){ -0.7071067811865476f, 0.7071067811865476f }
};


const plp_dwt_wavelet_f32 PLP_DWT_DB1_f32 = {
   .length = 2,
   .type = PLP_DWT_WAVELET_DB1,
   .dec_lo = (float32_t []){  0.7071067811865476f, 0.7071067811865476f },
   .dec_hi = (float32_t []){ -0.7071067811865476f, 0.7071067811865476f }
};


const plp_dwt_wavelet_f32 PLP_DWT_DB2_f32 = {
   .length = 4,
   .type = PLP_DWT_WAVELET_DB2,
   .dec_lo = (float32_t []){  
       -0.12940952255092145f,
        0.22414386804185735f,
        0.836516303737469f,
        0.48296291314469025f
        },
   .dec_hi = (float32_t []){ 
       -0.48296291314469025f,
        0.836516303737469f,
        -0.22414386804185735f,
        -0.12940952255092145f
        }
};


const plp_dwt_wavelet_f32 PLP_DWT_DB3_f32 = {
   .length = 6,
   .type = PLP_DWT_WAVELET_DB3,
   .dec_lo = (float32_t []){
        0.035226291882100656f,
        -0.08544127388224149f,
        -0.13501102001039084f,
        0.4598775021193313f,
        0.8068915093133388f,
        0.3326705529509569f
        },
   .dec_hi = (float32_t []){ 
        -0.3326705529509569f,
        0.8068915093133388f,
        -0.4598775021193313f,
        -0.13501102001039084f,
        0.08544127388224149f,
        0.035226291882100656f
        }
};

const plp_dwt_wavelet_f32 PLP_DWT_DB4_f32 = {
   .length = 8,
   .type = PLP_DWT_WAVELET_DB4,
   .dec_lo = (float32_t []){  
        -0.010597401784997278f,
        0.032883011666982945f,
        0.030841381835986965f,
        -0.18703481171888114f,
        -0.02798376941698385f,
        0.6308807679295904f,
        0.7148465705525415f,
        0.23037781330885523f
        },
   .dec_hi = (float32_t []){ 
        -0.23037781330885523f,
        0.7148465705525415f,
        -0.6308807679295904f,
        -0.02798376941698385f,
        0.18703481171888114f,
        0.030841381835986965f,
        -0.032883011666982945f,
        -0.010597401784997278f
        }
};
