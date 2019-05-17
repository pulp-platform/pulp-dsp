#include "rt/rt_api.h"
#include "fct.h"

void dot_product(int32_t * v, int32_t * u, unsigned int n, int32_t * result){
  unsigned int i;
  int result_1=0;
  int result_2=0;
  //printf("%s\n", "Start");
  /*
  for (i=0; i<n/2; i++){
    result_1 += (*v++) * (*u++);
    result_1 += (*v++) * (*u++);
  }

  for (i=0; i<n%2; i++){
    result_1 += (*v++) * (*u++);
  }
  */

  /*
    for (i=0; i<n/2; i++){
    result_1 = __MAC(result_1, (*v++), (*u++));
    result_1 = __MAC(result_1, (*v++), (*u++));
    }

    for (i=0; i<n%2; i++){
    result_1 = __MAC(result_1, (*v++), (*u++));
    }

  */

  
  for (i=0; i<n; i++){
    result_1 += (*v++) * (*u++);
    }
  

  //putchar('\n');
    *result = result_1+result_2;
}
