--[[
============================================================
                    SUSANO - 15 PROPS
============================================================
IDLE / WALK1 / WALK2 / EMOTE / GRAB
SMOOTH BLEND EXP LERP
COLOR SELECTOR
NORMAL COLORS + SPECIAL COLORS
WAVE / KELAP-KELIP COLOR
PURPLE GUI GLOW
ANTI SIT
GRAB: pose1 -> tahan 1 detik -> pose2
FIX: WALK SEPERTI LANGKAH BUKAN MENYAPU
BY SANDBOX X
HOOKS660
============================================================
]]

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

pcall(function()
	local old = CoreGui:FindFirstChild("SusanoGui")
	if old then old:Destroy() end
end)

pcall(function()
	RS:UnbindFromRenderStep("SusanoEngine")
	RS:UnbindFromRenderStep("HazelHandEngine")
end)

local propCache = {}
local currentCFrames = {}

-- ผู้เล่นที่ใช้เป็นจุดอ้างอิงในการจัดตำแหน่งพร็อพ (พร็อพยังเป็นของผู้ใช้เดิม)
local followTarget = LP

local isAktif = false
local isAntiSit = false
local isEmote = false
local isGrab = false

local walkBlend = 0
local sineTime = 0
local emoteBlend = 0

local grabState = 0
local grabBlend1 = 0
local grabBlend2 = 0
local grabHoldTimer = 0

local serverTimer = 0
local serverInterval = 1/30
local waveTime = 0

--============================================================
-- SETTINGS
--============================================================

local WALK_SINE_SPEED = 1.2
local WALK_BLEND_MAX = 1.0

local LERP_SPEED_IDLE = 6
local LERP_SPEED_WALK = 6

local BLEND_IN_SPEED = 2
local BLEND_OUT_SPEED = 1.5

local EMOTE_BLEND_IN = 3.5
local EMOTE_BLEND_OUT = 2.5

local GRAB_BLEND_IN = 3.5
local GRAB_BLEND_OUT = 2.5

local GRAB_HOLD_TIME = 1

local HEIGHT_OFFSET = -0.8
local BACK_OFFSET = 3.5
local SIDE_OFFSET = 0

local DIRECTION_FIX =
	CFrame.Angles(0, math.rad(180), 0)

local EMOTE_DIR_FIX =
	CFrame.Angles(0, math.rad(0), 0)

--============================================================
-- COLOR SYSTEM
--============================================================

-- DEFAULT
local selectedColorName = "UNGU"
local selectedColor = Color3.fromRGB(170, 0, 255)

local specialColorA = Color3.fromRGB(170, 0, 255)
local specialColorB = Color3.fromRGB(170, 0, 255)

local specialMode = false

--============================================================
-- GUI HELPERS
--============================================================

local function AddCorner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 8)
	c.Parent = parent
	return c
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SusanoGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

--============================================================
-- MAIN
--============================================================

local Main = Instance.new("Frame")
Main.Name = "Main"

-- Dibuat lebih tinggi supaya menu warna muat
Main.Size = UDim2.new(0, 210, 0, 320)

Main.Position =
	UDim2.new(0.5, -105, 0.5, -110)

Main.BackgroundColor3 =
	Color3.fromRGB(10, 5, 18)

Main.BorderSizePixel = 2

Main.BorderColor3 =
	Color3.fromRGB(150, 60, 255)

Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

AddCorner(Main, 10)

--============================================================
-- HEADER
--============================================================

local Header = Instance.new("Frame")

Header.Size =
	UDim2.new(1, 0, 0, 44)

Header.BackgroundColor3 =
	Color3.fromRGB(18, 5, 30)

Header.BorderSizePixel = 0
Header.Parent = Main

AddCorner(Header, 10)

local HeaderCover = Instance.new("Frame")

HeaderCover.Size =
	UDim2.new(1, 0, 0, 10)

HeaderCover.Position =
	UDim2.new(0, 0, 1, -10)

HeaderCover.BackgroundColor3 =
	Color3.fromRGB(18, 5, 30)

HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local TitleText = Instance.new("TextLabel")

TitleText.Size =
	UDim2.new(0.75, 0, 0, 20)

TitleText.Position =
	UDim2.new(0.06, 0, 0, 2)

TitleText.Text = "SUSANO"

TitleText.TextColor3 =
	Color3.fromRGB(220, 170, 255)

TitleText.Font =
	Enum.Font.SourceSansBold

TitleText.TextSize = 13

TitleText.BackgroundTransparency = 1

TitleText.TextXAlignment =
	Enum.TextXAlignment.Left

TitleText.Parent = Header

local CreditLabel = Instance.new("TextLabel")

CreditLabel.Size =
	UDim2.new(0.75, 0, 0, 13)

CreditLabel.Position =
	UDim2.new(0.06, 0, 0, 20)

CreditLabel.Text = "BY SANDBOX X"

CreditLabel.TextColor3 =
	Color3.fromRGB(170, 100, 255)

CreditLabel.Font =
	Enum.Font.SourceSansItalic

CreditLabel.TextSize = 9

CreditLabel.BackgroundTransparency = 1

CreditLabel.TextXAlignment =
	Enum.TextXAlignment.Left

CreditLabel.Parent = Header

local HooksLabel = Instance.new("TextLabel")

HooksLabel.Size =
	UDim2.new(0.75, 0, 0, 12)

HooksLabel.Position =
	UDim2.new(0.06, 0, 0, 31)

HooksLabel.Text = "HOOKS660"

HooksLabel.TextColor3 =
	Color3.fromRGB(130, 70, 190)

HooksLabel.Font =
	Enum.Font.SourceSansItalic

HooksLabel.TextSize = 8

HooksLabel.BackgroundTransparency = 1

HooksLabel.TextXAlignment =
	Enum.TextXAlignment.Left

HooksLabel.Parent = Header

--============================================================
-- MINIMIZE
--============================================================

local MinBtn = Instance.new("TextButton")

MinBtn.Size =
	UDim2.new(0, 22, 0, 22)

MinBtn.Position =
	UDim2.new(1, -26, 0.5, -11)

MinBtn.BackgroundTransparency = 1

MinBtn.Text = "-"

MinBtn.TextColor3 =
	Color3.fromRGB(230, 190, 255)

MinBtn.Font =
	Enum.Font.SourceSansBold

MinBtn.TextSize = 16

MinBtn.Parent = Header

local MiniCircle = Instance.new("TextButton")

MiniCircle.Size =
	UDim2.new(0, 38, 0, 38)

MiniCircle.Position =
	UDim2.new(0.5, -19, 0.1, 0)

MiniCircle.BackgroundColor3 =
	Color3.fromRGB(15, 5, 25)

MiniCircle.BorderSizePixel = 2

MiniCircle.BorderColor3 =
	Color3.fromRGB(150, 60, 255)

MiniCircle.Text = "S"

MiniCircle.TextColor3 =
	Color3.fromRGB(220, 160, 255)

MiniCircle.Font =
	Enum.Font.SourceSansBold

MiniCircle.TextSize = 14

MiniCircle.Visible = false

MiniCircle.Active = true
MiniCircle.Draggable = true

MiniCircle.Parent = ScreenGui

