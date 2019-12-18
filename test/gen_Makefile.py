# Copyright (C) 2019 ETH Zurich, University of Bologna.
# Released under Apache v2.
# Author: Xiaying Wang, ETH Zurich

#!/usr/bin/env python

import sys

if __name__=='__main__':

    """
    input
    first argument: number of bits: 32, 16, 8
    second argument: method: 1 is FC, 2 is CL, 3 is CL PARALLEL
    """

    n_bits = sys.argv[1]
    method = sys.argv[2]

    f = open('Makefile', 'w')

    f.write("PULP_APP = dotproduct\n\n")

    f.write("WORD ?= {}\n# 32, 16, 8\n".format(n_bits))
    f.write("METHOD ?= {}\n# 1 is FC, 2 is CL, 3 is CL PARALLEL\n\n".format(method))

    f.write("ifeq ($(METHOD), 1)\n")

    f.write("PULP_APP_FC_SRCS = dotprod{}.c main.c\n".format(n_bits))

    f.write("else\n")

    f.write("PULP_APP_CL_SRCS = dotprod{}.c cluster.c\nPULP_APP_FC_SRCS = main.c\n".format(n_bits))

    f.write("endif\n\n")

    f.write("PULP_CFLAGS += -DWORD=$(WORD) -DMETHOD=$(METHOD) -O3 -g\n\n")

    f.write("include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk\n")

    f.close()
