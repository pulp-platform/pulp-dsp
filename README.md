## PULP DSP: Digital Signal Processing on Parallel Ultra Low Power Platform

# Introduction

This repository contains the work in progress of an optimized DSP library for PULP platforms. The approach is to create a static library for each custom RISC-V extensions developed for PULP platforms (e.g. IBEX or RISCY, etc.). Currently it's being developed and tested on Mr.Wolf (fabric controller with IBEX (previous zero-riscy) and cluster with 8 RISCY cores).

# List of ISA extensions

[here](https://docs.google.com/spreadsheets/d/13hU5qtpxtcejE1NCyHPy07BwGrqVjrbf9GrBuDpx4Xc/edit?usp=sharing). is a list of PULP chips with respective instructions sets: [needs verification and update]

https://docs.google.com/spreadsheets/d/13hU5qtpxtcejE1NCyHPy07BwGrqVjrbf9GrBuDpx4Xc/edit?usp=sharing

# Structure of the repository

This repository contains:

- `Include` folder with necessary header files. Especially the main header file for the library to be included in the codes which want to use this library.

[Note: in the same header file it's possible to define macros (e.g. IBEX or RISCY or LOOPUNROLL, check the header file for exact list of these macros) to compile the functions for different extensions.]

- `Lib` folder contains the created static library/libraries. The approach is to create a static library for each custom RISC-V extensions developed for PULP platforms (e.g. IBEX or RISCY, etc.). A shell script is currently used to help creating the library.

- `Source` folder contains the source codes.

- `Test` folder contains the test functions used during the development of the library. For more details please read the README file in the folder.

# Notes

Comment: for creating the library a work-around is applied. For running functions on PULP the Makefile is used and it always requires a main function, therefore in the Source folder for each function (or subset of functions) a main file is written which calls this/these function(s). Afterwards the object file(s) is found in the build folder created and saved into `Obj` folder (which is ignored in the .gitignore). These object files are consenquetly used to create the library.

[

Questions to be solved (ask Germain):

- how to give all the .c files in a directory which doesn't contain the Makefile?
- is it possible to create the objective files without a main? (dig into all the makefiles in the pulp-sdk...) In case it's not possible, write a script to automize the copy and paste of the object files.
- function declared with const variables, is this okay?

]


## License and Attribution
Please refer to the LICENSE file for the licensing of our code. 
We got inspiration from CMSIS-DSP from ARM and partially adapted its structure.


