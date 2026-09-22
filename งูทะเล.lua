local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local OwnerName = LP.Name
local petMode = false
local rampageMode = false
local isControlling = false

local propCache = {}
local propLock = {}
local currentCFrames = {}
local bodyCurrentCFrames = {}
local lastNetworkUpdate = 0
local lastPreyScanTime = 0
local lastPropScanTime = 0

local LeviathanCurrentPos = Vector3.zero
local lastLookAtPos = Vector3.zero
local rampageBlacklist = {}
local targetAttackTrack = { player = nil, startTime = 0, initialPos = Vector3.zero }

local SPEED = 8
local HOVER_HEIGHT = 24
local RANDOM_DRIFT_SCALE = 50
local RAMPAGE_RADIUS = 400
local MAX_STUCK_TIME = 6.0
local PET_OFFSET = Vector3.new(-5, 6, 1)
local MANUAL_ROTATION = Vector3.new(0, 360, 0)

local baseRef = CFrame.new(-15.1534119, 34.0002022, 380.74762, -0.999928296, 1.05061631e-08, -0.0119767003, 1.02473559e-08, 1, 2.1670612e-08, 0.0119767003, 2.15463274e-08, -0.999928296)

local LeviathanParts = {
    CFrame.new(2.979, 34.159, -8.417) * CFrame.Angles(math.rad(-83.240), math.rad(1.169), math.rad(9.749)),
    CFrame.new(4.361, 28.940, 6.863) * CFrame.Angles(math.rad(-173.492), math.rad(50.813), math.rad(-113.657)),
    CFrame.new(-1.854, 11.113, -3.460) * CFrame.Angles(math.rad(-95.037), math.rad(0.003), math.rad(-0.028)),
    CFrame.new(3.591, 25.467, 8.011) * CFrame.Angles(math.rad(-6.823), math.rad(-51.558), math.rad(-116.380)),
    CFrame.new(-5.062, 32.604, 2.871) * CFrame.Angles(math.rad(-90.572), math.rad(5.343), math.rad(96.114)),
    CFrame.new(-4.441, 28.553, 5.894) * CFrame.Angles(math.rad(174.949), math.rad(-51.827), math.rad(110.898)),
    CFrame.new(-5.189, 32.604, -1.842) * CFrame.Angles(math.rad(-90.572), math.rad(5.343), math.rad(96.114)),
    CFrame.new(4.753, 32.508, -1.169) * CFrame.Angles(math.rad(-90.572), math.rad(5.343), math.rad(96.114)),
    CFrame.new(-0.521, 32.082, 6.132) * CFrame.Angles(math.rad(83.814), math.rad(-0.018), math.rad(-179.840)),
    CFrame.new(-13.729, 18.704, 17.074) * CFrame.Angles(math.rad(7.028), math.rad(43.783), math.rad(-66.723)),
    CFrame.new(0.035, 27.014, 8.164) * CFrame.Angles(math.rad(-117.386), math.rad(0.075), math.rad(-0.139)),
    CFrame.new(1.497, 11.113, -3.660) * CFrame.Angles(math.rad(-95.037), math.rad(0.003), math.rad(-0.028)),
    CFrame.new(-4.998, 32.604, 0.453) * CFrame.Angles(math.rad(-90.572), math.rad(5.343), math.rad(96.114)),
    CFrame.new(4.926, 32.740, 1.318) * CFrame.Angles(math.rad(-90.572), math.rad(5.343), math.rad(96.114)),
    CFrame.new(-3.930, 34.152, 5.969) * CFrame.Angles(math.rad(-126.532), math.rad(23.292), math.rad(151.995)),
    CFrame.new(3.340, 33.563, 5.987) * CFrame.Angles(math.rad(-130.873), math.rad(-17.613), math.rad(-149.425)),
    CFrame.new(-3.767, 34.159, -8.824) * CFrame.Angles(math.rad(-86.335), math.rad(-0.809), math.rad(-21.839)),
    CFrame.new(4.709, 32.604, 3.638) * CFrame.Angles(math.rad(-90.572), math.rad(5.343), math.rad(96.114))
}

