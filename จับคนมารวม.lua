-- [[ UPDATE ZUKLIR FE V5 ]] --
-- Void Brutal Rainbow Edition + Draggable Circle

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Gui = Instance.new("ScreenGui", gethui())
Gui.Name = "UpdateZuklirFEV5"
Gui.ResetOnSpawn = false

-- STATE
local voidActive = false
local ngerusuhActive = false
local papanActive = false
local remoteCache = {}
local voidTarget = nil
local rusuhTimer = 0
local voidCounter = 0

-- RAINBOW
local RAINBOW = {
	Color3.fromRGB(255, 60, 60),
	Color3.fromRGB(255, 140, 40),
	Color3.fromRGB(255, 220, 60),
	Color3.fromRGB(120, 255, 120),
	Color3.fromRGB(60, 220, 255),
	Color3.fromRGB(100, 140, 255),
	Color3.fromRGB(200, 100, 255),
	Color3.fromRGB(255, 100, 220),
}
local BASE_DEEP = Color3.fromRGB(15, 10, 25)
local BASE_DARK = Color3.fromRGB(30, 20, 50)

local waveTime = 0

local function getShine(t)
	local cycle = (t * 2.5) % #RAINBOW
	local i = math.floor(cycle) + 1
	local ni = (i % #RAINBOW) + 1
	return RAINBOW[i]:Lerp(RAINBOW[ni], cycle - math.floor(cycle))
end
local function getTC() return getShine(waveTime) end
local function getPropColor(t, offset)
	local cycle = (t * 1.5 + offset * 0.15) % #RAINBOW
	local i = math.floor(cycle) + 1
	local ni = (i % #RAINBOW) + 1
	return RAINBOW[i]:Lerp(RAINBOW[ni], cycle - math.floor(cycle))
end

local function AddCorner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 8)
	c.Parent = p
	return c
end

-- MAIN GUI
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 230, 0, 150)
Main.Position = UDim2.new(0.5, -115, 0.5, -75)
Main.BackgroundColor3 = BASE_DEEP
Main.BorderSizePixel = 2
Main.BorderColor3 = RAINBOW[1]
Main.Active = true
Main.ClipsDescendants = true
Main.Parent = Gui
AddCorner(Main, 10)

local RainbowGrad = Instance.new("UIGradient", Main)
RainbowGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.0, RAINBOW[1]),
	ColorSequenceKeypoint.new(0.16, RAINBOW[2]),
	ColorSequenceKeypoint.new(0.33, RAINBOW[3]),
	ColorSequenceKeypoint.new(0.5, RAINBOW[4]),
	ColorSequenceKeypoint.new(0.66, RAINBOW[5]),
	ColorSequenceKeypoint.new(0.83, RAINBOW[6]),
	ColorSequenceKeypoint.new(1.0, RAINBOW[8])
})
RainbowGrad.Rotation = 45

task.spawn(function()
	while true do
		local t = TweenService:Create(RainbowGrad, TweenInfo.new(3, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
		t:Play()
		task.wait(3)
		RainbowGrad.Offset = Vector2.new(-1, 0)
	end
end)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, -50, 0, 30)
Title.Position = UDim2.new(0, 5, 0, 3)
Title.BackgroundTransparency = 1
Title.Text = "UPDATE ZUKLIR FE V5"
Title.TextColor3 = RAINBOW[1]
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = BASE_DEEP
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

local MaxBtn = Instance.new("TextButton", Main)
MaxBtn.Size = UDim2.new(0, 12, 0, 12)
MaxBtn.Position = UDim2.new(1, -32, 0, 9)
MaxBtn.BackgroundColor3 = BASE_DEEP
MaxBtn.Text = "+"
MaxBtn.TextColor3 = RAINBOW[1]
MaxBtn.Font = Enum.Font.GothamBold
MaxBtn.TextSize = 10
MaxBtn.BorderSizePixel = 1
MaxBtn.BorderColor3 = RAINBOW[1]
MaxBtn.Parent = Main
AddCorner(MaxBtn, 2)

local MinBtn = Instance.new("TextButton", Main)
MinBtn.Size = UDim2.new(0, 12, 0, 12)
MinBtn.Position = UDim2.new(1, -18, 0, 9)
MinBtn.BackgroundColor3 = BASE_DEEP
MinBtn.Text = "-"
MinBtn.TextColor3 = RAINBOW[1]
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 10
MinBtn.BorderSizePixel = 1
MinBtn.BorderColor3 = RAINBOW[1]
MinBtn.Parent = Main
AddCorner(MinBtn, 2)

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, 0, 1, -30)
Content.Position = UDim2.new(0, 0, 0, 30)
Content.BackgroundTransparency = 1
Content.Parent = Main

