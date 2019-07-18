#ifndef __FFT_H_16__
#define __FFT_H_16__

typedef int16_t v_type;
RT_L2_DATA int16_t x[1024] = {
182, 0, -120, 0, 198, 0, -209, 0, -253, 0, 64, 0, 163, 0, 152, 0, 73, 0, -105, 0, -144, 0, 200, 0, -115, 0, -160, 0, 153, 0, 120, 0, -168, 0, -122, 0, -137, 0, -179, 0, 64, 0, 128, 0, -156, 0, -218, 0, 242, 0, -83, 0, -212, 0, 139, 0, 223, 0, -67, 0, -47, 0, -77, 0, 171, 0, -68, 0, -49, 0, -207, 0, -10, 0, 165, 0, -208, 0, 95, 0, -47, 0, -88, 0, -10, 0, -119, 0, 14, 0, 68, 0, -242, 0, 48, 0, 1, 0, 230, 0, 215, 0, 161, 0, 26, 0, -112, 0, -70, 0, -8, 0, -246, 0, -27, 0, -138, 0, 205, 0, -141, 0, 75, 0, 101, 0, -185, 0, -127, 0, -256, 0, 211, 0, -161, 0, -189, 0, 244, 0, 187, 0, -123, 0, -75, 0, 151, 0, 254, 0, -79, 0, 149, 0, 75, 0, 81, 0, 247, 0, 108, 0, -9, 0, -243, 0, -49, 0, -2, 0, -33, 0, 184, 0, 236, 0, -150, 0, -242, 0, 29, 0, -17, 0, 75, 0, 54, 0, -235, 0, 5, 0, -132, 0, 83, 0, -26, 0, -168, 0, 250, 0, -83, 0, 112, 0, 1, 0, -167, 0, 87, 0, -90, 0, 222, 0, -234, 0, 46, 0, 131, 0, -18, 0, 164, 0, 38, 0, -158, 0, 82, 0, 14, 0, 165, 0, -135, 0, -43, 0, 77, 0, -98, 0, 61, 0, -17, 0, -89, 0, -138, 0, -9, 0, -93, 0, 219, 0, 53, 0, 135, 0, -78, 0, 165, 0, -121, 0, -105, 0, 174, 0, 118, 0, 100, 0, -121, 0, 45, 0, 3, 0, -163, 0, -82, 0, 50, 0, -67, 0, 171, 0, 57, 0, 40, 0, 247, 0, -217, 0, 92, 0, -152, 0, -54, 0, 58, 0, 158, 0, 236, 0, 76, 0, 1, 0, -18, 0, -19, 0, 240, 0, -90, 0, -85, 0, -223, 0, -115, 0, 193, 0, -127, 0, -92, 0, 1, 0, 51, 0, 220, 0, 111, 0, -217, 0, -66, 0, 90, 0, 224, 0, 185, 0, -27, 0, 92, 0, -219, 0, -131, 0, 178, 0, -239, 0, -140, 0, -171, 0, -94, 0, 252, 0, 172, 0, 116, 0, -198, 0, -163, 0, 47, 0, 213, 0, 40, 0, -176, 0, 60, 0, 46, 0, -23, 0, 75, 0, -89, 0, -195, 0, 37, 0, 71, 0, 127, 0, -58, 0, 193, 0, 45, 0, -75, 0, 21, 0, 254, 0, 92, 0, -116, 0, -196, 0, -255, 0, -216, 0, 52, 0, 179, 0, 80, 0, 161, 0, 43, 0, 251, 0, 186, 0, 48, 0, 147, 0, 141, 0, -185, 0, 118, 0, -79, 0, -41, 0, 142, 0, -176, 0, 13, 0, -238, 0, 86, 0, -87, 0, 90, 0, 135, 0, -236, 0, 81, 0, 234, 0, -240, 0, -41, 0, -30, 0, 251, 0, 40, 0, -178, 0, -175, 0, -137, 0, 80, 0, 211, 0, -143, 0, 91, 0, 122, 0, 109, 0, -221, 0, -149, 0, -118, 0, 254, 0, -169, 0, -8, 0, 46, 0, 231, 0, 194, 0, 151, 0, -45, 0, -21, 0, 39, 0, -187, 0, -112, 0, -85, 0, 241, 0, 1, 0, -89, 0, -6, 0, -215, 0, -40, 0, 47, 0, -42, 0, 156, 0, 50, 0, 23, 0, -169, 0, -52, 0, -161, 0, -21, 0, 234, 0, 57, 0, 191, 0, -58, 0, 167, 0, 251, 0, -187, 0, 214, 0, 15, 0, 181, 0, -71, 0, -117, 0, -115, 0, -45, 0, -53, 0, 41, 0, 67, 0, 18, 0, -136, 0, -49, 0, 197, 0, 148, 0, -174, 0, 60, 0, 223, 0, 214, 0, -114, 0, 127, 0, -45, 0, 206, 0, 51, 0, -236, 0, 199, 0, 147, 0, 217, 0, 91, 0, -224, 0, 153, 0, -189, 0, -132, 0, -219, 0, 156, 0, -7, 0, 188, 0, -103, 0, -83, 0, -245, 0, -21, 0, -17, 0, 19, 0, 190, 0, -244, 0, 17, 0, 31, 0, -17, 0, 207, 0, 132, 0, -237, 0, -251, 0, 142, 0, -16, 0, -131, 0, 167, 0, 124, 0, -239, 0, 156, 0, -231, 0, 159, 0, -112, 0, 190, 0, -88, 0, -252, 0, 22, 0, 254, 0, -29, 0, 231, 0, 186, 0, 22, 0, -253, 0, 96, 0, -103, 0, 212, 0, 101, 0, -6, 0, 96, 0, -24, 0, -178, 0, -195, 0, -57, 0, -42, 0, 162, 0, 228, 0, 57, 0, -182, 0, 160, 0, -45, 0, 169, 0, 84, 0, 184, 0, -122, 0, -233, 0, -142, 0, -196, 0, -171, 0, -75, 0, 5, 0, 114, 0, 182, 0, 220, 0, -99, 0, 131, 0, -77, 0, 48, 0, 1, 0, -133, 0, 22, 0, 97, 0, -141, 0, -60, 0, 80, 0, -21, 0, -214, 0, -60, 0, -22, 0, 38, 0, 10, 0, 38, 0, 101, 0, -217, 0, -39, 0, -118, 0, 48, 0, -77, 0, -253, 0, 118, 0, -196, 0, 74, 0, 215, 0, -191, 0, -202, 0, -42, 0, 63, 0, 5, 0, -164, 0, -54, 0, -18, 0, -27, 0, 7, 0, 85, 0, -249, 0, 167, 0, -18, 0, -129, 0, -133, 0, 151, 0, 58, 0, -18, 0, -151, 0, 117, 0, -168, 0, -112, 0, -22, 0, 30, 0, -120, 0, 169, 0, -102, 0, 242, 0, 172, 0, -56, 0, -27, 0, 48, 0, -77, 0, 209, 0, -250, 0, 211, 0, 23, 0, 181, 0, 166, 0, -187, 0, -182, 0, -183, 0, 202, 0, 26, 0, -127, 0, -59, 0, -28, 0, -206, 0, 49, 0, -126, 0, -251, 0, -18, 0, 85, 0, 23, 0, 52, 0, 91, 0, 227, 0, -118, 0, -83, 0, -76, 0, 225, 0, 238, 0, -107, 0, 58, 0, -246, 0, -77, 0, 11, 0, -58, 0, 234, 0, -159, 0, -145, 0, 5, 0, 40, 0, 51, 0, 251, 0, 20, 0, -6, 0, 138, 0, -216, 0, -82, 0, 147, 0, -16, 0, 41, 0, -53, 0, -209, 0, 205, 0, -100, 0, -12, 0, 
};

