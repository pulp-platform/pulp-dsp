FCT=plp_dot_prod_q32s.c plp_dot_prod_i32s.c

PULP_APP = test

IDIR=/home/xiaywang/pulp/PULP-DSP/include

BUILD_DIR=/home/xiaywang/pulp/PULP-DSP/obj/build

PULP_APP_FC_SRCS = test.c $(FCT)
PULP_CFLAGS += -I$(IDIR) -O3 -g -c $(BUILD_DIR)

include $(PULP_SDK_HOME)/install/rules/pulp_rt.mk



# one of the failed attempts to create a library for pulp, but got useful insights:

# https://stackoverflow.com/questions/30573481/path-include-and-src-directory-makefile

#EXE=create_static_lib

#SRC_DIR = /home/xiaywang/pulp/PULP-DSP/Source/*
#OBJ_DIR = /home/xiaywang/pulp/PULP-DSP/Source/*

#SRC = $(wildcard $(SRC_DIR)/*.c)
#OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)


#all: $(EXE)

#$(EXE): $(OBJ)
#	gcc -I$(IDIR) $^ -o $@

#METHOD ?= 1 # 1 for fc (ibex) on mr wolf
#ifeq ($(METHOD), 1)


# https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_C_libraries.html
# https://renenyffenegger.ch/notes/development/languages/C-C-plus-plus/GCC/create-libraries/index
# https://medium.com/@StueyGK/static-libraries-vs-dynamic-libraries-af78f0b5f1e4
# https://randu.org/tutorials/c/libraries.php
# https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_C_libraries.html
# https://stackoverflow.com/questions/19539422/make-for-compiling-all-c-files-in-folders-subfolders-in-project

#SRC_DIR = /home/xiaywang/pulp/PULP-DSP/Source/BasicMathFunctions
#OBJ_DIR = /home/xiaywang/pulp/PULP-DSP/Examples/test/build/wolfe/test/fc
#SRC = $(wildcard $(SRC_DIR)/*.c)
#OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