local JawClose = {
    CFrame.new(2.979, 34.159, -8.417) * CFrame.Angles(math.rad(-83.331), math.rad(1.612), math.rad(13.511)),
    CFrame.new(4.361, 28.940, 6.863) * CFrame.Angles(math.rad(-173.967), math.rad(47.048), math.rad(-113.027)),
    CFrame.new(-1.854, 11.113, -3.460) * CFrame.Angles(math.rad(-95.026), math.rad(-0.329), math.rad(3.744)),
    CFrame.new(3.591, 25.467, 8.011) * CFrame.Angles(math.rad(-6.313), math.rad(-47.796), math.rad(-115.711)),
    CFrame.new(-5.062, 32.604, 2.871) * CFrame.Angles(math.rad(-90.924), math.rad(5.294), math.rad(99.917)),
    CFrame.new(-4.441, 28.553, 5.894) * CFrame.Angles(math.rad(174.474), math.rad(-55.598), math.rad(110.308)),
    CFrame.new(-5.189, 32.604, -1.842) * CFrame.Angles(math.rad(-90.924), math.rad(5.294), math.rad(99.917)),
    CFrame.new(4.753, 32.508, -1.169) * CFrame.Angles(math.rad(-90.924), math.rad(5.294), math.rad(99.917)),
    CFrame.new(-0.521, 32.082, 6.132) * CFrame.Angles(math.rad(83.826), math.rad(0.390), math.rad(176.395)),
    CFrame.new(-13.729, 18.704, 17.074) * CFrame.Angles(math.rad(7.519), math.rad(47.539), math.rad(-67.409)),
    CFrame.new(0.035, 27.014, 8.164) * CFrame.Angles(math.rad(-97.697), math.rad(-0.483), math.rad(3.597)),
    CFrame.new(1.497, 11.113, -3.660) * CFrame.Angles(math.rad(-95.026), math.rad(-0.329), math.rad(3.744)),
    CFrame.new(-4.998, 32.604, 0.453) * CFrame.Angles(math.rad(-90.924), math.rad(5.294), math.rad(99.917)),
    CFrame.new(4.926, 32.740, 1.318) * CFrame.Angles(math.rad(-90.924), math.rad(5.294), math.rad(99.917)),
    CFrame.new(-3.930, 34.152, 5.969) * CFrame.Angles(math.rad(-127.761), math.rad(21.005), math.rad(155.254)),
    CFrame.new(3.340, 33.563, 5.987) * CFrame.Angles(math.rad(-129.888), math.rad(-20.067), math.rad(-146.377)),
    CFrame.new(-3.767, 34.159, -8.824) * CFrame.Angles(math.rad(-86.290), math.rad(-0.565), math.rad(-18.059)),
    CFrame.new(4.709, 32.604, 3.638) * CFrame.Angles(math.rad(-90.924), math.rad(5.294), math.rad(99.917))
}

local BODY_START_OFFSET = Vector3.new(2.5, 4, -8)
local BODY_SEGMENT_LENGTH = 12

local TargetPlayer = nil
local LeviathanCore = nil
local bodyVel, bodyGyro, flyConnection
local dynamicTiltX, dynamicTiltZ = 0, 0
local jumpPressed = false

local lockedTargetPlayer = nil
local targetHighlight = Instance.new("Highlight")
targetHighlight.Name = "LeviathanTargetHighlight"
targetHighlight.FillColor = Color3.fromRGB(0, 200, 255)
targetHighlight.FillTransparency = 0.5
targetHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
targetHighlight.OutlineTransparency = 0

local COLORS = {
    Void = Color3.fromRGB(15, 15, 25),
    Accent = Color3.fromRGB(0, 200, 255),
    SuccessGreen = Color3.fromRGB(0, 230, 150),
    WarningRed = Color3.fromRGB(255, 80, 80),
    PureWhiteOnly = Color3.fromRGB(255, 255, 255),
    SoulAuraBlue = Color3.fromRGB(0, 200, 255)
}

