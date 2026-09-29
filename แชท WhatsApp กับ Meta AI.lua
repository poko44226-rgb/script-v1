-- ============================================================
-- VARIABLES
-- ============================================================

local propCache      = {}
local currentCFrames = {}
local isAktif        = false
local isAntiSit      = false

local walkBlend      = 0
local sineTime       = 0
local serverTimer    = 0
local serverInterval = 1/30
local waveTime       = 0

-- ============================================================
-- SETTINGS
-- ============================================================

local WALK_SINE_SPEED = 1.2
local WALK_BLEND_MAX  = 1.0
local LERP_SPEED_IDLE = 8
local LERP_SPEED_WALK = 10
local BLEND_IN_SPEED  = 3
local BLEND_OUT_SPEED = 2
local HEIGHT_OFFSET   = -0.8
local BACK_OFFSET     = 3.5
local SIDE_OFFSET     = 0
local DIRECTION_FIX   = CFrame.Angles(0, math.rad(180), 0)

-- ============================================================
-- COLOR SYSTEM (HITAM)
-- ============================================================

local selectedColorName = "HITAM"
local selectedColor     = Color3.fromRGB(10, 10, 10)
local specialColorA     = Color3.fromRGB(10, 10, 10)
local specialColorB     = Color3.fromRGB(10, 10, 10)
local specialMode       = false

-- ============================================================
-- GUI
-- ============================================================

local function AddCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadAngelGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 210, 0, 185)
Main.Position = UDim2.new(0.5, -105, 0.5, -92)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(80, 80, 80)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
AddCorner(Main, 10)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 44)
Header.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Header.BorderSizePixel = 0
Header.Parent = Main
AddCorner(Header, 10)

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 10)
HeaderCover.Position = UDim2.new(0, 0, 1, -10)
HeaderCover.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.75, 0, 0, 20)
TitleText.Position = UDim2.new(0.06, 0, 0, 2)
TitleText.Text = "DEAD ANGEL"
TitleText.TextColor3 = Color3.fromRGB(220, 220, 220)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 13
TitleText.BackgroundTransparency = 1
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Header

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Size = UDim2.new(0.75, 0, 0, 13)
CreditLabel.Position = UDim2.new(0.06, 0, 0, 20)
CreditLabel.Text = "BY VEYTON.LSP"
CreditLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
CreditLabel.Font = Enum.Font.SourceSansItalic
CreditLabel.TextSize = 9
CreditLabel.BackgroundTransparency = 1
CreditLabel.TextXAlignment = Enum.TextXAlignment.Left
CreditLabel.Parent = Header

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Position = UDim2.new(1, -26, 0.5, -11)
MinBtn.BackgroundTransparency = 1
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.TextSize = 16
MinBtn.Parent = Header

local MiniCircle = Instance.new("TextButton")
MiniCircle.Size = UDim2.new(0, 38, 0, 38)
MiniCircle.Position = UDim2.new(0.5, -19, 0.1, 0)
MiniCircle.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MiniCircle.BorderSizePixel = 2
MiniCircle.BorderColor3 = Color3.fromRGB(80, 80, 80)
MiniCircle.Text = "DA"
MiniCircle.TextColor3 = Color3.fromRGB(200, 200, 200)
MiniCircle.Font = Enum.Font.SourceSansBold
MiniCircle.TextSize = 11
MiniCircle.Visible = false
MiniCircle.Active = true
MiniCircle.Draggable = true
MiniCircle.Parent = ScreenGui
AddCorner(MiniCircle, 19)

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 1, -44)
Container.Position = UDim2.new(0, 0, 0, 44)
Container.BackgroundTransparency = 1
Container.Parent = Main

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 4)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.Parent = Container

local UIPad = Instance.new("UIPadding")
UIPad.PaddingTop = UDim.new(0, 6)
UIPad.Parent = Container

local function CreateButton(text, order)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0.9, 0, 0, 26)
    Btn.LayoutOrder = order
    Btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Btn.BorderSizePixel = 1
    Btn.BorderColor3 = Color3.fromRGB(60, 60, 60)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 11
    Btn.AutoButtonColor = true
    Btn.Parent = Container
    AddCorner(Btn, 6)
    return Btn
end

