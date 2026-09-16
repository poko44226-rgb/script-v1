--[[
    CURSED HAND 15 PROPS - MERGED (V1 + V2 PANEL)
    - GUI: Purple Shiny Panel จาก V2
    - Prop: อยู่ข้างหลังตัวละคร (Behind Character) และนิ่ง ไม่ขยับ (No Idle Float)
    - Credit: By yanzz & Cursed Hand
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- PEMBERSIHAN GUI LAMA
if CoreGui:FindFirstChild("CursedBombMasterGui") then
    CoreGui.CursedBombMasterGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "CursedBombMasterGui"
ScreenGui.IgnoreGuiInset = true

-- PALET WARNA PURPLE & SHINY GRADIENT EFEK
local ColorBasePurple = Color3.fromRGB(30, 10, 50)
local ColorDarkPurple = Color3.fromRGB(45, 15, 75)
local ColorDeepPurpleHD = Color3.fromRGB(120, 30, 200)
local ColorScannerWhite = Color3.fromRGB(255, 255, 255)
local ColorPureWhite = Color3.fromRGB(255, 255, 255)
local ColorButtonPurple = Color3.fromRGB(55, 20, 95)
local ColorTextHighlight = Color3.fromRGB(255, 215, 0)

-- MAIN FRAME (340x630, Full Purple Styling)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 340, 0, 630)
Main.Position = UDim2.new(0.5, -170, 0.5, -315)
Main.BackgroundColor3 = ColorBasePurple
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 12)

-- GRADIENT SHINY EFEK
local BackGrad = Instance.new("UIGradient", Main)
BackGrad.Rotation = 0
BackGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, ColorDarkPurple),
    ColorSequenceKeypoint.new(0.44, ColorDeepPurpleHD),
    ColorSequenceKeypoint.new(0.5, ColorScannerWhite),
    ColorSequenceKeypoint.new(0.56, ColorDeepPurpleHD),
    ColorSequenceKeypoint.new(1, ColorDarkPurple)
})

-- HEADER SECTION
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -50, 0, 25)
Title.Position = UDim2.new(0, 15, 0, 8)
Title.Text = "CURSED HAND & BOMB BLAST"
Title.TextColor3 = ColorPureWhite
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13.5
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

local SubTitle = Instance.new("TextLabel", Header)
SubTitle.Size = UDim2.new(1, -50, 0, 15)
SubTitle.Position = UDim2.new(0, 15, 0, 29)
SubTitle.Text = "By yanzz & Cursed Hand"
SubTitle.TextColor3 = ColorPureWhite
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 10.5
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.BackgroundTransparency = 1

local ToggleBtn = Instance.new("TextButton", Header)
ToggleBtn.Size = UDim2.new(0, 32, 0, 32)
ToggleBtn.Position = UDim2.new(1, -42, 0, 9)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 20, 80)
ToggleBtn.BackgroundTransparency = 0.3
ToggleBtn.Text = "▲"
ToggleBtn.TextColor3 = ColorPureWhite
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 16
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

-- CONTAINER SCROLL/LIST
local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, 0, 1, -55)
Container.Position = UDim2.new(0, 0, 0, 50)
Container.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Container)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 6)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local UIPad = Instance.new("UIPadding", Container)
UIPad.PaddingTop = UDim.new(0, 4)

-- ANIMASI SHINY GRADIENT
local offset = -1.2
local isHighlighted = false
local smoothTweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

RS.RenderStepped:Connect(function(dt)
    offset = offset + (dt * 0.8)
    if offset > 1.2 then offset = -1.2 end
    BackGrad.Offset = Vector2.new(offset, 0)

    local distFromCenter = math.abs(offset)
    if distFromCenter < 0.45 then
        if not isHighlighted then
            isHighlighted = true
            TweenService:Create(Title, smoothTweenInfo, {TextColor3 = ColorTextHighlight}):Play()
            TweenService:Create(SubTitle, smoothTweenInfo, {TextColor3 = ColorTextHighlight}):Play()
        end
    else
        if isHighlighted then
            isHighlighted = false
            TweenService:Create(Title, smoothTweenInfo, {TextColor3 = ColorPureWhite}):Play()
            TweenService:Create(SubTitle, smoothTweenInfo, {TextColor3 = ColorPureWhite}):Play()
        end
    end
end)

-- LOGIKA MINIMIZE GUI
local isMinimized = false
ToggleBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Container.Visible = not isMinimized
    if isMinimized then
        ToggleBtn.Text = "▼"
        Main:TweenSize(UDim2.new(0, 340, 0, 50), "Out", "Quad", 0.3, true)
    else
        ToggleBtn.Text = "▲"
        Main:TweenSize(UDim2.new(0, 340, 0, 630), "Out", "Quad", 0.3, true)
    end
