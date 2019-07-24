FC_SRCS = \
	src/StatisticsFunctions/plp_mean_i32.c src/StatisticsFunctions/kernels/plp_mean_i32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_q32_parallel.c \
	src/BasicMathFunctions/plp_dot_prod_i32_parallel.c \
	src/SupportFunctions/plp_copy_i32.c src/SupportFunctions/kernels/plp_copy_i32s_rv32im.c \
        src/SupportFunctions/plp_fill_i32.c src/SupportFunctions/kernels/plp_fill_i32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_q8.c src/BasicMathFunctions/kernels/plp_dot_prod_q8s_rv32im.c \
        src/BasicMathFunctions/plp_dot_prod_q16.c src/BasicMathFunctions/kernels/plp_dot_prod_q16s_rv32im.c \
        src/BasicMathFunctions/plp_dot_prod_q32.c src/BasicMathFunctions/kernels/plp_dot_prod_q32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i16.c src/BasicMathFunctions/kernels/plp_dot_prod_i16s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i32.c src/BasicMathFunctions/kernels/plp_dot_prod_i32s_rv32im.c \
	src/TransformFunctions/plp_cfft_i16.c \
	src/TransformFunctions/kernels/plp_cfft_i16s_rv32im.c \
	src/TransformFunctions/kernels/SwapTable.c \
	src/TransformFunctions/kernels/TwiddleFactors.c \
#src/TransformFunctions/plp_cfft_i16_parallel.c \
	src/TransformFunctions/plp_cfft_i32.c \
	src/TransformFunctions/plp_cfft_i32_parallel.c \
	src/TransformFunctions/kernels/plp_cfft_i16s_rv32im.c \
	src/TransformFunctions/kernels/plp_cfft_i32s_rv32im.c \
	src/TransformFunctions/kernels/SwapTable.c \
	src/TransformFunctions/kernels/TwiddleFactors.c \

CL_SRCS = \
	src/StatisticsFunctions/kernels/plp_mean_i32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q32p_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32p_xpulpv2.c \
	src/SupportFunctions/kernels/plp_copy_i32s_xpulpv2.c \
        src/SupportFunctions/kernels/plp_fill_i32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q8v_xpulpv2.c \
        src/BasicMathFunctions/kernels/plp_dot_prod_q16v_xpulpv2.c \
        src/BasicMathFunctions/kernels/plp_dot_prod_q32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i16v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32s_xpulpv2.c \
	src/TransformFunctions/kernels/plp_cfft_i16v_xpulpv2.c \
	src/TransformFunctions/kernels/plp_cfft_i16v_xpulpv2cplx.c \
	src/TransformFunctions/kernels/plp_cfft_i16vp_xpulpv2.c \
	src/TransformFunctions/kernels/plp_cfft_i16vp_xpulpv2cplx.c \
	src/TransformFunctions/kernels/plp_cfft_i32s_xpulpv2.c \
	src/TransformFunctions/kernels/plp_cfft_i32p_xpulpv2.c

PULP_LIBS = plpdsp
PULP_LIB_FC_SRCS_plpdsp = $(FC_SRCS)
PULP_LIB_CL_SRCS_plpdsp = $(CL_SRCS)

IDIR=$(CURDIR)/include
BUILD_DIR=$(CURDIR)/lib/build

PULP_CFLAGS += -I$(IDIR) -O3 -g

include $(PULP_SDK_HOME)/install/rules/pulp.mk


