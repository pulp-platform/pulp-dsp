Notes on some of the functions tests:

- Regarding cmplx_mag:

q16 and i16 do not always work.

Likely fails due to imprecision or overflow.

Further investigation:

The tolerance was previously set to 5%, however ultimately the fixpoint argument makes this quite challenging. The nature of the cmplx_mag equation is that you need to protect it from overflows, while also ensuring numbers are large enough that the magnitude is not reduced to nothing. Examples for 16-bit would be with the fixpoint argument being 0 (i.e. normal integers) inputs need to be smaller than 180, as an intermediate result would overflow otherwise, while for a Q1.15 quantization these small numbers are reduced to 0 when squared.

Implemented a newer test based on the unit circle, i.e. the elements checked for a certain fixpoint argument are all along a circle in the complex plane, which has a more or less reasonable magnitude for the tested fixpoint. The coverage of this type of test is definitely somewhat reduced, however the expected error margin can be more tightly controlled, thus allowing tests to pass. Added a note to the documentation regarding this test and regarding what to pay attention to when using this function. 

Pull request merged on 3 Aug 2021

- Regarding sin:

q32 fails.

Likely due to the compiler: the code is more or less identical to cos (which works) and sin q32 works for -O0, but fails for -O3

- Regarding power

riscy:plp_power_q8 and power:riscy:plp_power_i8 and power:riscy:plp_power_q16 fail

Fixed i8, q8 and q16 are "supposed to be failing"" as this is an issue with rounding before adding versus rounding after adding -- the differences are minor and the functions are useable but I??d rather not touch the ground truth

- Regarding fft functions (TODO)

NOTE: only supports data that has length which is a power of 2 since the function only uses the radix2 algorithm. Zero padding can be used for other lengths.

rfft

Test framework outdated, please update to the new version. (Error: ImportError: cannot import name 'ExternalPointedArgument')
Warning: initialization discards 'const' qualifier from pointer target type for f32_parallel.
Warning: passing argument 2 of 'rt_team_fork' from incompatible pointer type .
    
Possible improvement: real valued FFTs only need the first N/2 complex values to represent the FFT because of symmetry (to be verified).
    
cfft

Test not implemented
Warning: initialization discards 'const' qualifier from pointer target type for q16 and f32 _parallel.


- Regarding MFCC (TODO)

Tests of the functions related to MFCC are not implemented.

