# Test Framework

This folder contains the necessary codes for testing the functions during the development of the library.

## How it works

The test framework is based around [plptest](https://github.com/pulp-platform/plptest). Additionally, the file `test/mrWolf/pulp_dsp_test.py` provides with several functions and classes making the generation of new tests for Pulp-DSP easy and quick.

`pulp_dsp_test.py` expects a description of the function, including all parameters. To test different dimensions, the framework allows you to define several `SweepVariable` (and `DynamicVariable` which are derived from the former). Then, a `Test` is generated for each combination of the `SweepVariables`. This `Test` class is json-serializable, such that it can be passed to `gen_stimuli.py`. All `gen_stimuli.py` also use `plp_dsp_test`, to deserialize the arguments to the `Test` class, allowing seamless integration between `testset.cfg` and `gen_stimuli.py`. The `gen_stimuli.py` generates a file `data.h` with random stimuli vectors and the check function.

## Setup

Before you use the test framework, make sure that the most recent version of [plptest](https://github.com/pulp-platform/plptest) is installed!

## Generating new Test Cases

New tests can be generated using the test_template located at `test/mrWolf/test_template`. The following steps are required:

1. Copy and rename the folder `test/mrWolf/test_template` to `test/mrWolf/[NAME]`. The two necessary files in this folder are: `testset.cfg` and `gen_stimuli.py`.
2. Edit `test/mrWolf/testset.cfg` and add the new test using `add_test_folder`.
3. Edit the `testset.cfg` configuration file (which is treated as a regular python sctipt):
   1. Create the [`variables`](#variables) list.
   2. Create the [`arguments`](#arguments) list. The following arguments are possible
      - [`Argument`](#default-argument)
      - [`ArrayArgument`](#arrayargument)
      - [`FixPointArgument`](#fixpointargument)
      - [`ParallelArgument`](#parallelargument)
      - [`OutputArgument`](#outputargument)
      - [`ReturnValue`](#returnvalue)
      - [`InplaceArgument`](#inplaceargument)
      - [`CustomArgument`](#customargument)
   3. Edit the [`implemented` dictionary](#generate_test).
   4. Create the function [`n_ops`](#generate_test).
   5. (Optional) Create a dictionary [`arg_ret_type`](#generate_test).
   6. Call [`generate_test`](#generate_test) and store the returned struct as `TestConfig`
3. Edit the `gen_stimuli.py` script, and write the function [`compute_result`](#compute_result) (and optionally [`generate_stimuli`](#generate_stimuli))

### testset.cfg

This file calls the test framework with the correct configuration. It is interpreted as a regular python script. The last line calls `generate_test`:

#### generate_test

This is the main funciton which generates the setset (required for [plptest](https://github.com/pulp-platform/plptest)). It returns a testset structure, which *must* be assigned to a variable called `TestConfig`. This function has the following arguments:

- `function_name`: Name of the function to be tested, without the version suffix (like `_q16`).
- `arguments`: List of [`Argument`s](#arguments)
- `variables`: List of [`Variable`s](#variables)
- `implemented`: Dictionary, which has the following structure (the first dictionary must always contain the keys `'riscy'` and `'ibex'`!):
  ```
  {
    'riscy': {
      'i8': True,
      'i16': True,
      #...
      'i8_parallel': False,
      #...
    },
    'ibex' :{
      #...
    }
  }
  ```
- (optional) `use_l1`: Boolean, default value for using L1 scratchpad memory for the arrays or not. For IBEX test cases, L2 is always used. This value can be overwritten for every `Argument` individually.
- (optional) `extended_output`: Boolean. If `True`, the test will print out all mistakes (their position, the expected value and the acquired result). This should be disabled when running on a board!
- (optional) `n_ops`: Funciton, which maps the current `version` (from `implemented`) to a number of ops. This is used for bechmarking.
- (optional) `arg_ret_type`: Dictionary, which maps the `version` to the ctype, which is used for `arg_type` and `ret_type` in the `Variable`s. It has the following form:
  ```
  {
	'i32':   ('int32_t', 'int32_t'),
	'i16':   ('int16_t', 'int16_t'),
    #...
  }
  ```
  If a version is not present in this dictionary, the following default values are used:
  | version | `var_type` | `ret_type` |
  | ------- | ---------- | ---------- |
  | `i8`    | `int8_t`   | `int32_t`  |
  | `i16`   | `int16_t`  | `int32_t`  |
  | `i32`   | `int32_t`  | `int32_t`  |
  | `q8`    | `int8_t`   | `int32_t`  |
  | `q16`   | `int16_t`  | `int32_t`  |
  | `q32`   | `int32_t`  | `int32_t`  |
  | `f32`   | `float`    | `float`    |

#### Variables

Variables are used to sweep over multiple different test instances (e.g. dimensions). There are two different variable types:

##### SweepVariable

These variables are used to define the sweeps. It's constructor has the following arguments:

- `name`: Name for the variable, which can be used later for [`Argument`s](#arguments)
- `values`: List (or other iterable) over all values to be swept.
- (optional) `visible`: Boolean. If `True`, this variable will appear in the test name. If `False`, the variable is hidden.

##### DynamicVariable

If there are other parameters, which depend on `SweepVariable`s, but are different, then you can use `DynamicVariable`. You can specify a function based in previously defined `Variable`s (in the `variables` list).

- `name`: Name for the variable, which can be used later for [`Argument`s](#arguments)
- `fun`: function: `F: dict(str, number) -> number`, which maps the environment (previous `Arguments`) to a value.
- (optional) `visible`: Boolean. If `True`, this variable will appear in the test name. If `False`, the variable is hidden.

#### Arguments

With arguments, you describe how the function, which is tested, looks like. There are several different argument types:

##### Default Argument

This argument represents a single scalar argument for the function. It's constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization
  - The name of a `SweepVariable` or `DynamicVariable`, to take their value for the current iteration.
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized.

##### ArrayArgument

This argument represents an array argument for the function, which is passed via a pointer. It's constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization, where all elements of the array will have this value,
  - `np.ndarray` to set the array to this constant value (the length must match!)
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized.

##### OutputArgument

This argument represents an array, to which the function writes the result. A funciton declaration can have multiple `OutputArgument`. This argument is passed to the function as a pointer. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: Constant number (`float`) or a funciton, which maps the current `version` (without the `_parallel` suffix) to a float value representing the relative *or* absolute tolerance. The tolerance is respected for both integer type arrays and floating-point arrays. If the value is less than 1, the tolerance is interpreted as relative tolerance. If the value is greater than 1, it is interpreted as absolute tolerance. For floating-point types, only relative tolerance is allowed.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized and checked.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result.

##### InplaceArgument

This argument represents an array, which is used as both input and output (if the operation is done inplace). As for `OutputArgument`, there can be mulitple `InplaceArgument`s (and `OutputArgument`s). This argument is passed to the function as a pointer. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization, where all elements of the array will have this value,
  - `np.ndarray` to set the array to this constant value (the length must match!)
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: Constant number (`float`) or a funciton, which maps the current `version` (without the `_parallel` suffix) to a float value representing the relative *or* absolute tolerance. The tolerance is respected for both integer type arrays and floating-point arrays. If the value is less than 1, the tolerance is interpreted as relative tolerance. If the value is greater than 1, it is interpreted as absolute tolerance. For floating-point types, only relative tolerance is allowed.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized and checked.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result. The test framework will also automatically generate setup procedure to reset the array every time the function is called. This way, we make sure that the benchmark always runs on the same data (in case the runtime of the funciton is dependent on the data).

##### ReturnValue

This represents the value, which is returned by the function. If nothing is returned by the function, then this argument cannot be used!. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: Constant number (`float`) or a funciton, which maps the current `version` (without the `_parallel` suffix) to a float value representing the relative *or* absolute tolerance. The tolerance is respected for both integer type arrays and floating-point arrays. If the value is less than 1, the tolerance is interpreted as relative tolerance. If the value is greater than 1, it is interpreted as absolute tolerance. For floating-point types, only relative tolerance is allowed.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized and checked.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result.

##### FixPointArgument

This is very similar to the [default `Argument`](#default-argument), but it represents the fix-point position used in the computation. This argument is only added to the test for fix-point versions. And if fix-point versions are used, exactly one `FixPointArgument` is required. The `ctype` is always assumed to be `uint32_t`. It has the following arguments:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization
  - The name of a `SweepVariable` or `DynamicVariable`, to take their value for the current iteration.
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized

##### ParallelArgument

This is very similar to the [default `Argument`](#default-argument), but it represents the number of processor cores used in the parallel version. This argument is only added to the test for parallel versions. And if parallel versions are used, exactly one `ParallelArgument` is required. The `ctype` is always assumed to be `uint32_t`. It has the following arguments:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization
  - The name of a `SweepVariable` or `DynamicVariable`, to take their value for the current iteration.
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized

##### CustomArgument

Custom arguments allow tests to be very flexible. They can either be used to [link](#link-to-static-struct) to a static variable / array / struct, or they can be used to [generate a struct](#generating-structs). It has the following arguments:

- `name`: Name of the argument, which is only used internally, and does not need to match the one from the function declaration.
- `value`: Function, which should return a string for initializing the `CustomVariable`. By using other arguments (for which you have set `in_function=False`), you can craft structs. This function can produce a multi-line initialization string. The function has the following arguments:
  - `env: dict(name: str, value: number)`: Dictionary with the environment
  - `version: str`: Version string
  - `var_type: tuple(str, str)`, which contains `(var_type, ret_type)`
  - `use_l1`: Bool, wether to use L1 memory.
  The function *must* return the entire string for initialization, including the type and the name of the variable.
- (optional) `as_ptr`: Boolean to tell the framework how to pass the variable to the function. Default is `False`.
- (optional) `deref`: Boolean to tell the framework to dereference the variable before passing it to the function. Default is `False`.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized

The string, which is returned by the `value` function, will be inserted into the `data.h` file. Thus, you can even define types, structs, and do fancy things with `CustomArgument`s.

#### Generating Structs

The test framework allows you to generate structs, but it needs a bit more work. Assume, that you wish to create a struct, which contains several values, and some pointers to arrays. Also, assume that the struct type was already defined in the Pulp-DSP  library.

First, we create all attributes as [`Argument`s](#arguments), but we set `in_function=False`. This case, they are treated as regular arguments, are initialized regularly (and are checked if they are `OutputArguments`), but will not appear in the funciton call. Additionally, for [`compute_result`](#compute_result), the arguments will appear normally, so you can use it to compute the result. Note, that this needs to be done in the list before we create the [`CustomArgument`](#customargument).

Then, we can create the [`CustomArgument`](#customargument). For `value`, we write a funciton, which will initialize the struct of the required type normally. As attributes, we can use the names from the previously defined arguments. We can use the arguments (as described [here](#customargument)) to generate the required type for the struct, and for all the attributes.

In the following example, we will call the function `void plp_mat_mult_i8vp_xpulpv2(void* args)`, and pass in the argument `plp_mat_mult_instance_i8`, which is defined as follows:

```
// in plp_math.h
typedef struct
{
    const int8_t * __restrict__ pSrcA;
    const int8_t * __restrict__ pSrcB;
    uint32_t M;
    uint32_t N;
    uint32_t O;
    uint32_t nPE;
    int32_t * __restrict__ pDstC;
} plp_mat_mult_instance_i8;
```

To use this struct and pass it to the function under test, we first write a python function for the `CustomArgument`, which returns a string to initialize the struct. For this, we can add constants (like `.nPE = 8`), refer to arguments in the `arguments` list (with their name), we can access a `SweepVariable` or `DynamicVariable` in the `env` dictionary, or use the `version`, `var_type` or the `use_l1` flag. This is a normal python function, so you can build whatever you like here. Since the function `plp_mat_mult_i8vp_xpulpv2` takes a `void*` pointer as an input argument, we create a `void*` pointer `pArgs` to pass to the function. This will make sure that there will be no compiler warnings or errors.
```
from textwrap import dedent
def mat_mult_instance(env, version, var_type, use_l1):
    version_prefix = version.split("_")[0] # remove the _parallel from the version
    return dedent(
        """\
        plp_mat_mult_instance_{ver} args = {
            .pSrcA = pSrcA,
            .pSrcB = pSrcB,
            .M = {m},
            .N = {n},
            .O = {o},
            .nPE = 8,
            .pDstC = pDst
        };
        void* pArgs = (void*)&args;
        """.format(ver=version_prefix, m=env['len_m'], n=env['len_n'], o=env['len_o'])
    )
```

Then, we generate generate the arguments list by adding all arrays, but setting `in_function=False`. In the end, we create the `CustomArgument`.

```
arguments = [
    ArrayArgument('pSrcA', 'var_type', 'len_srcA', in_function=False),
    ArrayArgument('pSrcB', 'var_type', 'len_srcB', in_function=False),
    OutputArgument('pDst', 'ret_type', 'len_res', in_function=False),
    CustomArgument('pArgs', mat_mult_instance, as_ptr=False)
]
```

Note, that the name of the `CustomArgument`, `pArgs`, is also used to initialize the struct. In the `gen_stimuli.py` file, the function `compute_result` is still called for `pDst`, and the argument `inputs` will contain `pSrcA` and `pSrcB`. But those arguments will not be written to the arguments list. We set `as_ptr=False`, because we already pass a pointer to `void` into the function.

*Important*: If you wish to use a scalar argument (e.g. `Argument`) in the struct, which is a `float`, then you need to append `.f` to the name of the argument when creating the struct in the `value`-function of the `CustomArgument`. (If the type is version specific, then you need to append the `.f` only for the float version, and no suffix for the integer or fix-point version.)

#### Link to Static Structs

To link to a static struct, which is defined somewhere in the pulp dsp library. This can be done by using a [`CustomArgument`](#customargument). Write the `value` function, such that:
1. the respective header file from pulp-dsp is included, (if necessary),
2. the variable is declared and defined, by giving it the requred type, and setting it to the required value (probably the address of the target struct).
Then, set `as_ptr` respectively.

Alternatively, you can also define the struct type right before defining the variable.

### gen_stimuli.py

This file contains the functions for generating the stimuli and the expected result.

#### compute_result

This function (with the exact name `compute_result`) computes the result of one output (either [`OutputArgument`](#outputargument) or [`ReturnValue`](#returnvalue)). If there are multiple such arguments defined in [`testset.cfg`](#testset.cfg), then this function is called multiple times, with different parameters. The function must take the following arguments:

- `result_parameter`: Either [`OutputArgument`](#outputargument) or [`ReturnValue`](#returnvalue), the one for which the result must be computed. You can use `result_parameter.name`, `result_parameter.ctype` or `result_parameter.length` to write the function.
- `inputs`: A list of [`Argument`s](#arguments). Use `inputs[i].value` to get the stimuli for the function.
- `env`: A dictionary, which maps the [`Variable`](#variables) name to a value.
- `fix_point`: Either `None` if fix_point is not used, or the specific positoin of the fix-point for this iteration.

This function *must* return the `np.ndarray` with the expected result.

#### generate_stimuli

This optional function (with the exact name `generate_stimuli`) will generate the stimuli vector (or scalar) for [`Argument`s](#default-argument) or [`ArrayArgument`s](#arrayargument), for which the `value` is set to `'gen_stimuli'`. This function can be called multiple times, for each of these arguments once. It takes in the following arguments:

- `argument`: Either [`Argument`s](#default-argument) or [`ArrayArgument`s](#arrayargument) for which the stimuli need to be generated. Use `argument.name`, `argument.ctype` and `argument.length` to write this function.
- `env`: A dictionary, which maps the [`Variable`](#variables) name to a value.

This function *must* return the `np.ndarray` with the expected result.

## Usage

### Testing Pulp-DSP

To execute the tests, you need to change directory into either `test/mrWolf`, or any of it's subdirectories. Then, start plptest with:

```
plptest --threads 1
```

Running all tests will take a while. As soon as all tests are finished, plptest will show you a summary of all executed tests and if they passed or failed.

### Target platform & Pulp-SDK Compatibility

In recent versions of Pulp-SDK, the platform configuration changed. In earlier versions, the platform could be chosen by sourcing `pulp-sdk/configs/platform-<PLATFORM>.sh`. However, this was removed in recent versions, and replaced by adding the `platform=<PLATFORM>` flag to `make run` (this flag is already available in earlier versions). In order to guarantee compatibility with different Pulp-SDK versions, the test framework chooses the platform in the following way:

- If the environment variable `TEST_PLATFORM` is set, then the tests are run with `make run platform=$TEST_PLATFORM`. Simply run `TEST_PLATFORM=board plptest --threads 1` to execute the tests on an actual board.
- The old platform configuration script `pulp-sdk/configs/platform-<PLATFORM>.sh` sets the environment variable `PULP_CURRENT_CONFIG_ARGS=platform=<PLATFORM>`. If this variable is set (and `TEST_PLATFORM` is not), then the tests are executed with `make run $PULP_CURRENT_CONFIG_ARGS`. This will ensure that the configuration is applied.
- If neither of the two environment variables `TEST_PLATFORM` or `PULP_CURRENT_CONFIG_ARGS` are set, then the tests are run with `make run platform=gvsoc`.

### Benchmarking

Every test will measure it's cycles and instructions. After every test is complete (and passed), all measurements will be written to the csv file: `test/mrWolf/bench_YYYY-MM-DD_hh:mm:ss.csv`. The time is is set to be when the test is started. After the test is complete, you can use `test/mrWolf/bench.py` to print out the results in a human-readable format. This script has two modes of operation:

- `view`: view a benchmark file. 
  - `-b BENCH_FILE` or `--bench-file BENCH_FILE`: the benchmark file to show. If not set, take the most recent one.
  - `-f FUNCITON` or `--funciton FUNCTION`: regex string, only results with a function name that matches the regex will be shown
  - `-d DEVICE` or `--device DEVICE`: regex string, only results with a device that matches the regex will be shown
- `compare`: compare two benchmarks, an old with the new, and shows the difference. It only shows test found in both the old and the new benchmark file.
  - `-n NEW_BENCH_FILE` or `--new-bench-file NEW_BENCH_FILE`: the benchmark file to show. If not set, take the most recent one.
  - `-o OLD_BENCH_FILE` or `--old-bench-file OLD_BENCH_FILE`: the benchmark file to compare to.
  - `-f FUNCITON` or `--funciton FUNCTION`: regex string, only results with a function name that matches the regex will be shown
  - `-d DEVICE` or `--device DEVICE`: regex string, only results with a device that matches the regex will be shown

## Debugging

Sometimes, it is nice to see what went wrong, when writing the tests. When the tests don't compile, the result will also be `KO` (just like if there was a mismatch). However, if there was a mismatch, it will be printed to `stdout` (except the flag `extended_output=False` is overwritten). To see what went wrong, start the tests as follows:

```
plptest --threads 1 --stdout
```

The test will generate all necessary source files automatically. But, they are removed after the test passed or failed. You can still view the generated files by canceling the test during compilation (by pressing `Ctrl-C`). This should be done about 2 seconds after the test has started (when gcc is executed). Then, you can inspect the files. You can make changes on the fly, and check if it works by manually running `make clean all run`.

## Explenation of the internals

This test framework is based around `plptest`. In `plptest`, every test is configured in the class `plptest.Test` (renamed to `PulpTest` in `pulp_dsp_test.py`). Such a test can have a name, and commands to execute. Based on this architecture, this test framework is built around two different phases: The [Test Declaration](#test-declaration) phase, and the [Test Definition](#test-definition) phase. The first test declares the test to have execute the following commands:

1. `python3 pulp_dsp_test.py --setup --device [ibex|riscy]`: The following files are created:
   - For `ibex`: `test.c` (main), which calls the function-under-test multiple times, and the `Makefile`.
   - for `riscy`: `test.c` (main), which calls the cluster code, `cluster.c` and `cluster.h` which calls the function-under-test, and the `Makefile`.
2. `make clean --build-dir=BUILD_DIR`: clear the build directory
3. `python3 pulp_dsp_test.py --gen --json JSON_STRING`: Generate all stimuli, compute the expected results, and write everything into `data.h`.
4. `make all --build-dir=BUILD_DIR`: Compile the test
5. `make run --build-dir=BUILD_DIR`: Run the test
6. `python3 pulp_dsp_test --clean --device [ibex|riscy]`: Remove all files created in step 1 and 3.
7. Check, which calls `check_output` in `pulp_dsp_test.py`. Here, we can reuse the test object by using the parameter `test_obj`.

The funciton `main` (for `ibex`) or `cluster_entry` (for `riscy`) calls the function `do_bench` multiple times, with different performance (hardware) counter configurations:

1. Count the number of cycles and instructions. The first iteratoion also checks every element of every `OutputArgument`, `ReturnValue` and `InplaceArgument`. 
2. Count the number of load stalls
3. Count all instruction cache misses
4. Count all TCDM contentions

The result is then written to `stdout`. The function `check_output` in `pulp_dsp_test.py` will then parse the output to find those performance numbers.

### Two phases

We divide the test into two different phases because of the following two reasons:

1. Serializing entire functions is very difficult to do without the use of external libraries. (A design goal of the test framework is not to require any external libraries, such that we don't interfear with the SDK and `plptest`.)
2. We don't want to pass all values of the arrays via strings, because this would result in all arrays being stored on memory in an extremely inefficient format (string representation of numbers might use ~4x more memory). Also, the command line output (when using `--stdout`) would then be way too long to reasonably use it for finding bugs.

#### Serialization and Deserialization
In order to pass information from the first phase to the next one, the data is serialized to a json string. This json string is then passed as command line arguments to the second phase. The serialization and deserialization is done partially manually. We transform each class into a dictionary, including all member variables (using `self.__dict__`) and the class name (using `type(self).__name__`):

```
{
    "class": type(self).__name__,
    "dict": self.__dict__
}
```

For deserializing, we compare the class name, to generate the appropriate class, and fill it's members by setting the `__dict__`. We use `json.dumps` and `json.loads` to serialize and deserialze the dictionary to a string, and reversed. However, in order to pass it as command line arguments to the second phase, we need to escape various characters. First, we escape every `\` to a `\\` (in python: `str.replace("\\", "\\\\")`), and then ``"` to a `\"` (in python: `str.replace("\n", "\\\n")`). The first `\\` makes sure that escaped characters in the json string will remain escaped after reading the json string in the second phase, and the `\n` will make sure that the quotes are not interpreted as single arguments (by the shell), but as characters. This way, we can serialize and deserialize multiline strings, containing various escaped characters.

#### Phase I: Test Declaration

The entry-point of the first phase is the function `generate_test`. In the first phase, all test cases are accumulated. Since we cannot serialize a function, all arguments, in which the programmer can pass functions, must be evaluated in this first phase. However, we don't wish to generate the stimuli and the expected output (reason is already described above). Therefore, all `Argument`s contain the function `apply`, which prepares all arguments, but does not yet generate the stimuli. This function is always called inside the function `to_dict`. In addition, the function `to_dict` will generate a deepcopy of the object, and call `apply` on this, in order to reuse the same argument for the next iteration (next value of the `SweepVariable`s). This phase also selects which arguments to draw, based on the version (hide `FixPointArgument` for all non-fix-point versions, and hide the `ParallelArgument` for all single-core versions).

#### Phase II: Test Generation

The entry-point of this phase is the function `main` (inside the branch `elif args.gen`). In this phase, we first deserialize the json input, and recreate the `Test` object. Then, we generate and write the header file. During this, we generate all stimuli of the input arguments, and compute the expected results of all output arguments (all of this happens in `HeaderWriter.write_test`.

### Handling floating-point arguments

It is important that the floating point values are passe to the function-under-test exactly like the expected output was computed. This is not possible, when using the decimal "string" representation of a float (normal way in which float constants are written in C). The test framework overcomes this limitation by expressing a floating point value in the hexadecimal representation using the python module `struct`:

```
import struct
struct.pack("!f", float_val)
```

This is done in the function `fmt_float`. The `data.h` file is created in the following way:

- *Arrays*: Arrays are stored as `uint32_t[]` arrays in memory (with the name `<NAME>__int`). Then, we typecast the array to a `float*` using (see `HeaderWriter.write_array`):
  ```
  RT_L1_DATA uint32_t <NAME>__int[<LEN>] = [ /*...*/ ];
  RT_L1_DATA float * <NAME> = (float*)((void*)<NAME>__int);
  ```
  Then, in the function, the array is passed normally.
- *Scalars*: Unfortunately, we cannot use the same approach as before to reinterpret the unsigned int as a float. The reason is that you are not allowed to dereference a pointer in a header file. We overcome this problem by defining a union:
  ```
  typedef union {
      uint32_t u;
      float f;
  } __u2f;
  ```
  Unions are ideal for this kind of usecase. Now, we declare the scalar as:
  ```
  RT_L1_DATA __u2f <NAME> = {.u = 0xbf12d71dU};
  ```
  Finally, every time we use the variable (when passing it to the function, when writing to the return value and when checking the return value), we use `<NAME>.f` to interpret the data ase a floating-point number

### Benchmarking

We cannot know the order in which `plptest` executes the tests. Therefore, we also cannot know if this is the first or the last test to be executed. Therefore, we store every result of the test as a single line, every time a test is complete. The `.csv` file is created with the header row if it does not yet exist. The bechmark name is generated and stored as a static variable, once the `pulp_dsp_test.py` file is imported for the first time (any subsequent imports will not overwrite this variable!). Since the check function is passed as a regular python function, and not a shell program, `pulp_dsp_test.py` (and thus the function `check_output`) remains loaded, and the static variable containing the benchmark file will not be changed.

### Limitations, Speed and Future Work

The main limitation of the current framework is the speed. As of the time of writing this part of the documentation, there already exists more than 1200 individual test cases. Every test takes around 3.5 seconds, which makes the total execution time larger than 1 hour. And this is only with a limited number of functions, and we can expect the total number of tests to get around 5000. In this case, waiting 5 hours is no longer feasible. We need to improve the performance of the test framework. Here is a measurement of how long each part takes:

- `python3 pulp_dsp_test.py --setup --device riscy`: *0.20s*
- `make clean`: *0.34s*
- `python3 pulp_dsp_test.py --gen --json JSON_DATA`: *0.22s*
- `make all`: *1.31s*
- `make run`: *0.92s*, where starting the program takes the longest, and actually running it is very quick.
- `python3 pulp_dsp_test.py --clean`: *0.18s*

From those measurements, we can see that all calls to gcc and to `pulp_run` take the longest. Also, importing `pulp_dsp_test.py` takes around 0.17s, which is not very significant. The following things can be done:

- Simply adding all tests to the same test program and compiling it once does not work, because the L1 memory (and maybe also L2) is way too small.
- *TODO* Reduce the number of calls to `pulp_dsp_test.py` by calling clean, setup and gen at once. Unfortunately, this can only reduce the execution time by about 0.35s, which is about 10%.
- *TODO* group all iterations of the tests together. Make sure that all iterations (of the same function, on the same device and of the same version) work on the same data (just use different parts of it). However, the result vectors would still need to be present for all different iterations. This is not a real problem, however, because we can put the expected result on L2 memory, and only use one single output buffer, large enough for the largest iteration. This would definately increase compilation time, and maybe also other parts of the execution. But it would still reduce the running time by a significant factor (I expect the speedup to be about factor 8 if there are 16 different iterations to be tested).
- *TODO* completely change the architecture: compile one program and pass in all data via `stdin`, compute and get the computed results back from `stdout`. This requires major changes to the test infrastructure, but it might give the best speedup, because we only need to compile one program.

#### Other TODOs

- *TODO* Maybe, we can skip the entire serialization and deserialization step by using the check functionality of `plptest`. One has to test if you can declare mutliple check commands, and what to return such that all remaining commands will be executed. This, however, would simplify things, because we don't have to distinguish between those different phases. However, this would increase the memory size dramatically, since all test objects with all arguments and their values will be stored in memory at the same time. It would probably not improve performance that much!
- *TODO* Instead of passing everything via command line arguments, another possiblity would be to pickle the data into files. We would still pass in something like a test identifier, with which we can find the pickled file. But in this case, we would not need to distinguish between the two phases.
