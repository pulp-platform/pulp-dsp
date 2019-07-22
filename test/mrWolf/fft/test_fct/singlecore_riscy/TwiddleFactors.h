#ifndef __FFT_TWIDDLES_H__
#define __FFT_TWIDDLES_H__

RT_L2_DATA int16_t twiddleCoef_i16_128[128] = {
32767, 0, 32727, -1607, 32609, -3211, 32412, -4807, 32137, -6392, 31785, -7961, 31356, -9511, 30851, -11038, 30272, -12539, 29621, -14009, 28897, -15446, 28105, -16845, 27244, -18204, 26318, -19519, 25329, -20787, 24278, -22004, 23169, -23169, 22004, -24278, 20787, -25329, 19519, -26318, 18204, -27244, 16845, -28105, 15446, -28897, 14009, -29621, 12539, -30272, 11038, -30851, 9511, -31356, 7961, -31785, 6392, -32137, 4807, -32412, 3211, -32609, 1607, -32727, 0, -32767, -1607, -32727, -3211, -32609, -4807, -32412, -6392, -32137, -7961, -31785, -9511, -31356, -11038, -30851, -12539, -30272, -14009, -29621, -15446, -28897, -16845, -28105, -18204, -27244, -19519, -26318, -20787, -25329, -22004, -24278, -23169, -23169, -24278, -22004, -25329, -20787, -26318, -19519, -27244, -18204, -28105, -16845, -28897, -15446, -29621, -14009, -30272, -12539, -30851, -11038, -31356, -9511, -31785, -7961, -32137, -6392, -32412, -4807, -32609, -3211, -32727, -1607, 
};

RT_L2_DATA int16_t twiddleCoef_i16_256[256] = {
32767, 0, 32757, -804, 32727, -1607, 32678, -2410, 32609, -3211, 32520, -4011, 32412, -4807, 32284, -5601, 32137, -6392, 31970, -7179, 31785, -7961, 31580, -8739, 31356, -9511, 31113, -10278, 30851, -11038, 30571, -11792, 30272, -12539, 29955, -13278, 29621, -14009, 29268, -14732, 28897, -15446, 28510, -16150, 28105, -16845, 27683, -17530, 27244, -18204, 26789, -18867, 26318, -19519, 25831, -20159, 25329, -20787, 24811, -21402, 24278, -22004, 23731, -22594, 23169, -23169, 22594, -23731, 22004, -24278, 21402, -24811, 20787, -25329, 20159, -25831, 19519, -26318, 18867, -26789, 18204, -27244, 17530, -27683, 16845, -28105, 16150, -28510, 15446, -28897, 14732, -29268, 14009, -29621, 13278, -29955, 12539, -30272, 11792, -30571, 11038, -30851, 10278, -31113, 9511, -31356, 8739, -31580, 7961, -31785, 7179, -31970, 6392, -32137, 5601, -32284, 4807, -32412, 4011, -32520, 3211, -32609, 2410, -32678, 1607, -32727, 804, -32757, 0, -32767, -804, -32757, -1607, -32727, -2410, -32678, -3211, -32609, -4011, -32520, -4807, -32412, -5601, -32284, -6392, -32137, -7179, -31970, -7961, -31785, -8739, -31580, -9511, -31356, -10278, -31113, -11038, -30851, -11792, -30571, -12539, -30272, -13278, -29955, -14009, -29621, -14732, -29268, -15446, -28897, -16150, -28510, -16845, -28105, -17530, -27683, -18204, -27244, -18867, -26789, -19519, -26318, -20159, -25831, -20787, -25329, -21402, -24811, -22004, -24278, -22594, -23731, -23169, -23169, -23731, -22594, -24278, -22004, -24811, -21402, -25329, -20787, -25831, -20159, -26318, -19519, -26789, -18867, -27244, -18204, -27683, -17530, -28105, -16845, -28510, -16150, -28897, -15446, -29268, -14732, -29621, -14009, -29955, -13278, -30272, -12539, -30571, -11792, -30851, -11038, -31113, -10278, -31356, -9511, -31580, -8739, -31785, -7961, -31970, -7179, -32137, -6392, -32284, -5601, -32412, -4807, -32520, -4011, -32609, -3211, -32678, -2410, -32727, -1607, -32757, -804, 
};

