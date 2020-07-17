FC_SRCS = \
	src/StatisticsFunctions/plp_mean_f32.c \
	src/StatisticsFunctions/plp_mean_i32.c src/StatisticsFunctions/kernels/plp_mean_i32s_rv32im.c \
	src/StatisticsFunctions/plp_mean_i16.c src/StatisticsFunctions/kernels/plp_mean_i16s_rv32im.c \
	src/StatisticsFunctions/plp_mean_i8.c src/StatisticsFunctions/kernels/plp_mean_i8s_rv32im.c \
	src/StatisticsFunctions/plp_max_f32.c \
	src/StatisticsFunctions/plp_max_i32.c src/StatisticsFunctions/kernels/plp_max_i32s_rv32im.c \
	src/StatisticsFunctions/plp_max_i16.c src/StatisticsFunctions/kernels/plp_max_i16s_rv32im.c \
	src/StatisticsFunctions/plp_max_i8.c src/StatisticsFunctions/kernels/plp_max_i8s_rv32im.c \
	src/StatisticsFunctions/plp_min_f32.c \
	src/StatisticsFunctions/plp_min_i32.c src/StatisticsFunctions/kernels/plp_min_i32s_rv32im.c \
	src/StatisticsFunctions/plp_min_i16.c src/StatisticsFunctions/kernels/plp_min_i16s_rv32im.c \
	src/StatisticsFunctions/plp_min_i8.c src/StatisticsFunctions/kernels/plp_min_i8s_rv32im.c \
	src/StatisticsFunctions/plp_power_f32.c \
	src/StatisticsFunctions/plp_power_i32.c src/StatisticsFunctions/kernels/plp_power_i32s_rv32im.c \
	src/StatisticsFunctions/plp_power_i16.c src/StatisticsFunctions/kernels/plp_power_i16s_rv32im.c \
	src/StatisticsFunctions/plp_power_i8.c src/StatisticsFunctions/kernels/plp_power_i8s_rv32im.c \
	src/StatisticsFunctions/plp_power_q32.c src/StatisticsFunctions/kernels/plp_power_q32s_rv32im.c \
	src/StatisticsFunctions/plp_power_q16.c src/StatisticsFunctions/kernels/plp_power_q16s_rv32im.c \
	src/StatisticsFunctions/plp_power_q8.c src/StatisticsFunctions/kernels/plp_power_q8s_rv32im.c \
	src/FastMathFunctions/plp_sqrt_f32.c \
	src/FastMathFunctions/plp_sqrt_q32.c src/FastMathFunctions/kernels/plp_sqrt_q32s_rv32im.c \
	src/FastMathFunctions/plp_sqrt_q16.c src/FastMathFunctions/kernels/plp_sqrt_q16s_rv32im.c \
	src/StatisticsFunctions/plp_var_f32.c \
	src/StatisticsFunctions/plp_var_i32.c src/StatisticsFunctions/kernels/plp_var_i32s_rv32im.c \
	src/StatisticsFunctions/plp_var_i16.c src/StatisticsFunctions/kernels/plp_var_i16s_rv32im.c \
	src/StatisticsFunctions/plp_var_i8.c src/StatisticsFunctions/kernels/plp_var_i8s_rv32im.c \
	src/StatisticsFunctions/plp_var_q32.c src/StatisticsFunctions/kernels/plp_var_q32s_rv32im.c \
	src/StatisticsFunctions/plp_var_q16.c src/StatisticsFunctions/kernels/plp_var_q16s_rv32im.c \
	src/StatisticsFunctions/plp_var_q8.c src/StatisticsFunctions/kernels/plp_var_q8s_rv32im.c \
	src/StatisticsFunctions/plp_std_q32.c src/StatisticsFunctions/kernels/plp_std_q32s_rv32im.c \
	src/StatisticsFunctions/plp_std_q16.c src/StatisticsFunctions/kernels/plp_std_q16s_rv32im.c \
	src/StatisticsFunctions/plp_std_q8.c src/StatisticsFunctions/kernels/plp_std_q8s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_f32_parallel.c \
	src/BasicMathFunctions/plp_dot_prod_q32_parallel.c \
	src/BasicMathFunctions/plp_dot_prod_i32_parallel.c \
	src/SupportFunctions/plp_copy_i32.c src/SupportFunctions/kernels/plp_copy_i32s_rv32im.c \
	src/SupportFunctions/plp_copy_f32.c \
	src/SupportFunctions/plp_fill_i32.c src/SupportFunctions/kernels/plp_fill_i32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_f32.c \
	src/BasicMathFunctions/plp_dot_prod_q8.c src/BasicMathFunctions/kernels/plp_dot_prod_q8s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_q16.c src/BasicMathFunctions/kernels/plp_dot_prod_q16s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_q32.c src/BasicMathFunctions/kernels/plp_dot_prod_q32s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i8.c src/BasicMathFunctions/kernels/plp_dot_prod_i8s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i16.c src/BasicMathFunctions/kernels/plp_dot_prod_i16s_rv32im.c \
	src/BasicMathFunctions/plp_dot_prod_i32.c src/BasicMathFunctions/kernels/plp_dot_prod_i32s_rv32im.c \
	src/FilteringFunctions/plp_correlate_i32.c src/FilteringFunctions/kernels/plp_correlate_i32s_rv32im.c \
	src/FilteringFunctions/plp_correlate_i16.c src/FilteringFunctions/kernels/plp_correlate_i16s_rv32im.c \
	src/FilteringFunctions/plp_correlate_i8.c src/FilteringFunctions/kernels/plp_correlate_i8s_rv32im.c \
	src/FilteringFunctions/plp_correlate_q8.c src/FilteringFunctions/kernels/plp_correlate_q8s_rv32im.c \
	src/FilteringFunctions/plp_correlate_q16.c src/FilteringFunctions/kernels/plp_correlate_q16s_rv32im.c \
	src/FilteringFunctions/plp_correlate_q32.c src/FilteringFunctions/kernels/plp_correlate_q32s_rv32im.c \
	src/FilteringFunctions/plp_conv_i32.c src/FilteringFunctions/kernels/plp_conv_i32s_rv32im.c \
	src/FilteringFunctions/plp_conv_i16.c src/FilteringFunctions/kernels/plp_conv_i16s_rv32im.c \
	src/FilteringFunctions/plp_conv_i8.c src/FilteringFunctions/kernels/plp_conv_i8s_rv32im.c \
	src/FilteringFunctions/plp_conv_valid_i32.c \
	src/FilteringFunctions/plp_conv_valid_i16.c \
	src/FilteringFunctions/plp_conv_valid_i8.c \
	src/FilteringFunctions/plp_conv_valid_rep_i16.c \
	src/FilteringFunctions/plp_conv_valid_rep_i8.c \
	src/FilteringFunctions/plp_conv_i32_parallel.c \
	src/FilteringFunctions/plp_conv_i16_parallel.c \
	src/FilteringFunctions/plp_conv_i8_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_i32.c src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i32s_rv32im.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_i16.c src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i16s_rv32im.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_i8.c src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i8s_rv32im.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_q32.c src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q32s_rv32im.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_q16.c src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q16s_rv32im.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_q8.c src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q8s_rv32im.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_i32_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_i16_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_i8_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_q32_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_q16_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_q8_parallel.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_f32.c \
	src/MatrixFunctions/mat_mult/plp_mat_mult_f32_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_i32.c src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i32s_rv32im.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_i16.c src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i16s_rv32im.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_i8.c src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i8s_rv32im.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_i32_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_i16_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_i8_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_q32.c src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q32s_rv32im.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_q16.c src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q16s_rv32im.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_q8.c src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q8s_rv32im.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_q32_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_q16_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_q8_parallel.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_f32.c \
	src/MatrixFunctions/mat_mult_trans/plp_mat_mult_trans_f32_parallel.c \
	src/TransformFunctions/kernels/plp_bitreversal_rv32im.c \
	src/TransformFunctions/plp_cfft_q16.c src/TransformFunctions/kernels/plp_cfft_q16s_rv32im.c \
	src/TransformFunctions/plp_rfft_f32.c \
	src/TransformFunctions/plp_rfft_f32_parallel.c \
	src/CommonTables/plp_common_tables.c \
	src/CommonTables/plp_const_structs.c \
	src/MatrixFunctions/mat_add/plp_mat_add_i32.c src/MatrixFunctions/mat_add/kernels/plp_mat_add_i32s_rv32im.c \
	src/MatrixFunctions/mat_add/plp_mat_add_i16.c src/MatrixFunctions/mat_add/kernels/plp_mat_add_i16s_rv32im.c \
	src/MatrixFunctions/mat_add/plp_mat_add_i8.c src/MatrixFunctions/mat_add/kernels/plp_mat_add_i8s_rv32im.c \
	src/MatrixFunctions/mat_add/plp_mat_add_f32.c \
	src/MatrixFunctions/mat_add/plp_mat_add_i32_parallel.c \
	src/MatrixFunctions/mat_add/plp_mat_add_i16_parallel.c \
	src/MatrixFunctions/mat_add/plp_mat_add_i8_parallel.c \
	src/MatrixFunctions/mat_add/plp_mat_add_f32_parallel.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_i32.c src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i32s_rv32im.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_i16.c src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i16s_rv32im.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_i8.c src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i8s_rv32im.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_f32.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_i32_parallel.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_i16_parallel.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_i8_parallel.c \
	src/MatrixFunctions/mat_sub/plp_mat_sub_f32_parallel.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_i32.c src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i32s_rv32im.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_i16.c src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i16s_rv32im.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_i8.c src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i8s_rv32im.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_f32.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_i32_parallel.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_i16_parallel.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_i8_parallel.c \
	src/MatrixFunctions/mat_scale/plp_mat_scale_f32_parallel.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_i32.c src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i32s_rv32im.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_i16.c src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i16s_rv32im.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_i8.c src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i8s_rv32im.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_f32.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_i32_parallel.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_i16_parallel.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_i8_parallel.c \
	src/MatrixFunctions/mat_trans/plp_mat_trans_f32_parallel.c \
	src/MatrixFunctions/mat_inv/plp_mat_inv_f32.c \
	src/MatrixFunctions/mat_inv/plp_mat_inv_f32_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_i32.c src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i32s_rv32im.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_i16.c src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i16s_rv32im.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_i8.c src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i8s_rv32im.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_q32.c src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q32s_rv32im.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_q16.c src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q16s_rv32im.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_q8.c src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q8s_rv32im.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_i32_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_i16_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_i8_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_q32_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_q16_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_q8_parallel.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_f32.c \
	src/MatrixFunctions/mat_fill_I/plp_mat_fill_I_f32_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_i32.c src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i32s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_i16.c src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i16s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_i8.c src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i8s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_q32.c src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q32s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_q16.c src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q16s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_q8.c src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q8s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_i32_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_i16_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_i8_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_q32_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_q16_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_q8_parallel.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_f32.c \
	src/MatrixFunctionsStride/mat_mult_stride/plp_mat_mult_stride_f32_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_i32.c src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i32s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_i16.c src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i16s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_i8.c src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i8s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_i32_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_i16_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_i8_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_q32.c src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q32s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_q16.c src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q16s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_q8.c src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q8s_rv32im.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_q32_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_q16_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_q8_parallel.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_f32.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/plp_mat_mult_trans_stride_f32_parallel.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_i32.c src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i32s_rv32im.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_i16.c src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i16s_rv32im.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_i8.c src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i8s_rv32im.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_f32.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_i32_parallel.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_i16_parallel.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_i8_parallel.c \
	src/MatrixFunctionsStride/mat_add_stride/plp_mat_add_stride_f32_parallel.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_i32.c src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i32s_rv32im.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_i16.c src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i16s_rv32im.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_i8.c src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i8s_rv32im.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_f32.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_i32_parallel.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_i16_parallel.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_i8_parallel.c \
	src/MatrixFunctionsStride/mat_sub_stride/plp_mat_sub_stride_f32_parallel.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_i32.c src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i32s_rv32im.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_i16.c src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i16s_rv32im.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_i8.c src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i8s_rv32im.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_f32.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_i32_parallel.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_i16_parallel.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_i8_parallel.c \
	src/MatrixFunctionsStride/mat_scale_stride/plp_mat_scale_stride_f32_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_i32.c src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i32s_rv32im.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_i16.c src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i16s_rv32im.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_i8.c src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i8s_rv32im.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_q32.c src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q32s_rv32im.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_q16.c src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q16s_rv32im.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_q8.c src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q8s_rv32im.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_i32_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_i16_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_i8_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_q32_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_q16_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_q8_parallel.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_f32.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/plp_mat_fill_I_stride_f32_parallel.c \
	src/ComplexMathFunctions/plp_cmplx_mag_q16.c