local AktifBtn   = CreateButton("AKTIF : OFF", 1)
local AntiSitBtn = CreateButton("ANTI SIT : OFF", 2)
local ColorBtn   = CreateButton("COLOR : HITAM", 3)

-- ============================================================
-- COLOR MENU
-- ============================================================

local ColorMenu = Instance.new("Frame")
ColorMenu.Size = UDim2.new(0, 220, 0, 310)
ColorMenu.Position = UDim2.new(1, 8, 0, 45)
ColorMenu.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
ColorMenu.BorderSizePixel = 2
ColorMenu.BorderColor3 = Color3.fromRGB(80, 80, 80)
ColorMenu.Visible = false
ColorMenu.ZIndex = 50
ColorMenu.Parent = Main
AddCorner(ColorMenu, 8)

local ColorTitle = Instance.new("TextLabel")
ColorTitle.Size = UDim2.new(1, 0, 0, 25)
ColorTitle.BackgroundTransparency = 1
ColorTitle.Text = "PILIH WARNA"
ColorTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
ColorTitle.Font = Enum.Font.SourceSansBold
ColorTitle.TextSize = 12
ColorTitle.ZIndex = 51
ColorTitle.Parent = ColorMenu

local ColorScroll = Instance.new("ScrollingFrame")
ColorScroll.Size = UDim2.new(1, -8, 1, -32)
ColorScroll.Position = UDim2.new(0, 4, 0, 28)
ColorScroll.BackgroundTransparency = 1
ColorScroll.BorderSizePixel = 0
ColorScroll.ScrollBarThickness = 5
ColorScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
ColorScroll.ZIndex = 51
ColorScroll.Parent = ColorMenu

local ColorList = Instance.new("UIListLayout")
ColorList.SortOrder = Enum.SortOrder.LayoutOrder
ColorList.Padding = UDim.new(0, 3)
ColorList.Parent = ColorScroll

local colorOrder = 0

local function CreateSection(text)
    colorOrder += 1
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -4, 0, 22)
    Label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Label.BorderSizePixel = 1
    Label.BorderColor3 = Color3.fromRGB(60, 60, 60)
    Label.Text = "◆ " .. text
    Label.TextColor3 = Color3.fromRGB(180, 180, 180)
    Label.Font = Enum.Font.SourceSansBold
    Label.TextSize = 11
    Label.LayoutOrder = colorOrder
    Label.ZIndex = 52
    Label.Parent = ColorScroll
    AddCorner(Label, 5)
    return Label
end

local function CreateColorButton(name, color, isSpecial)
    colorOrder += 1
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(1, -4, 0, 25)
    B.LayoutOrder = colorOrder
    B.BackgroundColor3 = color
    B.BorderSizePixel = 1
    B.BorderColor3 = Color3.fromRGB(60, 60, 60)
    B.Text = name
    B.TextColor3 = Color3.fromRGB(255, 255, 255)
    B.Font = Enum.Font.SourceSansBold
    B.TextSize = 10
    B.ZIndex = 52
    B.Parent = ColorScroll
    AddCorner(B, 5)
    B.MouseButton1Click:Connect(function()
        selectedColorName = name
        specialMode = isSpecial == true
        if not isSpecial then
            selectedColor = color
            specialColorA = color
            specialColorB = color
        end
        ColorBtn.Text = "COLOR : " .. name
        ColorMenu.Visible = false
    end)
    return B
end

CreateSection("WARNA NORMAL")
CreateColorButton("HITAM",  Color3.fromRGB(10,10,10),    false)
CreateColorButton("PUTIH",  Color3.fromRGB(255,255,255), false)
CreateColorButton("MERAH",  Color3.fromRGB(255,0,0),     false)
CreateColorButton("BIRU",   Color3.fromRGB(0,100,255),   false)
CreateColorButton("HIJAU",  Color3.fromRGB(0,255,80),    false)
CreateColorButton("KUNING", Color3.fromRGB(255,220,0),   false)
CreateColorButton("ORANYE", Color3.fromRGB(255,120,0),   false)
CreateColorButton("PINK",   Color3.fromRGB(255,0,170),   false)
CreateColorButton("CYAN",   Color3.fromRGB(0,255,255),   false)
CreateColorButton("UNGU",   Color3.fromRGB(170,0,255),   false)

