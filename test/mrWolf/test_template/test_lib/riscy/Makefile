
IDIR=../../../../../include

PULP_APP = test

PULP_APP_FC_SRCS = test.c cluster.c

PULP_LDFLAGS += -lplpdsp

PULP_CFLAGS += -I$(IDIR) -I$(CONFIG_BUILD_DIR) -O3 -g

ifdef TFLAGS
	PULP_CFLAGS += $(TFLAGS)
endif

ifdef FSIG
	PULP_CFLAGS += $(FSIG)
else
	PULP_CFLAGS += -D FSIG="printf(\"No function defined\n\")"
endif

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk

PULP_CFLAGS += -D DATA=$(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)

gen: 
	echo $(CONFIG_BUILD_DIR)$(BUILD_DIR_EXT)
	./gen_stimuli.py --folder $(CONFIG_BUILD_DIR) $(GARGS)
		