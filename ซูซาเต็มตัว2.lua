local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LP = Players.LocalPlayer

pcall(function()
	local old = CoreGui:FindFirstChild("SoulOfRaveneusGui")
	if old then old:Destroy() end
end)

pcall(function()
	RS:UnbindFromRenderStep("SoulOfRaveneusEngine")
end)

local propCache = {}
local propParts = {}
local currentCFrames = {}

local isAktif = false
local isAntiSit = false

local waveTime = 0
local glowTime = 0
local scanTimer = 0
local colorTimer = 0
local serverTimer = 0

local SCAN_INTERVAL = 0.5
local COLOR_INTERVAL = 0.10
local SERVER_INTERVAL = 1 / 15

local HEIGHT_OFFSET_IDLE = 14.14
local HEIGHT_OFFSET_WALK = 14.13

local BACK_OFFSET = 0.4
local SIDE_OFFSET = 0

local DIRECTION_FIX = CFrame.Angles(0, math.rad(180), 0)

local TOTAL_PROPS = 28

local selectedColorName = "UNGU"

local selectedColor = Color3.fromRGB(150, 0, 255)
local specialColorA = Color3.fromRGB(150, 0, 255)
local specialColorB = Color3.fromRGB(150, 0, 255)

local specialMode = false

-- ระบบเลือกเป้าหมายผู้เล่น (Target Player System)
local targetMode = "ME" -- "ME" หรือ "PLAYER"
local targetPlayer = LP

local function FindPlayerByName(nameStr)
	if not nameStr or nameStr == "" then return nil end
	nameStr = string.lower(nameStr)
	for _, p in ipairs(Players:GetPlayers()) do
		if string.find(string.lower(p.Name), nameStr) or string.find(string.lower(p.DisplayName), nameStr) then
			return p
		end
	end
	return nil
end

local function GetTargetPlayer()
	if targetMode == "ME" then
		return LP
	else
		return targetPlayer or LP
	end
end

local function AddCorner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 8)
	c.Parent = parent
	return c
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SoulOfRaveneusGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 210, 0, 255)
Main.Position = UDim2.new(0.5, -105, 0.5, -127)
Main.BackgroundColor3 = Color3.fromRGB(8, 0, 15)
Main.BorderSizePixel = 2
Main.BorderColor3 = Color3.fromRGB(100, 0, 180)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
AddCorner(Main, 10)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 44)
Header.BackgroundColor3 = Color3.fromRGB(15, 0, 25)
Header.BorderSizePixel = 0
Header.Parent = Main
AddCorner(Header, 10)

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 10)
HeaderCover.Position = UDim2.new(0, 0, 1, -10)
HeaderCover.BackgroundColor3 = Color3.fromRGB(15, 0, 25)
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(0.85, 0, 0, 20)
TitleText.Position = UDim2.new(0.06, 0, 0, 2)
TitleText.Text = "SOUL OF RAVENEUS"
TitleText.TextColor3 = Color3.fromRGB(200, 100, 255)
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 12
TitleText.BackgroundTransparency = 1
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = Header

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Size = UDim2.new(0.75, 0, 0, 13)
CreditLabel.Position = UDim2.new(0.06, 0, 0, 20)
CreditLabel.Text = "BY VEYTON.LSP"
CreditLabel.TextColor3 = Color3.fromRGB(140, 60, 200)
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
MinBtn.TextColor3 = Color3.fromRGB(180, 100, 255)
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.TextSize = 16
MinBtn.Parent = Header

