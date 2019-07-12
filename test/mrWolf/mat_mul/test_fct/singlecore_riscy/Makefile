
#LIB=/home/xiaywang/pulp/PULP-DSP/lib/libmyplpdsp.a

IDIR=/home/xiaywang/pulp/PULP-DSP/include

PULP_APP = test

PULP_APP_CL_SRCS = cluster.c fct32.c fct32p.c fct16.c fct16p.c
PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += -lplpdsp
#PULP_LDFLAGS += $(LIB)
PULP_CFLAGS += -I$(IDIR) -O3 -g

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