CreateSection("WARNA SPESIAL")
local SpecialColors = {
    {"HITAM + PUTIH",  Color3.fromRGB(10,10,10),   Color3.fromRGB(255,255,255)},
    {"HITAM + MERAH",  Color3.fromRGB(10,10,10),   Color3.fromRGB(255,0,0)},
    {"HITAM + BIRU",   Color3.fromRGB(10,10,10),   Color3.fromRGB(0,100,255)},
    {"HITAM + UNGU",   Color3.fromRGB(10,10,10),   Color3.fromRGB(170,0,255)},
    {"MERAH + UNGU",   Color3.fromRGB(255,0,0),    Color3.fromRGB(170,0,255)},
    {"MERAH + BIRU",   Color3.fromRGB(255,0,0),    Color3.fromRGB(0,100,255)},
    {"UNGU + BIRU",    Color3.fromRGB(170,0,255),  Color3.fromRGB(0,100,255)},
    {"CYAN + UNGU",    Color3.fromRGB(0,255,255),  Color3.fromRGB(170,0,255)},
}
for _, data in ipairs(SpecialColors) do
    local name, colorA, colorB = data[1], data[2], data[3]
    local B = CreateColorButton(name, colorA:Lerp(colorB, 0.5), true)
    B.MouseButton1Click:Connect(function()
        selectedColorName = name
        specialMode = true
        specialColorA = colorA
        specialColorB = colorB
        ColorBtn.Text = "COLOR : " .. name
        ColorMenu.Visible = false
    end)
end

CreateColorButton("RAINBOW", Color3.fromRGB(180,60,255), true)
CreateColorButton("RGB",     Color3.fromRGB(60,60,60),   true)

ColorList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ColorScroll.CanvasSize = UDim2.new(0, 0, 0, ColorList.AbsoluteContentSize.Y + 8)
end)

ColorBtn.MouseButton1Click:Connect(function()
    ColorMenu.Visible = not ColorMenu.Visible
end)

-- ============================================================
-- COLOR FUNCTIONS
-- ============================================================

local function PulseColor(base, index)
    local phase = waveTime * 2.5 + ((index - 1) * 0.45)
    local pulse = (math.sin(phase) + 1) / 2
    local h, s, v = Color3.toHSV(base)
    return Color3.fromHSV(h, s, math.clamp(0.45 + 0.55 * pulse, 0, 1))
end

local function GetWaveColor(index)
    if selectedColorName == "RAINBOW" then
        local hue = (waveTime * 0.35 + (index-1)/30) % 1
        local pulse = 0.55 + ((math.sin(waveTime*2.5+index*0.45)+1)/2)*0.45
        return Color3.fromHSV(hue, 1, pulse)
    end
    if selectedColorName == "RGB" then
        local hue = (waveTime * 0.7 + (index-1)/30) % 1
        local pulse = 0.5 + ((math.sin(waveTime*3+index)+1)/2)*0.5
        return Color3.fromHSV(hue, 1, pulse)
    end
    if specialMode then
        local t = (math.sin(waveTime*2+index*0.5)+1)/2
        return PulseColor(specialColorA:Lerp(specialColorB, t), index)
    end
    return PulseColor(selectedColor, index)
end

local function ApplyColor(prop, index)
    if not prop or not prop.Parent then return end
    local color = GetWaveColor(index)
    if prop:IsA("BasePart") then prop.Color = color end
    for _, obj in ipairs(prop:GetDescendants()) do
        if obj:IsA("BasePart") then obj.Color = color end
    end
end

-- ============================================================
-- GUI GLOW
-- ============================================================

local glowTime = 0
RS.RenderStepped:Connect(function(dt)
    glowTime += dt
    local pulse = (math.sin(glowTime * 2.5) + 1) / 2
    Main.BorderColor3 = Color3.fromRGB(
        40 + math.floor(pulse*60),
        40 + math.floor(pulse*60),
        40 + math.floor(pulse*60)
    )
    MiniCircle.BorderColor3 = Main.BorderColor3
    TitleText.TextColor3 = Color3.fromRGB(
        180 + math.floor(pulse*75),
        180 + math.floor(pulse*75),
        180 + math.floor(pulse*75)
    )
    CreditLabel.TextColor3 = Color3.fromRGB(
        100 + math.floor(pulse*80),
        100 + math.floor(pulse*80),
        100 + math.floor(pulse*80)
    )
end)

