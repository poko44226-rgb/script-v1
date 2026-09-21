local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ===================================================
-- COLOR CONFIGURATION
-- ===================================================

local ColorConfig = {
    EnableRainbow = true,
    RainbowSpeed = 3,
    DefaultColor = Color3.fromRGB(20, 20, 28)
}

--==================================================
-- SCREEN GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "Sunkee Mod"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

--==================================================
-- MAIN WINDOW (Shorter)
--==================================================

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(540, 400) -- Shorter height
main.Position = UDim2.new(0.5, -270, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
main.BorderSizePixel = 0
main.Active = true
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(55, 55, 65)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = main

--==================================================
-- TOP BAR WITH CLOSE BUTTON
--==================================================

local topBar = Instance.new("Frame")
topBar.Name = "DragBar"
topBar.Size = UDim2.new(1, 0, 0, 52)
topBar.BackgroundTransparency = 1
topBar.Active = true
topBar.Parent = main

-- Glass effect on top bar
local topBarGlass = Instance.new("Frame")
topBarGlass.Name = "TopBarGlass"
topBarGlass.Size = UDim2.new(1, 0, 1, 0)
topBarGlass.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
topBarGlass.BackgroundTransparency = 0.4
topBarGlass.BorderSizePixel = 0
topBarGlass.Parent = topBar

local topBarGlassCorner = Instance.new("UICorner")
topBarGlassCorner.CornerRadius = UDim.new(0, 18)
topBarGlassCorner.Parent = topBarGlass


local accent = Instance.new("Frame")
accent.Size = UDim2.fromOffset(5, 23)
accent.Position = UDim2.fromOffset(14, 14)
accent.BackgroundColor3 = Color3.fromRGB(145, 90, 255)
accent.BorderSizePixel = 0
accent.Parent = topBar

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accent

local title = Instance.new("TextLabel")
title.Name = "Title"
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(28, 6)
title.Size = UDim2.new(1, -80, 0, 40)
title.Text = "Sunkee Mod"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.TextSize = 17
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

--==================================================
-- CLOSE BUTTON / SHUTDOWN SYSTEM
--==================================================

local systemClosed = false
local systemConnections = {}

-- Keep track of external ScreenGuis created by buttons so they can be
-- cleaned up when Sunkee Mod is shut down. This only targets new
-- top-level ScreenGui instances; it does not touch existing game UI.
local externalGuiRegistry = {}
local initialPlayerGuiChildren = {}

for _, child in ipairs(playerGui:GetChildren()) do
    initialPlayerGuiChildren[child] = true
end

local function captureExternalGuis()
    for _, child in ipairs(playerGui:GetChildren()) do
        if not initialPlayerGuiChildren[child] and child ~= gui and child ~= toggleGui then
            if child:IsA("ScreenGui") then
                externalGuiRegistry[child] = true
            end
        end
    end
end

local function trackConnection(connection)
    table.insert(systemConnections, connection)
    return connection
end

local function shutdownSunkeeMod()
    if systemClosed then return end
    systemClosed = true

    -- Disconnect connections created by this UI
    for _, connection in ipairs(systemConnections) do
        pcall(function() connection:Disconnect() end)
    end

    -- Clean up ScreenGuis created by scripts launched from Sunkee Mod.
    -- External scripts may have their own internal connections, which
    -- cannot be disconnected from here, but their newly-created UI can
    -- be removed when possible.
    for externalGui in pairs(externalGuiRegistry) do
        pcall(function()
            if externalGui and externalGui.Parent then
                externalGui:Destroy()
            end
        end)
    end
    table.clear(externalGuiRegistry)

    -- Remove Sunkee Mod UI and floating icon
    pcall(function() gui:Destroy() end)
    pcall(function() toggleGui:Destroy() end)
end

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.fromOffset(34, 34)
closeBtn.Position = UDim2.new(1, -44, 0, 9)
closeBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 39)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(230, 230, 235)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamMedium
closeBtn.AutoButtonColor = false
closeBtn.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