local MiniCircle = Instance.new("TextButton")
MiniCircle.Size = UDim2.new(0, 38, 0, 38)
MiniCircle.Position = UDim2.new(0.5, -19, 0.1, 0)
MiniCircle.BackgroundColor3 = Color3.fromRGB(8, 0, 15)
MiniCircle.BorderSizePixel = 2
MiniCircle.BorderColor3 = Color3.fromRGB(100, 0, 180)
MiniCircle.Text = "SR"
MiniCircle.TextColor3 = Color3.fromRGB(180, 100, 255)
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
	Btn.BackgroundColor3 = Color3.fromRGB(20, 0, 35)
	Btn.BorderSizePixel = 1
	Btn.BorderColor3 = Color3.fromRGB(80, 0, 140)
	Btn.Text = text
	Btn.TextColor3 = Color3.fromRGB(200, 130, 255)
	Btn.Font = Enum.Font.SourceSansBold
	Btn.TextSize = 11
	Btn.AutoButtonColor = true
	Btn.Parent = Container
	AddCorner(Btn, 6)
	return Btn
end

local AktifBtn = CreateButton("AKTIF : OFF", 1)
local AntiSitBtn = CreateButton("ANTI SIT : OFF", 2)
local ColorBtn = CreateButton("COLOR : UNGU", 3)

local TargetBtn = CreateButton("TARGET : ME", 4)

local TargetBox = Instance.new("TextBox")
TargetBox.Size = UDim2.new(0.9, 0, 0, 26)
TargetBox.LayoutOrder = 5
TargetBox.BackgroundColor3 = Color3.fromRGB(15, 0, 25)
TargetBox.BorderSizePixel = 1
TargetBox.BorderColor3 = Color3.fromRGB(80, 0, 140)
TargetBox.PlaceholderText = "Enter Username / DisplayName"
TargetBox.PlaceholderColor3 = Color3.fromRGB(120, 80, 150)
TargetBox.Text = ""
TargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetBox.Font = Enum.Font.SourceSansBold
TargetBox.TextSize = 11
TargetBox.ClearTextOnFocus = false
TargetBox.Visible = false
TargetBox.Parent = Container
AddCorner(TargetBox, 6)

TargetBtn.MouseButton1Click:Connect(function()
	if targetMode == "ME" then
		targetMode = "PLAYER"
		TargetBtn.Text = "TARGET : PLAYER"
		TargetBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 70)
		TargetBox.Visible = true
	else
		targetMode = "ME"
		targetPlayer = LP
		TargetBtn.Text = "TARGET : ME"
		TargetBtn.BackgroundColor3 = Color3.fromRGB(20, 0, 35)
		TargetBox.Visible = false
	end
	if isAktif then
		propCache = {}
		propParts = {}
	end
end)

TargetBox.FocusLost:Connect(function(enterPressed)
	local p = FindPlayerByName(TargetBox.Text)
	if p then
		targetPlayer = p
		TargetBox.Text = p.DisplayName .. " (@" .. p.Name .. ")"
	else
		targetPlayer = LP
		if TargetBox.Text ~= "" then
			TargetBox.Text = "Not Found!"
		end
	end
	if isAktif then
		propCache = {}
		propParts = {}
	end
end)

local ColorMenu = Instance.new("Frame")
ColorMenu.Size = UDim2.new(0, 220, 0, 310)
ColorMenu.Position = UDim2.new(1, 8, 0, 45)
ColorMenu.BackgroundColor3 = Color3.fromRGB(8, 0, 15)
ColorMenu.BorderSizePixel = 2
ColorMenu.BorderColor3 = Color3.fromRGB(100, 0, 180)
ColorMenu.Visible = false
ColorMenu.ZIndex = 50
ColorMenu.Parent = Main
AddCorner(ColorMenu, 8)

local ColorTitle = Instance.new("TextLabel")
ColorTitle.Size = UDim2.new(1, 0, 0, 25)
ColorTitle.BackgroundTransparency = 1
ColorTitle.Text = "PILIH WARNA"
ColorTitle.TextColor3 = Color3.fromRGB(200, 130, 255)
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
ColorScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 0, 180)
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
	Label.BackgroundColor3 = Color3.fromRGB(25, 0, 40)
	Label.BorderSizePixel = 1
	Label.BorderColor3 = Color3.fromRGB(80, 0, 130)
	Label.Text = "◆ " .. text
	Label.TextColor3 = Color3.fromRGB(180, 100, 255)
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
	B.BorderColor3 = Color3.fromRGB(80, 0, 130)
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