AddCorner(MiniCircle, 19)

--============================================================
-- CONTAINER
--============================================================

local Container = Instance.new("Frame")

Container.Size =
	UDim2.new(1, 0, 1, -44)

Container.Position =
	UDim2.new(0, 0, 0, 44)

Container.BackgroundTransparency = 1
Container.Parent = Main

local UIList = Instance.new("UIListLayout")

UIList.SortOrder =
	Enum.SortOrder.LayoutOrder

UIList.Padding =
	UDim.new(0, 4)

UIList.HorizontalAlignment =
	Enum.HorizontalAlignment.Center

UIList.Parent = Container

local UIPad = Instance.new("UIPadding")

UIPad.PaddingTop =
	UDim.new(0, 6)

UIPad.Parent = Container

local function CreateButton(text, order)

	local Btn = Instance.new("TextButton")

	Btn.Size =
		UDim2.new(0.9, 0, 0, 26)

	Btn.LayoutOrder = order

	Btn.BackgroundColor3 =
		Color3.fromRGB(22, 10, 32)

	Btn.BorderSizePixel = 1

	Btn.BorderColor3 =
		Color3.fromRGB(105, 40, 170)

	Btn.Text = text

	Btn.TextColor3 =
		Color3.fromRGB(235, 220, 255)

	Btn.Font =
		Enum.Font.SourceSansBold

	Btn.TextSize = 11

	Btn.AutoButtonColor = true

	Btn.Parent = Container

	AddCorner(Btn, 6)

	return Btn
end

--============================================================
-- TARGET PLAYER (แตะช่องเพื่อเคลียร์ชื่อเดิม แล้วพิมพ์ชื่อใหม่)
--============================================================

local TargetBox = Instance.new("TextBox")
TargetBox.Name = "TargetPlayerBox"
TargetBox.Size = UDim2.new(0.9, 0, 0, 26)
TargetBox.LayoutOrder = 1
TargetBox.BackgroundColor3 = Color3.fromRGB(22, 10, 32)
TargetBox.BorderSizePixel = 1
TargetBox.BorderColor3 = Color3.fromRGB(105, 40, 170)
TargetBox.PlaceholderText = "ชื่อผู้เล่น / Username"
TargetBox.Text = ""
TargetBox.TextColor3 = Color3.fromRGB(235, 220, 255)
TargetBox.PlaceholderColor3 = Color3.fromRGB(155, 135, 175)
TargetBox.Font = Enum.Font.SourceSans
TargetBox.TextSize = 11
TargetBox.ClearTextOnFocus = true
TargetBox.Parent = Container
AddCorner(TargetBox, 6)

local function FindTargetPlayer(query)
    query = string.lower((query or ""):match("^%s*(.-)%s*$"))
    if query == "" then
        return LP
    end

    -- Username ตรงตัวมาก่อน
    for _, player in ipairs(Players:GetPlayers()) do
        if string.lower(player.Name) == query then
            return player
        end
    end

    -- DisplayName ตรงตัว
    local displayMatch = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if string.lower(player.DisplayName) == query then
            if displayMatch and displayMatch ~= player then
                warn("SUSANO: DisplayName นี้ซ้ำกัน กรุณาใช้ Username")
                return nil
            end
            displayMatch = player
        end
    end
    if displayMatch then
        return displayMatch
    end

    -- รองรับชื่อบางส่วนเมื่อพบผู้เล่นเพียงคนเดียว
    local match = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if string.find(string.lower(player.Name), query, 1, true)
            or string.find(string.lower(player.DisplayName), query, 1, true) then
            if match and match ~= player then
                warn("SUSANO: พบหลายคนที่ชื่อตรงกัน กรุณาพิมพ์ชื่อให้ชัดเจน")
                return nil
            end
            match = player
        end
    end
    return match
end

local function SetFollowTarget(player)
    if not player then
        -- ไม่แสดงคำเตือนเมื่อค้นหาไม่พบผู้เล่น
        return false
    end
    followTarget = player
    print("SUSANO: กำลังตาม " .. player.DisplayName .. " (@" .. player.Name .. ")")
    return true
end

-- แตะ/คลิกช่องอีกครั้งจะล้างชื่อเก่าอัตโนมัติ
TargetBox.Focused:Connect(function()
    TargetBox.Text = ""
end)

-- พิมพ์ชื่อแล้วกด Enter เพื่อเลือกเป้าหมาย; เว้นว่างแล้ว Enter = กลับมาตามตัวเอง
TargetBox.FocusLost:Connect(function(enterPressed)
    if not enterPressed then
        return
    end
    local query = TargetBox.Text
    if (query or ""):match("^%s*$") then
        SetFollowTarget(LP)
        return
    end
    SetFollowTarget(FindTargetPlayer(query))
end)

local AktifBtn =
	CreateButton("AKTIF : OFF", 4)

local AntiSitBtn =
	CreateButton("ANTI SIT : OFF", 5)

local EmoteBtn =
	CreateButton("EMOTE : OFF", 6)

local GrabBtn =
	CreateButton("GRAB : OFF", 7)

local ColorBtn =
	CreateButton("COLOR : UNGU", 8)

--============================================================
-- COLOR MENU
--============================================================

local ColorMenu = Instance.new("Frame")

ColorMenu.Name = "ColorMenu"

ColorMenu.Size =
	UDim2.new(0, 220, 0, 310)

ColorMenu.Position =
	UDim2.new(1, 8, 0, 45)

ColorMenu.BackgroundColor3 =
	Color3.fromRGB(10, 5, 18)

ColorMenu.BorderSizePixel = 2

ColorMenu.BorderColor3 =
	Color3.fromRGB(150, 60, 255)

ColorMenu.Visible = false

ColorMenu.ZIndex = 50

ColorMenu.Parent = Main

AddCorner(ColorMenu, 8)

--============================================================
-- COLOR TITLE
--============================================================

local ColorTitle = Instance.new("TextLabel")

ColorTitle.Size =
	UDim2.new(1, 0, 0, 25)

ColorTitle.BackgroundTransparency = 1

ColorTitle.Text = "PILIH WARNA"

ColorTitle.TextColor3 =
	Color3.fromRGB(220, 170, 255)

ColorTitle.Font =
	Enum.Font.SourceSansBold

ColorTitle.TextSize = 12

ColorTitle.ZIndex = 51

ColorTitle.Parent = ColorMenu

--============================================================
-- SCROLL
--============================================================

local ColorScroll = Instance.new("ScrollingFrame")

ColorScroll.Size =
	UDim2.new(1, -8, 1, -32)

ColorScroll.Position =
	UDim2.new(0, 4, 0, 28)

ColorScroll.BackgroundTransparency = 1

ColorScroll.BorderSizePixel = 0

ColorScroll.ScrollBarThickness = 5

ColorScroll.CanvasSize =
	UDim2.new(0, 0, 0, 0)

ColorScroll.ZIndex = 51

ColorScroll.Parent = ColorMenu

local ColorList = Instance.new("UIListLayout")

ColorList.SortOrder =
	Enum.SortOrder.LayoutOrder

ColorList.Padding =
	UDim.new(0, 3)

ColorList.Parent = ColorScroll

--============================================================
-- SECTION CREATOR
--============================================================