local List = Instance.new("UIListLayout", Content)
List.Padding = UDim.new(0, 6)
List.HorizontalAlignment = Enum.HorizontalAlignment.Center
List.SortOrder = Enum.SortOrder.LayoutOrder

local Pad = Instance.new("UIPadding", Content)
Pad.PaddingTop = UDim.new(0, 6)
Pad.Parent = Content

local function createBtn(text, order)
	local B = Instance.new("TextButton")
	B.Size = UDim2.new(0.9, 0, 0, 32)
	B.BackgroundColor3 = BASE_DARK
	B.BorderSizePixel = 1
	B.BorderColor3 = RAINBOW[1]
	B.Text = text
	B.TextColor3 = RAINBOW[1]
	B.Font = Enum.Font.GothamBold
	B.TextSize = 12
	B.LayoutOrder = order
	B.Parent = Content
	AddCorner(B, 6)
	return B
end

local VoidBtn = createBtn("VOID BRUTAL : OFF", 1)
local NgerusuhBtn = createBtn("NGERUSUH : OFF", 2)
local PapanBtn = createBtn("PROP PAPAN : OFF", 3)

local FooterLbl = Instance.new("TextLabel", Content)
FooterLbl.Size = UDim2.new(0.9, 0, 0, 20)
FooterLbl.BackgroundTransparency = 1
FooterLbl.Text = "Update Script by Zuklir"
FooterLbl.TextColor3 = RAINBOW[3]
FooterLbl.Font = Enum.Font.Gotham
FooterLbl.TextSize = 8
FooterLbl.LayoutOrder = 4
FooterLbl.Parent = Content

-- MINI CIRCLE
local MiniCircle = Instance.new("TextButton", Gui)
MiniCircle.Size = UDim2.new(0, 55, 0, 55)
MiniCircle.Position = UDim2.new(0.5, -27, 0.5, -27)
MiniCircle.BackgroundColor3 = BASE_DEEP
MiniCircle.BorderSizePixel = 2
MiniCircle.BorderColor3 = RAINBOW[1]
MiniCircle.Text = "🤖"
MiniCircle.TextColor3 = RAINBOW[1]
MiniCircle.Font = Enum.Font.GothamBold
MiniCircle.TextSize = 26
MiniCircle.Visible = false
MiniCircle.Active = true
MiniCircle.Parent = Gui
AddCorner(MiniCircle, 27)

local MiniGrad = Instance.new("UIGradient", MiniCircle)
MiniGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0.0, RAINBOW[1]),
	ColorSequenceKeypoint.new(0.33, RAINBOW[3]),
	ColorSequenceKeypoint.new(0.66, RAINBOW[5]),
	ColorSequenceKeypoint.new(1.0, RAINBOW[7])
})
MiniGrad.Rotation = 45

local CircleMaxBtn = Instance.new("TextButton", MiniCircle)
CircleMaxBtn.Size = UDim2.new(0, 14, 0, 14)
CircleMaxBtn.Position = UDim2.new(1, -16, 0, 2)
CircleMaxBtn.BackgroundColor3 = BASE_DEEP
CircleMaxBtn.Text = "+"
CircleMaxBtn.TextColor3 = RAINBOW[1]
CircleMaxBtn.Font = Enum.Font.GothamBold
CircleMaxBtn.TextSize = 10
CircleMaxBtn.BorderSizePixel = 1
CircleMaxBtn.BorderColor3 = RAINBOW[1]
CircleMaxBtn.ZIndex = 5
CircleMaxBtn.Parent = MiniCircle
AddCorner(CircleMaxBtn, 7)

