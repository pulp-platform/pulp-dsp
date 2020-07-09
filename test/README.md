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

With arguments, you describe how the function, which is tested, looks like. There are several different argument types.

##### Default Argument

This argument represents a single scalar argument for the function. It's constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: This represents the type in `C` (like `int16_t`). It can be one of the following:
  - String, representing the type. If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
  - [Function](#dynamic-functions), which returns the type as a string.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization
  - The name of a `SweepVariable` or `DynamicVariable`, to take their value for the current iteration.
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - [Function](#dynamic-functions), which returns the value as a number. This function can also return a type described above (like `None`, a `tuple` or a name of a `Variable`), which will lead to the behavior described above.
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). In this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli) (The [Function](#dynamic-functions) should return the resulting value)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized.

##### ArrayArgument

This argument represents an array argument for the function, which is passed via a pointer. It's constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: This represents the type in `C` (like `int16_t`). It can be one of the following:
  - String, representing the type. If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
  - [Function](#dynamic-functions), which returns the type as a string.
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
  - [Function](#dynamic-functions), which returns the the length as a number.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization, where all elements of the array will have this value,
  - `np.ndarray` to set the array to this constant value (the length must match!)
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - [Function](#dynamic-functions), which returns the value as a `np.ndarray`. This function can also return a type described above (like `None`, a `tuple` or a name of a `Variable`), which will lead to the behavior described above.
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). In this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli). (The [Function](#dynamic-functions) should return the resulting array)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized.

##### OutputArgument

This argument represents an array, to which the function writes the result. A funciton declaration can have multiple `OutputArgument`. This argument is passed to the function as a pointer. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: This represents the type in `C` (like `int16_t`). It can be one of the following:
  - String, representing the type. If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
  - [Function](#dynamic-functions), which returns the type as a string.
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
  - [Function](#dynamic-functions), which returns the the length as a number.
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: This is the tolerance for comparing the acquired to the expected value. If the number is greater or equal to 1, it will be interpreted as a absolute tolerance. If it is smaller than 1, it will be interpreted as relative tolerance. This can be one of:
  - `float`, for a constant number,
  - [Function](#dynamic-functions), which returns the the tolerance as a number.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized and checked.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result.

##### InplaceArgument

This argument represents an array, which is used as both input and output (if the operation is done inplace). As for `OutputArgument`, there can be mulitple `InplaceArgument`s (and `OutputArgument`s). This argument is passed to the function as a pointer. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: This represents the type in `C` (like `int16_t`). It can be one of the following:
  - String, representing the type. If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
  - [Function](#dynamic-functions), which returns the type as a string.
- `length`: This represents the length of the array. It can be one of the following:
  - Number for a constant-sized array
  - The name of a `SweepVariable` or `DynamicVariable` to set the length to the value of this variable at the current iteration.
  - Tuple `(min, max)` for a random length.
  - [Function](#dynamic-functions), which returns the the length as a number.
- `value`: This is the value which should be used: It can be one of the following:
  - Number for constant initialization, where all elements of the array will have this value,
  - `np.ndarray` to set the array to this constant value (the length must match!)
  - `None` for a random value
  - Tuple `(min, max)` for a random value in the given range
  - [Function](#dynamic-functions), which returns the value as a `np.ndarray`. This function can also return a type described above (like `None`, a `tuple` or a name of a `Variable`), which will lead to the behavior described above.
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). In this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli). (The [Function](#dynamic-functions) should return the resulting array)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: This is the tolerance for comparing the acquired to the expected value. If the number is greater or equal to 1, it will be interpreted as a absolute tolerance. If it is smaller than 1, it will be interpreted as relative tolerance. This can be one of:
  - `float`, for a constant number,
  - [Function](#dynamic-functions), which returns the the tolerance as a number.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized and checked.

The expected output must be computed in the [`compute_result` function](#compute_result). The test framework will automatically generate a test to check that every element matches the expected result. The test framework will also automatically generate setup procedure to reset the array every time the function is called. This way, we make sure that the benchmark always runs on the same data (in case the runtime of the funciton is dependent on the data).

##### ReturnValue

This represents the value, which is returned by the function. If nothing is returned by the function, then this argument cannot be used!. The constructor has the following parameters:

- `name`: Name of the argument. This is only used internally, and does not need to match the one from the function declaration.
- `ctype`: This represents the type in `C` (like `int16_t`). It can be one of the following:
  - String, representing the type. If the type is dependent on the `version`, you can use either the string `var_type` or `ret_type` (see [`generate_test`](#generate_test)).
  - [Function](#dynamic-functions), which returns the type as a string.
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `tolerance`: This is the tolerance for comparing the acquired to the expected value. If the number is greater or equal to 1, it will be interpreted as a absolute tolerance. If it is smaller than 1, it will be interpreted as relative tolerance. This can be one of:
  - `float`, for a constant number,
  - [Function](#dynamic-functions), which returns the the tolerance as a number.
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
  - [Function](#dynamic-functions), which returns the value as a number. This function can also return a type described above (like `None`, a `tuple` or a name of a `Variable`), which will lead to the behavior described above.
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
  - [Function](#dynamic-functions), which returns the value as a number. This function can also return a type described above (like `None`, a `tuple` or a name of a `Variable`), which will lead to the behavior described above.
  - The string `"gen_stimuli"` (or the constant `pulp_dsp_test.GENERATE_STIMULI`). in this case, the values can be computed in the [`generate_stimuli` function](#generate_stimuli)
- (optional) `use_l1`: Boolean to tell if L1 storage should be used. This overwrites the argument in [`generate_test`](#generate_test).
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized

##### CustomArgument

Custom arguments allow tests to be very flexible. They can either be used to [link](#link-to-static-struct) to a static variable / array / struct, or they can be used to [generate a struct](#generating-structs). It has the following arguments:

- `name`: Name of the argument, which is only used internally, and does not need to match the one from the function declaration.
- `value`: [Function](#dynamic-functions), which should return a string for initializing the `CustomVariable`. By using other arguments (for which you have set `in_function=False`), you can craft structs. This function can produce a multi-line initialization string. The function *must* return the entire string for initialization, including the type and the name of the variable. Note, that every reference to another argument **must** be transformed using the function `arg_name` (passed as argument).
- (optional) `as_ptr`: Boolean to tell the framework how to pass the variable to the function. Default is `False`.
- (optional) `deref`: Boolean to tell the framework to dereference the variable before passing it to the function. Default is `False`.
- (optional) `in_function`: Boolean if `True` (default), this argument will appear in the function arguments. If `False` it is only initialized

The string, which is returned by the `value` function, will be inserted into the `data.h` file. Thus, you can even define types, structs, and do fancy things with `CustomArgument`s.

##### Dynamic Functions

Several Arguments can be setup with functions, which give you fine-grained control over how the test should be built. The arguments for these functions can be chosen dynamically, and the framework will automatically choose the correct parameters to pass in. For this to work, the arguments must have a specific name. The following list shows the possible arguments, their types and the names which you need to choose:

| description                                                   | type                  | possible names                             |
|---------------------------------------------------------------|-----------------------|--------------------------------------------|
| environment, containing the different [variables](#variables) | `dict(str -> number)` | `e`, `env`, `environ`, `environment`       |
| version name (like `q8` or `i32_parallel`)                    | `str`                 | `v`, `ver`, `version`                      |
| target device name (`riscy` or `ibex`)                        | `str`                 | `d`, `dev`, `device`, `t`, `tar`, `target` |
| variable type (tuple: `(var_type, ret_type`)                  | `tuple(str, str)`     | `var`, `vars`, `var_type`, `var_types`     |

For the `value` function in `CustomArgument`s, there are the following additional arguments:

| description                            | type            | possible names                 |
|----------------------------------------|-----------------|--------------------------------|
| if L1 is enabled or disabled           | `bool`          | `l1`, `use_l1`                 |
| Function to transform an argument name | `f: str -> str` | `a`, `arg`, `name`, `arg_name` |

For the `generate_stimuli` funciton in `gen_stimuli.py`, there is an additional argument:

| description                                | type       | possible names         |
|--------------------------------------------|------------|------------------------|
| Argument for which to generate the stimuli | `Argument` | `a`, `arg`, `argument` |

To write such a funciton, you don't need to add all arguments, but just the ones you need. However, the name of the arguments need to match one of the possible names, listed above. The order of the arguments does not matter. As an example, if you write a function and need the environment and the version, then you can use:

```
lambda e, v: do_some_work(e, v)
```

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
def mat_mult_instance(env, version, var_type, use_l1, arg_name):
    version_prefix = version.split("_")[0] # remove the _parallel from the version
    return dedent(
        """\
        plp_mat_mult_instance_{ver} {args} = {
            .pSrcA = {pSrcA},
            .pSrcB = {pSrcB},
            .M = {m},
            .N = {n},
            .O = {o},
            .nPE = 8,
            .pDstC = {pDst}
        };
        void* pArgs = (void*)&args;
        """.format(ver=version_prefix, m=env['len_m'], n=env['len_n'], o=env['len_o'],
                   args=arg_name("args"), pSrcA=arg_name("pSrcA"), pSrcB=arg_name("pSrcB"),
                   pDst=arg_name("pDst"))
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

This test framework is based around `plptest`. In `plptest`, every test is configured in the class `plptest.Test` (renamed to `PulpTest` in `pulp_dsp_test.py`). Such a test can have a name, and commands to execute. 

1. Generate (written as `plptest.Check`): Calls `generate_test_program`, which generate all stimuli, compute the expected results, and generate the entire test program with all necessary files. We use `plptest.Check` because this allows us to pass the test object without serializing and deserializing.
2. `make clean --build-dir=BUILD_DIR`: clear the build directory
3. `make all --build-dir=BUILD_DIR`: Compile the test
4. `make run --build-dir=BUILD_DIR`: Run the test
6. Check (written as `plptest.Check`): Calls `check_output` in `pulp_dsp_test.py`. Here, we can reuse the test object by using the parameter `test_obj`. It also clears all program files of the test.

Each test program will check multiple different cases. All iterations of `SweepVariable`s and `DynamicVariable`s will be grouped to getter for all functions and versions. This way, we reduce the total amount of work required by approximately factor 8. Also, the programmer does not need to think about the test time before adding more test cases and iterations of `SweepVariable`s. The generated test program will have the following files:

- `common.h`: Common declarations (like the union `__u2f` and the macro `ABS`)
- `data_tXX.h`: The stimuli and the expected result, stored for each test case separately.
- `test.c` (`cluster.c` for `riscy` tests): Contains the function `test_entry`, which calls all test cases. Each test case is represented as a function, called `tXX__run_test`. Each of these functions does the following:
   - Setup the test (e.g. copy all necessary data from L2 to L1)
   - Execute `tXX__do_bench` multiple times. Each time, the performance counters (hardware counters) count different metrics:
     1. Count the number of cycles and instructions. The first iteration also checks every element of every `OutputArgument`, `ReturnValue` and `InplaceArgument`. 
     2. Count the number of load stalls
     3. Count all instruction cache misses
     4. Count all TCDM contentions

All results of all test cases will be written to `stdout`. The function `check_output` then parses the output, to assign those performance numbers to the correct test case. Afterwards, the benchmark file will be written.

### Two phases

The tests (assigning concrete values to the name, length, type and value of `Argument`s) are generated in two different phases.

1. In the first phase, we instantiate all names, types and sizes of all arguments. This is done when creating the `AggregateTestCases` in `AggregatedTest.__init__` in the `apply` function of every `Argument`. 
2. In the second phase, the stimuli and the expected result is created. This is done when the data is written to the file. This way, we never store the data in the class, but drop it after the test is written. This reduces the total memory usage.

### Naming Convention

- All variables, arguments and functions of a specific test case are suffixed with `tXX__`.
- The function `tXX__run_test()` sets up some arguments (e.g. copy data from L2 to L1), and calls `tXX__do_bench` multiple times to measure several performance numbers
- The function `tXX__do_bench()` sets up some arguments (e.g. reset the values of an `InplaceArgument`), configures the hardware counter, calls the function-under-test and checks the result (but only on the first iteration).
- For some arguments, multiple variables are generated:
  - `tXX__NAME`: This is the variable which is (usually) passed to the function-under-test.
  - `tXX__NAME__reference`: This is the variable containing the expected result.
  - `tXX__NAME__original`: This is the array containing the original data, used only for `InplaceArgument`.
  - `tXX__NAME__l2`: The l2 data for all arrays, for which `use_l1` is set to true. This way, we can copy the data from `tXX__NAME__l2` to `tXX__NAME` at the start of `tXX__run_test()`.

### Large test programs

We now group multiple test cases to a single test program. Therefore, one test program may contain 20+ test cases, which all need their own data. Thus, it is not possible to store everything directly to L1. Instead, the test framework stores all data into `RT_L2_DATA` as the variable `tXX__NAME__l2`. In addition, for all arrays with `use_l1=True`, we generate an additional pointer (`tXX__NAME`), which is not yet initialized. At the start of `tXX__run_test()`, we allocate the required memory in L1, and store the pointer in `tXX__NAME`. Then, we perform a `memcpy` to copy the data from `tXX__NAME__l2` to `tXX__NAME`. This way, we can generate as many data as fits into `RT_L2_DATA` (which is 448 kB).

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

The main limitation of the current framework is the speed. As of the time of writing this part of the documentation, there already exists more than 1200 individual test cases. Every test takes around 3.5 seconds, which makes the total execution time around 80 minutes. By grouping all iterations of a single function and version into one single executable, the testing time could be reduced from 80 minutes down to 9 minutes (speedup of approx. **9x**). This performance can be increased even more by combining all versions of the same target device together. However, one must make sure that the L1 memory (448kB) is not exceeded.