local colorOrder = 0

local function CreateSection(text)

	colorOrder += 1

	local Label = Instance.new("TextLabel")

	Label.Size =
		UDim2.new(1, -4, 0, 22)

	Label.BackgroundColor3 =
		Color3.fromRGB(35, 12, 50)

	Label.BorderSizePixel = 1

	Label.BorderColor3 =
		Color3.fromRGB(120, 50, 180)

	Label.Text = "◆ " .. text

	Label.TextColor3 =
		Color3.fromRGB(210, 150, 255)

	Label.Font =
		Enum.Font.SourceSansBold

	Label.TextSize = 11

	Label.LayoutOrder = colorOrder

	Label.ZIndex = 52

	Label.Parent = ColorScroll

	AddCorner(Label, 5)

	return Label
end

--============================================================
-- COLOR BUTTON
--============================================================

local function CreateColorButton(name, color, isSpecial)

	colorOrder += 1

	local B = Instance.new("TextButton")

	B.Size =
		UDim2.new(1, -4, 0, 25)

	B.LayoutOrder = colorOrder

	B.BackgroundColor3 =
		color

	B.BorderSizePixel = 1

	B.BorderColor3 =
		Color3.fromRGB(110, 60, 150)

	B.Text = name

	B.TextColor3 =
		Color3.fromRGB(255, 255, 255)

	B.Font =
		Enum.Font.SourceSansBold

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

		ColorBtn.Text =
			"COLOR : " .. name

		ColorMenu.Visible = false

		print("SUSANO COLOR : " .. name)

	end)

	return B
end

--============================================================
-- NORMAL COLORS
--============================================================

CreateSection("WARNA NORMAL")

CreateColorButton(
	"UNGU",
	Color3.fromRGB(170, 0, 255),
	false
)

CreateColorButton(
	"MERAH",
	Color3.fromRGB(255, 0, 0),
	false
)

CreateColorButton(
	"BIRU",
	Color3.fromRGB(0, 100, 255),
	false
)

CreateColorButton(
	"HIJAU",
	Color3.fromRGB(0, 255, 80),
	false
)

CreateColorButton(
	"KUNING",
	Color3.fromRGB(255, 220, 0),
	false
)

CreateColorButton(
	"ORANYE",
	Color3.fromRGB(255, 120, 0),
	false
)

CreateColorButton(
	"PINK",
	Color3.fromRGB(255, 0, 170),
	false
)

CreateColorButton(
	"CYAN",
	Color3.fromRGB(0, 255, 255),
	false
)

CreateColorButton(
	"PUTIH",
	Color3.fromRGB(255, 255, 255),
	false
)

CreateColorButton(
	"HITAM",
	Color3.fromRGB(10, 10, 10),
	false
)

--============================================================
-- SPECIAL COLOR
--============================================================

CreateSection("WARNA SPESIAL")

local SpecialColors = {
	{
		"MERAH + UNGU",
		Color3.fromRGB(255, 0, 0),
		Color3.fromRGB(170, 0, 255)
	},

	{
		"MERAH + BIRU",
		Color3.fromRGB(255, 0, 0),
		Color3.fromRGB(0, 100, 255)
	},

	{
		"MERAH + HIJAU",
		Color3.fromRGB(255, 0, 0),
		Color3.fromRGB(0, 255, 80)
	},

	{
		"UNGU + BIRU",
		Color3.fromRGB(170, 0, 255),
		Color3.fromRGB(0, 100, 255)
	},

	{
		"UNGU + HIJAU",
		Color3.fromRGB(170, 0, 255),
		Color3.fromRGB(0, 255, 80)
	},

	{
		"BIRU + HIJAU",
		Color3.fromRGB(0, 100, 255),
		Color3.fromRGB(0, 255, 80)
	},

	{
		"KUNING + MERAH",
		Color3.fromRGB(255, 220, 0),
		Color3.fromRGB(255, 0, 0)
	},

	{
		"KUNING + HIJAU",
		Color3.fromRGB(255, 220, 0),
		Color3.fromRGB(0, 255, 80)
	},

	{
		"PINK + UNGU",
		Color3.fromRGB(255, 0, 170),
		Color3.fromRGB(170, 0, 255)
	},

	{
		"CYAN + UNGU",
		Color3.fromRGB(0, 255, 255),
		Color3.fromRGB(170, 0, 255)
	},
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

		ColorBtn.Text =
			"COLOR : " .. name

		ColorMenu.Visible = false

		print(
			"SUSANO SPECIAL COLOR : "
			.. name
		)

	end)

end

--============================================================
-- RAINBOW / RGB
--============================================================

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

-- RAINBOW/RGB perlu mode khusus
ColorScroll.ChildAdded:Connect(function()
end)

ColorList:GetPropertyChangedSignal(
	"AbsoluteContentSize"
):Connect(function()

	ColorScroll.CanvasSize =
		UDim2.new(
			0,
			0,
			0,
			ColorList.AbsoluteContentSize.Y + 8
		)

end)

ColorBtn.MouseButton1Click:Connect(function()

	ColorMenu.Visible =
		not ColorMenu.Visible

end)

--============================================================
-- COLOR ANIMATION
--============================================================

local function PulseColor(base, index)

	local phase =
		waveTime * 2.5
		+ ((index - 1) * 0.45)

	local pulse =
		(math.sin(phase) + 1) / 2

	local h, s, v =
		Color3.toHSV(base)

	-- Biar warnanya tetap terlihat terang
	-- saat kelap-kelip
	local newV =
		0.45 + (0.55 * pulse)

	return Color3.fromHSV(
		h,
		s,
		math.clamp(newV, 0, 1)
	)

end

local function GetWaveColor(index)

	--========================================================
	-- RAINBOW
	--========================================================

	if selectedColorName == "RAINBOW" then

		local hue =
			(
				waveTime * 0.35
				+ ((index - 1) / 15)
			) % 1

		local pulse =
			0.55
			+ (
				(math.sin(
					waveTime * 2.5
					+ index * 0.45
				) + 1) / 2
			) * 0.45

		return Color3.fromHSV(
			hue,
			1,
			pulse
		)

	end

	--========================================================
	-- RGB
	--========================================================

	if selectedColorName == "RGB" then

		local hue =
			(
				waveTime * 0.7
				+ ((index - 1) / 15)
			) % 1

		local pulse =
			0.5
			+ (
				(math.sin(
					waveTime * 3
					+ index
				) + 1) / 2
			) * 0.5

		return Color3.fromHSV(
			hue,
			1,
			pulse
		)

	end

	--========================================================
	-- SPECIAL COLORS
	--========================================================

	if specialMode then

		local phase =
			waveTime * 2
			+ index * 0.5

		local t =
			(math.sin(phase) + 1) / 2

		local mixed =
			specialColorA:Lerp(
				specialColorB,
				t
			)

		return PulseColor(
			mixed,
			index
		)

	end

	--========================================================
	-- NORMAL COLOR
	--========================================================

	return PulseColor(
		selectedColor,
		index
	)

end

--============================================================
-- APPLY COLOR
--============================================================