-- ============================================================
-- PROP FUNCTIONS
-- ============================================================

local function GetPropFolder()
    local wc = workspace:FindFirstChild("WorkspaceCom")
    if not wc then return nil end
    return wc:FindFirstChild("001_TrafficCones")
end

local function IsMyProp(v)
    if not v then return false end
    if not v.Name:find("Prop") then return false end
    if not v.Name:find(LP.Name) then return false end
    return true
end

local function ScanProps()
    local folder = GetPropFolder()
    if not folder then return 0 end
    local existing = {}
    for i = 1, 30 do
        local p = propCache[i]
        if p and p.Parent and IsMyProp(p) then
            existing[p] = true
        else
            propCache[i]      = nil
            currentCFrames[i] = nil
        end
    end
    local newProps = {}
    for _, v in ipairs(folder:GetChildren()) do
        if IsMyProp(v) and not existing[v] then
            table.insert(newProps, v)
        end
    end
    table.sort(newProps, function(a, b)
        local na = tonumber(a.Name:match("(%d+)%D*$"))
        local nb = tonumber(b.Name:match("(%d+)%D*$"))
        if na and nb then return na < nb end
        if na then return true end
        if nb then return false end
        return a.Name < b.Name
    end)
    for _, np in ipairs(newProps) do
        for i = 1, 30 do
            if not propCache[i] then
                propCache[i] = np
                break
            end
        end
    end
    local count = 0
    for i = 1, 30 do if propCache[i] then count += 1 end end
    return count
end

-- ============================================================
-- CFRAMES
-- ============================================================

local basePIdle = CFrame.new(-20.15, 34.15, 398.23) * CFrame.Angles(-3.14, 0, -3.14)

local IdleData = {
    { cf = CFrame.new(9.63,-1.03,78.5) * CFrame.Angles(2.5,0.01,0.01) },
    { cf = CFrame.new(5.85,-1.03,78.71) * CFrame.Angles(2.5,0.01,0.01) },
    { cf = CFrame.new(9.88,0.05,77.31) * CFrame.Angles(-3,-0.03,1.49) },
    { cf = CFrame.new(5.51,0.05,77.1) * CFrame.Angles(0.15,-0.06,-1.65) },
    { cf = CFrame.new(5.83,2.7,74.22) * CFrame.Angles(-1.83,0.01,-1.58) },
    { cf = CFrame.new(8.66,2.7,74.48) * CFrame.Angles(-1.83,0.01,-1.58) },
    { cf = CFrame.new(8.62,5.15,72.03) * CFrame.Angles(-2.88,0,-1.59) },
    { cf = CFrame.new(5.83,5.15,71.89) * CFrame.Angles(-2.88,0,-1.59) },
    { cf = CFrame.new(9.26,9.7,60.59) * CFrame.Angles(-1.68,-0.3,-1.99) },
    { cf = CFrame.new(8.54,10.08,54.16) * CFrame.Angles(-1.51,0,3.1) },
    { cf = CFrame.new(8.57,10.65,54.29) * CFrame.Angles(-2.02,0.02,-0.05) },
    { cf = CFrame.new(6.88,8.75,48.29) * CFrame.Angles(1.35,-0.71,1.63) },
    { cf = CFrame.new(7.03,10.66,50.99) * CFrame.Angles(1.9,-0.71,1.78) },
    { cf = CFrame.new(11.05,9.09,48.37) * CFrame.Angles(1.28,0.65,1.63) },
    { cf = CFrame.new(6.49,6.85,48.5) * CFrame.Angles(-1.25,-1.05,-1.24) },
    { cf = CFrame.new(7.75,8.2,73.2) * CFrame.Angles(-1.41,0.74,-0.05) },
    { cf = CFrame.new(-6.84,14.25,63.33) * CFrame.Angles(-1.8,0.28,-1.34) },
    { cf = CFrame.new(-0.3,1.38,41.06) * CFrame.Angles(1.11,-0.23,0.27) },
    { cf = CFrame.new(19.58,1.33,42.77) * CFrame.Angles(-2.09,-0.08,-3) },
    { cf = CFrame.new(0,-0.56,40.25) * CFrame.Angles(-3.07,-1.25,1.66) },
    { cf = CFrame.new(19.46,-0.56,41.8) * CFrame.Angles(0.11,-1.44,-1.45) },
    { cf = CFrame.new(20.21,-0.84,44.44) * CFrame.Angles(-0.39,0.05,-3.12) },
    { cf = CFrame.new(-1.32,-0.84,42.66) * CFrame.Angles(-0.39,-0.29,-3.12) },
    { cf = CFrame.new(18.64,-0.84,44.44) * CFrame.Angles(-0.39,0.05,-3.12) },
    { cf = CFrame.new(-0.35,-0.84,42.9) * CFrame.Angles(-0.39,-0.29,-3.12) },
    { cf = CFrame.new(10.47,11.05,51.26) * CFrame.Angles(1.66,0.88,1.53) },
    { cf = CFrame.new(10.69,7.2,49.24) * CFrame.Angles(-1.03,1.24,-2.28) },
    { cf = CFrame.new(20.28,5.89,48.5) * CFrame.Angles(-0.37,0.14,-1.51) },
    { cf = CFrame.new(8.25,11.39,64.94) * CFrame.Angles(0.09,0.01,-1.49) },
    { cf = CFrame.new(-1.99,4.99,46.85) * CFrame.Angles(-0.26,-0.18,-1.49) },
}

