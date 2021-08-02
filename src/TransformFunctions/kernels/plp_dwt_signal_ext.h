




/********************************************************************************
 *  Left Edge Cases
 * *****************************************************************************/
#define CONSTANT_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)     \
    for(; J < WAVELET.length ; J++){                                            \
        SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[0]);                        \
        SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[0]);                        \
    }                                                                           \


#define SYMMETRIC_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)    \
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=0; k < length && J < WAVELET.length; k++, J++) {                  \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[k]);                    \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[k]);                    \
        }                                                                       \
        for(k=0; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1-k]);           \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1-k]);           \
        }                                                                       \
    }                                                                           \


#define REFLECT_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)      \
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=1; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[k]);                    \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[k]);                    \
        }                                                                       \
        for(k=1; k < LENGTH && J< WAVELET.length; k++, J++) {                   \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1-k]);           \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1-k]);           \
        }                                                                       \
    }                                                                           \


#define ANTISYMMETRIC_EDGE_LEFT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)\
    while(J < WAVELET.length){                                                  \
        int32_t k;                                                              \
        for(k=0; k < LENGTH && J < WAVELET.length; k++, J++) {                  \
            SUM_LO = MSU(SUM_LO, WAVELET.dec_lo[J], SRC[k]);                    \
            SUM_HI = MSU(SUM_HI, WAVELET.dec_hi[J], SRC[k]);                    \
        }                                                                       \
        for(k=0; k < LENGTH && J< WAVELET.length; k++, J++) {                   \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1-k]);           \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1-k]);           \
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
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], tmp);                       \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], tmp);                       \
        }                                                                       \
        left_edge = tmp;                                                        \
        for(k=1; k < LENGTH && J< WAVELET.length; k++, J++) {                   \
            tmp = left_edge + (SRC[LENGTH-1-k] - SRC[LENGTH-1]);                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], tmp);                       \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], tmp);                       \
        }                                                                       \
        left_edge = tmp;                                                        \
    }                                                                           \
}                                                                               \


/********************************************************************************
 *  Right Edge Cases
 * *****************************************************************************/
#define CONSTANT_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)    \
    for(; OFFSET - J >= LENGTH ; J++){                                          \
        SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[J], SRC[LENGTH-1]);                 \
        SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[J], SRC[LENGTH-1]);                 \
    }                                                                           \


#define SYMMETRIC_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)   \
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
        }                                                                       \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[k]);  \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[k]);  \
        }                                                                       \
    }                                                                           \


#define REFLECT_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)     \
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
        }                                                                       \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[k]);  \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[k]);  \
        }                                                                       \
    }                                                                           \


#define ANTISYMMETRIC_EDGE_RIGHT(SUM_LO, SUM_HI, SRC, LENGTH, WAVELET, J, OFFSET)\
    while(OFFSET - J >= LENGTH){                                                \
        int32_t k;                                                              \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
            SUM_LO = MSU(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
            SUM_HI = MSU(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[LENGTH - 1 - k]);\
        }                                                                       \
        for(k=0; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
                                                                                \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], SRC[k]);  \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], SRC[k]);  \
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
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], tmp);     \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], tmp);     \
        }                                                                       \
        right_edge = tmp;                                                       \
        for(k=1; k < LENGTH && OFFSET - J >= LENGTH; k++, J++) {                \
            tmp = right_edge + (SRC[k] - SRC[0]);                               \
            SUM_LO = MAC(SUM_LO, WAVELET.dec_lo[OFFSET - LENGTH - J], tmp);     \
            SUM_HI = MAC(SUM_HI, WAVELET.dec_hi[OFFSET - LENGTH - J], tmp);     \
        }                                                                       \
        right_edge = tmp;                                                       \
    }                                                                           \
}                                                                               \