RT_L2_DATA int16_t exp_result[1024] = {
521, 0, -2910, -1572, 115, -976, 969, 1499, -67, 1503, -76, 1510, -2021, 459, 3282, -1067, 686, 265, -315, 616, 1166, 470, -1904, 2812, -316, 152, 506, 80, 1683, -979, -1377, -2880, 266, -1193, -2201, -634, 3310, 1527, 730, 2937, 2150, -283, 2105, 496, -4133, -2099, 1622, 465, -3705, -2696, -3959, -1316, -1007, -1236, 1509, 890, -1131, -1122, -3561, -114, 4054, -1939, -798, 73, 1294, 2873, 143, -3057, -145, -528, 5936, 2983, -3390, -173, -697, 624, -2490, -467, 3073, 2590, -132, 1332, 1085, 223, 2257, -346, 1317, -1610, -1623, 1148, -1118, -427, -1522, 51, 1899, -618, -4243, 2986, 692, 1507, 1505, -1850, 1582, 6059, 1202, 834, 1043, -1744, -5655, -1116, 370, -3197, 149, -1058, -544, 602, -2202, 1712, 3610, 1269, 2311, 1492, 3778, 484, -7012, 1390, 1425, -859, 903, 1300, -4190, 1339, 1293, 511, 1601, -2479, 2008, 442, -1909, 710, 2383, -1006, 4607, 258, 4622, 55, -1176, 720, 3800, -5945, 1164, 4807, 1891, -508, 2522, -1844, 4522, 2201, 847, -217, 2976, 294, -1311, 2558, -1573, 3693, 3102, -469, -163, -1268, -1601, -1717, -2398, -3062, -3212, 3197, -1705, -2238, -2354, -2742, 4321, 2525, 2151, -2911, -1777, 2557, 1715, 626, 529, -2513, -211, 3545, 3266, 348, 399, -5362, -2956, -137, 566, 321, -1059, -2869, 3700, 2414, 2586, 1920, -879, -1298, -3156, 2492, -1660, -302, 669, -3776, -1561, -327, -1939, -4327, 155, 3331, 223, -5414, 727, 1360, 3145, -4538, -1077, -1428, -332, 143, -3395, 1487, -1136, -2482, -4057, 2977, -1844, -7611, -1093, -789, -2778, 1629, -4530, 109, -1352, 1296, -3021, 2120, 3899, -97, 248, -45, 1816, -3276, 1199, 1597, 850, -1125, 2304, 867, -2006, 1391, 850, -1276, 2308, 416, 1155, -2955, -1149, 368, -1970, 336, -1839, -28, -2330, 1038, -3021, 1561, 66, 3533, 1896, -1414, 497, -399, 2951, -4357, 2069, 418, -26, 4238, -3690, -851, 2527, 1354, 5114, 2237, 2145, -1461, 1772, 964, 1141, -1210, -5763, -2511, 632, -1352, -163, -1649, 3205, 185, 1621, -3721, 601, -155, -6443, 1070, -1464, -177, 1197, 2021, -4706, 91, -2077, -1320, -264, 2716, -1936, 2567, -4115, -245, 1256, -154, -1786, 1769, 1550, 3002, -277, -775, 816, 2249, 2802, -796, 2020, 2196, -1356, 152, 1112, -867, -424, -764, -1933, -2389, 3796, -372, 691, 115, -433, -466, 3270, -2568, 1863, 2146, 1535, 798, 1069, 1437, 3877, 2523, 3854, -1568, -792, 69, 3199, 12, 3741, 2685, -240, 61, 2254, 4487, -2601, 1967, -575, -739, 656, 4, 4696, 894, 1434, 3100, 3512, 3117, -1083, -1775, -1097, 1953, -1958, -1075, -730, 187, -340, 451, 70, 105, 1550, -8117, -5326, 2874, 2194, 3618, 5061, 2282, -183, 5048, -231, -574, 2903, 5021, 1067, -293, 2955, -388, -155, -3201, -1536, 1833, -5525, 2, 743, 3276, 4913, 3757, -1970, 681, -3630, 566, -1208, -3270, -1066, 899, 349, -1976, 3631, 2096, -2179, -2183, 1962, 1261, 1841, 2248, 3123, -1010, 1596, 1527, -845, -461, 1292, 847, -1524, 1244, -2201, -1588, 2705, 1223, 911, 2965, 1056, -406, -392, 1542, 2718, 2884, -229, -1250, 929, 537, -5054, 595, 1942, 910, 3269, -312, -1323, -1683, 1242, -2015, 2067, -998, -1216, 204, 20, -3064, -589, 2226, -1630, 3604, -4198, 2147, 1441, -2292, -296, -1142, 787, -592, -401, -468, 5942, -2411, -908, 4151, -1949, -504, -461, 0, -1949, 504, -908, -4151, 5942, 2411, -401, 468, 787, 592, -296, 1142, 1441, 2292, -4198, -2147, -1630, -3604, -589, -2226, 20, 3064, -1216, -204, 2067, 998, 1242, 2015, -1323, 1683, 3269, 312, 1942, -910, -5054, -595, 929, -537, -229, 1250, 2718, -2884, -392, -1542, 1056, 406, 911, -2965, 2705, -1223, -2201, 1588, -1524, -1244, 1292, -847, -845, 461, 1596, -1527, 3123, 1010, 1841, -2248, 1962, -1261, -2179, 2183, 3631, -2096, 349, 1976, -1066, -899, -1208, 3270, -3630, -566, -1970, -681, 4913, -3757, 743, -3276, -5525, -2, -1536, -1833, -155, 3201, 2955, 388, 1067, 293, 2903, -5021, -231, 574, -183, -5048, 5061, -2282, 2194, -3618, -5326, -2874, 1550, 8117, 70, -105, -340, -451, -730, -187, -1958, 1075, -1097, -1953, -1083, 1775, 3512, -3117, 1434, -3100, 4696, -894, 656, -4, -575, 739, -2601, -1967, 2254, -4487, -240, -61, 3741, -2685, 3199, -12, -792, -69, 3854, 1568, 3877, -2523, 1069, -1437, 1535, -798, 1863, -2146, 3270, 2568, -433, 466, 691, -115, 3796, 372, -1933, 2389, -424, 764, 1112, 867, -1356, -152, 2020, -2196, 2802, 796, 816, -2249, -277, 775, 1550, -3002, -1786, -1769, 1256, 154, -4115, 245, -1936, -2567, -264, -2716, -2077, 1320, -4706, -91, 1197, -2021, -1464, 177, -6443, -1070, 601, 155, 1621, 3721, 3205, -185, -163, 1649, 632, 1352, -5763, 2511, 1141, 1210, 1772, -964, 2145, 1461, 5114, -2237, 2527, -1354, -3690, 851, -26, -4238, 2069, -418, 2951, 4357, 497, 399, 1896, 1414, 66, -3533, -3021, -1561, -2330, -1038, -1839, 28, -1970, -336, -1149, -368, 1155, 2955, 2308, -416, 850, 1276, -2006, -1391, 2304, -867, 850, 1125, 1199, -1597, 1816, 3276, 248, 45, 3899, 97, -3021, -2120, -1352, -1296, -4530, -109, -2778, -1629, -1093, 789, -1844, 7611, -4057, -2977, -1136, 2482, -3395, -1487, -332, -143, -1077, 1428, 3145, 4538, 727, -1360, 223, 5414, 155, -3331, -1939, 4327, -1561, 327, 669, 3776, -1660, 302, -3156, -2492, -879, 1298, 2586, -1920, 3700, -2414, -1059, 2869, 566, -321, -2956, 137, 399, 5362, 3266, -348, -211, -3545, 529, 2513, 1715, -626, -1777, -2557, 2151, 2911, 4321, -2525, -2354, 2742, -1705, 2238, -3212, -3197, -2398, 3062, -1601, 1717, -163, 1268, 3102, 469, -1573, -3693, -1311, -2558, 2976, -294, 847, 217, 4522, -2201, 2522, 1844, 1891, 508, 1164, -4807, 3800, 5945, -1176, -720, 4622, -55, 4607, -258, 2383, 1006, -1909, -710, 2008, -442, 1601, 2479, 1293, -511, -4190, -1339, 903, -1300, 1425, 859, -7012, -1390, 3778, -484, 2311, -1492, 3610, -1269, -2202, -1712, -544, -602, 149, 1058, 370, 3197, -5655, 1116, 1043, 1744, 1202, -834, 1582, -6059, 1505, 1850, 692, -1507, -4243, -2986, 1899, 618, -1522, -51, -1118, 427, -1623, -1148, 1317, 1610, 2257, 346, 1085, -223, -132, -1332, 3073, -2590, -2490, 467, -697, -624, -3390, 173, 5936, -2983, -145, 528, 143, 3057, 1294, -2873, -798, -73, 4054, 1939, -3561, 114, -1131, 1122, 1509, -890, -1007, 1236, -3959, 1316, -3705, 2696, 1622, -465, -4133, 2099, 2105, -496, 2150, 283, 730, -2937, 3310, -1527, -2201, 634, 266, 1193, -1377, 2880, 1683, 979, 506, -80, -316, -152, -1904, -2812, 1166, -470, -315, -616, 686, -265, 3282, 1067, -2021, -459, -76, -1510, -67, -1503, 969, -1499, 115, 976, -2910, 1572, 
};