local basePWalk1 = CFrame.new(-24.45, 34.15, 398.78) * CFrame.Angles(0, 0, 0)

local Walk1Data = {
    { cf = CFrame.new(-5.98,-1.03,-69.46) * CFrame.Angles(0.18,-0.02,-3.14) },
    { cf = CFrame.new(-0.36,-1.03,-78.53) * CFrame.Angles(0.64,-0.02,-3.13) },
    { cf = CFrame.new(-6.41,-0.35,-70.84) * CFrame.Angles(-1.14,-0.02,-1.65) },
    { cf = CFrame.new(-0.19,0.05,-77.52) * CFrame.Angles(3,0.06,1.49) },
    { cf = CFrame.new(-0.57,2.7,-74.75) * CFrame.Angles(-1.31,-0.01,1.56) },
    { cf = CFrame.new(-5.27,2.35,-71.02) * CFrame.Angles(-1.74,-0.04,1.54) },
    { cf = CFrame.new(-4.71,5.5,-70.37) * CFrame.Angles(-0.95,-0.03,1.35) },
    { cf = CFrame.new(-1.03,5.15,-72.68) * CFrame.Angles(-0.29,0.12,1.73) },
    { cf = CFrame.new(-4.87,9.7,-61.15) * CFrame.Angles(3.01,0.57,1.92) },
    { cf = CFrame.new(-4.16,10.08,-54.72) * CFrame.Angles(-1.63,0,-0.04) },
    { cf = CFrame.new(-4.19,10.65,-54.85) * CFrame.Angles(-1.12,-0.02,3.1) },
    { cf = CFrame.new(-2.51,8.75,-48.84) * CFrame.Angles(1.79,0.71,-1.51) },
    { cf = CFrame.new(-2.65,10.66,-51.55) * CFrame.Angles(1.24,0.71,-1.36) },
    { cf = CFrame.new(-6.67,9.09,-48.93) * CFrame.Angles(1.86,-0.64,-1.51) },
    { cf = CFrame.new(-2.11,6.85,-49.06) * CFrame.Angles(-1.89,1.05,1.9) },
    { cf = CFrame.new(-3.34,8.2,-73.76) * CFrame.Angles(-1.74,-0.74,3.09) },
    { cf = CFrame.new(9.36,13,-53.93) * CFrame.Angles(-2.78,0.48,1.25) },
    { cf = CFrame.new(2.43,0.48,-32.85) * CFrame.Angles(2.03,0.23,-2.87) },
    { cf = CFrame.new(-14.34,1.33,-47.17) * CFrame.Angles(-1.06,0.08,0.14) },
    { cf = CFrame.new(1.97,-0.51,-30.98) * CFrame.Angles(0.87,1.34,2.95) },
    { cf = CFrame.new(-14.77,-0.56,-46.06) * CFrame.Angles(3.03,1.44,1.7) },
    { cf = CFrame.new(-15.83,-0.84,-48.32) * CFrame.Angles(-2.75,-0.05,0.02) },
    { cf = CFrame.new(1.54,-3.24,-28.01) * CFrame.Angles(0.22,-0.29,-0.07) },
    { cf = CFrame.new(-14.41,-0.84,-48.49) * CFrame.Angles(-2.75,-0.05,0.02) },
    { cf = CFrame.new(0.25,-3.24,-28.51) * CFrame.Angles(0.26,-0.29,-0.06) },
    { cf = CFrame.new(-6.09,11.05,-51.82) * CFrame.Angles(1.48,-0.88,-1.61) },
    { cf = CFrame.new(-6.32,7.2,-49.8) * CFrame.Angles(-2.11,-1.24,0.85) },
    { cf = CFrame.new(-15.17,5.74,-52.98) * CFrame.Angles(-2.78,-0.11,1.37) },
    { cf = CFrame.new(-3.73,10.94,-64.91) * CFrame.Angles(3.01,0.08,1.53) },
    { cf = CFrame.new(4.75,5.74,-39.51) * CFrame.Angles(-2.72,0.26,1.37) },
}