-- Close button = ask before shutting down the whole system
local confirm = Instance.new("Frame")
confirm.Name = "ShutdownConfirm"
confirm.Size = UDim2.fromOffset(360, 175)
confirm.AnchorPoint = Vector2.new(0.5, 0.5)
confirm.Position = UDim2.fromScale(0.5, 0.5)
confirm.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
confirm.Visible = false
confirm.ZIndex = 1000
confirm.Parent = gui

local confirmCorner = Instance.new("UICorner")
confirmCorner.CornerRadius = UDim.new(0, 12)
confirmCorner.Parent = confirm

local confirmTitle = Instance.new("TextLabel")
confirmTitle.Size = UDim2.new(1, -30, 0, 35)
confirmTitle.Position = UDim2.fromOffset(15, 14)
confirmTitle.BackgroundTransparency = 1
confirmTitle.Text = "ปิดระบบ Sunkee Mod"
confirmTitle.TextColor3 = Color3.fromRGB(240, 240, 245)
confirmTitle.TextSize = 18
confirmTitle.Font = Enum.Font.GothamBold
confirmTitle.ZIndex = 1001
confirmTitle.Parent = confirm

local confirmText = Instance.new("TextLabel")
confirmText.Size = UDim2.new(1, -30, 0, 45)
confirmText.Position = UDim2.fromOffset(15, 52)
confirmText.BackgroundTransparency = 1
confirmText.Text = "ทำการปิดระบบ Sunkee Mod หรือไม่?"
confirmText.TextColor3 = Color3.fromRGB(200, 200, 210)
confirmText.TextSize = 14
confirmText.Font = Enum.Font.Gotham
confirmText.ZIndex = 1001
confirmText.Parent = confirm

local noBtn = Instance.new("TextButton")
noBtn.Size = UDim2.fromOffset(135, 38)
noBtn.Position = UDim2.new(0, 25, 1, -53)
noBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
noBtn.Text = "ไม่"
noBtn.TextColor3 = Color3.fromRGB(235, 235, 240)
noBtn.TextSize = 14
noBtn.Font = Enum.Font.GothamBold
noBtn.ZIndex = 1001
noBtn.Parent = confirm

local yesBtn = noBtn:Clone()
yesBtn.Name = "YesButton"
yesBtn.Position = UDim2.new(1, -160, 1, -53)
yesBtn.BackgroundColor3 = Color3.fromRGB(180, 55, 65)
yesBtn.Text = "ใช่"
yesBtn.Parent = confirm

local noCorner = Instance.new("UICorner")
noCorner.CornerRadius = UDim.new(0, 8)
noCorner.Parent = noBtn
local yesCorner = noCorner:Clone()
yesCorner.Parent = yesBtn

trackConnection(closeBtn.Activated:Connect(function()
    if not systemClosed then
        confirm.Visible = true
    end
end))

trackConnection(noBtn.Activated:Connect(function()
    confirm.Visible = false
end))

trackConnection(yesBtn.Activated:Connect(function()
    shutdownSunkeeMod()
end))

--==================================================
--==================================================
-- FLOATING TOGGLE ICON
--==================================================

local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "SunkeeToggle"
toggleGui.ResetOnSpawn = false
toggleGui.IgnoreGuiInset = true
toggleGui.DisplayOrder = 999
toggleGui.Parent = playerGui

local toggleIcon = Instance.new("ImageButton")
toggleIcon.Name = "ToggleIcon"
toggleIcon.Size = UDim2.fromOffset(55, 55)
toggleIcon.Position = UDim2.new(0, 20, 0.5, -27)

toggleIcon.Image = "rbxassetid://122761370849839"
toggleIcon.ScaleType = Enum.ScaleType.Crop
toggleIcon.BackgroundTransparency = 1
toggleIcon.AutoButtonColor = false
toggleIcon.Active = true
toggleIcon.Parent = toggleGui

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(1, 0)
iconCorner.Parent = toggleIcon

local iconStroke = Instance.new("UIStroke")
iconStroke.Thickness = 2
iconStroke.Transparency = 0.25
iconStroke.Parent = toggleIcon

