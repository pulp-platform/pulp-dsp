
#LIB=/home/xiaywang/pulp/PULP-DSP/lib/libmyplpdsp.a

IDIR=../../../../../include

PULP_APP = test

PULP_APP_FC_SRCS = test.c fma_fct32.c fma_fct16.c fma_fct8.c

# PULP_LDFLAGS += $(LIB)
PULP_CFLAGS += -I$(IDIR) -O3 -g

ifdef MUL_TEST_8
PULP_CFLAGS += -DMUL_TEST_8
endif
ifdef MUL_TEST_16
PULP_CFLAGS += -DMUL_TEST_16
endif

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