local function ApplyColor(prop, index)

	if not prop or not prop.Parent then
		return
	end

	local color =
		GetWaveColor(index)

	-- Kalau prop-nya sendiri BasePart
	if prop:IsA("BasePart") then
		prop.Color = color
	end

	for _, obj in ipairs(prop:GetDescendants()) do

		if obj:IsA("BasePart") then

			obj.Color = color

		end

	end

end

--============================================================
-- GUI PURPLE GLOW
--============================================================

local purpleTime = 0

local guiConnection

guiConnection =
	RS.RenderStepped:Connect(function(dt)

		purpleTime += dt

		local pulse =
			(math.sin(
				purpleTime * 3.5
			) + 1) / 2

		local borderColor =
			Color3.fromRGB(
				110
					+ math.floor(
						pulse * 100
					),

				35
					+ math.floor(
						pulse * 45
					),

				190
					+ math.floor(
						pulse * 65
					)
			)

		local titleColor =
			Color3.fromRGB(
				190
					+ math.floor(
						pulse * 50
					),

				110
					+ math.floor(
						pulse * 80
					),

				240
					+ math.floor(
						pulse * 15
					)
			)

		Main.BorderColor3 =
			borderColor

		MiniCircle.BorderColor3 =
			borderColor

		TitleText.TextColor3 =
			titleColor

		CreditLabel.TextColor3 =
			Color3.fromRGB(
				140
					+ math.floor(
						pulse * 80
					),

				70
					+ math.floor(
						pulse * 70
					),

				220
					+ math.floor(
						pulse * 35
					)
			)

		HooksLabel.TextColor3 =
			Color3.fromRGB(
				110
					+ math.floor(
						pulse * 60
					),

				55
					+ math.floor(
						pulse * 45
					),

				180
					+ math.floor(
						pulse * 55
					)
			)

	end)

--============================================================
-- BUTTONS
--============================================================

AktifBtn.Activated:Connect(function()

	isAktif =
		not isAktif

	if isAktif then

		propCache = {}
		currentCFrames = {}

		walkBlend = 0
		sineTime = 0

		emoteBlend = 0

		grabState = 0
		grabBlend1 = 0
		grabBlend2 = 0
		grabHoldTimer = 0

		local count =
			ScanProps()

		AktifBtn.Text =
			"AKTIF : ON"

		AktifBtn.BackgroundColor3 =
			Color3.fromRGB(
				80,
				15,
				125
			)

		print(
			"SUSANO: AKTIF ON | "
			.. count
			.. "/15 PROPS"
		)

	else

		AktifBtn.Text =
			"AKTIF : OFF"

		AktifBtn.BackgroundColor3 =
			Color3.fromRGB(
				22,
				10,
				32
			)
		print("SUSANO: AKTIF OFF")

	end

end)

AntiSitBtn.MouseButton1Click:Connect(function()

	isAntiSit =
		not isAntiSit

	AntiSitBtn.Text =
		isAntiSit
		and "ANTI SIT : ON"
		or "ANTI SIT : OFF"

	AntiSitBtn.BackgroundColor3 =
		isAntiSit
		and Color3.fromRGB(
			70,
			15,
			110
		)
		or Color3.fromRGB(
			22,
			10,
			32
		)

end)

EmoteBtn.MouseButton1Click:Connect(function()

	isEmote =
		not isEmote

	EmoteBtn.Text =
		isEmote
		and "EMOTE : ON"
		or "EMOTE : OFF"

	EmoteBtn.BackgroundColor3 =
		isEmote
		and Color3.fromRGB(
			95,
			20,
			150
		)
		or Color3.fromRGB(
			22,
			10,
			32
		)

end)

GrabBtn.MouseButton1Click:Connect(function()

	isGrab =
		not isGrab

	if isGrab then

		grabState = 1
		grabBlend1 = 0
		grabBlend2 = 0
		grabHoldTimer = 0

		GrabBtn.Text =
			"GRAB : ON"

		GrabBtn.BackgroundColor3 =
			Color3.fromRGB(
				100,
				20,
				150
			)

	else

		grabState = 0
		grabBlend1 = 0
		grabBlend2 = 0
		grabHoldTimer = 0

		GrabBtn.Text =
			"GRAB : OFF"

		GrabBtn.BackgroundColor3 =
			Color3.fromRGB(
				22,
				10,
				32
			)

	end

end)

--============================================================
-- MINIMIZE
--============================================================

local minimized = false

MinBtn.MouseButton1Click:Connect(function()

	minimized =
		not minimized

	Main.Visible =
		not minimized

	MiniCircle.Visible =
		minimized

end)

MiniCircle.MouseButton1Click:Connect(function()

	minimized = false

	Main.Visible = true

	MiniCircle.Visible = false

end)

--============================================================
-- PROP FOLDER
--============================================================

local function GetPropFolder()

	local wc =
		workspace:FindFirstChild(
			"WorkspaceCom"
		)

	if not wc then
		return nil
	end

	return wc:FindFirstChild(
		"001_TrafficCones"
	)

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

	local folder =
		GetPropFolder()

	if not folder then
		return 0
	end

	local existing = {}

	for i = 1, 15 do

		local p =
			propCache[i]

		if p
			and p.Parent
			and IsMyProp(p) then

			existing[p] = true

		else

			propCache[i] = nil
			currentCFrames[i] = nil

		end

	end

	local newProps = {}

	for _, v in ipairs(
		folder:GetChildren()
	) do

		if IsMyProp(v)
			and not existing[v] then

			table.insert(
				newProps,
				v
			)

		end

	end

	table.sort(
		newProps,
		function(a, b)

			local na =
				tonumber(
					a.Name:match(
						"(%d+)%D*$"
					)
				)

			local nb =
				tonumber(
					b.Name:match(
						"(%d+)%D*$"
					)
				)

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

		end
	)

	for _, np in ipairs(newProps) do

		for i = 1, 15 do

			if not propCache[i] then

				propCache[i] = np

				break

			end

		end

	end

	local count = 0

	for i = 1, 15 do

		if propCache[i] then
			count += 1
		end

	end

	return count

end

--============================================================
-- POSE DATA
--============================================================