--==================================================
-- DRAG ICON WITH TOUCH / MOUSE
--==================================================

local dragging = false
local dragStart
local startPos
local moved = false

trackConnection(toggleIcon.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        moved = false
        dragStart = input.Position
        startPos = toggleIcon.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end))

trackConnection(UserInputService.InputChanged:Connect(function(input)
    if not dragging then
        return
    end

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        local delta = input.Position - dragStart

        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end

        toggleIcon.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end))

--==================================================
-- TAP ICON = OPEN / CLOSE MENU
--==================================================

trackConnection(toggleIcon.Activated:Connect(function()
    
    if moved then
        return
    end

    gui.Enabled = not gui.Enabled
end))

--==================================================
-- BUTTON CONTAINER
--==================================================

local container = Instance.new("ScrollingFrame")
container.Name = "Buttons"
container.Size = UDim2.new(1, -24, 1, -64)
container.Position = UDim2.fromOffset(12, 58)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.AutomaticCanvasSize = Enum.AutomaticSize.Y
container.ScrollingDirection = Enum.ScrollingDirection.Y
container.ScrollingEnabled = true
container.Active = true
container.ScrollBarThickness = 5
container.ScrollBarImageTransparency = 0.25
container.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
container.Parent = main

--==================================================
-- 5 COLUMNS × SCROLLABLE ROWS
--==================================================

local layout = Instance.new("UIGridLayout")
layout.Name = "Grid"
layout.CellSize = UDim2.new(1/5, -7, 0, 48)
layout.CellPadding = UDim2.fromOffset(7, 7)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.FillDirectionMaxCells = 5
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = container

--==================================================
-- BUTTON NAMES
--==================================================

local ButtonNames = {
    [1] = "ปีก",
    [2] = "ปีกV2",
    [3] = "ฉลาม",
    [4] = "B-2",
    [5] = "เคียว",
    [6] = "โกะโจ",
    [7] = "วิทเทอร์ รีเวิร์ก",
    [8] = "วิทเทอร์ สตอร์ม",
    [9] = "วิทเทอร์ เฮลสเตเคอร์",
    [10] = "B4 สปิริต",
    [11] = "วิทเทอร์(นิยม)",
    [12] = "วิทเทอร์สตอร์มอะพอคคะลิปส์",
    [13] = "เวริตี้",
    [14] = "ก๊อดซิลล่า",
    [15] = "ทอร์นาโด",
    [16] = "Nothing Panel(mecha)",
    [17] = "ปีกV3",
    [18] = "เอนเดอร์ดราก้อน",
    [19] = "ไซเรนเฮด",
    [20] = "B2 สปิริต(นิยม)",
    [21] = "ไคจู โรแดน",
    [22] = "ดับเบิ้ลแมงมุม",
    [23] = "หอก",
    [24] = "อาณาเขต",
    [25] = "อารามสงฆ์ซ่อนมาร",
    [26] = "scmd prop(key xiandi)",
    [27] = "Avarice prop",
    [28] = "Eryx (key:ErYxOnToP",
    [29] = "มือยักษ์",
    [30] = "ส่งฮอลล์คูลไป",
    [31] = "ซูซาโนะโอะ(โหลดต่ำ)",
    [32] = "ซูซาโนะโอะ(โหลดสูง)",
    [33] = "มือเงา",
    [34] = "วาร์ปหาตู้เซฟ",
    [35] = "อุปกรณ์ประกอบฉากศิลปะ",
    [36] = "มโหรากา",
    [37] = "เทเลแกรม"
}

--==================================================
-- CREATE BUTTONS
--==================================================

