--[[
    CURSED HAND 15 PROPS (ORIGINAL DARK GUI & SMOOTH SUSANOO COLORS)
    - Username Auto-Matching & Smooth Target Follow
    - Dynamic Attack / Punch Animation (Smash Down)
    - Follow Cursed & Unfollow Cursed Controls
    - Freeze Cursed (Kunci Posisi Tangan di Tempat)
    - Nama GUI: susano'o itachi (Teks Hitam dengan Header Gelap Asal)
    - Warna Bergantian Secara Perlahan Antara 3 Tona Susanoo Itachi
    - [UPDATE] หน้าต่างเลือกสีแยก (12 แม่สี + โหมด AUTO เดิม)
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

-- MAIN GUI (Compact: 260 x 420)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 260, 0, 420)
Main.Position = UDim2.new(0.5, -130, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(60, 60, 60)
Main.Draggable, Main.Active = true, true

-- HEADER GUI (Warna Gelap Asal)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Header.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.Position = UDim2.new(0.04, 0, 0, 0)
Title.Text = "susano'o itachi"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

local ToggleBtn = Instance.new("TextButton", Header)
ToggleBtn.Size = UDim2.new(0, 26, 0, 26)
ToggleBtn.Position = UDim2.new(0.88, -2, 0.12, 0)
ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Text = "-"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 18

-- CONTAINER TOMBOL
local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, 0, 1, -55)
Container.Position = UDim2.new(0, 0, 0, 35)
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
FooterText.Position = UDim2.new(0, 0, 1, -20)
FooterText.Text = "Smooth Susanoo Colors Edition"
FooterText.TextColor3 = Color3.fromRGB(180, 180, 180)
FooterText.Font = Enum.Font.SourceSansItalic
FooterText.TextSize = 11
FooterText.BackgroundTransparency = 1

-- ============================================================
--   [ใหม่] หน้าต่างเลือกสีแยก (COLOR WINDOW)
-- ============================================================
local ColorWindow = Instance.new("Frame", ScreenGui)
ColorWindow.Name = "ColorWindow"
ColorWindow.Size = UDim2.new(0, 250, 0, 235)
ColorWindow.Position = UDim2.new(0.5, 140, 0.5, -117)
ColorWindow.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ColorWindow.BorderSizePixel = 2
ColorWindow.BorderColor3 = Color3.fromRGB(220, 20, 20)
ColorWindow.Visible = false
ColorWindow.Draggable = true
ColorWindow.Active = true

local ColorHeader = Instance.new("Frame", ColorWindow)
ColorHeader.Size = UDim2.new(1, 0, 0, 30)
ColorHeader.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
ColorHeader.BorderSizePixel = 0

local ColorTitle = Instance.new("TextLabel", ColorHeader)
ColorTitle.Size = UDim2.new(0.75, 0, 1, 0)
ColorTitle.Position = UDim2.new(0.04, 0, 0, 0)
ColorTitle.Text = "PILIH WARNA (12)"
ColorTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ColorTitle.Font = Enum.Font.SourceSansBold
ColorTitle.TextSize = 13
ColorTitle.TextXAlignment = Enum.TextXAlignment.Left
ColorTitle.BackgroundTransparency = 1

local ColorCloseBtn = Instance.new("TextButton", ColorHeader)
ColorCloseBtn.Size = UDim2.new(0, 26, 0, 22)
ColorCloseBtn.Position = UDim2.new(1, -30, 0.13, 0)
ColorCloseBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
ColorCloseBtn.BorderSizePixel = 0
ColorCloseBtn.Text = "X"
ColorCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ColorCloseBtn.Font = Enum.Font.SourceSansBold
ColorCloseBtn.TextSize = 13

-- ตารางสี 4 คอลัมน์
local ColorGrid = Instance.new("Frame", ColorWindow)
ColorGrid.Size = UDim2.new(1, -12, 1, -72)
ColorGrid.Position = UDim2.new(0, 6, 0, 36)
ColorGrid.BackgroundTransparency = 1

local GridLayout = Instance.new("UIGridLayout", ColorGrid)
GridLayout.CellSize = UDim2.new(0, 54, 0, 34)
GridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- สถานะสีปัจจุบัน
local ColorStatus = Instance.new("TextLabel", ColorWindow)
ColorStatus.Size = UDim2.new(1, -12, 0, 22)
ColorStatus.Position = UDim2.new(0, 6, 1, -28)
ColorStatus.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ColorStatus.BorderSizePixel = 0
ColorStatus.Text = "MODE: AUTO SUSANOO"
ColorStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
ColorStatus.Font = Enum.Font.SourceSansBold
ColorStatus.TextSize = 11

-- 12 แม่สี + โหมดออโต้
local presetColors = {
    {name = "MERAH",       c = Color3.fromRGB(220, 20, 20)},
    {name = "MERAH GELAP", c = Color3.fromRGB(150, 0, 0)},
    {name = "ORANYE",      c = Color3.fromRGB(255, 69, 0)},
    {name = "KUNING",      c = Color3.fromRGB(255, 215, 0)},
    {name = "HIJAU",       c = Color3.fromRGB(0, 200, 60)},
    {name = "LUMUT",       c = Color3.fromRGB(50, 255, 150)},
    {name = "CYAN",        c = Color3.fromRGB(0, 220, 255)},
    {name = "BIRU",        c = Color3.fromRGB(30, 60, 255)},
    {name = "UNGU",        c = Color3.fromRGB(140, 0, 255)},
    {name = "PINK",        c = Color3.fromRGB(255, 0, 180)},
    {name = "PUTIH",       c = Color3.fromRGB(255, 255, 255)},
    {name = "HITAM",       c = Color3.fromRGB(15, 15, 15)},
}

-- สีที่ล็อกไว้ (nil = โหมดสุ่มออโต้เดิม)
local forcedColor = nil
local forcedColorName = nil

for idx, data in ipairs(presetColors) do
    local cb = Instance.new("TextButton", ColorGrid)
    cb.LayoutOrder = idx
    cb.BackgroundColor3 = data.c
    cb.BorderSizePixel = 1
    cb.BorderColor3 = Color3.fromRGB(80, 80, 80)
    cb.Text = ""
    cb.AutoButtonColor = false

    local cl = Instance.new("TextLabel", cb)
    cl.Size = UDim2.new(1, 0, 0, 12)
    cl.Position = UDim2.new(0, 0, 1, -12)
    cl.BackgroundTransparency = 1
    cl.Text = data.name
    cl.TextColor3 = (data.name == "PUTIH" or data.name == "KUNING" or data.name == "LUMUT" or data.name == "CYAN")
        and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    cl.Font = Enum.Font.SourceSansBold
    cl.TextSize = 8

    cb.MouseButton1Click:Connect(function()
        forcedColor = data.c
        forcedColorName = data.name
        ColorStatus.Text = "WARNA: " .. data.name
        ColorStatus.TextColor3 = data.c
        -- อัปเดตสีทุก prop ทันที
        for i = 1, 15 do
            propColors[i] = data.c
        end
    end)
end

-- ปุ่มกลับโหมดสุ่มออโต้เดิม
local AutoBtn = Instance.new("TextButton", ColorGrid)
AutoBtn.LayoutOrder = 99
AutoBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AutoBtn.BorderSizePixel = 1
AutoBtn.BorderColor3 = Color3.fromRGB(220, 20, 20)
AutoBtn.Text = "AUTO\nSUSANOO"
AutoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBtn.Font = Enum.Font.SourceSansBold
AutoBtn.TextSize = 9

AutoBtn.MouseButton1Click:Connect(function()
    forcedColor = nil
    forcedColorName = nil
    ColorStatus.Text = "MODE: AUTO SUSANOO"
    ColorStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
end)

-- ============================================================

-- LIPAT / MINIMIZE GUI
local isMinimized = false
ToggleBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Main.Size = isMinimized and UDim2.new(0, 260, 0, 35) or UDim2.new(0, 260, 0, 420)
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
local attackDuration = 0.85

local targetPlayerName = ""
local matchedTargetPlayer = nil
local frozenCFrame = nil

local wingRemoteCache = {}
local currentCFrames = {}

local function CreateButton(text, layoutOrder, callback)
    local b = Instance.new("TextButton", Container)
    b.Size = UDim2.new(0.92, 0, 0, 28)
    b.LayoutOrder = layoutOrder
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.BorderSizePixel = 1
    b.BorderColor3 = Color3.fromRGB(70, 70, 70)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 12

    b.MouseButton1Click:Connect(function()
        callback(b)
    end)
    return b
end

-- TARGET USERNAME INPUT & INDICATOR
local UserInputBox = Instance.new("TextBox", Container)
UserInputBox.Size = UDim2.new(0.92, 0, 0, 26)
UserInputBox.LayoutOrder = 1
UserInputBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
UserInputBox.BorderSizePixel = 1
UserInputBox.BorderColor3 = Color3.fromRGB(60, 60, 60)
UserInputBox.PlaceholderText = "Ketik Username Target..."
UserInputBox.Text = ""
UserInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UserInputBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
UserInputBox.Font = Enum.Font.SourceSans
UserInputBox.TextSize = 11

local MatchLabel = Instance.new("TextLabel", Container)
MatchLabel.Size = UDim2.new(0.92, 0, 0, 20)
MatchLabel.LayoutOrder = 2
MatchLabel.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MatchLabel.BorderSizePixel = 0
MatchLabel.Text = "TARGET: NONE"
MatchLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
MatchLabel.Font = Enum.Font.SourceSansBold
MatchLabel.TextSize = 11

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
        return workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
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

CreateButton("TOGGLE HAND : OFF", 3, function(btn)
    active = not active
    btn.Text = active and "TOGGLE HAND : ON" or "TOGGLE HAND : OFF"
    if active then ScanProps() end
end)

CreateButton("SCAN PROPS", 4, function() 
    local found = ScanProps()
    MatchLabel.Text = "PROPS LOADED: " .. found
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

-- [ใหม่] ปุ่มเปิด/ปิดหน้าต่างสี (หน้าต่างแยก ย่อยูไอหลักได้อิสระ)
local ColorMenuBtn = CreateButton("COLOR MENU : OPEN", 9, function(btn)
    ColorWindow.Visible = not ColorWindow.Visible
    btn.Text = ColorWindow.Visible and "COLOR MENU : CLOSE" or "COLOR MENU : OPEN"
end)

ColorCloseBtn.MouseButton1Click:Connect(function()
    ColorWindow.Visible = false
    ColorMenuBtn.Text = "COLOR MENU : OPEN"
end)

local lastUpdate = 0
local updateInterval = 1 / 30
local autoScanTimer = 0

-- 3 Warna Tema Susanoo Itachi (ใช้ตอนโหมด AUTO เท่านั้น)
local susanooColors = {
    Color3.fromRGB(220, 20, 20),
    Color3.fromRGB(150, 0, 0),
    Color3.fromRGB(255, 69, 0)
}

local propColors = {}
local colorChangeTimer = 0

RS:BindToRenderStep("CURSED_HAND_ENGINE", 1, function(dt)
    if not active then return end

    autoScanTimer = autoScanTimer + dt
    if autoScanTimer >= 5.0 then
        autoScanTimer = 0
        if #wingRemoteCache == 0 then
            ScanProps()
        end
    end

    if #wingRemoteCache < 1 then return end

    colorChangeTimer = colorChangeTimer + dt
    local changeColorNow = false
    if colorChangeTimer >= 0.12 then
        colorChangeTimer = 0
        changeColorNow = true
    end

    lastUpdate = lastUpdate + dt
    local sendToServer = (lastUpdate >= updateInterval)
    if sendToServer then lastUpdate = 0 end

    local myChar = LP.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end

    local t = tick()
    local targetChar = matchedTargetPlayer and matchedTargetPlayer.Character
    local targetHRP = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

    local activeHRP = (matchedTargetPlayer and targetHRP) or myHRP

    local floatY = math.sin(t * 2.5) * 1.0
    local floatX = math.cos(t * 1.5) * 0.8
    local idleRotation = CFrame.Angles(math.rad(math.sin(t * 2) * 3), 0, math.rad(math.cos(t * 2) * 3))

    local baseCF = CFrame.new()

    if isFrozen and frozenCFrame then
        baseCF = frozenCFrame
    elseif isFollowing then
        baseCF = activeHRP.CFrame * CFrame.new(floatX, 1.5 + floatY, 2) * idleRotation
    else
        baseCF = frozenCFrame or (activeHRP.CFrame * CFrame.new(0, 1.5 + floatY, 2))
    end

    if not isFrozen then
        frozenCFrame = baseCF
    end

    local animOffset = CFrame.new()

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

    for i = 1, math.min(#wingRemoteCache, 15) do
        local prop = wingRemoteCache[i]
        local rawCF = HandStructureCFrames[i]

        if prop and prop.Parent and rawCF then
            local offsetFromCenter = rawCF.Position - centerPoint
            local localRot = rawCF - rawCF.Position

            local targetCF = baseCF * animOffset * CFrame.new(offsetFromCenter) * localRot

            currentCFrames[i] = (currentCFrames[i] or targetCF):Lerp(targetCF, isAttacking and 0.75 / (dt * 60) or 0.25)

            -- [อัปเดต] สี: ถ้าล็อกแม่สีไว้จะใช้สีนั้นค้าง ถ้าไม่ล็อกจะสุ่ม 3 โทนซูซาโนะเหมือนเดิม
            if forcedColor then
                propColors[i] = forcedColor
            else
                if not propColors[i] then
                    propColors[i] = susanooColors[math.random(1, #susanooColors)]
                end
                if changeColorNow then
                    propColors[i] = susanooColors[math.random(1, #susanooColors)]
                end
            end

            if sendToServer then
                task.spawn(function()
                    pcall(function()
                        if prop:FindFirstChild("SetCurrentCFrame") then
                            prop.SetCurrentCFrame:InvokeServer(currentCFrames[i])
                        end
                        if prop:FindFirstChild("ChangePropColor") then
                            prop.ChangePropColor:InvokeServer(propColors[i])
                        end
                    end)
                end)
            end
        end
    end
end)