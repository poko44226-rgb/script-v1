--deobfuscated by @Watup-Exploitz | discord.gg/EgbzrBqur2
--merged: True Shadow Theme System + Color Picker (from Prop.lua)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- [[ GLOBAL VARIABLES ]] --
local targetPlayer = LP
local activeTargeting, petMode, deathPenalty, canDismantle = false, false, false, true
local remoteCache, wingRemoteCache = {}, {}
local currentIdx, colorIndex, colorTimer = 1, 1, 0

-- [[ REST SYSTEM (ADVANCED) ]] --
local lastSendTick = 0
local sendThreshold = 1/40
local networkSafe = true

-- ==================== THEME SYSTEM (จาก Prop.lua) ====================
local currentTheme = "GOLD"

local COLOR_THEMES = {
    {Name = "GOLD",    Main = Color3.fromRGB(255, 215, 0)},
    {Name = "RED",     Main = Color3.fromRGB(255, 0, 0)},
    {Name = "ORANGE",  Main = Color3.fromRGB(255, 120, 0)},
    {Name = "YELLOW",  Main = Color3.fromRGB(255, 255, 0)},
    {Name = "LIME",    Main = Color3.fromRGB(130, 255, 0)},
    {Name = "GREEN",   Main = Color3.fromRGB(0, 255, 0)},
    {Name = "CYAN",    Main = Color3.fromRGB(0, 255, 255)},
    {Name = "BLUE",    Main = Color3.fromRGB(0, 140, 255)},
    {Name = "PURPLE",  Main = Color3.fromRGB(170, 0, 255)},
    {Name = "MAGENTA", Main = Color3.fromRGB(255, 0, 220)},
    {Name = "PINK",    Main = Color3.fromRGB(255, 0, 160)},
    {Name = "SILVER",  Main = Color3.fromRGB(215, 215, 225)},
}

-- [[ ไล่สีอัตโนมัติ: สีไหนก็ได้สีอ่อน/สีเข้มของมันเอง ]] --
-- Base = สีหลักผสมขาว 65% (เช่น ทอง -> ทองอ่อน, แดง -> แดงอ่อน)
-- Deep = สีหลักผสมดำ 55% (โทนเข้ม)
for _, theme in ipairs(COLOR_THEMES) do
    theme.Base = theme.Main:Lerp(Color3.new(1, 1, 1), 0.65)
    theme.Deep = theme.Main:Lerp(Color3.new(0, 0, 0), 0.55)
end,
}

local THEMES = {}
for _, theme in ipairs(COLOR_THEMES) do
    THEMES[theme.Name] = theme
end

local function getCol(key)
    return THEMES[currentTheme][key]
end

-- สีปีก: อ่านจากธีมปัจจุบันทุกครั้ง เปลี่ยนธีมแล้วปีกเปลี่ยนทันที
local function getAbyssColor(t, offset)
    local cycle = (t * 0.35 + (offset * 0.1)) % 1
    if cycle < 0.5 then
        return getCol("Base"):Lerp(getCol("Main"), cycle * 2)
    else
        return getCol("Main"):Lerp(getCol("Deep"), (cycle - 0.5) * 2)
    end
end
-- =======================================================================

-- [[ UI CONSTRUCTION ]] --
local Gui = Instance.new("ScreenGui", gethui())
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 220, 0, 320)
Main.Position = UDim2.new(0.5, -110, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true

local MainGrad = Instance.new("UIGradient", Main)
local function updateMainGradient()
    MainGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, getCol("Base")),
        ColorSequenceKeypoint.new(0.5, getCol("Main")),
        ColorSequenceKeypoint.new(1, getCol("Deep"))
    })
end
updateMainGradient()

task.spawn(function()
    while true do
        local t = TweenService:Create(MainGrad, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
        t:Play()
        task.wait(2)
        MainGrad.Offset = Vector2.new(-1, 0)
    end
end)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "True ShadowPytarion | THEMES"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.PermanentMarker
Title.TextSize = 18
Title.ZIndex = 2
Title.TextStrokeColor3 = getCol("Deep")
Title.TextStrokeTransparency = 0.2

local MinBtn = Instance.new("TextButton", Main)
MinBtn.Size = UDim2.new(0, 25, 0, 25)
MinBtn.Position = UDim2.new(1, -30, 0, 10)
MinBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.ZIndex = 3
Instance.new("UICorner", MinBtn)

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, 0, 1, -45)
Content.Position = UDim2.new(0, 0, 0, 45)
Content.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Content)
UIList.Padding = UDim.new(0, 5)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createBtn(name)
    local b = Instance.new("TextButton", Content)
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", b)
    return b
