#include "rt/rt_api.h"
#include "fct.h"

void plp_dot_prod_i32s(int32_t * pSrcA, int32_t * pSrcB, unsigned int blockSize, int32_t * pRes){
  unsigned int blkCnt;
  int32_t sum=0;


  for (blkCnt=0; blkCnt<(blockSize>>1); blkCnt++){
    sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
    sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
  }

  for (blkCnt=0; blkCnt<(blockSize%2U); blkCnt++){
    sum = __MAC(sum, (*pSrcA++), (*pSrcB++));
  }

  * pRes = sum;



}
