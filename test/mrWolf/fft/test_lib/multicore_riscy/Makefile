#LIB=$(shell pwd)/../../../../../lib/build/pulp/libplpdsp.a
#IDIR=$(shell pwd)/../../../../../include

PULP_APP = test

PULP_APP_CL_SRCS = cluster.c
PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += -lplpdsp -lm
PULP_CFLAGS += -O3 -g

ifeq '$(PULP_RTOS)'  'pmsis'
PULP_CFLAGS += -DRTOS_PMSIS
include $(RULES_DIR)/pmsis_rules.mk
else
include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
endif

