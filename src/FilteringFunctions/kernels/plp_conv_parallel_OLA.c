#include "plp_math.h"
#include "rt/rt_api.h"

/**
   @ingroup BasicConvolution
*/

/**
   @addtogroup BasicConvolutionKernels
   @{
*/

/**
   @brief Helper function for parallelized overlap-adding of partial convolution results
   @param[in] task_args  Holds the plp_conv_tree_add_instance that describes the vector parameters
   @return none
*/

void plp_conv_parallel_OLA(uint32_t nPE, uint32_t srcALen, uint32_t srcBLen, int32_t* resultsBuffer){
  
  uint32_t srcAoffset = ((srcALen+nPE-1)/nPE);
  uint32_t resultsoffset = srcAoffset + srcBLen - 1;
  uint32_t resultsLen = resultsoffset*(nPE-1) + (srcALen - (srcAoffset * (nPE-1))) + srcBLen - 1;
  
  uint32_t cycles = nPE;
  uint32_t remainingcycles = cycles;
  uint32_t participants = nPE >> (1);
  
  plp_conv_tree_add_instance S = {
    .addOffset = srcAoffset,
    .addLengthfirst = resultsoffset,
    .addLengthsecond = (srcALen - (srcAoffset * (nPE-1))) + srcBLen - 1,
    .numVectors = nPE,
    .pRes = resultsBuffer,
    .blockOffset = resultsoffset,
    .coresPerVector = 2*((nPE)/((S.numVectors>>1)<<1))
  };
      
  while(remainingcycles > 1U){
	
    rt_team_fork((S.coresPerVector*(S.numVectors>>1)), plp_conv_parallel_OLA_kernel, (void*)&S);
    
    S.numVectors = S.numVectors - participants;
    S.blockOffset *=2;
    S.addLengthfirst = S.addLengthfirst + S.addOffset;
    S.addOffset*=2;
    remainingcycles = (remainingcycles+1)>>1;
    participants = S.numVectors>>1;
    S.coresPerVector = ((2*nPE)/((S.numVectors>>1)<<1));
  }

}

/**
   @} end of BasicConvolutionKernels
*/