local function FindNearestPrey()
    local nearestPlayer = nil
    local shortestDistance = RAMPAGE_RADIUS
    local myPos = LeviathanCurrentPos
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and Players:FindFirstChild(p.Name) and not rampageBlacklist[p.Name] then
            local char = p.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 and not hum.Sit then
                    local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
                    if torso then
                        local dist = (myPos - torso.Position).Magnitude
                        if dist < shortestDistance then
                            shortestDistance = dist
                            nearestPlayer = p
                        end
                    end
                end
            end
        end
    end
    return nearestPlayer
end

UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        jumpPressed = true
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
        jumpPressed = false
    end
end)

local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "MechaLeviathanV1"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 160, 0, 175)
main.Position = UDim2.new(0.05, 0, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
main.BorderSizePixel = 0
main.ClipsDescendants = true

local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -10, 1, 0)
titleLabel.Position = UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "M-Leviathan V1"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.PermanentMarker
titleLabel.TextSize = 15
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local uiGradient = Instance.new("UIGradient", titleLabel)
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 200)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 220, 200)),
    ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 160, 240)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 200))
})

task.spawn(function()
    local t = 0
    while true do
        local dt = task.wait()
        t = (t + dt * 0.4) % 1
        uiGradient.Offset = Vector2.new((t * 2) - 1, 0)
    end
end)

local statusLabel = Instance.new("TextLabel", main)
statusLabel.Size = UDim2.new(1, -10, 0, 15)
statusLabel.Position = UDim2.new(0, 5, 1, -35)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Leviathan: OFFLINE"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Font = Enum.Font.Code
statusLabel.TextSize = 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

local creditLabel = Instance.new("TextLabel", main)
creditLabel.Size = UDim2.new(1, 0, 0, 15)
creditLabel.Position = UDim2.new(0, 0, 1, -15)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "By Riff"
creditLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
creditLabel.Font = Enum.Font.Code
creditLabel.TextSize = 10

local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging, dragStart, startPos = true, input.Position, main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local function styleBtn(b)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    b.BorderSizePixel = 1
    b.BorderColor3 = Color3.fromRGB(60, 60, 80)
    b.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 11
    b.MouseEnter:Connect(function()
        b.BorderColor3 = COLORS.Accent
        b.TextColor3 = Color3.new(1, 1, 1)
    end)
    b.MouseLeave:Connect(function()
        b.BorderColor3 = Color3.fromRGB(60, 60, 80)
        b.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    end)
end

local container = Instance.new("Frame", main)
container.Size = UDim2.new(1, -10, 1, -70)
container.Position = UDim2.new(0, 5, 0, 35)
container.BackgroundTransparency = 1

local function createBtn(txt, pos, size)
    local b = Instance.new("TextButton", container)
    b.Text = txt
    b.Position = pos
    b.Size = size
    styleBtn(b)
    return b
end

local SummonBtn = createBtn("ACTIVATE", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0.22, 0))
local ControlBtn = createBtn("CONTROL: OFF", UDim2.new(0, 0, 0.25, 0), UDim2.new(1, 0, 0.22, 0))

local TargetBox = Instance.new("TextBox", container)
TargetBox.Size = UDim2.new(1, 0, 0.22, 0)
TargetBox.Position = UDim2.new(0, 0, 0.50, 0)
TargetBox.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
TargetBox.BorderSizePixel = 1
TargetBox.BorderColor3 = Color3.fromRGB(60, 60, 80)
TargetBox.TextColor3 = Color3.fromRGB(180, 180, 180)
TargetBox.PlaceholderText = "Target & Enter"
TargetBox.Text = ""
TargetBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
TargetBox.Font = Enum.Font.Code
TargetBox.TextSize = 10
TargetBox.ClearTextOnFocus = false