local basePWalk2 = CFrame.new(-24.45, 34.15, 398.78) * CFrame.Angles(0, 0, 0)

local Walk2Data = {
    { cf = CFrame.new(-5.21,-1.03,-79.06) * CFrame.Angles(0.64,-0.02,-3.13) },
    { cf = CFrame.new(-1.85,-1.43,-71.98) * CFrame.Angles(0.03,0,-3.13) },
    { cf = CFrame.new(-5.46,0.05,-77.88) * CFrame.Angles(-0.14,0.03,-1.66) },
    { cf = CFrame.new(-1.19,-0.65,-72.91) * CFrame.Angles(1.97,0.1,1.58) },
    { cf = CFrame.new(-1.14,1.65,-72.72) * CFrame.Angles(-1.88,-0.01,1.54) },
    { cf = CFrame.new(-4.24,2.7,-75.04) * CFrame.Angles(-1.31,-0.01,1.56) },
    { cf = CFrame.new(-4.21,5.15,-72.59) * CFrame.Angles(-0.27,-0.01,1.55) },
    { cf = CFrame.new(-1.16,5.15,-71.26) * CFrame.Angles(-0.59,0.05,1.57) },
    { cf = CFrame.new(-4.87,9.7,-61.15) * CFrame.Angles(-2.85,-0.38,1.86) },
    { cf = CFrame.new(-4.16,10.08,-54.72) * CFrame.Angles(-1.63,0,-0.04) },
    { cf = CFrame.new(-4.19,10.65,-54.85) * CFrame.Angles(-1.12,-0.02,3.1) },
    { cf = CFrame.new(-2.51,8.75,-48.84) * CFrame.Angles(1.79,0.71,-1.51) },
    { cf = CFrame.new(-2.65,10.66,-51.55) * CFrame.Angles(1.24,0.71,-1.36) },
    { cf = CFrame.new(-6.67,9.09,-48.93) * CFrame.Angles(1.86,-0.64,-1.51) },
    { cf = CFrame.new(-2.11,6.85,-49.06) * CFrame.Angles(-1.89,1.05,1.9) },
    { cf = CFrame.new(-3.34,8.2,-73.76) * CFrame.Angles(-1.74,-0.74,3.09) },
    { cf = CFrame.new(10.62,14.25,-64.7) * CFrame.Angles(-3.04,-0.28,1.25) },
    { cf = CFrame.new(4.78,1.88,-42.5) * CFrame.Angles(2.03,0.23,-2.87) },
    { cf = CFrame.new(-14.21,1.38,-32.21) * CFrame.Angles(-1.13,0.07,0.14) },
    { cf = CFrame.new(4.59,-0.56,-41.6) * CFrame.Angles(-0.07,1.25,-1.48) },
    { cf = CFrame.new(-13.69,0.09,-30.37) * CFrame.Angles(2.98,1.33,1.09) },
    { cf = CFrame.new(6.54,5.94,-48.42) * CFrame.Angles(-2.61,0.2,1.6) },
    { cf = CFrame.new(5.95,-0.84,-43.9) * CFrame.Angles(-2.75,0.3,0.02) },
    { cf = CFrame.new(-13.98,-3.14,-27.16) * CFrame.Angles(0.15,0.16,-0.01) },
    { cf = CFrame.new(4.88,-0.84,-44.24) * CFrame.Angles(-2.75,0.3,0.02) },
    { cf = CFrame.new(-6.09,11.05,-51.82) * CFrame.Angles(1.48,-0.88,-1.61) },
    { cf = CFrame.new(-6.32,7.2,-49.8) * CFrame.Angles(-2.11,-1.24,0.85) },
    { cf = CFrame.new(-15.49,5.89,-39.39) * CFrame.Angles(-2.58,-0.12,1.66) },
    { cf = CFrame.new(-3.85,11.39,-65.5) * CFrame.Angles(3.05,-0.01,1.65) },
    { cf = CFrame.new(-12.33,-3.14,-27.5) * CFrame.Angles(0.15,0.22,-0.01) },
}

