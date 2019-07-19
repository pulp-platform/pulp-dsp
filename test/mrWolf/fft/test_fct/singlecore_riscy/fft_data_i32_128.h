#ifndef __FFT_H_32__
#define __FFT_H_32__

typedef int32_t v_type;
RT_L2_DATA int32_t x[256] = {
586153693, 0, -342513185, 0, -572229257, 0, 978896456, 0, 84364309, 0, 307509554, 0, 1041655216, 0, 846064181, 0, 145255866, 0, 755771616, 0, -316086145, 0, 554877773, 0, 493670208, 0, -425540425, 0, 28713021, 0, -405042636, 0, 168592540, 0, 351892379, 0, -670460435, 0, 322279171, 0, -138869185, 0, 516091580, 0, -631511744, 0, -399379920, 0, -349156628, 0, 568947306, 0, 845963720, 0, 465345836, 0, 13327094, 0, 786092379, 0, -929014226, 0, 462709340, 0, 90543465, 0, 167438029, 0, -540254775, 0, 508771758, 0, -472684120, 0, -897109263, 0, 353490302, 0, 977468860, 0, -804287321, 0, -777824881, 0, 42108473, 0, 293804711, 0, 645417091, 0, 699276765, 0, -133355354, 0, 989691027, 0, -1053662851, 0, -891615438, 0, 583946432, 0, 102652366, 0, 615738101, 0, -569008617, 0, -157271630, 0, 703073774, 0, 769239107, 0, 981422219, 0, -512996348, 0, -15608380, 0, -960973943, 0, -850213227, 0, 886863735, 0, 163624184, 0, -999753033, 0, -608263065, 0, -311812794, 0, -598729769, 0, 358114215, 0, 258334133, 0, -422043352, 0, 271817215, 0, -966917031, 0, -974153344, 0, -147418877, 0, -212293564, 0, 346665075, 0, -413545133, 0, -9807742, 0, -1051494594, 0, -120313864, 0, 175763669, 0, 43334872, 0, 19449085, 0, 871449519, 0, 477827993, 0, -300787621, 0, -464511717, 0, 513296752, 0, -270497820, 0, -188972911, 0, -932342732, 0, -898053212, 0, -797739744, 0, 387643292, 0, -193743056, 0, 88564430, 0, -968272358, 0, -569770472, 0, 771223385, 0, 1073551408, 0, -884338865, 0, 508354293, 0, -208508668, 0, -555282068, 0, 630130762, 0, 197351727, 0, 496867282, 0, -481007756, 0, 362392332, 0, 236723930, 0, 236466227, 0, -427958206, 0, 208714516, 0, 680056469, 0, -866815599, 0, 542525630, 0, 781173196, 0, 541345021, 0, -782322298, 0, -42860606, 0, 306354860, 0, -328522943, 0, -829138465, 0, -1045445668, 0, 882963829, 0, -1019279947, 0, 788076000, 0, 
};

