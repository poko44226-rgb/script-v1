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
    CFrame.new(-1.6837,3.8399,0.0986,-0.0008,0.9999,-0.0008,-0.0001,0.0009,1.0000,0.9999,0.0008,0.0001),
    CFrame.new(-0.0956,3.8101,-1.4432,1.0000,-0.0016,-0.0010,-0.0011,0.0098,-1.0000,0.0016,0.9999,0.0099),
    CFrame.new(1.4996,3.8800,0.0366,-0.0008,-0.9999,-0.0008,-0.0001,0.0009,-1.0000,0.9999,-0.0008,-0.0001),
    CFrame.new(1.4965,1.2800,0.1362,-0.0008,-0.9999,-0.0008,-0.0001,0.0009,-1.0000,0.9999,-0.0008,-0.0001),
    CFrame.new(-0.1501,1.1198,1.6262,1.0000,0.0015,-0.0032,0.0031,0.0800,0.9968,0.0018,-0.9968,0.0799),
    CFrame.new(0.0044,1.3401,-1.4404,1.0000,-0.0016,-0.0010,-0.0011,0.0098,-1.0000,0.0016,0.9999,0.0099),
    CFrame.new(0.0000,0.0000,0.0000,0.9999,0.0000,-0.0000,0.0000,1.0000,0.0000,-0.0000,0.0000,0.9999),
    CFrame.new(-1.6831,1.1999,0.0783,-0.0009,0.9999,0.0092,-0.0004,-0.0092,1.0000,1.0000,0.0008,0.0004),
    CFrame.new(-0.0414,3.7898,1.6698,1.0000,0.0016,-0.0015,0.0014,0.0200,0.9998,0.0017,-0.9998,0.0201),
    CFrame.new(-0.1027,5.2900,0.0874,-0.0008,-0.0116,0.9999,-0.0004,-0.9999,-0.0116,0.9999,-0.0005,0.0008),
    CFrame.new(-1.6837,3.8399,0.0986,-0.0008,0.9999,-0.0008,-0.0001,0.0009,1.0000,0.9999,0.0008,0.0001),
}
local SMALL_OFF = {

    CFrame.new(-0.0027, -1.3114, -0.0280, -0.9721,-0.0025,0.2347,-0.0002,0.9999,0.0100,-0.2347,0.0097,-0.9720),

    CFrame.new(1.3656, 0.1086, 0.3521, 0.2533,-0.9672,0.0195,-0.0008,0.0199,0.9998,-0.9674,-0.2532,0.0043),

    CFrame.new(-1.3614, 0.1886, -0.4056, 0.2533,0.9673,0.0099,0.0008,0.0100,-0.9999,-0.9674,0.2533,0.0018),

    CFrame.new(-0.2598, 0.2686, 0.9901, 0.9610,0.2749,-0.0288,0.0300,-0.0002,0.9995,0.2748,-0.9615,-0.0084),

    CFrame.new(0.0314, 1.6286, -0.0397, -0.9721,-0.0030,-0.2347,0.0003,-0.9999,0.0116,-0.2347,0.0112,0.9720),

    CFrame.new(-0.0027, -1.3114, -0.0280, -0.9721,-0.0025,0.2347,-0.0002,0.9999,0.0100,-0.2347,0.0097,-0.9720),

    CFrame.new(0.2829, 0.2386, -0.9973, 0.9609,-0.2748,0.0343,0.0295,-0.0214,-0.9993,0.2754,0.9613,-0.0125),
}

local cageMode = "normal"