local IdleCFrames = {

	[1] = CFrame.new(-22.2622986,33.3253784,306.991333,0.993239045,-0.0219227038,-0.113998435,3.9239414e-05,0.98206991,-0.188517079,0.116087236,0.187238052,0.975431025),

	[2] = CFrame.new(-25.4713898,37.5758171,312.799316,0.277605116,-0.641507149,0.715125144,-0.951698542,-0.0820008516,0.295881331,-0.13116914,-0.762721717,-0.633285284),

	[3] = CFrame.new(-20.3109951,37.4755936,313.050415,-0.115361691,0.765234888,0.633330166,-0.943811715,0.114342391,-0.310072809,-0.309695005,-0.633515,0.709047019),

	[4] = CFrame.new(-27.8873768,43.3744545,314.957947,0.206946731,-0.614699244,0.761129379,-0.978287935,-0.138935804,0.153784364,0.0112169683,-0.776428819,-0.630105138),

	[5] = CFrame.new(-18.7607403,43.2242355,315.199493,-0.130629182,0.704820335,0.697254896,-0.983318865,-0.00232219696,-0.181875199,-0.126570195,-0.709382057,0.693366468),

	[6] = CFrame.new(-23.3764439,47.8248138,309.055695,0.175050139,-0.940916538,-0.289885253,-0.0900293291,0.277900577,-0.956381679,0.980434656,0.193513006,-0.0360635519),

	[7] = CFrame.new(-38.1866188,52.175087,311.311127,-0.230181932,-0.124296278,-0.965177059,-0.922887444,-0.286736965,0.257022589,-0.308698893,0.949911714,-0.0487098694),

	[8] = CFrame.new(-40.5197792,48.223877,324.487305,-0.196242452,0.557439923,-0.806690633,-0.92743814,-0.372616529,-0.0318692923,-0.318351328,0.741901517,0.590114057),

	[9] = CFrame.new(-29.4822655,44.0281258,336.7547,-0.72586453,-0.393748105,0.563988924,0.635797918,-0.0712182529,0.768563092,-0.262454033,0.916455448,0.302038789),

	[10] = CFrame.new(-29.5047607,44.0218582,338.453156,0.022678256,0.0627730191,-0.99777019,0.988794446,0.145889759,0.031652689,0.147551417,-0.98730731,-0.0587611198),

	[11] = CFrame.new(-22.5253239,45.0767326,334.367889,-0.42369926,0.215160787,0.879877687,0.734414756,0.650186718,0.194659233,-0.530201793,0.728672147,-0.433500886),

	[12] = CFrame.new(-25.956995,49.3242531,334.313171,0.71960175,-0.0292641968,-0.69377017,-0.475857019,0.7068398,-0.523390532,0.505701065,0.706768155,0.494717598),

	[13] = CFrame.new(-24.8557777,46.1506119,335.53894,0.549644113,-0.0292288959,-0.834887385,-0.579193711,0.706861377,-0.406056195,0.602018237,0.706748009,0.371592999),

	[14] = CFrame.new(-25.1613903,39.3476105,334.793152,0.162671387,-0.0180954933,-0.986514449,-0.692988813,0.70962286,-0.12728706,0.702356577,0.704349399,0.102895319),

	[15] = CFrame.new(-25.1825504,41.9038582,335.157227,0.363900721,-0.00745505095,-0.931407928,-0.653715432,0.710272729,-0.261091471,0.663500071,0.703887105,0.253595233),
}

local Walk1CFrames = {

	[1] = CFrame.new(-16.9756165,33.0501709,351.142212,0.999570549,-0.00551250204,-0.0287810061,-1.3314886e-05,0.982061803,-0.188559309,0.0293041598,0.188478723,0.981639981),

	[2] = CFrame.new(-19.6674175,37.3002167,357.207367,0.265137017,-0.705431521,0.657319427,-0.951690257,-0.0819553137,0.295920789,-0.15488103,-0.704024017,-0.693081617),

	[3] = CFrame.new(-14.5048351,37.2002945,357.00885,-0.14182961,0.707226276,0.692614794,-0.943820357,0.114358246,-0.310040891,-0.298475266,-0.697676957,0.651275218),

	[4] = CFrame.new(-21.8865089,43.1001892,359.567902,0.207068264,-0.679890871,0.703470826,-0.978302121,-0.138822913,0.153795898,-0.006906569,-0.720053256,-0.693884373),

	[5] = CFrame.new(-12.7734327,42.9502487,359.014893,-0.141106367,0.640428483,0.754944026,-0.983321011,-0.00227236748,-0.18186447,-0.11475569,-0.76801455,0.630067348),

	[6] = CFrame.new(-17.9059734,47.5500603,353.295715,0.259665489,-0.920501113,-0.291978925,-0.0899696648,0.277975321,-0.956365645,0.961498499,0.27460438,-0.0106365681),

	[7] = CFrame.new(-31.6583233,51.9002495,357.57019,0.941703379,-0.255514175,0.218877226,0.00307363272,-0.643999338,-0.765019834,0.336430222,0.721094549,-0.605671048),

	[8] = CFrame.new(-34.6691856,43.1501923,367.782104,0.971339226,0.215759039,-0.0997405574,0.0880503133,-0.716364145,-0.692148685,-0.220787853,0.663528919,-0.71483016),

	[9] = CFrame.new(-31.2969437,32.5501709,377.801514,-0.328906894,0,-0.944362462,0,1,0,0.944362462,0,-0.328906894),

	[10] = CFrame.new(-30.5956116,35.000206,380.762451,0.848307729,0.0462053195,-0.527483821,0.0093601346,-0.997338772,-0.0723094642,-0.529420853,0.0564033575,-0.846482635),

	[11] = CFrame.new(-27.4540539,31.7501793,386.325958,0.856051922,0.125859976,0.5013327,-0.106271967,0.992037416,-0.0675868541,-0.505847275,0.00458024442,0.862610936),

	[12] = CFrame.new(-24.693306,31.6001587,383.357544,0.661361098,0.125866398,0.739431679,-0.0804813504,0.9920367,-0.096880972,-0.745737374,0.00456285104,0.66622442),

	[13] = CFrame.new(-25.318512,30.7001953,377.864014,0.0929578543,0.125838146,0.987685919,-0.00716523826,0.992040098,-0.125718519,-0.995644212,0.0046095103,0.0931195617),

	[14] = CFrame.new(-31.5962696,31.7501831,386.78833,0.933245242,0.125864506,0.336469054,-0.116839744,0.992036879,-0.047023952,-0.339708388,0.00457191654,0.940519691),

	[15] = CFrame.new(-34.9694672,31.7501831,384.29895,0.983416677,0.125836134,-0.130601987,-0.125348479,0.992040455,0.0119811427,0.131070122,0.00458830409,0.991362453),
}

