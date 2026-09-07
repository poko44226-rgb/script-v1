local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local TS = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local isMinimized = false
local selectedDropdownPlayer = nil
local currentTargetPlayer = LP
local isActivated = false
local wingsActive = false
local propspeed = 0.6
local colorPickerOpen = false

-- ==================== ระบบธีมสีหลากหลาย ====================
local currentTheme = "RED"

local COLOR_THEMES = {
    {Name = "RED",     Abyss = Color3.fromRGB(80, 0, 0),    Toxic = Color3.fromRGB(255, 0, 0),    Deep = Color3.fromRGB(40, 0, 0)},
    {Name = "ORANGE",  Abyss = Color3.fromRGB(80, 30, 0),   Toxic = Color3.fromRGB(255, 100, 0),  Deep = Color3.fromRGB(40, 15, 0)},
    {Name = "YELLOW",  Abyss = Color3.fromRGB(80, 80, 0),   Toxic = Color3.fromRGB(255, 255, 0),  Deep = Color3.fromRGB(40, 40, 0)},
    {Name = "LIME",    Abyss = Color3.fromRGB(30, 80, 0),   Toxic = Color3.fromRGB(100, 255, 0),  Deep = Color3.fromRGB(15, 40, 0)},
    {Name = "GREEN",   Abyss = Color3.fromRGB(0, 80, 0),    Toxic = Color3.fromRGB(0, 255, 0),    Deep = Color3.fromRGB(0, 40, 0)},
    {Name = "CYAN",    Abyss = Color3.fromRGB(0, 80, 80),   Toxic = Color3.fromRGB(0, 255, 255),  Deep = Color3.fromRGB(0, 40, 40)},
    {Name = "BLUE",    Abyss = Color3.fromRGB(0, 0, 80),    Toxic = Color3.fromRGB(0, 100, 255),  Deep = Color3.fromRGB(0, 0, 40)},
    {Name = "PURPLE",  Abyss = Color3.fromRGB(60, 0, 80),   Toxic = Color3.fromRGB(150, 0, 255),  Deep = Color3.fromRGB(30, 0, 40)},
    {Name = "MAGENTA", Abyss = Color3.fromRGB(80, 0, 60),   Toxic = Color3.fromRGB(255, 0, 200),  Deep = Color3.fromRGB(40, 0, 30)},
    {Name = "PINK",    Abyss = Color3.fromRGB(80, 0, 40),   Toxic = Color3.fromRGB(255, 0, 150),  Deep = Color3.fromRGB(40, 0, 20)},
    {Name = "WHITE",   Abyss = Color3.fromRGB(80, 80, 80),  Toxic = Color3.fromRGB(255, 255, 255),Deep = Color3.fromRGB(40, 40, 40)},
    {Name = "BLACK",   Abyss = Color3.fromRGB(20, 20, 20),  Toxic = Color3.fromRGB(100, 100, 100),Deep = Color3.fromRGB(10, 10, 10)},
}

local THEMES = {}
for _, theme in ipairs(COLOR_THEMES) do
    THEMES[theme.Name] = theme
end

local function getCol(key)
    return THEMES[currentTheme][key]
end

local function getAbyssColor(t, offset)
    local cycle = (t * 0.3 + (offset * 0.1)) % 1
    local colors = THEMES[currentTheme]
    if cycle < 0.5 then
        return colors.Abyss:Lerp(colors.Toxic, cycle * 2)
    else
        return colors.Toxic:Lerp(colors.Deep, (cycle - 0.5) * 2)
    end
end
-- ===================================================

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.DisplayOrder = 2147483647
Gui.IgnoreGuiInset = true
Gui.ScreenInsets = Enum.ScreenInsets.None

-- UI หลัก: กว้าง 260 สูง 380 (ขยายจาก 200x230)
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 260, 0, 380)
Main.Position = UDim2.new(0.5, -130, 0.4, 0)
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true

local MainGrad = Instance.new("UIGradient", Main)
local function updateMainGradient()
    MainGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, getCol("Abyss")),
        ColorSequenceKeypoint.new(0.5, getCol("Toxic")),
        ColorSequenceKeypoint.new(1, getCol("Deep"))
    })
end
updateMainGradient()

task.spawn(function()
    while true do
        TS:Create(MainGrad, TweenInfo.new(4, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)}):Play()
        task.wait(4)
        MainGrad.Offset = Vector2.new(-1, 0)
    end
end)

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -35, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "TRUE SHADOWPYTRION"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.PermanentMarker
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeColor3 = getCol("Deep")
Title.TextStrokeTransparency = 0.2

local MinBtn = Instance.new("TextButton", Header)
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Position = UDim2.new(1, -28, 0, 9)
MinBtn.BackgroundColor3 = Color3.new(0, 0, 0)
MinBtn.Text = "▲"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.TextSize = 12
MinBtn.BackgroundTransparency = 0.4
Instance.new("UICorner", MinBtn)

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, 0, 1, -40)
Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1
Content.ClipsDescendants = true

local DropdownBtn = Instance.new("TextButton", Content)
DropdownBtn.Size = UDim2.new(0.9, 0, 0, 30)
DropdownBtn.Position = UDim2.new(0.05, 0, 0, 10)
DropdownBtn.BackgroundColor3 = Color3.new(0, 0, 0)
DropdownBtn.Text = "NONE"
DropdownBtn.TextColor3 = Color3.new(1, 1, 1)
DropdownBtn.Font = Enum.Font.GothamBold
DropdownBtn.TextSize = 10
DropdownBtn.BackgroundTransparency = 0.5
Instance.new("UICorner", DropdownBtn)

