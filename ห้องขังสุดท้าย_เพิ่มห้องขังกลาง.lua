local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local BIG_OFF = {
    CFrame.new(2.6252, -1.2004, -3.6240, 0.9968,-0.0794,-0.0005,-0.0000,0.0054,-1.0000,0.0794,0.9968,0.0054),
    CFrame.new(2.6029, 1.2463, -3.6129, 0.9967,-0.0798,-0.0166,-0.0182,-0.0195,-0.9996,0.0794,0.9966,-0.0209),
    CFrame.new(3.8187, 1.2851, 0.2481, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-1.8622, 1.4963, -3.9255, 0.9967,-0.0805,-0.0136,-0.0183,-0.0583,-0.9981,0.0795,0.9951,-0.0596),
    CFrame.new(3.9730, 1.2851, -2.2735, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(3.6081, 1.2851, 2.5614, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(3.9167, -1.3347, -1.8895, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-2.6553, 1.3819, 3.5085, -0.9962,0.0845,0.0229,-0.0202,0.0330,-0.9993,-0.0852,-0.9959,-0.0312),
    CFrame.new(2.1610, -1.2803, 3.9305, -0.9964,0.0849,0.0014,0.0000,0.0161,-0.9999,-0.0850,-0.9963,-0.0160),
    CFrame.new(-3.5659, 1.2546, -2.6004, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(2.3777, 2.6871, -2.1874, 0.0440,0.0535,-0.9976,0.0000,-0.9986,-0.0535,-0.9990,0.0023,-0.0439),
    CFrame.new(-0.3033, 2.7354, 2.5088, 0.0441,0.0523,-0.9977,-0.0001,-0.9986,-0.0524,-0.9990,0.0024,-0.0441),
    CFrame.new(-0.1042, 2.7023, -0.1284, 0.0440,0.0085,-0.9990,0.0000,-1.0000,-0.0085,-0.9990,0.0004,-0.0440),
    CFrame.new(-2.6425, 2.6771, 2.1193, 0.1894,0.0123,-0.9818,-0.0185,-0.9997,-0.0161,-0.9817,0.0212,-0.1891),
    CFrame.new(-2.1169, 2.7683, -2.2156, 0.0441,0.0691,-0.9966,0.0000,-0.9976,-0.0691,-0.9990,0.0030,-0.0440),
    CFrame.new(2.2771, 2.7354, 0.3146, 0.0442,-0.0109,-0.9990,-0.0001,-0.9999,0.0109,-0.9990,-0.0004,-0.0442),
    CFrame.new(2.1168, 2.7671, 2.8671, 0.0440,0.0072,-0.9990,0.0000,-1.0000,-0.0072,-0.9990,0.0003,-0.0440),
    CFrame.new(0.2509, 2.7353, -2.1116, 0.0441,-0.0491,-0.9978,-0.0000,-0.9988,0.0491,-0.9990,-0.0021,-0.0440),
    CFrame.new(-3.7793, -1.1950, -0.7370, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(-4.1158, 1.2546, 2.1298, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(2.1641, -2.8267, 2.6680, -0.0322,0.0000,-0.9995,0.0000,1.0000,0.0000,0.9995,0.0000,-0.0322),
    CFrame.new(-0.3934, 1.3819, 3.8035, -0.9962,0.0845,0.0230,-0.0202,0.0331,-0.9992,-0.0852,-0.9959,-0.0313),
    CFrame.new(-0.2175, -2.8267, -0.0396, 0.9993,0.0000,0.0379,0.0000,1.0000,0.0000,-0.0379,0.0000,0.9993),
    CFrame.new(2.5325, -2.8267, 0.0899, 0.0402,0.0000,-0.9992,0.0000,1.0000,0.0000,0.9992,0.0000,0.0402),
    CFrame.new(-0.0530, -2.8267, -2.5254, 0.9971,0.0000,-0.0760,0.0000,1.0000,0.0000,0.0760,0.0000,0.9971),
    CFrame.new(2.4081, -2.8267, -2.0422, -0.0499,0.0000,-0.9988,0.0000,1.0000,0.0000,0.9988,0.0000,-0.0499),
    CFrame.new(2.0747, 1.3819, 4.0828, -0.9962,0.0845,0.0229,-0.0202,0.0330,-0.9993,-0.0852,-0.9959,-0.0312),
    CFrame.new(-3.8104, 1.2546, -0.3137, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(-4.2111, -1.1950, 1.8507, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(-3.5961, -1.1950, -2.6423, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(0.1896, -2.8267, 2.3192, -0.0560,0.0000,-0.9984,0.0000,1.0000,0.0000,0.9984,0.0000,-0.0560),
    CFrame.new(3.8380, -1.3347, 0.4590, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-2.5797, -2.8267, 1.9955, -0.9999,0.0009,0.0103,-0.0000,0.9963,-0.0856,-0.0104,-0.0855,-0.9963),
    CFrame.new(3.7049, -1.3347, 2.6348, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-2.5996, -1.1399, 3.4108, -0.9964,0.0849,-0.0007,0.0000,-0.0084,-1.0000,-0.0849,-0.9964,0.0084),
    CFrame.new(0.3689, 1.3297, -3.7849, 0.9967,-0.0805,-0.0136,-0.0183,-0.0583,-0.9981,0.0795,0.9951,-0.0596),
    CFrame.new(0.0030, -1.2671, -3.7910, 0.9968,-0.0794,-0.0005,-0.0000,0.0054,-1.0000,0.0794,0.9968,0.0054),
    CFrame.new(-1.9844, -2.8267, -2.3496, 1.0000,0.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,1.0000),
    CFrame.new(-2.4708, -2.8267, -0.0479, 0.9954,0.0000,-0.0954,0.0000,1.0000,0.0000,0.0954,0.0000,0.9954),
    CFrame.new(-0.0732, -1.2134, 3.7189, -0.9964,0.0849,-0.0007,0.0000,-0.0084,-1.0000,-0.0849,-0.9964,0.0084),
    CFrame.new(-1.7357, -1.1838, -3.9233, 0.9968,-0.0794,-0.0005,-0.0000,0.0054,-1.0000,0.0794,0.9968,0.0054),
    CFrame.new(-2.1417, 2.6688, -0.4572, 0.1026,0.0057,-0.9947,-0.0020,-1.0000,-0.0059,-0.9947,0.0026,-0.1026),
}
local GOLD = Color3.fromRGB(140, 70, 190)
-- NORMAL_ANCHOR = 7: จุดนี้เป็นตำแหน่งอ้างอิงที่ให้เป้าหมายถูกนั่งตรงกลางชุด
local NORMAL_OFF = {
    CFrame.new(-1.6837,1.0132,0.0986,-0.0008,0.9999,-0.0008,-0.0001,0.0009,1.0000,0.9999,0.0008,0.0001),
    CFrame.new(-0.0956,0.9834,-1.4432,1.0000,-0.0016,-0.0010,-0.0011,0.0098,-1.0000,0.0016,0.9999,0.0099),
    CFrame.new(1.4996,1.0533,0.0366,-0.0008,-0.9999,-0.0008,-0.0001,0.0009,-1.0000,0.9999,-0.0008,-0.0001),
    CFrame.new(1.4965,-1.5467,0.1362,-0.0008,-0.9999,-0.0008,-0.0001,0.0009,-1.0000,0.9999,-0.0008,-0.0001),
    CFrame.new(-0.1501,-1.7069,1.6262,1.0000,0.0015,-0.0032,0.0031,0.0800,0.9968,0.0018,-0.9968,0.0799),
    CFrame.new(0.0044,-1.4866,-1.4404,1.0000,-0.0016,-0.0010,-0.0011,0.0098,-1.0000,0.0016,0.9999,0.0099),
    CFrame.new(0.0000,-2.8267,0.0000,0.9999,0.0000,-0.0000,0.0000,1.0000,0.0000,-0.0000,0.0000,0.9999),
    CFrame.new(-1.6831,-1.6268,0.0783,-0.0009,0.9999,0.0092,-0.0004,-0.0092,1.0000,1.0000,0.0008,0.0004),
    CFrame.new(-0.0414,0.9631,1.6698,1.0000,0.0016,-0.0015,0.0014,0.0200,0.9998,0.0017,-0.9998,0.0201),
    CFrame.new(-0.1027,2.4633,0.0874,-0.0008,-0.0116,0.9999,-0.0004,-0.9999,-0.0116,0.9999,-0.0005,0.0008),
    CFrame.new(-1.6837,1.0132,0.0986,-0.0008,0.9999,-0.0008,-0.0001,0.0009,1.0000,0.9999,0.0008,0.0001),
}
local SMALL_OFF = {

    CFrame.new(-0.0027, -2.8267, -0.0280, -0.9721,-0.0025,0.2347,-0.0002,0.9999,0.0100,-0.2347,0.0097,-0.9720),

    CFrame.new(1.3656, -1.4067, 0.3521, 0.2533,-0.9672,0.0195,-0.0008,0.0199,0.9998,-0.9674,-0.2532,0.0043),

    CFrame.new(-1.3614, -1.3267, -0.4056, 0.2533,0.9673,0.0099,0.0008,0.0100,-0.9999,-0.9674,0.2533,0.0018),

    CFrame.new(-0.2598, -1.2467, 0.9901, 0.9610,0.2749,-0.0288,0.0300,-0.0002,0.9995,0.2748,-0.9615,-0.0084),

    CFrame.new(0.0314, 0.1133, -0.0397, -0.9721,-0.0030,-0.2347,0.0003,-0.9999,0.0116,-0.2347,0.0112,0.9720),

    CFrame.new(-0.0027, -2.8267, -0.0280, -0.9721,-0.0025,0.2347,-0.0002,0.9999,0.0100,-0.2347,0.0097,-0.9720),

    CFrame.new(0.2829, -1.2767, -0.9973, 0.9609,-0.2748,0.0343,0.0295,-0.0214,-0.9993,0.2754,0.9613,-0.0125),
}

local ROUND_OFF = {
    CFrame.new(-2.4544,6.3555,-0.2180,-0.2072,-0.9201,0.3325,-0.0170,-0.3364,-0.9416,0.9782,-0.2007,0.0541),
    CFrame.new(-2.7637,4.4464,-3.1417,0.4938,-0.8689,0.0347,0.0000,-0.0398,-0.9992,0.8696,0.4934,-0.0196),
    CFrame.new(-3.5152,1.8738,-2.6488,0.4939,-0.7067,-0.5066,0.0001,0.5826,-0.8127,0.8695,0.4013,0.2878),
    CFrame.new(-7.3251,7.0775,-3.5207,0.8553,0.4314,-0.2869,-0.0001,-0.5538,-0.8327,-0.5181,0.7122,-0.4736),
    CFrame.new(-7.8060,4.5215,-4.1877,0.8553,0.5126,-0.0759,-0.0001,-0.1464,-0.9892,-0.5182,0.8461,-0.1251),
    CFrame.new(-7.4347,2.0104,-3.5612,0.8553,0.4300,0.2890,0.0000,0.5578,-0.8300,-0.5181,0.7099,0.4771),
    CFrame.new(-3.9879,4.5569,2.0049,-0.8631,-0.5049,0.0102,0.0000,-0.0202,-0.9998,0.5050,-0.8629,0.0174),
    CFrame.new(-4.2513,7.0180,1.5292,-0.8631,-0.4505,0.2282,-0.0000,-0.4518,-0.8921,0.5050,-0.7700,0.3899),
    CFrame.new(-8.0912,7.1461,0.4428,-0.4913,0.7083,-0.5069,0.0000,-0.5820,-0.8132,-0.8710,-0.3996,0.2859),
    CFrame.new(-8.4967,2.1626,0.5956,-0.4914,0.7814,0.3846,0.0000,0.4416,-0.8972,-0.8709,-0.4409,-0.2170),
    CFrame.new(-8.8965,4.8233,0.8666,-0.4913,0.8565,-0.1582,0.0001,-0.1815,-0.9834,-0.8710,-0.4832,0.0891),
    CFrame.new(-4.4298,2.0656,1.3857,-0.8631,-0.4428,-0.2429,-0.0000,0.4810,-0.8767,0.5050,-0.7567,-0.4151),
    CFrame.new(-5.0923,6.3078,-4.5517,-0.9798,-0.1929,-0.0530,0.0111,-0.3169,0.9484,-0.1997,0.9286,0.3127),
    CFrame.new(-3.4506,7.0242,-2.7760,0.4939,-0.7440,0.4500,0.0001,-0.5175,-0.8557,0.8695,0.4226,-0.2555),
    CFrame.new(-5.0675,3.6627,-4.7905,-0.9798,-0.1939,0.0491,0.0111,0.1921,0.9813,-0.1997,0.9620,-0.1860),
    CFrame.new(-3.5137,1.5565,-0.5883,-0.2071,-0.6638,-0.7186,-0.0171,0.7369,-0.6758,0.9782,-0.1277,-0.1639),
    CFrame.new(-6.5327,1.5436,1.3427,-0.9722,0.1604,0.1703,0.0000,0.7280,-0.6856,-0.2340,-0.6666,-0.7078),
    CFrame.new(-7.6112,8.2854,-1.4631,-0.1863,0.5644,0.8042,-0.0295,-0.8214,0.5696,0.9820,0.0824,0.1697),
    CFrame.new(-8.2687,1.4433,-1.5523,-0.1864,0.6559,-0.7315,-0.0296,0.7404,0.6715,0.9820,0.1468,-0.1186),
    CFrame.new(-6.7514,3.9111,2.6444,-0.9815,0.1891,0.0311,-0.0001,0.1619,-0.9868,-0.1916,-0.9685,-0.1589),
    CFrame.new(-6.3200,8.2272,0.9145,-0.9722,0.1356,-0.1906,0.0001,-0.8146,-0.5800,-0.2340,-0.5639,0.7920),
    CFrame.new(-9.4133,3.7959,-1.8236,-0.1863,0.9718,-0.1443,-0.0296,0.1412,0.9895,0.9820,0.1887,0.0025),
    CFrame.new(-9.1776,6.2733,-1.7618,-0.1865,0.9135,0.3617,-0.0296,-0.3732,0.9273,0.9820,0.1622,0.0966),
    CFrame.new(-6.7109,6.4854,2.4026,-0.9722,0.2172,-0.0871,0.0001,-0.3718,-0.9283,-0.2340,-0.9026,0.3614),
    CFrame.new(-5.9920,0.6243,-1.0825,0.2315,0.0000,0.9728,0.0000,1.0000,0.0000,-0.9728,0.0000,0.2315),
    CFrame.new(-5.4416,8.2903,-2.9325,-0.9798,-0.1031,-0.1714,0.0111,-0.8835,0.4683,-0.1997,0.4570,0.8668),
    CFrame.new(-4.1680,8.3703,-0.5269,-0.2069,-0.4987,0.8417,-0.0172,-0.8583,-0.5128,0.9782,-0.1206,0.1690),
    CFrame.new(-2.2959,3.9386,-0.3035,-0.2071,-0.9577,-0.2000,-0.0172,0.2080,-0.9780,0.9782,-0.1991,-0.0595),
    CFrame.new(-5.4165,1.5467,-3.5522,-0.9798,-0.1159,0.1631,0.0111,0.7825,0.6226,-0.1997,0.6118,-0.7653),
    CFrame.new(-5.9503,8.1656,-1.2524,0.8316,-0.0134,-0.5552,0.0000,-0.9997,0.0242,-0.5554,-0.0201,-0.8313),
    CFrame.new(-2.7200,4.7678,-2.6270,0.4958,-0.8683,-0.0155,0.0000,0.0179,-0.9998,0.8684,0.4957,0.0089),
    CFrame.new(-4.4125,4.6499,1.9978,-0.9065,-0.4201,-0.0411,-0.0000,0.0974,-0.9952,0.4221,-0.9022,-0.0883),
}

local MEDIUM_OFF = {
    CFrame.new(-1.4264,-2.6403,1.1745,-0.9999,0.0000,0.0155,0.0000,1.0000,0.0000,-0.0155,0.0000,-0.9999),
    CFrame.new(1.1688,1.0829,-2.7969,-0.9999,-0.0171,0.0018,0.0015,0.0201,0.9998,-0.0172,0.9997,-0.0201),
    CFrame.new(-1.3354,1.0032,2.8938,-0.9999,0.0171,0.0012,-0.0010,0.0098,-1.0000,-0.0171,-0.9998,-0.0098),
    CFrame.new(1.3045,-1.5205,-2.6174,-0.9998,-0.0169,0.0045,0.0031,0.0800,0.9968,-0.0172,0.9967,-0.0799),
    CFrame.new(1.2318,-2.6403,-1.1686,-0.9999,0.0000,0.0155,0.0000,1.0000,0.0000,-0.0155,0.0000,-0.9999),
    CFrame.new(-1.3909,-1.3002,2.8141,-0.9999,0.0171,0.0012,-0.0010,0.0098,-1.0000,-0.0171,-0.9998,-0.0098),
    CFrame.new(2.9532,-1.4404,1.3969,0.0163,-0.9998,-0.0092,-0.0004,-0.0092,1.0000,-0.9999,-0.0163,-0.0005),
    CFrame.new(-2.9045,1.0925,1.0717,0.0164,0.9999,0.0008,-0.0001,0.0008,-1.0000,-0.9999,0.0164,0.0001),
    CFrame.new(-2.8928,-1.3603,-1.3724,0.0164,0.9999,0.0008,-0.0001,0.0008,-1.0000,-0.9999,0.0164,0.0001),
    CFrame.new(2.9832,0.9663,-1.1014,0.0164,-0.9999,0.0008,-0.0001,0.0008,1.0000,-0.9999,-0.0164,-0.0001),
    CFrame.new(-1.4443,-1.5205,-2.7475,-0.9998,-0.0169,0.0045,0.0031,0.0800,0.9968,-0.0172,0.9967,-0.0799),
    CFrame.new(-2.9026,1.0925,-1.3746,0.0164,0.9999,0.0008,-0.0001,0.0008,-1.0000,-0.9999,0.0164,0.0001),
    CFrame.new(-1.4610,-2.6403,-1.1478,-0.9999,0.0000,0.0155,0.0000,1.0000,0.0000,-0.0155,0.0000,-0.9999),
    CFrame.new(1.3432,1.0198,2.8616,-0.9999,0.0171,0.0012,-0.0010,0.0098,-1.0000,-0.0171,-0.9998,-0.0098),
    CFrame.new(1.1556,-1.3002,2.8278,-0.9999,0.0171,0.0012,-0.0010,0.0098,-1.0000,-0.0171,-0.9998,-0.0098),
    CFrame.new(2.9783,-1.4404,-0.9945,0.0164,-0.9998,-0.0091,-0.0004,-0.0092,1.0000,-0.9999,-0.0164,-0.0006),
    CFrame.new(1.1617,-2.6403,1.2263,-0.9999,0.0000,0.0155,0.0000,1.0000,0.0000,-0.0155,0.0000,-0.9999),
    CFrame.new(0.3644,2.2497,0.9886,0.0164,0.0117,-0.9998,-0.0005,-0.9999,-0.0117,-0.9999,0.0006,-0.0164),
    CFrame.new(0.5235,2.2497,-1.3335,0.0164,0.0117,-0.9998,-0.0005,-0.9999,-0.0117,-0.9999,0.0006,-0.0164),
    CFrame.new(2.9981,0.9663,1.3619,0.0164,-0.9999,0.0008,-0.0001,0.0008,1.0000,-0.9999,-0.0164,-0.0001),
    CFrame.new(-2.8756,-1.3603,1.0720,0.0164,0.9999,0.0008,-0.0001,0.0008,-1.0000,-0.9999,0.0164,0.0001),
    CFrame.new(-1.3352,2.2497,1.1588,0.0164,0.0117,-0.9998,-0.0005,-0.9999,-0.0117,-0.9999,0.0006,-0.0164),
    CFrame.new(-1.3482,2.2497,-1.2738,0.0164,0.0117,-0.9998,-0.0005,-0.9999,-0.0117,-0.9999,0.0006,-0.0164),
    CFrame.new(1.2833,2.2497,1.2398,0.0164,0.0117,-0.9998,-0.0005,-0.9999,-0.0117,-0.9999,0.0006,-0.0164),
    CFrame.new(1.2401,2.2497,-1.2240,0.0164,0.0117,-0.9998,-0.0005,-0.9999,-0.0117,-0.9999,0.0006,-0.0164),
    CFrame.new(-1.3732,1.0829,-2.9350,-0.9999,-0.0171,0.0018,0.0015,0.0201,0.9998,-0.0172,0.9997,-0.0201),
}

-- MEDIUM_OFF มีจุดศูนย์กลางของชุด Offset อยู่ที่ประมาณนี้
-- ใช้เป็น Anchor เฉพาะห้องขังกลาง เพื่อให้จุดศูนย์กลางของชุดตรงกับ targetCF
local MEDIUM_ANCHOR = CFrame.new(-89.1560, 2.7244, -63.6300)

local cageMode = "normal"

-- ROUND_OFF มีจุดศูนย์กลางของชุด Offset อยู่ที่ประมาณนี้
-- ใช้เป็น Anchor เฉพาะห้องขังกลม เพื่อให้จุดศูนย์กลางของชุดตรงกับ targetCF
-- โหมด normal / big / small ไม่ถูกเปลี่ยน
local ROUND_ANCHOR = CFrame.new(-5.742475, 4.778984375, -1.0229875)

-- ทั้ง 4 โหมดใช้ targetCF เป็นฐานเดียวกัน
-- ค่า COMMON_FLOOR_Y เก็บไว้สำหรับฐานระบบร่วม; ROUND_OFF ใช้ค่าที่ส่งมาโดยตรง
local COMMON_FLOOR_Y = -2.8267

local StatusLabel
local colored = {}
local function getMyProps()
    local wc = workspace:FindFirstChild("WorkspaceCom")
    local folder = wc and wc:FindFirstChild("001_TrafficCones")
    local t = {}
    if not folder then return t end
    for _, v in ipairs(folder:GetChildren()) do
        if v.Name:find("Prop") and v.Name:find(LP.Name) then
            table.insert(t, v)
        end
    end
    table.sort(t, function(a, b) return a.Name < b.Name end)
    return t
end
local function buildAt(targetCF)
    local props = getMyProps()
    if #props == 0 then
        StatusLabel.Text = "ไม่เจอ prop ของคุณ!"
        return
    end
    local offs
    if cageMode == "normal" then
        offs = NORMAL_OFF
    elseif cageMode == "medium" then
        offs = MEDIUM_OFF
    elseif cageMode == "big" then
        offs = BIG_OFF
    elseif cageMode == "round" then
        offs = ROUND_OFF
    else
        offs = SMALL_OFF
    end
    -- ใช้ Anchor เพิ่มเฉพาะห้องขังกลม
    -- เพื่อเลื่อนชุด ROUND_OFF ให้จุดศูนย์กลางตรงกับ targetCF
    -- อีก 3 โหมดใช้ targetCF เดิมทุกประการ
    local base = targetCF
    if cageMode == "round" then
        base = targetCF * ROUND_ANCHOR:Inverse()
    elseif cageMode == "medium" then
        base = targetCF * MEDIUM_ANCHOR:Inverse()
    end

    -- ประมวลผล Prop ทุกตัว และวน Offset กลับไปใช้ซ้ำ
    for i = 1, #props do
        local prop = props[i]
        local offsetIndex = ((i - 1) % #offs) + 1
        local cf = base * offs[offsetIndex]
        task.spawn(function()
            pcall(function()
                local r = prop:FindFirstChild("SetCurrentCFrame")
                if r then r:InvokeServer(cf) end
                if not colored[prop] then
                    colored[prop] = true
                    local rc = prop:FindFirstChild("ChangePropColor")
                    if rc then rc:InvokeServer(GOLD) end
                end
            end)
        end)
    end
end

local function findPlayerByName(str)
    str = string.lower(string.gsub(str or "", "%s+", ""))
    if str == "" then return nil end
    for _, p in ipairs(Players:GetPlayers()) do
        if string.lower(p.Name) == str
        or string.lower(p.DisplayName) == str then
            return p
        end
    end
    for _, p in ipairs(Players:GetPlayers()) do
        if string.lower(p.Name):find(str, 1, true)
        or string.lower(p.DisplayName):find(str, 1, true) then
            return p
        end
    end
    return nil
end
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "JailSpawnerGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local ok = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ok then ScreenGui.Parent = LP:WaitForChild("PlayerGui") end
local FULL_H, MIN_H = 286, 28
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 200, 0, FULL_H)
Main.Position = UDim2.new(0.5, -100, 0.35, 0)
Main.BackgroundColor3 = Color3.fromRGB(8, 15, 45)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(60, 110, 255)
Stroke.Thickness = 1.5
local Header = Instance.new("TextLabel", Main)
Header.Size = UDim2.new(1, -34, 0, 28)
Header.BackgroundTransparency = 1
Header.Text = "  ห้องขังมรณะ"
Header.TextColor3 = Color3.fromRGB(200, 220, 255)
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 14
Header.TextXAlignment = Enum.TextXAlignment.Left
local FoldBtn = Instance.new("TextButton", Main)
FoldBtn.Size = UDim2.new(0, 22, 0, 22)
FoldBtn.Position = UDim2.new(1, -27, 0, 3)
FoldBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 70)
FoldBtn.BorderSizePixel = 0
FoldBtn.Text = "▲"
FoldBtn.TextColor3 = Color3.fromRGB(200, 220, 255)
FoldBtn.Font = Enum.Font.SourceSansBold
FoldBtn.TextSize = 12
Instance.new("UICorner", FoldBtn).CornerRadius = UDim.new(0, 6)
local Body = Instance.new("Frame", Main)
Body.Size = UDim2.new(1, 0, 1, -28)
Body.Position = UDim2.new(0, 0, 0, 28)
Body.BackgroundTransparency = 1
local NameBox = Instance.new("TextBox", Body)
NameBox.Size = UDim2.new(0.9, 0, 0, 24)
NameBox.Position = UDim2.new(0.05, 0, 0, 4)
NameBox.BackgroundColor3 = Color3.fromRGB(12, 20, 55)
NameBox.BorderSizePixel = 0
NameBox.PlaceholderText = "ชื่อเป้าหมาย."
NameBox.Text = ""
NameBox.TextColor3 = Color3.fromRGB(230, 240, 255)
NameBox.PlaceholderColor3 = Color3.fromRGB(110, 130, 190)
NameBox.Font = Enum.Font.SourceSans
NameBox.TextSize = 12
NameBox.ClearTextOnFocus = false
Instance.new("UICorner", NameBox).CornerRadius = UDim.new(0, 8)
local function makeBtn(text, y)
    local b = Instance.new("TextButton", Body)
    b.Size = UDim2.new(0.9, 0, 0, 26)
    b.Position = UDim2.new(0.05, 0, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(15, 25, 70)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Color3.fromRGB(230, 240, 255)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 12
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local st = Instance.new("UIStroke", b)
    st.Color = Color3.fromRGB(60, 110, 255)
    st.Thickness = 1
    b.MouseEnter:Connect(function() st.Thickness = 2 end)
    b.MouseLeave:Connect(function() st.Thickness = 1 end)
    return b
end
local NameBtn     = makeBtn("สร้างห้องขัง", 34)
local ModeBtn  = makeBtn("ห้องขังปกติ", 66)
local ControlBtn   = makeBtn("ACTIVATE CONTROL", 98)
local PenaltyBtn   = makeBtn("PENALTY: OFF", 130)
local CollisionBtn = makeBtn("ANTI-SIT + NOCOL: OFF", 162)
ModeBtn.MouseButton1Click:Connect(function()
    if cageMode == "normal" then
        cageMode = "medium"
        ModeBtn.Text = "ห้องขังกลาง"
    elseif cageMode == "medium" then
        cageMode = "big"
        ModeBtn.Text = "ห้องขังใหญ่"
    elseif cageMode == "big" then
        cageMode = "round"
        ModeBtn.Text = "ห้องขังกลม"
    elseif cageMode == "round" then
        cageMode = "small"
        ModeBtn.Text = "ห้องขังเล็ก"
    else
        cageMode = "normal"
        ModeBtn.Text = "ห้องขังปกติ"
    end
end)

local targetPlayer = nil
local activeTargeting = false
local deathPenalty = false
local networkSafe = true
local lastRemoteTick = {}
local colorIndex, colorTimer = 1, 0
local wingRemoteCache = {}

local function refreshWingRemotes()
    wingRemoteCache = getMyProps()
end

local function safeInvoke(remote, ...)
    local args = {...}
    if not networkSafe then return end
    if lastRemoteTick[remote] and (tick() - lastRemoteTick[remote]) < 0.025 then
        return
    end
    lastRemoteTick[remote] = tick()
    task.spawn(function()
        local success = pcall(function() remote:InvokeServer(unpack(args)) end)
        if not success then networkSafe = false task.wait(1) networkSafe = true end
    end)
end

local function processProp(propObj, targetCF, index)
    if not propObj then return end

    local setCF = propObj:FindFirstChild("SetCurrentCFrame")
    if not setCF then return end

    -- ACTIVATE CONTROL / PENALTY:
    -- ตรวจ Prop แต่ละตัวแยกกัน ถ้ามีคนนั่งให้ส่งเฉพาะ Prop ตัวนั้นขึ้น Y=1000000
    local isOccupied = false
    pcall(function()
        local seat = propObj:FindFirstChildWhichIsA("Seat", true)
            or propObj:FindFirstChildWhichIsA("VehicleSeat", true)
        if seat and seat.Occupant then
            isOccupied = true
        end
    end)

    if isOccupied then
        safeInvoke(setCF, CFrame.new(0, 1000000, 0))
        return
    end

    -- Prop ที่ไม่มีคนนั่งยังใช้ตำแหน่งควบคุมปกติ
    safeInvoke(setCF, targetCF)

    if #wingRemoteCache > 0 and tick() - colorTimer > 0.08 and index == colorIndex then
        local colRemote = propObj:FindFirstChild("ChangePropColor")
        if colRemote then safeInvoke(colRemote, GOLD) end
        colorIndex = (colorIndex % #wingRemoteCache) + 1
        colorTimer = tick()
    end
end

local lastSendTick = 0
RunService.Heartbeat:Connect(function()
    local currentTime = tick()
    if currentTime - lastSendTick < 1/60 then return end
    lastSendTick = currentTime

    if not activeTargeting then return end
    if not targetPlayer or not targetPlayer.Character then return end
    local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if #wingRemoteCache == 0 then refreshWingRemotes() end
    if #wingRemoteCache > 0 then
        -- ACTIVATE CONTROL และ PENALTY ใช้ processProp() กลางตัวเดียวกัน
        -- จึงหยุดเฉพาะ Prop ที่มี Seat.Occupant โดยไม่กระทบ JAIL PLAYER
        local baseTarget = root.CFrame
        for i = 1, #wingRemoteCache do
            local propObj = wingRemoteCache[i]
            if propObj then
                local targetCF
                if deathPenalty then
                    targetCF = baseTarget
                        * CFrame.new(math.random(-12, 12), math.random(-8, 8), math.random(-12, 12))
                        * CFrame.Angles(math.rad(math.random(-360, 360)),
                                        math.rad(math.random(-360, 360)),
                                        math.rad(math.random(-360, 360)))
                else
                    local randomRotation = CFrame.Angles(
                        math.rad(math.random(-360, 360)),
                        math.rad(math.random(-360, 360)),
                        math.rad(math.random(-360, 360)))
                    targetCF = baseTarget * randomRotation
                end
                processProp(propObj, targetCF, i)
            end
        end
    end
end)

ControlBtn.MouseButton1Click:Connect(function()
    if not activeTargeting then
        local t = findPlayerByName(NameBox.Text)
        if not t then
            StatusLabel.Text = "ใส่ชื่อเป้าหมายก่อน activate!"
            return
        end
        targetPlayer = t
        refreshWingRemotes()
    end
    activeTargeting = not activeTargeting
    ControlBtn.Text = activeTargeting and "STOP CONTROL" or "ACTIVATE CONTROL"
    ControlBtn.BackgroundColor3 = activeTargeting and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(15, 25, 70)
end)

PenaltyBtn.MouseButton1Click:Connect(function()
    deathPenalty = not deathPenalty
    PenaltyBtn.Text = deathPenalty and "PENALTY: ON" or "PENALTY: OFF"
    PenaltyBtn.TextColor3 = deathPenalty and Color3.fromRGB(0, 200, 255) or Color3.fromRGB(230, 240, 255)
end)

local collisionMode = false
local antiSitConn = nil
local antiSitChar = nil
local collisionRunning = false
local originalCollision = {}

local function setupAntiSit()
    local c = LP.Character
    if not c then return end
    local h = c:FindFirstChildOfClass("Humanoid")
    if not h then return end
    h:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    if antiSitConn then antiSitConn:Disconnect() end
    antiSitConn = h:GetPropertyChangedSignal("Sit"):Connect(function()
        if h.Health <= 0 or not c.Parent then
            if antiSitConn then antiSitConn:Disconnect() antiSitConn = nil end
            return
        end
        if h.Sit then
            h.Sit = false
            h:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            for _, v in ipairs(c:GetDescendants()) do
                if v:IsA("Weld") and v.Name == "SeatWeld" then
                    v:Destroy()
                end
            end
        end
    end)
    antiSitChar = c
end

local function teardownAntiSit()
    if antiSitConn then antiSitConn:Disconnect() antiSitConn = nil end
    if antiSitChar then
        local h = antiSitChar:FindFirstChildOfClass("Humanoid")
        if h then pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end) end
        antiSitChar = nil
    end
end

local function registerPropCollision(inst)
    if inst:IsA("BasePart") then
        if originalCollision[inst] == nil then
            originalCollision[inst] = inst.CanCollide
        end
        if inst.CanCollide then inst.CanCollide = false end
        if inst.CanTouch then inst.CanTouch = false end
    end
    for _, d in ipairs(inst:GetDescendants()) do
        if d:IsA("BasePart") then
            if originalCollision[d] == nil then
                originalCollision[d] = d.CanCollide
            end
            if d.CanCollide then d.CanCollide = false end
            if d.CanTouch then d.CanTouch = false end
        end
    end
end

local function startCollisionLoop()
    if collisionRunning then return end
    collisionRunning = true
    task.spawn(function()
        while collisionMode do
            local w = workspace:FindFirstChild("WorkspaceCom")
            local cones = w and w:FindFirstChild("001_TrafficCones")
            if cones then
                for _, v in ipairs(cones:GetChildren()) do
                    if v.Name:find("Prop") then
                        registerPropCollision(v)
                    end
                end
            end
            task.wait(0.15)
        end
        collisionRunning = false
    end)
end

local function stopCollisionLoop()
    for part, orig in pairs(originalCollision) do
        if part and part.Parent then
            pcall(function()
                part.CanCollide = orig
                part.CanTouch = true
            end)
        end
    end
    originalCollision = {}
end

CollisionBtn.MouseButton1Click:Connect(function()
    collisionMode = not collisionMode
    CollisionBtn.Text = collisionMode and "ANTI-SIT + NOCOL: ON" or "ANTI-SIT + NOCOL: OFF"
    if collisionMode then
        setupAntiSit()
        startCollisionLoop()
    else
        teardownAntiSit()
        stopCollisionLoop()
    end
end)

StatusLabel = Instance.new("TextLabel", Body)
StatusLabel.Size = UDim2.new(0.9, 0, 0, 44)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 194)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(150, 180, 255)
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.TextSize = 10
StatusLabel.TextWrapped = true
StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
local Credit = Instance.new("TextLabel", Body)
Credit.Size = UDim2.new(0.9, 0, 0, 16)
Credit.Position = UDim2.new(0.05, 0, 0, 236)
Credit.BackgroundTransparency = 1
Credit.Text = "RB : Resucomeback227"
Credit.TextColor3 = Color3.fromRGB(90, 110, 170)
Credit.Font = Enum.Font.SourceSansItalic
Credit.TextSize = 11
local folded = false
FoldBtn.MouseButton1Click:Connect(function()
    folded = not folded
    FoldBtn.Text = folded and "▼" or "▲"
    Body.Visible = not folded
    Main:TweenSize(
        UDim2.new(0, 200, 0, folded and MIN_H or FULL_H),
        Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true
    )
end)
NameBtn.MouseButton1Click:Connect(function()
    local target = findPlayerByName(NameBox.Text)
    if not target then
        StatusLabel.Text = "ไม่เจอผู้เล่น: '" .. NameBox.Text .. "'"
        return
    end
    if not (target.Character and target.Character:FindFirstChild("HumanoidRootPart")) then
        StatusLabel.Text = target.Name .. " ไม่มีตัวละครตอนนี้"
        return
    end
    buildAt(target.Character.HumanoidRootPart.CFrame)
end)
NameBox.FocusLost:Connect(function(enter)
    if enter then
        local target = findPlayerByName(NameBox.Text)
        if target then
            NameBox.Text = target.DisplayName
        end
    end
end)
NameBox.Focused:Connect(function()
    NameBox.Text = ""
end)
