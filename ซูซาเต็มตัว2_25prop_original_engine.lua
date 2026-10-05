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

local TOTAL_PROPS = 25

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
TargetBox.ClearTextOnFocus = true -- ตั้งค่าเป็น true แล้ว เมื่อกดจะลบชื่อเก่าออกทันที
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
	{cf=CFrame.new(6.2904, 8.2516, -28.9853, -0.1315, -0.1732, -0.9761, 0.9913, -0.0222, -0.1296, 0.0008, -0.9846, 0.1746)},
	{cf=CFrame.new(-7.3098, 6.2405, -18.2835, 0.8283, -0.5603, -0.0021, -0.1398, -0.2103, 0.9676, -0.5425, -0.8012, -0.2525)},
	{cf=CFrame.new(-16.2000, 24.6082, -31.2864, -0.1638, -0.1083, 0.9805, -0.0196, 0.9941, 0.1065, -0.9863, -0.0018, -0.1649)},
	{cf=CFrame.new(-14.1582, 22.4305, -16.4617, -0.1442, -0.0429, 0.9886, 0.0799, 0.9953, 0.0548, -0.9863, 0.0869, -0.1401)},
	{cf=CFrame.new(-13.6805, 16.6870, -12.0182, -0.1294, -0.0414, 0.9907, 0.0802, 0.9954, 0.0521, -0.9883, 0.0862, -0.1255)},
	{cf=CFrame.new(-8.8979, 9.0768, -26.9352, -0.9071, -0.2298, -0.3527, -0.3554, -0.0311, 0.9342, -0.2256, 0.9728, -0.0534)},
	{cf=CFrame.new(-20.6648, 12.5672, -17.7600, 0.9481, 0.3144, -0.0472, 0.0833, -0.1026, 0.9912, 0.3068, -0.9437, -0.1235)},
	{cf=CFrame.new(-8.6243, 12.5861, -19.9236, 0.8466, -0.5286, -0.0622, -0.1350, -0.3263, 0.9356, -0.5149, -0.7836, -0.3476)},
	{cf=CFrame.new(-13.6130, 10.6882, -11.0833, -0.1398, -0.0383, 0.9894, 0.0799, 0.9956, 0.0498, -0.9869, 0.0860, -0.1362)},
	{cf=CFrame.new(-24.1609, 9.1020, -24.8073, 0.7937, 0.5456, -0.2689, -0.3849, 0.1083, -0.9166, -0.4710, 0.8310, 0.2960)},
	{cf=CFrame.new(-22.2403, 6.0159, -16.4783, 0.9481, 0.3144, -0.0472, 0.0833, -0.1026, 0.9912, 0.3068, -0.9437, -0.1235)},
	{cf=CFrame.new(-16.2773, 30.2079, -31.4226, -0.1382, 0.0363, -0.9897, -0.0120, -0.9993, -0.0350, -0.9903, 0.0071, 0.1386)},
	{cf=CFrame.new(-24.1988, 2.8519, -24.8405, 0.7937, 0.5456, -0.2689, -0.3849, 0.1083, -0.9166, -0.4710, 0.8310, 0.2960)},
	{cf=CFrame.new(-14.6355, 19.6738, -21.1670, -0.0516, 0.1662, 0.9847, 0.8657, 0.4991, -0.0389, -0.4979, 0.8505, -0.1697)},
	{cf=CFrame.new(-2.2712, 30.2300, -33.9572, -0.3212, 0.1191, -0.9395, -0.0403, -0.9929, -0.1121, -0.9462, 0.0019, 0.3237)},
	{cf=CFrame.new(-30.1671, 30.1857, -29.2180, 0.0875, 0.1137, -0.9897, 0.0135, -0.9935, -0.1130, -0.9961, -0.0035, -0.0884)},
	{cf=CFrame.new(2.2686, 21.8448, -28.6348, -0.4348, -0.1737, -0.8836, 0.8991, -0.0278, -0.4369, 0.0513, -0.9844, 0.1683)},
	{cf=CFrame.new(-22.8386, 23.2063, -23.3244, -0.9796, 0.0879, -0.1805, 0.0899, 0.9959, -0.0032, 0.1795, -0.0193, -0.9836)},
	{cf=CFrame.new(-29.5055, 24.5870, -29.1195, 0.0794, -0.1070, 0.9911, 0.0137, 0.9942, 0.1063, -0.9967, 0.0052, 0.0804)},
	{cf=CFrame.new(-33.0305, 21.2376, -23.6173, 0.3589, -0.1709, -0.9176, 0.9293, -0.0264, 0.3684, -0.0872, -0.9849, 0.1493)},
	{cf=CFrame.new(-1.4628, 24.3313, -34.0414, -0.3143, -0.1124, 0.9427, -0.0379, 0.9937, 0.1058, -0.9486, -0.0025, -0.3165)},
	{cf=CFrame.new(-8.4935, 3.0780, -26.5998, -0.9021, -0.2881, -0.3212, -0.3038, -0.1045, 0.9470, -0.3064, 0.9519, 0.0067)},
	{cf=CFrame.new(-7.1560, 23.9310, -26.0904, -0.9678, -0.1650, -0.1900, -0.1810, 0.9810, 0.0700, 0.1748, 0.1021, -0.9793)},
	{cf=CFrame.new(-36.1486, 8.1832, -22.5917, 0.1295, -0.1727, -0.9764, 0.9905, -0.0227, 0.1354, -0.0455, -0.9847, 0.1681)},
	{cf=CFrame.new(-14.2940, 8.6822, -14.9317, -0.0401, 0.1659, 0.9853, 0.8702, 0.4904, -0.0472, -0.4910, 0.8556, -0.1641)},
}

