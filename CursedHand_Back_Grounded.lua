--[[
    CURSED HAND 15 PROPS - BACK & GROUNDED EDITION (แก้แล้ว)
    สิ่งที่แก้จากเดิม:
    [FIX-1] มือไม่ลอยเหนือหัวแล้ว -> ย้ายไปอยู่ "ข้างหลังตัวละคร" ระยะปานกลาง (ปรับ DISTANCE_BEHIND ได้)
    [FIX-2] raycast ตรวจหาพื้นจริงใต้เท้า -> วางมือให้ปลายนิ้ว (จุดต่ำสุด) แตะพื้นพอดีทุกแมพ
    [FIX-3] ตัดอนิเมชันขยับขึ้นลง/ซ้ายขวาตอนนิ่ง (idle bob) ทิ้งหมด
            เหลือแค่ lerp นุ่ม ๆ ตามตัวละคร -> คนเน็ตไม่ดีไม่ปิง
    [FIX-4] ลดอัตรายิงแพ็กเก็ต 45 -> 30 ครั้ง/วิ และสีแค่ทุก 1 วิ (ลด remote ~50%)
    - ส่วน Attack / Punch, Freeze, Follow, Scan, GUI เหมือนเดิมทุกอย่าง
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

-- ================== [[ CONFIG ปรับได้ตรงนี้ ]] ==================
local DISTANCE_BEHIND = 7     -- ระยะหลังตัวละคร (studs) ไม่ไกลไม่ใกล้
local HEIGHT_GAP = 0          -- เผื่อยกสูงจากพื้น (studs) ถ้าอยากลอยเล็กน้อยใส่ 0.5
local SEND_RATE = 30          -- ยิงแพ็กเก็ต/วิ (เน็ตไม่ดีลดเป็น 20, เน็ตดีเพิ่มเป็น 45)
local LERP_SPEED = 0.30       -- ความนุ่มในการตามตัวละคร (0.1-0.4)
-- ===============================================================

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
Title.Text = "cursed hand 15 props (back & grounded)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 15
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

local centerPoint = HandStructureCFrames[8].Position

-- [FIX-2] คำนวณจุดต่ำสุดของโครงสร้างมือ -> ใช้หักลบให้ปลายนิ้วแตะพื้นพอดี
local structureMinY = math.huge
for _, cf in pairs(HandStructureCFrames) do
    structureMinY = math.min(structureMinY, cf.Position.Y)
end
local centerToBottom = centerPoint.Y - structureMinY   -- = 2.897 - 1.481 = 1.416

-- [FIX-2] raycast หาความสูงพื้นจริงใต้ตำแหน่งที่ส่งเข้ามา (เผื่อเนิน/บันได/ดาดฟ้า)
local groundParams = RaycastParams.new()
groundParams.FilterType = Enum.RaycastFilterType.Exclude
groundParams.IgnoreWater = true

local function getGroundY(worldPos, ignoreChar)
    groundParams.FilterDescendantsInstances = {LP.Character, ignoreChar}
    local hit = workspace:Raycast(worldPos + Vector3.new(0, 8, 0), Vector3.new(0, -250, 0), groundParams)
    if hit then return hit.Position.Y end
    return worldPos.Y - 3  -- fallback: ใต้เท้าเล็กน้อย
end

-- ====================================================================

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
local updateInterval = 1 / SEND_RATE
local colorTimer = 0
local COLOR_INTERVAL = 1  -- [FIX-4] สียิงทุก 1 วิ พอ

RS:BindToRenderStep("CURSED_HAND_ENGINE", 1, function(dt)
    if not active or #wingRemoteCache < 1 then return end

    lastUpdate = lastUpdate + dt
    local sendToServer = (lastUpdate >= updateInterval)
    if sendToServer then lastUpdate = 0 end

    colorTimer = colorTimer + dt
    local sendColor = (colorTimer >= COLOR_INTERVAL)
    if sendColor then colorTimer = 0 end

    local myChar = LP.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end

    local targetChar = matchedTargetPlayer and matchedTargetPlayer.Character
    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

    -- Dikelola Karakter Lokal atau Target Player
    local activeHRP = (matchedTargetPlayer and targetHRP) or myHRP

    -- [FIX-3] ตัด idle bob (floatY/floatX/idleRotation) ทิ้งหมด -> นิ่ง ไม่ปิง
    local baseCF

    -- [FIX-1+2] คำนวณตำแหน่ง: ข้างหลังตัวละคร + ปลายนิ้วแตะพื้น
    local function computeBaseCF()
        local hrpPos = activeHRP.Position
        -- ทิศหลังตัว (แบนเฉพาะแนวนอน กันหงายตอนมองฟ้า/ดิน)
        local look = activeHRP.CFrame.LookVector
        local flatLook = Vector3.new(look.X, 0, look.Z)
        if flatLook.Magnitude < 0.001 then
            flatLook = Vector3.new(0, 0, -1)
        else
            flatLook = flatLook.Unit
        end
        -- [FIX-2] ตรวจพื้นจริงด้านหลังตัว (ยิง ray จากจุดที่จะวาง ไม่ใช่ใต้เท้า)
        local behindPos = hrpPos - flatLook * DISTANCE_BEHIND
        local groundY = getGroundY(behindPos, targetChar)
        local basePos = Vector3.new(behindPos.X, groundY - centerToBottom + HEIGHT_GAP, behindPos.Z)
        -- หันหน้ามือเข้าหาตัวละคร (ระนาบนอน ไม่เอียง)
        return CFrame.lookAt(basePos, Vector3.new(hrpPos.X, basePos.Y, hrpPos.Z))
    end

    if isFrozen and frozenCFrame then
        baseCF = frozenCFrame
    elseif isFollowing then
        baseCF = computeBaseCF()
    else
        -- Unfollow: มือนิ่งค้างที่ตำแหน่งสุดท้าย
        baseCF = frozenCFrame or computeBaseCF()
    end

    if not isFrozen then
        frozenCFrame = baseCF
    end

    local animOffset = CFrame.new()

    -- ANIMASI ATTACK / PUNCH (เหมือนเดิม)
    if isAttacking then
        attackProgress = attackProgress + (dt / attackDuration)

        if attackProgress <= 0.35 then
            local p = attackProgress / 0.35
            local easeUp = math.sin(p * (math.pi / 2))
            animOffset = CFrame.new(0, easeUp * 20, -easeUp * 4) * CFrame.Angles(math.rad(easeUp * 50), 0, math.rad(-easeUp * 20))
        elseif attackProgress <= 0.55 then
            local p = (attackProgress - 0.35) / 0.20
            local easeDown = p * p * p
            local currentY = 20 - (easeDown * 28)
            animOffset = CFrame.new(0, currentY, -4 + (easeDown * 12)) * CFrame.Angles(math.rad(50 - (easeDown * 100)), 0, 0)
        elseif attackProgress <= 1.0 then
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

            local targetCF = baseCF * animOffset * CFrame.new(offsetFromCenter) * localRot

            -- [FIX-3] นุ่มแบบนิ่ง ไม่มี bob
            currentCFrames[i] = (currentCFrames[i] or targetCF):Lerp(targetCF, isAttacking and 0.75 or LERP_SPEED)

            if sendToServer then
                task.spawn(function()
                    if prop:FindFirstChild("SetCurrentCFrame") then
                        prop.SetCurrentCFrame:InvokeServer(currentCFrames[i])
                    end
                    -- [FIX-4] สีแค่ทุก 1 วิ (ไม่ยิงทุกแพ็กเก็ตเหมือนเดิม)
                    if sendColor and prop:FindFirstChild("ChangePropColor") then
                        prop.ChangePropColor:InvokeServer(blackColor)
                    end
                end)
            end
        end
    end
end)

print("[Cursed Hand] Back & Grounded loaded | DISTANCE_BEHIND=" .. DISTANCE_BEHIND
    .. " | SEND_RATE=" .. SEND_RATE .. "/s | นิ่ง ไม่ bob")