CreateColorButton("UNGU", Color3.fromRGB(150, 0, 255), false)
CreateColorButton("HITAM", Color3.fromRGB(10, 10, 10), false)
CreateColorButton("PUTIH", Color3.fromRGB(255, 255, 255), false)
CreateColorButton("MERAH", Color3.fromRGB(255, 0, 0), false)
CreateColorButton("BIRU", Color3.fromRGB(0, 100, 255), false)
CreateColorButton("HIJAU", Color3.fromRGB(0, 255, 80), false)
CreateColorButton("KUNING", Color3.fromRGB(255, 220, 0), false)
CreateColorButton("ORANYE", Color3.fromRGB(255, 120, 0), false)
CreateColorButton("PINK", Color3.fromRGB(255, 0, 170), false)
CreateColorButton("CYAN", Color3.fromRGB(0, 255, 255), false)

CreateSection("WARNA SPESIAL")

local SpecialColors = {
	{"UNGU + HITAM", Color3.fromRGB(150, 0, 255), Color3.fromRGB(10, 10, 10)},
	{"UNGU + PUTIH", Color3.fromRGB(150, 0, 255), Color3.fromRGB(255, 255, 255)},
	{"UNGU + BIRU", Color3.fromRGB(150, 0, 255), Color3.fromRGB(0, 100, 255)},
	{"UNGU + MERAH", Color3.fromRGB(150, 0, 255), Color3.fromRGB(255, 0, 0)},
	{"HITAM + PUTIH", Color3.fromRGB(10, 10, 10), Color3.fromRGB(255, 255, 255)},
	{"HITAM + MERAH", Color3.fromRGB(10, 10, 10), Color3.fromRGB(255, 0, 0)},
	{"HITAM + BIRU", Color3.fromRGB(10, 10, 10), Color3.fromRGB(0, 100, 255)},
	{"MERAH + UNGU", Color3.fromRGB(255, 0, 0), Color3.fromRGB(150, 0, 255)},
	{"CYAN + UNGU", Color3.fromRGB(0, 255, 255), Color3.fromRGB(150, 0, 255)}
}

for _, data in ipairs(SpecialColors) do
	local name = data[1]
	local colorA = data[2]
	local colorB = data[3]

	local B = CreateColorButton(
		name,
		colorA:Lerp(colorB, 0.5),
		true
	)

	B.MouseButton1Click:Connect(function()
		selectedColorName = name
		specialMode = true
		specialColorA = colorA
		specialColorB = colorB
		ColorBtn.Text = "COLOR : " .. name
		ColorMenu.Visible = false
	end)
end

CreateColorButton(
	"RAINBOW",
	Color3.fromRGB(180, 60, 255),
	true
)

CreateColorButton(
	"RGB",
	Color3.fromRGB(60, 60, 60),
	true
)

ColorList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	ColorScroll.CanvasSize = UDim2.new(
		0,
		0,
		0,
		ColorList.AbsoluteContentSize.Y + 8
	)
end)

ColorBtn.MouseButton1Click:Connect(function()
	ColorMenu.Visible = not ColorMenu.Visible
end)

local function PulseColor(base, index)
	local phase = waveTime * 2.5 + (index - 1) * 0.45
	local pulse = (math.sin(phase) + 1) / 2
	local h, s, v = Color3.toHSV(base)

	return Color3.fromHSV(
		h,
		s,
		math.clamp(0.45 + 0.55 * pulse, 0, 1)
	)
end

