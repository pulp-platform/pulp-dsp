#ifndef __FFT_H_16__
#define __FFT_H_16__

typedef int16_t v_type;
RT_L2_DATA int16_t x[1024] = {
-6668, 0, -15553, 0, 4435, 0, -7597, 0, 11350, 0, 5978, 0, -171, 0, 8923, 0, 8841, 0, 12049, 0, 1385, 0, -6970, 0, 3187, 0, 4724, 0, 9576, 0, 8864, 0, -298, 0, -7682, 0, 10577, 0, 10329, 0, -5976, 0, 9399, 0, -4065, 0, 9408, 0, -3092, 0, 13685, 0, -6160, 0, 12139, 0, 5363, 0, 1750, 0, 7665, 0, 3183, 0, -9395, 0, 5515, 0, 4928, 0, -15905, 0, 14829, 0, 15470, 0, 292, 0, 3289, 0, -2919, 0, 7830, 0, 15384, 0, 12191, 0, -14709, 0, 11703, 0, 3894, 0, -951, 0, 3775, 0, -9952, 0, 4285, 0, 15979, 0, -6873, 0, 9440, 0, -7723, 0, 9162, 0, -9943, 0, 16179, 0, 16317, 0, 6750, 0, -2886, 0, -4095, 0, -4206, 0, 15018, 0, -2418, 0, 15582, 0, 14224, 0, 6827, 0, -5847, 0, 2645, 0, 13826, 0, -12102, 0, -4844, 0, -281, 0, 12472, 0, -12271, 0, 8909, 0, -2976, 0, -14872, 0, 2994, 0, -7246, 0, 5536, 0, 9820, 0, -870, 0, -2130, 0, 1938, 0, -11764, 0, -13603, 0, 7952, 0, -1952, 0, -7146, 0, -4770, 0, -11590, 0, -6630, 0, 13913, 0, 4770, 0, -10355, 0, 5984, 0, 3203, 0, 7672, 0, -3765, 0, -10466, 0, -2744, 0, 15125, 0, -1859, 0, -13031, 0, -1819, 0, -13698, 0, 10811, 0, -12490, 0, -11104, 0, 7973, 0, -1812, 0, 1458, 0, 13095, 0, 883, 0, 4507, 0, -15002, 0, -13381, 0, 1230, 0, 7779, 0, -2533, 0, -4880, 0, -15859, 0, -4535, 0, -8702, 0, -15280, 0, -2534, 0, 4212, 0, 2473, 0, -4784, 0, 12652, 0, 11460, 0, -7875, 0, 13131, 0, 8549, 0, -15118, 0, 10986, 0, -12107, 0, 11850, 0, 11424, 0, 9416, 0, -9695, 0, -4481, 0, -12620, 0, -11403, 0, -3601, 0, -3503, 0, 15193, 0, 6724, 0, 16057, 0, 10230, 0, 9675, 0, -16313, 0, 13561, 0, 1977, 0, 10927, 0, -2029, 0, 12143, 0, 6983, 0, -6182, 0, -4041, 0, -10113, 0, 8828, 0, -8101, 0, -12975, 0, -891, 0, 10182, 0, -11187, 0, -2221, 0, -7786, 0, -16199, 0, 11141, 0, -11788, 0, -14686, 0, 15361, 0, -5173, 0, -10062, 0, -8264, 0, 6406, 0, -1539, 0, -9611, 0, 13499, 0, -8978, 0, 9150, 0, 14875, 0, 5753, 0, -1453, 0, -15039, 0, -10085, 0, 13859, 0, -3650, 0, -14376, 0, 12752, 0, -2576, 0, -9670, 0, -8020, 0, -13084, 0, -9183, 0, 16059, 0, 16367, 0, -10888, 0, 1775, 0, 15334, 0, -7094, 0, 9735, 0, 3789, 0, -5363, 0, -450, 0, -7181, 0, 5636, 0, 7513, 0, 4561, 0, 6062, 0, 1160, 0, 12018, 0, -3334, 0, -7003, 0, -11740, 0, 16260, 0, 10249, 0, 14788, 0, 7607, 0, 4436, 0, -13588, 0, 6654, 0, 595, 0, 10750, 0, 11056, 0, 4226, 0, -13786, 0, 949, 0, 10753, 0, -2827, 0, 10569, 0, -2233, 0, -6250, 0, 13163, 0, -14981, 0, -10090, 0, 10983, 0, -11486, 0, -6598, 0, 4647, 0, 5231, 0, 5759, 0, 5915, 0, 8990, 0, 4742, 0, 12706, 0, -3314, 0, -2183, 0, -3924, 0, 9527, 0, 9553, 0, 3273, 0, -12974, 0, 10565, 0, -14019, 0, 14756, 0, 5178, 0, -7648, 0, -8840, 0, -5863, 0, 15022, 0, 10721, 0, 15528, 0, -5066, 0, -13118, 0, 6564, 0, 9152, 0, 232, 0, 10572, 0, -8730, 0, 4318, 0, -14740, 0, -7145, 0, -12740, 0, 11145, 0, -739, 0, 793, 0, -6106, 0, 1646, 0, 8178, 0, -9813, 0, 4545, 0, -3877, 0, -2594, 0, 8023, 0, 197, 0, -15679, 0, 2643, 0, 8480, 0, -6571, 0, -15332, 0, 14166, 0, -9008, 0, -15814, 0, -11613, 0, 4507, 0, 7473, 0, 5616, 0, 13511, 0, 3788, 0, 8621, 0, 9277, 0, 425, 0, -9789, 0, -13406, 0, -3164, 0, 9779, 0, 14853, 0, -10365, 0, 5393, 0, -1151, 0, -15730, 0, 13959, 0, -1306, 0, 10684, 0, 704, 0, -1063, 0, -3419, 0, 6031, 0, 16255, 0, 2766, 0, -161, 0, -10989, 0, 689, 0, -4075, 0, -746, 0, -10419, 0, -241, 0, 14662, 0, -5638, 0, -7167, 0, -4226, 0, 7604, 0, -8683, 0, -126, 0, -2104, 0, -16185, 0, 12411, 0, -1273, 0, 2704, 0, -9647, 0, 14700, 0, -13695, 0, -11502, 0, 12366, 0, 15531, 0, -14631, 0, -6735, 0, -14129, 0, 598, 0, 8645, 0, -888, 0, 7109, 0, 1791, 0, 2705, 0, 9606, 0, 13730, 0, -9100, 0, 15264, 0, 11861, 0, 12019, 0, 12567, 0, -12594, 0, 8765, 0, -1715, 0, -8558, 0, -2039, 0, 13306, 0, -3293, 0, 1085, 0, -5031, 0, -3706, 0, -10352, 0, -14186, 0, 3146, 0, -7976, 0, -3970, 0, 14911, 0, 1731, 0, 7430, 0, 5993, 0, -7402, 0, 401, 0, 8483, 0, 8461, 0, -15589, 0, -15726, 0, -11174, 0, -14262, 0, 16099, 0, 3458, 0, -5207, 0, -1998, 0, -13174, 0, 15273, 0, 10103, 0, 6379, 0, -13211, 0, -15155, 0, -1002, 0, 12347, 0, 11873, 0, 7799, 0, 1607, 0, 4567, 0, 963, 0, 10049, 0, -10783, 0, 9444, 0, 2622, 0, 7132, 0, 7147, 0, -2798, 0, 13116, 0, -8583, 0, -14801, 0, -2983, 0, 185, 0, 6865, 0, -1683, 0, 13641, 0, -14717, 0, -5196, 0, 6113, 0, 12510, 0, -12279, 0, -6680, 0, 14968, 0, -5953, 0, 14848, 0, 12180, 0, -2526, 0, -11072, 0, -13094, 0, -323, 0, -13368, 0, 6818, 0, -5488, 0, -15319, 0, -9526, 0, -3786, 0, 1000, 0, -14915, 0, 10970, 0, -5570, 0, -10686, 0, -2725, 0, -14040, 0, 13821, 0, -14049, 0, -10309, 0, 15071, 0, -11980, 0, 8918, 0, 8474, 0, 4471, 0, 10003, 0, -10717, 0, -9818, 0, -10233, 0, -15402, 0, -16179, 0, 2722, 0, -9264, 0, 12611, 0, 10865, 0, 982, 0, -13269, 0, -7347, 0, -8572, 0, -4415, 0, 3727, 0, 10901, 0, -6395, 0, -10466, 0, 14307, 0, -12234, 0, 9961, 0, 10824, 0, -828, 0, -7966, 0, 1987, 0, 10479, 0, -161, 0, 8804, 0, 13233, 0, -4417, 0, -11609, 0, 2202, 0, -270, 0, -8764, 0, -6492, 0, 3567, 0, -15609, 0, 12302, 0, -10363, 0, -11543, 0, 14309, 0, -7093, 0, 2044, 0, 1150, 0, 14832, 0, 7317, 0, 16205, 0, 9740, 0, 962, 0, 12356, 0, 14561, 0, 
};

