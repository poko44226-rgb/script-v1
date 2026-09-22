
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LP = Players.LocalPlayer

pcall(function()
    RunService:UnbindFromRenderStep("DeadAngelEngine")
end)

pcall(function()
    local old = CoreGui:FindFirstChild("DeadAngelGui")
    if old then
        old:Destroy()
    end
end)

--==================================================
-- VARIABLES
--==================================================

local propCache = {}
local currentCFrames = {}

local isAktif = false
local isAntiSit = false

local walkBlend = 0
local sineTime = 0

local waveTime = 0
local serverTimer = 0

--==================================================
-- SETTINGS
--==================================================

local TOTAL_PROPS = 30

local WALK_SINE_SPEED = 1.2

local LERP_SPEED_IDLE = 8
local LERP_SPEED_WALK = 10

local BLEND_IN_SPEED = 3
local BLEND_OUT_SPEED = 2

local HEIGHT_OFFSET = -0.8
local BACK_OFFSET = 3.5
local SIDE_OFFSET = 0

local DIRECTION_FIX =
    CFrame.Angles(0, math.rad(180), 0)

local SERVER_INTERVAL = 1 / 30

--==================================================
-- COLOR
--==================================================

local BLACK = Color3.fromRGB(10, 10, 10)

--==================================================
-- GUI
--==================================================

local function AddCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DeadAngelGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

--==================================================
-- MAIN
--==================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 210, 0, 155)
Main.Position = UDim2.new(0.5, -105, 0.5, -78)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(70, 70, 70)
Main.Active = true
Main.ZIndex = 10
Main.Parent = ScreenGui

AddCorner(Main, 10)

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 42)
Header.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Header.BorderSizePixel = 0
Header.Active = true
Header.ZIndex = 11
Header.Parent = Main

AddCorner(Header, 10)

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 10)
HeaderCover.Position = UDim2.new(0, 0, 1, -10)
HeaderCover.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
HeaderCover.BorderSizePixel = 0
HeaderCover.ZIndex = 11
HeaderCover.Parent = Header

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.7, 0, 0, 20)
TitleText.Position = UDim2.new(0.06, 0, 0, 3)
TitleText.BackgroundTransparency = 1
TitleText.Text = "DEAD ANGEL"
TitleText.TextColor3 = Color3.fromRGB(220, 220, 220)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 13
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.ZIndex = 12
TitleText.Parent = Header

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Size = UDim2.new(0.7, 0, 0, 13)
CreditLabel.Position = UDim2.new(0.06, 0, 0, 22)
CreditLabel.BackgroundTransparency = 1
CreditLabel.Text = "BY VEYTON.LSP"
CreditLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
CreditLabel.Font = Enum.Font.SourceSansItalic
CreditLabel.TextSize = 9
CreditLabel.TextXAlignment = Enum.TextXAlignment.Left
CreditLabel.ZIndex = 12
CreditLabel.Parent = Header

--==================================================
-- MINIMIZE BUTTON
--==================================================

local MinBtn = Instance.new("TextButton")
MinBtn.Name = "Minimize"
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -34, 0, 6)
MinBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MinBtn.BorderSizePixel = 0
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(230, 230, 230)
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.TextSize = 18
MinBtn.AutoButtonColor = true
MinBtn.Active = true
MinBtn.ZIndex = 20
MinBtn.Parent = Header

AddCorner(MinBtn, 7)

--==================================================
-- CONTAINER
--==================================================

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 1, -42)
Container.Position = UDim2.new(0, 0, 0, 42)
Container.BackgroundTransparency = 1
Container.BorderSizePixel = 0
Container.Active = false
Container.ZIndex = 12
Container.Parent = Main

local UIList = Instance.new("UIListLayout")
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 5)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.Parent = Container

local UIPad = Instance.new("UIPadding")
UIPad.PaddingTop = UDim.new(0, 8)
UIPad.Parent = Container

--==================================================
-- BUTTON FUNCTION
--==================================================