end

local Box = Instance.new("TextBox", Content)
Box.Size = UDim2.new(0.9, 0, 0, 30)
Box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Box.PlaceholderText = "Target Username"
Box.Text = LP.DisplayName
Box.TextColor3 = Color3.new(1, 1, 1)
Box.ClearTextOnFocus = false
Instance.new("UICorner", Box)

local TargetBtn = createBtn("ACTIVATE CONTROL")
local PetBtn = createBtn("SUMMON ABYSS WINGS")
local DismantleBtn = createBtn("GET DISMANTLE")
local PenaltyBtn = createBtn("PENALTY: OFF")
local ColorBtn = createBtn("COLOR: GOLD")

-- อัปเดตสีทั้ง UI ตามธีมปัจจุบัน
local function applyTheme()
    updateMainGradient()
    Title.TextStrokeColor3 = getCol("Deep")
    ColorBtn.Text = "COLOR: " .. currentTheme
    TargetBtn.BackgroundColor3 = activeTargeting and getCol("Base") or Color3.fromRGB(0, 0, 0)
    PetBtn.BackgroundColor3 = petMode and getCol("Base") or Color3.fromRGB(0, 0, 0)
end

-- ==================== COLOR PICKER (standalone ลอยได้) ====================
local colorPickerOpen = false

local ColorPickerGui = Instance.new("ScreenGui")
ColorPickerGui.Name = "TrueShadow_ColorPicker"
ColorPickerGui.DisplayOrder = 999
ColorPickerGui.IgnoreGuiInset = true
ColorPickerGui.Enabled = false
ColorPickerGui.ResetOnSpawn = false
ColorPickerGui.Parent = gethui()

local ColorPickerFrame = Instance.new("Frame")
ColorPickerFrame.Name = "ColorPicker"
ColorPickerFrame.Size = UDim2.fromOffset(220, 205)
ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ColorPickerFrame.BorderSizePixel = 0
ColorPickerFrame.Active = true
ColorPickerFrame.Draggable = true
ColorPickerFrame.ClipsDescendants = true
ColorPickerFrame.Parent = ColorPickerGui
Instance.new("UICorner", ColorPickerFrame).CornerRadius = UDim.new(0, 10)

local pickerTitle = Instance.new("TextLabel", ColorPickerFrame)
pickerTitle.Size = UDim2.new(1, -45, 0, 30)
pickerTitle.Position = UDim2.fromOffset(10, 7)
pickerTitle.Text = "SELECT COLOR"
pickerTitle.TextColor3 = Color3.new(1, 1, 1)
pickerTitle.Font = Enum.Font.GothamBold
pickerTitle.TextSize = 13
pickerTitle.BackgroundTransparency = 1
pickerTitle.TextXAlignment = Enum.TextXAlignment.Left

local closePicker = Instance.new("TextButton", ColorPickerFrame)
closePicker.Size = UDim2.fromOffset(26, 26)
closePicker.Position = UDim2.new(1, -34, 0, 8)
closePicker.Text = "X"
closePicker.TextColor3 = Color3.new(1, 1, 1)
closePicker.Font = Enum.Font.GothamBold
closePicker.TextSize = 12
closePicker.BackgroundColor3 = Color3.fromRGB(70, 20, 20)
Instance.new("UICorner", closePicker).CornerRadius = UDim.new(0, 6)

local colorContainer = Instance.new("Frame", ColorPickerFrame)
colorContainer.Size = UDim2.new(1, -16, 1, -44)
colorContainer.Position = UDim2.fromOffset(8, 40)
colorContainer.BackgroundTransparency = 1

local gridLayout = Instance.new("UIGridLayout", colorContainer)
gridLayout.CellSize = UDim2.fromOffset(45, 36)
gridLayout.CellPadding = UDim2.fromOffset(5, 5)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local function setColorPickerVisible(visible)
    colorPickerOpen = visible
    ColorPickerGui.Enabled = visible
    if visible then
        local camera = Workspace.CurrentCamera
        local viewport = camera and camera.ViewportSize or Vector2.new(800, 600)
        local pickerW, pickerH, gap = 220, 205, 10
        local mainPos = Main.AbsolutePosition
        local mainSize = Main.AbsoluteSize
        local x = mainPos.X + mainSize.X + gap
        local y = mainPos.Y
        if x + pickerW > viewport.X - 8 then x = mainPos.X - pickerW - gap end
        if x < 8 then x = 8 end
        if y + pickerH > viewport.Y - 8 then y = math.max(8, viewport.Y - pickerH - 8) end
        ColorPickerFrame.Position = UDim2.fromOffset(x, y)
    end