RT_L2_DATA int16_t twiddleCoef_i16_512[512] = {
32767, 0, 32764, -402, 32757, -804, 32744, -1206, 32727, -1607, 32705, -2009, 32678, -2410, 32646, -2811, 32609, -3211, 32567, -3611, 32520, -4011, 32468, -4409, 32412, -4807, 32350, -5205, 32284, -5601, 32213, -5997, 32137, -6392, 32056, -6786, 31970, -7179, 31880, -7571, 31785, -7961, 31684, -8351, 31580, -8739, 31470, -9126, 31356, -9511, 31236, -9895, 31113, -10278, 30984, -10659, 30851, -11038, 30713, -11416, 30571, -11792, 30424, -12166, 30272, -12539, 30116, -12909, 29955, -13278, 29790, -13645, 29621, -14009, 29446, -14372, 29268, -14732, 29085, -15090, 28897, -15446, 28706, -15799, 28510, -16150, 28309, -16499, 28105, -16845, 27896, -17189, 27683, -17530, 27466, -17868, 27244, -18204, 27019, -18537, 26789, -18867, 26556, -19194, 26318, -19519, 26077, -19840, 25831, -20159, 25582, -20474, 25329, -20787, 25072, -21096, 24811, -21402, 24546, -21705, 24278, -22004, 24006, -22301, 23731, -22594, 23452, -22883, 23169, -23169, 22883, -23452, 22594, -23731, 22301, -24006, 22004, -24278, 21705, -24546, 21402, -24811, 21096, -25072, 20787, -25329, 20474, -25582, 20159, -25831, 19840, -26077, 19519, -26318, 19194, -26556, 18867, -26789, 18537, -27019, 18204, -27244, 17868, -27466, 17530, -27683, 17189, -27896, 16845, -28105, 16499, -28309, 16150, -28510, 15799, -28706, 15446, -28897, 15090, -29085, 14732, -29268, 14372, -29446, 14009, -29621, 13645, -29790, 13278, -29955, 12909, -30116, 12539, -30272, 12166, -30424, 11792, -30571, 11416, -30713, 11038, -30851, 10659, -30984, 10278, -31113, 9895, -31236, 9511, -31356, 9126, -31470, 8739, -31580, 8351, -31684, 7961, -31785, 7571, -31880, 7179, -31970, 6786, -32056, 6392, -32137, 5997, -32213, 5601, -32284, 5205, -32350, 4807, -32412, 4409, -32468, 4011, -32520, 3611, -32567, 3211, -32609, 2811, -32646, 2410, -32678, 2009, -32705, 1607, -32727, 1206, -32744, 804, -32757, 402, -32764, 0, -32767, -402, -32764, -804, -32757, -1206, -32744, -1607, -32727, -2009, -32705, -2410, -32678, -2811, -32646, -3211, -32609, -3611, -32567, -4011, -32520, -4409, -32468, -4807, -32412, -5205, -32350, -5601, -32284, -5997, -32213, -6392, -32137, -6786, -32056, -7179, -31970, -7571, -31880, -7961, -31785, -8351, -31684, -8739, -31580, -9126, -31470, -9511, -31356, -9895, -31236, -10278, -31113, -10659, -30984, -11038, -30851, -11416, -30713, -11792, -30571, -12166, -30424, -12539, -30272, -12909, -30116, -13278, -29955, -13645, -29790, -14009, -29621, -14372, -29446, -14732, -29268, -15090, -29085, -15446, -28897, -15799, -28706, -16150, -28510, -16499, -28309, -16845, -28105, -17189, -27896, -17530, -27683, -17868, -27466, -18204, -27244, -18537, -27019, -18867, -26789, -19194, -26556, -19519, -26318, -19840, -26077, -20159, -25831, -20474, -25582, -20787, -25329, -21096, -25072, -21402, -24811, -21705, -24546, -22004, -24278, -22301, -24006, -22594, -23731, -22883, -23452, -23169, -23169, -23452, -22883, -23731, -22594, -24006, -22301, -24278, -22004, -24546, -21705, -24811, -21402, -25072, -21096, -25329, -20787, -25582, -20474, -25831, -20159, -26077, -19840, -26318, -19519, -26556, -19194, -26789, -18867, -27019, -18537, -27244, -18204, -27466, -17868, -27683, -17530, -27896, -17189, -28105, -16845, -28309, -16499, -28510, -16150, -28706, -15799, -28897, -15446, -29085, -15090, -29268, -14732, -29446, -14372, -29621, -14009, -29790, -13645, -29955, -13278, -30116, -12909, -30272, -12539, -30424, -12166, -30571, -11792, -30713, -11416, -30851, -11038, -30984, -10659, -31113, -10278, -31236, -9895, -31356, -9511, -31470, -9126, -31580, -8739, -31684, -8351, -31785, -7961, -31880, -7571, -31970, -7179, -32056, -6786, -32137, -6392, -32213, -5997, -32284, -5601, -32350, -5205, -32412, -4807, -32468, -4409, -32520, -4011, -32567, -3611, -32609, -3211, -32646, -2811, -32678, -2410, -32705, -2009, -32727, -1607, -32744, -1206, -32757, -804, -32764, -402, 
};