local basePWalk =
	CFrame.new(151.44,34.13,385.12)
	* CFrame.Angles(0,-0.61,0)

local WalkData = {
	{cf=CFrame.new(6.2904, 8.2516, -28.9853, -0.1315, -0.1732, -0.9761, 0.9913, -0.0222, -0.1296, 0.0008, -0.9846, 0.1746)},
	{cf=CFrame.new(-7.3098, 6.2405, -18.2835, 0.8283, -0.5603, -0.0021, -0.1398, -0.2103, 0.9676, -0.5425, -0.8012, -0.2525)},
	{cf=CFrame.new(-16.2000, 24.6082, -31.2864, -0.1638, -0.1083, 0.9805, -0.0196, 0.9941, 0.1065, -0.9863, -0.0018, -0.1649)},
	{cf=CFrame.new(-14.1582, 22.4305, -16.4617, -0.1442, -0.0429, 0.9886, 0.0799, 0.9953, 0.0548, -0.9863, 0.0869, -0.1401)},
	{cf=CFrame.new(-13.6805, 16.6870, -12.0182, -0.1294, -0.0414, 0.9907, 0.0802, 0.9954, 0.0521, -0.9883, 0.0862, -0.1255)},
	{cf=CFrame.new(-8.8979, 9.0768, -26.9352, -0.9071, -0.2298, -0.3527, -0.3554, -0.0311, 0.9342, -0.2256, 0.9728, -0.0534)},
	{cf=CFrame.new(-20.6648, 12.5672, -17.7600, 0.9481, 0.3144, -0.0472, 0.0833, -0.1026, 0.9912, 0.3068, -0.9437, -0.1235)},
	{cf=CFrame.new(-8.6243, 12.5861, -19.9236, 0.8466, -0.5286, -0.0622, -0.1350, -0.3263, 0.9356, -0.5149, -0.7836, -0.3476)},
	{cf=CFrame.new(-13.6130, 10.6882, -11.0833, -0.1398, -0.0383, 0.9894, 0.0799, 0.9956, 0.0498, -0.9869, 0.0860, -0.1362)},
	{cf=CFrame.new(-24.1609, 9.1020, -24.8073, 0.7937, 0.5456, -0.2689, -0.3849, 0.1083, -0.9166, -0.4710, 0.8310, 0.2960)},
	{cf=CFrame.new(-22.2403, 6.0159, -16.4783, 0.9481, 0.3144, -0.0472, 0.0833, -0.1026, 0.9912, 0.3068, -0.9437, -0.1235)},
	{cf=CFrame.new(-16.2773, 30.2079, -31.4226, -0.1382, 0.0363, -0.9897, -0.0120, -0.9993, -0.0350, -0.9903, 0.0071, 0.1386)},
	{cf=CFrame.new(-24.1988, 2.8519, -24.8405, 0.7937, 0.5456, -0.2689, -0.3849, 0.1083, -0.9166, -0.4710, 0.8310, 0.2960)},
	{cf=CFrame.new(-14.6355, 19.6738, -21.1670, -0.0516, 0.1662, 0.9847, 0.8657, 0.4991, -0.0389, -0.4979, 0.8505, -0.1697)},
	{cf=CFrame.new(-2.2712, 30.2300, -33.9572, -0.3212, 0.1191, -0.9395, -0.0403, -0.9929, -0.1121, -0.9462, 0.0019, 0.3237)},
	{cf=CFrame.new(-30.1671, 30.1857, -29.2180, 0.0875, 0.1137, -0.9897, 0.0135, -0.9935, -0.1130, -0.9961, -0.0035, -0.0884)},
	{cf=CFrame.new(2.2686, 21.8448, -28.6348, -0.4348, -0.1737, -0.8836, 0.8991, -0.0278, -0.4369, 0.0513, -0.9844, 0.1683)},
	{cf=CFrame.new(-22.8386, 23.2063, -23.3244, -0.9796, 0.0879, -0.1805, 0.0899, 0.9959, -0.0032, 0.1795, -0.0193, -0.9836)},
	{cf=CFrame.new(-29.5055, 24.5870, -29.1195, 0.0794, -0.1070, 0.9911, 0.0137, 0.9942, 0.1063, -0.9967, 0.0052, 0.0804)},
	{cf=CFrame.new(-33.0305, 21.2376, -23.6173, 0.3589, -0.1709, -0.9176, 0.9293, -0.0264, 0.3684, -0.0872, -0.9849, 0.1493)},
	{cf=CFrame.new(-1.4628, 24.3313, -34.0414, -0.3143, -0.1124, 0.9427, -0.0379, 0.9937, 0.1058, -0.9486, -0.0025, -0.3165)},
	{cf=CFrame.new(-8.4935, 3.0780, -26.5998, -0.9021, -0.2881, -0.3212, -0.3038, -0.1045, 0.9470, -0.3064, 0.9519, 0.0067)},
	{cf=CFrame.new(-7.1560, 23.9310, -26.0904, -0.9678, -0.1650, -0.1900, -0.1810, 0.9810, 0.0700, 0.1748, 0.1021, -0.9793)},
	{cf=CFrame.new(-36.1486, 8.1832, -22.5917, 0.1295, -0.1727, -0.9764, 0.9905, -0.0227, 0.1354, -0.0455, -0.9847, 0.1681)},
	{cf=CFrame.new(-14.2940, 8.6822, -14.9317, -0.0401, 0.1659, 0.9853, 0.8702, 0.4904, -0.0472, -0.4910, 0.8556, -0.1641)},
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
