--==================================================
-- PROP HUB V3
-- 30 BUTTONS / 6 ROWS / 5 COLUMNS
-- WITH WORKING DECAL BACKGROUND & MOBILE DRAG
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--==================================================
-- PERMANENT NAMETAG: ONLY FOR c00lful
--==================================================

local function createNametag()
    -- ✅ EXCLUSIVITY CHECK: Only create if the player is "c00lful"
    if player.Name ~= "c00lful" then
        return  -- no nametag for anyone else
    end

    local character = player.Character
    if not character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end

    -- Remove any existing tag to avoid duplicates
    local existing = head:FindFirstChild("OwnerTag")
    if existing then existing:Destroy() end

    -- BillboardGui
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "OwnerTag"
    billboard.Size = UDim2.new(0, 220, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    -- TextLabel
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "c00lful OWNER"   -- hardcoded to your name
    label.TextColor3 = Color3.fromRGB(255, 200, 50)
    label.TextStrokeTransparency = 0.3
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextSize = 18
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.TextWrapped = true
    label.Parent = billboard
end

-- Create tag when player spawns
local function onCharacterAdded(character)
    character:WaitForChild("Head", 5)
    createNametag()
end

-- If character already exists, create it now
if player.Character then
    createNametag()
end

-- Listen for respawns
player.CharacterAdded:Connect(onCharacterAdded)

--==================================================
-- DECAL CONFIGURATION
--==================================================

local DecalConfig = {
    ImageId = "rbxassetid://79148306484407", -- Replace with your decal ID
    Transparency = 0.75,
}

--==================================================
-- SCREEN GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "Prop Hub V3"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

--==================================================
-- MAIN WINDOW
--==================================================

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(540, 400)
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
-- DECAL BACKGROUND
--==================================================

local decalContainer = Instance.new("Frame")
decalContainer.Name = "DecalContainer"
decalContainer.Size = UDim2.new(1, 0, 1, 0)
decalContainer.BackgroundTransparency = 1
decalContainer.Parent = main

local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Name = "BackgroundImage"
backgroundImage.Size = UDim2.new(1, 0, 1, 0)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Image = DecalConfig.ImageId
backgroundImage.ImageTransparency = DecalConfig.Transparency
backgroundImage.ScaleType = Enum.ScaleType.Stretch
backgroundImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
backgroundImage.Parent = decalContainer

local darkOverlay = Instance.new("Frame")
darkOverlay.Name = "DarkOverlay"
darkOverlay.Size = UDim2.new(1, 0, 1, 0)
darkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
darkOverlay.BackgroundTransparency = 0.6
darkOverlay.BorderSizePixel = 0
darkOverlay.Parent = decalContainer

local gradientOverlay = Instance.new("Frame")
gradientOverlay.Name = "GradientOverlay"
gradientOverlay.Size = UDim2.new(1, 0, 1, 0)
gradientOverlay.BackgroundTransparency = 1
gradientOverlay.BorderSizePixel = 0
gradientOverlay.Parent = decalContainer

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 10, 40))
})
gradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.85),
    NumberSequenceKeypoint.new(0.5, 0.3),
    NumberSequenceKeypoint.new(1, 0.85)
})
gradient.Rotation = 45
gradient.Parent = gradientOverlay

task.spawn(function()
    task.wait(2)
    if backgroundImage.Image == "" or backgroundImage.Image == "rbxassetid://" then
        backgroundImage.Visible = false
        local fallbackFrame = Instance.new("Frame")
        fallbackFrame.Name = "FallbackBackground"
        fallbackFrame.Size = UDim2.new(1, 0, 1, 0)
        fallbackFrame.BackgroundTransparency = 1
        fallbackFrame.Parent = decalContainer
        local fallbackGradient = Instance.new("UIGradient")
        fallbackGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 20, 50)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 10, 40)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 20, 60))
        })
        fallbackGradient.Rotation = 135
        fallbackGradient.Parent = fallbackFrame
    end
end)

function SetDecalImage(imageId, transparency)
    if backgroundImage then
        if not string.match(imageId, "^rbxassetid://") and not string.match(imageId, "^https://") then
            imageId = "rbxassetid://" .. imageId
        end
        backgroundImage.Image = imageId
        if transparency then
            backgroundImage.ImageTransparency = transparency
        end
        backgroundImage.Visible = true
    end
end

--==================================================
-- TOP BAR
--==================================================

local topBar = Instance.new("Frame")
topBar.Name = "DragBar"
topBar.Size = UDim2.new(1, 0, 0, 52)
topBar.BackgroundTransparency = 1
topBar.Active = true
topBar.Parent = main

