#include "plp_math.h"
#include "rt/rt_api.h"

/**
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] task_args  Holds the plp_conv_tree_add_instance that describes the vector parameters
   @return none
*/

void plp_conv_parallel_OLA_kernel(void* task_args){

  /* printf("Hello Core %i\n", rt_core_id()); */
  
  plp_conv_tree_add_instance* S = (plp_conv_tree_add_instance*)task_args;

  const uint8_t coreId = rt_core_id();
  
  const uint8_t coresPerVector = S->coresPerVector;
  const uint32_t addOffset = S->addOffset;
  const uint32_t addLengthfirst = S->addLengthfirst;
  const uint32_t numVectors = S->numVectors;
  const uint32_t addLengthsecond = (coreId >= ((numVectors>>1)-1)*coresPerVector && !(numVectors%2) ) ? S->addLengthsecond : S->addLengthfirst;
  uint32_t addLength = (addLengthfirst >= addLengthsecond+addOffset) ? addLengthsecond : addLengthfirst - addOffset;
  uint32_t blockOffset = S->blockOffset;/* (addLengthsecond == addLengthfirst) ? S->blockOffset : 2*(S->blockOffset) - addLengthsecond; */
  int32_t* pRes = (S->pRes + 2*(coreId/coresPerVector)*blockOffset);
  
  uint32_t stepSize = (addLength+coresPerVector-1) / coresPerVector;
  uint8_t shardId = coreId % coresPerVector;
  uint32_t sharedLength = (addLengthsecond - addLength + coresPerVector-1) / coresPerVector;

  
#if defined(PLP_MATH_LOOPUNROLL)
  uint32_t k;
  int32_t temp1, temp2, temp3, temp4;
  int32_t* _pRes = (pRes + (shardId*stepSize) + addOffset);
  const int32_t* pIn1 = (pRes + (shardId*stepSize) + addOffset);
  const int32_t* pIn2 = (pRes + (shardId*stepSize) + blockOffset);
  const int32_t* pIn3 = (pRes + (shardId*sharedLength) + blockOffset + addLength);
  int32_t* _pRes2 = (pRes + (shardId*sharedLength) + addLength + addOffset);
#endif
  

  if(shardId != coresPerVector - 1){

#if defined(PLP_MATH_LOOPUNROLL)

    k = stepSize >> 1U;

    while(k){
      temp1 = *pIn1++;
      temp2 = *pIn1++;
      temp3 = *pIn2++;
      temp4 = *pIn2++;

      *_pRes++ = temp1 + temp3;
      *_pRes++ = temp2 + temp4;
      
      k--;
    }

    k = (stepSize) % 0x2U;
    
    if(k){      
      *_pRes = *pIn1 + *pIn2;
    }

    if(addLength < addLengthsecond && sharedLength > 0){

      k = sharedLength >> 1U;

    
      while(k){
	temp1 = *pIn3++;
	temp2 = *pIn3++;
     
	*_pRes2++ = temp1;
	*_pRes2++ = temp2;
      
	k--;
      }

      k = sharedLength % 0x2U;

      if(k){      
	*_pRes2 = *pIn3;
      }

    }

#else
    
    for(uint32_t i = shardId*stepSize; i<(shardId+1)*stepSize;i++){
      pRes[i+addOffset] += pRes[i+blockOffset];
    }
  
    if(addLength < addLengthsecond && sharedLength > 0){
      for(uint32_t i=shardId*sharedLength; i<(shardId+1)*sharedLength; i++){
	pRes[i+addLength+addOffset] = pRes[i+blockOffset+addLength];
      }
    }
#endif // if defined(PLP_MATH_LOOPUNROLL)

  } else {

#if defined(PLP_MATH_LOOPUNROLL)

    k = (addLength-shardId*stepSize) >> 1U;
	
    while(k){
      temp1 = *pIn1++;
      temp2 = *pIn1++;
      temp3 = *pIn2++;
      temp4 = *pIn2++;

      *_pRes++ = temp1 + temp3;
      *_pRes++ = temp2 + temp4;
      
      k--;
    }

    k = (addLength-shardId*stepSize) % 0x2U;
    
    if(k){      
      *_pRes = *pIn1 + *pIn2;
    }

    if(addLength < addLengthsecond){

      k = ((addLengthsecond - addLength)-shardId*sharedLength) >> 1U;

    
      while(k){
	temp1 = *pIn3++;
	temp2 = *pIn3++;
     
	*_pRes2++ = temp1;
	*_pRes2++ = temp2;
      
	k--;
      }

      k = ((addLengthsecond - addLength)-shardId*sharedLength) % 0x2U;

      if(k){      
	*_pRes2 = *pIn3;
      }

    }

    if(coreId == (numVectors>>1)*coresPerVector-1){
      if(addLength >= addLengthsecond){
	S->addLengthsecond = addLengthfirst;
      } else {
	S->addLengthsecond = addLengthfirst + addLengthsecond - addLength;
      }
    }

    
#else 
    for(uint32_t i = shardId*stepSize; i < addLength;i++){
      pRes[i+addOffset] += pRes[i+blockOffset];
    }
  
    if(addLength < addLengthsecond){
      for(uint32_t i=shardId*sharedLength; i < (addLengthsecond - addLength); i++){
	pRes[i+addLength+addOffset] = pRes[i+blockOffset+addLength];
      }
    }

    if(coreId == (numVectors>>1)*coresPerVector-1){
      if(addLength >= addLengthsecond){
	S->addLengthsecond = addLengthfirst;
      } else {
	S->addLengthsecond = addLengthfirst + addLengthsecond - addLength;
      }
    }

#endif // if defined(PLP_MATH_LOOPUNROLL)

  }
  
  return;
}