local function CreateButton(text, order)
    local Btn = Instance.new("TextButton")

    Btn.Size = UDim2.new(0.9, 0, 0, 28)
    Btn.LayoutOrder = order

    Btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

    Btn.BorderSizePixel = 1
    Btn.BorderColor3 = Color3.fromRGB(60, 60, 60)

    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(225, 225, 225)

    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 11

    Btn.AutoButtonColor = true
    Btn.Active = true
    Btn.Selectable = true

    Btn.ZIndex = 20
    Btn.Parent = Container

    AddCorner(Btn, 6)

    return Btn
end

local AktifBtn = CreateButton(
    "AKTIF : OFF",
    1
)

local AntiSitBtn = CreateButton(
    "ANTI SIT : OFF",
    2
)

local ColorBtn = CreateButton(
    "COLOR : HITAM",
    3
)

--==================================================
-- MINI BUTTON
--==================================================

local MiniCircle = Instance.new("TextButton")

MiniCircle.Name = "MiniCircle"

MiniCircle.Size = UDim2.new(0, 46, 0, 46)
MiniCircle.Position = UDim2.new(0.5, -23, 0.5, -23)

MiniCircle.BackgroundColor3 = Color3.fromRGB(5, 5, 5)

MiniCircle.BorderSizePixel = 2
MiniCircle.BorderColor3 = Color3.fromRGB(80, 80, 80)

MiniCircle.Text = "DA"

MiniCircle.TextColor3 = Color3.fromRGB(220, 220, 220)

MiniCircle.Font = Enum.Font.SourceSansBold
MiniCircle.TextSize = 12

MiniCircle.Visible = false
MiniCircle.Active = true
MiniCircle.Selectable = true
MiniCircle.AutoButtonColor = true
MiniCircle.ZIndex = 100

MiniCircle.Parent = ScreenGui

AddCorner(MiniCircle, 23)

--==================================================
-- DRAG SYSTEM
--==================================================

local function MakeDraggable(guiObject)
    local dragging = false
    local dragStart
    local startPosition

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position
            startPosition = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then
            return
        end

        if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
            return
        end

        local delta = input.Position - dragStart

        guiObject.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end)
end

MakeDraggable(Header)
MakeDraggable(MiniCircle)

--==================================================
-- PROP FOLDER
--==================================================

local function GetPropFolder()
    local wc = workspace:FindFirstChild("WorkspaceCom")

    if not wc then
        return nil
    end

    return wc:FindFirstChild("001_TrafficCones")
end

local function IsMyProp(v)
    if not v then
        return false
    end

    if not v.Name:find("Prop") then
        return false
    end

    if not v.Name:find(LP.Name) then
        return false
    end

    return true
end

--==================================================
-- SCAN PROPS
--==================================================

local function ScanProps()
    local folder = GetPropFolder()

    if not folder then
        return 0
    end

    local existing = {}

    for i = 1, TOTAL_PROPS do
        local p = propCache[i]

        if p and p.Parent and IsMyProp(p) then
            existing[p] = true
        else
            propCache[i] = nil
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

        if na and nb then
            return na < nb
        end

        if na then
            return true
        end

        if nb then
            return false
        end

        return a.Name < b.Name
    end)

    for _, np in ipairs(newProps) do
        for i = 1, TOTAL_PROPS do
            if not propCache[i] then
                propCache[i] = np
                break
            end
        end
    end

    local count = 0

    for i = 1, TOTAL_PROPS do
        if propCache[i] then
            count += 1
        end
    end

    return count
end

--==================================================
-- CFRAMES
--==================================================

local basePIdle =
    CFrame.new(-20.15, 34.15, 398.23)
    * CFrame.Angles(-3.14, 0, -3.14)

