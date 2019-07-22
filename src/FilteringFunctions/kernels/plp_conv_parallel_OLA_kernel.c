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

  /* printf("Hello core %i: pRes: 0x%x, shardID: %i, coresPerVector: %i, addLengthfirst: %i, addLengthSecond: %i, numCores: %i\n", coreId, pRes, shardId, coresPerVector, addLengthfirst, addLengthsecond, numVectors); */

  if(shardId != coresPerVector - 1){
  
    for(uint32_t i = shardId*stepSize; i<(shardId+1)*stepSize;i++){
      pRes[i+addOffset] += pRes[i+blockOffset];
    }
  
    if(addLength < addLengthsecond && sharedLength > 0){
      for(uint32_t i=shardId*sharedLength; i<(shardId+1)*sharedLength; i++){
	pRes[i+addLength+addOffset] = pRes[i+blockOffset+addLength];
      }
    }

  } else {

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

  }
  
  return;
}
