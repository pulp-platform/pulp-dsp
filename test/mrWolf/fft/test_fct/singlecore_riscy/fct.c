#include "rt/rt_api.h"
#include "fct.h"

void plp_dot_prod_i16v(int16_t * pSrcA, int16_t * pSrcB, unsigned int blockSize, int32_t * pRes){
  unsigned int blkCnt;
  int32_t sum=0;



        for (blkCnt=0; blkCnt<(blockSize>>2); blkCnt++){

          v2s a0 = *((v2s*)((void*)(pSrcA+4*blkCnt)));
          v2s b0 = *((v2s*)((void*)(pSrcB+4*blkCnt)));
          v2s a1 = *((v2s*)((void*)(pSrcA+4*blkCnt+2)));
          v2s b1 = *((v2s*)((void*)(pSrcB+4*blkCnt+2)));
          sum = __SUMDOTP2(a0, b0, sum);
          sum = __SUMDOTP2(a1, b1, sum);



          //sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
          //sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
        }

        for (blkCnt=0; blkCnt<(blockSize%4U); blkCnt++){
          int16_t a = *((int16_t*)(pSrcA+4*(blockSize/4)+blkCnt));
          int16_t b = *((int16_t*)(pSrcB+4*(blockSize/4)+blkCnt));
          sum += a*b;
          //sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
        }


        * pRes = sum;



}
