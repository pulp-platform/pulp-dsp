FC_SRCS = \
	src/StatisticsFunctions/plp_mean_i32.c src/StatisticsFunctions/kernels/plp_mean_i32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_q32_parallel.c \
	src/BasicMathFunctions/plp_dot_prod_i32_parallel.c \
	src/SupportFunctions/plp_copy_i32.c src/SupportFunctions/kernels/plp_copy_i32s_rv32im.c \
        src/SupportFunctions/plp_fill_i32.c src/SupportFunctions/kernels/plp_fill_i32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_q8.c src/BasicMathFunctions/kernels/plp_dot_prod_q8s_rv32im.c \
        src/BasicMathFunctions/plp_dot_prod_q16.c src/BasicMathFunctions/kernels/plp_dot_prod_q16s_rv32im.c \
        src/BasicMathFunctions/plp_dot_prod_q32.c src/BasicMathFunctions/kernels/plp_dot_prod_q32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i8.c src/BasicMathFunctions/kernels/plp_dot_prod_i8s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i16.c src/BasicMathFunctions/kernels/plp_dot_prod_i16s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i32.c src/BasicMathFunctions/kernels/plp_dot_prod_i32s_rv32im.c \
	src/FilteringFunctions/plp_conv_i32.c src/FilteringFunctions/kernels/plp_conv_i32s_rv32im.c \
	src/FilteringFunctions/plp_conv_i16.c src/FilteringFunctions/kernels/plp_conv_i16s_rv32im.c \
	src/FilteringFunctions/plp_conv_i8.c src/FilteringFunctions/kernels/plp_conv_i8s_rv32im.c \
	src/FilteringFunctions/plp_conv_i32_parallel.c \
	src/FilteringFunctions/plp_conv_i16_parallel.c \
	src/FilteringFunctions/plp_conv_i8_parallel.c \
	src/TransformFunctions/plp_rfft_f32.c

CL_SRCS = \
	src/StatisticsFunctions/kernels/plp_mean_i32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q32p_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32p_xpulpv2.c \
	src/SupportFunctions/kernels/plp_copy_i32s_xpulpv2.c \
        src/SupportFunctions/kernels/plp_fill_i32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q8v_xpulpv2.c \
        src/BasicMathFunctions/kernels/plp_dot_prod_q16v_xpulpv2.c \
        src/BasicMathFunctions/kernels/plp_dot_prod_q32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i8v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i16v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i16s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i8s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i32p_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i16p_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i8p_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_parallel_OLA.c \
	src/FilteringFunctions/kernels/plp_conv_parallel_OLA_kernel.c \
	src/TransformFunctions/kernels/plp_rfft_f32_xpulpv2.c

PULP_LIBS = plpdsp # the name of the library, after installing it into the pulp-sdk, add `PULP_LDFLAGS += -lplpdsp` in the Makefile of your project to use this library.
PULP_LIB_FC_SRCS_plpdsp = $(FC_SRCS)
PULP_LIB_CL_SRCS_plpdsp = $(CL_SRCS)

IDIR=$(CURDIR)/include
BUILD_DIR=$(CURDIR)/lib/build
# the build folder is saved here.

PULP_CFLAGS += -I$(IDIR) -O3 -g

INSTALL_FILES += $(shell find include -name *.h)

include $(PULP_SDK_HOME)/install/rules/pulp.mk