end)

-- LOGIKA STATE SYSTEM
local active = false
local isFollowing = true
local isFrozen = false
local isAttacking = false
local attackProgress = 0
local attackDuration = 0.85

local bombActive = false
local isFiring = false

local targetPlayerName = ""
local matchedTargetPlayer = nil
local frozenCFrame = nil

local wingRemoteCache = {}
local currentCFrames = {}

-- SEPARATOR TITLE HELPER
local function CreateSectionLabel(text, order)
    local lbl = Instance.new("TextLabel", Container)
    lbl.Size = UDim2.new(0.9, 0, 0, 18)
    lbl.LayoutOrder = order
    lbl.BackgroundTransparency = 1
    lbl.Text = "--- " .. text .. " ---"
    lbl.TextColor3 = Color3.fromRGB(220, 170, 255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    return lbl
end

-- HELPER PEMBUATAN TOMBOL
local function CreateThickButton(text, layoutOrder, bgColor)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(0.9, 0, 0, 32)
    btn.LayoutOrder = layoutOrder
    btn.BackgroundColor3 = bgColor or ColorButtonPurple
    btn.Text = text
    btn.TextColor3 = ColorPureWhite
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

-- SECTION 1: TARGET PLAYER INPUT
CreateSectionLabel("TARGET SYSTEM", 1)

local UserInputBox = Instance.new("TextBox", Container)
UserInputBox.Size = UDim2.new(0.9, 0, 0, 28)
UserInputBox.LayoutOrder = 2
UserInputBox.BackgroundColor3 = Color3.fromRGB(20, 5, 35)
UserInputBox.BorderSizePixel = 0
UserInputBox.PlaceholderText = "Ketik Username Target..."
UserInputBox.Text = ""
UserInputBox.TextColor3 = ColorPureWhite
UserInputBox.PlaceholderColor3 = Color3.fromRGB(150, 120, 180)
UserInputBox.Font = Enum.Font.Gotham
UserInputBox.TextSize = 11
Instance.new("UICorner", UserInputBox).CornerRadius = UDim.new(0, 6)

local MatchLabel = Instance.new("TextLabel", Container)
MatchLabel.Size = UDim2.new(0.9, 0, 0, 18)
MatchLabel.LayoutOrder = 3
MatchLabel.BackgroundTransparency = 1
MatchLabel.Text = "TARGET: NONE"
MatchLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
MatchLabel.Font = Enum.Font.GothamBold
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
        MatchLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
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

-- SECTION 2: CURSED HAND CONTROLS
CreateSectionLabel("CURSED HAND CONTROLS", 4)

local ToggleHandBtn = CreateThickButton("TOGGLE HAND : OFF", 5, Color3.fromRGB(45, 15, 75))
local ScanBtn = CreateThickButton("SCAN PROPS", 6, Color3.fromRGB(55, 20, 90))
local FollowBtn = CreateThickButton("FOLLOW CURSED : ON", 7, Color3.fromRGB(55, 20, 90))
local FreezeBtn = CreateThickButton("FREEZE CURSED : OFF", 8, Color3.fromRGB(55, 20, 90))
local AttackBtn = CreateThickButton("ATTACK / PUNCH", 9, Color3.fromRGB(110, 25, 90))

-- SECTION 3: BOMB CONTROLS & STOCK
CreateSectionLabel("BOMB BLAST CANNON", 10)

local StockLabel = Instance.new("TextLabel", Container)
StockLabel.Size = UDim2.new(0.9, 0, 0, 22)
StockLabel.LayoutOrder = 11
StockLabel.BackgroundTransparency = 1
StockLabel.Text = "BOMBS: 0"
StockLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
StockLabel.Font = Enum.Font.GothamBold
StockLabel.TextSize = 15

local ReloadBtn = CreateThickButton("RELOAD BOMB", 12, Color3.fromRGB(50, 15, 85))
local BlastBtn = CreateThickButton("BOMB BLAST", 13, Color3.fromRGB(50, 15, 85))
local CannonBtn = CreateThickButton("FIRE CANNON", 14, ColorButtonPurple)

local CloseBtn = CreateThickButton("CLOSE SCRIPT", 15, Color3.fromRGB(120, 25, 45))

-- SCAN PROPS FUNCTION
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

-- EVENT HANDLERS CURSED HAND
ToggleHandBtn.MouseButton1Click:Connect(function()
    active = not active
    ToggleHandBtn.Text = active and "TOGGLE HAND : ON" or "TOGGLE HAND : OFF"
end)

ScanBtn.MouseButton1Click:Connect(function()
    ScanProps()
end)

FollowBtn.MouseButton1Click:Connect(function()
    isFollowing = not isFollowing
    FollowBtn.Text = isFollowing and "FOLLOW CURSED : ON" or "UNFOLLOW CURSED"
end)

FreezeBtn.MouseButton1Click:Connect(function()
    isFrozen = not isFrozen
    FreezeBtn.Text = isFrozen and "FREEZE CURSED : ON" or "FREEZE CURSED : OFF"
    if isFrozen and currentCFrames[6] then
        frozenCFrame = currentCFrames[6]
    end
end)

AttackBtn.MouseButton1Click:Connect(function()
    if active and not isAttacking then
        isAttacking = true
        attackProgress = 0
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- EVENT HANDLERS BOMB SYSTEM
ReloadBtn.MouseButton1Click:Connect(function()
    bombActive = not bombActive
end)

BlastBtn.MouseButton1Click:Connect(function()
    if LP.Backpack then
        for _, v in pairs(LP.Backpack:GetChildren()) do
            if v.Name == "Bomb" then v.Parent = LP.Character end
        end
    end
end)

CannonBtn.MouseButton1Click:Connect(function()
    if isFiring then return end
    isFiring = true
    local bombs = {}

    if LP.Character then
        for _, v in pairs(LP.Character:GetChildren()) do
            if v.Name == "Bomb" then table.insert(bombs, v) end
        end
    end

    local found = #bombs
    if LP.Backpack then
        for _, v in pairs(LP.Backpack:GetChildren()) do
            if v.Name == "Bomb" and found < 5000 then
                v.Parent = LP.Character
                table.insert(bombs, v)
                found = found + 1
            end
        end
    end

    if #bombs > 0 and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = LP.Character.HumanoidRootPart
        local spawnPos = rootPart.CFrame * CFrame.new(0, 0, -5)

        for _, bomb in pairs(bombs) do
            task.spawn(function()
                if bomb:FindFirstChild("RemoteEvent") then
                    bomb.RemoteEvent:FireServer("PlaceBomb", spawnPos)
                end
                bomb:Activate()
            end)
        end
    end
    isFiring = false
end)

-- BACKGROUND BOMB TASKS
task.spawn(function()
    while true do
        if bombActive then
            pcall(function()
                local char = LP.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("ClickDetector") and v.Parent and v.Parent.Name == "Bomb" then
                            local dist = (v.Parent.Position - char.HumanoidRootPart.Position).Magnitude
                            if dist < 18 then fireclickdetector(v) end
                        end
                    end
                end
            end)
        end
        task.wait(0.05)
    end
end)

RS.Heartbeat:Connect(function()
    local count = 0
    if LP.Character then
        for _, v in pairs(LP.Character:GetChildren()) do if v.Name == "Bomb" then count = count + 1 end end
    end
    if LP.Backpack then
        for _, v in pairs(LP.Backpack:GetChildren()) do if v.Name == "Bomb" then count = count + 1 end end
    end
    StockLabel.Text = "BOMBS: " .. count
end)

-- STRUCTURE CURSED HAND (PROP 1 - 15)
local HandStructureCFrames = {
    [1]  = CFrame.new(-145.964, 19.687, -55.818, -0.368, 0.414, -0.833, 0.554, -0.622, -0.553, -0.747, -0.665, -0.000),
    [2]  = CFrame.new(-163.327, 8.092, -67.168, -0.846, -0.097, -0.525, 0.070, -0.995, 0.071, -0.529, 0.024, 0.848),
    [3]  = CFrame.new(-161.985, 13.404, -53.289, -0.813, -0.003, 0.582, -0.071, -0.992, -0.104, 0.578, -0.126, 0.806),
    [4]  = CFrame.new(-163.251, 8.050, -55.051, -0.813, -0.003, 0.582, -0.071, -0.992, -0.104, 0.578, -0.126, 0.806),
    [5]  = CFrame.new(-162.274, 13.641, -68.985, -0.846, -0.097, -0.525, 0.070, -0.995, 0.071, -0.529, 0.024, 0.848),
    [6]  = CFrame.new(-166.830, 3.312, -61.035, 0.005, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.005),
    [7]  = CFrame.new(-167.539, 18.017, -60.414, 0.052, 0.693, -0.719, -0.819, 0.442, 0.367, 0.572, 0.570, 0.590),
    [8]  = CFrame.new(-158.477, 24.510, -52.028, -0.364, 0.889, 0.279, -0.931, -0.349, -0.103, 0.006, -0.298, 0.955),
    [9]  = CFrame.new(-139.892, 9.901, -65.447, -0.754, 0.521, -0.400, 0.000, -0.609, -0.793, -0.656, -0.598, 0.459),
    [10] = CFrame.new(-138.665, 7.529, -66.978, -0.734, 0.591, -0.333, 0.000, -0.491, -0.871, -0.679, -0.640, 0.360),
    [11] = CFrame.new(-133.618, 4.108, -67.049, -0.728, 0.269, 0.630, 0.000, 0.920, -0.392, -0.685, -0.286, -0.670),
    [12] = CFrame.new(-134.925, 3.972, -71.094, -0.749, 0.296, 0.592, 0.000, 0.894, -0.448, -0.662, -0.335, -0.670),
    [13] = CFrame.new(-138.866, 4.573, -71.715, -0.764, 0.309, 0.566, -0.000, 0.878, -0.479, -0.645, -0.366, -0.671),
    [14] = CFrame.new(-134.330, 3.772, -68.923, -0.743, 0.215, 0.634, -0.000, 0.947, -0.321, -0.669, -0.238, -0.704),
    [15] = CFrame.new(-136.744, 3.888, -71.669, -0.764, 0.276, 0.583, -0.000, 0.904, -0.427, -0.645, -0.327, -0.691)
}

local centerPoint = HandStructureCFrames[6].Position

local PurplePalette = {
    Color3.fromRGB(45, 0, 75),
    Color3.fromRGB(128, 0, 128),
    Color3.fromRGB(20, 0, 35),
    Color3.fromRGB(75, 10, 100)
}

local lastUpdate = 0
local updateInterval = 1 / 45

-- ROTASI KOREKSI AGAR STRUKTUR MENGHADAP KE BELAKANG KARAKTER
local alignRotation = CFrame.Angles(0, math.rad(90), 0)

-- ENGINE EXECUTION RENDERSTEP
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

    local activeHRP = (matchedTargetPlayer and targetHRP) or myHRP

    -- [STATIC MODE] ตำแหน่งคงที่ข้างหลังตัวละคร ไม่มีการลอย/หมุน (No Float, No Idle Rotation)
    local baseCF = CFrame.new()

    if isFrozen and frozenCFrame then
        baseCF = frozenCFrame
    elseif isFollowing then
        baseCF = activeHRP.CFrame * CFrame.new(0, 1.5, 3.5) * alignRotation
    else
        baseCF = frozenCFrame or (activeHRP.CFrame * CFrame.new(0, 1.5, 3.5) * alignRotation)
    end

    if not isFrozen then
        frozenCFrame = baseCF
    end

    local animOffset = CFrame.new()

    -- ANIMASI ATTACK / PUNCH
    if isAttacking then
        attackProgress = attackProgress + (dt / attackDuration)

        if attackProgress <= 0.35 then
            local p = attackProgress / 0.35
            local easeUp = math.sin(p * (math.pi / 2))
            animOffset = CFrame.new(0, easeUp * 18, -easeUp * 4) * CFrame.Angles(math.rad(easeUp * 45), 0, math.rad(-easeUp * 15))
        elseif attackProgress <= 0.55 then
            local p = (attackProgress - 0.35) / 0.20
            local easeDown = p * p * p
            local currentY = 18 - (easeDown * 26)
            animOffset = CFrame.new(0, currentY, -4 + (easeDown * 10)) * CFrame.Angles(math.rad(45 - (easeDown * 90)), 0, 0)
        elseif attackProgress <= 1.0 then
            local p = (attackProgress - 0.55) / 0.45
            local easeReturn = math.sin(p * (math.pi / 2))
            local shake = (1 - p) * math.sin(p * 30) * 1.5
            animOffset = CFrame.new(shake, -8 * (1 - easeReturn), 6 * (1 - easeReturn)) * CFrame.Angles(math.rad(-45 * (1 - easeReturn)), 0, 0)
        else
            isAttacking = false
            attackProgress = 0
        end
    end

    -- TRANSFORMASI PROPS & EFEK PURPLE WAVE
    for i = 1, math.min(#wingRemoteCache, 15) do
        local prop = wingRemoteCache[i]
        local rawCF = HandStructureCFrames[i]

        if prop and prop.Parent and rawCF then
            local offsetFromCenter = rawCF.Position - centerPoint
            local localRot = rawCF - rawCF.Position

            local targetCF = baseCF * animOffset * CFrame.new(offsetFromCenter) * localRot

            currentCFrames[i] = (currentCFrames[i] or targetCF):Lerp(targetCF, isAttacking and 0.75 or 0.35)

            local colorIndex = math.floor((t * 3 + i) % #PurplePalette) + 1
            local currentColor = PurplePalette[colorIndex]

            if sendToServer then
                task.spawn(function()
                    if prop:FindFirstChild("SetCurrentCFrame") then
                        prop.SetCurrentCFrame:InvokeServer(currentCFrames[i])
                    end
                    if prop:FindFirstChild("ChangePropColor") then
                        prop.ChangePropColor:InvokeServer(currentColor)
                    end
                end)
            end
        end
    end
end)
