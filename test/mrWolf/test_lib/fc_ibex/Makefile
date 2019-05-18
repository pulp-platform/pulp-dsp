
LIB=/home/xiaywang/pulp/PULP-DSP/lib/libplp_math_ibex.a

IDIR=/home/xiaywang/pulp/PULP-DSP/include

PULP_APP = test

PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += $(LIB)
PULP_CFLAGS += -I$(IDIR) -O3 -g

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