for i = 1, 37 do
    local button = Instance.new("TextButton")
    button.Name = "Button" .. i
    button.LayoutOrder = i
    button.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    button.BackgroundTransparency = 0.2
    button.BorderSizePixel = 0
    button.Text = ButtonNames[i] or "Button " .. i
    button.TextColor3 = Color3.fromRGB(235, 235, 240)
    button.TextSize = 9
    button.Font = Enum.Font.GothamMedium
    button.TextWrapped = true
    button.AutoButtonColor = false
    button.Parent = container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 13)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(48, 48, 58)
    stroke.Thickness = 1
    stroke.Transparency = 0.25
    stroke.Parent = button

    -- Glass effect
    local glassEffect = Instance.new("Frame")
    glassEffect.Name = "GlassEffect"
    glassEffect.Size = UDim2.new(1, 0, 1, 0)
    glassEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glassEffect.BackgroundTransparency = 0.9
    glassEffect.BorderSizePixel = 0
    glassEffect.Visible = false
    glassEffect.Parent = button
    
    local glassCorner = Instance.new("UICorner")
    glassCorner.CornerRadius = UDim.new(0, 13)
    glassCorner.Parent = glassEffect

    button.Activated:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.08),
            {
                BackgroundColor3 = Color3.fromRGB(55, 45, 70),
                BackgroundTransparency = 0.1
            }
        ):Play()

        task.delay(0.12, function()
            if button.Parent then
                TweenService:Create(
                    button,
                    TweenInfo.new(0.12),
                    {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 35),
                        BackgroundTransparency = 0.2
                    }
                ):Play()
            end
        end)
    end)
    
    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {
                BackgroundTransparency = 0.05,
                BackgroundColor3 = Color3.fromRGB(40, 35, 50)
            }
        ):Play()
        if glassEffect then
            glassEffect.Visible = true
            TweenService:Create(
                glassEffect,
                TweenInfo.new(0.15),
                {
                    BackgroundTransparency = 0.85
                }
            ):Play()
        end
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {
                BackgroundTransparency = 0.2,
                BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            }
        ):Play()
        if glassEffect then
            TweenService:Create(
                glassEffect,
                TweenInfo.new(0.15),
                {
                    BackgroundTransparency = 0.9
                }
            ):Play()
            task.delay(0.15, function()
                if glassEffect then
                    glassEffect.Visible = false
                end
            end)
        end
    end)
end

--==================================================
-- MOBILE + PC DRAG SYSTEM (FULLY WORKING)
--==================================================

local dragging = false
local dragStart
local startPosition
local dragObject = topBar -- Make the whole top bar draggable

-- For mobile touch drag
local function handleDragStart(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
        
        -- Visual feedback
        TweenService:Create(
            mainStroke,
            TweenInfo.new(0.2),
            {Transparency = 0.6}
        ):Play()
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                TweenService:Create(
                    mainStroke,
                    TweenInfo.new(0.2),
                    {Transparency = 0.3}
                ):Play()
            end
        end)
    end
end

-- For mobile and PC drag movement
local function handleDragMove(input)
    if not dragging then return end
    
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        
        local delta = input.Position - dragStart
        main.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end

-- Connect drag events
dragObject.InputBegan:Connect(handleDragStart)
UserInputService.InputChanged:Connect(handleDragMove)

-- Also add touch support to the entire main frame for easier dragging on mobile
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        -- Check if touch started on a button (don't drag if clicking a button)
        local target = input.Position
        local buttonPressed = false
        for _, button in pairs(container:GetChildren()) do
            if button:IsA("TextButton") then
                local absolutePos = button.AbsolutePosition
                local absoluteSize = button.AbsoluteSize
                if target.X >= absolutePos.X and target.X <= absolutePos.X + absoluteSize.X
                    and target.Y >= absolutePos.Y and target.Y <= absolutePos.Y + absoluteSize.Y then
                    buttonPressed = true
                    break
                end
            end
        end
        if not buttonPressed then
            handleDragStart(input)
        end
    end
end)

--==================================================
-- BUTTON FUNCTIONS (30 functions)
--==================================================

local function Button1()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%9B%E0%B8%81%E0%B8%9B%E0%B8%B4%E0%B8%94Prop.Wing.lua"))()
end

local function Button2()
    loadstring(game:HttpGet("https://pastefy.app/IJHHtWR6/raw"))()
end

