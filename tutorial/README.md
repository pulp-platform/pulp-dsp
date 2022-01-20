# Introduction

In this tutorial you will learn how to use the pulp-dsp library and how to improve and write optimized code for PULP platforms.

We will use the gvsoc virtual platform and Mr. Wolf processor as an example.

Mr. Wolf has two processing domains: SoC with a Fabric Controller (FC) and Cluster which is activated for compute-intensive tasks. The FC contains an Ibex core with basic RV32IMC ISA, while the Cluster contains 8 CV32E40P (formerly called RI5CY) cores with RV32IMCXPulpV2 extensions.

The library contains glue codes where it is checked in which domain the function is called. If it's in FC, then the rv32im kernel function is called, otherwise the xpulpv2 kernel function is called.

If the user wants to use a parallel implementation, they can call the glue code functions with '_parallel' in the function name.

# Requirements

Follow the instructions under `Installation and usage` on the main page to install pulp-sdk and pulp-dsp.

For Mr. Wolf, we will use the [v1 branch](https://github.com/pulp-platform/pulp-sdk/tree/v1) of the pulp-sdk. The 'new' sdk on the [main branch](https://github.com/pulp-platform/pulp-sdk) works similarly. For detailed documentations, please refer to the respective documentation of pulp-sdk.

# Configurations

After you installed the pulp-sdk and the pulp-dsp in the sdk, you can start developing your DSP application. 

Here we will execute the dot product between two vectors as an example.

Everytime you open a new terminal, go to the `pulp-sdk` folder and configure the gvsoc for Mr. Wolf:

~~~~~shell
source configs/platform-gvsoc.sh
source configs/wolfe.sh
~~~~~

and activate the configurations:

~~~~~shell
source sourceme.sh
~~~~~

# Baseline

Go to the `baseline` folder. It contains the codes for computing the dot product on FC of Mr. Wolf, which has an Ibex core featuring the basic RV32IMC ISA.

Run the command

~~~~~shell
make clean all run
~~~~~

The vectors length is 80. The values are 32-bit integers. It takes 817 cycles and 439 instructions. Refer to the `main.c` to learn how to use the performance counter. Note that on gvsoc you can use as many counters as you want, while on the board only one HW counter exists.

# Single cluster core



# Run an application

Go to `example_usage` and do

`make clean all run`

in both `fc` and `cluster`. You will see that on the Cluster side the number of cycles and instructions is much less than on the FC side thank to the ISA DSP extensions.