local function GetWaveColor(index)
	if selectedColorName == "RAINBOW" then
		local hue = (waveTime * 0.35 + (index - 1) / 30) % 1

		local pulse = 0.55 + (
			(math.sin(waveTime * 2.5 + index * 0.45) + 1) / 2
		) * 0.45

		return Color3.fromHSV(hue, 1, pulse)
	end

	if selectedColorName == "RGB" then
		local hue = (waveTime * 0.7 + (index - 1) / 30) % 1

		local pulse = 0.5 + (
			(math.sin(waveTime * 3 + index) + 1) / 2
		) * 0.5

		return Color3.fromHSV(hue, 1, pulse)
	end

	if specialMode then
		local t = (
			math.sin(waveTime * 2 + index * 0.5) + 1
		) / 2

		return PulseColor(
			specialColorA:Lerp(specialColorB, t),
			index
		)
	end

	return PulseColor(selectedColor, index)
end

local function CachePropParts(prop)
	local parts = {}

	if prop:IsA("BasePart") then
		table.insert(parts, prop)
	end

	for _, obj in ipairs(prop:GetDescendants()) do
		if obj:IsA("BasePart") then
			table.insert(parts, obj)
		end
	end

	propParts[prop] = parts
end

local function ApplyColor(prop, index)
	if not prop or not prop.Parent then
		return
	end

	local parts = propParts[prop]

	if not parts then
		CachePropParts(prop)
		parts = propParts[prop]
	end

	local color = GetWaveColor(index)

	for _, part in ipairs(parts) do
		if part and part.Parent then
			part.Color = color
		end
	end
end

RS.RenderStepped:Connect(function(dt)
	glowTime += dt

	local pulse = (math.sin(glowTime * 2.5) + 1) / 2

	Main.BorderColor3 = Color3.fromRGB(
		math.floor(60 + pulse * 90),
		0,
		math.floor(120 + pulse * 135)
	)

	MiniCircle.BorderColor3 = Main.BorderColor3

	TitleText.TextColor3 = Color3.fromRGB(
		math.floor(160 + pulse * 95),
		math.floor(60 + pulse * 60),
		255
	)

	CreditLabel.TextColor3 = Color3.fromRGB(
		math.floor(100 + pulse * 80),
		math.floor(30 + pulse * 40),
		math.floor(180 + pulse * 75)
	)
end)

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

