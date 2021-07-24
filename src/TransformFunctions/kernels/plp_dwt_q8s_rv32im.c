/* ----------------------------------------------------------------------
 * Project:      PULP DSP Library
 * Title:        plp_dwt_q8_rv32im.c
 * Description:  Q8 Fixed-point Discret Wavelet Transform
 *
 * $Date:        10. Juli 2021
 * $Revision:    V1
 *
 * Target Processor: PULP cores
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

#include "plp_math.h"
#include "plp_const_structs.h"

/* HELPER FUNCTIONS */


#define HAAR_COEF ((int16_t) 0x5b)

#define MAC_SHIFT 7U
// #define MAC(Acc, A, B) Acc = __MACS(Acc, A, B);
#define MAC(Acc, A, B) Acc += (int16_t)A * (int16_t)B;
#define MSU(Acc, A, B) Acc -= (int16_t)A * (int16_t)B;


#include "plp_dwt_signal_ext.h"


/**
  @ingroup dwt
 */

/**
  @defgroup realDWTKernels DWT kernels on real input values
  These kernels calculate the DWT transform on real input data.
*/

/**
  @addtogroup realDWTKernels
  @{
 */

/**
   @brief  8bit fixed-point DWT on real input data
   @param[in]   pSrc     points to the input buffer (real data)
   @param[in]   length   length of input buffer
   @param[in]   wavelet  wavelet structure for calculating DWT
   @param[in]   mode     boundary extension mode

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_q8s_rv32im(const int8_t *__restrict__ pSrc,
                         uint32_t length,
                         const plp_dwt_wavelet_q8 wavelet,
                         plp_dwt_extension_mode mode,
                         int8_t *__restrict__ pDstA,
                         int8_t *__restrict__ pDstD) {
    int8_t *pCurrentA = pDstA;
    int8_t *pCurrentD = pDstD;

    static uint32_t step = 2;

    int32_t offset;
        
    /***
     * The filter convolution is done in 4 steps handling cases where
     *  1. Filter is hanging over the left side of the signal
     *  2. Filter is same size, or totally enclosed in signal
     *  3. Filter is larger than the enclosed signal and hangs over both edges
     *  4. Filter hangs over the right side of the signal
     * 
     *  Each of the cases, where signal hangs over the boundary of the signal, values are computed 
     *  on demand based on the edge extension mode.
     */

    
    /*
     *  Handle Left overhanging
     *
     * X() =  x x[A B C D E F]
     * H() = [d c b a]
     *          ^   ^
     *          |   First compute the filter part overlapping with the signal
     *          Then extend the signal (x x) by computing the values based on the extension mode
     */
    for(offset = step-1; offset < wavelet.length - 1 && offset < length; offset += step){
        int16_t sum_lo = 0;
        int16_t sum_hi = 0;

        uint32_t filt_j = 0;

        // Compute Filter overlapping with signal
        for(; filt_j <= offset; filt_j++){
            MAC(sum_lo, wavelet.dec_lo[filt_j], pSrc[offset - filt_j]);
            MAC(sum_hi, wavelet.dec_hi[filt_j], pSrc[offset - filt_j]);
        }

        // Compute Left edge extension
        switch(mode){
            case PLP_DWT_MODE_CONSTANT:
                CONSTANT_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_SYMMETRIC:
                SYMMETRIC_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_REFLECT:
                REFLECT_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTISYMMETRIC:
                ANTISYMMETRIC_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTIREFLECT:
                ANTIREFLECT_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset, int32_t);
                break;
            case PLP_DWT_MODE_PERIODIC:
            case PLP_DWT_MODE_ZERO:
            default:
                break;
        }
    
    
        *pCurrentA++ = sum_lo >> MAC_SHIFT;
        *pCurrentD++ = sum_hi >> MAC_SHIFT;
    }

    /*
     *  Compute center (length >= wavelet.length)
     *
     *  X() = [A B C D E F]
     *  h() =   [d c b a]
     *                 ^
     *                 Compute a full convolution of the filter with the signal
     */    
    for(;offset < length; offset += step){

        int16_t sum_lo = 0;
        int16_t sum_hi = 0;
        uint32_t filt_j = 0;

        for(; filt_j < wavelet.length; filt_j++){
            MAC(sum_lo, wavelet.dec_lo[filt_j], pSrc[offset - filt_j]);
            MAC(sum_hi, wavelet.dec_hi[filt_j], pSrc[offset - filt_j]);
            
        }

        *pCurrentA++ = sum_lo >> MAC_SHIFT;
        *pCurrentD++ = sum_hi >> MAC_SHIFT;
    }

     /*
     *  Compute center (length < wavelet.length)
     *
     *  X() =   y y[A B C]x x x
     *  h() =  [h g f e d c b a]
     *            ^     ^     ^
     *            |     |     Compute Right extension (x x x) based on extension mode
     *            |     Compute a full convolution of the filter overlapping with the signal
     *            Compute Left extension (y y) based on extension mode
     */      

    for(;offset < wavelet.length - 1; offset += step){
        int16_t sum_lo = 0;
        int16_t sum_hi = 0;

        uint32_t filt_j = 0;

        // Filter Right extension
        switch(mode){
            case PLP_DWT_MODE_CONSTANT:
                CONSTANT_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_SYMMETRIC:
                SYMMETRIC_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_REFLECT:
                REFLECT_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTISYMMETRIC:
                ANTISYMMETRIC_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTIREFLECT:
                ANTIREFLECT_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset, int32_t);
                break;
            case PLP_DWT_MODE_PERIODIC:
            case PLP_DWT_MODE_ZERO:
            default:
                filt_j = offset - length + 1;
                break;
        }

        // Filter Center overlapp
        for(; filt_j <= offset; filt_j++){
            MAC(sum_lo, wavelet.dec_lo[filt_j], pSrc[offset - filt_j]);
            MAC(sum_hi, wavelet.dec_hi[filt_j], pSrc[offset - filt_j]);
        }   

        // Filter Left extension
        switch(mode){
            case PLP_DWT_MODE_CONSTANT:
                CONSTANT_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_SYMMETRIC:
                SYMMETRIC_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_REFLECT:
                REFLECT_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTISYMMETRIC:
                ANTISYMMETRIC_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTIREFLECT:
                ANTIREFLECT_EDGE_LEFT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset, int32_t);
                break;
            case PLP_DWT_MODE_PERIODIC:
            case PLP_DWT_MODE_ZERO:
            default:
                break;
        }

        *pCurrentA++ = sum_lo >> MAC_SHIFT;
        *pCurrentD++ = sum_hi >> MAC_SHIFT;
    }


    /*
     *  Handle Right overhanging
     *
     * X() = [A B C D E F]x x
     * H() =         [d c b a]
     *                  ^   ^
     *                  |   First extend the signal (x x) by computing the values based on the extension mode
     *                  Then compute the filter part overlapping with the signal
     */
    for(; offset < length + wavelet.length - 1; offset += step){
        int16_t sum_lo = 0;
        int16_t sum_hi = 0;

        uint32_t filt_j = 0;

        // Compute Left edge extension
        switch(mode){
            case PLP_DWT_MODE_CONSTANT:
                CONSTANT_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_SYMMETRIC:
                SYMMETRIC_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_REFLECT:
                REFLECT_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTISYMMETRIC:
                ANTISYMMETRIC_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset);
                break;
            case PLP_DWT_MODE_ANTIREFLECT:
                ANTIREFLECT_EDGE_RIGHT(sum_lo, sum_hi, pSrc, length, wavelet, filt_j, offset, int32_t);
                break;
            case PLP_DWT_MODE_PERIODIC:
            case PLP_DWT_MODE_ZERO:
            default:
                filt_j = offset - length + 1;
                break;
        }
    
        // Filter overlapping with signal
        for(; filt_j < wavelet.length; filt_j++){
            MAC(sum_lo, wavelet.dec_lo[filt_j], pSrc[offset - filt_j]);
            MAC(sum_hi, wavelet.dec_hi[filt_j], pSrc[offset - filt_j]);
        }

        *pCurrentA++ = sum_lo >> MAC_SHIFT;
        *pCurrentD++ = sum_hi >> MAC_SHIFT;
    }
}