local IdleData = {
    {cf=CFrame.new(9.63,-1.03,78.5)*CFrame.Angles(2.5,0.01,0.01)},
    {cf=CFrame.new(5.85,-1.03,78.71)*CFrame.Angles(2.5,0.01,0.01)},
    {cf=CFrame.new(9.88,0.05,77.31)*CFrame.Angles(-3,-0.03,1.49)},
    {cf=CFrame.new(5.51,0.05,77.1)*CFrame.Angles(0.15,-0.06,-1.65)},
    {cf=CFrame.new(5.83,2.7,74.22)*CFrame.Angles(-1.83,0.01,-1.58)},
    {cf=CFrame.new(8.66,2.7,74.48)*CFrame.Angles(-1.83,0.01,-1.58)},
    {cf=CFrame.new(8.62,5.15,72.03)*CFrame.Angles(-2.88,0,-1.59)},
    {cf=CFrame.new(5.83,5.15,71.89)*CFrame.Angles(-2.88,0,-1.59)},
    {cf=CFrame.new(9.26,9.7,60.59)*CFrame.Angles(-1.68,-0.3,-1.99)},
    {cf=CFrame.new(8.54,10.08,54.16)*CFrame.Angles(-1.51,0,3.1)},
    {cf=CFrame.new(8.57,10.65,54.29)*CFrame.Angles(-2.02,0.02,-0.05)},
    {cf=CFrame.new(6.88,8.75,48.29)*CFrame.Angles(1.35,-0.71,1.63)},
    {cf=CFrame.new(7.03,10.66,50.99)*CFrame.Angles(1.9,-0.71,1.78)},
    {cf=CFrame.new(11.05,9.09,48.37)*CFrame.Angles(1.28,0.65,1.63)},
    {cf=CFrame.new(6.49,6.85,48.5)*CFrame.Angles(-1.25,-1.05,-1.24)},
    {cf=CFrame.new(7.75,8.2,73.2)*CFrame.Angles(-1.41,0.74,-0.05)},
    {cf=CFrame.new(-6.84,14.25,63.33)*CFrame.Angles(-1.8,0.28,-1.34)},
    {cf=CFrame.new(-0.3,1.38,41.06)*CFrame.Angles(1.11,-0.23,0.27)},
    {cf=CFrame.new(19.58,1.33,42.77)*CFrame.Angles(-2.09,-0.08,-3)},
    {cf=CFrame.new(0,-0.56,40.25)*CFrame.Angles(-3.07,-1.25,1.66)},
    {cf=CFrame.new(19.46,-0.56,41.8)*CFrame.Angles(0.11,-1.44,-1.45)},
    {cf=CFrame.new(20.21,-0.84,44.44)*CFrame.Angles(-0.39,0.05,-3.12)},
    {cf=CFrame.new(-1.32,-0.84,42.66)*CFrame.Angles(-0.39,-0.29,-3.12)},
    {cf=CFrame.new(18.64,-0.84,44.44)*CFrame.Angles(-0.39,0.05,-3.12)},
    {cf=CFrame.new(-0.35,-0.84,42.9)*CFrame.Angles(-0.39,-0.29,-3.12)},
    {cf=CFrame.new(10.47,11.05,51.26)*CFrame.Angles(1.66,0.88,1.53)},
    {cf=CFrame.new(10.69,7.2,49.24)*CFrame.Angles(-1.03,1.24,-2.28)},
    {cf=CFrame.new(20.28,5.89,48.5)*CFrame.Angles(-0.37,0.14,-1.51)},
    {cf=CFrame.new(8.25,11.39,64.94)*CFrame.Angles(0.09,0.01,-1.49)},
    {cf=CFrame.new(-1.99,4.99,46.85)*CFrame.Angles(-0.26,-0.18,-1.49)},
}

local basePWalk1 =
    CFrame.new(-24.45,34.15,398.78)