local function ScanProps()
	local folder = GetPropFolder()

	if not folder then
		return 0
	end

	local found = {}

	for _, v in ipairs(folder:GetChildren()) do
		if IsMyProp(v) then
			table.insert(found, v)
		end
	end

	table.sort(found, function(a, b)
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

	for i = 1, TOTAL_PROPS do
		local oldProp = propCache[i]
		local newProp = found[i]

		if oldProp and oldProp ~= newProp then
			propParts[oldProp] = nil
		end

		propCache[i] = newProp

		if newProp and not propParts[newProp] then
			CachePropParts(newProp)
		end
	end

	return math.min(#found, TOTAL_PROPS)
end

local basePIdle =
	CFrame.new(145.71, 34.13, 330.6)
	* CFrame.Angles(-3.14, -0.05, -3.14)

local IdleData = {
	{cf=CFrame.new(-11.25,22.23,-14.77)*CFrame.Angles(2.7,-1.24,2.94)},
	{cf=CFrame.new(-12.02,20.53,-11.7)*CFrame.Angles(-0.36,1.27,0.36)},
	{cf=CFrame.new(-16.58,17.18,-7.02)*CFrame.Angles(-1.67,-1.19,-0.08)},
	{cf=CFrame.new(-6.65,19.13,-4.69)*CFrame.Angles(3.14,0.02,-3.05)},
	{cf=CFrame.new(-12.64,26.13,-11.92)*CFrame.Angles(2.77,-1.26,-0.37)},
	{cf=CFrame.new(19.01,17.73,-4.87)*CFrame.Angles(1.6,-1.12,-3.08)},
	{cf=CFrame.new(15.64,26.13,-10.98)*CFrame.Angles(0.71,-1.4,-2.4)},
	{cf=CFrame.new(16.44,20.23,-10.91)*CFrame.Angles(-2.43,1.41,2.4)},
	{cf=CFrame.new(9.27,19.83,-4.26)*CFrame.Angles(-3.07,0.01,2.96)},
	{cf=CFrame.new(-0.08,6.58,9.13)*CFrame.Angles(-0.64,1.49,0.72)},
	{cf=CFrame.new(8.03,-1.02,-5.06)*CFrame.Angles(-1.63,-0.32,2.62)},
	{cf=CFrame.new(0.02,4.58,5.22)*CFrame.Angles(0.93,1.51,0.13)},
	{cf=CFrame.new(-19.86,4.13,-6.66)*CFrame.Angles(-1.79,-1.43,-0.2)},
	{cf=CFrame.new(23,4.13,-4.43)*CFrame.Angles(1.76,-1.44,-2.93)},
	{cf=CFrame.new(0.95,15.58,-0.94)*CFrame.Angles(0.92,1.52,0.13)},
	{cf=CFrame.new(1.41,26.13,-11.3)*CFrame.Angles(2.65,-1.5,-0.48)},
	{cf=CFrame.new(0.48,18.33,3.77)*CFrame.Angles(-0.72,1.49,0.8)},
	{cf=CFrame.new(0.05,12.58,8.21)*CFrame.Angles(-0.59,1.48,0.67)},
	{cf=CFrame.new(1.45,20.53,-11.16)*CFrame.Angles(-1.25,1.46,1.23)},
	{cf=CFrame.new(7.53,2.13,3.33)*CFrame.Angles(-1.82,0.05,0.4)},
	{cf=CFrame.new(-7.71,-1.22,-6.48)*CFrame.Angles(1.32,-0.33,-0.4)},
	{cf=CFrame.new(7.71,4.98,-5.46)*CFrame.Angles(-1.7,-0.34,2.68)},
	{cf=CFrame.new(6.58,8.48,1.47)*CFrame.Angles(-1.93,0.01,0.37)},
	{cf=CFrame.new(-7.46,1.93,2.11)*CFrame.Angles(-1.7,-0.02,-0.52)},
	{cf=CFrame.new(-5.65,8.48,1.18)*CFrame.Angles(-1.7,-0.02,-0.52)},
	{cf=CFrame.new(-7.67,5.03,-6.43)*CFrame.Angles(1.32,-0.33,-0.4)},
	{cf=CFrame.new(15.88,22.22,-14.52)*CFrame.Angles(0.66,-1.36,0.93)},
	{cf=CFrame.new(1.55,22.23,-14.7)*CFrame.Angles(1.97,-1.49,2.22)}
}

local basePWalk =
	CFrame.new(151.44,34.13,385.12)
	* CFrame.Angles(0,-0.61,0)

local WalkData = {
	{cf=CFrame.new(-29.04,5.03,-43.96)*CFrame.Angles(1.97,0.11,2.1)},
	{cf=CFrame.new(-19.46,20.53,-39.39)*CFrame.Angles(0.07,-1.22,-0.11)},
	{cf=CFrame.new(-21.91,18.67,-47.96)*CFrame.Angles(-2.58,0.75,-1.27)},
	{cf=CFrame.new(-28.01,19.13,-41.62)*CFrame.Angles(0.01,0.64,0.09)},
	{cf=CFrame.new(-18.84,26.13,-39.6)*CFrame.Angles(2.84,1.18,0.26)},
	{cf=CFrame.new(-50.43,17.73,-27.85)*CFrame.Angles(2.75,0.73,-0.42)},
	{cf=CFrame.new(-41.71,26.13,-22.95)*CFrame.Angles(2.99,0.78,0.14)},
	{cf=CFrame.new(-42.42,20.23,-22.97)*CFrame.Angles(-0.19,-0.74,-0.3)},
	{cf=CFrame.new(-40.83,19.83,-32.16)*CFrame.Angles(-0.1,0.65,-0.12)},
	{cf=CFrame.new(-46.76,6.13,-53.6)*CFrame.Angles(-0.09,-0.97,0.01)},
	{cf=CFrame.new(-44.84,-0.17,-37.83)*CFrame.Angles(-1.76,0.46,0.18)},
	{cf=CFrame.new(-19.7,7.22,-55.35)*CFrame.Angles(-2.31,0.73,-2.2)},
	{cf=CFrame.new(-58.62,7.78,-29.21)*CFrame.Angles(2.84,0.24,-1.06)},
	{cf=CFrame.new(-43.85,5.58,-50.01)*CFrame.Angles(0.03,-0.95,0.74)},
	{cf=CFrame.new(-30.3,26.13,-31.45)*CFrame.Angles(3.08,0.97,0.06)},
	{cf=CFrame.new(-39.2,18.33,-43.98)*CFrame.Angles(-0.09,-0.96,0.01)},
	{cf=CFrame.new(-41.97,12.58,-47.73)*CFrame.Angles(-0.09,-0.98,0.01)},
	{cf=CFrame.new(-30.7,20.53,-31.42)*CFrame.Angles(-0.08,-0.97,-0.23)},
	{cf=CFrame.new(-49.05,3.78,-45.5)*CFrame.Angles(-1.34,0.12,-2.1)},
	{cf=CFrame.new(-31.55,0.13,-46.74)*CFrame.Angles(2.05,0.16,2.09)},
	{cf=CFrame.new(-43.58,4.98,-35.02)*CFrame.Angles(-1.69,0.34,0.24)},
	{cf=CFrame.new(-46.58,8.48,-41.79)*CFrame.Angles(-1.28,0.21,-2.14)},
	{cf=CFrame.new(-38.01,3.98,-54.08)*CFrame.Angles(-1.48,0.1,-3)},
	{cf=CFrame.new(-35.62,8.48,-49.24)*CFrame.Angles(-1.48,0.1,-3)},
	{cf=CFrame.new(-37.61,15.58,-41.06)*CFrame.Angles(0.03,-0.95,0.74)},
	{cf=CFrame.new(-18.25,21.23,-36.49)*CFrame.Angles(2.85,1.21,-2.65)},
	{cf=CFrame.new(-39.83,20.73,-20.75)*CFrame.Angles(2.97,0.74,-2.75)},
	{cf=CFrame.new(-28.87,21.47,-28.67)*CFrame.Angles(3.06,0.99,-2.83)}
}

local function CalculateCenter(data, baseP)
	local total = Vector3.zero
	local count = 0

	for i = 1, TOTAL_PROPS do
		local entry = data[i]

		if entry then
			local worldCF = baseP * entry.cf
			total += worldCF.Position
			count += 1
		end
	end

	if count == 0 then
		return Vector3.zero
	end

	return total / count
end

local idleCenter = CalculateCenter(IdleData, basePIdle)
local walkCenter = CalculateCenter(WalkData, basePWalk)

local IdleOffsets = {}
local WalkOffsets = {}

local IdleRotations = {}
local WalkRotations = {}

for i = 1, TOTAL_PROPS do
	if IdleData[i] then
		local cf = basePIdle * IdleData[i].cf
		IdleOffsets[i] = cf.Position - idleCenter
		IdleRotations[i] = cf - cf.Position
	end

	if WalkData[i] then
		local cf = basePWalk * WalkData[i].cf
		WalkOffsets[i] = cf.Position - walkCenter
		WalkRotations[i] = cf - cf.Position
	end
end

local function SetupWatcher()
	local folder = GetPropFolder()

	if not folder then
		return
	end

	folder.ChildAdded:Connect(function(child)
		if not isAktif then
			return
		end

		if not IsMyProp(child) then
			return
		end

		task.wait(0.1)
		ScanProps()
	end)

	folder.ChildRemoved:Connect(function(child)
		propParts[child] = nil
		ScanProps()
	end)
end

SetupWatcher()

AktifBtn.MouseButton1Click:Connect(function()
	isAktif = not isAktif

	if isAktif then
		propCache = {}
		propParts = {}
		currentCFrames = {}

		scanTimer = 0
		colorTimer = 0
		serverTimer = 0

		local count = ScanProps()

		AktifBtn.Text = "AKTIF : ON"
		AktifBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 70)

		print("SOUL OF RAVENEUS: " .. count .. "/" .. TOTAL_PROPS .. " PROPS")
	else
		AktifBtn.Text = "AKTIF : OFF"
		AktifBtn.BackgroundColor3 = Color3.fromRGB(20, 0, 35)
	end
end)

AntiSitBtn.MouseButton1Click:Connect(function()
	isAntiSit = not isAntiSit

	AntiSitBtn.Text = isAntiSit and "ANTI SIT : ON" or "ANTI SIT : OFF"

	AntiSitBtn.BackgroundColor3 = isAntiSit
		and Color3.fromRGB(40, 0, 70)
		or Color3.fromRGB(20, 0, 35)
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

RS:BindToRenderStep(
	"SoulOfRaveneusEngine",
	Enum.RenderPriority.Character.Value + 1,
	function(dt)

		waveTime += dt

		local activePlayer = GetTargetPlayer()
		local char = activePlayer and activePlayer.Character

		if not char then
			return
		end

		local humanoid = char:FindFirstChildOfClass("Humanoid")
		local hrp = char:FindFirstChild("HumanoidRootPart")

		if not humanoid or not hrp then
			return
		end

		if isAntiSit then
			local myChar = LP.Character
			local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
			if myHum then
				myHum.Sit = false
				if myHum:GetState() == Enum.HumanoidStateType.Seated then
					myHum:ChangeState(Enum.HumanoidStateType.GettingUp)
				end
			end
		end

		if not isAktif then
			return
		end

		scanTimer += dt

		if scanTimer >= SCAN_INTERVAL then
			scanTimer = 0
			ScanProps()
		end

		local moving = humanoid.MoveDirection.Magnitude > 0.1

		local heightNow = moving
			and HEIGHT_OFFSET_WALK
			or HEIGHT_OFFSET_IDLE

		local baseCF =
			hrp.CFrame
			* CFrame.new(
				SIDE_OFFSET,
				heightNow,
				BACK_OFFSET
			)
			* DIRECTION_FIX

		serverTimer += dt

		local sendServer = false

		if serverTimer >= SERVER_INTERVAL then
			serverTimer = 0
			sendServer = true
		end

		colorTimer += dt

		local updateColor = false

		if colorTimer >= COLOR_INTERVAL then
			colorTimer = 0
			updateColor = true
		end

		for i = 1, TOTAL_PROPS do
			local prop = propCache[i]

			if prop and prop.Parent then
				local chosenOff
				local chosenRot

				if moving then
					chosenOff = WalkOffsets[i]
					chosenRot = WalkRotations[i]
				else
					chosenOff = IdleOffsets[i]
					chosenRot = IdleRotations[i]
				end

				if chosenOff and chosenRot then
					local targetCF =
						baseCF
						* CFrame.new(chosenOff)
						* chosenRot

					currentCFrames[i] = targetCF

					if sendServer then
						local targetProp = prop
						local cf = targetCF

						task.spawn(function()
							pcall(function()
								local rCF =
									targetProp:FindFirstChild(
										"SetCurrentCFrame"
									)

								if rCF then
									rCF:InvokeServer(cf)
								end
							end)
						end)
					end

					if updateColor then
						ApplyColor(prop, i)
					end
				end
			end
		end
	end
)

print("==========================================")
print("SOUL OF RAVENEUS V4 - TARGET SYSTEM ADDED")
print("BY VEYTON.LSP")
print("==========================================")