local DropdownList = Instance.new("ScrollingFrame", Content)
DropdownList.Size = UDim2.new(0.9, 0, 0, 120)
DropdownList.Position = UDim2.new(0.05, 0, 0, 42)
DropdownList.Visible = false
DropdownList.ZIndex = 10
DropdownList.BackgroundColor3 = getCol("Deep")
DropdownList.BorderSizePixel = 0
DropdownList.ScrollBarThickness = 4
DropdownList.CanvasSize = UDim2.new(0, 0, 0, 0)
Instance.new("UICorner", DropdownList).CornerRadius = UDim.new(0, 6)

local listLayout = Instance.new("UIListLayout", DropdownList)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 2)

local function refreshDropdown()
    for _, child in ipairs(DropdownList:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    local noneBtn = Instance.new("TextButton", DropdownList)
    noneBtn.Size = UDim2.new(1, -4, 0, 22)
    noneBtn.Position = UDim2.new(0, 2, 0, 0)
    noneBtn.BackgroundTransparency = 0.5
    noneBtn.BackgroundColor3 = Color3.new(0, 0, 0)
    noneBtn.Text = "NONE"
    noneBtn.TextColor3 = Color3.new(1, 1, 1)
    noneBtn.Font = Enum.Font.GothamBold
    noneBtn.TextSize = 10
    noneBtn.ZIndex = 11
    Instance.new("UICorner", noneBtn).CornerRadius = UDim.new(0, 4)
    noneBtn.MouseButton1Click:Connect(function()
        selectedDropdownPlayer = nil
        currentTargetPlayer = LP
        DropdownBtn.Text = "NONE"
        DropdownList.Visible = false
    end)

    for _, p in ipairs(Players:GetPlayers()) do
        local pBtn = Instance.new("TextButton", DropdownList)
        pBtn.Size = UDim2.new(1, -4, 0, 22)
        pBtn.Position = UDim2.new(0, 2, 0, 0)
        pBtn.BackgroundTransparency = 0.5
        pBtn.BackgroundColor3 = Color3.new(0, 0, 0)
        pBtn.Text = string.upper(p.Name)
        pBtn.TextColor3 = Color3.new(1, 1, 1)
        pBtn.Font = Enum.Font.GothamBold
        pBtn.TextSize = 10
        pBtn.ZIndex = 11
        Instance.new("UICorner", pBtn).CornerRadius = UDim.new(0, 4)
        pBtn.MouseButton1Click:Connect(function()
            selectedDropdownPlayer = p
            currentTargetPlayer = p
            DropdownBtn.Text = string.upper(p.Name)
            DropdownList.Visible = false
        end)
    end
    DropdownList.CanvasSize = UDim2.new(0, 0, 0, (#Players:GetPlayers() + 1) * 24)
end

DropdownBtn.MouseButton1Click:Connect(function()
    DropdownList.Visible = not DropdownList.Visible
    if DropdownList.Visible then
        ColorPickerFrame.Visible = false
        colorPickerOpen = false
    end
end)

Players.PlayerAdded:Connect(function(p)
    refreshDropdown()
    p.CharacterAdded:Connect(refreshDropdown)
end)
Players.PlayerRemoving:Connect(refreshDropdown)

for _, p in ipairs(Players:GetPlayers()) do
    p.CharacterAdded:Connect(refreshDropdown)
end
refreshDropdown()

local function createBtn(name, pos)
    local b = Instance.new("TextButton", Content)
    b.Size = UDim2.new(0.9, 0, 0, 35)
    b.Position = pos
    b.BackgroundColor3 = Color3.new(0, 0, 0)
    b.Text = name
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 10
    b.BackgroundTransparency = 0.5
    Instance.new("UICorner", b)
    return b
end

-- ปรับตำแหน่งปุ่มให้เหมาะสมกับ UI ใหม่
local bActivate = createBtn("ACTIVATE CONTROL", UDim2.new(0.05, 0, 0, 50))
local bSummon = createBtn("SUMMON ABYSS WINGS", UDim2.new(0.05, 0, 0, 95))
local bDismantle = createBtn("GET DISMANTLE", UDim2.new(0.05, 0, 0, 140))
local bColorToggle = createBtn("COLOR: RED", UDim2.new(0.05, 0, 0, 185))
bColorToggle.TextSize = 10

-- ==================== ระบบเลือกสีแบบบล็อก (Color Picker) ====================
local ColorPickerFrame = Instance.new("Frame", Content)
-- วาง Color Picker ในพื้นที่ปุ่มหลัก และให้มีขนาดพอดีกับ UI 260x380
ColorPickerFrame.Size = UDim2.new(0.9, 0, 0, 200)
ColorPickerFrame.Position = UDim2.new(0.05, 0, 0, 50)
ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ColorPickerFrame.BackgroundTransparency = 0.05
ColorPickerFrame.Visible = false
ColorPickerFrame.ZIndex = 20
ColorPickerFrame.BorderSizePixel = 0
ColorPickerFrame.ClipsDescendants = true
Instance.new("UICorner", ColorPickerFrame).CornerRadius = UDim.new(0, 8)

local pickerTitle = Instance.new("TextLabel", ColorPickerFrame)
pickerTitle.Size = UDim2.new(1, -30, 0, 25)
pickerTitle.Position = UDim2.new(0, 5, 0, 5)
pickerTitle.Text = "SELECT COLOR"
pickerTitle.TextColor3 = Color3.new(1, 1, 1)
pickerTitle.Font = Enum.Font.GothamBold
pickerTitle.TextSize = 12
pickerTitle.BackgroundTransparency = 1
pickerTitle.ZIndex = 21
pickerTitle.TextXAlignment = Enum.TextXAlignment.Left

local closePicker = Instance.new("TextButton", ColorPickerFrame)
closePicker.Size = UDim2.new(0, 22, 0, 22)
closePicker.Position = UDim2.new(1, -27, 0, 4)
closePicker.Text = "X"
closePicker.TextColor3 = Color3.new(1, 1, 1)
closePicker.Font = Enum.Font.GothamBold
closePicker.TextSize = 12
closePicker.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
closePicker.ZIndex = 21
Instance.new("UICorner", closePicker).CornerRadius = UDim.new(0, 4)

local colorContainer = Instance.new("Frame", ColorPickerFrame)
colorContainer.Size = UDim2.new(1, -10, 1, -35)
colorContainer.Position = UDim2.new(0, 5, 0, 32)
colorContainer.BackgroundTransparency = 1
colorContainer.ZIndex = 21

local gridLayout = Instance.new("UIGridLayout", colorContainer)
gridLayout.CellSize = UDim2.new(0, 50, 0, 40)
gridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top

for _, theme in ipairs(COLOR_THEMES) do
    local colorBtn = Instance.new("TextButton", colorContainer)
    colorBtn.BackgroundColor3 = theme.Toxic
    colorBtn.Text = ""
    colorBtn.ZIndex = 22
    Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", colorBtn)
    stroke.Color = Color3.new(1, 1, 1)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.4

    local nameLabel = Instance.new("TextLabel", colorBtn)
    nameLabel.Size = UDim2.new(1, 0, 0, 14)
    nameLabel.Position = UDim2.new(0, 0, 1, -14)
    nameLabel.BackgroundTransparency = 0.3
    nameLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    nameLabel.Text = theme.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 8
    nameLabel.ZIndex = 23
    nameLabel.BorderSizePixel = 0

    colorBtn.MouseButton1Click:Connect(function()
        currentTheme = theme.Name
        applyTheme()
        setColorPickerVisible(false)
        bColorToggle.Text = "COLOR: " .. theme.Name
    end)
end

closePicker.MouseButton1Click:Connect(function()
    ColorPickerFrame.Visible = false
    colorPickerOpen = false
end)

local function setColorPickerVisible(visible)
    colorPickerOpen = visible
    ColorPickerFrame.Visible = visible

    -- ซ่อนปุ่มหลักชั่วคราว เพื่อไม่ให้ทับกับ Color Picker
    bActivate.Visible = not visible
    bSummon.Visible = not visible
    bDismantle.Visible = not visible
    bColorToggle.Visible = not visible

    if visible then
        DropdownList.Visible = false
    end
end

bColorToggle.MouseButton1Click:Connect(function()
    setColorPickerVisible(not colorPickerOpen)
end)
-- ===================================================

-- ฟังก์ชันอัปเดตสีทั้ง GUI เมื่อเปลี่ยนธีม
local function applyTheme()
    updateMainGradient()
    DropdownList.BackgroundColor3 = getCol("Deep")
    Title.TextStrokeColor3 = getCol("Deep")
    bColorToggle.Text = "COLOR: " .. currentTheme

    if isActivated then
        bActivate.BackgroundColor3 = getCol("Abyss")
        bActivate.BackgroundTransparency = 0
    else
        bActivate.BackgroundColor3 = Color3.new(0, 0, 0)
        bActivate.BackgroundTransparency = 0.5
    end

    if wingsActive then
        bSummon.BackgroundColor3 = getCol("Abyss")
        bSummon.BackgroundTransparency = 0
    else
        bSummon.BackgroundColor3 = Color3.new(0, 0, 0)
        bSummon.BackgroundTransparency = 0.5
    end
end

local function getSortedProps(playerName)
    local propsList = {}
    local workspaceCom = workspace:FindFirstChild("WorkspaceCom")
    if workspaceCom then
        for _, cat in ipairs(workspaceCom:GetChildren()) do
            if cat:IsA("Folder") or cat:IsA("Model") then
                for _, prop in ipairs(cat:GetChildren()) do
                    if prop.Name:find(playerName) then
                        table.insert(propsList, prop)
                    end
                end
            end
        end
    end
    table.sort(propsList, function(a, b)
        local numA = tonumber(a.Name:match("%d+")) or 0
        local numB = tonumber(b.Name:match("%d+")) or 0
        return numA < numB
    end)
    return propsList
end

local wingOffset = CFrame.new(-25.5, -4, -30)

local Anim1 = {
    CFrame.new(22.073, 5.610, 31.148, 0.900, 0.423, -0.103, -0.386, 0.886, 0.258, 0.200, -0.192, 0.961),
    CFrame.new(20.573, 5.168, 31.124, 0.828, 0.551, -0.103, -0.512, 0.819, 0.258, 0.226, -0.161, 0.961),
    CFrame.new(19.073, 4.726, 31.099, 0.738, 0.667, -0.103, -0.627, 0.735, 0.258, 0.248, -0.126, 0.961),
    CFrame.new(17.573, 4.262, 31.074, 0.635, 0.766, -0.103, -0.727, 0.637, 0.258, 0.263, -0.089, 0.961),
    CFrame.new(16.073, 3.814, 31.049, 0.516, 0.851, -0.103, -0.812, 0.523, 0.258, 0.273, -0.049, 0.961),
    CFrame.new(14.574, 3.366, 31.024, 0.385, 0.917, -0.103, -0.880, 0.399, 0.258, 0.277, -0.009, 0.961),
    CFrame.new(13.074, 2.919, 30.999, 0.247, 0.963, -0.103, -0.929, 0.266, 0.258, 0.276, 0.032, 0.961),
    CFrame.new(11.574, 2.471, 30.974, 0.103, 0.989, -0.103, -0.958, 0.127, 0.258, 0.268, 0.072, 0.961),
    CFrame.new(29.072, 5.604, 31.264, 0.907, -0.415, 0.071, 0.386, 0.886, 0.258, -0.170, -0.206, 0.964),
    CFrame.new(30.571, 5.157, 31.289, 0.836, -0.544, 0.071, 0.511, 0.820, 0.258, -0.199, -0.179, 0.964),
    CFrame.new(32.071, 4.709, 31.314, 0.748, -0.660, 0.071, 0.626, 0.736, 0.258, -0.223, -0.148, 0.964),
    CFrame.new(33.571, 4.262, 31.339, 0.643, -0.763, 0.071, 0.727, 0.637, 0.258, -0.242, -0.114, 0.964),
    CFrame.new(35.071, 3.814, 31.364, 0.524, -0.849, 0.071, 0.812, 0.523, 0.258, -0.256, -0.077, 0.964),
    CFrame.new(36.571, 3.366, 31.389, 0.394, -0.916, 0.071, 0.880, 0.399, 0.258, -0.265, -0.039, 0.964),
    CFrame.new(38.070, 2.919, 31.414, 0.256, -0.964, 0.071, 0.929, 0.266, 0.258, -0.268, 0.000, 0.964),
}
local Anim2 = {
    CFrame.new(22.073, 6.097, 31.148, 0.876, 0.471, -0.103, -0.433, 0.863, 0.258, 0.210, -0.181, 0.961),
    CFrame.new(20.573, 6.011, 31.124, 0.758, 0.644, -0.103, -0.605, 0.753, 0.258, 0.244, -0.133, 0.961),
    CFrame.new(19.073, 6.026, 31.099, 0.606, 0.789, -0.103, -0.750, 0.609, 0.258, 0.266, -0.079, 0.961),
    CFrame.new(17.573, 6.040, 31.074, 0.427, 0.898, -0.103, -0.861, 0.439, 0.258, 0.277, -0.021, 0.961),
    CFrame.new(16.073, 6.054, 31.049, 0.229, 0.968, -0.103, -0.934, 0.248, 0.258, 0.275, 0.037, 0.961),
    CFrame.new(14.574, 6.068, 31.024, 0.021, 0.994, -0.103, -0.965, 0.047, 0.258, 0.261, 0.094, 0.961),
    CFrame.new(13.074, 6.083, 30.999, -0.189, 0.977, -0.103, -0.953, -0.157, 0.258, 0.236, 0.147, 0.961),
    CFrame.new(11.574, 6.097, 30.974, -0.389, 0.915, -0.103, -0.899, -0.353, 0.258, 0.200, 0.193, 0.961),
    CFrame.new(29.072, 5.997, 31.264, 0.883, -0.464, 0.071, 0.434, 0.863, 0.258, -0.181, -0.197, 0.964),
    CFrame.new(30.571, 6.011, 31.289, 0.766, -0.639, 0.071, 0.605, 0.753, 0.258, -0.218, -0.154, 0.964),
    CFrame.new(32.071, 6.026, 31.314, 0.614, -0.786, 0.071, 0.750, 0.610, 0.258, -0.246, -0.105, 0.964),
    CFrame.new(33.571, 6.040, 31.339, 0.436, -0.897, 0.071, 0.861, 0.439, 0.258, -0.263, -0.051, 0.964),
    CFrame.new(35.071, 6.054, 31.364, 0.238, -0.969, 0.071, 0.934, 0.248, 0.258, -0.267, 0.005, 0.964),
    CFrame.new(36.571, 6.068, 31.389, 0.029, -0.997, 0.071, 0.965, 0.047, 0.258, -0.260, 0.061, 0.964),
    CFrame.new(38.070, 6.083, 31.414, -0.181, -0.981, 0.071, 0.953, -0.157, 0.258, -0.242, 0.114, 0.964),
}
local Anim3 = {
    CFrame.new(22.073, 6.494, 31.148, 0.841, 0.530, -0.103, -0.492, 0.831, 0.258, 0.222, -0.166, 0.961),
    CFrame.new(20.573, 7.093, 31.124, 0.652, 0.751, -0.103, -0.712, 0.654, 0.258, 0.261, -0.095, 0.961),
    CFrame.new(19.073, 7.693, 31.099, 0.408, 0.907, -0.103, -0.870, 0.420, 0.258, 0.277, -0.015, 0.961),
    CFrame.new(17.573, 8.292, 31.074, 0.128, 0.986, -0.103, -0.954, 0.151, 0.258, 0.270, 0.065, 0.961),
    CFrame.new(16.073, 8.891, 31.049, -0.162, 0.981, -0.103, -0.957, -0.131, 0.258, 0.239, 0.141, 0.961),
    CFrame.new(14.574, 9.490, 31.024, -0.439, 0.893, -0.103, -0.878, -0.402, 0.258, 0.189, 0.204, 0.961),
    CFrame.new(13.074, 10.090, 30.999, -0.678, 0.728, -0.103, -0.725, -0.639, 0.258, 0.122, 0.250, 0.961),
    CFrame.new(11.574, 10.689, 30.974, -0.859, 0.501, -0.103, -0.509, -0.821, 0.258, 0.044, 0.274, 0.961),
    CFrame.new(29.072, 6.494, 31.264, 0.848, -0.525, 0.071, 0.492, 0.831, 0.258, -0.194, -0.184, 0.964),
    CFrame.new(30.571, 7.093, 31.289, 0.661, -0.747, 0.071, 0.712, 0.654, 0.258, -0.239, -0.120, 0.964),
    CFrame.new(32.071, 7.693, 31.314, 0.417, -0.906, 0.071, 0.870, 0.420, 0.258, -0.264, -0.045, 0.964),
    CFrame.new(33.571, 8.292, 31.339, 0.137, -0.988, 0.071, 0.954, 0.151, 0.258, -0.265, 0.033, 0.964),
    CFrame.new(35.071, 8.891, 31.364, -0.154, -0.985, 0.071, 0.957, -0.131, 0.258, -0.245, 0.108, 0.964),
    CFrame.new(36.571, 9.490, 31.389, -0.432, -0.899, 0.071, 0.878, -0.402, 0.258, -0.203, 0.174, 0.964),
    CFrame.new(38.070, 10.090, 31.414, -0.674, -0.736, 0.071, 0.725, -0.639, 0.258, -0.144, 0.225, 0.964),
}
local Anim4 = {
    CFrame.new(22.073, 7.334, 31.148, 0.774, 0.625, -0.103, -0.586, 0.768, 0.258, 0.240, -0.139, 0.961),
    CFrame.new(20.573, 8.922, 31.124, 0.442, 0.891, -0.103, -0.854, 0.453, 0.258, 0.276, -0.026, 0.961),
    CFrame.new(19.073, 10.509, 31.099, 0.029, 0.994, -0.103, -0.965, 0.055, 0.258, 0.262, 0.092, 0.961),
    CFrame.new(17.573, 12.097, 31.074, -0.389, 0.915, -0.103, -0.899, -0.353, 0.258, 0.200, 0.193, 0.961),
    CFrame.new(16.073, 13.684, 31.049, -0.736, 0.669, -0.103, -0.669, -0.697, 0.258, 0.101, 0.259, 0.961),
    CFrame.new(14.574, 15.272, 31.024, -0.948, 0.300, -0.103, -0.317, -0.913, 0.258, -0.017, 0.277, 0.961),
    CFrame.new(13.074, 16.860, 30.999, -0.987, -0.124, -0.103, 0.094, -0.962, 0.258, -0.131, 0.245, 0.961),
    CFrame.new(11.574, 18.447, 30.974, -0.845, -0.525, -0.103, 0.487, -0.835, 0.258, -0.221, 0.168, 0.961),
    CFrame.new(29.072, 7.334, 31.264, 0.781, -0.620, 0.071, 0.586, 0.768, 0.258, -0.215, -0.160, 0.964),
    CFrame.new(30.571, 8.922, 31.289, 0.450, -0.890, 0.071, 0.854, 0.453, 0.258, -0.262, -0.055, 0.964),
    CFrame.new(32.071, 10.509, 31.314, 0.037, -0.997, 0.071, 0.965, 0.055, 0.258, -0.261, 0.059, 0.964),
    CFrame.new(33.571, 12.097, 31.339, -0.383, -0.921, 0.071, 0.899, -0.353, 0.258, -0.212, 0.163, 0.964),
    CFrame.new(35.071, 13.684, 31.364, -0.732, -0.677, 0.071, 0.669, -0.697, 0.258, -0.125, 0.237, 0.964),
    CFrame.new(36.571, 15.272, 31.389, -0.948, -0.309, 0.071, 0.317, -0.913, 0.258, -0.015, 0.267, 0.964),
    CFrame.new(38.070, 16.860, 31.414, -0.991, 0.116, 0.071, -0.094, -0.962, 0.258, 0.098, 0.249, 0.964),
}
local Anim5 = {
    CFrame.new(22.073, 7.642, 31.148, 0.746, 0.658, -0.103, -0.619, 0.742, 0.258, 0.246, -0.129, 0.961),
    CFrame.new(20.573, 9.592, 31.124, 0.356, 0.929, -0.103, -0.892, 0.371, 0.258, 0.278, 0.000, 0.961),
    CFrame.new(19.073, 11.542, 31.099, -0.114, 0.988, -0.103, -0.962, -0.084, 0.258, 0.246, 0.129, 0.961),
    CFrame.new(17.573, 13.491, 31.074, -0.559, 0.823, -0.103, -0.814, -0.521, 0.258, 0.158, 0.228, 0.961),
    CFrame.new(16.073, 15.441, 31.049, -0.877, 0.470, -0.103, -0.480, -0.839, 0.258, 0.035, 0.276, 0.961),
    CFrame.new(14.574, 17.391, 31.024, -0.995, 0.011, -0.103, -0.037, -0.965, 0.258, -0.097, 0.260, 0.961),
    CFrame.new(13.074, 19.340, 30.999, -0.886, -0.451, -0.103, 0.415, -0.873, 0.258, -0.206, 0.186, 0.961),
    CFrame.new(11.574, 21.290, 30.974, -0.576, -0.811, -0.103, 0.772, -0.581, 0.258, -0.269, 0.069, 0.961),
    CFrame.new(29.072, 7.642, 31.264, 0.754, -0.653, 0.071, 0.619, 0.742, 0.258, -0.221, -0.150, 0.964),
    CFrame.new(30.571, 9.592, 31.289, 0.365, -0.928, 0.071, 0.892, 0.371, 0.258, -0.266, -0.031, 0.964),
    CFrame.new(32.071, 11.542, 31.314, -0.106, -0.992, 0.071, 0.962, -0.084, 0.258, -0.250, 0.096, 0.964),
    CFrame.new(33.571, 13.491, 31.339, -0.553, -0.830, 0.071, 0.814, -0.521, 0.258, -0.177, 0.201, 0.964),
    CFrame.new(35.071, 15.441, 31.364, -0.875, -0.479, 0.071, 0.480, -0.839, 0.258, -0.064, 0.260, 0.964),
    CFrame.new(36.571, 17.391, 31.389, -0.997, -0.019, 0.071, 0.037, -0.965, 0.258, 0.064, 0.260, 0.964),
    CFrame.new(38.070, 19.340, 31.414, -0.893, 0.445, 0.071, -0.415, -0.873, 0.258, 0.177, 0.201, 0.964),
}
local Anim6 = {
    CFrame.new(22.073, 7.275, 31.148, 0.779, 0.619, -0.103, -0.580, 0.773, 0.258, 0.239, -0.141, 0.961),
    CFrame.new(20.573, 8.792, 31.124, 0.458, 0.883, -0.103, -0.845, 0.468, 0.258, 0.276, -0.031, 0.961),
    CFrame.new(19.073, 10.309, 31.099, 0.057, 0.993, -0.103, -0.963, 0.082, 0.258, 0.264, 0.085, 0.961),
    CFrame.new(17.573, 11.826, 31.074, -0.354, 0.929, -0.103, -0.912, -0.319, 0.258, 0.207, 0.185, 0.961),
    CFrame.new(16.073, 13.343, 31.049, -0.704, 0.703, -0.103, -0.702, -0.664, 0.258, 0.113, 0.254, 0.961),
    CFrame.new(14.574, 14.861, 31.024, -0.930, 0.354, -0.103, -0.369, -0.893, 0.258, -0.001, 0.278, 0.961),
    CFrame.new(13.074, 16.378, 30.999, -0.993, -0.057, -0.103, 0.029, -0.966, 0.258, -0.114, 0.253, 0.961),
    CFrame.new(11.574, 17.895, 30.974, -0.883, -0.458, -0.103, 0.421, -0.870, 0.258, -0.208, 0.184, 0.961),
    CFrame.new(29.072, 7.275, 31.264, 0.786, -0.614, 0.071, 0.580, 0.773, 0.258, -0.213, -0.161, 0.964),
    CFrame.new(30.571, 8.792, 31.289, 0.467, -0.882, 0.071, 0.845, 0.468, 0.258, -0.261, -0.060, 0.964),
    CFrame.new(32.071, 10.309, 31.314, 0.065, -0.995, 0.071, 0.963, 0.082, 0.258, -0.262, 0.052, 0.964),
    CFrame.new(33.571, 11.826, 31.339, -0.347, -0.935, 0.071, 0.912, -0.319, 0.258, -0.218, 0.154, 0.964),
    CFrame.new(35.071, 13.343, 31.364, -0.699, -0.711, 0.071, 0.702, -0.664, 0.258, -0.136, 0.230, 0.964),
    CFrame.new(36.571, 14.861, 31.389, -0.929, -0.363, 0.071, 0.369, -0.893, 0.258, -0.030, 0.266, 0.964),
    CFrame.new(38.070, 16.378, 31.414, -0.996, 0.049, 0.071, -0.029, -0.966, 0.258, 0.081, 0.255, 0.964),
}
local Anim7 = {
    CFrame.new(22.073, 7.094, 31.148, 0.794, 0.599, -0.103, -0.560, 0.787, 0.258, 0.236, -0.147, 0.961),
    CFrame.new(20.573, 8.398, 31.124, 0.506, 0.857, -0.103, -0.818, 0.514, 0.258, 0.274, -0.046, 0.961),
    CFrame.new(19.073, 9.702, 31.099, 0.140, 0.985, -0.103, -0.952, 0.163, 0.258, 0.271, 0.062, 0.961),
    CFrame.new(17.573, 11.007, 31.074, -0.246, 0.964, -0.103, -0.942, -0.213, 0.258, 0.227, 0.161, 0.961),
    CFrame.new(16.073, 12.311, 31.049, -0.595, 0.797, -0.103, -0.790, -0.557, 0.258, 0.148, 0.235, 0.961),
    CFrame.new(14.574, 13.615, 31.024, -0.854, 0.509, -0.103, -0.518, -0.816, 0.258, 0.047, 0.274, 0.961),
    CFrame.new(13.074, 14.920, 30.999, -0.984, 0.145, -0.103, -0.167, -0.952, 0.258, -0.061, 0.271, 0.961),
    CFrame.new(11.574, 16.224, 30.974, -0.965, -0.242, -0.103, 0.209, -0.943, 0.258, -0.160, 0.227, 0.961),
    CFrame.new(29.072, 7.094, 31.264, 0.802, -0.594, 0.071, 0.560, 0.787, 0.258, -0.209, -0.167, 0.964),
    CFrame.new(30.571, 8.398, 31.289, 0.514, -0.855, 0.071, 0.818, 0.514, 0.258, -0.257, -0.074, 0.964),
    CFrame.new(32.071, 9.702, 31.314, 0.149, -0.986, 0.071, 0.952, 0.163, 0.258, -0.266, 0.029, 0.964),
    CFrame.new(33.571, 11.007, 31.339, -0.238, -0.969, 0.071, 0.942, -0.213, 0.258, -0.235, 0.129, 0.964),
    CFrame.new(35.071, 12.311, 31.364, -0.590, -0.804, 0.071, 0.790, -0.557, 0.258, -0.168, 0.208, 0.964),
    CFrame.new(36.571, 13.615, 31.389, -0.852, -0.518, 0.071, 0.518, -0.816, 0.258, -0.076, 0.257, 0.964),
    CFrame.new(38.070, 14.920, 31.414, -0.986, -0.154, 0.071, 0.167, -0.952, 0.258, 0.028, 0.266, 0.964),
}
local Anim8 = {
    CFrame.new(22.073, 5.640, 31.148, 0.899, 0.427, -0.103, -0.390, 0.884, 0.258, 0.201, -0.191, 0.961),
    CFrame.new(20.573, 5.235, 31.124, 0.823, 0.558, -0.103, -0.520, 0.814, 0.258, 0.228, -0.159, 0.961),
    CFrame.new(19.073, 4.830, 31.099, 0.729, 0.677, -0.103, -0.638, 0.726, 0.258, 0.249, -0.122, 0.961),
    CFrame.new(17.573, 4.425, 31.074, 0.617, 0.780, -0.103, -0.741, 0.620, 0.258, 0.265, -0.083, 0.961),
    CFrame.new(16.073, 4.020, 31.049, 0.491, 0.865, -0.103, -0.827, 0.500, 0.258, 0.275, -0.041, 0.961),
    CFrame.new(14.574, 3.615, 31.024, 0.353, 0.930, -0.103, -0.893, 0.368, 0.258, 0.278, 0.001, 0.961),
    CFrame.new(13.074, 3.210, 30.999, 0.208, 0.973, -0.103, -0.939, 0.228, 0.258, 0.274, 0.043, 0.961),
    CFrame.new(11.574, 2.804, 30.974, 0.057, 0.993, -0.103, -0.963, 0.082, 0.258, 0.265, 0.085, 0.961),
    CFrame.new(29.072, 5.640, 31.264, 0.905, -0.420, 0.071, 0.390, 0.884, 0.258, -0.171, -0.206, 0.964),
    CFrame.new(30.571, 5.235, 31.289, 0.830, -0.553, 0.071, 0.520, 0.814, 0.258, -0.200, -0.177, 0.964),
    CFrame.new(32.071, 4.830, 31.314, 0.736, -0.673, 0.071, 0.638, 0.726, 0.258, -0.225, -0.144, 0.964),
    CFrame.new(33.571, 4.425, 31.339, 0.625, -0.777, 0.071, 0.741, 0.620, 0.258, -0.245, -0.108, 0.964),
    CFrame.new(35.071, 4.020, 31.364, 0.500, -0.863, 0.071, 0.827, 0.500, 0.258, -0.258, -0.070, 0.964),
    CFrame.new(36.571, 3.615, 31.389, 0.362, -0.929, 0.071, 0.893, 0.368, 0.258, -0.266, -0.030, 0.964),
    CFrame.new(38.070, 3.210, 31.414, 0.217, -0.974, 0.071, 0.939, 0.228, 0.258, -0.267, 0.011, 0.964),
}
local Anim9 = {
    CFrame.new(22.073, 5.733, 31.148, 0.893, 0.438, -0.103, -0.401, 0.879, 0.258, 0.204, -0.189, 0.961),
    CFrame.new(20.573, 5.437, 31.124, 0.807, 0.581, -0.103, -0.543, 0.799, 0.258, 0.232, -0.152, 0.961),
    CFrame.new(19.073, 5.141, 31.099, 0.698, 0.708, -0.103, -0.669, 0.697, 0.258, 0.254, -0.111, 0.961),
    CFrame.new(17.573, 4.845, 31.074, 0.570, 0.815, -0.103, -0.776, 0.576, 0.258, 0.269, -0.067, 0.961),
    CFrame.new(16.073, 4.549, 31.049, 0.426, 0.899, -0.103, -0.861, 0.437, 0.258, 0.277, -0.021, 0.961),
    CFrame.new(14.574, 4.253, 31.024, 0.269, 0.958, -0.103, -0.922, 0.287, 0.258, 0.277, 0.026, 0.961),
    CFrame.new(13.074, 3.957, 30.999, 0.105, 0.989, -0.103, -0.958, 0.129, 0.258, 0.268, 0.072, 0.961),
    CFrame.new(11.574, 3.660, 30.974, -0.062, 0.993, -0.103, -0.966, -0.033, 0.258, 0.253, 0.115, 0.961),
    CFrame.new(29.072, 5.733, 31.264, 0.899, -0.432, 0.071, 0.401, 0.879, 0.258, -0.174, -0.203, 0.964),
    CFrame.new(30.571, 5.437, 31.289, 0.814, -0.576, 0.071, 0.543, 0.799, 0.258, -0.205, -0.171, 0.964),
    CFrame.new(32.071, 5.141, 31.314, 0.706, -0.704, 0.071, 0.669, 0.697, 0.258, -0.231, -0.135, 0.964),
    CFrame.new(33.571, 4.845, 31.339, 0.579, -0.812, 0.071, 0.776, 0.575, 0.258, -0.250, -0.094, 0.964),
    CFrame.new(35.071, 4.549, 31.364, 0.435, -0.898, 0.071, 0.861, 0.438, 0.258, -0.263, -0.051, 0.964),
    CFrame.new(36.571, 4.253, 31.389, 0.278, -0.958, 0.071, 0.922, 0.287, 0.258, -0.267, -0.006, 0.964),
    CFrame.new(38.070, 3.957, 31.414, 0.114, -0.991, 0.071, 0.958, 0.129, 0.258, -0.265, 0.039, 0.964),
}

local allAnims = {Anim1, Anim2, Anim3, Anim4, Anim5, Anim6, Anim7, Anim8, Anim9}

local function getOff(baseRef, cf)
    return baseRef * cf
end

local function startWings()
    task.spawn(function()
        while wingsActive and isActivated do
            local t = tick()
            local propsList = getSortedProps(LP.Name)
            for idx, prop in ipairs(propsList) do
                local remote = prop:FindFirstChild("ChangePropColor")
                if remote then
                    local col = getAbyssColor(t, idx)
                    task.spawn(function()
                        pcall(function()
                            remote:InvokeServer(col)
                        end)
                    end)
                end
            end
            task.wait(0.05)
        end
    end)

    task.spawn(function()
        while wingsActive and isActivated do
            local targetPlayer = currentTargetPlayer
            if targetPlayer and targetPlayer.Parent == nil then
                targetPlayer = LP
                currentTargetPlayer = LP
            end
            local char = targetPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local baseCFrame = hrp.CFrame * wingOffset
                local propsList = getSortedProps(LP.Name)
                local remotes = {}
                for _, prop in ipairs(propsList) do
                    local remote = prop:FindFirstChild("SetCurrentCFrame")
                    if remote then
                        table.insert(remotes, remote)
                    end
                end
                if #remotes > 0 then
                    local totalAnims = #allAnims
                    local timeParam = (tick() * 10 * propspeed) % totalAnims
                    local index1 = math.floor(timeParam) + 1
                    local index2 = (index1 % totalAnims) + 1
                    local alpha = timeParam - math.floor(timeParam)

                    local anim1 = allAnims[index1]
                    local anim2 = allAnims[index2]

                    for idx, remote in ipairs(remotes) do
                        if idx <= #anim1 and idx <= #anim2 then
                            local cf1 = anim1[idx]
                            local cf2 = anim2[idx]
                            local smoothCF = cf1:Lerp(cf2, alpha)
                            local targetCFrame = getOff(baseCFrame, smoothCF)
                            task.spawn(function()
                                pcall(function()
                                    remote:InvokeServer(targetCFrame)
                                end)
                            end)
                        end
                    end
                end
            end
            task.wait(0.03)
        end
    end)
end

bActivate.MouseButton1Click:Connect(function()
    isActivated = not isActivated
    if isActivated then
        bActivate.BackgroundColor3 = getCol("Abyss")
        bActivate.BackgroundTransparency = 0
    else
        bActivate.BackgroundColor3 = Color3.new(0, 0, 0)
        bActivate.BackgroundTransparency = 0.5
        wingsActive = false
        bSummon.Text = "SUMMON ABYSS"
        bSummon.BackgroundColor3 = Color3.new(0, 0, 0)
        bSummon.BackgroundTransparency = 0.5
    end
end)

bSummon.MouseButton1Click:Connect(function()
    if not isActivated then return end
    wingsActive = not wingsActive
    if wingsActive then
        bSummon.Text = "STOP ABYSS"
        bSummon.BackgroundColor3 = getCol("Abyss")
        bSummon.BackgroundTransparency = 0
        startWings()
    else
        bSummon.Text = "SUMMON ABYSS WINGS"
        bSummon.BackgroundColor3 = Color3.new(0, 0, 0)
        bSummon.BackgroundTransparency = 0.5
    end
end)

bDismantle.MouseButton1Click:Connect(function() end)

MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    MinBtn.Text = isMinimized and "▼" or "▲"
    TS:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
        Size = isMinimized and UDim2.new(0, 260, 0, 40) or UDim2.new(0, 260, 0, 380)
    }):Play()
    Content.Visible = not isMinimized
    if isMinimized then 
        DropdownList.Visible = false 
        ColorPickerFrame.Visible = false
        colorPickerOpen = false
    end
end)