end

for index, theme in ipairs(COLOR_THEMES) do
    local colorBtn = Instance.new("TextButton", colorContainer)
    colorBtn.LayoutOrder = index
    colorBtn.BackgroundColor3 = theme.Main
    colorBtn.Text = ""
    Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 7)

    -- ปุ่มแสดงสีไล่ อ่อน -> หลัก -> เข้ม
    local btnGrad = Instance.new("UIGradient", colorBtn)
    btnGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, theme.Base),
        ColorSequenceKeypoint.new(0.5, theme.Main),
        ColorSequenceKeypoint.new(1, theme.Deep)
    })

    local stroke = Instance.new("UIStroke", colorBtn)
    stroke.Color = Color3.new(1, 1, 1)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.4

    local nameLabel = Instance.new("TextLabel", colorBtn)
    nameLabel.Size = UDim2.new(1, 0, 0, 15)
    nameLabel.Position = UDim2.new(0, 0, 1, -15)
    nameLabel.BackgroundTransparency = 0.25
    nameLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    nameLabel.Text = theme.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 8
    nameLabel.BorderSizePixel = 0

    colorBtn.Activated:Connect(function()
        currentTheme = theme.Name
        applyTheme()
    end)
end

closePicker.Activated:Connect(function()
    setColorPickerVisible(false)
end)
-- =======================================================================

-- [[ FUNCTIONS ]] --

local function updateRemotes()
    local temp = {}
    pcall(function()
        local wsCom = Workspace:FindFirstChild("WorkspaceCom")
        if wsCom then
            for _, folder in pairs(wsCom:GetChildren()) do
                for _, p in pairs(folder:GetChildren()) do
                    if p:FindFirstChild("SetCurrentCFrame") then table.insert(temp, p.SetCurrentCFrame) end
                end
            end
        end
    end)
    remoteCache = temp
end

local function getWingRemotes()
    local temp = {}
    pcall(function()
        local folder = Workspace:FindFirstChild("WorkspaceCom") and Workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
        if folder then
            for _, p in pairs(folder:GetChildren()) do
                -- plain find: กัน error เมื่อชื่อมีอักขระพิเศษ
                if p.Name:find("Prop" .. LP.Name, 1, true) and p:FindFirstChild("SetCurrentCFrame") then
                    table.insert(temp, p)
                end
            end
        end
    end)
    wingRemoteCache = temp
end

local function safeInvoke(remote, cf)
    if not networkSafe then return end
    task.spawn(function()
        local success = pcall(function()
            remote:InvokeServer(cf)
        end)
        if not success then networkSafe = false task.wait(1) networkSafe = true end
    end)
end