local RampageBtn = createBtn("TARGET ALL: OFF", UDim2.new(0, 0, 0.75, 0), UDim2.new(1, 0, 0.22, 0))

local networkSafe = true
local lastSendTick = 0
local sendThreshold = 1/20
local sendBatchSize = 15
local nextSendIndex = 1

local function safeInvoke(remote, cf)
    if not networkSafe then return end
    task.spawn(function()
        local success = pcall(function()
            remote:InvokeServer(cf)
        end)
        if not success then
            networkSafe = false
            task.wait(1)
            networkSafe = true
        end
    end)
end

local function manageTool(state)
    local toolName = "Leviathan Strike"
    local existingTool = LP.Backpack:FindFirstChild(toolName) or (LP.Character and LP.Character:FindFirstChild(toolName))
    if existingTool then existingTool:Destroy() end

    if state then
        local tool = Instance.new("Tool")
        tool.Name = toolName
        tool.RequiresHandle = false
        tool.Parent = LP.Backpack

        local renderConn = nil
        tool.Equipped:Connect(function()
            renderConn = RS.RenderStepped:Connect(function()
                if not isControlling then return end
                local mouse = LP:GetMouse()
                local hoveredPlayer = nil
                if mouse.Target and mouse.Target.Parent then
                    local p = Players:GetPlayerFromCharacter(mouse.Target.Parent)
                    if p and p ~= LP then hoveredPlayer = p end
                end
                if hoveredPlayer and hoveredPlayer.Character then
                    lockedTargetPlayer = hoveredPlayer
                    targetHighlight.Adornee = hoveredPlayer.Character
                    targetHighlight.Parent = hoveredPlayer.Character
                else
                    if not mouse.Target or not mouse.Target.Parent or not Players:GetPlayerFromCharacter(mouse.Target.Parent) then
                        lockedTargetPlayer = nil
                        targetHighlight.Adornee = nil
                        targetHighlight.Parent = nil
                    end
                end
            end)
        end)
        tool.Unequipped:Connect(function()
            if renderConn then renderConn:Disconnect() renderConn = nil end
            targetHighlight.Adornee = nil
            targetHighlight.Parent = nil
            lockedTargetPlayer = nil
        end)
    else
        targetHighlight.Adornee = nil
        targetHighlight.Parent = nil
        lockedTargetPlayer = nil
    end
end

local function startLeviathanFly()
    if LeviathanCore then LeviathanCore:Destroy() end
    LeviathanCore = Instance.new("Part")
    LeviathanCore.Size = Vector3.new(2, 2, 2)
    LeviathanCore.Transparency = 1
    LeviathanCore.CanCollide = false
    LeviathanCore.Massless = true
    LeviathanCore.Position = LeviathanCurrentPos
    LeviathanCore.Parent = workspace

    bodyVel = Instance.new("BodyVelocity")
    bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVel.Velocity = Vector3.zero
    bodyVel.Parent = LeviathanCore

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.P = 10000
    bodyGyro.Parent = LeviathanCore

    local char = LP.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        local hum = char:FindFirstChildOfClass("Humanoid")
        hum.WalkSpeed = 0
        hum.JumpPower = 0
        pcall(function() hum.JumpHeight = 0 end)
    end

    workspace.CurrentCamera.CameraSubject = LeviathanCore
    manageTool(true)

    flyConnection = RS.RenderStepped:Connect(function()
        if not isControlling or not LeviathanCore then return end
        if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = 0
            LP.Character.Humanoid.JumpPower = 0
        end
        local camCF = workspace.CurrentCamera.CFrame
        local moveVector = Vector3.zero
        pcall(function()
            moveVector = require(LP.PlayerScripts.PlayerModule):GetControls():GetMoveVector()
        end)
        local flyDir = (camCF.RightVector * moveVector.X) + (camCF.LookVector * -moveVector.Z)
        if jumpPressed or UIS:IsKeyDown(Enum.KeyCode.Space) then
            flyDir = flyDir + Vector3.new(0, 1, 0)
        end
        if flyDir.Magnitude > 0.01 then
            bodyVel.Velocity = flyDir.Unit * 150
            bodyGyro.CFrame = CFrame.lookAt(LeviathanCore.Position, LeviathanCore.Position + flyDir)
        else
            bodyVel.Velocity = Vector3.zero
            bodyGyro.CFrame = camCF
        end
    end)