local function Button3()
    loadstring(game:HttpGet("https://pastefy.app/thWRWou1/raw"))()
end

local function Button4()
    loadstring(game:HttpGet("https://pastefy.app/b0JRIsKj/raw"))()
end

local function Button5()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B9%80%E0%B8%84%E0%B8%B5%E0%B8%A2%E0%B8%A7.lua"))()
end

local function Button6()
    loadstring(game:HttpGet("https://pastefy.app/3MShESQ2/raw"))()
end

local function Button7()
    loadstring(game:HttpGet("https://pastefy.app/q4Js0TjY/raw"))()
end

local function Button8()
    loadstring(game:HttpGet("https://pastefy.app/5NOFcoUP/raw"))()
end

local function Button9()
    loadstring(game:HttpGet("https://pastefy.app/6jvLhYaS/raw"))()
end

local function Button10()
    loadstring(game:HttpGet("https://pastefy.app/we9aonad/raw"))()
end

local function Button11()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%A7%E0%B8%B4%E0%B8%99%E0%B9%80%E0%B8%97%E0%B8%AD%E0%B8%A3%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88%E0%B8%A3%E0%B8%B9%E0%B8%9B.lua"))()
end

local function Button12()
    loadstring(game:HttpGet("https://pastefy.app/r4nWQYzg/raw"))()
end

local function Button13()
    loadstring(game:HttpGet("https://pastefy.app/x1BOck3z/raw"))()
end

local function Button14()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Johan319/Fe-Godzilla-Obfuscator/refs/heads/main/godzilla"))()
end

local function Button15()
    loadstring(game:HttpGet("https://pastebin.com/raw/Ezfa3188", true))()
end

local function Button16()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Nothing-Panel-223707"))()
end

local function Button17()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%9B%E0%B8%B5%E0%B8%81%E0%B8%AA%E0%B8%B5%E0%B8%AA%E0%B8%A1%E0%B8%9A%E0%B8%B9%E0%B8%A3%E0%B8%93%E0%B9%8C.lua"))()
end

local function Button18()
    loadstring(game:HttpGet("https://pastefy.app/knN2ER4f/raw"))()
end

local function Button19()
    loadstring(game:HttpGet("https://pastefy.app/lXwhhrxw/raw"))()
end

local function Button20()
    loadstring(game:HttpGet("https://pastefy.app/J35BTsjO/raw"))()
end

local function Button21()
    loadstring(game:HttpGet("https://pastefy.app/MeSs5ehk/raw"))()
end

local function Button22()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Engine-spider-props-use-sit-props-243775"))()
end

local function Button23()
    loadstring(game:HttpGet("https://pastefy.app/pDY43Jvl/raw"))()
end

local function Button24()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%81%E0%B8%B2%E0%B8%87%E0%B8%AD%E0%B8%B2%E0%B8%93%E0%B8%B2%E0%B9%80%E0%B8%82%E0%B8%95%E0%B8%A7%E0%B8%B52_%E0%B9%81%E0%B8%81%E0%B9%89%E0%B8%95%E0%B8%B2%E0%B8%A1%E0%B8%8A%E0%B9%89%E0%B8%B2.lua"))()
end

-- Button 25: New script
local function Button25()
    loadstring(game:HttpGet("https://pastefy.app/XvOVpQB0/raw"))()
end

local function Button26()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Wings-cmback-use-prop-Brookhaven-key-xiandi-211092"))()
end

local function Button27()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-AVARICE-WINGS-BY-NIZAM-217994"))()
end

local function Button28()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ErYx-Prop-Animations-by-vansh-238691"))()
end

local function Button29()
    loadstring(game:HttpGet("https://pastefy.app/TJCP8mXQ/raw"))()
end

local function Button30()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/blast_cannon_fixed.lua"))()
end
    