local function moveAndColorProp(index, targetCF)
    local prop = wingRemoteCache[index]
    if not prop then return end

    pcall(function()
        if prop:FindFirstChildOfClass("Seat") and prop:FindFirstChildOfClass("Seat").Occupant then
            targetCF = targetCF * CFrame.new(0, 15, 0) * CFrame.Angles(math.random(), 0, math.random())
        end
    end)

    safeInvoke(prop.SetCurrentCFrame, targetCF)

    if tick() - colorTimer > 0.08 and index == colorIndex then
        local colRemote = prop:FindFirstChild("ChangePropColor")
        if colRemote then safeInvoke(colRemote, getAbyssColor(tick(), index)) end
        colorIndex = (colorIndex % #wingRemoteCache) + 1
        colorTimer = tick()
    end
end

-- รีเฟรช cache อัตโนมัติ กัน prop หาย/ถูก dismantle แล้วปีกค้าง
task.spawn(function()
    while true do
        task.wait(3)
        if petMode then getWingRemotes() end
        if activeTargeting then updateRemotes() end
    end
end)

-- [[ CORE LOOPS ]] --

RunService.Heartbeat:Connect(function()
    local currentTime = tick()
    if currentTime - lastSendTick < sendThreshold then return end
    lastSendTick = currentTime

    if not targetPlayer or not targetPlayer.Character then return end
    local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if petMode and #wingRemoteCache > 0 then
        local totalProps = #wingRemoteCache
        local half = math.ceil(totalProps / 2)
        local speed = root.AssemblyLinearVelocity.Magnitude
        local pPos = root.CFrame + (root.AssemblyLinearVelocity * 0.12)
        local flapFreq = speed > 2 and 14 or 4
        local globalFlap = math.sin(tick() * flapFreq) * 1.2

        for i = 1, totalProps do
            local isRight = i > half
            local sideIdx = isRight and (i - half) or i
            local sideMult = isRight and 1 or -1
            local spacing = 1.5
            local spreadX = (2 + (sideIdx * spacing)) * sideMult
            local heightY = 2.5 + (sideIdx * 0.75)
            local currentFlap = globalFlap * (-0.15 + (sideIdx * 1))
            local targetCF = pPos * CFrame.new(spreadX, heightY + currentFlap, 0.95)
                             * CFrame.Angles(math.rad(-15), math.rad(sideMult * 5), math.rad(sideMult * (15 + (sideIdx * 18) + (currentFlap * 8))))
            moveAndColorProp(i, targetCF)
        end
    end

    if activeTargeting and #remoteCache > 0 then
        local remote = remoteCache[currentIdx]
        if remote then
            local targetCF = deathPenalty and (root.CFrame * CFrame.new(math.random(-5,5), math.random(-2,2), math.random(-5,5)) * CFrame.Angles(math.random(0,360), math.random(0,360), math.random(0,360))) or (root.CFrame * CFrame.new(0, -3, -15))
            safeInvoke(remote, targetCF)
        end
        currentIdx = (currentIdx % #remoteCache) + 1
    end
end)

-- [[ UI EVENTS ]] --

MinBtn.MouseButton1Click:Connect(function()
    local isMin = Main.Size.Y.Offset < 100
    TweenService:Create(Main, TweenInfo.new(0.3), {Size = isMin and UDim2.new(0, 220, 0, 320) or UDim2.new(0, 220, 0, 45)}):Play()
    Content.Visible = isMin
    MinBtn.Text = isMin and "-" or "+"
end)

PetBtn.MouseButton1Click:Connect(function()
    petMode = not petMode
    PetBtn.Text = petMode and "STOP ABYSS" or "SUMMON ABYSS WINGS"
    applyTheme()
    if petMode then getWingRemotes() end
end)

TargetBtn.MouseButton1Click:Connect(function()
    activeTargeting = not activeTargeting
    TargetBtn.Text = activeTargeting and "STOP CONTROL" or "ACTIVATE CONTROL"
    applyTheme()
    if activeTargeting then updateRemotes() end
end)

ColorBtn.MouseButton1Click:Connect(function()
    setColorPickerVisible(not colorPickerOpen)
end)

PenaltyBtn.MouseButton1Click:Connect(function()
    deathPenalty = not deathPenalty
    PenaltyBtn.Text = deathPenalty and "PENALTY: ON" or "PENALTY: OFF"
    PenaltyBtn.TextColor3 = deathPenalty and Color3.fromRGB(255, 0, 0) or Color3.new(1, 1, 1)
end)

DismantleBtn.MouseButton1Click:Connect(function()
    if not canDismantle then return end
    canDismantle = false
    updateRemotes()

    local root = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root and #remoteCache >= 25 then
        -- BRUTAL X-SLASH 25 PROPS
        for i = 1, 25 do
            local remote = remoteCache[i]
            local offset = i - 13
            task.spawn(function()
                for step = 1, 3 do
                    local isLine1 = i <= 13
                    local slashCF
                    if isLine1 then
                        slashCF = root.CFrame * CFrame.new(offset * 1.5, offset * 1.5, -5 - (step*2)) * CFrame.Angles(0, 0, math.rad(45))
                    else
                        local offset2 = i - 19
                        slashCF = root.CFrame * CFrame.new(offset2 * 1.5, -offset2 * 1.5, -5 - (step*2)) * CFrame.Angles(0, 0, math.rad(-45))
                    end
                    pcall(function() remote:InvokeServer(slashCF) end)
                    task.wait(0.05)
                end
            end)
        end
    end

    task.wait(1)
    canDismantle = true
end)

Box.FocusLost:Connect(function(enter)
    if enter then
        local query = Box.Text:lower()
        if query == "" then return end -- กันเว้นว่างแล้ว match ทุกคน
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and (p.Name:lower():find(query, 1, true) or p.DisplayName:lower():find(query, 1, true)) then
                targetPlayer = p
                Box.Text = p.DisplayName
                break
            end
        end
    end
end)
