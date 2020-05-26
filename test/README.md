# Test Framework

This folder contains the necessary codes for testing the functions during the development of the library.

## How it works

The test framework is based around [plptest](https://github.com/pulp-platform/plptest). Additionally, the file `test/mrWolf/pulp_dsp_test.py` provides with several functions and classes making the generation of new tests for Pulp-DSP easy and quick.

`pulp_dsp_test.py` expects a description of the function, including all parameters. To test different dimensions, the framework allows you to define several `SweepVariable` (and `DynamicVariable` which are derived from the former). Then, a `Test` is generated for each combination of the `SweepVariables`. This `Test` class is json-serializable, such that it can be passed to `gen_stimuli.py`. All `gen_stimuli.py` also use `plp_dsp_test`, to deserialize the arguments to the `Test` class, allowing seamless integration between `testset.cfg` and `gen_stimuli.py`. The `gen_stimuli.py` generates a file `data.h` with random stimuli vectors and the check function.

## Setup

Before you use the test framework, make sure that the most recent version of [plptest](https://github.com/pulp-platform/plptest) is installed!

## Generating new Test Cases

New tests can be generated using the test_template located at `test/mrWolf/test_template`. The following steps are required:

1. Copy and rename the folder `test/mrWolf/test_template` to `test/mrWolf/[NAME]`.
2. Edit `test/mrWolf/testset.cfg` and add the new test using `add_test_folder`.
3. For both `ibex` and `riscy` subfolders, configure the `testset.cfg` script (is treated as regular python script):
   a. Edit the `device_name` (either `'ibex'` or `'riscy'` and the `function_name`. The `function_name` is the name of the function, without the version (i.e., datatype like i8, q32)
   b. Create the `variables` list. Add one or more `SweepVariable`s, and tests will be created for each combination. This is usually used to generate multiple tests with different dimensionality of the input vectors. However, this is not always enough. As an example, if the output vector has a different length than all input vectors (as it is the case for convolution or matrix multiplication), then you can use `DynamicVariables`, which require a function `f(env: dict) -> val` as an argument. The environment `env` is a dictionary, mapping other variables (`SweeiVariable`s) to their value. See the testcase `test/mrWolf/conv/test_lib/ibex/testset.cfg` as an example.
   c. Create the `arguments` list. The order must be the same as defined in the function declaration. However, the names are used internally, and don't need to match. You can use the following argument types: 
      - `Argument`: basic argument, representing a single value like an integer or a float. The Constructor takes:
	    - `name`: the name used internally, can be chosen arbitrarily (as long as it is unique).
		- `c_type`: either a valid type of `C`, including `stdint.h` or the string `var_type`, in which case the type will be chosen based on the `version`, e.g., `i32` will cause the `var_type` to be replaced with `int32_t`.
		- `value`: either use a specific value, the name of a `Variable` (as defined in the `variables` list) or `None` (the framework will then choose a random value).
		- `use_l1`: Boolean or None. if None, use the default configuration (as specified `generate_test`, see below).
	  - `ArrayArgument`: array argument, which is passed to the funciton as a pointer. 
	    - `name`: the name used internally, can be chosen arbitrarily (as long as it is unique).
		- `c_type`: either a valid type of `C`, including `stdint.h` or the string `var_type`, in which case the type will be chosen based on the `version`, e.g., `i32` will cause the `var_type` to be replaced with `int32_t`. This type refers to the data type that is referenced. 
		- `length`: either a specific size, the name of a `Variable` or a `tuple`: `(min, max)`, in which case a random value in this range will be chosen.
		- `value`: either a list of values (must then have the same length as the `length` argument), a single value (in which case all elements will be initialized with this value), a `tuple`: `(min, max)` where a random value will be chosen in the specified range, or `None`, in which case the entire range available in `c_type` will be used.
		- `use_l1`: Boolean or None. if None, use the default configuration (as specified `generate_test`, see below).
	  - `FixPointArgument`: argument which is only used for the fix-point implementation. This field must specify the position of the binary point. The constructor has identical arguments as `Argument`
	  - `OutputArgument`: array argument which represents the output array. Its constructor has the same arguments as `ArrayArgument`, hosever, without the parameter `value`.
	  - `ReturnValue`: return value of the function. Obviously, there can only ever exist one `ReturnValue` in the `arguments` list. The constructor needs the following arguments:
		- `c_type`: either a valid type of `C`, including `stdint.h` or the string `var_type`, in which case the type will be chosen based on the `version`, e.g., `i32` will cause the `var_type` to be replaced with `int32_t`.
		- `use_l1`: Boolean or None. if None, use the default configuration (as specified `generate_test`, see below).
   d. Edit the `implemented` dictionary. This `dict` maps the version name (like `i32` and `q8`) to a boolean, Only versions which map to `True` will be tested. The `c_type` `var_type` is dependent on this version.
   e. Create the function `n_macs`. This function `n_macs(env: dict) -> int` takes the environment `env` as an argument, which is defined identical as for `DynamicVariables`, see above. It should return the number of macs in an ideal setting (used for benchmarking only).
   f. Call `generate_test` and store the returned struct as `TestConfig`. This function takes the following arguments:
      - `device_name: str`: name of the device (either `'ibex'` or `'riscy'`).
	  - `function_name: str`: name of the function without the version
	  - `arguments: list`: see above
	  - `variables: list`: see above
	  - `implemented: dict`: see above
	  - `use_l1: bool`: default value for `use_l1` for all arguments. This can be overwritten for individual arguments.
	  - `extended_output: bool`: if `True`, all errors will be printed to stdout, can be used for debugging.
	  - `n_macs`: function (see above). If not given, the benchmark will assume that it has 0 macs.
3. For both `ibex` and `riscy` subfolders, edit the `gen_stimuli.py` script. At the bottom of this file, the `pulp_dsp_test.py` framework is included, which handles all parameters and sets up the environment. The only thing, which must be edited, is the function `compute_result`, which represents the Golden Model. This function takes three parameters:
   - `result_parameter`: This is either `OutputArgument` or `ReturnValue`, which tells the function what expected output to generate. This argument has all ambiguity removed, and is instantiated based on the current sweep, which means that `c_type` and `length` are set to a specific type and length. The function `compute_result` will be called multiple times, for each `OutputArgument` or `ReturnValue` that was specified in the `arguments` list.
   - `inputs` This is a dictionary, which maps the name of all arguments to one of the `Argument` object. As for the `result_parameter`, the argument is instantiated properly, and the `c_type`, the `length` and the `value` have specific values, and can be used to generate the result. All `OutputArguments` and the `ReturnValue` are missing in this dictionary.
   - `fix_point`: Either `False` (for no use of fix-point) or the position of the binary point.
   The function must return a list (or numpy array) with the expected result (or a single value in case of `ReturnValue`).

## Usage

### Testing Pulp-DSP

To execute the tests, you need to change directory into either `test/mrWolf`, or any of it's subdirectories. Then, make sure that the correct configuration is loaded:

```
# for simulation in GVSOC:
source ~/pulp/pulp-sdk/configs/platform-gvsoc.sh
# for running it on an actual board:
source ~/pulp/pulp-sdk/configs/platform-board.sh
```

Then, start plptest with:

```
plptest --threads 1
```

Running all tests will take a while. As soon as all tests are finished, plptest will show you a summary of all executed tests and if they passed or failed.

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