local topBarGlass = Instance.new("Frame")
topBarGlass.Name = "TopBarGlass"
topBarGlass.Size = UDim2.new(1, 0, 1, 0)
topBarGlass.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
topBarGlass.BackgroundTransparency = 0.4
topBarGlass.BorderSizePixel = 0
topBarGlass.Parent = topBar

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
title.Text = "PROP HUB V3"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.TextSize = 17
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

--==================================================
-- CLOSE BUTTON
--==================================================

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.fromOffset(34, 34)
closeBtn.Position = UDim2.new(1, -44, 0, 9)
closeBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 39)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(230, 230, 235)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamMedium
closeBtn.AutoButtonColor = false
closeBtn.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

closeBtn.Activated:Connect(function()
    gui.Enabled = false
    TweenService:Create(
        main,
        TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Size = UDim2.fromOffset(0, 0)}
    ):Play()
    task.wait(0.2)
    main.Size = UDim2.fromOffset(540, 400)
end)

--==================================================
-- OPEN BUTTON
--==================================================

local openBtn = Instance.new("TextButton")
openBtn.Name = "OpenButton"
openBtn.Size = UDim2.fromOffset(120, 45)
openBtn.Position = UDim2.new(0.5, -60, 0.5, 200)
openBtn.BackgroundColor3 = Color3.fromRGB(145, 90, 255)
openBtn.Text = "OPEN PROP HUB"
openBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openBtn.TextSize = 14
openBtn.Font = Enum.Font.GothamBold
openBtn.AutoButtonColor = false
openBtn.Visible = false
openBtn.Parent = gui

local openCorner = Instance.new("UICorner")
openCorner.CornerRadius = UDim.new(0, 12)
openCorner.Parent = openBtn

local openStroke = Instance.new("UIStroke")
openStroke.Color = Color3.fromRGB(180, 130, 255)
openStroke.Thickness = 2
openStroke.Transparency = 0.5
openStroke.Parent = openBtn

openBtn.Activated:Connect(function()
    gui.Enabled = true
    openBtn.Visible = false
    TweenService:Create(
        main,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.fromOffset(540, 400)}
    ):Play()
end)

gui:GetPropertyChangedSignal("Enabled"):Connect(function()
    if not gui.Enabled then
        openBtn.Visible = true
    else
        openBtn.Visible = false
    end
end)

--==================================================
-- BUTTON CONTAINER
--==================================================

local container = Instance.new("ScrollingFrame")
container.Name = "Buttons"
container.Size = UDim2.new(1, -24, 1, -64)
container.Position = UDim2.fromOffset(12, 58)
container.BackgroundTransparency = 1
container.ScrollingDirection = Enum.ScrollingDirection.Y
container.ScrollBarThickness = 4
container.AutomaticCanvasSize = Enum.AutomaticSize.Y
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.Parent = main

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
-- BUTTON NAMES (31)
--==================================================

local ButtonNames = {
    [1] = "Wing Prop2",
    [2] = "Wing Prop",
    [3] = "Shark Prop",
    [4] = "B2 Spirit Prop",
    [5] = "Avarice Scythe",
    [6] = "Gojo Controller",
    [7] = "Wither Prop",
    [8] = "Wither Storm",
    [9] = "Wither Prop2",
    [10] = "B2-Spirit2",
    [11] = "Wither3",
    [12] = "Wither Storm2",
    [13] = "Verity Prop",
    [14] = "Godilza Prop",
    [15] = "Raiden (Dyton security)",
    [16] = "Nothing Panel(mecha)",
    [17] = "Wing prop3",
    [18] = "Ender Dragon",
    [19] = "Radar Terror",
    [20] = "B2 Spirit prop3",
    [21] = "Rodan prop",
    [22] = "dual spider engine prop",
    [23] = "Spear prop",
    [24] = "Curse engine prop",
    [25] = "sukuna ",
    [26] = "scmd prop(key xiandi)",
    [27] = "Avarice prop",
    [28] = "Eryx (key:ErYxOnToP",
    [29] = "TXR prop",
    [30] = "mahoraga",
    [31] = "Join Discord"
}

--==================================================
-- CREATE 31BUTTONS
--==================================================

for i = 1, 31 do
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
-- DRAG SYSTEM
--==================================================

local dragging = false
local dragStart
local startPosition
local dragObject = topBar

