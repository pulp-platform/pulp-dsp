FC_SRCS = \
	src/example_dot_prod/ex_dot_prod_i8.c src/example_dot_prod/kernels/ex_dot_prod_i8s_rv32im.c

CL_SRCS = \
	src/example_dot_prod/kernels/ex_dot_prod_i8s_xpulpv2.c


PULP_LIBS = plpdsptutorial # the name of the library, after installing it into the pulp-sdk, add `PULP_LDFLAGS += -lplpdsp` in the Makefile of your project to use this library.
PULP_LIB_FC_SRCS_plpdsptutorial = $(FC_SRCS)
PULP_LIB_CL_SRCS_plpdsptutorial = $(CL_SRCS)

IDIR=$(CURDIR)/include
BUILD_DIR=$(CURDIR)/lib/build
# the build folder is saved here.

PULP_CFLAGS += -I$(IDIR) -O3 -g

INSTALL_FILES += $(shell find include -name *.h)

-include $(PULP_SDK_HOME)/install/rules/pulp.mk
