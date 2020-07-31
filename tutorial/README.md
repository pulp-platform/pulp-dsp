## Tutorial for beginners

# Introduction

In this tutorial you will learn how to contribute to the pulp-dsp library and write optimized code for PULP platforms.

We will use the gvsoc virtual platform and Mr. Wolf processor.

Mr. Wolf has two processing domains: SoC with a Fabric Controller (FC) and Cluster which is activated for compute-intensive tasks. The FC contains an Ibex core with RV32IMC ISA, while the Cluster contains 8 RI5CY cores with RV32IMCXPulpV2 extensions.

The library contains glue codes where it is checked in which domain the function is called. If it's in FC, then the rv32im kernel function is called, otherwise the xpulpv2 kernel function is called.

If the user wants to use a parallel implementation, he/she can call the glue code functions with '_parallel' in the function name.

The naming scheme of the functions follows the following pattern (for example plp\_dot\_prod\_i32s):

\<pulp\> _ \<function name\> _ \<data type\> \<precision\> \<method\> _ \<isa extension\>, with

- data type = {f, i, q} respectively for floats, integers, fixed points

- precision = {32, 16, 8} bits

- method = {s, p} respectively meaning single core or parallel multicore implementation.

- isa extension = rv32im, xpulpv2, etc. of which rv32im is the most general one.

In this tutorial, an `example_dot_prod` function is used.

# Compile the library and install it in the pulp-sdk

Run the command

`make clean header all install`

to compile and install the library.

You can check out the Makefile to see which functions are compiled.

# Run an application

Go to `example_usage` and do

`make clean all run`

in both `fc` and `cluster`. You will see that on the Cluster side the number of cycles and instructions is much less than on the FC side thank to the ISA DSP extensions.
