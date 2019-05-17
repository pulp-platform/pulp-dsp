PULP_APP = test

WORD ?= 32
# 32, 16, 8
METHOD ?= 1
# 1 is FC, 2 is CL, 3 is CL PARALLEL

ifeq ($(METHOD), 1)
PULP_APP_FC_SRCS = fct.c test.c
else
PULP_APP_CL_SRCS = fct.c cluster.c
PULP_APP_FC_SRCS = main.c
endif

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
