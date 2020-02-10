
IDIR=../../../../../include

PULP_APP = test

PULP_APP_FC_SRCS = test.c

PULP_LDFLAGS += -lplpdsp

PULP_CFLAGS += -I$(IDIR) -O3 -g

ifdef TFLAGS
	PULP_CFLAGS += $(TFLAGS)
endif

ifdef FSIG
	PULP_CFLAGS += $(FSIG)
else
	PULP_CFLAGS += -D FSIG="printf(\"Hello Print\n\")"
endif

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk

gen: 
	./gen_stimuli.py $(GARGS)
		