local function Button31()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%8B%E0%B8%B9%E0%B8%8B%E0%B8%B5%E0%B8%AA%E0%B8%A1%E0%B8%9A%E0%B8%B9%E0%B8%A3%E0%B8%93%E0%B9%8C_%E0%B9%81%E0%B8%81%E0%B9%89%E0%B8%9B%E0%B8%B4%E0%B8%87_%E0%B8%AA%E0%B8%B5%E0%B8%95%E0%B8%B4%E0%B8%94_12%E0%B8%AA%E0%B8%B5.lua"))()
end

local function Button32()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%8B%E0%B8%B9%E0%B8%8B%E0%B8%B2%E0%B9%81%E0%B8%94%E0%B8%87%E0%B9%82%E0%B8%AB%E0%B8%94_12%E0%B8%AA%E0%B8%B5_%E0%B9%84%E0%B8%A5%E0%B9%88%E0%B8%AA%E0%B8%B52%E0%B9%82%E0%B8%97%E0%B8%99.lua"))()
end

local function Button33()
    loadstring(game:HttpGet("https://pastefy.app/02vMU3Wb/raw"))()
end

local function Button34()
    loadstring(game:HttpGet("https://pastefy.app/tlcwFTDr/raw"))()
end

local function Button35()
    loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/OFEv5ZdInBuUSRL4/raw"))()
end

local function Button36()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/poko44226-rgb/script-v1/refs/heads/main/%E0%B8%A1%E0%B9%82%E0%B8%AB%E0%B8%A3%E0%B8%B2%E0%B8%81%E0%B8%B2.lua"))()
end


-- Button 32: Telegram link 
local function Button37()
    local link = "t.me/Ansanthia"
    
    -- Try to copy to clipboard
    if setclipboard then
        setclipboard(link)
        -- Notify the user
        local notification = Instance.new("TextLabel")
        notification.Name = "CopyNotification"
        notification.Size = UDim2.fromOffset(200, 40)
        notification.Position = UDim2.new(0.5, -100, 0.5, -20)
        notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        notification.BackgroundTransparency = 0.1
        notification.Text = "คัดลอกลิงค์สำเร็จ!"
        notification.TextColor3 = Color3.fromRGB(145, 90, 255)
        notification.TextSize = 14
        notification.Font = Enum.Font.GothamBold
        notification.ZIndex = 999
        notification.Parent = main
        
        local notificationCorner = Instance.new("UICorner")
        notificationCorner.CornerRadius = UDim.new(0, 8)
        notificationCorner.Parent = notification
        
        -- Animate in
        notification.BackgroundTransparency = 1
        TweenService:Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.2}
        ):Play()
        
        -- Remove after 2 seconds
        task.wait(2)
        TweenService:Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {BackgroundTransparency = 1}
        ):Play()
        task.wait(0.3)
        notification:Destroy()
    else
        -- Fallback: Open in browser if clipboard not available
        if syn and syn.request then
            syn.request({
                Url = link,
                Method = "GET"
            })
        end
    end
end

--==================================================
-- CONNECT FUNCTIONS
--==================================================

local ButtonFunctions = {
    Button1, Button2, Button3, Button4, Button5,
    Button6, Button7, Button8, Button9, Button10,
    Button11, Button12, Button13, Button14, Button15,
    Button16, Button17, Button18, Button19, Button20,
    Button21, Button22, Button23, Button24, Button25,
    Button26, Button27, Button28, Button29, Button30,
    Button31, Button32, Button33, Button34, Button35,
    Button36, Button37,
}

for i = 1, 37 do
    local button = container:FindFirstChild("Button" .. i)
    if button then
        button.Activated:Connect(function()
            local func = ButtonFunctions[i]
            if func then
                func()
                -- Register any new top-level ScreenGui created by the
                -- external script so shutdown can clean it up later.
                task.defer(captureExternalGuis)
            end
        end)
    end
end

--==================================================
-- HOTKEY TO TOGGLE GUI
--==================================================

trackConnection(UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        if not systemClosed then
            gui.Enabled = not gui.Enabled
        end
    end
end))

print("Sunkee Mod Loaded Successfully! (30 Buttons - 6x5 Grid)")
print("Press Right Shift to toggle GUI")
print("Button 30 copies Discord link to clipboard!")