LIB=$(shell pwd)/../../../../../lib/build/pulp/libplpdsp.a
IDIR=$(shell pwd)/../../../../../include

PULP_APP = test

PULP_APP_CL_SRCS = cluster.c
PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += $(LIB) -lm 
PULP_CFLAGS += -I$(IDIR) -O3 -g -w

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