RT_L2_DATA int16_t twiddleCoef_i16_512[512] = {
32767, 0, 32764, -402, 32757, -804, 32744, -1206, 32727, -1607, 32705, -2009, 32678, -2410, 32646, -2811, 32609, -3211, 32567, -3611, 32520, -4011, 32468, -4409, 32412, -4808, 32350, -5205, 32284, -5602, 32213, -5997, 32137, -6392, 32056, -6786, 31970, -7179, 31880, -7571, 31784, -7961, 31684, -8351, 31580, -8739, 31470, -9126, 31356, -9512, 31236, -9896, 31113, -10278, 30984, -10659, 30851, -11039, 30713, -11416, 30571, -11793, 30424, -12167, 30272, -12539, 30116, -12910, 29955, -13278, 29790, -13645, 29620, -14010, 29446, -14372, 29268, -14732, 29085, -15090, 28897, -15446, 28706, -15800, 28510, -16151, 28309, -16499, 28105, -16846, 27896, -17189, 27683, -17530, 27465, -17869, 27244, -18204, 27019, -18537, 26789, -18868, 26556, -19195, 26318, -19519, 26076, -19841, 25831, -20159, 25582, -20475, 25329, -20787, 25072, -21097, 24811, -21403, 24546, -21706, 24278, -22005, 24006, -22301, 23731, -22594, 23452, -22884, 23169, -23170, 22883, -23453, 22593, -23732, 22300, -24007, 22004, -24279, 21705, -24547, 21402, -24812, 21096, -25073, 20786, -25330, 20474, -25583, 20158, -25832, 19840, -26077, 19518, -26319, 19194, -26557, 18867, -26790, 18536, -27020, 18203, -27245, 17868, -27466, 17529, -27684, 17188, -27897, 16845, -28106, 16498, -28310, 16150, -28511, 15799, -28707, 15445, -28898, 15089, -29086, 14731, -29269, 14371, -29447, 14009, -29621, 13644, -29791, 13277, -29956, 12909, -30117, 12538, -30273, 12166, -30425, 11792, -30572, 11415, -30714, 11038, -30852, 10658, -30985, 10277, -31114, 9895, -31237, 9511, -31357, 9125, -31471, 8738, -31581, 8350, -31685, 7960, -31785, 7570, -31881, 7178, -31971, 6785, -32057, 6391, -32138, 5996, -32214, 5601, -32285, 5204, -32351, 4807, -32413, 4408, -32469, 4010, -32521, 3610, -32568, 3210, -32610, 2810, -32647, 2409, -32679, 2008, -32706, 1606, -32728, 1205, -32745, 803, -32758, 401, -32765, -1, -32768, -404, -32765, -806, -32758, -1208, -32745, -1609, -32728, -2011, -32706, -2412, -32679, -2813, -32647, -3213, -32610, -3613, -32568, -4013, -32521, -4411, -32469, -4810, -32413, -5207, -32351, -5604, -32285, -5999, -32214, -6394, -32138, -6788, -32057, -7181, -31971, -7573, -31881, -7963, -31785, -8353, -31685, -8741, -31581, -9128, -31471, -9514, -31357, -9898, -31237, -10280, -31114, -10661, -30985, -11041, -30852, -11418, -30714, -11795, -30572, -12169, -30425, -12541, -30273, -12912, -30117, -13280, -29956, -13647, -29791, -14012, -29621, -14374, -29447, -14734, -29269, -15092, -29086, -15448, -28898, -15802, -28707, -16153, -28511, -16501, -28310, -16848, -28106, -17191, -27897, -17532, -27684, -17871, -27466, -18206, -27245, -18539, -27020, -18870, -26790, -19197, -26557, -19521, -26319, -19843, -26077, -20161, -25832, -20477, -25583, -20789, -25330, -21099, -25073, -21405, -24812, -21708, -24547, -22007, -24279, -22303, -24007, -22596, -23732, -22886, -23453, -23172, -23170, -23455, -22884, -23734, -22594, -24009, -22301, -24281, -22005, -24549, -21706, -24814, -21403, -25075, -21097, -25332, -20787, -25585, -20475, -25834, -20159, -26079, -19841, -26321, -19519, -26559, -19195, -26792, -18868, -27022, -18537, -27247, -18204, -27468, -17869, -27686, -17530, -27899, -17189, -28108, -16846, -28312, -16499, -28513, -16151, -28709, -15800, -28900, -15446, -29088, -15090, -29271, -14732, -29449, -14372, -29623, -14010, -29793, -13645, -29958, -13278, -30119, -12910, -30275, -12539, -30427, -12167, -30574, -11793, -30716, -11416, -30854, -11039, -30987, -10659, -31116, -10278, -31239, -9896, -31359, -9512, -31473, -9126, -31583, -8739, -31687, -8351, -31787, -7961, -31883, -7571, -31973, -7179, -32059, -6786, -32140, -6392, -32216, -5997, -32287, -5602, -32353, -5205, -32415, -4808, -32471, -4409, -32523, -4011, -32570, -3611, -32612, -3211, -32649, -2811, -32681, -2410, -32708, -2009, -32730, -1607, -32747, -1206, -32760, -804, -32767, -402, 
};


#endif