RT_L2_DATA int16_t twiddleCoef_i16_1024[1024] = {
32767, 0, 32766, -201, 32764, -402, 32761, -603, 32757, -804, 32751, -1005, 32744, -1206, 32736, -1406, 32727, -1607, 32717, -1808, 32705, -2009, 32692, -2209, 32678, -2410, 32662, -2610, 32646, -2811, 32628, -3011, 32609, -3211, 32588, -3411, 32567, -3611, 32544, -3811, 32520, -4011, 32495, -4210, 32468, -4409, 32441, -4608, 32412, -4807, 32382, -5006, 32350, -5205, 32318, -5403, 32284, -5601, 32249, -5799, 32213, -5997, 32176, -6195, 32137, -6392, 32097, -6589, 32056, -6786, 32014, -6982, 31970, -7179, 31926, -7375, 31880, -7571, 31833, -7766, 31785, -7961, 31735, -8156, 31684, -8351, 31633, -8545, 31580, -8739, 31525, -8932, 31470, -9126, 31413, -9319, 31356, -9511, 31297, -9703, 31236, -9895, 31175, -10087, 31113, -10278, 31049, -10469, 30984, -10659, 30918, -10849, 30851, -11038, 30783, -11227, 30713, -11416, 30643, -11604, 30571, -11792, 30498, -11980, 30424, -12166, 30349, -12353, 30272, -12539, 30195, -12724, 30116, -12909, 30036, -13094, 29955, -13278, 29873, -13462, 29790, -13645, 29706, -13827, 29621, -14009, 29534, -14191, 29446, -14372, 29358, -14552, 29268, -14732, 29177, -14911, 29085, -15090, 28992, -15268, 28897, -15446, 28802, -15623, 28706, -15799, 28608, -15975, 28510, -16150, 28410, -16325, 28309, -16499, 28208, -16672, 28105, -16845, 28001, -17017, 27896, -17189, 27790, -17360, 27683, -17530, 27575, -17699, 27466, -17868, 27355, -18036, 27244, -18204, 27132, -18371, 27019, -18537, 26905, -18702, 26789, -18867, 26673, -19031, 26556, -19194, 26437, -19357, 26318, -19519, 26198, -19680, 26077, -19840, 25954, -20000, 25831, -20159, 25707, -20317, 25582, -20474, 25456, -20631, 25329, -20787, 25201, -20942, 25072, -21096, 24942, -21249, 24811, -21402, 24679, -21554, 24546, -21705, 24413, -21855, 24278, -22004, 24143, -22153, 24006, -22301, 23869, -22448, 23731, -22594, 23592, -22739, 23452, -22883, 23311, -23027, 23169, -23169, 23027, -23311, 22883, -23452, 22739, -23592, 22594, -23731, 22448, -23869, 22301, -24006, 22153, -24143, 22004, -24278, 21855, -24413, 21705, -24546, 21554, -24679, 21402, -24811, 21249, -24942, 21096, -25072, 20942, -25201, 20787, -25329, 20631, -25456, 20474, -25582, 20317, -25707, 20159, -25831, 20000, -25954, 19840, -26077, 19680, -26198, 19519, -26318, 19357, -26437, 19194, -26556, 19031, -26673, 18867, -26789, 18702, -26905, 18537, -27019, 18371, -27132, 18204, -27244, 18036, -27355, 17868, -27466, 17699, -27575, 17530, -27683, 17360, -27790, 17189, -27896, 17017, -28001, 16845, -28105, 16672, -28208, 16499, -28309, 16325, -28410, 16150, -28510, 15975, -28608, 15799, -28706, 15623, -28802, 15446, -28897, 15268, -28992, 15090, -29085, 14911, -29177, 14732, -29268, 14552, -29358, 14372, -29446, 14191, -29534, 14009, -29621, 13827, -29706, 13645, -29790, 13462, -29873, 13278, -29955, 13094, -30036, 12909, -30116, 12724, -30195, 12539, -30272, 12353, -30349, 12166, -30424, 11980, -30498, 11792, -30571, 11604, -30643, 11416, -30713, 11227, -30783, 11038, -30851, 10849, -30918, 10659, -30984, 10469, -31049, 10278, -31113, 10087, -31175, 9895, -31236, 9703, -31297, 9511, -31356, 9319, -31413, 9126, -31470, 8932, -31525, 8739, -31580, 8545, -31633, 8351, -31684, 8156, -31735, 7961, -31785, 7766, -31833, 7571, -31880, 7375, -31926, 7179, -31970, 6982, -32014, 6786, -32056, 6589, -32097, 6392, -32137, 6195, -32176, 5997, -32213, 5799, -32249, 5601, -32284, 5403, -32318, 5205, -32350, 5006, -32382, 4807, -32412, 4608, -32441, 4409, -32468, 4210, -32495, 4011, -32520, 3811, -32544, 3611, -32567, 3411, -32588, 3211, -32609, 3011, -32628, 2811, -32646, 2610, -32662, 2410, -32678, 2209, -32692, 2009, -32705, 1808, -32717, 1607, -32727, 1406, -32736, 1206, -32744, 1005, -32751, 804, -32757, 603, -32761, 402, -32764, 201, -32766, 0, -32767, -201, -32766, -402, -32764, -603, -32761, -804, -32757, -1005, -32751, -1206, -32744, -1406, -32736, -1607, -32727, -1808, -32717, -2009, -32705, -2209, -32692, -2410, -32678, -2610, -32662, -2811, -32646, -3011, -32628, -3211, -32609, -3411, -32588, -3611, -32567, -3811, -32544, -4011, -32520, -4210, -32495, -4409, -32468, -4608, -32441, -4807, -32412, -5006, -32382, -5205, -32350, -5403, -32318, -5601, -32284, -5799, -32249, -5997, -32213, -6195, -32176, -6392, -32137, -6589, -32097, -6786, -32056, -6982, -32014, -7179, -31970, -7375, -31926, -7571, -31880, -7766, -31833, -7961, -31785, -8156, -31735, -8351, -31684, -8545, -31633, -8739, -31580, -8932, -31525, -9126, -31470, -9319, -31413, -9511, -31356, -9703, -31297, -9895, -31236, -10087, -31175, -10278, -31113, -10469, -31049, -10659, -30984, -10849, -30918, -11038, -30851, -11227, -30783, -11416, -30713, -11604, -30643, -11792, -30571, -11980, -30498, -12166, -30424, -12353, -30349, -12539, -30272, -12724, -30195, -12909, -30116, -13094, -30036, -13278, -29955, -13462, -29873, -13645, -29790, -13827, -29706, -14009, -29621, -14191, -29534, -14372, -29446, -14552, -29358, -14732, -29268, -14911, -29177, -15090, -29085, -15268, -28992, -15446, -28897, -15623, -28802, -15799, -28706, -15975, -28608, -16150, -28510, -16325, -28410, -16499, -28309, -16672, -28208, -16845, -28105, -17017, -28001, -17189, -27896, -17360, -27790, -17530, -27683, -17699, -27575, -17868, -27466, -18036, -27355, -18204, -27244, -18371, -27132, -18537, -27019, -18702, -26905, -18867, -26789, -19031, -26673, -19194, -26556, -19357, -26437, -19519, -26318, -19680, -26198, -19840, -26077, -20000, -25954, -20159, -25831, -20317, -25707, -20474, -25582, -20631, -25456, -20787, -25329, -20942, -25201, -21096, -25072, -21249, -24942, -21402, -24811, -21554, -24679, -21705, -24546, -21855, -24413, -22004, -24278, -22153, -24143, -22301, -24006, -22448, -23869, -22594, -23731, -22739, -23592, -22883, -23452, -23027, -23311, -23169, -23169, -23311, -23027, -23452, -22883, -23592, -22739, -23731, -22594, -23869, -22448, -24006, -22301, -24143, -22153, -24278, -22004, -24413, -21855, -24546, -21705, -24679, -21554, -24811, -21402, -24942, -21249, -25072, -21096, -25201, -20942, -25329, -20787, -25456, -20631, -25582, -20474, -25707, -20317, -25831, -20159, -25954, -20000, -26077, -19840, -26198, -19680, -26318, -19519, -26437, -19357, -26556, -19194, -26673, -19031, -26789, -18867, -26905, -18702, -27019, -18537, -27132, -18371, -27244, -18204, -27355, -18036, -27466, -17868, -27575, -17699, -27683, -17530, -27790, -17360, -27896, -17189, -28001, -17017, -28105, -16845, -28208, -16672, -28309, -16499, -28410, -16325, -28510, -16150, -28608, -15975, -28706, -15799, -28802, -15623, -28897, -15446, -28992, -15268, -29085, -15090, -29177, -14911, -29268, -14732, -29358, -14552, -29446, -14372, -29534, -14191, -29621, -14009, -29706, -13827, -29790, -13645, -29873, -13462, -29955, -13278, -30036, -13094, -30116, -12909, -30195, -12724, -30272, -12539, -30349, -12353, -30424, -12166, -30498, -11980, -30571, -11792, -30643, -11604, -30713, -11416, -30783, -11227, -30851, -11038, -30918, -10849, -30984, -10659, -31049, -10469, -31113, -10278, -31175, -10087, -31236, -9895, -31297, -9703, -31356, -9511, -31413, -9319, -31470, -9126, -31525, -8932, -31580, -8739, -31633, -8545, -31684, -8351, -31735, -8156, -31785, -7961, -31833, -7766, -31880, -7571, -31926, -7375, -31970, -7179, -32014, -6982, -32056, -6786, -32097, -6589, -32137, -6392, -32176, -6195, -32213, -5997, -32249, -5799, -32284, -5601, -32318, -5403, -32350, -5205, -32382, -5006, -32412, -4807, -32441, -4608, -32468, -4409, -32495, -4210, -32520, -4011, -32544, -3811, -32567, -3611, -32588, -3411, -32609, -3211, -32628, -3011, -32646, -2811, -32662, -2610, -32678, -2410, -32692, -2209, -32705, -2009, -32717, -1808, -32727, -1607, -32736, -1406, -32744, -1206, -32751, -1005, -32757, -804, -32761, -603, -32764, -402, -32766, -201, 
};

