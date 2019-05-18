LOCAL_TEST=0
FCT_TEST=plp_dot_prod_i32s.c

LIB=/home/xiaywang/pulp/PULP-DSP/lib/libplp_math_ibex.a

IDIR=/home/xiaywang/pulp/PULP-DSP/include

PULP_APP = test

WORD ?= 32
# 32, 16, 8
METHOD ?= 1
# 1 is FC, 2 is CL, 3 is CL PARALLEL


ifeq ($(METHOD), 1)
PULP_APP_FC_SRCS = test.c
PULP_LDFLAGS += $(LIB)
PULP_CFLAGS += -I$(IDIR)

else
PULP_APP_CL_SRCS = fct.c cluster.c
PULP_APP_FC_SRCS = main.c
endif

PULP_CFLAGS += -DWORD=$(WORD) -DMETHOD=$(METHOD) -O3 -g

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