-- ปรับระดับห้องขังปกติลงเล็กน้อย โดยไม่กระทบโหมดเล็ก/ใหญ่
local NORMAL_HEIGHT_ADJUST = -1.25

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
    else
        offs = SMALL_OFF
    end
    local base = targetCF
    if cageMode == "normal" then
        -- ลดทั้งชุดลงตามแกน Y ของเป้าหมาย เพื่อให้ตำแหน่งเหมาะกับตัวละครที่เล็กลง
        base = targetCF * CFrame.new(0, NORMAL_HEIGHT_ADJUST, 0)
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
local FULL_H, MIN_H = 320, 26
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 180, 0, FULL_H)
Main.Position = UDim2.new(0.5, -90, 0.35, 0)
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
Header.Size = UDim2.new(1, -32, 0, 26)
Header.BackgroundTransparency = 1
Header.Text = "  ห้องขังมรณะ"
Header.TextColor3 = Color3.fromRGB(200, 220, 255)
Header.Font = Enum.Font.SourceSansBold
Header.TextSize = 13
Header.TextXAlignment = Enum.TextXAlignment.Left
local FoldBtn = Instance.new("TextButton", Main)
FoldBtn.Size = UDim2.new(0, 20, 0, 20)
FoldBtn.Position = UDim2.new(1, -24, 0, 3)
FoldBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 70)
FoldBtn.BorderSizePixel = 0
FoldBtn.Text = "▲"
FoldBtn.TextColor3 = Color3.fromRGB(200, 220, 255)
FoldBtn.Font = Enum.Font.SourceSansBold
FoldBtn.TextSize = 11
Instance.new("UICorner", FoldBtn).CornerRadius = UDim.new(0, 6)
local Body = Instance.new("Frame", Main)
Body.Size = UDim2.new(1, 0, 1, -26)
Body.Position = UDim2.new(0, 0, 0, 26)
Body.BackgroundTransparency = 1
local NameBox = Instance.new("TextBox", Body)
NameBox.Size = UDim2.new(0.9, 0, 0, 22)
NameBox.Position = UDim2.new(0.05, 0, 0, 2)
NameBox.BackgroundColor3 = Color3.fromRGB(12, 20, 55)
NameBox.BorderSizePixel = 0
NameBox.PlaceholderText = "ชื่อเป้าหมาย."
NameBox.Text = ""
NameBox.TextColor3 = Color3.fromRGB(230, 240, 255)
NameBox.PlaceholderColor3 = Color3.fromRGB(110, 130, 190)
NameBox.Font = Enum.Font.SourceSans
NameBox.TextSize = 11
NameBox.ClearTextOnFocus = false
Instance.new("UICorner", NameBox).CornerRadius = UDim.new(0, 8)
local function makeBtn(text, y)
    local b = Instance.new("TextButton", Body)
    b.Size = UDim2.new(0.9, 0, 0, 24)
    b.Position = UDim2.new(0.05, 0, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(15, 25, 70)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Color3.fromRGB(230, 240, 255)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 11
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    local st = Instance.new("UIStroke", b)
    st.Color = Color3.fromRGB(60, 110, 255)
    st.Thickness = 1
    b.MouseEnter:Connect(function() st.Thickness = 2 end)
    b.MouseLeave:Connect(function() st.Thickness = 1 end)
    return b
end
-- ลำดับฟังก์ชันหลัก
local ControlBtn   = makeBtn("ACTIVATE CONTROL", 28)
local JailBtn      = makeBtn("JAIL PLAYER", 57)
local NameBtn      = makeBtn("สร้างห้องขัง", 86)
local NearestBtn   = makeBtn("ขังคนใกล้สุด", 115)
local ModeBtn      = makeBtn("โหมด: ห้องขังปกติ", 144)
local CollisionBtn = makeBtn("ANTI-SIT + NOCOL: OFF", 173)
local PenaltyBtn   = makeBtn("PENALTY: OFF", 202)
ModeBtn.MouseButton1Click:Connect(function()
    if cageMode == "normal" then
        cageMode = "small"
        ModeBtn.Text = "โหมด: ห้องขังเล็ก"
    elseif cageMode == "small" then
        cageMode = "big"
        ModeBtn.Text = "โหมด: ห้องขังใหญ่"
    else
        cageMode = "normal"
        ModeBtn.Text = "โหมด: ห้องขังปกติ"
    end
end)

local targetPlayer = nil
local activeTargeting = false
local jailMode = false
local deathPenalty = false
local networkSafe = true
local lastRemoteTick = {}
local colorIndex, colorTimer = 1, 0
local wingRemoteCache = {}
local originalJailCF = {}

local function captureJailProps()
    originalJailCF = {}
    for _, prop in ipairs(getMyProps()) do
        if prop then
            local ok, cf = pcall(function() return prop:GetPivot() end)
            if ok and cf then
                originalJailCF[prop] = cf
            end
        end
    end
end

local function restoreJailProps()
    for prop, cf in pairs(originalJailCF) do
        if prop and prop.Parent and cf then
            local remote = prop:FindFirstChild("SetCurrentCFrame")
            if remote then
                pcall(function() remote:InvokeServer(cf) end)
            end
        end
    end
    originalJailCF = {}
end

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

        -- JAIL PLAYER: ใช้โหมดห้องขังที่เลือกอยู่ (ปกติ/เล็ก/ใหญ่)
        if jailMode then
            local offs
            if cageMode == "normal" then
                offs = NORMAL_OFF
                baseTarget = baseTarget * CFrame.new(0, NORMAL_HEIGHT_ADJUST, 0)
            elseif cageMode == "big" then
                offs = BIG_OFF
            else
                offs = SMALL_OFF
            end
            for i = 1, #wingRemoteCache do
                local propObj = wingRemoteCache[i]
                if propObj then
                    local offsetIndex = ((i - 1) % #offs) + 1
                    processProp(propObj, baseTarget * offs[offsetIndex], i)
                end
            end
        end

        -- ACTIVATE CONTROL: ทำงานแยกจาก JAIL PLAYER
        if activeTargeting then
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
    if activeTargeting and jailMode then
        jailMode = false
        JailBtn.Text = "JAIL PLAYER"
        JailBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 70)
    end
    ControlBtn.Text = activeTargeting and "STOP CONTROL" or "ACTIVATE CONTROL"
    ControlBtn.BackgroundColor3 = activeTargeting and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(15, 25, 70)
end)

