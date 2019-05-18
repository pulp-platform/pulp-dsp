This folder contains the necessary codes for testing the functions during the development of the library.

`gen_stimuli.py` is used to generate header files containing data used for testing.

Currently it supports generation of two vectors for dot product. It randomly generates the two vectors and saves them into a header file together with the respected expected (right) result from dot product.
The inputs to the gen_stimuli.py are:

- name of the header file containing generated data
- variable type: int32_t, int16_t, or int8_t
- precision of the elements of the vectors in bits: 32, 16, or 8
- minimum extreme of the range of the values in the vectors
- maximum extreme of the range of the values in the vectors
- length of the vectors

[TODO: reorganize the inputs: remove some unnecessary ones, add where the data needs to be saved (i.e. RT_L2_DATA or RT_CL_DATA), what kind of stimuli (vectors, matrices, ...)].

`gen_Makefile.py` generates Makefile.

Inputs to the function are:

- precision in bits: 32, 16, or 8
- method: running on FC or CL

[TODO: the code was developped previously for plotting performance against vector length for previous implementations of dot product on Mr. Wolf. Needs to be adapted.]

`create_csv.py` is used to create csv files of performance measurements. The results from the performance counters are printed out in the terminal and redirected to a text file. Given the name of this text file as input to create_csv.py, a csv table with performance measurements is created.

`run.py` wraps up all the previous functions and runs the interested function (for now only dot product function is tested) over a desired range of vector lengths in the desired precision(s).

[TODO: needs to be adapted.]
 

Currently the library is being tested on Mr.Wolf, in the folder mrWolf several subfolders are present:

- `test_data`: contains the data needed for testing the functions. For now it contains vec_data.h for dot product function (i.e. two vector or desired length and the expected result from the dot product).

- `test_fct`: is used during the very first implementations and development of the functions for the library.

- `test_lib`: after testing the functions in the previous folder, the tested function will be added into ../Source and consequently added to the static library in ../Lib. This folder is used for testing the function included in the static library (.a) to double check the correctness and the performance.

Both `test_fct` and `test_lib` contain three subdirectories to test on fabric controller with ibex extensions, on cluster single core and on cluster multicore with riscy extensions.
