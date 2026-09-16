--[[
    CURSED HAND 15 PROPS (SMOOTH & ANTI-LAG)
    - Username Auto-Matching & Smooth Target Follow
    - Dynamic Attack / Punch Animation (Smash Down)
    - Follow Cursed & Unfollow Cursed Controls
    - Freeze Cursed (Kunci Posisi Tangan di Tempat)
    - Credit: Cursed hand
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("VintterWitherGui") then 
    CoreGui.VintterWitherGui:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "VintterWitherGui"

-- MAIN GUI (320x510, Black Theme)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 320, 0, 510)
Main.Position = UDim2.new(0.5, -160, 0.5, -255)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(60, 60, 60)
Main.Draggable, Main.Active = true, true

-- HEADER GUI
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Header.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0.04, 0, 0, 0)
Title.Text = "cursed hand 15 props"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

local ToggleBtn = Instance.new("TextButton", Header)
ToggleBtn.Size = UDim2.new(0, 30, 0, 30)
ToggleBtn.Position = UDim2.new(0.88, -5, 0.1, 0)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Text = "-"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 20

-- CONTAINER TOMBOL
local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, 0, 1, -65)
Container.Position = UDim2.new(0, 0, 0, 40)
Container.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Container)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 5)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local UIPad = Instance.new("UIPadding", Container)
UIPad.PaddingTop = UDim.new(0, 6)

-- FOOTER CREDIT
local FooterText = Instance.new("TextLabel", Main)
FooterText.Size = UDim2.new(1, 0, 0, 20)
FooterText.Position = UDim2.new(0, 0, 1, -22)
FooterText.Text = "Cursed hand"
FooterText.TextColor3 = Color3.fromRGB(180, 180, 180)
FooterText.Font = Enum.Font.SourceSansItalic
FooterText.TextSize = 13
FooterText.BackgroundTransparency = 1

-- LIPAT / MINIMIZE GUI
local isMinimized = false
ToggleBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Main.Size = isMinimized and UDim2.new(0, 320, 0, 40) or UDim2.new(0, 320, 0, 510)
    Container.Visible = not isMinimized
    FooterText.Visible = not isMinimized
    ToggleBtn.Text = isMinimized and "+" or "-"
end)

-- LOGIKA STATE & CONTROL
local active = false
local isFollowing = true
local isFrozen = false
local isAttacking = false
local attackProgress = 0
attackDuration = 0.85

-- [[ ตั้งค่าตำแหน่งมือ - ปรับเลขพวกนี้ได้ตามชอบ ]] --
local BACK_DISTANCE = 5    -- ระยะห่าง "ด้านหลัง" ตัวละคร (studs)
local DROP_HEIGHT   = 4    -- ดึงมือลงล่างจากตำแหน่งเดิม (studs)
local HOVER_HEIGHT  = 1    -- ความสูงพื้นฐานจากตัวละคร
local FLOAT_AMP_Y   = 0.6  -- แอมพลิจูดลอยขึ้นลง (เดิม 1.8)
local FLOAT_AMP_X   = 0.5  -- แอมพลิจูดแกว่งซ้ายขวา (เดิม 1.2)
local ROTATE_BEHIND = false -- หันมือ 180° (ค่าเริ่มต้นปิด)
local TILT_DEG      = 5    -- องศาเอียงมือส่วนหน้า (ชิ้น 9-15) ขึ้นด้านหน้า: 3°=นิ้วขึ้น~1.2 studs, 8°=~3.3 studs
local TILT_FROM     = 9    -- เริ่มเอียงตั้งแต่ชิ้นที่เท่าไหร่ (9 = หมุนรอบข้อต่อชิ้น 9)

local targetPlayerName = ""
local matchedTargetPlayer = nil
local frozenCFrame = nil

local wingRemoteCache = {}
local currentCFrames = {}

local function CreateButton(text, layoutOrder, callback)
    local b = Instance.new("TextButton", Container)
    b.Size = UDim2.new(0.9, 0, 0, 30)
    b.LayoutOrder = layoutOrder
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.BorderSizePixel = 1
    b.BorderColor3 = Color3.fromRGB(70, 70, 70)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 13
    
    b.MouseButton1Click:Connect(function()
        callback(b)
    end)
    return b
end

