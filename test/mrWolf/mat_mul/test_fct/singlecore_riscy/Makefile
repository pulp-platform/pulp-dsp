
#LIB=/home/xiaywang/pulp/PULP-DSP/lib/libmyplpdsp.a

IDIR=/home/xiaywang/pulp/PULP-DSP/include

PULP_APP = test

PULP_APP_CL_SRCS = cluster.c fct32.c fct32p.c fct16.c fct16p.c fct8.c fct8p.c
PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += -lplpdsp
#PULP_LDFLAGS += $(LIB)
PULP_CFLAGS += -I$(IDIR) -O3 -g

ifdef TEST_8
PULP_CFLAGS += -DTEST_8
endif
ifdef TEST_16
PULP_CFLAGS += -DTEST_16
endif
ifdef P_TEST_8
PULP_CFLAGS += -DP_TEST_8
endif
ifdef P_TEST_16
PULP_CFLAGS += -DP_TEST_16
endif
ifdef P_TEST_32
PULP_CFLAGS += -DP_TEST_32
endif



include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