RT_L2_DATA int32_t exp_result[256] = {
-66654896, 0, 695874079, -489678461, 34881955, 257375038, 80074286, -357542823, -431226356, -156882774, 358209966, -929619005, -3367939, -378205478, -613597135, -207187546, -380498192, -447217460, 678065248, 48786866, -390062977, -272592093, 6900710, 85161485, 261474837, -229137486, -42203652, 645823135, 469507529, 284753006, 276199797, -16508547, -356995952, 302038488, 68949133, -146883454, -30954329, 518158869, 72559236, 38170737, 784645949, 822681890, -660875034, -954626989, 61910458, 423114191, 935338883, 67049767, -121767912, 691070614, -78154863, -11106051, -189759952, -368841438, 309508869, 160559287, -847757328, 264596593, -324355049, 380991538, 227102062, 254563566, -254353844, -397910804, -46555107, 304565517, 496943324, -512918275, -305675258, -641150796, 877527249, 51912252, 886482202, 627466930, 284904848, 163577567, -188618569, 184834828, 330274480, 654811573, 359271604, -94081639, 764202615, 121243858, -688568352, 181741822, 606352068, 295379519, 589984103, -535688430, 797049132, 280559042, 228455224, 332964688, 184162167, -229884769, -351230624, -77586010, 627779217, -69124778, -332445079, -223186270, -402185180, 428005609, -26399926, 260617552, -340434064, 265929616, 1065154942, 313816310, -83726641, 58400377, 9661776, 471966573, -383726048, 375758302, -635868215, -90715990, -382421010, -268190392, -369487854, -117941751, 87587373, 241223751, -159906108, 108552978, -486808561, -946691506, -515789499, 0, -486808561, 946691506, -159906108, -108552978, 87587373, -241223751, -369487854, 117941751, -382421010, 268190392, -635868215, 90715990, -383726048, -375758302, 9661776, -471966573, -83726641, -58400377, 1065154942, -313816310, -340434064, -265929616, -26399926, -260617552, -402185180, -428005609, -332445079, 223186270, 627779217, 69124778, -351230624, 77586010, 184162167, 229884769, 228455224, -332964688, 797049132, -280559042, 589984103, 535688430, 606352068, -295379519, -688568352, -181741822, 764202615, -121243858, 359271604, 94081639, 330274480, -654811573, -188618569, -184834828, 284904848, -163577567, 886482202, -627466930, 877527249, -51912252, -305675258, 641150796, 496943324, 512918275, -46555107, -304565517, -254353844, 397910804, 227102062, -254563566, -324355049, -380991538, -847757328, -264596593, 309508869, -160559287, -189759952, 368841438, -78154863, 11106051, -121767912, -691070614, 935338883, -67049767, 61910458, -423114191, -660875034, 954626989, 784645949, -822681890, 72559236, -38170737, -30954329, -518158869, 68949133, 146883454, -356995952, -302038488, 276199797, 16508547, 469507529, -284753006, -42203652, -645823135, 261474837, 229137486, 6900710, -85161485, -390062977, 272592093, 678065248, -48786866, -380498192, 447217460, -613597135, 207187546, -3367939, 378205478, 358209966, 929619005, -431226356, 156882774, 80074286, 357542823, 34881955, -257375038, 695874079, 489678461, 
};

RT_L2_DATA int32_t twiddleCoef_i32_128[128] = {
2147483647, 0, 2144896908, -105372028, 2137142926, -210490206, 2124240379, -315101294, 2106220350, -418953276, 2083126253, -521795963, 2055013722, -623381597, 2021950482, -723465451, 1984016187, -821806413, 1941302223, -918167571, 1893911493, -1012316784, 1841958163, -1104027236, 1785567395, -1193077990, 1724875038, -1279254515, 1660027307, -1362349204, 1591180424, -1442161874, 1518500248, -1518500249, 1442161873, -1591180425, 1362349203, -1660027308, 1279254514, -1724875039, 1193077989, -1785567396, 1104027235, -1841958164, 1012316783, -1893911494, 918167570, -1941302224, 821806412, -1984016188, 723465450, -2021950483, 623381596, -2055013723, 521795962, -2083126254, 418953275, -2106220351, 315101293, -2124240380, 210490205, -2137142927, 105372027, -2144896909, -1, -2147483648, -105372030, -2144896909, -210490208, -2137142927, -315101296, -2124240380, -418953278, -2106220351, -521795965, -2083126254, -623381599, -2055013723, -723465453, -2021950483, -821806415, -1984016188, -918167573, -1941302224, -1012316786, -1893911494, -1104027238, -1841958164, -1193077992, -1785567396, -1279254517, -1724875039, -1362349206, -1660027308, -1442161876, -1591180425, -1518500251, -1518500249, -1591180427, -1442161874, -1660027310, -1362349204, -1724875041, -1279254515, -1785567398, -1193077990, -1841958166, -1104027236, -1893911496, -1012316784, -1941302226, -918167571, -1984016190, -821806413, -2021950485, -723465451, -2055013725, -623381597, -2083126256, -521795963, -2106220353, -418953276, -2124240382, -315101294, -2137142929, -210490206, -2144896911, -105372028, 
};


#endif