local Walk2CFrames = {

	[1] = CFrame.new(-16.9756165,33.3501587,351.142212,0.999570549,-0.00551250204,-0.0287810061,-1.3314886e-05,0.982061803,-0.188559309,0.0293041598,0.188478723,0.981639981),

	[2] = CFrame.new(-19.6674442,37.9002113,357.207367,0.265137017,-0.705431521,0.657319427,-0.951690257,-0.0819553137,0.295920789,-0.15488103,-0.704024017,-0.693081617),

	[3] = CFrame.new(-14.4152641,37.6502571,356.909424,-0.14182961,0.707226276,0.692614794,-0.943820357,0.114358246,-0.310040891,-0.298475266,-0.697676957,0.651275218),

	[4] = CFrame.new(-21.8865166,42.5501862,359.567871,0.207068264,-0.679890871,0.703470826,-0.978302121,-0.138822913,0.153795898,-0.006906569,-0.720053256,-0.693884373),

	[5] = CFrame.new(-12.7734175,42.3502502,359.014862,-0.141106367,0.640428483,0.754944026,-0.983321011,-0.00227236748,-0.18186447,-0.11475569,-0.76801455,0.630067348),

	[6] = CFrame.new(-17.9059734,47.5500603,353.295715,0.259665489,-0.920501113,-0.291978925,-0.0899696648,0.277975321,-0.956365645,0.961498499,0.27460438,-0.0106365681),

	[7] = CFrame.new(-31.6583176,51.9001999,357.57019,0.9654423,0.0593093783,-0.253778577,0.188118204,-0.832512259,0.521090031,-0.180368245,-0.550822735,-0.814899683),

	[8] = CFrame.new(-30.721384,42.300209,351.402863,0.971326947,-0.100558177,-0.215434551,0.0879708529,-0.689817786,0.718618631,-0.220873535,-0.716965556,-0.661192417),

	[9] = CFrame.new(-31.2012882,35.0002174,346.221375,0.976123333,0.0461888164,-0.212249503,0.033057712,-0.997337103,-0.0650056675,-0.214686856,0.056437064,-0.975050926),

	[10] = CFrame.new(-32.0158577,32.5501709,342.283691,-0.528544188,0,-0.848905742,0,1,0,0.848905742,0,-0.528544188),

	[11] = CFrame.new(-37.2766037,30.3501835,348.424072,0.723360002,0.125855863,-0.678903997,-0.0949252695,0.992037952,0.0827637762,0.68391484,0.0045771338,0.729547501),

	[12] = CFrame.new(-34.8627777,30.6501751,351.332123,0.921102941,0.125890508,-0.368403256,-0.118598066,0.992033601,0.0424713716,0.370815158,0.00457141176,0.92869544),

	[13] = CFrame.new(-30.6812325,30.7002163,352.510284,0.99182713,0.125910044,-0.0206288788,-0.125978917,0.99203074,-0.00206872006,0.0202040095,0.00465061609,0.999785066),

	[14] = CFrame.new(-27.4762039,30.8501587,349.713745,0.854250968,0.125830442,0.504402637,-0.106022209,0.992041349,-0.067920804,-0.508934736,0.00454353914,0.860793114),

	[15] = CFrame.new(-25.8114281,31.200161,346.63916,0.609293103,0.125872061,0.782890975,-0.0736392811,0.992035747,-0.102187529,-0.789518416,0.00461062789,0.613709629),
}

local EmoteCFrames = {

	[1] = CFrame.new(-29.8651123,33.3253784,470.921753,-0.994685292,0.0194035806,0.101117417,-8.28783959e-06,0.982067049,-0.188531935,-0.102962285,-0.187530786,-0.976847529),

	[2] = CFrame.new(-26.7333241,37.5756111,465.071594,-0.275789857,0.651606381,-0.706646264,-0.951706231,-0.0819411278,0.295873046,0.134889305,0.754118443,0.642736495),

	[3] = CFrame.new(-31.896595,37.4756165,464.888885,0.119472086,-0.756749034,-0.642695367,-0.943828464,0.114302218,-0.310036868,0.308081627,0.643634915,-0.700585365),

	[4] = CFrame.new(-24.3462448,43.374897,462.881134,-0.207027078,0.624935806,-0.752725363,-0.978298962,-0.138878822,0.153766602,-0.00844320655,0.76822412,0.640125394),

	[5] = CFrame.new(-33.4752693,43.2249603,462.76059,0.132287383,-0.695327401,-0.706413388,-0.983320475,-0.00231230259,-0.181866765,0.12482354,0.718689382,-0.68403554),

	[6] = CFrame.new(-28.7784634,47.8250351,468.842682,-0.188040018,0.938262343,0.290352881,-0.0899492502,0.277932465,-0.95638001,-0.978033841,-0.205954671,0.0321335196),

	[7] = CFrame.new(-14.7484055,52.1752777,465.594086,-0.0603363514,-0.052749604,-0.996783316,0.908474088,-0.416640997,-0.0329422653,-0.413563073,-0.907539368,0.0730602145),

	[8] = CFrame.new(-15.0008879,46.2248726,452.727905,-0.0537471771,-0.784558594,0.617720962,-0.997354329,0.0118557811,-0.0717206299,0.0489454269,-0.619941473,-0.783120155),

	[9] = CFrame.new(-27.3737087,46.9264145,443.393738,-0.994415164,-0.0985087976,0.0378746688,-0.039169006,0.0112379789,-0.99916935,0.098001346,-0.995072722,-0.0150337219),

	[10] = CFrame.new(-30.064476,49.3740501,442.275421,0.65801394,0.0818234384,0.748546958,0.753005743,-0.0712419748,-0.654145956,-0.000196516514,0.994097352,-0.108491778),

	[11] = CFrame.new(-35.2234764,55.074543,447.002716,0.689076304,-0.251369655,-0.679696321,0.717486858,0.104741156,0.688652277,-0.101914078,-0.962207198,0.252529085),

	[12] = CFrame.new(-25.3662586,49.9252052,444.56015,0.732338727,-0.163799688,0.660946012,0.649545014,0.459371805,-0.605861902,-0.204379946,0.873010397,0.442811072),

	[13] = CFrame.new(-30.1259785,45.1752243,445.944458,0.67635721,-0.169963181,0.716696226,0.693124056,0.476106226,-0.541204095,-0.249238789,0.862806678,0.439823449),

	[14] = CFrame.new(-28.2185917,47.1252365,445.214355,0.504141808,-0.169909418,0.846741915,0.794272006,0.476169169,-0.377352417,-0.339076668,0.862782538,0.375011086),

	[15] = CFrame.new(-26.8317833,49.5251884,445.579559,0.675492525,-0.289104015,0.678327918,0.693730235,0.560939968,-0.451757371,0.249896362,0.775735319,0.579470932),
}

local GrabCFrames = {

	[1] = CFrame.new(-22.2623138,33.325367,306.991333,0.993239045,-0.0219227038,-0.113998435,3.9239414e-05,0.98206991,-0.188517079,0.116087236,0.187238052,0.975431025),

	[2] = CFrame.new(-25.4713974,37.5758171,312.799316,0.277605116,-0.641507149,0.715125144,-0.951698542,-0.0820008516,0.295881331,-0.13116914,-0.762721717,-0.633285284),

	[3] = CFrame.new(-20.3109875,37.4755936,313.050415,-0.115361691,0.765234888,0.633330166,-0.943811715,0.114342391,-0.310072809,-0.309695005,-0.633515,0.709047019),

	[4] = CFrame.new(-27.8873634,43.3743935,314.957947,0.206946731,-0.614699244,0.761129379,-0.978287935,-0.138935804,0.153784364,0.0112169683,-0.776428819,-0.630105138),

	[5] = CFrame.new(-18.7607193,43.2242661,315.199493,-0.130629182,0.704820335,0.697254896,-0.983318865,-0.00232219696,-0.181875199,-0.126570195,-0.709382057,0.693366468),

	[6] = CFrame.new(-23.3764553,47.8248482,309.055695,0.175050139,-0.940916538,-0.289885253,-0.0900293291,0.277900577,-0.956381679,0.980434656,0.193513006,-0.0360635519),

	[7] = CFrame.new(-37.44841,52.1750717,312.117889,0.931759775,-0.36307174,0.0016246289,-0.0739320368,-0.194110632,-0.978189707,0.355468392,0.911317706,-0.207707167),

	[8] = CFrame.new(-42.1692123,49.1238708,323.953918,0.986854017,0.148670703,0.0633733198,0.0881467015,-0.166468978,-0.982098937,-0.135459632,0.97477448,-0.177385449),

	[9] = CFrame.new(-38.2682037,48.4780998,337.934296,-0.950188637,0.252687275,-0.182459071,-0.246876463,-0.25285387,0.935477138,0.19024767,0.933924317,0.302640915),

	[10] = CFrame.new(-37.5822067,50.3218613,338.75766,0.95676887,0.171719074,-0.234746411,-0.239753157,0.0087223053,-0.970794737,-0.164656445,0.985107362,0.0495154262),

	[11] = CFrame.new(-36.2962265,55.8231888,342.543579,-0.983938575,-0.0341220312,-0.175215796,0.144673541,0.422555566,-0.894715786,0.10456793,-0.905694485,-0.410832167),

	[12] = CFrame.new(-33.7028694,54.4737968,341.782379,0.981349885,-0.0572392046,0.183510423,-0.121285766,0.556271255,0.822102368,-0.149138063,-0.829027236,0.538954437),

	[13] = CFrame.new(-30.0384483,51.174984,341.161621,0.724228859,-0.268087089,0.635312378,-0.443653882,0.524160385,0.726929963,-0.527886093,-0.808322489,0.260674238),

	[14] = CFrame.new(-39.7422485,55.4238777,341.818451,0.995215535,0.0894822627,0.0392302871,-0.0713630617,0.39148885,0.917411506,0.0667338297,-0.915821731,0.396001518),

	[15] = CFrame.new(-42.9783211,52.2242889,341.731873,0.953389943,0.246768802,-0.173645526,0.071375221,0.37471348,0.924389362,0.293177754,-0.8936975,0.339634895),
}

