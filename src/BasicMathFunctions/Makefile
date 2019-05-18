
FCT=plp_dot_prod_i16v.c

PULP_APP = test

IDIR=/home/xiaywang/pulp/PULP-DSP/include

BUILD_DIR=/home/xiaywang/pulp/PULP-DSP/obj/build

PULP_APP_CL_SRCS = $(FCT) cluster.c
PULP_APP_FC_SRCS = test.c

PULP_CFLAGS += -I$(IDIR) -O3 -g -c $(BUILD_DIR)

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk

