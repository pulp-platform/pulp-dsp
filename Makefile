FC_SRCS = \
	src/BasicMathFunctions/plp_dot_prod_q8.c src/BasicMathFunctions/kernels/plp_dot_prod_q8s_rv32im.c \
        src/BasicMathFunctions/plp_dot_prod_q16.c src/BasicMathFunctions/kernels/plp_dot_prod_q16s_rv32im.c \
        src/BasicMathFunctions/plp_dot_prod_q32.c src/BasicMathFunctions/kernels/plp_dot_prod_q32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i8.c src/BasicMathFunctions/kernels/plp_dot_prod_i8s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i16.c src/BasicMathFunctions/kernels/plp_dot_prod_i16s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i32.c src/BasicMathFunctions/kernels/plp_dot_prod_i32s_rv32im.c

CL_SRCS = \
	src/BasicMathFunctions/kernels/plp_dot_prod_q8v_xpulpv2.c \
        src/BasicMathFunctions/kernels/plp_dot_prod_q16v_xpulpv2.c \
        src/BasicMathFunctions/kernels/plp_dot_prod_q32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i8v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i16v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32s_xpulpv2.c
	

PULP_LIBS = plpdsp
PULP_LIB_FC_SRCS_plpdsp = $(FC_SRCS)
PULP_LIB_CL_SRCS_plpdsp = $(CL_SRCS)

IDIR=$(CURDIR)/include
BUILD_DIR=$(CURDIR)/lib/build

PULP_CFLAGS += -I$(IDIR) -O3 -g

include $(PULP_SDK_HOME)/install/rules/pulp.mk