RT_L2_DATA int16_t exp_result[1024] = {
11120, 0, 2668, -3439, 12538, -8027, 5575, -17004, 7821, -5539, -250, -7320, -1423, 11067, 6457, 5459, -2839, -1449, -7710, -3115, 14459, -6669, 1695, 2080, -6590, -5288, -1609, 1834, 7811, 2381, -1474, -1162, 5300, -370, 7138, -6115, -1208, 956, 4997, 2920, 9693, 4404, -5768, 8604, -8925, 15439, 4069, -5349, -178, -3234, 2108, 10325, -5661, 2164, 12928, -1303, -9333, 1410, -11736, 1878, -5409, 12587, 4927, -6435, -5515, 4017, -8433, 1961, -7819, -2122, -3882, 3833, 2727, -325, 4981, 4602, -1056, 450, 1834, -2076, 2014, 4830, -5742, 6757, -11506, -2136, -8030, -3540, 5797, -2460, -6604, 756, 3276, -4210, -2085, 6181, 7993, 1828, -3660, 8582, -13698, 9874, 1428, -3026, -6656, 4725, -7581, 1697, -2529, 7835, -515, -2539, 4239, -16042, -11637, -4159, 12549, 8066, 7207, -289, -11590, 9835, -4735, 2514, 4932, 797, 3753, -3071, -3832, 2201, -4782, -8339, -1937, 292, -8867, 8834, 6328, -3008, 11867, 11762, 6728, -5292, -2994, 8288, 9002, 289, -492, -1732, -6730, 8948, -6968, -2271, -6577, -2378, 5663, -6725, -8917, -6665, 8379, 11537, -5822, 319, 12779, -9212, 589, -1433, -2747, -2126, -3960, -5267, 10620, 4990, 4201, 287, 4953, 14247, -9525, 11416, -5602, -14477, -2133, -5754, 3763, -6100, -10325, 16667, -11861, -5807, -622, 3804, 6687, 703, -10574, 1941, 6566, 8132, -1361, 4264, 8649, -2742, 2463, 2857, -11707, 1856, -6119, 6415, 8900, -6026, 862, 9675, 42, 4639, -5984, 2399, 200, 6136, 5448, 8213, 5915, 4696, 9526, 8584, 4498, -6399, -9095, 5327, 3358, -3661, 10466, 4218, -10540, 2353, 6357, -6852, -7207, 931, -12295, 2269, 10523, 8339, 469, -369, -3869, 7049, -5931, -4477, 1621, 11180, 1287, -4098, 2230, -3805, 642, -10758, -10055, -9111, 1371, 9293, -516, 1608, -9340, -1865, -4136, 8120, 8114, 2807, -372, -5989, 5151, -5983, 7212, 2661, -5536, 1812, -928, 1039, 3222, 7109, 4119, 1754, 2145, 5388, 4642, -9120, -2112, 3074, -9149, -2579, 3531, -8883, 1833, 15921, -2288, 674, -7581, 3775, -9574, 1120, -169, -8454, -9861, -12986, 6610, 4868, 9351, 285, -244, 1123, 2732, 7209, -8563, -5387, 12064, 464, 5763, 7213, -7629, 1369, -6695, 12513, 423, 7492, -14308, 13948, -4984, -9489, -4462, 9728, 353, -4923, -9691, 369, -11523, 15966, -1829, -5736, 6728, 6377, 10293, 497, 3422, -12690, -3945, -3986, 4342, 816, -6825, -9948, -16534, 2274, 11424, -2828, -14991, -16126, -6546, -2278, -10111, 2419, 2216, 11839, 6807, -8047, 7733, 5059, -5884, 1421, -2014, -738, 2338, -4289, 3584, -661, -2390, -1419, -2717, -6384, 12397, -1216, -3450, 11256, 4435, 4280, -4109, 6905, -14192, 11233, -10672, 7758, 11369, -2756, 415, -7796, -3698, 4146, 299, -1618, 1594, -2099, 5541, 13368, -6112, -975, -5424, 11544, 690, 6004, 5356, -4114, -8685, -1007, 1057, -1637, 973, -7960, 2245, 9380, -9956, -2440, -9512, 4362, -7195, -5098, -6054, 3756, 278, -1911, 2452, 2069, 11656, -15647, 10251, -6266, 1769, 7910, 1389, 8974, -16526, -8378, 3207, -166, 1935, 3985, 11479, -3135, 14863, 12719, 2055, -859, -2566, -236, 2574, 5026, 3646, -3445, 9745, -1296, 1374, 1764, 6365, -11650, -906, -3522, -8797, 3331, 6951, -3960, 9332, 4967, -4241, 5446, -2264, 4643, 5999, 2878, -4990, 3565, -14530, 8750, 8554, 6342, -10319, 2318, -302, 6017, 1405, 4033, 17347, -4941, -9575, -5373, 4009, -4029, 1482, 5190, 535, -708, 117, 4127, -2357, 1379, 5259, 650, 6321, -6465, 2609, 3870, -3621, -9689, -6716, -6301, 2113, -3175, -6888, 0, 2113, 3175, -6716, 6301, -3621, 9689, 2609, -3870, 6321, 6465, 5259, -650, -2357, -1379, 117, -4127, 535, 708, 1482, -5190, 4009, 4029, -9575, 5373, 17347, 4941, 1405, -4033, -302, -6017, -10319, -2318, 8554, -6342, -14530, -8750, -4990, -3565, 5999, -2878, -2264, -4643, -4241, -5446, 9332, -4967, 6951, 3960, -8797, -3331, -906, 3522, 6365, 11650, 1374, -1764, 9745, 1296, 3646, 3445, 2574, -5026, -2566, 236, 2055, 859, 14863, -12719, 11479, 3135, 1935, -3985, 3207, 166, -16526, 8378, 1389, -8974, 1769, -7910, 10251, 6266, 11656, 15647, 2452, -2069, 278, 1911, -6054, -3756, -7195, 5098, -9512, -4362, -9956, 2440, 2245, -9380, 973, 7960, 1057, 1637, -8685, 1007, 5356, 4114, 690, -6004, -5424, -11544, -6112, 975, 5541, -13368, 1594, 2099, 299, 1618, -3698, -4146, 415, 7796, 11369, 2756, -10672, -7758, -14192, -11233, -4109, -6905, 4435, -4280, -3450, -11256, 12397, 1216, -2717, 6384, -2390, 1419, 3584, 661, 2338, 4289, -2014, 738, -5884, -1421, 7733, -5059, 6807, 8047, 2216, -11839, -10111, -2419, -6546, 2278, -14991, 16126, 11424, 2828, -16534, -2274, -6825, 9948, 4342, -816, -3945, 3986, 3422, 12690, 10293, -497, 6728, -6377, -1829, 5736, -11523, -15966, -9691, -369, 353, 4923, -4462, -9728, -4984, 9489, -14308, -13948, 423, -7492, -6695, -12513, -7629, -1369, 5763, -7213, 12064, -464, -8563, 5387, 2732, -7209, -244, -1123, 9351, -285, 6610, -4868, -9861, 12986, -169, 8454, -9574, -1120, -7581, -3775, -2288, -674, 1833, -15921, 3531, 8883, -9149, 2579, -2112, -3074, 4642, 9120, 2145, -5388, 4119, -1754, 3222, -7109, -928, -1039, -5536, -1812, 7212, -2661, 5151, 5983, -372, 5989, 8114, -2807, -4136, -8120, -9340, 1865, -516, -1608, 1371, -9293, -10055, 9111, 642, 10758, 2230, 3805, 1287, 4098, 1621, -11180, -5931, 4477, -3869, -7049, 469, 369, 10523, -8339, -12295, -2269, -7207, -931, 6357, 6852, -10540, -2353, 10466, -4218, 3358, 3661, -9095, -5327, 4498, 6399, 9526, -8584, 5915, -4696, 5448, -8213, 200, -6136, -5984, -2399, 42, -4639, 862, -9675, 8900, 6026, -6119, -6415, -11707, -1856, 2463, -2857, 8649, 2742, -1361, -4264, 6566, -8132, -10574, -1941, 6687, -703, -622, -3804, -11861, 5807, -10325, -16667, 3763, 6100, -2133, 5754, -5602, 14477, -9525, -11416, 4953, -14247, 4201, -287, 10620, -4990, -3960, 5267, -2747, 2126, 589, 1433, 12779, 9212, -5822, -319, 8379, -11537, -8917, 6665, 5663, 6725, -6577, 2378, -6968, 2271, -6730, -8948, -492, 1732, 9002, -289, -2994, -8288, 6728, 5292, 11867, -11762, 6328, 3008, -8867, -8834, -1937, -292, -4782, 8339, -3832, -2201, 3753, 3071, 4932, -797, -4735, -2514, -11590, -9835, 7207, 289, 12549, -8066, -11637, 4159, 4239, 16042, -515, 2539, -2529, -7835, -7581, -1697, -6656, -4725, 1428, 3026, -13698, -9874, -3660, -8582, 7993, -1828, -2085, -6181, 3276, 4210, -6604, -756, 5797, 2460, -8030, 3540, -11506, 2136, -5742, -6757, 2014, -4830, 1834, 2076, -1056, -450, 4981, -4602, 2727, 325, -3882, -3833, -7819, 2122, -8433, -1961, -5515, -4017, 4927, 6435, -5409, -12587, -11736, -1878, -9333, -1410, 12928, 1303, -5661, -2164, 2108, -10325, -178, 3234, 4069, 5349, -8925, -15439, -5768, -8604, 9693, -4404, 4997, -2920, -1208, -956, 7138, 6115, 5300, 370, -1474, 1162, 7811, -2381, -1609, -1834, -6590, 5288, 1695, -2080, 14459, 6669, -7710, 3115, -2839, 1449, 6457, -5459, -1423, -11067, -250, 7320, 7821, 5539, 5575, 17004, 12538, 8027, 2668, 3439, 
};

