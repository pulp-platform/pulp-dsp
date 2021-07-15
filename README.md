## PULP DSP: Digital Signal Processing on Parallel Ultra Low Power Platform

# Introduction

This repository contains DSP functions for [PULP platform](https://pulp-platform.org/).

It contains the kernel functions for different ISA extensions of RISC-V being developed for PULP platforms (RV32IM, XPULPV2, etc.).

Currently it's being developed and tested on Mr.Wolf (fabric controller (FC) with IBEX (previous zero-riscy), i.e. RV32IM, and cluster with 8 RISCY cores, i.e. RV32IM with XPULPV2 extentions.).

Additionally, it supports the pulp-open and can be used with GWT GAP8.

Some of the functions are very optimized, while others are WIP. Contributions are welcome!

# Structure of the repository

This repository contains:

- `src` folder contains the source codes. In the folder you can find subfolders with different kinds of functions (e.g. BasicMathFunctions, StatisticsFunctions, etc.). In each subfolder you find the glue codes and a folder called `kernel` which contains the kernels for different ISA extensions. The glue codes are used for namely "gluing" the kernels, for example for checking the ISA extension of the calling platform (in the case of Mr. Wolf, it checks if it's FC or CLUSTER calling the function, in case of FC the kernel function for RV32IM is called, otherwise the kernel function for XPULPV2 extension is called. The glue code can be changed and adapted to the specific chip.
 
- `include` folder with necessary header files. Especially the main header file `plp_math.h` has to be included in the codes which want to use this library. Moreover, the `rtos_hal.h` provides an hardware abstraction layer (HAL) for interfacing both the 'old' pulp-sdk ([v1 branch](https://github.com/pulp-platform/pulp-sdk/tree/v1), which supports Mr. Wolf and older chips) and the 'new' pulp-sdk ([main branch](https://github.com/pulp-platform/pulp-sdk), which supports newer chips and GAP8). Note: in the same header file it's possible to define macros (e.g. LOOPUNROLL if you want to take into consideration the option of unrolling or not unrolling the loops).

- `Makefile` for compiling the library. Add your glue codes and kernel functions to be compiled.

- `test` folder contains the testing setup used during the development of the library. For more details please read the README file in the folder.

- `doc` folder contains the configurations for building documentation for the library.

# Installation and usage

First of all, in order to install and use the library, you have to install the pulp-sdk. You can follow the instructions [here](https://github.com/pulp-platform/pulp-sdk).

Note that for Mr. Wolf and older chips you need to use the 'old' sdk on the [v1 branch](https://github.com/pulp-platform/pulp-sdk/tree/v1). While for newer chips and GAP8 use the 'new' sdk on the [main branch](https://github.com/pulp-platform/pulp-sdk).

Configure the sdk according to the chip and the platform you want to use (for example with the 'old' sdk `source configs/wolfe.sh` and `source configs/platform-board.sh`). Do not forget to source the `sourceme.sh` everytime you open a new terminal to set up the environmental variables (e.g. PULP_SDK_HOME) needed to run pulp projects. For more updated instructions, please refer to the pulp-sdk page.

Once you are done with the pulp-sdk setup, you can clone this repository, enter the `pulp-dsp` folder.

## With the pulp-sdk on the v1 branch

To compile and install the library, do

~~~~~shell
make clean header all install
~~~~~

To use the library add `PULP_LDFLAGS += -lplpdsp` in the Makefile of your project and don't forget to include the necessary header files, e.g., `plp_math.h`, in your codes.

If you add or modify the source codes and want to rebuild the library without recompiling unmodified files, do 

~~~~~shell
make header build install`
~~~~~

## With the pulp-sdk on the main branch

To compile and install the library, do

~~~~~shell
make build-lib
make install-lib
~~~~~

You need to enable the PMSIS mode:

~~~~~shell
export PULP_RTOS=pmsis
~~~~~

# Documentation

Go to the `doc` folder and do

~~~~~shell
doxygen doc_config
~~~~~

It creates the documentation and you can browse it by opening `html/index.html` using a browser. 

To add documentations use @defgroup, @ingroup, @addtogroup, etc. Please refer to plp_math.h and the source codes src/BasicMathFunctions/plp_dot_prod_i32.c and src/BasicMathFunctions/kernels/plp_dot_prod_i32s_rv32im.c as examples.

# To contribute

Contributions are very welcome and are accepted under Apache v2.0.

If you want to contribute, fork the repository and issue pull requests.

For each function you develop, note the following:

- Include its corresponding test framework under the `test` folder or adapt it if it already exists;

- Update the documentation;

- Use clang-format to format the code;

- Make sure that all tests pass.

More details can be found in `HACKATHON.md`.

# License and Attribution
All source code is released under Apache v2.0 license unless noted otherwise, please refer to the LICENSE file for details.

We are inspired by CMSIS-DSP ([CMSIS_5](https://github.com/ARM-software/CMSIS_5/tree/develop/CMSIS/DSP) licensed under Apache v2.0) and partially adapted its structure and codes.