local Grab2CFrames = {

	[1] = CFrame.new(-22.2622986,33.3253784,306.991333,0.993239045,-0.0219227038,-0.113998435,3.9239414e-05,0.98206991,-0.188517079,0.116087236,0.187238052,0.975431025),

	[2] = CFrame.new(-25.4713898,37.5758171,312.799316,0.277605116,-0.641507149,0.715125144,-0.951698542,-0.0820008516,0.295881331,-0.13116914,-0.762721717,-0.633285284),

	[3] = CFrame.new(-20.3109951,37.4755936,313.050415,-0.115361691,0.765234888,0.633330166,-0.943811715,0.114342391,-0.310072809,-0.309695005,-0.633515,0.709047019),

	[4] = CFrame.new(-27.8873768,43.3744545,314.957947,0.206946731,-0.614699244,0.761129379,-0.978287935,-0.138935804,0.153784364,0.0112169683,-0.776428819,-0.630105138),

	[5] = CFrame.new(-18.7607403,43.2242355,315.199493,-0.130629182,0.704820335,0.697254896,-0.983318865,-0.00232219696,-0.181875199,-0.126570195,-0.709382057,0.693366468),

	[6] = CFrame.new(-23.3764439,47.8248138,309.055695,0.175050139,-0.940916538,-0.289885253,-0.0900293291,0.277900577,-0.956381679,0.980434656,0.193513006,-0.0360635519),

	[7] = CFrame.new(-37.4483833,52.1751022,312.117889,0.912074983,-0.401789874,-0.0817563981,-0.274129242,-0.449261546,-0.850304604,0.304913759,0.797953367,-0.519902587),

	[8] = CFrame.new(-42.753334,45.5239143,323.969208,0.830968142,0.381354332,-0.405044258,-0.0518202782,-0.671852708,-0.738869727,-0.553901315,0.634966671,-0.538526297),

	[9] = CFrame.new(-36.6263046,34.6280785,336.343597,-0.874356627,-0.0200046003,-0.484871626,0.0878626183,-0.989163041,-0.11762999,-0.477263927,-0.145452634,0.86663872),

	[10] = CFrame.new(-34.720932,35.5718613,337.751892,0.858692765,-0.0776473209,-0.506574452,-0.0596386418,-0.996880293,0.0517076701,-0.509008825,-0.0141895954,-0.860644698),

	[11] = CFrame.new(-30.6096344,31.7232056,343.382629,-0.800322413,0.110070884,-0.589379787,-0.0100072958,0.980414987,0.196688458,0.59948647,0.163312271,-0.783546567),

	[12] = CFrame.new(-28.3341103,31.8737793,340.295898,-0.670797825,0.137591392,-0.728765309,-0.0123189166,0.980437219,0.19644627,0.741537988,0.140753329,-0.655980229),

	[13] = CFrame.new(-28.3088188,30.7749634,336.789062,-0.396023631,0.269565523,-0.877781212,-0.00872080028,0.954791069,0.297149718,0.918199003,0.125333235,-0.375769019),

	[14] = CFrame.new(-34.747551,32.3238487,343.538483,0.959058046,0.119132936,0.256933928,-0.0837436467,0.985945284,-0.144564554,-0.270545185,0.117129214,0.955555379),

	[15] = CFrame.new(-39.1241264,31.3742676,343.469055,0.995089829,-0.0177710019,-0.0973672718,0.000609138049,0.984829962,-0.173520997,0.0989738554,0.172609672,0.980005145),
}

--============================================================
-- CENTERS
--============================================================

local idleCenter =
	IdleCFrames[1].Position

local walk1Center =
	Walk1CFrames[1].Position

local walk2Center =
	Walk2CFrames[1].Position

local emoteCenter =
	EmoteCFrames[1].Position

local grabCenter =
	GrabCFrames[1].Position

local grab2Center =
	Grab2CFrames[1].Position

local LOCK_ROTATION_IDLE = {

	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = true,

}

--============================================================
-- SUSANO ENGINE
--============================================================

