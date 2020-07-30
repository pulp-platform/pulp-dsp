# Hackathon 31.07.2020

Thank you for participating in our first PULP Hackathon. The goal of this hackathon is to optimize functions from [pulp-dsp](https://github.com/pulp-platform/pulp-dsp) for the PULP platform.

This document will explain all steps for the hackathon, from choosing the functions to contributing to the project.

## Setup

- First of all, make sure you have a working installation of the pulp-sdk. We have prepared a preconfigured VM. Ask us if you need any help.
- Create a github fork of [pulp-dsp](https://github.com/pulp-platform/pulp-dsp). Commit all your changes to this repository, and create a pull request at the end of the hackathon (see [Contributing to the Project](#Contributing))
- Clone your repository to your local machine, where you have pulp-sdk installed.
- Add the upstream repository and make sure that you use the latest version by rebasing to `upstream/master`
  ```
  git remote add upstream https://github.com/pulp-platform/pulp-dsp
  git fetch upstream
  git rebase upstream/master
  ```

## Choosing Functions

There are over 400 functions in the library for you to choose and optimize. Few of them already have optimized implementations. Some functions might be better suited for optimization on PULP than others. It makes sense to first optimize functions that are used often in projects at IIS, or that you know you will need in the future.

Generally speaking, Matrix functions are very important, and they can still be optimized heavily. The strided matrix operations are the most general functions of the libary, and many other functions can be implemented using strided matrix operations.

## Optimizing the code

Here is an incomplete list of common optimizations for such functions on PULP:
- **Loop Unrolling**: Compute multiple elements in a single iteration of the loop to allow the compiler to reshuffle instructions. This way, we can reduce the number of load stalls, when data from memory is loaded, and used for computation in the next instruction.
- **SIMD**: XpulpV2 supports vectorized instructions (both 8 and 16-bit). Use these instructions to gain a significant speedup
- **Other specialized instructions**: XpulpV2 knows several unique instructions, which the compiler may not be able to insert automatically. Check the [ri5cy user manual](https://www.pulp-platform.org/docs/ri5cy_user_manual.pdf) which contains all special instructions on XpulpV2.
- **Better work distribution for parallel implementation**: For the parallel implementation, the workload needs to be divided equally amongst all cores. However, the current split may not be the best. As an example, the matrix operations always split the data based on the columns of the first input matrix. However, if this dimension is 1, then only 1 core will be used.
- **Do..While instead of for-loops**: This can remove unnecessary branches in the assembly, because the compiler cannot know beforehand if a dimension variable is 0 or not.
- **Data Reuse**: For some funcitons, data may be used multiple times throughout the computation (e.g. matrix multiplication). By carefully unrolling the loops, you may be able to reuse a data loaded from memory for multiple operations.
- **...**

## Test and upload your benchmark

After you have modified a function, you need to check if it still passes. Go to `test/mrWolf`. You don't need to always test every function. To test just your modified function, search the respective folder and change the directory into `test/mrWolf/[TEST_FOLDER]/test_lib`. Then, run:
```
plptest --threads 1
```
If some tests do not pass, check the output, it might help you fix your problem.

Once all tests pass, you are ready to upload your benchmark and check your score. For this, a new benchmark csv file was generated at: `test/mrWolf/bench_[DATE]_[TIME].csv`. Upload this file to the score webpage to get your score. (TODO add link)

## Contributing

Before contributing to our main project, please make sure to do the following before:
- Format the code using `clang-format`. We have provided format guidelines in the project and a `make` target for convenient autoformatting:
  ```
  make fmt
  ```
- Make sure *all* tests pass. To do this, execute:
  ```
  cd test/mrWolf
  plptest --threads 1
  ```
  This may take an hour to complete.

If both of these steps are finished, you can create the pull request in github. Please list all functions that you have modified in the pull request notes.