RT_L2_DATA int32_t twiddleCoef_i32_128[128] = {
2147483647, 0, 2144896908, -105372028, 2137142926, -210490205, 2124240379, -315101294, 2106220350, -418953276, 2083126253, -521795962, 2055013722, -623381597, 2021950482, -723465451, 1984016187, -821806412, 1941302224, -918167571, 1893911493, -1012316783, 1841958163, -1104027236, 1785567395, -1193077990, 1724875039, -1279254514, 1660027307, -1362349203, 1591180424, -1442161873, 1518500249, -1518500249, 1442161873, -1591180424, 1362349203, -1660027307, 1279254514, -1724875039, 1193077990, -1785567395, 1104027236, -1841958163, 1012316783, -1893911493, 918167571, -1941302224, 821806412, -1984016187, 723465451, -2021950482, 623381597, -2055013722, 521795962, -2083126253, 418953276, -2106220350, 315101294, -2124240379, 210490205, -2137142926, 105372028, -2144896908, 0, -2147483647, -105372028, -2144896908, -210490205, -2137142926, -315101294, -2124240379, -418953276, -2106220350, -521795962, -2083126253, -623381597, -2055013722, -723465451, -2021950482, -821806412, -1984016187, -918167571, -1941302224, -1012316783, -1893911493, -1104027236, -1841958163, -1193077990, -1785567395, -1279254514, -1724875039, -1362349203, -1660027307, -1442161873, -1591180424, -1518500249, -1518500249, -1591180424, -1442161873, -1660027307, -1362349203, -1724875039, -1279254514, -1785567395, -1193077990, -1841958163, -1104027236, -1893911493, -1012316783, -1941302224, -918167571, -1984016187, -821806412, -2021950482, -723465451, -2055013722, -623381597, -2083126253, -521795962, -2106220350, -418953276, -2124240379, -315101294, -2137142926, -210490205, -2144896908, -105372028, 
};

RT_L2_DATA int32_t twiddleCoef_i32_256[256] = {
2147483647, 0, 2146836865, -52701886, 2144896908, -105372028, 2141664947, -157978697, 2137142926, -210490205, 2131333570, -262874923, 2124240379, -315101294, 2115867624, -367137860, 2106220350, -418953276, 2095304368, -470516330, 2083126253, -521795962, 2069693340, -572761285, 2055013722, -623381597, 2039096240, -673626407, 2021950482, -723465451, 2003586778, -772868705, 1984016187, -821806412, 1963250500, -870249094, 1941302224, -918167571, 1918184579, -965532977, 1893911493, -1012316783, 1868497584, -1058490807, 1841958163, -1104027236, 1814309215, -1148898639, 1785567395, -1193077990, 1755750016, -1236538674, 1724875039, -1279254514, 1692961061, -1321199779, 1660027307, -1362349203, 1626093615, -1402677998, 1591180424, -1442161873, 1555308767, -1480777043, 1518500249, -1518500249, 1480777043, -1555308767, 1442161873, -1591180424, 1402677998, -1626093615, 1362349203, -1660027307, 1321199779, -1692961061, 1279254514, -1724875039, 1236538674, -1755750016, 1193077990, -1785567395, 1148898639, -1814309215, 1104027236, -1841958163, 1058490807, -1868497584, 1012316783, -1893911493, 965532977, -1918184579, 918167571, -1941302224, 870249094, -1963250500, 821806412, -1984016187, 772868705, -2003586778, 723465451, -2021950482, 673626407, -2039096240, 623381597, -2055013722, 572761285, -2069693340, 521795962, -2083126253, 470516330, -2095304368, 418953276, -2106220350, 367137860, -2115867624, 315101294, -2124240379, 262874923, -2131333570, 210490205, -2137142926, 157978697, -2141664947, 105372028, -2144896908, 52701886, -2146836865, 0, -2147483647, -52701886, -2146836865, -105372028, -2144896908, -157978697, -2141664947, -210490205, -2137142926, -262874923, -2131333570, -315101294, -2124240379, -367137860, -2115867624, -418953276, -2106220350, -470516330, -2095304368, -521795962, -2083126253, -572761285, -2069693340, -623381597, -2055013722, -673626407, -2039096240, -723465451, -2021950482, -772868705, -2003586778, -821806412, -1984016187, -870249094, -1963250500, -918167571, -1941302224, -965532977, -1918184579, -1012316783, -1893911493, -1058490807, -1868497584, -1104027236, -1841958163, -1148898639, -1814309215, -1193077990, -1785567395, -1236538674, -1755750016, -1279254514, -1724875039, -1321199779, -1692961061, -1362349203, -1660027307, -1402677998, -1626093615, -1442161873, -1591180424, -1480777043, -1555308767, -1518500249, -1518500249, -1555308767, -1480777043, -1591180424, -1442161873, -1626093615, -1402677998, -1660027307, -1362349203, -1692961061, -1321199779, -1724875039, -1279254514, -1755750016, -1236538674, -1785567395, -1193077990, -1814309215, -1148898639, -1841958163, -1104027236, -1868497584, -1058490807, -1893911493, -1012316783, -1918184579, -965532977, -1941302224, -918167571, -1963250500, -870249094, -1984016187, -821806412, -2003586778, -772868705, -2021950482, -723465451, -2039096240, -673626407, -2055013722, -623381597, -2069693340, -572761285, -2083126253, -521795962, -2095304368, -470516330, -2106220350, -418953276, -2115867624, -367137860, -2124240379, -315101294, -2131333570, -262874923, -2137142926, -210490205, -2141664947, -157978697, -2144896908, -105372028, -2146836865, -52701886, 
};

