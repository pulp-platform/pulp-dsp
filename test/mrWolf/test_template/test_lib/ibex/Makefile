
IDIR=../../../../../include

PULP_APP = test

PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += -lplpdsp
#
PULP_CFLAGS += -I$(IDIR) -O3 -g

ifdef $(TFLAGS)
	PULP_CFLAGS += $(TFLAGS)
endif

PULP_CFLAGS += $(FSIG)

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
