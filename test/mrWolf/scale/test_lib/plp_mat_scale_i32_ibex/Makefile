PULP_APP = test
PULP_APP_FC_SRCS = test.c
PULP_LDFLAGS += -lplpdsp
PULP_CFLAGS += -I$(CONFIG_BUILD_DIR) -O3 -g
ifdef TFLAGS
    PULP_CFLAGS += $(TFLAGS)
endif
include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk
PULP_CFLAGS += -D DATA=$(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)