end

local function stopLeviathanFly()
    if flyConnection then flyConnection:Disconnect() end
    if LeviathanCore then LeviathanCore:Destroy() LeviathanCore = nil end
    local char = LP.Character
    if char and char:FindFirstChildOfClass("Humanoid") then
        local hum = char:FindFirstChildOfClass("Humanoid")
        hum.WalkSpeed = 16
        hum.JumpPower = 50
        pcall(function() hum.JumpHeight = 7.2 end)
        workspace.CurrentCamera.CameraSubject = hum
    end
    manageTool(false)
end

ControlBtn.MouseButton1Click:Connect(function()
    if not petMode then return end
    isControlling = not isControlling
    if isControlling then
        rampageMode = false
        RampageBtn.Text = "TARGET ALL: OFF"
        RampageBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        ControlBtn.Text = "CONTROL: ON"
        ControlBtn.TextColor3 = COLORS.Accent
        startLeviathanFly()
    else
        ControlBtn.Text = "CONTROL: OFF"
        ControlBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        stopLeviathanFly()
    end
end)

TargetBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if rampageMode or isControlling then return end
        local searchKey = TargetBox.Text:lower()
        if searchKey == "" then
            TargetPlayer = nil
            TargetBox.Text = ""
            TargetBox.BorderColor3 = Color3.fromRGB(60, 60, 80)
            return
        end
        local found = false
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():find(searchKey) or p.DisplayName:lower():find(searchKey) then
                TargetPlayer = p
                TargetBox.Text = p.DisplayName
                TargetBox.BorderColor3 = COLORS.SuccessGreen
                found = true
                break
            end
        end
        if not found then
            TargetPlayer = nil
            TargetBox.Text = "[NOT FOUND]"
            TargetBox.BorderColor3 = COLORS.WarningRed
            task.wait(1)
            TargetBox.Text = ""
            TargetBox.BorderColor3 = Color3.fromRGB(60, 60, 80)
        end
    end
end)