local Walk1Data = {
    {cf=CFrame.new(-5.98,-1.03,-69.46)*CFrame.Angles(0.18,-0.02,-3.14)},
    {cf=CFrame.new(-0.36,-1.03,-78.53)*CFrame.Angles(0.64,-0.02,-3.13)},
    {cf=CFrame.new(-6.41,-0.35,-70.84)*CFrame.Angles(-1.14,-0.02,-1.65)},
    {cf=CFrame.new(-0.19,0.05,-77.52)*CFrame.Angles(3,0.06,1.49)},
    {cf=CFrame.new(-0.57,2.7,-74.75)*CFrame.Angles(-1.31,-0.01,1.56)},
    {cf=CFrame.new(-5.27,2.35,-71.02)*CFrame.Angles(-1.74,-0.04,1.54)},
    {cf=CFrame.new(-4.71,5.5,-70.37)*CFrame.Angles(-0.95,-0.03,1.35)},
    {cf=CFrame.new(-1.03,5.15,-72.68)*CFrame.Angles(-0.29,0.12,1.73)},
    {cf=CFrame.new(-4.87,9.7,-61.15)*CFrame.Angles(3.01,0.57,1.92)},
    {cf=CFrame.new(-4.16,10.08,-54.72)*CFrame.Angles(-1.63,0,-0.04)},
    {cf=CFrame.new(-4.19,10.65,-54.85)*CFrame.Angles(-1.12,-0.02,3.1)},
    {cf=CFrame.new(-2.51,8.75,-48.84)*CFrame.Angles(1.79,0.71,-1.51)},
    {cf=CFrame.new(-2.65,10.66,-51.55)*CFrame.Angles(1.24,0.71,-1.36)},
    {cf=CFrame.new(-6.67,9.09,-48.93)*CFrame.Angles(1.86,-0.64,-1.51)},
    {cf=CFrame.new(-2.11,6.85,-49.06)*CFrame.Angles(-1.89,1.05,1.9)},
    {cf=CFrame.new(-3.34,8.2,-73.76)*CFrame.Angles(-1.74,-0.74,3.09)},
    {cf=CFrame.new(9.36,13,-53.93)*CFrame.Angles(-2.78,0.48,1.25)},
    {cf=CFrame.new(2.43,0.48,-32.85)*CFrame.Angles(2.03,0.23,-2.87)},
    {cf=CFrame.new(-14.34,1.33,-47.17)*CFrame.Angles(-1.06,0.08,0.14)},
    {cf=CFrame.new(1.97,-0.51,-30.98)*CFrame.Angles(0.87,1.34,2.95)},
    {cf=CFrame.new(-14.77,-0.56,-46.06)*CFrame.Angles(3.03,1.44,1.7)},
    {cf=CFrame.new(-15.83,-0.84,-48.32)*CFrame.Angles(-2.75,-0.05,0.02)},
    {cf=CFrame.new(1.54,-3.24,-28.01)*CFrame.Angles(0.22,-0.29,-0.07)},
    {cf=CFrame.new(-14.41,-0.84,-48.49)*CFrame.Angles(-2.75,-0.05,0.02)},
    {cf=CFrame.new(0.25,-3.24,-28.51)*CFrame.Angles(0.26,-0.29,-0.06)},
    {cf=CFrame.new(-6.09,11.05,-51.82)*CFrame.Angles(1.48,-0.88,-1.61)},
    {cf=CFrame.new(-6.32,7.2,-49.8)*CFrame.Angles(-2.11,-1.24,0.85)},
    {cf=CFrame.new(-15.17,5.74,-52.98)*CFrame.Angles(-2.78,-0.11,1.37)},
    {cf=CFrame.new(-3.73,10.94,-64.91)*CFrame.Angles(3.01,0.08,1.53)},
    {cf=CFrame.new(4.75,5.74,-39.51)*CFrame.Angles(-2.72,0.26,1.37)},
}

local basePWalk2 =
    CFrame.new(-24.45,34.15,398.78)

