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

-- A prop that has been detected with a player sitting on it is "paused"
-- until that same player is no longer sitting anywhere inside the prop.
-- This prevents the follow loop from reusing the prop after it has been
-- moved/warped far away while the player is still attached to it.
local pausedProps = {}

local function getOccupiedPlayer(prop)
    for _, obj in ipairs(prop:GetDescendants()) do
        if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
            local occupant = obj.Occupant
            if occupant then
                return occupant
            end
        end
    end
    return nil
end

local function updatePausedProps()
    for _, prop in ipairs(getMyProps()) do
        local occupant = getOccupiedPlayer(prop)

        if occupant then
            -- Once occupied, remember the occupant and keep this prop paused.
            pausedProps[prop] = occupant
        elseif pausedProps[prop] then
            -- Resume only after the player is actually off the prop.
            pausedProps[prop] = nil
        end
    end
end

local function isPausedProp(prop)
    local rememberedOccupant = pausedProps[prop]

    if rememberedOccupant then
        -- Keep it paused while the same humanoid is still seated.
        local currentOccupant = getOccupiedPlayer(prop)
        if currentOccupant == rememberedOccupant then
            return true
        end

        -- If the seat is now empty (or the original occupant changed),
        -- release the pause so the prop can be reused.
        if currentOccupant == nil then
            pausedProps[prop] = nil
            return false
        end

        -- A different player is now sitting on it: keep it paused as well.
        pausedProps[prop] = currentOccupant
        return true
    end

    local occupant = getOccupiedPlayer(prop)
    if occupant then
        pausedProps[prop] = occupant
        return true
    end

    return false
end

local function getTargetSeatedProp(target)
    local character = target and target.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return nil
    end

    local seatPart = humanoid.SeatPart
    if not seatPart then
        return nil
    end

    for _, prop in ipairs(getMyProps()) do
        if seatPart == prop or seatPart:IsDescendantOf(prop) then
            return prop
        end
    end

    return nil
end

local function warpSeatedPropOnce(target)
    local prop = getTargetSeatedProp(target)
    if not prop then
        return nil
    end

    -- If this prop has already been paused for this sitting session,
    -- never move it again.
    if pausedProps[prop] then
        return prop
    end

    local occupant = getOccupiedPlayer(prop)
    if not occupant then
        return nil
    end

    pausedProps[prop] = occupant

    -- Move the occupied prop to Y=50000 exactly once, preserving X/Z and rotation.
    local r = prop:FindFirstChild("SetCurrentCFrame")
    if r then
        local current = prop:GetPivot()
        local pos = current.Position
        local targetCF = CFrame.new(pos.X, 50000, pos.Z) * current.Rotation
        pcall(function()
            r:InvokeServer(targetCF)
        end)
    end

    return prop
end

local function getFollowProps()
    updatePausedProps()

    local result = {}
    for _, prop in ipairs(getMyProps()) do
        if not isPausedProp(prop) then
            table.insert(result, prop)
        end
    end
    return result
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
local FULL_H, MIN_H = 250, 28
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
local NearestBtn  = makeBtn("ขังคนใกล้สุด", 66)
local ModeBtn  = makeBtn("ห้องขังปกติ", 98)
local FollowBtn = makeBtn("ไล่ตามเป้าหมาย", 130)
ModeBtn.MouseButton1Click:Connect(function()
    if cageMode == "normal" then
        cageMode = "small"
        ModeBtn.Text = "ห้องขังเล็ก"
    elseif cageMode == "small" then
        cageMode = "big"
        ModeBtn.Text = "ห้องขังใหญ่"
    else
        cageMode = "normal"
        ModeBtn.Text = "ห้องขังปกติ"
    end
end)

local followOn = false
local followConnection
local FOLLOW_INTERVAL = 0.08
local FOLLOW_MOVE_THRESHOLD = 0.015

local function getCurrentOffsets()
    if cageMode == "normal" then
        return NORMAL_OFF
    elseif cageMode == "big" then
        return BIG_OFF
    else
        return SMALL_OFF
    end
end

FollowBtn.MouseButton1Click:Connect(function()
    if followOn then
        followOn = false
        FollowBtn.Text = "ไล่ตามเป้าหมาย"
        if followConnection then
            followConnection:Disconnect()
            followConnection = nil
        end
        return
    end

    local target = findPlayerByName(NameBox.Text)
    if not target then
        StatusLabel.Text = "ใส่ชื่อเป้าหมายก่อนไล่ตาม!"
        return
    end

    followOn = true
    FollowBtn.Text = "หยุดไล่ตาม"
    StatusLabel.Text = "กำลังไล่ตาม " .. target.Name

    local accumulator = 0
    local lastTargetPos
    followConnection = RunService.Heartbeat:Connect(function(dt)
        if not followOn then return end

        accumulator += dt
        if accumulator < FOLLOW_INTERVAL then
            return
        end
        accumulator = 0

        local t = findPlayerByName(NameBox.Text)
        local hrp = t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local targetCF = hrp.CFrame
        local targetPos = targetCF.Position

        -- Handle the target sitting down independently of target movement.
        -- This must run even when the target is standing still.
        warpSeatedPropOnce(t)

        if lastTargetPos and (targetPos - lastTargetPos).Magnitude < FOLLOW_MOVE_THRESHOLD then
            return
        end
        lastTargetPos = targetPos

        local offs = getCurrentOffsets()
        local props = getFollowProps()

        -- Props detected as occupied are permanently skipped for the current
        -- sitting session. They are not reused after a warp; once the player
        -- leaves the prop, it becomes available again.
        for i, prop in ipairs(props) do
            local offsetIndex = ((i - 1) % #offs) + 1
            local desired = targetCF * offs[offsetIndex]

            task.spawn(function()
                pcall(function()
                    -- Re-check the persistent pause state immediately before moving.
                    -- If this prop was occupied earlier, it stays untouched until
                    -- the player is actually off the prop.
                    if isPausedProp(prop) then return end

                    local r = prop:FindFirstChild("SetCurrentCFrame")
                    if r then
                        r:InvokeServer(desired)
                    end

                    if not colored[prop] then
                        colored[prop] = true
                        local rc = prop:FindFirstChild("ChangePropColor")
                        if rc then rc:InvokeServer(GOLD) end
                    end
                end)
            end)
        end
    end)
end)


StatusLabel = Instance.new("TextLabel", Body)
StatusLabel.Size = UDim2.new(0.9, 0, 0, 44)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 162)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(150, 180, 255)
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.TextSize = 10
StatusLabel.TextWrapped = true
StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
local Credit = Instance.new("TextLabel", Body)
Credit.Size = UDim2.new(0.9, 0, 0, 16)
Credit.Position = UDim2.new(0.05, 0, 0, 204)
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
