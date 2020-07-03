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
  - None for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).

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
  - None for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).

##### OutputArgument

This argument represents an array, to which the function writes the result. A funciton declaration can have multiple `OutputArgument`. This argument is passed to the function as a pointer. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: Constant number (`float`) or a funciton, which maps the current `version` (without the `_parallel` suffix) to a float value representing the *relative tolerance*. The tolerance is respected for both integer type arrays and floating-point arrays.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result.

##### ReturnValue

This represents the value, which is returned by the function. If nothing is returned by the function, then this argument cannot be used!. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: String, representing the type in `C` to be used (like `int16_t`). If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: Constant number (`float`) or a funciton, which maps the current `version` (without the `_parallel` suffix) to a float value representing the *relative tolerance*. The tolerance is respected for both integer type arrays and floating-point arrays.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result.

##### FixPointArgument

This is very similar to the [default `Argument`](#default-argument), but it represents the fix-point position used in the computation. This argument is only added to the test for fix-point versions. And if fix-point versions are used, exactly one `FixPointArgument` is required. The `ctype` is always assumed to be `uint32_t`. It has the following arguments:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization
  - The name of a `SweepVariable` or `DynamicVariable`, to take their value for the current iteration.
  - None for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).

##### ParallelArgument

This is very similar to the [default `Argument`](#default-argument), but it represents the number of processor cores used in the parallel version. This argument is only added to the test for parallel versions. And if parallel versions are used, exactly one `ParallelArgument` is required. The `ctype` is always assumed to be `uint32_t`. It has the following arguments:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization
  - The name of a `SweepVariable` or `DynamicVariable`, to take their value for the current iteration.
  - None for a random value
  - Tuple `(min, max)` for a random value in the given range
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).

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