local Walk2Data = {
    {cf=CFrame.new(-5.21,-1.03,-79.06)*CFrame.Angles(0.64,-0.02,-3.13)},
    {cf=CFrame.new(-1.85,-1.43,-71.98)*CFrame.Angles(0.03,0,-3.13)},
    {cf=CFrame.new(-5.46,0.05,-77.88)*CFrame.Angles(-0.14,0.03,-1.66)},
    {cf=CFrame.new(-1.19,-0.65,-72.91)*CFrame.Angles(1.97,0.1,1.58)},
    {cf=CFrame.new(-1.14,1.65,-72.72)*CFrame.Angles(-1.88,-0.01,1.54)},
    {cf=CFrame.new(-4.24,2.7,-75.04)*CFrame.Angles(-1.31,-0.01,1.56)},
    {cf=CFrame.new(-4.21,5.15,-72.59)*CFrame.Angles(-0.27,-0.01,1.55)},
    {cf=CFrame.new(-1.16,5.15,-71.26)*CFrame.Angles(-0.59,0.05,1.57)},
    {cf=CFrame.new(-4.87,9.7,-61.15)*CFrame.Angles(-2.85,-0.38,1.86)},
    {cf=CFrame.new(-4.16,10.08,-54.72)*CFrame.Angles(-1.63,0,-0.04)},
    {cf=CFrame.new(-4.19,10.65,-54.85)*CFrame.Angles(-1.12,-0.02,3.1)},
    {cf=CFrame.new(-2.51,8.75,-48.84)*CFrame.Angles(1.79,0.71,-1.51)},
    {cf=CFrame.new(-2.65,10.66,-51.55)*CFrame.Angles(1.24,0.71,-1.36)},
    {cf=CFrame.new(-6.67,9.09,-48.93)*CFrame.Angles(1.86,-0.64,-1.51)},
    {cf=CFrame.new(-2.11,6.85,-49.06)*CFrame.Angles(-1.89,1.05,1.9)},
    {cf=CFrame.new(-3.34,8.2,-73.76)*CFrame.Angles(-1.74,-0.74,3.09)},
    {cf=CFrame.new(10.62,14.25,-64.7)*CFrame.Angles(-3.04,-0.28,1.25)},
    {cf=CFrame.new(4.78,1.88,-42.5)*CFrame.Angles(2.03,0.23,-2.87)},
    {cf=CFrame.new(-14.21,1.38,-32.21)*CFrame.Angles(-1.13,0.07,0.14)},
    {cf=CFrame.new(4.59,-0.56,-41.6)*CFrame.Angles(-0.07,1.25,-1.48)},
    {cf=CFrame.new(-13.69,0.09,-30.37)*CFrame.Angles(2.98,1.33,1.09)},
    {cf=CFrame.new(6.54,5.94,-48.42)*CFrame.Angles(-2.61,0.2,1.6)},
    {cf=CFrame.new(5.95,-0.84,-43.9)*CFrame.Angles(-2.75,0.3,0.02)},
    {cf=CFrame.new(-13.98,-3.14,-27.16)*CFrame.Angles(0.15,0.16,-0.01)},
    {cf=CFrame.new(4.88,-0.84,-44.24)*CFrame.Angles(-2.75,0.3,0.02)},
    {cf=CFrame.new(-6.09,11.05,-51.82)*CFrame.Angles(1.48,-0.88,-1.61)},
    {cf=CFrame.new(-6.32,7.2,-49.8)*CFrame.Angles(-2.11,-1.24,0.85)},
    {cf=CFrame.new(-15.49,5.89,-39.39)*CFrame.Angles(-2.58,-0.12,1.66)},
    {cf=CFrame.new(-3.85,11.39,-65.5)*CFrame.Angles(3.05,-0.01,1.65)},
    {cf=CFrame.new(-12.33,-3.14,-27.5)*CFrame.Angles(0.15,0.22,-0.01)},
}

--==================================================
-- CENTER
--==================================================

local function GetWorldCF(baseP, localCF)
    return baseP * localCF
end

local idleCenter =
    GetWorldCF(basePIdle, IdleData[1].cf).Position

local walk1Center =
    GetWorldCF(basePWalk1, Walk1Data[1].cf).Position

local walk2Center =
    GetWorldCF(basePWalk2, Walk2Data[1].cf).Position

--==================================================
-- BLACK COLOR
--==================================================