RT_L2_DATA int32_t twiddleCoef_i32_512[512] = {
2147483647, 0, 2147321945, -26352927, 2146836865, -52701886, 2146028478, -79042909, 2144896908, -105372028, 2143442325, -131685278, 2141664947, -157978697, 2139565041, -184248325, 2137142926, -210490205, 2134398964, -236700387, 2131333570, -262874923, 2127947205, -289009870, 2124240379, -315101294, 2120213650, -341145265, 2115867624, -367137860, 2111202957, -393075166, 2106220350, -418953276, 2100920555, -444768293, 2095304368, -470516330, 2089372636, -496193509, 2083126253, -521795962, 2076566158, -547319836, 2069693340, -572761285, 2062508834, -598116478, 2055013722, -623381597, 2047209132, -648552837, 2039096240, -673626407, 2030676267, -698598532, 2021950482, -723465451, 2012920199, -748223418, 2003586778, -772868705, 1993951623, -797397601, 1984016187, -821806412, 1973781966, -846091463, 1963250500, -870249094, 1952423376, -894275670, 1941302224, -918167571, 1929888719, -941921199, 1918184579, -965532977, 1906191569, -988999350, 1893911493, -1012316783, 1881346200, -1035481765, 1868497584, -1058490807, 1855367579, -1081340444, 1841958163, -1104027236, 1828271354, -1126547764, 1814309215, -1148898639, 1800073847, -1171076494, 1785567395, -1193077990, 1770792043, -1214899812, 1755750016, -1236538674, 1740443579, -1257991319, 1724875039, -1279254514, 1709046738, -1300325059, 1692961061, -1321199779, 1676620430, -1341875532, 1660027307, -1362349203, 1643184190, -1382617709, 1626093615, -1402677998, 1608758156, -1422527049, 1591180424, -1442161873, 1573363067, -1461579512, 1555308767, -1480777043, 1537020242, -1499751575, 1518500249, -1518500249, 1499751575, -1537020242, 1480777043, -1555308767, 1461579512, -1573363067, 1442161873, -1591180424, 1422527049, -1608758156, 1402677998, -1626093615, 1382617709, -1643184190, 1362349203, -1660027307, 1341875532, -1676620430, 1321199779, -1692961061, 1300325059, -1709046738, 1279254514, -1724875039, 1257991319, -1740443579, 1236538674, -1755750016, 1214899812, -1770792043, 1193077990, -1785567395, 1171076494, -1800073847, 1148898639, -1814309215, 1126547764, -1828271354, 1104027236, -1841958163, 1081340444, -1855367579, 1058490807, -1868497584, 1035481765, -1881346200, 1012316783, -1893911493, 988999350, -1906191569, 965532977, -1918184579, 941921199, -1929888719, 918167571, -1941302224, 894275670, -1952423376, 870249094, -1963250500, 846091463, -1973781966, 821806412, -1984016187, 797397601, -1993951623, 772868705, -2003586778, 748223418, -2012920199, 723465451, -2021950482, 698598532, -2030676267, 673626407, -2039096240, 648552837, -2047209132, 623381597, -2055013722, 598116478, -2062508834, 572761285, -2069693340, 547319836, -2076566158, 521795962, -2083126253, 496193509, -2089372636, 470516330, -2095304368, 444768293, -2100920555, 418953276, -2106220350, 393075166, -2111202957, 367137860, -2115867624, 341145265, -2120213650, 315101294, -2124240379, 289009870, -2127947205, 262874923, -2131333570, 236700387, -2134398964, 210490205, -2137142926, 184248325, -2139565041, 157978697, -2141664947, 131685278, -2143442325, 105372028, -2144896908, 79042909, -2146028478, 52701886, -2146836865, 26352927, -2147321945, 0, -2147483647, -26352927, -2147321945, -52701886, -2146836865, -79042909, -2146028478, -105372028, -2144896908, -131685278, -2143442325, -157978697, -2141664947, -184248325, -2139565041, -210490205, -2137142926, -236700387, -2134398964, -262874923, -2131333570, -289009870, -2127947205, -315101294, -2124240379, -341145265, -2120213650, -367137860, -2115867624, -393075166, -2111202957, -418953276, -2106220350, -444768293, -2100920555, -470516330, -2095304368, -496193509, -2089372636, -521795962, -2083126253, -547319836, -2076566158, -572761285, -2069693340, -598116478, -2062508834, -623381597, -2055013722, -648552837, -2047209132, -673626407, -2039096240, -698598532, -2030676267, -723465451, -2021950482, -748223418, -2012920199, -772868705, -2003586778, -797397601, -1993951623, -821806412, -1984016187, -846091463, -1973781966, -870249094, -1963250500, -894275670, -1952423376, -918167571, -1941302224, -941921199, -1929888719, -965532977, -1918184579, -988999350, -1906191569, -1012316783, -1893911493, -1035481765, -1881346200, -1058490807, -1868497584, -1081340444, -1855367579, -1104027236, -1841958163, -1126547764, -1828271354, -1148898639, -1814309215, -1171076494, -1800073847, -1193077990, -1785567395, -1214899812, -1770792043, -1236538674, -1755750016, -1257991319, -1740443579, -1279254514, -1724875039, -1300325059, -1709046738, -1321199779, -1692961061, -1341875532, -1676620430, -1362349203, -1660027307, -1382617709, -1643184190, -1402677998, -1626093615, -1422527049, -1608758156, -1442161873, -1591180424, -1461579512, -1573363067, -1480777043, -1555308767, -1499751575, -1537020242, -1518500249, -1518500249, -1537020242, -1499751575, -1555308767, -1480777043, -1573363067, -1461579512, -1591180424, -1442161873, -1608758156, -1422527049, -1626093615, -1402677998, -1643184190, -1382617709, -1660027307, -1362349203, -1676620430, -1341875532, -1692961061, -1321199779, -1709046738, -1300325059, -1724875039, -1279254514, -1740443579, -1257991319, -1755750016, -1236538674, -1770792043, -1214899812, -1785567395, -1193077990, -1800073847, -1171076494, -1814309215, -1148898639, -1828271354, -1126547764, -1841958163, -1104027236, -1855367579, -1081340444, -1868497584, -1058490807, -1881346200, -1035481765, -1893911493, -1012316783, -1906191569, -988999350, -1918184579, -965532977, -1929888719, -941921199, -1941302224, -918167571, -1952423376, -894275670, -1963250500, -870249094, -1973781966, -846091463, -1984016187, -821806412, -1993951623, -797397601, -2003586778, -772868705, -2012920199, -748223418, -2021950482, -723465451, -2030676267, -698598532, -2039096240, -673626407, -2047209132, -648552837, -2055013722, -623381597, -2062508834, -598116478, -2069693340, -572761285, -2076566158, -547319836, -2083126253, -521795962, -2089372636, -496193509, -2095304368, -470516330, -2100920555, -444768293, -2106220350, -418953276, -2111202957, -393075166, -2115867624, -367137860, -2120213650, -341145265, -2124240379, -315101294, -2127947205, -289009870, -2131333570, -262874923, -2134398964, -236700387, -2137142926, -210490205, -2139565041, -184248325, -2141664947, -157978697, -2143442325, -131685278, -2144896908, -105372028, -2146028478, -79042909, -2146836865, -52701886, -2147321945, -26352927, 
};

