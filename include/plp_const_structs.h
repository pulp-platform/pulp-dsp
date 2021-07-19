/** ==========================================================================
 * @file     plp_const_structs.h
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

#ifndef __PLP_CONST_STRUCTS_H__
#define __PLP_CONST_STRUCTS_H__

#include "plp_common_tables.h"
#include "plp_math.h"

extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len16;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len32;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len64;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len128;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len256;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len512;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len1024;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len2048;
extern const plp_cfft_instance_q16 plp_cfft_sR_q16_len4096;

extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len16;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len32;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len64;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len128;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len256;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len512;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len1024;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len2048;
extern const plp_cfft_instance_q32 plp_cfft_sR_q32_len4096;

extern const plp_fft_instance_f32 plp_rfft_sR_f32_len32;
extern const plp_fft_instance_f32 plp_rfft_sR_f32_len128;
extern const plp_fft_instance_f32 plp_rfft_sR_f32_len512;
extern const plp_fft_instance_f32 plp_rfft_sR_f32_len2048;

extern const plp_triangular_filter_f32 plp_triangular_filter_f32_32;


extern const plp_dwt_wavelet_f32 PLP_DWT_COIF1_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF2_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF3_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF4_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF5_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF6_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF7_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF8_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF9_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF10_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF11_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF12_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF13_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF14_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF15_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF16_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_COIF17_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB1_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB2_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB3_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB4_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB5_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB6_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB7_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB8_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB9_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB10_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB11_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB12_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB13_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB14_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB15_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB16_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB17_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB18_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB19_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_DB20_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_HAAR_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM2_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM3_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM4_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM5_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM6_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM7_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM8_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM9_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM10_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM11_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM12_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM13_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM14_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM15_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM16_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM17_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM18_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM19_f32;
extern const plp_dwt_wavelet_f32 PLP_DWT_SYM20_f32;

extern const plp_dwt_wavelet_q32 PLP_DWT_COIF1_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF2_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF3_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF4_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF5_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF6_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF7_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF8_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF9_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF10_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF11_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF12_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF13_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF14_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF15_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF16_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_COIF17_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB1_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB2_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB3_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB4_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB5_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB6_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB7_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB8_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB9_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB10_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB11_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB12_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB13_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB14_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB15_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB16_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB17_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB18_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB19_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_DB20_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_HAAR_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM2_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM3_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM4_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM5_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM6_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM7_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM8_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM9_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM10_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM11_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM12_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM13_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM14_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM15_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM16_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM17_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM18_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM19_q32;
extern const plp_dwt_wavelet_q32 PLP_DWT_SYM20_q32;

extern const plp_dwt_wavelet_q16 PLP_DWT_COIF1_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF2_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF3_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF4_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF5_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF6_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF7_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF8_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF9_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF10_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF11_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF12_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF13_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF14_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF15_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF16_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_COIF17_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB1_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB2_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB3_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB4_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB5_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB6_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB7_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB8_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB9_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB10_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB11_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB12_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB13_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB14_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB15_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB16_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB17_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB18_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB19_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_DB20_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_HAAR_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM2_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM3_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM4_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM5_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM6_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM7_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM8_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM9_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM10_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM11_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM12_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM13_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM14_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM15_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM16_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM17_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM18_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM19_q16;
extern const plp_dwt_wavelet_q16 PLP_DWT_SYM20_q16;



#endif // PLP_CONST_STRUCTS_H