JailBtn.MouseButton1Click:Connect(function()
    if not jailMode then
        local t = findPlayerByName(NameBox.Text)
        if not t then
            StatusLabel.Text = "ใส่ชื่อเป้าหมายก่อน JAIL PLAYER!"
            return
        end
        if not (t.Character and t.Character:FindFirstChild("HumanoidRootPart")) then
            StatusLabel.Text = t.Name .. " ไม่มีตัวละครตอนนี้"
            return
        end
        targetPlayer = t
        refreshWingRemotes()
    end
    jailMode = not jailMode
    if jailMode then
        captureJailProps()
    else
        restoreJailProps()
    end
    if jailMode and activeTargeting then
        activeTargeting = false
        ControlBtn.Text = "ACTIVATE CONTROL"
        ControlBtn.BackgroundColor3 = Color3.fromRGB(15, 25, 70)
    end
    JailBtn.Text = jailMode and "STOP JAIL" or "JAIL PLAYER"
    JailBtn.BackgroundColor3 = jailMode and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(15, 25, 70)
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
StatusLabel.Size = UDim2.new(0.9, 0, 0, 32)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 232)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(150, 180, 255)
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.TextSize = 10
StatusLabel.TextWrapped = true
StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
local Credit = Instance.new("TextLabel", Body)
Credit.Size = UDim2.new(0.9, 0, 0, 16)
Credit.Position = UDim2.new(0.05, 0, 0, 282)
Credit.BackgroundTransparency = 1
Credit.Text = "RB : Resucomeback227"
Credit.TextColor3 = Color3.fromRGB(90, 110, 170)
Credit.Font = Enum.Font.SourceSansItalic
Credit.TextSize = 10
local folded = false
FoldBtn.MouseButton1Click:Connect(function()
    folded = not folded
    FoldBtn.Text = folded and "▼" or "▲"
    Body.Visible = not folded
    Main:TweenSize(
        UDim2.new(0, 180, 0, folded and MIN_H or FULL_H),
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
NearestBtn.MouseButton1Click:Connect(function()
    local myRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    local best, bestDist = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
            if d < bestDist then best, bestDist = p, d end
        end
    end
    if best then
        buildAt(best.Character.HumanoidRootPart.CFrame)
    else
        StatusLabel.Text = "ไม่มีผู้เล่นอื่นในเซิร์ฟเวอร์"
    end
end)
