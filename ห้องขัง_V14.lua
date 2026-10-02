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
local GOLD = Color3.fromRGB(255, 215, 0)
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
    CFrame.new(-2.6985,2.9045,-2.2872,0.6197,0.7355,-0.2739,-0.0170,-0.3364,-0.9416,-0.7847,0.5881,-0.1959),
    CFrame.new(2.4225,0.4601,-2.9456,0.7946,-0.5992,-0.0983,-0.0000,0.1618,-0.9868,0.6072,0.7841,0.1285),
    CFrame.new(1.2682,4.7762,-1.5868,0.7675,-0.3718,0.5223,0.0001,-0.8146,-0.5800,0.6411,0.4452,-0.6252),
    CFrame.new(1.9200,-2.0077,1.4886,0.6028,-0.5227,0.6029,-0.0296,0.7404,0.6715,-0.7974,-0.4226,0.4309),
    CFrame.new(1.6488,-1.9074,-1.8761,0.7674,-0.4396,-0.4667,0.0000,0.7280,-0.6856,0.6411,0.5261,0.5587),
    CFrame.new(1.3703,4.8344,1.1169,0.6028,-0.4693,-0.6454,-0.0295,-0.8214,0.5697,-0.7974,-0.3243,-0.5089),
    CFrame.new(-1.9135,-1.8945,-1.4853,0.6196,0.5383,0.5712,-0.0171,0.7369,-0.6758,-0.7847,0.4090,0.4658),
    CFrame.new(2.8253,0.3449,2.2396,0.6028,-0.7872,0.1304,-0.0296,0.1412,0.9895,-0.7974,-0.6003,0.0618),
    CFrame.new(2.2789,3.0344,-2.7469,0.7675,-0.5951,0.2384,0.0001,-0.3717,-0.9283,0.6411,0.7125,-0.2852),
    CFrame.new(-2.8784,0.4876,-2.2809,0.6196,0.7699,0.1529,-0.0171,0.2080,-0.9780,-0.7847,0.6033,0.1420),
    CFrame.new(2.6415,2.8223,2.0796,0.6028,-0.7466,-0.2813,-0.0296,-0.3732,0.9273,-0.7973,-0.5507,-0.2471),
    CFrame.new(-1.2999,4.9193,-1.2500,0.6195,0.3934,-0.6793,-0.0172,-0.8583,-0.5128,-0.7848,0.3294,-0.5250),
    CFrame.new(0.0882,-2.8267,0.0573,-0.6392,0.0000,-0.7691,0.0000,1.0000,0.0000,0.7691,0.0000,-0.6392),
    CFrame.new(-1.2260,4.8393,1.4710,0.7894,0.2952,0.5382,0.0111,-0.8835,0.4683,0.6138,-0.3637,-0.7007),
    CFrame.new(-1.5235,-1.9043,2.0152,0.7894,0.3753,-0.4858,0.0111,0.7825,0.6226,0.6138,-0.4969,0.6135),
    CFrame.new(-2.3857,0.2117,2.9700,0.7894,0.6007,-0.1265,0.0111,0.1921,0.9813,0.6138,-0.7761,0.1450),
    CFrame.new(-2.2575,2.8568,2.7671,0.7894,0.5849,0.1863,0.0111,-0.3170,0.9484,0.6137,-0.7466,-0.2567),
    CFrame.new(0.3359,1.0705,3.6450,-0.9964,-0.0839,0.0125,-0.0001,-0.1464,-0.9892,0.0848,-0.9857,0.1458),
    CFrame.new(0.2812,-1.4406,2.9188,-0.9964,-0.0704,-0.0473,-0.0000,0.5578,-0.8300,0.0848,-0.8270,-0.5558),
    CFrame.new(0.2009,3.6265,2.8339,-0.9964,-0.0778,0.0336,0.0000,-0.3969,-0.9178,0.0847,-0.9145,0.3955),
    CFrame.new(-3.7187,0.9954,0.4702,-0.0567,0.9976,-0.0398,0.0001,-0.0399,-0.9992,-0.9984,-0.0567,0.0022),
    CFrame.new(-2.8265,-1.5772,0.3619,-0.0567,0.8114,0.5817,0.0001,0.5826,-0.8127,-0.9984,-0.0461,-0.0331),
    CFrame.new(-2.9408,3.5732,0.4473,-0.0567,0.8543,-0.5166,0.0001,-0.5175,-0.8557,-0.9984,-0.0486,0.0293),
    CFrame.new(-0.3378,1.1059,-3.5988,0.9976,0.0696,-0.0014,0.0000,-0.0202,-0.9998,-0.0696,0.9974,-0.0201),
    CFrame.new(2.6462,3.6951,-0.3781,0.0539,-0.8120,0.5812,0.0000,-0.5820,-0.8132,0.9985,0.0438,-0.0313),
    CFrame.new(-0.2166,-1.3854,-2.8478,0.9976,0.0610,0.0335,-0.0000,0.4809,-0.8767,-0.0696,0.8746,0.4798),
    CFrame.new(-0.3129,3.5670,-3.0556,0.9976,0.0620,-0.0314,-0.0000,-0.4518,-0.8921,-0.0696,0.8900,-0.4507),
    CFrame.new(3.5559,1.3723,-0.4006,0.0538,-0.9820,0.1813,0.0001,-0.1816,-0.9834,0.9986,0.0529,-0.0097),
    CFrame.new(3.0774,-1.2884,-0.3351,0.0539,-0.8959,-0.4409,0.0000,0.4415,-0.8972,0.9985,0.0483,0.0238),
    CFrame.new(-0.0246,4.7146,0.1911,-0.9917,0.0031,0.1287,0.0000,-0.9997,0.0242,0.1287,0.0240,0.9914),
}

local cageMode = "normal"

-- ทั้ง 4 โหมดใช้ targetCF เป็นฐานเดียวกัน
-- ระดับต่ำสุดของ Offset ทุกชุดถูกปรับให้ตรงกันที่ COMMON_FLOOR_Y
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
    elseif cageMode == "big" then
        offs = BIG_OFF
    elseif cageMode == "round" then
        offs = ROUND_OFF
    else
        offs = SMALL_OFF
    end
    -- ทั้ง 4 โหมดใช้ฐานเดียวกัน
    -- ไม่มีการปรับ Y เพิ่มใน buildAt
    local base = targetCF
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
        cageMode = "small"
        ModeBtn.Text = "ห้องขังเล็ก"
    elseif cageMode == "small" then
        cageMode = "big"
        ModeBtn.Text = "ห้องขังใหญ่"
    elseif cageMode == "big" then
        cageMode = "round"
        ModeBtn.Text = "ห้องขังกลม"
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
    local isOccupied = false
    pcall(function()
        local seat = propObj:FindFirstChildOfClass("Seat") or propObj:FindFirstChildOfClass("VehicleSeat")
        if seat and seat.Occupant then isOccupied = true end
    end)
    if isOccupied then
        local current = propObj:GetPivot()
        local pos = current.Position
        targetCF = CFrame.new(pos.X, 50000, pos.Z) * current.Rotation
    end
    local setCF = propObj:FindFirstChild("SetCurrentCFrame")
    if setCF then safeInvoke(setCF, targetCF) end
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