/**
   @brief 8bit fixed-point DWT kernel optimized for Haar Wavelet on real input data.
   @param[in]   pSrc     points to the input buffer (real data)
   @param[in]   length   length of input buffer
   @param[in]   mode     boundary extension mode

   @param[out]  pDstA    points to ouput buffer with Approximate coefficients
   @param[out]  pDstD    points to ouput buffer with Detailed coefficients
   @return      none
*/
void plp_dwt_haar_q8s_rv32im(const int8_t *__restrict__ pSrc,
                         uint32_t length,
                         plp_dwt_extension_mode mode,
                         int8_t *__restrict__ pDstA,
                         int8_t *__restrict__ pDstD) {
    int8_t *pCurrentA = pDstA;
    int8_t *pCurrentD = pDstD;

    static uint32_t step = 2;

    int32_t offset;
        
    /***
     * The filter convolution is done in 4 steps handling cases where
     *  1. Filter is hanging over the left side of the signal
     *  2. Filter is same size, or totally enclosed in signal
     *  3. Filter is larger than the enclosed signal and hangs over both edges
     *  4. Filter hangs over the right side of the signal
     * 
     *  Each of the cases, where signal hangs over the boundary of the signal, values are computed 
     *  on demand based on the edge extension mode.
     */

    
 
    /*
     *  Compute center (length >= wavelet.length)
     *
     *  X() = [A B C D E F]
     *  h() =       [b a]
     *                 ^
     *                 Compute a full convolution of the filter with the signal
     */ 
    // offset = step-1;

    // const int8_t * pSrcTmp = pSrc;


    // while(offset + 4 < length){
    //     int8_t v1 = *pSrcTmp++;
    //     int8_t v2 = *pSrcTmp++;
    //     int8_t v3 = *pSrcTmp++;
    //     int8_t v4 = *pSrcTmp++;


    //     offset += 4;
    // }

    for(offset = step-1 ; offset < length; offset += step){

        int16_t sum_lo = __MULSN(HAAR_COEF, (pSrc[offset - 1] + pSrc[offset]), MAC_SHIFT);
        int16_t sum_hi = __MULSN(HAAR_COEF, (pSrc[offset - 1] - pSrc[offset]), MAC_SHIFT);

        *pCurrentA++ = sum_lo;
        *pCurrentD++ = sum_hi;
    }

   


    /*
     *  Handle Right overhanging
     *
     * X() = [A B C D E F]x x
     * H() =         [d c b a]
     *                  ^   ^
     *                  |   First extend the signal (x x) by computing the values based on the extension mode
     *                  Then compute the filter part overlapping with the signal
     */
    if(offset < length + 1){
        int16_t sum_lo = 0;
        int16_t sum_hi = 0;

        uint32_t filt_j = 0;

        // Compute Left edge extension
        switch(mode){
            case PLP_DWT_MODE_CONSTANT:
            case PLP_DWT_MODE_SYMMETRIC:
                sum_lo = 2 * HAAR_COEF * pSrc[length - 1];   // dec_lo[0] * src[N-1] + dec_lo[1] * src[N-1]
                sum_hi = 0;                                  // dec_hi[0] * src[N-1] + dec_hi[1] * src[N-1] == -dec_hi[1] * src[N-1] + dec_hi[1] * src[N-1]
                break;
            case PLP_DWT_MODE_REFLECT:
                sum_lo = HAAR_COEF * (pSrc[length - 1] + pSrc[length - 2]);
                sum_hi = HAAR_COEF * (pSrc[length - 1] - pSrc[length - 2]);
                break;
            case PLP_DWT_MODE_ANTISYMMETRIC:
                sum_lo = HAAR_COEF * (pSrc[length - 1] - pSrc[length - 1]);
                sum_hi = HAAR_COEF * (pSrc[length - 1] + pSrc[length - 1]);
                break;
            case PLP_DWT_MODE_ANTIREFLECT:
                sum_lo = HAAR_COEF * (3*pSrc[length - 1] - pSrc[length - 2]);
                sum_hi = HAAR_COEF * ( -pSrc[length - 1] + pSrc[length - 2]);
                break;
            case PLP_DWT_MODE_PERIODIC:
            case PLP_DWT_MODE_ZERO:
            default:
                sum_lo = HAAR_COEF * pSrc[length - 1];
                sum_hi = HAAR_COEF * pSrc[length - 1];
                break;
        }
    
        *pCurrentA = sum_lo >> MAC_SHIFT;
        *pCurrentD = sum_hi >> MAC_SHIFT;
    }
}
