# Introduction

In this tutorial you will learn how to use the pulp-dsp library and how to improve and write optimized code for PULP platforms.

We will use the GVSoC virtual platform and Mr. Wolf processor as an example. The methods are analogous for other PULP platforms.

Mr. Wolf has two processing domains: SoC with a Fabric Controller (FC) and Cluster which is activated for compute-intensive tasks. The FC contains an Ibex core with basic RV32IMC ISA, while the Cluster contains 8 CV32E40P (formerly called RI5CY) cores with RV32IMCXPulpV2 extensions.

The library contains glue codes where it is checked in which domain the function is called. If it's in FC, then the rv32im kernel function is called, otherwise the xpulpv2 kernel function is called.

If the user wants to use a parallel implementation, they can call the glue code functions with '_parallel' in the function name.

The kernel functions are more specific to the underlying ISA, so they can be used for other processors (other than Mr. Wolf) that contain cores with the specific ISA.

# Requirements

Follow the instructions under `Installation and usage` on the home page to install pulp-sdk and pulp-dsp.

For Mr. Wolf, we will use the [v1 branch](https://github.com/pulp-platform/pulp-sdk/tree/v1) of the pulp-sdk. The 'new' sdk on the [main branch](https://github.com/pulp-platform/pulp-sdk) works similarly. For detailed documentations, please refer to the respective documentation of pulp-sdk.

# Configurations

After you installed the pulp-sdk and the pulp-dsp in the sdk, you can start developing your DSP application. 

Here we will execute the dot product between two vectors as an example.

Everytime you open a new terminal, go to the `pulp-sdk` folder and configure the GVSoC for Mr. Wolf:

~~~~~shell
source configs/platform-GVSoC.sh
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

The vectors length is 80. The values are 32-bit integers. It takes around 806 cycles and 431 instructions. Refer to the `main.c` to learn how to use the performance counter. Note that on GVSoC you can use as many counters as you want, while on the board only one HW counter exists.

# Single cluster core

## Basic version

Go to the folder `cluster_single_basic`, compile and run the code as before.

If you access the data from the cluster to the L2 memory in the SoC, the number of cycles is very high (2165 cycles, 277 instructions), because the data access to L2 requires many cycles.

You have to store the data in L1 to exploit the fast TCDM memory with single-cycle access and sigle-cycle latency which is hidden by the loop unrolling. Uncomment `#define L2DATA` in `defines.h` and run again. You will see that the number of cycles is significantly reduced (394 cycles, 277 instructions).

### Generate assembly code

Compared to the execution on Ibex, the number of cycles is halved, thanks to the hardware loop (`lp.setup`) and the post-incremental load and store (marked by `!`). You can visualize these instructions by generating the assembly code:

~~~~~shell
make dis
~~~~~

You can dump it in a text file:

~~~~~shell
make dis > dis.S
~~~~~

and visualize the file using a text editor. If you search for `plp_dot_prod_` you find the dot product function and the most inner loop where the dot product is computed:

```
1c008662:	00c7c0fb          	lp.setup	x1,a5,1c00867a <plp_dot_prod_i32s_xpulpv2+0x34>
1c008666:	0088a38b          	p.lw	t2,8(a7!)
1c00866a:	0083228b          	p.lw	t0,8(t1!)
1c00866e:	008eaf8b          	p.lw	t6,8(t4!)
1c008672:	008e2f0b          	p.lw	t5,8(t3!)
1c008676:	42538733          	p.mac	a4,t2,t0
1c00867a:	43ef8833          	p.mac	a6,t6,t5
```

You can refer to the manuals of the ISA extensions for details about the instructions.

### IPC and MACs/cycle

Ideally the instructions per cycle would be 1 and the asymptotical MACs/cycle is 2/6=0.33. (MACs = multiply-and-accumulate operations)

Our execution has IPC=277/394=0.7 and 80/394=0.20 MACs/cycle. We computed the dot product of 80 elements. With more elements, the IPC and the MACs/cycle will increase and approach the ideal case. You can try to calculate the dot product of 800 elements. The IPC will be around 0.95 and the MACs/cycle around 0.31.


## Transfer the data with DMA

The L1 memory is much smaller (64kB on Mr. Wolf) than the L2 (512kB). This means that you will need to transfer some data back and forth during the computation when your datasize is too big.

You can use the DMA to transfer the data between L1 and L2.

Go to `cluster_single_dma` folder and check how this is done.


## SIMD instructions

The CV32E40P core with RV32IMCXPulpV2 extensions provides Single Instructions Multiple Data (SIMD) instructions. If you have 8-bit integer numbers, you can do the dot product of 4 values in a single cycyle with a single instruction.

Go to `cluster_single_simd` folder and run the code. You will see around 221 cycles and 93 instructions for computing the dot product of the same amount of elements. Both cycles and instructions are reduced. You can see in the assembly code that the `pv.sdotsp.b` instruction is used.

```
1c00865c:	00c340fb          	lp.setup	x1,t1,1c008674 <plp_dot_prod_i8s_xpulpv2+0x3a>
1c008660:	008fa88b          	p.lw	a7,8(t6!)
1c008664:	008f280b          	p.lw	a6,8(t5!)
1c008668:	0083a70b          	p.lw	a4,8(t2!)
1c00866c:	0082a78b          	p.lw	a5,8(t0!)
1c008670:	b9089ed7          	pv.sdotsp.b	t4,a7,a6
1c008674:	b8f71e57          	pv.sdotsp.b	t3,a4,a5
```

# Parallel computation using multiple cluster cores

You can compute the dot product using all the cores in the cluster. The library provides also functions to do parallel computations.

Go to `cluster_parallel` and run the code.

When using single cluster core, it takes 21022 cycles to compute the dot product of two vectors of length 6960 in 32 bits. When using 8 cores it takes 3046 cycles. The parallel speedup is around 6.9. With increasing vectors' length, it asymptotically approaches to 8, which is the ideal speedup with eight parallel cores.

Note that the L1 memory is limited, hence you will need to use DMA if the datasize exceeds the memory availability. You can then use a technique called double buffering: 

1. you divide your huge datasize into chunks;
2. transfer a first chunk;
3. do the computation on this first chunk;
4. at the same time transfer a second chunk;
5. once the second chunk is transfered, do the computation on this while transfering the next chunk.

# Visualize traces

The GVSoC virtual platform allows dumping architecture events to help developers debugging their applications by better showing what is happening in the system. For example, it can show instructions being executed, DMA transfers, events generated, memory accesses and so on. The generated traces can be visualized using GTKWave. You can install it from their official website.

After compiling your code, do

~~~~~shell
make run runner_args="--vcd --event=.*"
~~~~~

The traces have been generated. You can visualize them using gtkwave:

~~~~~shell
gtkwave build/wolfe/view.gtkw
~~~~~

You can visualize the status of each core, how long each of them spend doing what. An example can be found `gtkwave_screenshot.png`.

![gtkwave example](/tutorial/gtkwave_screenshot.png)


# Optimizations

Under `Signals` window, select `chip/fc/func`. In `Wave` window, zoom in and out, find `__rt_init_cluster_data` at the level of `func`, put the cursor on it, click. You will see a vertical red line popping up. You can now go with left and right arrow on your keyboard, the cursor will jump to the beginning or end of the function, respectively. Now under `overview/soc` you see the cycles number. 

With `VLEN` = 6960 we have 563472-205509 = 357963 cycles. Change `VLEN` in `data.h` to lower, e.g., 696, do the same (compile, run, generate traces, and visualize with GTKWave), you will see the initialization of the cluster data taking 184503-102156 = 82347, instead. 

When you declare the vectors with `RT_CL_DATA` (the same as `RT_L1_DATA`), the vectors are by default initialized during the cluster activation. For variables that are used as buffers, this is not necessary. You can use `RT_L1_BSS` to shorten the cluster initialization.

Change `RT_CL_DATA` to `RT_L1_BSS`, compile, run, generate traces, and visualize again. You can see that the cluster initialization is significantly shortened.

Another part which takes long cycles can be seen under `chip/cluster/pe_0` with `func=memset`. This is the part of code in `cluster.c` where the values are initialized to 0. This only serves for this example code. 

In real applications, the optimization methods will vary case by case. For example, you might acquire data from some sensors and the data are first stored in L2 memory. Then you need the cluster to do some compute-intensive tasks on these data, you can declare buffer variables using `RT_L1_BSS`, then using DMA (maybe also applying the double buffering technique), you transfer the data from L2 to L1 and do the computations with the cluster cores in parallel.

# Contributions

This library provides many optimized functions. However, there are still many to be optimized. You are very welcome to contribute. You can use the techniques learned in this tutorial and apply them. Find more details on how to contribute on the home page `README.md`. Have fun!


<sub>Author: Xiaying Wang. Last updated on Jan 22, 2022.</sub>