RT_L2_DATA int16_t twiddleCoef_i16_512[512] = {
32767, 0, 32764, -402, 32757, -804, 32744, -1206, 32727, -1607, 32705, -2009, 32678, -2410, 32646, -2811, 32609, -3211, 32567, -3611, 32520, -4011, 32468, -4409, 32412, -4808, 32350, -5205, 32284, -5602, 32213, -5997, 32137, -6392, 32056, -6786, 31970, -7179, 31880, -7571, 31784, -7961, 31684, -8351, 31580, -8739, 31470, -9126, 31356, -9512, 31236, -9896, 31113, -10278, 30984, -10659, 30851, -11039, 30713, -11416, 30571, -11793, 30424, -12167, 30272, -12539, 30116, -12910, 29955, -13278, 29790, -13645, 29620, -14010, 29446, -14372, 29268, -14732, 29085, -15090, 28897, -15446, 28706, -15800, 28510, -16151, 28309, -16499, 28105, -16846, 27896, -17189, 27683, -17530, 27465, -17869, 27244, -18204, 27019, -18537, 26789, -18868, 26556, -19195, 26318, -19519, 26076, -19841, 25831, -20159, 25582, -20475, 25329, -20787, 25072, -21097, 24811, -21403, 24546, -21706, 24278, -22005, 24006, -22301, 23731, -22594, 23452, -22884, 23169, -23170, 22883, -23453, 22593, -23732, 22300, -24007, 22004, -24279, 21705, -24547, 21402, -24812, 21096, -25073, 20786, -25330, 20474, -25583, 20158, -25832, 19840, -26077, 19518, -26319, 19194, -26557, 18867, -26790, 18536, -27020, 18203, -27245, 17868, -27466, 17529, -27684, 17188, -27897, 16845, -28106, 16498, -28310, 16150, -28511, 15799, -28707, 15445, -28898, 15089, -29086, 14731, -29269, 14371, -29447, 14009, -29621, 13644, -29791, 13277, -29956, 12909, -30117, 12538, -30273, 12166, -30425, 11792, -30572, 11415, -30714, 11038, -30852, 10658, -30985, 10277, -31114, 9895, -31237, 9511, -31357, 9125, -31471, 8738, -31581, 8350, -31685, 7960, -31785, 7570, -31881, 7178, -31971, 6785, -32057, 6391, -32138, 5996, -32214, 5601, -32285, 5204, -32351, 4807, -32413, 4408, -32469, 4010, -32521, 3610, -32568, 3210, -32610, 2810, -32647, 2409, -32679, 2008, -32706, 1606, -32728, 1205, -32745, 803, -32758, 401, -32765, -1, -32768, -404, -32765, -806, -32758, -1208, -32745, -1609, -32728, -2011, -32706, -2412, -32679, -2813, -32647, -3213, -32610, -3613, -32568, -4013, -32521, -4411, -32469, -4810, -32413, -5207, -32351, -5604, -32285, -5999, -32214, -6394, -32138, -6788, -32057, -7181, -31971, -7573, -31881, -7963, -31785, -8353, -31685, -8741, -31581, -9128, -31471, -9514, -31357, -9898, -31237, -10280, -31114, -10661, -30985, -11041, -30852, -11418, -30714, -11795, -30572, -12169, -30425, -12541, -30273, -12912, -30117, -13280, -29956, -13647, -29791, -14012, -29621, -14374, -29447, -14734, -29269, -15092, -29086, -15448, -28898, -15802, -28707, -16153, -28511, -16501, -28310, -16848, -28106, -17191, -27897, -17532, -27684, -17871, -27466, -18206, -27245, -18539, -27020, -18870, -26790, -19197, -26557, -19521, -26319, -19843, -26077, -20161, -25832, -20477, -25583, -20789, -25330, -21099, -25073, -21405, -24812, -21708, -24547, -22007, -24279, -22303, -24007, -22596, -23732, -22886, -23453, -23172, -23170, -23455, -22884, -23734, -22594, -24009, -22301, -24281, -22005, -24549, -21706, -24814, -21403, -25075, -21097, -25332, -20787, -25585, -20475, -25834, -20159, -26079, -19841, -26321, -19519, -26559, -19195, -26792, -18868, -27022, -18537, -27247, -18204, -27468, -17869, -27686, -17530, -27899, -17189, -28108, -16846, -28312, -16499, -28513, -16151, -28709, -15800, -28900, -15446, -29088, -15090, -29271, -14732, -29449, -14372, -29623, -14010, -29793, -13645, -29958, -13278, -30119, -12910, -30275, -12539, -30427, -12167, -30574, -11793, -30716, -11416, -30854, -11039, -30987, -10659, -31116, -10278, -31239, -9896, -31359, -9512, -31473, -9126, -31583, -8739, -31687, -8351, -31787, -7961, -31883, -7571, -31973, -7179, -32059, -6786, -32140, -6392, -32216, -5997, -32287, -5602, -32353, -5205, -32415, -4808, -32471, -4409, -32523, -4011, -32570, -3611, -32612, -3211, -32649, -2811, -32681, -2410, -32708, -2009, -32730, -1607, -32747, -1206, -32760, -804, -32767, -402, 
};


#endif