local function getWorldCF(baseP, localCF)
    return baseP * localCF
end

local idleCenter  = getWorldCF(basePIdle,  IdleData[1].cf).Position
local walk1Center = getWorldCF(basePWalk1, Walk1Data[1].cf).Position
local walk2Center = getWorldCF(basePWalk2, Walk2Data[1].cf).Position

local TOTAL_PROPS = 30

-- ============================================================
-- PROP RESPAWN HANDLER
-- ============================================================

-- Saat props respawn/taruh ulang, tetap ngebentuk
local function OnPropAdded(v)
    if not isAktif then return end
    if not IsMyProp(v) then return end
    -- Force scan ulang dan reset currentCFrames untuk prop baru
    -- tapi JANGAN clear semua, biar prop lain tetap smooth
    local folder = GetPropFolder()
    if not folder then return end
    -- Cek apakah prop sudah ada di cache
    for i = 1, 30 do
        if propCache[i] == v then return end
    end
    -- Tambah ke slot kosong
    for i = 1, 30 do
        if not propCache[i] then
            propCache[i] = v
            -- Set currentCFrame ke target langsung biar ga amburadul
            local char = LP.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local baseCF = hrp.CFrame * CFrame.new(SIDE_OFFSET, HEIGHT_OFFSET, BACK_OFFSET) * DIRECTION_FIX
                local idleData = IdleData[i]
                if idleData then
                    local idleWorldCF = getWorldCF(basePIdle, idleData.cf)
                    local idleOff = idleWorldCF.Position - idleCenter
                    local idleRot = idleWorldCF - idleWorldCF.Position
                    -- Langsung set biar ga amburadul
                    currentCFrames[i] = baseCF * CFrame.new(idleOff) * idleRot
                end
            end
            break
        end
    end
end

-- Pasang listener prop baru
local function WatchPropFolder()
    local folder = GetPropFolder()
    if not folder then
        -- Tunggu WorkspaceCom dan folder nya
        workspace.ChildAdded:Connect(function(child)
            if child.Name == "WorkspaceCom" then
                task.wait(0.5)
                WatchPropFolder()
            end
        end)
        return
    end
    folder.ChildAdded:Connect(function(v)
        task.wait(0.1)
        OnPropAdded(v)
    end)
end

task.spawn(WatchPropFolder)

-- ============================================================
-- BUTTONS
-- ============================================================

AktifBtn.MouseButton1Click:Connect(function()
    isAktif = not isAktif
    if isAktif then
        propCache      = {}
        currentCFrames = {}
        walkBlend      = 0
        sineTime       = 0
        local count    = ScanProps()
        AktifBtn.Text             = "AKTIF : ON"
        AktifBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        print("DEAD ANGEL: " .. count .. "/" .. TOTAL_PROPS .. " PROPS")
    else
        AktifBtn.Text             = "AKTIF : OFF"
        AktifBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    end
end)

AntiSitBtn.MouseButton1Click:Connect(function()
    isAntiSit = not isAntiSit
    AntiSitBtn.Text             = isAntiSit and "ANTI SIT : ON" or "ANTI SIT : OFF"
    AntiSitBtn.BackgroundColor3 = isAntiSit and Color3.fromRGB(30,30,30) or Color3.fromRGB(15,15,15)
end)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    Main.Visible = not minimized
    MiniCircle.Visible = minimized
end)
MiniCircle.MouseButton1Click:Connect(function()
    minimized = false
    Main.Visible = true
    MiniCircle.Visible = false
end)

-- ============================================================
-- ENGINE
-- ============================================================