-- TARGET USERNAME INPUT & INDICATOR
local UserInputBox = Instance.new("TextBox", Container)
UserInputBox.Size = UDim2.new(0.9, 0, 0, 28)
UserInputBox.LayoutOrder = 1
UserInputBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
UserInputBox.BorderSizePixel = 1
UserInputBox.BorderColor3 = Color3.fromRGB(60, 60, 60)
UserInputBox.PlaceholderText = "Ketik Username Target..."
UserInputBox.Text = ""
UserInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UserInputBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
UserInputBox.Font = Enum.Font.SourceSans
UserInputBox.TextSize = 12

local MatchLabel = Instance.new("TextLabel", Container)
MatchLabel.Size = UDim2.new(0.9, 0, 0, 20)
MatchLabel.LayoutOrder = 2
MatchLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MatchLabel.BorderSizePixel = 0
MatchLabel.Text = "TARGET: NONE"
MatchLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
MatchLabel.Font = Enum.Font.SourceSansBold
MatchLabel.TextSize = 12

local function FindPlayerMatch(nameText)
    if nameText == "" then return nil end
    local query = nameText:lower()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP and (plr.Name:lower():sub(1, #query) == query or plr.DisplayName:lower():sub(1, #query) == query) then
            return plr
        end
    end
    return nil
end

UserInputBox:GetPropertyChangedSignal("Text"):Connect(function()
    targetPlayerName = UserInputBox.Text
    matchedTargetPlayer = FindPlayerMatch(targetPlayerName)
    if matchedTargetPlayer then
        MatchLabel.Text = "TARGET FOUND: " .. matchedTargetPlayer.Name
        MatchLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
    else
        if targetPlayerName == "" then
            MatchLabel.Text = "TARGET: NONE"
            MatchLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
        else
            MatchLabel.Text = "TARGET: NOT FOUND"
            MatchLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
        end
    end
end)

local function ScanProps()
    wingRemoteCache = {}
    local success, p = pcall(function()
        return workspace:WaitForChild("WorkspaceCom", 2):WaitForChild("001_TrafficCones", 2)
    end)
    if success and p then
        for _, v in ipairs(p:GetChildren()) do 
            if v.Name:find("Prop") and v.Name:find(LP.Name) then 
                table.insert(wingRemoteCache, v) 
            end 
        end
    end
    return #wingRemoteCache
end

-- ====================================================================
--            STRUKTUR DATA CFRAME CURSED HAND (PROP 1-15)
-- ====================================================================
local HandStructureCFrames = {
    [1]  = CFrame.new(78.781, 3.825, -43.120, 0.240, -0.220, -0.946, -0.623, 0.712, -0.324, 0.745, 0.667, 0.034),
    [2]  = CFrame.new(59.968, 10.795, -30.280, -0.829, -0.063, 0.556, -0.008, -0.992, -0.126, 0.559, -0.109, 0.822),
    [3]  = CFrame.new(60.210, 14.816, -29.916, -0.829, -0.063, 0.556, -0.008, -0.992, -0.126, 0.559, -0.109, 0.822),
    [4]  = CFrame.new(67.646, 14.506, -30.658, -0.911, -0.063, -0.408, 0.102, -0.992, -0.074, -0.400, -0.109, 0.910),
    [5]  = CFrame.new(67.309, 6.424, -30.608, -0.911, -0.063, -0.408, 0.102, -0.992, -0.074, -0.400, -0.109, 0.910),
    [6]  = CFrame.new(60.139, 7.061, -30.086, -0.829, -0.063, 0.556, -0.008, -0.992, -0.126, 0.559, -0.109, 0.822),
    [7]  = CFrame.new(67.618, 10.424, -30.648, -0.911, -0.063, -0.408, 0.102, -0.992, -0.074, -0.400, -0.109, 0.910),
    [8]  = CFrame.new(64.214, 2.897, -26.368, 1.000, -0.000, -0.003, 0.000, 1.000, -0.000, 0.003, 0.000, 1.000),
    [9]  = CFrame.new(64.215, 5.087, -26.346, 1.000, -0.000, -0.003, 0.000, 1.000, -0.000, 0.003, 0.000, 1.000),
    [10] = CFrame.new(76.055, 13.702, -33.975, 0.240, -0.757, -0.608, -0.623, 0.360, -0.694, 0.745, 0.545, -0.385),
    [11] = CFrame.new(78.759, 3.863, -42.777, -0.912, 0.405, -0.067, 0.000, -0.163, -0.987, -0.410, -0.900, 0.149),
    [12] = CFrame.new(79.797, 2.528, -45.249, -0.899, 0.424, -0.107, 0.000, -0.245, -0.970, -0.438, -0.872, 0.220),
    [13] = CFrame.new(78.695, 1.481, -47.867, -0.912, 0.000, 0.411, 0.000, 1.000, 0.000, -0.411, 0.000, -0.912),
    [14] = CFrame.new(83.446, 1.481, -45.968, -0.912, 0.000, 0.411, 0.000, 1.000, 0.000, -0.411, 0.000, -0.912),
    [15] = CFrame.new(81.079, 1.481, -46.860, -0.912, 0.000, 0.411, 0.000, 1.000, 0.000, -0.411, 0.000, -0.912)
}
-- ====================================================================

local centerPoint = HandStructureCFrames[8].Position

-- [[ ระบบเอียงมือ: หมุนก้อนชิ้น 1 และ 9-15 ทั้งก้อน รอบข้อต่อชิ้น 9 (ชิ้น 1 = นิ้วโป้ง ต้องหมุนด้วย) ]] --
local tiltPivotPos = HandStructureCFrames[9].Position
local tiltDir = HandStructureCFrames[10].Position - tiltPivotPos
local tiltAxis = Vector3.new(0, 1, 0):Cross(Vector3.new(tiltDir.X, 0, tiltDir.Z).Unit)
local tiltAngle = math.rad(TILT_DEG)

local function rotatePointAround(pivot, axis, ang, point)
    local rel = point - pivot
    local c, s = math.cos(ang), math.sin(ang)
    return pivot + rel * c + axis:Cross(rel) * s + axis * (axis:Dot(rel) * (1 - c))
end

-- เช็กอัตโนมัติ: ถ้าแกนทำนิ้วมือต่ำลง ให้กลับแกน (กันมุมติดลบแล้วจมหนักขึ้น)
if rotatePointAround(tiltPivotPos, tiltAxis, tiltAngle, HandStructureCFrames[13].Position).Y
    < HandStructureCFrames[13].Position.Y then
    tiltAxis = -tiltAxis
end

local function axisRotationCF(axis, ang)
    local c, s = math.cos(ang), math.sin(ang)
    local t = 1 - c
    local x, y, z = axis.X, axis.Y, axis.Z
    return CFrame.new(0, 0, 0,
        t*x*x + c,     t*x*y + s*z, t*x*z - s*y,
        t*x*y - s*z,   t*y*y + c,   t*y*z + s*x,
        t*x*z + s*y,   t*y*z - s*x, t*z*z + c)
end
local tiltCF = CFrame.new(tiltPivotPos) * axisRotationCF(tiltAxis, tiltAngle) * CFrame.new(-tiltPivotPos)

CreateButton("TOGGLE HAND : OFF", 3, function(btn)
    active = not active
    btn.Text = active and "TOGGLE HAND : ON" or "TOGGLE HAND : OFF"
end)

CreateButton("SCAN PROPS", 4, function() 
    ScanProps() 
end)

local FollowBtn = CreateButton("FOLLOW CURSED : ON", 5, function(btn)
    isFollowing = not isFollowing
    btn.Text = isFollowing and "FOLLOW CURSED : ON" or "UNFOLLOW CURSED"
end)

local FreezeBtn = CreateButton("FREEZE CURSED : OFF", 6, function(btn)
    isFrozen = not isFrozen
    btn.Text = isFrozen and "FREEZE CURSED : ON" or "FREEZE CURSED : OFF"
    if isFrozen and currentCFrames[8] then
        frozenCFrame = currentCFrames[8]
    end
end)

CreateButton("ATTACK / PUNCH", 7, function()
    if active and not isAttacking then
        isAttacking = true
        attackProgress = 0
    end
end)

CreateButton("CLOSE SCRIPT", 8, function() 
    ScreenGui:Destroy() 
end)

local lastUpdate = 0
local updateInterval = 1 / 45

RS:BindToRenderStep("CURSED_HAND_ENGINE", 1, function(dt)
    if not active or #wingRemoteCache < 1 then return end

    lastUpdate = lastUpdate + dt
    local sendToServer = (lastUpdate >= updateInterval)
    if sendToServer then lastUpdate = 0 end

    local myChar = LP.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end

    local t = tick()
    local targetChar = matchedTargetPlayer and matchedTargetPlayer.Character
    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

    -- Dikelola Karakter Lokal atau Target Player
    local activeHRP = (matchedTargetPlayer and targetHRP) or myHRP

    -- ANIMASI TANGAN MELAYANG SMOOTH (Idle Movement)
    local floatY = math.sin(t * 2.5) * FLOAT_AMP_Y
    local floatX = math.cos(t * 1.5) * FLOAT_AMP_X
    local idleRotation = CFrame.Angles(math.rad(math.sin(t * 2) * 5), 0, math.rad(math.cos(t * 2) * 5))

    local baseCF = CFrame.new()

    -- HITUNG POSISI DAN STATUS HAND
    if isFrozen and frozenCFrame then
        baseCF = frozenCFrame
    elseif isFollowing then
        local backRot = ROTATE_BEHIND and CFrame.Angles(0, math.pi, 0) or CFrame.new()
        baseCF = activeHRP.CFrame * CFrame.new(floatX, HOVER_HEIGHT - DROP_HEIGHT + floatY, BACK_DISTANCE) * backRot * idleRotation
    else
        -- Unfollow: Tangan melayang diam di posisi terakhir
        baseCF = frozenCFrame or (activeHRP.CFrame * CFrame.new(0, HOVER_HEIGHT - DROP_HEIGHT + floatY, BACK_DISTANCE))
    end

    if not isFrozen then
        frozenCFrame = baseCF
    end

    local animOffset = CFrame.new()

    -- ANIMASI ATTACK / PUNCH
    if isAttacking then
        attackProgress = attackProgress + (dt / attackDuration)
        
        if attackProgress <= 0.35 then
            -- Wind-Up / mengangkat
            local p = attackProgress / 0.35
            local easeUp = math.sin(p * (math.pi / 2))
            animOffset = CFrame.new(0, easeUp * 20, -easeUp * 4) * CFrame.Angles(math.rad(easeUp * 50), 0, math.rad(-easeUp * 20))
        elseif attackProgress <= 0.55 then
            -- Smash Down / menghantam
            local p = (attackProgress - 0.35) / 0.20
            local easeDown = p * p * p
            local currentY = 20 - (easeDown * 28)
            animOffset = CFrame.new(0, currentY, -4 + (easeDown * 12)) * CFrame.Angles(math.rad(50 - (easeDown * 100)), 0, 0)
        elseif attackProgress <= 1.0 then
            -- Recovery / kembali
            local p = (attackProgress - 0.55) / 0.45
            local easeReturn = math.sin(p * (math.pi / 2))
            local shake = (1 - p) * math.sin(p * 35) * 1.8
            animOffset = CFrame.new(shake, -8 * (1 - easeReturn), 8 * (1 - easeReturn)) * CFrame.Angles(math.rad(-50 * (1 - easeReturn)), 0, 0)
        else
            isAttacking = false
            attackProgress = 0
        end
    end

    -- TRANSFORMASI PROPS & RENDER ENGINE
    local blackColor = Color3.fromRGB(0, 0, 0)

    for i = 1, math.min(#wingRemoteCache, 15) do
        local prop = wingRemoteCache[i]
        local rawCF = HandStructureCFrames[i]

        if prop and prop.Parent and rawCF then
            local offsetFromCenter = rawCF.Position - centerPoint
            local localRot = rawCF - rawCF.Position
            
            local targetCF
            -- ชิ้น 1 = นิ้วโป้ง อยู่กลุ่มเดียวกับชิ้น 9-15 (ห่างชิ้น 11 เพียง 0.35)
            -- ต้องให้ร่วมหมุน tilt ด้วย ไม่งั้นจะหลุดจากชิ้น 10 เมื่อ TILT_DEG > 0
            if i >= TILT_FROM or i == 1 then
                targetCF = baseCF * animOffset * tiltCF * CFrame.new(offsetFromCenter) * localRot
            else
                targetCF = baseCF * animOffset * CFrame.new(offsetFromCenter) * localRot
            end
            
            -- Smooth Lerp Interpolation
            currentCFrames[i] = (currentCFrames[i] or targetCF):Lerp(targetCF, isAttacking and 0.75 or 0.35)

            if sendToServer then
                task.spawn(function()
                    if prop:FindFirstChild("SetCurrentCFrame") then
                        prop.SetCurrentCFrame:InvokeServer(currentCFrames[i])
                    end
                    if prop:FindFirstChild("ChangePropColor") then
                        prop.ChangePropColor:InvokeServer(blackColor)
                    end
                end)
            end
        end
    end
end)