CL_SRCS = \
	src/StatisticsFunctions/kernels/plp_mean_f32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_mean_i32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_mean_i16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_mean_i8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_max_f32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_max_i32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_max_i16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_max_i8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_min_f32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_min_i32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_min_i16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_min_i8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_f32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_i32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_i16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_i8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_q32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_q16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_power_q8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_f32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_i32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_i16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_i8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_q32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_q16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_var_q8s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_std_q32s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_std_q16s_xpulpv2.c \
	src/StatisticsFunctions/kernels/plp_std_q8s_xpulpv2.c \
	src/FastMathFunctions/kernels/plp_sqrt_f32s_xpulpv2.c \
	src/FastMathFunctions/kernels/plp_sqrt_q32s_xpulpv2.c \
	src/FastMathFunctions/kernels/plp_sqrt_q16s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_f32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_f32p_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q32p_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32p_xpulpv2.c \
	src/SupportFunctions/kernels/plp_copy_i32s_xpulpv2.c \
	src/SupportFunctions/kernels/plp_copy_f32s_xpulpv2.c \
	src/SupportFunctions/kernels/plp_fill_i32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q8v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q16v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_q32s_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i8v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i16v_xpulpv2.c \
	src/BasicMathFunctions/kernels/plp_dot_prod_i32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_correlate_i32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_correlate_i16s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_correlate_i8s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_correlate_q32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_correlate_q16s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_correlate_q8s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i16s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i8s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i32p_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i16p_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_i8p_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_valid_i32s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_valid_i16s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_valid_i8s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_valid_rep_i16s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_valid_rep_i8s_xpulpv2.c \
	src/FilteringFunctions/kernels/plp_conv_parallel_OLA.c \
	src/FilteringFunctions/kernels/plp_conv_parallel_OLA_kernel.c\
	src/FilteringFunctions/kernels/plp_conv_parallel_OLA_kernel.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q32s_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q16v_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q8v_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_i8vp_xpulpv2.c	\
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q32p_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q16vp_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_q8vp_xpulpv2.c	\
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_mult/kernels/plp_mat_mult_f32p_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_i8vp_xpulpv2.c	\
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q32s_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q16v_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q8v_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q32p_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q16vp_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_q8vp_xpulpv2.c	\
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_mult_trans/kernels/plp_mat_mult_trans_f32p_xpulpv2.c \
	src/TransformFunctions/kernels/plp_rfft_f32_xpulpv2.c \
	src/TransformFunctions/kernels/plp_bitreversal_xpulpv2.c \
	src/TransformFunctions/kernels/plp_cfft_q16v_xpulpv2.c \
	src/TransformFunctions/kernels/plp_rfft_f32_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_i8vp_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_add/kernels/plp_mat_add_f32p_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_i8vp_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_sub/kernels/plp_mat_sub_f32p_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_i8vp_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_scale/kernels/plp_mat_scale_f32p_xpulpv2.c \
	src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_trans/kernels/plp_mat_trans_i8vp_xpulpv2.c \
	src/MatrixFunctions/mat_inv/kernels/plp_mat_inv_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_inv/kernels/plp_mat_inv_f32p_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i32s_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i16v_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i8v_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q32s_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q16v_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q8v_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i32p_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i16vp_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_i8vp_xpulpv2.c	\
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q32p_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q16vp_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_q8vp_xpulpv2.c	\
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_f32s_xpulpv2.c \
	src/MatrixFunctions/mat_fill_I/kernels/plp_mat_fill_I_f32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_i8vp_xpulpv2.c	\
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_q8vp_xpulpv2.c	\
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_f32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_stride/kernels/plp_mat_mult_stride_f32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_i8vp_xpulpv2.c	\
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_q8vp_xpulpv2.c	\
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_f32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_mult_trans_stride/kernels/plp_mat_mult_trans_stride_f32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_i8vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_f32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_add_stride/kernels/plp_mat_add_stride_f32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_i8vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_f32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_sub_stride/kernels/plp_mat_sub_stride_f32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_i8vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_f32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_scale_stride/kernels/plp_mat_scale_stride_f32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q16v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q8v_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_i8vp_xpulpv2.c	\
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q32p_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q16vp_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_q8vp_xpulpv2.c	\
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_f32s_xpulpv2.c \
	src/MatrixFunctionsStride/mat_fill_I_stride/kernels/plp_mat_fill_I_stride_f32p_xpulpv2.c


PULP_LIBS = plpdsp # the name of the library, after installing it into the pulp-sdk, add `PULP_LDFLAGS += -lplpdsp` in the Makefile of your project to use this library.
PULP_LIB_FC_SRCS_plpdsp = $(FC_SRCS)
PULP_LIB_CL_SRCS_plpdsp = $(CL_SRCS)

IDIR=$(CURDIR)/include
BUILD_DIR=$(CURDIR)/lib/build
# the build folder is saved here.

PULP_CFLAGS += -I$(IDIR) -O3 -g

INSTALL_FILES += $(shell find include -name *.h)

-include $(PULP_SDK_HOME)/install/rules/pulp.mk

.PHONY: doc fmt
doc:
	cd doc && doxygen doc_config

fmt:
	clang-format -style=file -i $(FC_SRCS) && \
	clang-format -style=file -i $(CL_SRCS) && \
	clang-format -style=file -i $(IDIR)/*