local function handleDragStart(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
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

dragObject.InputBegan:Connect(handleDragStart)
UserInputService.InputChanged:Connect(handleDragMove)

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
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
-- BUTTON FUNCTIONS
--==================================================

local function Button1() loadstring(game:HttpGet("https://pastefy.app/RM1MkrT4/raw"))() end
local function Button2() loadstring(game:HttpGet("https://pastefy.app/IJHHtWR6/raw"))() end
local function Button3() loadstring(game:HttpGet("https://pastefy.app/thWRWou1/raw"))() end
local function Button4() loadstring(game:HttpGet("https://pastefy.app/b0JRIsKj/raw"))() end
local function Button5() loadstring(game:HttpGet("https://pastefy.app/oneTZn9W/raw"))() end
local function Button6() loadstring(game:HttpGet("https://pastefy.app/3MShESQ2/raw"))() end
local function Button7() loadstring(game:HttpGet("https://pastefy.app/q4Js0TjY/raw"))() end
local function Button8() loadstring(game:HttpGet("https://pastefy.app/5NOFcoUP/raw"))() end
local function Button9() loadstring(game:HttpGet("https://pastefy.app/6jvLhYaS/raw"))() end
local function Button10() loadstring(game:HttpGet("https://pastefy.app/we9aonad/raw"))() end
local function Button11() loadstring(game:HttpGet("https://pastefy.app/0eGHRHNp/raw"))() end
local function Button12() loadstring(game:HttpGet("https://pastefy.app/r4nWQYzg/raw"))() end
local function Button13() loadstring(game:HttpGet("https://pastefy.app/x1BOck3z/raw"))() end
local function Button14() loadstring(game:HttpGet("https://raw.githubusercontent.com/Johan319/Fe-Godzilla-Obfuscator/refs/heads/main/godzilla"))() end
local function Button15() loadstring(game:HttpGet("https://encrypt-x.pages.dev/Scripts?Id=raidenmaru"))("raidenmaru") end
local function Button16() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Nothing-Panel-223707"))() end
local function Button17() loadstring(game:HttpGet("https://pastefy.app/6ZVZWkbb/raw"))() end
local function Button18() loadstring(game:HttpGet("https://pastefy.app/knN2ER4f/raw"))() end
local function Button19() loadstring(game:HttpGet("https://pastefy.app/lXwhhrxw/raw"))() end
local function Button20() loadstring(game:HttpGet("https://pastefy.app/J35BTsjO/raw"))() end
local function Button21() loadstring(game:HttpGet("https://pastefy.app/MeSs5ehk/raw"))() end
local function Button22() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Engine-spider-props-use-sit-props-243775"))() end
local function Button23() loadstring(game:HttpGet("https://pastefy.app/pDY43Jvl/raw"))() end
local function Button24() loadstring(game:HttpGet("https://pastefy.app/LCb15eUP/raw"))() end
local function Button25() loadstring(game:HttpGet("https://pastefy.app/XvOVpQB0/raw"))() end
local function Button26() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Wings-cmback-use-prop-Brookhaven-key-xiandi-211092"))() end
local function Button27() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-AVARICE-WINGS-BY-NIZAM-217994"))() end
local function Button28() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ErYx-Prop-Animations-by-vansh-238691"))() end
local function Button29() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TXR-ASHU-ROBOT-POWERFULL-TROLL-SCRIPT-241380"))() end
local function Button30()
loadstring(game:HttpGet("https://pastefy.app/x5Rs6lef/raw"))() end

local function Button31()
    local link = "https://discord.gg/jFJQj22gjt"
    if setclipboard then
        setclipboard(link)
        local notification = Instance.new("TextLabel")
        notification.Name = "CopyNotification"
        notification.Size = UDim2.fromOffset(200, 40)
        notification.Position = UDim2.new(0.5, -100, 0.5, -20)
        notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        notification.BackgroundTransparency = 0.1
        notification.Text = "Discord link copied!"
        notification.TextColor3 = Color3.fromRGB(145, 90, 255)
        notification.TextSize = 14
        notification.Font = Enum.Font.GothamBold
        notification.ZIndex = 999
        notification.Parent = main
        local notificationCorner = Instance.new("UICorner")
        notificationCorner.CornerRadius = UDim.new(0, 8)
        notificationCorner.Parent = notification
        notification.BackgroundTransparency = 1
        TweenService:Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0.2}
        ):Play()
        task.wait(2)
        TweenService:Create(
            notification,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {BackgroundTransparency = 1}
        ):Play()
        task.wait(0.3)
        notification:Destroy()
    else
        if syn and syn.request then
            syn.request({Url = link, Method = "GET"})
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
    Button26, Button27, Button28, Button29, Button30, Button31
}

for i = 1, 31 do
    local button = container:FindFirstChild("Button" .. i)
    if button then
        button.Activated:Connect(function()
            local func = ButtonFunctions[i]
            if func then func() end
        end)
    end
end

--==================================================
-- HOTKEY: Right Shift
--==================================================

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
        openBtn.Visible = not gui.Enabled
    end
end)

print("Prop Hub V3 Loaded Successfully! (30 Buttons - 6x5 Grid)")
print("Press Right Shift to toggle GUI")
print("Button 30 copies Discord link to clipboard!")