RT_L2_DATA int32_t twiddleCoef_i32_1024[1024] = {
2147483647, 0, 2147443221, -13176711, 2147321945, -26352927, 2147119824, -39528151, 2146836865, -52701886, 2146473078, -65873638, 2146028478, -79042909, 2145503082, -92209204, 2144896908, -105372028, 2144209981, -118530884, 2143442325, -131685278, 2142593969, -144834714, 2141664947, -157978697, 2140655291, -171116732, 2139565041, -184248325, 2138394238, -197372981, 2137142926, -210490205, 2135811151, -223599506, 2134398964, -236700387, 2132906418, -249792357, 2131333570, -262874923, 2129680478, -275947591, 2127947205, -289009870, 2126133816, -302061268, 2124240379, -315101294, 2122266965, -328129456, 2120213650, -341145265, 2118080509, -354148229, 2115867624, -367137860, 2113575078, -380113668, 2111202957, -393075166, 2108751350, -406021864, 2106220350, -418953276, 2103610052, -431868914, 2100920555, -444768293, 2098151959, -457650927, 2095304368, -470516330, 2092377891, -483364018, 2089372636, -496193509, 2086288718, -509004317, 2083126253, -521795962, 2079885359, -534567962, 2076566158, -547319836, 2073168776, -560051103, 2069693340, -572761285, 2066139982, -585449902, 2062508834, -598116478, 2058800034, -610760535, 2055013722, -623381597, 2051150039, -635979189, 2047209132, -648552837, 2043191148, -661102067, 2039096240, -673626407, 2034924560, -686125386, 2030676267, -698598532, 2026351520, -711045377, 2021950482, -723465451, 2017473319, -735858286, 2012920199, -748223418, 2008291294, -760560379, 2003586778, -772868705, 1998806828, -785147933, 1993951623, -797397601, 1989021348, -809617248, 1984016187, -821806412, 1978936329, -833964637, 1973781966, -846091463, 1968553290, -858186434, 1963250500, -870249094, 1957873794, -882278991, 1952423376, -894275670, 1946899449, -906238680, 1941302224, -918167571, 1935631909, -930061893, 1929888719, -941921199, 1924072869, -953745042, 1918184579, -965532977, 1912224071, -977284561, 1906191569, -988999350, 1900087299, -1000676904, 1893911493, -1012316783, 1887664381, -1023918549, 1881346200, -1035481765, 1874957188, -1047005996, 1868497584, -1058490807, 1861967633, -1069935767, 1855367579, -1081340444, 1848697672, -1092704410, 1841958163, -1104027236, 1835149305, -1115308495, 1828271354, -1126547764, 1821324571, -1137744620, 1814309215, -1148898639, 1807225552, -1160009404, 1800073847, -1171076494, 1792854371, -1182099495, 1785567395, -1193077990, 1778213193, -1204011566, 1770792043, -1214899812, 1763304223, -1225742317, 1755750016, -1236538674, 1748129706, -1247288476, 1740443579, -1257991319, 1732691926, -1268646799, 1724875039, -1279254514, 1716993210, -1289814067, 1709046738, -1300325059, 1701035921, -1310787094, 1692961061, -1321199779, 1684822462, -1331562722, 1676620430, -1341875532, 1668355275, -1352137821, 1660027307, -1362349203, 1651636840, -1372509293, 1643184190, -1382617709, 1634669674, -1392674071, 1626093615, -1402677998, 1617456334, -1412629116, 1608758156, -1422527049, 1599999410, -1432371425, 1591180424, -1442161873, 1582301532, -1451898024, 1573363067, -1461579512, 1564365365, -1471205973, 1555308767, -1480777043, 1546193611, -1490292363, 1537020242, -1499751575, 1527789006, -1509154321, 1518500249, -1518500249, 1509154321, -1527789006, 1499751575, -1537020242, 1490292363, -1546193611, 1480777043, -1555308767, 1471205973, -1564365365, 1461579512, -1573363067, 1451898024, -1582301532, 1442161873, -1591180424, 1432371425, -1599999410, 1422527049, -1608758156, 1412629116, -1617456334, 1402677998, -1626093615, 1392674071, -1634669674, 1382617709, -1643184190, 1372509293, -1651636840, 1362349203, -1660027307, 1352137821, -1668355275, 1341875532, -1676620430, 1331562722, -1684822462, 1321199779, -1692961061, 1310787094, -1701035921, 1300325059, -1709046738, 1289814067, -1716993210, 1279254514, -1724875039, 1268646799, -1732691926, 1257991319, -1740443579, 1247288476, -1748129706, 1236538674, -1755750016, 1225742317, -1763304223, 1214899812, -1770792043, 1204011566, -1778213193, 1193077990, -1785567395, 1182099495, -1792854371, 1171076494, -1800073847, 1160009404, -1807225552, 1148898639, -1814309215, 1137744620, -1821324571, 1126547764, -1828271354, 1115308495, -1835149305, 1104027236, -1841958163, 1092704410, -1848697672, 1081340444, -1855367579, 1069935767, -1861967633, 1058490807, -1868497584, 1047005996, -1874957188, 1035481765, -1881346200, 1023918549, -1887664381, 1012316783, -1893911493, 1000676904, -1900087299, 988999350, -1906191569, 977284561, -1912224071, 965532977, -1918184579, 953745042, -1924072869, 941921199, -1929888719, 930061893, -1935631909, 918167571, -1941302224, 906238680, -1946899449, 894275670, -1952423376, 882278991, -1957873794, 870249094, -1963250500, 858186434, -1968553290, 846091463, -1973781966, 833964637, -1978936329, 821806412, -1984016187, 809617248, -1989021348, 797397601, -1993951623, 785147933, -1998806828, 772868705, -2003586778, 760560379, -2008291294, 748223418, -2012920199, 735858286, -2017473319, 723465451, -2021950482, 711045377, -2026351520, 698598532, -2030676267, 686125386, -2034924560, 673626407, -2039096240, 661102067, -2043191148, 648552837, -2047209132, 635979189, -2051150039, 623381597, -2055013722, 610760535, -2058800034, 598116478, -2062508834, 585449902, -2066139982, 572761285, -2069693340, 560051103, -2073168776, 547319836, -2076566158, 534567962, -2079885359, 521795962, -2083126253, 509004317, -2086288718, 496193509, -2089372636, 483364018, -2092377891, 470516330, -2095304368, 457650927, -2098151959, 444768293, -2100920555, 431868914, -2103610052, 418953276, -2106220350, 406021864, -2108751350, 393075166, -2111202957, 380113668, -2113575078, 367137860, -2115867624, 354148229, -2118080509, 341145265, -2120213650, 328129456, -2122266965, 315101294, -2124240379, 302061268, -2126133816, 289009870, -2127947205, 275947591, -2129680478, 262874923, -2131333570, 249792357, -2132906418, 236700387, -2134398964, 223599506, -2135811151, 210490205, -2137142926, 197372981, -2138394238, 184248325, -2139565041, 171116732, -2140655291, 157978697, -2141664947, 144834714, -2142593969, 131685278, -2143442325, 118530884, -2144209981, 105372028, -2144896908, 92209204, -2145503082, 79042909, -2146028478, 65873638, -2146473078, 52701886, -2146836865, 39528151, -2147119824, 26352927, -2147321945, 13176711, -2147443221, 0, -2147483647, -13176711, -2147443221, -26352927, -2147321945, -39528151, -2147119824, -52701886, -2146836865, -65873638, -2146473078, -79042909, -2146028478, -92209204, -2145503082, -105372028, -2144896908, -118530884, -2144209981, -131685278, -2143442325, -144834714, -2142593969, -157978697, -2141664947, -171116732, -2140655291, -184248325, -2139565041, -197372981, -2138394238, -210490205, -2137142926, -223599506, -2135811151, -236700387, -2134398964, -249792357, -2132906418, -262874923, -2131333570, -275947591, -2129680478, -289009870, -2127947205, -302061268, -2126133816, -315101294, -2124240379, -328129456, -2122266965, -341145265, -2120213650, -354148229, -2118080509, -367137860, -2115867624, -380113668, -2113575078, -393075166, -2111202957, -406021864, -2108751350, -418953276, -2106220350, -431868914, -2103610052, -444768293, -2100920555, -457650927, -2098151959, -470516330, -2095304368, -483364018, -2092377891, -496193509, -2089372636, -509004317, -2086288718, -521795962, -2083126253, -534567962, -2079885359, -547319836, -2076566158, -560051103, -2073168776, -572761285, -2069693340, -585449902, -2066139982, -598116478, -2062508834, -610760535, -2058800034, -623381597, -2055013722, -635979189, -2051150039, -648552837, -2047209132, -661102067, -2043191148, -673626407, -2039096240, -686125386, -2034924560, -698598532, -2030676267, -711045377, -2026351520, -723465451, -2021950482, -735858286, -2017473319, -748223418, -2012920199, -760560379, -2008291294, -772868705, -2003586778, -785147933, -1998806828, -797397601, -1993951623, -809617248, -1989021348, -821806412, -1984016187, -833964637, -1978936329, -846091463, -1973781966, -858186434, -1968553290, -870249094, -1963250500, -882278991, -1957873794, -894275670, -1952423376, -906238680, -1946899449, -918167571, -1941302224, -930061893, -1935631909, -941921199, -1929888719, -953745042, -1924072869, -965532977, -1918184579, -977284561, -1912224071, -988999350, -1906191569, -1000676904, -1900087299, -1012316783, -1893911493, -1023918549, -1887664381, -1035481765, -1881346200, -1047005996, -1874957188, -1058490807, -1868497584, -1069935767, -1861967633, -1081340444, -1855367579, -1092704410, -1848697672, -1104027236, -1841958163, -1115308495, -1835149305, -1126547764, -1828271354, -1137744620, -1821324571, -1148898639, -1814309215, -1160009404, -1807225552, -1171076494, -1800073847, -1182099495, -1792854371, -1193077990, -1785567395, -1204011566, -1778213193, -1214899812, -1770792043, -1225742317, -1763304223, -1236538674, -1755750016, -1247288476, -1748129706, -1257991319, -1740443579, -1268646799, -1732691926, -1279254514, -1724875039, -1289814067, -1716993210, -1300325059, -1709046738, -1310787094, -1701035921, -1321199779, -1692961061, -1331562722, -1684822462, -1341875532, -1676620430, -1352137821, -1668355275, -1362349203, -1660027307, -1372509293, -1651636840, -1382617709, -1643184190, -1392674071, -1634669674, -1402677998, -1626093615, -1412629116, -1617456334, -1422527049, -1608758156, -1432371425, -1599999410, -1442161873, -1591180424, -1451898024, -1582301532, -1461579512, -1573363067, -1471205973, -1564365365, -1480777043, -1555308767, -1490292363, -1546193611, -1499751575, -1537020242, -1509154321, -1527789006, -1518500249, -1518500249, -1527789006, -1509154321, -1537020242, -1499751575, -1546193611, -1490292363, -1555308767, -1480777043, -1564365365, -1471205973, -1573363067, -1461579512, -1582301532, -1451898024, -1591180424, -1442161873, -1599999410, -1432371425, -1608758156, -1422527049, -1617456334, -1412629116, -1626093615, -1402677998, -1634669674, -1392674071, -1643184190, -1382617709, -1651636840, -1372509293, -1660027307, -1362349203, -1668355275, -1352137821, -1676620430, -1341875532, -1684822462, -1331562722, -1692961061, -1321199779, -1701035921, -1310787094, -1709046738, -1300325059, -1716993210, -1289814067, -1724875039, -1279254514, -1732691926, -1268646799, -1740443579, -1257991319, -1748129706, -1247288476, -1755750016, -1236538674, -1763304223, -1225742317, -1770792043, -1214899812, -1778213193, -1204011566, -1785567395, -1193077990, -1792854371, -1182099495, -1800073847, -1171076494, -1807225552, -1160009404, -1814309215, -1148898639, -1821324571, -1137744620, -1828271354, -1126547764, -1835149305, -1115308495, -1841958163, -1104027236, -1848697672, -1092704410, -1855367579, -1081340444, -1861967633, -1069935767, -1868497584, -1058490807, -1874957188, -1047005996, -1881346200, -1035481765, -1887664381, -1023918549, -1893911493, -1012316783, -1900087299, -1000676904, -1906191569, -988999350, -1912224071, -977284561, -1918184579, -965532977, -1924072869, -953745042, -1929888719, -941921199, -1935631909, -930061893, -1941302224, -918167571, -1946899449, -906238680, -1952423376, -894275670, -1957873794, -882278991, -1963250500, -870249094, -1968553290, -858186434, -1973781966, -846091463, -1978936329, -833964637, -1984016187, -821806412, -1989021348, -809617248, -1993951623, -797397601, -1998806828, -785147933, -2003586778, -772868705, -2008291294, -760560379, -2012920199, -748223418, -2017473319, -735858286, -2021950482, -723465451, -2026351520, -711045377, -2030676267, -698598532, -2034924560, -686125386, -2039096240, -673626407, -2043191148, -661102067, -2047209132, -648552837, -2051150039, -635979189, -2055013722, -623381597, -2058800034, -610760535, -2062508834, -598116478, -2066139982, -585449902, -2069693340, -572761285, -2073168776, -560051103, -2076566158, -547319836, -2079885359, -534567962, -2083126253, -521795962, -2086288718, -509004317, -2089372636, -496193509, -2092377891, -483364018, -2095304368, -470516330, -2098151959, -457650927, -2100920555, -444768293, -2103610052, -431868914, -2106220350, -418953276, -2108751350, -406021864, -2111202957, -393075166, -2113575078, -380113668, -2115867624, -367137860, -2118080509, -354148229, -2120213650, -341145265, -2122266965, -328129456, -2124240379, -315101294, -2126133816, -302061268, -2127947205, -289009870, -2129680478, -275947591, -2131333570, -262874923, -2132906418, -249792357, -2134398964, -236700387, -2135811151, -223599506, -2137142926, -210490205, -2138394238, -197372981, -2139565041, -184248325, -2140655291, -171116732, -2141664947, -157978697, -2142593969, -144834714, -2143442325, -131685278, -2144209981, -118530884, -2144896908, -105372028, -2145503082, -92209204, -2146028478, -79042909, -2146473078, -65873638, -2146836865, -52701886, -2147119824, -39528151, -2147321945, -26352927, -2147443221, -13176711, 
};


#endif