local function ApplyBlackColor(prop)
    if not prop or not prop.Parent then
        return
    end

    if prop:IsA("BasePart") then
        prop.Color = BLACK
    end

    for _, obj in ipairs(prop:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Color = BLACK
        end
    end
end

--==================================================
-- PROP ADDED
--==================================================

local function OnPropAdded(v)
    if not isAktif then
        return
    end

    if not IsMyProp(v) then
        return
    end

    for i = 1, TOTAL_PROPS do
        if propCache[i] == v then
            return
        end
    end

    for i = 1, TOTAL_PROPS do
        if not propCache[i] then
            propCache[i] = v
            currentCFrames[i] = nil
            break
        end
    end
end

local function WatchPropFolder()
    local folder = GetPropFolder()

    if not folder then
        task.delay(1, WatchPropFolder)
        return
    end

    folder.ChildAdded:Connect(function(v)
        task.wait(0.05)
        OnPropAdded(v)
    end)
end

task.spawn(WatchPropFolder)

--==================================================
-- BUTTON AKTIF
--==================================================

AktifBtn.Activated:Connect(function()

    isAktif = not isAktif

    if isAktif then

        propCache = {}
        currentCFrames = {}

        walkBlend = 0
        sineTime = 0

        local count = ScanProps()

        AktifBtn.Text = "AKTIF : ON"
        AktifBtn.BackgroundColor3 =
            Color3.fromRGB(35, 35, 35)

        print(
            "DEAD ANGEL : "
            .. count
            .. "/"
            .. TOTAL_PROPS
            .. " PROPS"
        )

    else

        AktifBtn.Text = "AKTIF : OFF"

        AktifBtn.BackgroundColor3 =
            Color3.fromRGB(15, 15, 15)

    end
end)

--==================================================
-- ANTI SIT
--==================================================

AntiSitBtn.Activated:Connect(function()

    isAntiSit = not isAntiSit

    if isAntiSit then

        AntiSitBtn.Text = "ANTI SIT : ON"

        AntiSitBtn.BackgroundColor3 =
            Color3.fromRGB(35, 35, 35)

    else

        AntiSitBtn.Text = "ANTI SIT : OFF"

        AntiSitBtn.BackgroundColor3 =
            Color3.fromRGB(15, 15, 15)

    end
end)

--==================================================
-- MINIMIZE
--==================================================

local minimized = false

MinBtn.Activated:Connect(function()

    minimized = true

    Main.Visible = false
    MiniCircle.Visible = true

end)

MiniCircle.Activated:Connect(function()

    minimized = false

    Main.Visible = true
    MiniCircle.Visible = false

end)

--==================================================
-- GUI GLOW
--==================================================

local glowTime = 0

RunService.RenderStepped:Connect(function(dt)

    glowTime += dt

    local pulse =
        (math.sin(glowTime * 2.5) + 1) / 2

    local value =
        40 + math.floor(pulse * 50)

    Main.BorderColor3 =
        Color3.fromRGB(value, value, value)

    MiniCircle.BorderColor3 =
        Main.BorderColor3

end)

--==================================================
-- ENGINE
--==================================================

RunService:BindToRenderStep(
    "DeadAngelEngine",
    Enum.RenderPriority.Character.Value + 1,
    function(dt)

        waveTime += dt

        local char = LP.Character

        if not char then
            return
        end

        local humanoid =
            char:FindFirstChildOfClass("Humanoid")

        local hrp =
            char:FindFirstChild("HumanoidRootPart")

        if not humanoid or not hrp then
            return
        end

        -- ANTI SIT
        if isAntiSit then

            humanoid.Sit = false

            if humanoid:GetState()
                == Enum.HumanoidStateType.Seated then

                humanoid:ChangeState(
                    Enum.HumanoidStateType.GettingUp
                )

            end
        end

        if not isAktif then
            return
        end

        -- SCAN
        ScanProps()

        --==================================================
        -- MOVEMENT
        --==================================================

        local moving =
            humanoid.MoveDirection.Magnitude > 0.1

        if moving then

            walkBlend =
                walkBlend
                + (1 - walkBlend)
                * (1 - math.exp(-BLEND_IN_SPEED * dt))

            sineTime += dt

        else

            walkBlend =
                walkBlend
                + (0 - walkBlend)
                * (1 - math.exp(-BLEND_OUT_SPEED * dt))

        end

        walkBlend =
            math.clamp(walkBlend, 0, 1)

        local stepBlend =
            math.abs(
                math.sin(
                    sineTime
                    * math.pi
                    * WALK_SINE_SPEED
                )
            )

        local finalBlend =
            moving
            and (
                stepBlend
                * walkBlend
            )
            or 0

        local walkWeight =
            moving and walkBlend or 0

        --==================================================
        -- BASE
        --==================================================

        local baseCF =
            hrp.CFrame
            * CFrame.new(
                SIDE_OFFSET,
                HEIGHT_OFFSET,
                BACK_OFFSET
            )
            * DIRECTION_FIX

        --==================================================
        -- SERVER TIMER
        --==================================================

        serverTimer += dt

        local sendServer = false

        if serverTimer >= SERVER_INTERVAL then

            serverTimer = 0
            sendServer = true

        end

        --==================================================
        -- LERP
        --==================================================

        local lerpSpeed =
            moving
            and LERP_SPEED_WALK
            or LERP_SPEED_IDLE

        local lerpAlpha =
            1 - math.exp(
                -lerpSpeed * dt
            )

        --==================================================
        -- 30 PROPS
        --==================================================

        for i = 1, TOTAL_PROPS do

            local prop =
                propCache[i]

            if prop and prop.Parent then

                local idleData =
                    IdleData[i]

                local walk1Data =
                    Walk1Data[i]

                local walk2Data =
                    Walk2Data[i]

                if idleData
                    and walk1Data
                    and walk2Data then

                    -- WORLD CF
                    local idleWorldCF =
                        GetWorldCF(
                            basePIdle,
                            idleData.cf
                        )

                    local walk1WorldCF =
                        GetWorldCF(
                            basePWalk1,
                            walk1Data.cf
                        )

                    local walk2WorldCF =
                        GetWorldCF(
                            basePWalk2,
                            walk2Data.cf
                        )

                    -- OFFSET
                    local idleOff =
                        idleWorldCF.Position
                        - idleCenter

                    local walk1Off =
                        walk1WorldCF.Position
                        - walk1Center

                    local walk2Off =
                        walk2WorldCF.Position
                        - walk2Center

                    -- ROTATION
                    local idleRot =
                        idleWorldCF
                        - idleWorldCF.Position

                    local walk1Rot =
                        walk1WorldCF
                        - walk1WorldCF.Position

                    local walk2Rot =
                        walk2WorldCF
                        - walk2WorldCF.Position

                    -- WALK1 -> WALK2
                    local walkOffset =
                        walk1Off:Lerp(
                            walk2Off,
                            finalBlend
                        )

                    local walkRotation =
                        walk1Rot:Lerp(
                            walk2Rot,
                            finalBlend
                        )

                    -- IDLE -> WALK
                    local finalOffset =
                        idleOff:Lerp(
                            walkOffset,
                            walkWeight
                        )

                    local finalRotation =
                        idleRot:Lerp(
                            walkRotation,
                            walkWeight
                        )

                    -- TARGET
                    local targetCF =
                        baseCF
                        * CFrame.new(finalOffset)
                        * finalRotation

                    --==================================================
                    -- SMOOTH LERP
                    --==================================================

                    if not currentCFrames[i] then

                        currentCFrames[i] =
                            targetCF

                    else

                        currentCFrames[i] =
                            currentCFrames[i]:Lerp(
                                targetCF,
                                lerpAlpha
                            )

                    end

                    --==================================================
                    -- SERVER
                    --==================================================

                    if sendServer then

                        local cf =
                            currentCFrames[i]

                        local targetProp =
                            prop

                        task.spawn(function()

                            pcall(function()

                                local remote =
                                    targetProp:
                                    FindFirstChild(
                                        "SetCurrentCFrame"
                                    )

                                if remote then

                                    remote:InvokeServer(
                                        cf
                                    )

                                end

                            end)

                        end)

                    end

                    --==================================================
                    -- BLACK
                    --==================================================

                    ApplyBlackColor(prop)

                end

            end

        end

    end
)

--==================================================
-- START
--==================================================

print("====================================")
print("        DEAD ANGEL V1")
print("        BY VEYTON.LSP")
print("====================================")
print("30 PROPS")
print("IDLE + WALK1 + WALK2")
print("LERP : ON")
print("MATH.SIN : ON")
print("COLOR : HITAM")
print("ANTI SIT : READY")
print("GUI : READY")
print("====================================")