local function ScanForProps()
    local p = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
    if not p then return end
    local targetName = (OwnerName == "ffajjaskdlpfpokcnsaa") and "Propffajjaskdlpfpokcnsaa" or ("Prop" .. OwnerName)
    local rawProps = {}
    for _, v in ipairs(p:GetChildren()) do
        if v.Name == targetName then table.insert(rawProps, v) end
    end
    for id, storedProp in pairs(propLock) do
        if not storedProp or not storedProp.Parent then propLock[id] = nil end
    end
    for _, prop in ipairs(rawProps) do
        local already = false
        for id, storedProp in pairs(propLock) do
            if storedProp == prop then already = true break end
        end
        if not already then
            for id = 1, 200 do
                if not propLock[id] then
                    propLock[id] = prop
                    break
                end
            end
        end
    end
    propCache = {}
    local maxIndex = 0
    for id in pairs(propLock) do
        if id > maxIndex then maxIndex = id end
    end
    for i = 1, maxIndex do
        if propLock[i] and propLock[i].Parent then
            propCache[#propCache + 1] = propLock[i]
        end
    end
end

SummonBtn.MouseButton1Click:Connect(function()
    petMode = not petMode
    if petMode then
        SummonBtn.TextColor3 = COLORS.Accent
        SummonBtn.Text = "DEACTIVATE"
        ScanForProps()
        local char = LP.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            LeviathanCurrentPos = char.HumanoidRootPart.Position + Vector3.new(0, HOVER_HEIGHT, 0)
            lastLookAtPos = LeviathanCurrentPos + Vector3.new(0, 0, -1)
        end
        propCache = {}
        local maxIndex = 0
        for id in pairs(propLock) do if id > maxIndex then maxIndex = id end end
        for i = 1, maxIndex do
            if propLock[i] then
                propCache[#propCache + 1] = propLock[i]
            end
        end
    else
        SummonBtn.TextColor3 = Color3.new(0.8,0.8,0.8)
        SummonBtn.Text = "ACTIVATE"
        rampageMode = false
        isControlling = false
        stopLeviathanFly()
        ControlBtn.Text = "CONTROL: OFF"
        ControlBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        RampageBtn.Text = "TARGET ALL: OFF"
        RampageBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        TargetBox.Text = ""
        TargetBox.BorderColor3 = Color3.fromRGB(60, 60, 80)
        table.clear(currentCFrames)
        table.clear(bodyCurrentCFrames)
        table.clear(rampageBlacklist)
        table.clear(propLock)
        propCache = {}
    end
end)

RampageBtn.MouseButton1Click:Connect(function()
    if not petMode or isControlling then return end
    rampageMode = not rampageMode
    if rampageMode then
        table.clear(rampageBlacklist)
        RampageBtn.Text = "RAMPAGE: ACTIVE"
        RampageBtn.TextColor3 = COLORS.Accent
        TargetBox.Text = "[HUNTING]"
        TargetBox.BorderColor3 = COLORS.Accent
    else
        rampageMode = false
        RampageBtn.Text = "TARGET ALL: OFF"
        RampageBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        TargetPlayer = nil
        TargetBox.Text = ""
        TargetBox.BorderColor3 = Color3.fromRGB(60, 60, 80)
    end
end)

local function getTargetTorso(player)
    if not player or not player.Parent or not Players:FindFirstChild(player.Name) or not player.Character then return nil end
    local char = player.Character
    return char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
end

RS.Heartbeat:Connect(function(dt)
    local totalProps = #propCache
    if not petMode or totalProps < 1 then return end

    local t = tick()

    if t - lastPropScanTime > 2 then
        lastPropScanTime = t
        ScanForProps()
        totalProps = #propCache
    end

    if isControlling then
        statusLabel.Text = "Leviathan: MANUAL"
        statusLabel.TextColor3 = COLORS.Accent
    elseif rampageMode then
        statusLabel.Text = "Leviathan: RAMPAGE"
        statusLabel.TextColor3 = COLORS.Accent
    else
        statusLabel.Text = "Leviathan: HOVER"
        statusLabel.TextColor3 = COLORS.SuccessGreen
    end

    if rampageMode and not isControlling then
        if TargetPlayer then
            local enemyChar = TargetPlayer.Character
            local enemyHum = enemyChar and enemyChar:FindFirstChildOfClass("Humanoid")
            local enemyTorso = getTargetTorso(TargetPlayer)
            if not enemyChar or not enemyHum or enemyHum.Health <= 0 or enemyHum.Sit or rampageBlacklist[TargetPlayer.Name] or not Players:FindFirstChild(TargetPlayer.Name) then
                TargetPlayer = nil
            elseif enemyTorso then
                local currentVelocity = enemyTorso.AssemblyLinearVelocity.Magnitude
                local distanceMoved = (enemyTorso.Position - targetAttackTrack.initialPos).Magnitude
                if currentVelocity > 120 or distanceMoved > 85 then
                    rampageBlacklist[TargetPlayer.Name] = true
                    TargetPlayer = nil
                elseif t - targetAttackTrack.startTime > MAX_STUCK_TIME and distanceMoved < 8 then
                    rampageBlacklist[TargetPlayer.Name] = true
                    TargetPlayer = nil
                end
            end
        end

        if t - lastPreyScanTime > 0.35 then
            lastPreyScanTime = t
            if not TargetPlayer then
                local prey = FindNearestPrey()
                if prey then
                    TargetPlayer = prey
                    targetAttackTrack.player = prey
                    targetAttackTrack.startTime = t
                    if prey.Character and getTargetTorso(prey) then
                        targetAttackTrack.initialPos = getTargetTorso(prey).Position
                    end
                    TargetBox.Text = "HUNT: " .. prey.DisplayName
                    TargetBox.BorderColor3 = COLORS.Accent
                else
                    TargetBox.Text = "[SCAN FAIL]"
                    TargetBox.BorderColor3 = Color3.fromRGB(60, 60, 80)
                end
            end
        end
    end

    local finalPos
    local isPetState = false

    if isControlling and LeviathanCore then
        local swayY = math.sin(t * 1.8) * 1.2
        LeviathanCurrentPos = LeviathanCore.Position + Vector3.new(0, swayY, 0)
        lastLookAtPos = LeviathanCurrentPos + LeviathanCore.CFrame.LookVector * 50
        finalPos = CFrame.new(LeviathanCurrentPos, lastLookAtPos)
        local vel = bodyVel.Velocity
        local localVel = LeviathanCore.CFrame:VectorToObjectSpace(vel)
        dynamicTiltX = math.clamp(localVel.Z * 0.15, -10, 10)
        dynamicTiltZ = math.clamp(-localVel.X * 0.15, -10, 10)
    else
        dynamicTiltX = 0
        dynamicTiltZ = 0

        local currentTarget = TargetPlayer
        if not rampageMode and (not currentTarget or not currentTarget.Character or not getTargetTorso(currentTarget)) then
            currentTarget = LP
            isPetState = true
        end

        local targetTorso = getTargetTorso(currentTarget)

        if not targetTorso and rampageMode then
            finalPos = CFrame.new(LeviathanCurrentPos, lastLookAtPos)
        elseif targetTorso then
            local idealTargetPos
            if isPetState then
                local ownerChar = LP.Character
                local ownerRoot = ownerChar and ownerChar:FindFirstChild("HumanoidRootPart")
                if ownerRoot then
                    local swayY = math.sin(t * 1.8) * 0.45
                    local animatedOffset = PET_OFFSET + Vector3.new(0, swayY, 0)
                    idealTargetPos = (ownerRoot.CFrame * CFrame.new(animatedOffset)).Position
                else
                    idealTargetPos = targetTorso.Position + Vector3.new(0, 8, 5)
                end
            else
                local orbitRadius = 25
                local orbitSpeed = 5
                local orbitX = math.cos(t * orbitSpeed) * orbitRadius
                local orbitZ = math.sin(t * orbitSpeed) * orbitRadius
                local orbitY = math.sin(t * 4) * 8
                idealTargetPos = targetTorso.Position + Vector3.new(orbitX, orbitY, orbitZ)
            end

            local moveDirection = (idealTargetPos - LeviathanCurrentPos)
            local distance = moveDirection.Magnitude

            if distance > 0.1 then
                local speedMod = isPetState and 15 or 12
                local maxMove = SPEED * speedMod * dt
                local step = math.min(distance, maxMove)
                LeviathanCurrentPos = LeviathanCurrentPos + (moveDirection.Unit * step)
            end

            local rawLookAt
            if isPetState then
                local ownerChar = LP.Character
                local ownerRoot = ownerChar and ownerChar:FindFirstChild("HumanoidRootPart")
                if ownerRoot then
                    rawLookAt = ownerRoot.Position + (ownerRoot.CFrame.LookVector * 50)
                else
                    rawLookAt = LeviathanCurrentPos + Vector3.new(0, 0, -5)
                end
            else
                rawLookAt = targetTorso.Position
            end

            lastLookAtPos = lastLookAtPos:Lerp(rawLookAt, 1 - math.exp(-12 * dt))
            finalPos = CFrame.new(LeviathanCurrentPos, lastLookAtPos)
        else
            finalPos = CFrame.new(LeviathanCurrentPos)
        end
    end

    local rotCF = CFrame.Angles(math.rad(MANUAL_ROTATION.X + dynamicTiltX), math.rad(MANUAL_ROTATION.Y), math.rad(MANUAL_ROTATION.Z + dynamicTiltZ))
    
    -- [LERP SMOOTHING TWEAK HERE]
    -- Alpha utama untuk lerp prop parts. Dikurangi dari 16 menjadi 8 untuk transisi frame yang lebih halus.
    local lerpAlpha = 1 - math.exp(-8 * dt)

    if totalProps >= 19 then
        local headBaseWorld = finalPos * rotCF * LeviathanParts[18]
        local firstBodyTarget = headBaseWorld * CFrame.new(BODY_START_OFFSET)

        for bodyIdx = 19, totalProps do
            local leaderCFrame
            if bodyIdx == 19 then
                leaderCFrame = firstBodyTarget
            else
                leaderCFrame = bodyCurrentCFrames[bodyIdx - 1]
                if not leaderCFrame then
                    leaderCFrame = firstBodyTarget
                end
            end

            if not bodyCurrentCFrames[bodyIdx] then
                bodyCurrentCFrames[bodyIdx] = leaderCFrame * CFrame.new(0, 0, BODY_SEGMENT_LENGTH)
            end

            local current = bodyCurrentCFrames[bodyIdx]
            local leaderPos = leaderCFrame.Position
            local currentPos = current.Position
            local diff = leaderPos - currentPos
            local dist = diff.Magnitude

            local newPos = currentPos
            if dist > BODY_SEGMENT_LENGTH then
                newPos = leaderPos - diff.Unit * BODY_SEGMENT_LENGTH
            end

            -- [LERP SMOOTHING TWEAK HERE]
            -- Alpha posisi dan rotasi body dikurangi dari 18 & 14 menjadi 10 & 8 
            -- Ini mengatasi gerakan body belakang yang kaku saat mengikuti kepala
            local alphaPos = 1 - math.exp(-10 * dt)
            local lerpedPos = currentPos:Lerp(newPos, alphaPos)

            local targetRot = CFrame.lookAt(lerpedPos, leaderPos).Rotation
            local alphaRot = 1 - math.exp(-8 * dt)
            local lerpedRot = current.Rotation:Lerp(targetRot, alphaRot)

            bodyCurrentCFrames[bodyIdx] = CFrame.new(lerpedPos) * lerpedRot
        end
    end

    local jawAlpha = (math.sin(t * 4) + 1) / 2

    for i = 1, totalProps do
        local targetCF
        if i <= 18 then
            local offset = LeviathanParts[i]:Lerp(JawClose[i], jawAlpha)
            if isPetState and not isControlling then
                if i == 1 then local breathZ = math.sin(t * 2.5) * 0.22 offset = offset * CFrame.new(0, 0, breathZ)
                elseif i == 2 then local breathZ = math.cos(t * 2.3) * 0.18 offset = offset * CFrame.new(0, 0, breathZ)
                elseif i == 3 then local breathZ = math.sin(t * 2.1) * 0.18 offset = offset * CFrame.new(0, 0, breathZ) end
            end
            targetCF = finalPos * rotCF * offset
        else
            targetCF = bodyCurrentCFrames[i]
            if not targetCF then
                targetCF = finalPos * rotCF * LeviathanParts[18] * CFrame.new(BODY_START_OFFSET)
            end
        end
        if targetCF then
            currentCFrames[i] = (currentCFrames[i] or targetCF):Lerp(targetCF, lerpAlpha)
        end
    end

    if t - lastSendTick >= sendThreshold then
        lastSendTick = t
        local sent = 0
        while sent < sendBatchSize and totalProps > 0 do
            local idx = nextSendIndex
            nextSendIndex = (nextSendIndex % totalProps) + 1

            local prop = propCache[idx]
            local targetCFrame = currentCFrames[idx]
            if prop and targetCFrame then
                local cfR = prop:FindFirstChild("SetCurrentCFrame")
                if cfR then
                    safeInvoke(cfR, targetCFrame)
                    sent = sent + 1
                end
            end
        end
    end
end)
