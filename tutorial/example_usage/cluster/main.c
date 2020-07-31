// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

#include "pulp.h"
#include "cluster.h"

int main()
{

  printf("Hello!\n");
  
  printf("Entering main controller\n");

  // Before being used, the cluster must be mounter, for example in case it must be
  // turned on.
  rt_cluster_mount(1, 0, 0, NULL);
  
  // This is the most basic call we can do to the cluster with all default
  // parameters (default stack size, max number of cores, etc) and is 
  // synchronous (last event parameter is NULL) which means we are blocked
  // until the call is finished
  rt_cluster_call(NULL, 0, cluster_entry, NULL, NULL, 0, 0, 0, NULL);

  // It must then be unmounted when it is not needed anymore so that it is turned off
  rt_cluster_mount(0, 0, 0, NULL);

  return 0;
}