RS:BindToRenderStep("DeadAngelEngine", 1, function(dt)

    waveTime += dt

    local char = LP.Character
    if not char then return end

    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local hrp      = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end

    if isAntiSit then
        humanoid.Sit = false
        if humanoid:GetState() == Enum.HumanoidStateType.Seated then
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end

    if not isAktif then return end

    ScanProps()

    -- WALK BLEND + MATH.SIN
    local moving = humanoid.MoveDirection.Magnitude > 0.1
    if moving then
        walkBlend = walkBlend + (1 - walkBlend) * (1 - math.exp(-BLEND_IN_SPEED * dt))
        sineTime += dt
    else
        walkBlend = walkBlend + (0 - walkBlend) * (1 - math.exp(-BLEND_OUT_SPEED * dt))
    end
    walkBlend = math.clamp(walkBlend, 0, 1)

    local stepBlend  = math.abs(math.sin(sineTime * math.pi * WALK_SINE_SPEED))
    local finalBlend = moving and (stepBlend * walkBlend * WALK_BLEND_MAX) or 0
    local walkWeight = moving and walkBlend or 0

    -- BASE CF ikut player
    local baseCF =
        hrp.CFrame
        * CFrame.new(SIDE_OFFSET, HEIGHT_OFFSET, BACK_OFFSET)
        * DIRECTION_FIX

    -- SERVER TIMER
    serverTimer += dt
    local sendServer = false
    if serverTimer >= serverInterval then
        serverTimer = 0
        sendServer  = true
    end

    -- LERP ALPHA (lebih tinggi = lebih smooth, gak lag)
    local lerpSpeed = moving and LERP_SPEED_WALK or LERP_SPEED_IDLE
    local lerpAlpha = 1 - math.exp(-lerpSpeed * dt)

    -- 30 PROPS LOOP
    for i = 1, TOTAL_PROPS do
        local prop = propCache[i]
        if prop and prop.Parent then
            local idleData  = IdleData[i]
            local walk1Data = Walk1Data[i]
            local walk2Data = Walk2Data[i]

            if idleData and walk1Data and walk2Data then

                local idleWorldCF  = getWorldCF(basePIdle,  idleData.cf)
                local walk1WorldCF = getWorldCF(basePWalk1, walk1Data.cf)
                local walk2WorldCF = getWorldCF(basePWalk2, walk2Data.cf)

                local idleOff  = idleWorldCF.Position  - idleCenter
                local walk1Off = walk1WorldCF.Position - walk1Center
                local walk2Off = walk2WorldCF.Position - walk2Center

                local idleRot  = idleWorldCF  - idleWorldCF.Position
                local walk1Rot = walk1WorldCF - walk1WorldCF.Position
                local walk2Rot = walk2WorldCF - walk2WorldCF.Position

                -- Blend walk1 <-> walk2 pakai math.sin
                local wOff = walk1Off:Lerp(walk2Off, finalBlend)
                local wRot = walk1Rot:Lerp(walk2Rot, finalBlend)

                -- Blend idle <-> walk
                local finalOffset = idleOff:Lerp(wOff, walkWeight)
                local finalRot    = idleRot:Lerp(wRot, walkWeight)

                local targetCF = baseCF * CFrame.new(finalOffset) * finalRot

                -- LERP ALPHA smooth, gak lag
                if not currentCFrames[i] then
                    -- Prop baru: langsung set ke target biar gak amburadul
                    currentCFrames[i] = targetCF
                else
                    currentCFrames[i] = currentCFrames[i]:Lerp(targetCF, lerpAlpha)
                end

                -- TASK.SPAWN kirim ke server async
                if sendServer then
                    local cf         = currentCFrames[i]
                    local targetProp = prop
                    local idx        = i
                    task.spawn(function()
                        pcall(function()
                            local rCF = targetProp:FindFirstChild("SetCurrentCFrame")
                            if rCF then rCF:InvokeServer(cf) end
                            local rColor = targetProp:FindFirstChild("ChangePropColor")
                            if rColor then rColor:InvokeServer(GetWaveColor(idx)) end
                        end)
                    end)
                end

                ApplyColor(prop, i)
            end
        end
    end
end)

print("==========================================")
print("           DEAD ANGEL V1")
print("          BY VEYTON.LSP")
print("==========================================")
print("30 PROPS | IDLE + WALK1 + WALK2")
print("LERP ALPHA + MATH.SIN + TASK.SPAWN")
print("COLOR SYSTEM AKTIF")
print("==========================================")