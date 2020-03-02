This folder contains the necessary codes for testing the functions during the development of the library.

The folder mrWolf/test_template should be used as template to genereate other tests.

For this following steps are nescessary:

- Copy and rename the folder test_template for the new function
- Add the new folder to the top level test mrWolf/testset.cfg
- Adjust the function definition in mrWolf/function_name/test_lib/ibex/testset.cfg and mrWolf/function_name/test_lib/riscy/testset.cfg at the marked place 
[TODO: might want to insert picture or example code to make clear]
- At the same place mark all available versions as True and others as False. For ibex, float should always be False
- Define how to compute the expected output in gen_stimuly.py at the marked place
[TODO: might want to instert picture or example code to make clear]

-Additionally it might be helpfull to copy the test_lib folder into a test_fun folder to test special cases or single
[TODO: maybe also already do this in test_template to demonstrate or mark where to alter code to make this easier] 

The command 'plptest' invoced in the test_lib folder will run all tests for riscy and ibex.
To only test one of them the 'plptest' command can be used in the respective folders.

In order to test the entire library, 'plptest' can be used in the test/mrWolf folder. This will take very long, as it will test every function that has tests defined for it and sweep over all defined variables.

[TODO: add explanation on function definiton part]
[TODO: add explanation on stimuly generation]
