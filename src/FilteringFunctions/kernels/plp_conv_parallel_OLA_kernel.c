#include "plp_math.h"
#include "rt/rt_api.h"

/**
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] task_args  Holds the plp_conv_tree_add_instance that describes the vector parameters
   @return none
*/

void plp_conv_parallel_OLA_kernel(void* task_args){

  plp_conv_tree_add_instance* S = (plp_conv_tree_add_instance*)task_args;
  
  const uint32_t addOffset = S->addOffset;
  const uint32_t addLengthfirst = S->addLengthfirst;
  const uint32_t numVectors = S->numVectors;
  const uint32_t addLengthsecond = (rt_core_id() << 1 < numVectors) ? S->addLengthfirst : S->addLengthsecond;
  uint32_t addLength = (addLengthfirst >= addLengthsecond+addOffset) ? addLengthsecond : addLengthfirst - addOffset;
  uint32_t blockOffset = S->blockOffset;/* (addLengthsecond == addLengthfirst) ? S->blockOffset : 2*(S->blockOffset) - addLengthsecond; */
  int32_t* pRes = (S->pRes + 2*rt_core_id()*blockOffset);
  
  for(uint32_t i = 0;i< addLength ;i++){
    pRes[i+addOffset] += pRes[i+blockOffset];
  }
  
  if(addLength < addLengthsecond){
    for(uint32_t i=0; i<addLengthsecond - addLength; i++){
      pRes[i+addLength+addOffset] = pRes[i+blockOffset+addLength];
     }
  }

  if((rt_core_id() << 1) >= numVectors){
    if(addLength >= addLengthsecond){
      S->addLengthsecond = addLengthfirst;
    } else {
      S->addLengthsecond = addLengthfirst + addLengthsecond - addLength;
    }
  }
  
  return;
}