RS:BindToRenderStep(
	"SusanoEngine",
	1,
	function(dt)

		waveTime += dt

		local char =
			LP.Character

		if not char then
			return
		end

		-- ตัวละครของผู้ใช้เอง ใช้สำหรับ ANTI SIT เท่านั้น
		local humanoid =
			char:FindFirstChildOfClass("Humanoid")

		if not humanoid then
			return
		end

		--====================================================
		-- ANTI SIT (ทำงานกับตัวเราเท่านั้น)
		--====================================================

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

		-- ตำแหน่งอ้างอิงของพร็อพ: ตัวเองหรือผู้เล่นที่เลือก
		if not followTarget or followTarget.Parent ~= Players then
			followTarget = LP
		end

		local targetChar = followTarget.Character
		local targetHumanoid = targetChar and targetChar:FindFirstChildOfClass("Humanoid")
		local hrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

		if not targetHumanoid or not hrp then
			return
		end

		ScanProps()

		--====================================================
		-- EMOTE
		--====================================================

		if isEmote then

			emoteBlend =
				emoteBlend
				+ (1 - emoteBlend)
				* (
					1 - math.exp(
						-EMOTE_BLEND_IN * dt
					)
				)

		else

			emoteBlend =
				emoteBlend
				+ (0 - emoteBlend)
				* (
					1 - math.exp(
						-EMOTE_BLEND_OUT * dt
					)
				)

		end

		emoteBlend =
			math.clamp(
				emoteBlend,
				0,
				1
			)

		--====================================================
		-- GRAB
		--====================================================

		if grabState == 1 then

			grabBlend1 =
				grabBlend1
				+ (1 - grabBlend1)
				* (
					1 - math.exp(
						-GRAB_BLEND_IN * dt
					)
				)

			if grabBlend1 >= 0.999 then

				grabBlend1 = 1

				grabState = 2

				grabHoldTimer = 0

			end

		elseif grabState == 2 then

			grabHoldTimer += dt

			if grabHoldTimer >=
				GRAB_HOLD_TIME then

				grabState = 3

			end

		elseif grabState == 3 then

			grabBlend2 =
				grabBlend2
				+ (1 - grabBlend2)
				* (
					1 - math.exp(
						-GRAB_BLEND_IN * dt
					)
				)

			if grabBlend2 >= 0.999 then

				grabBlend2 = 1

				grabState = 4

			end

		elseif grabState == 0 then

			grabBlend1 =
				grabBlend1
				+ (0 - grabBlend1)
				* (
					1 - math.exp(
						-GRAB_BLEND_OUT * dt
					)
				)

			grabBlend2 =
				grabBlend2
				+ (0 - grabBlend2)
				* (
					1 - math.exp(
						-GRAB_BLEND_OUT * dt
					)
				)

		end

		--====================================================
		-- WALK
		--====================================================

		local moving =
			targetHumanoid.MoveDirection.Magnitude
			> 0.1

		if moving then

			walkBlend =
				walkBlend
				+ (1 - walkBlend)
				* (
					1 - math.exp(
						-BLEND_IN_SPEED * dt
					)
				)

			sineTime += dt

		else

			walkBlend =
				walkBlend
				+ (0 - walkBlend)
				* (
					1 - math.exp(
						-BLEND_OUT_SPEED * dt
					)
				)

		end

		walkBlend =
			math.clamp(
				walkBlend,
				0,
				1
			)

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
				* WALK_BLEND_MAX
			)
			or 0

		--====================================================
		-- BASE
		--====================================================

		local baseCF =
			hrp.CFrame
			* CFrame.new(
				SIDE_OFFSET,
				HEIGHT_OFFSET,
				BACK_OFFSET
			)
			* DIRECTION_FIX

		local emoteBASE =
			hrp.CFrame
			* CFrame.new(
				SIDE_OFFSET,
				HEIGHT_OFFSET,
				BACK_OFFSET
			)
			* EMOTE_DIR_FIX

		--====================================================
		-- SERVER
		--====================================================

		serverTimer += dt

		local sendServer = false

		if serverTimer >=
			serverInterval then

			serverTimer = 0
			sendServer = true

		end

		local lerpSpeed =
			moving
			and LERP_SPEED_WALK
			or LERP_SPEED_IDLE

		local lerpAlpha =
			1 - math.exp(
				-lerpSpeed * dt
			)

		--====================================================
		-- 15 PROPS
		--====================================================

		for i = 1, 15 do

			local prop =
				propCache[i]

			if prop
				and prop.Parent then

				local idleCF =
					IdleCFrames[i]

				local walk1CF =
					Walk1CFrames[i]

				local walk2CF =
					Walk2CFrames[i]

				local emoteCF =
					EmoteCFrames[i]

				local grabCF =
					GrabCFrames[i]

				local grab2CF =
					Grab2CFrames[i]

				if idleCF
					and walk1CF
					and walk2CF
					and emoteCF
					and grabCF
					and grab2CF then

					--========================================
					-- WALK OFFSET
					--========================================

					local w1Offset =
						walk1CF.Position
						- walk1Center

					local w2Offset =
						walk2CF.Position
						- walk2Center

					local wOffset =
						w1Offset:Lerp(
							w2Offset,
							finalBlend
						)

					--========================================
					-- WALK ROTATION
					--========================================

					local w1Rot =
						walk1CF
						- walk1CF.Position

					local w2Rot =
						walk2CF
						- walk2CF.Position

					local wRot =
						w1Rot:Lerp(
							w2Rot,
							finalBlend
						)

					--========================================
					-- IDLE
					--========================================

					local idleOffset =
						idleCF.Position
						- idleCenter

					local idleRot =
						idleCF
						- idleCF.Position

					local walkWeight =
						moving
						and walkBlend
						or 0

					local finalOffset =
						idleOffset:Lerp(
							wOffset,
							walkWeight
						)

					local finalRot

					if LOCK_ROTATION_IDLE[i] then

						finalRot =
							idleRot

					else

						finalRot =
							idleRot:Lerp(
								wRot,
								walkWeight
							)

					end

					local normalCF =
						baseCF
						* CFrame.new(
							finalOffset
						)
						* finalRot

					--========================================
					-- EMOTE
					--========================================

					local emoteOffset =
						emoteCF.Position
						- emoteCenter

					local emoteRot =
						emoteCF
						- emoteCF.Position

					local emoteFinalCF =
						emoteBASE
						* CFrame.new(
							emoteOffset
						)
						* emoteRot

					--========================================
					-- GRAB 1
					--========================================

					local grabOffset =
						grabCF.Position
						- grabCenter

					local grabRot =
						grabCF
						- grabCF.Position

					local grabFinalCF =
						baseCF
						* CFrame.new(
							grabOffset
						)
						* grabRot

					--========================================
					-- GRAB 2
					--========================================

					local grab2Offset =
						grab2CF.Position
						- grab2Center

					local grab2Rot =
						grab2CF
						- grab2CF.Position

					local grab2FinalCF =
						baseCF
						* CFrame.new(
							grab2Offset
						)
						* grab2Rot

					--========================================
					-- GRAB BLEND
					--========================================

					local grabMergedCF =
						grabFinalCF:Lerp(
							grab2FinalCF,
							grabBlend2
						)

					local afterGrabCF =
						normalCF:Lerp(
							grabMergedCF,
							grabBlend1
						)

					--========================================
					-- EMOTE FINAL
					--========================================

					local targetCF =
						afterGrabCF:Lerp(
							emoteFinalCF,
							emoteBlend
						)

					--========================================
					-- SMOOTH
					--========================================

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

					--========================================
					-- SERVER
					--========================================

					if sendServer then

						local cf =
							currentCFrames[i]

						local targetProp =
							prop

						local index =
							i

						task.spawn(
							function()

								pcall(
									function()

										local rCF =
											targetProp:FindFirstChild(
												"SetCurrentCFrame"
											)

										if rCF then

											rCF:InvokeServer(
												cf
											)

										end

										local rColor =
											targetProp:FindFirstChild(
												"ChangePropColor"
											)

										if rColor then

											rColor:InvokeServer(
												GetWaveColor(
													index
												)
											)

										end

									end
								)

							end
						)

					end

					--========================================
					-- APPLY COLOR
					--========================================

					ApplyColor(
						prop,
						i
					)

				end
			end
		end

	end
)

--============================================================
-- START
--============================================================

print("==========================================")
print("              SUSANO")
print("            BY SANDBOX X")
print("              HOOKS660")
print("==========================================")
print("15 PROPS")
print("DEFAULT COLOR : UNGU")
print("NORMAL COLORS")
print("SPECIAL COLORS")
print("RAINBOW / RGB")
print("COLOR WAVE / KELAP-KELIP")
print("PURPLE KELAP-KELIP GUI")
print("IDLE / WALK / EMOTE / GRAB")
print("ANTI SIT")
print("GRAB: POSE 1 -> 1 SEC -> POSE 2")
print("==========================================")