-- DRAG SYSTEM
local dragging = false
local dragStart
local startPos

local function setupDrag(frame)
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

setupDrag(MiniCircle)
setupDrag(Main)

-- ENGINE
local function updateRemotes()
	local temp = {}
	local wsCom = Workspace:FindFirstChild("WorkspaceCom")
	if not wsCom then return end
	for _, cat in pairs(wsCom:GetChildren()) do
		for _, p in pairs(cat:GetChildren()) do
			if p:FindFirstChild("SetCurrentCFrame") then
				table.insert(temp, p)
			end
		end
	end
	remoteCache = temp
end

local function findNearestPlayer()
	local myChar = LP.Character
	local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myHrp then return nil end
	local closest, dist = nil, math.huge
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local d = (hrp.Position - myHrp.Position).Magnitude
				if d < dist then dist = d closest = p end
			end
		end
	end
	return closest
end

local function getRandomPlayerHRP()
	local cand = {}
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LP and p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then table.insert(cand, hrp) end
		end
	end
	if #cand == 0 then return nil end
	return cand[math.random(1, #cand)]
end

local function sendProp(prop, cf, idx)
	if not prop then return end
	local setCF = prop:FindFirstChild("SetCurrentCFrame")
	if setCF then
		task.spawn(function() pcall(function() setCF:InvokeServer(cf) end) end)
	end
	local colRemote = prop:FindFirstChild("ChangePropColor")
	if colRemote and math.random() < 0.2 then
		task.spawn(function() pcall(function() colRemote:InvokeServer(getPropColor(tick(), idx)) end) end)
	end
end

RunService.Heartbeat:Connect(function()
	if not (voidActive or ngerusuhActive or papanActive) then return end
	if #remoteCache == 0 then
		updateRemotes()
		return
	end

	if voidActive then
		if not voidTarget or not voidTarget.Character then
			voidTarget = findNearestPlayer()
		end
		if voidTarget and voidTarget.Character then
			local tHrp = voidTarget.Character:FindFirstChild("HumanoidRootPart")
			if tHrp then
				voidCounter += 1
				local count = #remoteCache
				for i = 1, count do
					local prop = remoteCache[i]
					if prop and prop.Parent then
						local mode = (i % 4)
						local offset, rot
						if mode == 0 then
							offset = Vector3.new(
								math.random(-1, 1),
								-50000 - math.random(0, 5000),
								math.random(-1, 1)
							)
							rot = CFrame.Angles(
								math.rad(math.random(-360, 360)),
								math.rad(math.random(-360, 360)),
								math.rad(math.random(-360, 360))
							)
						elseif mode == 1 then
							offset = Vector3.new(
								math.random(-5, 5) / 10,
								math.random(-5, 5) / 10,
								math.random(-5, 5) / 10
							)
							rot = CFrame.Angles(
								voidCounter * 0.9,
								voidCounter * 0.7,
								voidCounter * 0.8
							)
						elseif mode == 2 then
							local lift = (voidCounter % 20 < 10) and 50 or -5000
							offset = Vector3.new(
								math.random(-2, 2),
								lift,
								math.random(-2, 2)
							)
							rot = CFrame.Angles(
								math.rad(math.random(-360, 360)),
								math.rad(math.random(-360, 360)),
								math.rad(math.random(-360, 360))
							)
						else
							local ang = voidCounter * 1.5 + i
							offset = Vector3.new(
								math.cos(ang) * 1.5,
								math.sin(ang * 2) * 3,
								math.sin(ang) * 1.5
							)
							rot = CFrame.Angles(
								voidCounter * 2,
								voidCounter * 1.8,
								voidCounter * 1.5
							)
						end
						local targetCF = CFrame.new(tHrp.Position + offset) * rot
						sendProp(prop, targetCF, i)
					end
				end
			end
		end
	end

	if ngerusuhActive then
		rusuhTimer += 0.016
		local target = getRandomPlayerHRP()
		if target and rusuhTimer >= 0.15 then
			rusuhTimer = 0
			for i = 1, #remoteCache do
				local prop = remoteCache[i]
				if prop and prop.Parent then
					local rRot = CFrame.Angles(
						math.rad(math.random(-360, 360)),
						math.rad(math.random(-360, 360)),
						math.rad(math.random(-360, 360))
					)
					local targetPos = target.Position + Vector3.new(
						math.random(-3, 3), math.random(-2, 2), math.random(-3, 3)
					)
					sendProp(prop, CFrame.new(targetPos) * rRot, i)
				end
			end
		end
	end

	if papanActive then
		local myChar = LP.Character
		local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
		if myHrp then
			local count = #remoteCache
			for i = 1, count do
				local prop = remoteCache[i]
				if prop and prop.Parent then
					local angle = (i / count) * math.pi * 2
					local offset = Vector3.new(math.cos(angle) * 6, 0, math.sin(angle) * 6)
					local rot = CFrame.Angles(0, angle, 0)
					sendProp(prop, myHrp.CFrame * CFrame.new(offset) * rot, i)
				end
			end
		end
	end
end)

task.spawn(function()
	while true do
		updateRemotes()
		task.wait(3)
	end
end)

RunService.RenderStepped:Connect(function(dt)
	waveTime += dt
	local c = getShine(waveTime)
	local c2 = getShine(waveTime + 0.3)
	local c3 = getShine(waveTime + 0.6)
	Main.BorderColor3 = c
	MiniCircle.BorderColor3 = c
	MiniCircle.TextColor3 = c2
	Title.TextColor3 = c2
	MaxBtn.TextColor3 = c3
	MinBtn.TextColor3 = c3
	CircleMaxBtn.TextColor3 = c3
	MaxBtn.BorderColor3 = c
	MinBtn.BorderColor3 = c
	VoidBtn.BorderColor3 = c
	NgerusuhBtn.BorderColor3 = c2
	PapanBtn.BorderColor3 = c3
	FooterLbl.TextColor3 = c2
end)

VoidBtn.MouseButton1Click:Connect(function()
	voidActive = not voidActive
	if voidActive then
		VoidBtn.Text = "VOID BRUTAL : ON"
		VoidBtn.BackgroundColor3 = getTC()
		VoidBtn.TextColor3 = BASE_DEEP
		voidTarget = findNearestPlayer()
		voidCounter = 0
		updateRemotes()
	else
		VoidBtn.Text = "VOID BRUTAL : OFF"
		VoidBtn.BackgroundColor3 = BASE_DARK
		VoidBtn.TextColor3 = RAINBOW[1]
		voidTarget = nil
	end
end)

NgerusuhBtn.MouseButton1Click:Connect(function()
	ngerusuhActive = not ngerusuhActive
	if ngerusuhActive then
		NgerusuhBtn.Text = "NGERUSUH : ON"
		NgerusuhBtn.BackgroundColor3 = getTC()
		NgerusuhBtn.TextColor3 = BASE_DEEP
		updateRemotes()
	else
		NgerusuhBtn.Text = "NGERUSUH : OFF"
		NgerusuhBtn.BackgroundColor3 = BASE_DARK
		NgerusuhBtn.TextColor3 = RAINBOW[1]
	end
end)

PapanBtn.MouseButton1Click:Connect(function()
	papanActive = not papanActive
	if papanActive then
		PapanBtn.Text = "PROP PAPAN : ON"
		PapanBtn.BackgroundColor3 = getTC()
		PapanBtn.TextColor3 = BASE_DEEP
		updateRemotes()
	else
		PapanBtn.Text = "PROP PAPAN : OFF"
		PapanBtn.BackgroundColor3 = BASE_DARK
		PapanBtn.TextColor3 = RAINBOW[1]
	end
end)

MinBtn.MouseButton1Click:Connect(function()
	Main.Visible = false
	MiniCircle.Visible = true
	MiniCircle.Position = UDim2.new(0.5, -27, 0.5, -27)
end)

CircleMaxBtn.MouseButton1Click:Connect(function()
	Main.Visible = true
	MiniCircle.Visible = false
end)

LP.CharacterAdded:Connect(function()
	task.wait(1)
	voidTarget = findNearestPlayer()
	updateRemotes()
end)

print("Update Zuklir FE V5 - Rainbow loaded")