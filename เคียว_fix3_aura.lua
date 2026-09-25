local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

local OwnerName = LP.Name
local petMode, isAttacking, skill2Active, soulSlashActive, deathSpinActive = false, false, false, false, false
local isMinimized = false
local comboStep = 1
local wingRemoteCache, currentCFrames = {}, {}
local lastUpdate, colorTimer = 0, 0

local COLORS = {
    Red     = Color3.fromRGB(220, 20, 20),
    DeepRed = Color3.fromRGB(120, 0, 0),
    Blue    = Color3.fromRGB(30, 100, 255),
    DeepBlue= Color3.fromRGB(0, 40, 140),
    White   = Color3.fromRGB(255, 255, 255),
    Black   = Color3.fromRGB(5, 5, 10)
}

local function getAbyssColor(t, offset)
    local cycle = (t * 0.5 + (offset * 0.15)) % 1
    if cycle < 0.5 then
        local f = cycle * 2
        if f < 0.5 then
            return COLORS.DeepRed:Lerp(COLORS.Red, f * 2)
        else
            return COLORS.Red:Lerp(COLORS.DeepBlue, (f - 0.5) * 2)
        end
    else
        local f = (cycle - 0.5) * 2
        if f < 0.5 then
            return COLORS.DeepBlue:Lerp(COLORS.Blue, f * 2)
        else
            return COLORS.Blue:Lerp(COLORS.DeepRed, (f - 0.5) * 2)
        end
    end
end

local function getOff(base, target)
    return base:ToObjectSpace(target)
end

local baseRef = CFrame.new(-236.747, 9.506, -60.077)
local baseBilah = CFrame.new(-79.3105, 7.1770, -66.5960)

local ScytheParts = {
    getOff(baseRef, CFrame.new(-236.747, 9.506, -60.077, -0.008, -0.264, 0.964, -0.999, 0.017, -0.003, -0.016, -0.964, -0.264)),
    getOff(baseRef, CFrame.new(-236.716, 14.642, -60.083, 0.008, 0.279, 0.960, 0.999, 0.014, -0.012, -0.017, 0.960, -0.279)),
    getOff(baseRef, CFrame.new(-236.093, 24.774, -59.104, 0.058, -0.242, -0.968, 0.974, 0.224, 0.002, 0.216, -0.943, 0.249)),
    getOff(baseRef, CFrame.new(-235.961, 28.168, -60.399, 0.333, 0.712, -0.617, 0.168, 0.599, 0.782, 0.927, -0.365, 0.080)),
    getOff(baseRef, CFrame.new(-237.159, 28.203, -60.040, 0.210, 0.733, 0.646, 0.137, -0.676, 0.723, 0.967, -0.063, -0.243)),
    getOff(baseRef, CFrame.new(-237.521, 29.332, -63.855, 0.258, -0.030, -0.965, 0.231, 0.972, 0.030, 0.938, -0.231, 0.258)),
    getOff(baseRef, CFrame.new(-237.705, 26.742, -64.716, 0.272, 0, -0.962, 0, 1, 0, 0.962, 0, 0.272)),
    getOff(baseRef, CFrame.new(-240.150, 26.147, -72.897, -0.233, 0.134, -0.962, -0.552, -0.833, 0.018, -0.799, 0.536, 0.269)),
    getOff(baseRef, CFrame.new(-239.586, 26.803, -69.858, 0.251, 0.135, 0.958, 0.413, -0.910, 0.019, 0.875, 0.391, -0.285)),
    getOff(baseRef, CFrame.new(-241.325, 22.019, -75.758, 0.118, 0.253, 0.960, 0.927, -0.374, -0.015, 0.355, 0.892, -0.279))
}

local BilahParts = {
    getOff(baseBilah, CFrame.new(-79.310, 7.177, -66.596, 0.349, -0.933, -0.079, 0.544, 0.133, 0.828, -0.762, -0.332, 0.554)),
    getOff(baseBilah, CFrame.new(-79.501, 7.447, -58.620, -0.307, -0.946, 0.102, -0.564, 0.267, 0.780, -0.766, 0.182, -0.616)),
    getOff(baseBilah, CFrame.new(-79.270, 2.109, -66.560, 0.362, 0.927, -0.086, -0.524, 0.126, -0.841, -0.770, 0.350, 0.532)),
    getOff(baseBilah, CFrame.new(-80.585, 2.192, -58.490, -0.126, 0.990, 0.056, 0.507, 0.113, -0.854, -0.852, -0.079, -0.516)),
    getOff(baseBilah, CFrame.new(-73.709, 12.594, -72.803, -0.749, -0.660, 0.046, -0.450, 0.456, -0.767, 0.485, -0.596, -0.639)),
    getOff(baseBilah, CFrame.new(-74.909, 12.409, -51.954, -0.628, -0.777, -0.001, -0.449, 0.361, 0.817, -0.634, 0.514, -0.576)),
    getOff(baseBilah, CFrame.new(-75.560, 4.468, -59.149, 0.952, 0.304, -0.012, 0.001, 0.034, 0.999, 0.304, -0.951, 0.032)),
    getOff(baseBilah, CFrame.new(-75.388, 4.516, -65.490, 0.957, -0.288, -0.005, 0.022, 0.057, 0.998, -0.287, -0.955, 0.061)),
    getOff(baseBilah, CFrame.new(-66.368, 4.602, -56.958, 0.982, -0.158, -0.097, 0.000, 0.523, -0.852, 0.186, 0.837, 0.514)),
    getOff(baseBilah, CFrame.new(-66.245, 4.977, -68.235, -0.977, -0.172, -0.119, -0.012, 0.616, -0.787, 0.209, -0.768, -0.604))
}

local function moveProp(index, targetCF)
    local prop = wingRemoteCache[index]
    if not prop or not prop.Parent then return end
    currentCFrames[index] = (currentCFrames[index] or targetCF):Lerp(targetCF, 0.55)

    task.spawn(function()
        local cfR = prop:FindFirstChild("SetCurrentCFrame")
        if cfR then cfR:InvokeServer(currentCFrames[index]) end

        if tick() - colorTimer > 0.25 then
            local cr = prop:FindFirstChild("ChangePropColor")
            if cr then cr:InvokeServer(getAbyssColor(tick(), index)) end
            if index == #wingRemoteCache then colorTimer = tick() end
        end
    end)
end

local CachedBall = nil

local function FindBallPart()
    local wc = workspace:FindFirstChild("WorkspaceCom")
    local sb = wc and wc:FindFirstChild("001_SoccerBalls")
    return sb and sb:FindFirstChild("Soccer" .. LP.Name) or nil
end

-- หาบอลแบบไม่ block: รันใน background ไม่ทำให้กดแล้วค้าง
local function GetBallAsync()
    task.spawn(function()
        if CachedBall and CachedBall.Parent then return end

        local tool = LP.Backpack:FindFirstChild("SoccerBall") or (LP.Character and LP.Character:FindFirstChild("SoccerBall"))
        if tool and tool:IsA("Tool") and tool.Parent == LP.Backpack and LP.Character then
            local hum = LP.Character:FindFirstChildOfClass("Humanoid")
            if hum then pcall(function() hum:EquipTool(tool) end) end
        elseif not tool then
            local re = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
            local remote = re and re:FindFirstChild("1Too1l")
            if remote then
                pcall(function() remote:InvokeServer("PickingTools", "SoccerBall") end)
            end
        end

        for _ = 1, 24 do
            task.wait(0.25)
            local part = FindBallPart()
            if part then CachedBall = part break end
        end

        local part = CachedBall
        if not part then return end
        part.CanCollide = false
        part.Massless = false
        pcall(function() part:SetNetworkOwner(LP) end)
    end)
end

-- ใช้ในสกิล: คืนบอลจาก cache ทันที ถ้าไม่มีค่อยสั่งหาใน background
local function GetBallFast()
    local b = CachedBall
    if not (b and b.Parent) then
        CachedBall = nil
        GetBallAsync()
    end
    return b
end

local FLING_SPEED = 1800     -- เร็วพอให้ปลิว แต่ไม่เร็วจนบอล "ข้ามเฟรม" ผ่านตัวเป้า
local FLING_DURATION = 0.7   -- ให้บอลกระแทกเป้าหมายต่อเนื่องหลายเฟรม

local function flingTarget(ball, targetPos, originPos)
    if not (ball and ball.Parent) then return end

    ball.Anchored = false
    ball.CanCollide = true       -- ต้องชนได้ ถึงจะกระแทกคนอื่นได้
    ball.Massless = false        -- มวล 0 กระแทกใครไม่สะเทือน

    pcall(function() ball:SetNetworkOwner(LP) end)

    for _, v in ipairs(ball:GetDescendants()) do
        if v:IsA("Weld") or v:IsA("WeldConstraint") or v:IsA("Motor6D") then
            pcall(function() v:Destroy() end)
        end
    end

    local diff = targetPos - originPos
    local direction = diff.Magnitude > 0.5 and diff.Unit or Vector3.new(0, 1, 0)

    -- วางบอล "หลัง" เป้าหมายเล็กน้อย ให้พุ่งกวาดผ่านตัวเป้า
    ball.CFrame = CFrame.new(targetPos - direction * 4 + Vector3.new(0, 1, 0))

    local velocity = direction * FLING_SPEED + Vector3.new(0, 500, 0)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = velocity
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.P = 9e9
    bodyVelocity.Parent = ball

    ball.AssemblyLinearVelocity = velocity

    task.delay(FLING_DURATION, function()
        if bodyVelocity and bodyVelocity.Parent then
            bodyVelocity:Destroy()
        end
        ball.CanCollide = false
    end)
end

local FLING_AURA = {
    On = false,
    Ball = nil,
    Pull = 300,        -- แรงดูดให้บอลติดตัว (เพิ่มถ้าบอลหลุด)
    Shake = 25000,     -- ความแรงสั่น (เพิ่มถ้าเหยื่อไม่ปลิว)
    Distance = -3,     -- ระยะบอลห่างตัว (studs ข้างหน้า)
}

local function StartFlingAura()
    FLING_AURA.On = true
    GetBallAsync()
    task.spawn(function()
        local b = GetBallFast()
        local tries = 0
        while FLING_AURA.On and not b and tries < 30 do
            task.wait(0.3)
            b = GetBallFast()
            tries = tries + 1
        end
        if not b then FLING_AURA.On = false return end
        FLING_AURA.Ball = b
        b.Anchored = false
        -- ถอด weld ที่ยึดบอลติดมือออก
        for _, v in ipairs(b:GetDescendants()) do
            if v:IsA("Weld") or v:IsA("WeldConstraint") or v:IsA("Motor6D") then
                pcall(function() v:Destroy() end)
            end
        end
    end)
end

local SoulCombo = {
    [1] = {Rot = CFrame.Angles(0, 0, math.rad(-45)), Speed = 1.1},
    [2] = {Rot = CFrame.Angles(0, 0, math.rad(45)),  Speed = 1.1},
    [3] = {Rot = CFrame.Angles(0, math.rad(90), 0),  Speed = 1.4}
}

local function ExecuteSoulSlash()
    if soulSlashActive or #wingRemoteCache < 1 then return end
    soulSlashActive = true
    local Ball = GetBallFast()
    local root = LP.Character.HumanoidRootPart
    local config = SoulCombo[comboStep]

    task.spawn(function()
        local spin, startTime, duration = 0, tick(), 0.38
        while tick() - startTime < duration do
            spin = spin + config.Speed
            local motionCF = root.CFrame * CFrame.new(0, 0, -7) * config.Rot * CFrame.Angles(spin, 0, 0)
            for i, partOff in ipairs(ScytheParts) do moveProp(i, motionCF * partOff) end
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pRoot = p.Character.HumanoidRootPart
                    if (pRoot.Position - (root.CFrame * CFrame.new(0,0,-5)).Position).Magnitude < 16 then
                        if Ball then flingTarget(Ball, pRoot.Position, root.CFrame.Position) end
                    end
                end
            end
            RS.Heartbeat:Wait()
        end
        comboStep = (comboStep % 3) + 1
        soulSlashActive = false
    end)
end

local function ExecuteHollowSlash(targetPlr)
    if isAttacking then return end
    isAttacking = true
    local Ball = GetBallFast()
    task.spawn(function()
        local spin = 0
        while isAttacking and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") do
            local root = targetPlr.Character.HumanoidRootPart
            local predPos = root.Position + (root.Velocity * 0.18)
            
            if Ball then 
                flingTarget(Ball, predPos, LP.Character.HumanoidRootPart.Position)
            end

            spin = spin + 0.75
            local scytheCF = CFrame.new(predPos + Vector3.new(0, 1.5, 0)) * root.CFrame.Rotation * CFrame.Angles(spin, 0, 0)
            for i, offset in ipairs(ScytheParts) do moveProp(i, scytheCF * offset) end
            RS.Heartbeat:Wait()
        end
        isAttacking = false
    end)
end

local function ExecutePhantomRush()
    if skill2Active then return end
    skill2Active = true
    local Ball = GetBallFast()
    local root = LP.Character.HumanoidRootPart
    local hum = LP.Character:FindFirstChildOfClass("Humanoid")
    local oldSpeed = hum.WalkSpeed
    hum.WalkSpeed = 80
    task.spawn(function()
        local start = tick()
        while tick() - start < 0.5 and skill2Active do
            local baseCF = root.CFrame * CFrame.new(4, 2.3, -17.9) * CFrame.Angles(0, math.rad(-90), 0)
            for i, offset in ipairs(BilahParts) do moveProp(i, baseCF * offset) end
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if (p.Character.HumanoidRootPart.Position - root.Position).Magnitude < 20 then
                        if Ball then flingTarget(Ball, p.Character.HumanoidRootPart.Position, root.Position) end
                    end
                end
            end
            RS.Heartbeat:Wait()
        end
        hum.WalkSpeed = oldSpeed
        skill2Active = false
    end)
end

local function ExecuteDeathSpin()
    if deathSpinActive or #wingRemoteCache < 1 then return end
    deathSpinActive = true
    local Ball = GetBallFast()
    local root = LP.Character.HumanoidRootPart
    local hum = LP.Character:FindFirstChildOfClass("Humanoid")
    local oldSpeed = hum.WalkSpeed
    hum.WalkSpeed = 50
    task.spawn(function()
        local start, spin = tick(), 0
        while tick() - start < 8 and deathSpinActive do
            spin = spin + 0.9
            local side = (math.sin(tick() * 5) > 0) and -85 or 85
            local motionCF = root.CFrame * CFrame.new(0, 0, -8) * CFrame.Angles(0, 0, math.rad(side)) * CFrame.Angles(spin, 0, 0)
            for i, partOff in ipairs(ScytheParts) do moveProp(i, motionCF * partOff) end
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local pRoot = p.Character.HumanoidRootPart
                    if (pRoot.Position - (root.CFrame * CFrame.new(0,0,-6)).Position).Magnitude < 22 then
                        if Ball then flingTarget(Ball, pRoot.Position, root.CFrame.Position) end
                    end
                end
            end
            RS.Heartbeat:Wait()
        end
        hum.WalkSpeed = oldSpeed
        deathSpinActive = false
    end)
end

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "AvariceScythe_RB"
Gui.ResetOnSpawn = false

local Main = Instance.new("Frame", Gui)
Main.Size, Main.Position = UDim2.new(0, 160, 0, 315), UDim2.new(0.5, -80, 0.4, 0)
Main.BackgroundColor3, Main.BorderSizePixel = Color3.fromRGB(10, 5, 15), 0
Main.Active, Main.Draggable, Main.ClipsDescendants = true, true, true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(180, 40, 40)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.1

local MainGrad = Instance.new("UIGradient", Main)
MainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, COLORS.DeepRed),
    ColorSequenceKeypoint.new(0.3, COLORS.Red),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 20, 120)),
    ColorSequenceKeypoint.new(0.7, COLORS.Blue),
    ColorSequenceKeypoint.new(1, COLORS.DeepBlue)
})
MainGrad.Rotation = 45

task.spawn(function()
    while Gui.Parent do
        TS:Create(MainGrad, TweenInfo.new(3, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)}):Play()
        task.wait(3)
        MainGrad.Offset = Vector2.new(-1, 0)
    end
end)

local Header = Instance.new("Frame", Main)
Header.Size, Header.BackgroundTransparency = UDim2.new(1, 0, 0, 35), 1

local Title = Instance.new("TextLabel", Header)
Title.Size, Title.Position, Title.Text = UDim2.new(1, -30, 0, 18), UDim2.new(0, 10, 0, 5), "AVARICE SCYTHE"
Title.TextColor3, Title.Font, Title.TextSize, Title.BackgroundTransparency = Color3.fromRGB(255, 220, 220), Enum.Font.SourceSansBold, 13, 1

local TitleStroke = Instance.new("UIStroke", Title)
TitleStroke.Color = Color3.fromRGB(0, 0, 0)
TitleStroke.Thickness = 1.2

local Credits = Instance.new("TextLabel", Header)
Credits.Size, Credits.Position, Credits.Text = UDim2.new(1, -30, 0, 12), UDim2.new(0, 10, 0, 20), "BY SANDBOX_txt"
Credits.TextColor3, Credits.Font, Credits.TextSize, Credits.BackgroundTransparency = Color3.fromRGB(180, 200, 255), Enum.Font.Code, 9, 1

local MinBtn = Instance.new("TextButton", Header)
MinBtn.Size, MinBtn.Position = UDim2.new(0, 22, 0, 22), UDim2.new(1, -28, 0, 6)
MinBtn.BackgroundColor3, MinBtn.BackgroundTransparency, MinBtn.Text = Color3.fromRGB(30, 5, 5), 0.3, "▲"
MinBtn.TextColor3 = Color3.fromRGB(255, 180, 180)
MinBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)
local MinStroke = Instance.new("UIStroke", MinBtn)
MinStroke.Color = Color3.fromRGB(200, 60, 60)
MinStroke.Thickness = 1

local Content = Instance.new("Frame", Main)
Content.Size, Content.Position, Content.BackgroundTransparency = UDim2.new(1, 0, 1, -60), UDim2.new(0, 0, 0, 35), 1

local btnIndex = 0
local function createBtn(name, pos, func, isRed)
    btnIndex = btnIndex + 1

    local b = Instance.new("TextButton", Content)
    b.Size, b.Position = UDim2.new(0.9, 0, 0, 28), pos
    b.BackgroundColor3 = isRed and Color3.fromRGB(60, 5, 5) or Color3.fromRGB(5, 10, 60)
    b.BackgroundTransparency = 0.15
    b.Text, b.TextColor3, b.Font, b.TextSize = name, Color3.fromRGB(255, 240, 240), Enum.Font.SourceSansBold, 11
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

    local st = Instance.new("UIStroke", b)
    st.Color = isRed and Color3.fromRGB(220, 50, 50) or Color3.fromRGB(60, 130, 255)
    st.Thickness = 1.3

    local gr = Instance.new("UIGradient", b)
    if isRed then
        gr.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, COLORS.DeepRed),
            ColorSequenceKeypoint.new(0.5, COLORS.Red),
            ColorSequenceKeypoint.new(1, COLORS.DeepBlue)
        })
    else
        gr.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, COLORS.DeepBlue),
            ColorSequenceKeypoint.new(0.5, COLORS.Blue),
            ColorSequenceKeypoint.new(1, COLORS.DeepRed)
        })
    end
    gr.Rotation = 30

    b.MouseEnter:Connect(function()
        TS:Create(b, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
        st.Thickness = 2
    end)
    b.MouseLeave:Connect(function()
        TS:Create(b, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
        st.Thickness = 1.3
    end)

    b.MouseButton1Click:Connect(func)
    return b
end

createBtn("SUMMON SCYTHE", UDim2.new(0.05, 0, 0, 5), function()
    petMode = not petMode
    if petMode then
        local p = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_TrafficCones")
        wingRemoteCache = {}
        for _, v in ipairs(p:GetChildren()) do if v.Name:find("Prop" .. OwnerName) then table.insert(wingRemoteCache, v) end end
        GetBallAsync()
    else
        local toolNames = {"Soul Slash", "Hollow Slash", "Phantom Rush", "Death Spin"}
        for _, toolName in ipairs(toolNames) do
            local tool = LP.Backpack:FindFirstChild(toolName) or (LP.Character and LP.Character:FindFirstChild(toolName))
            if tool then tool:Destroy() end
        end
        wingRemoteCache = {}
        currentCFrames = {}
        CachedBall = nil
    end
end, true)

createBtn("SOUL SLASH (BASIC)", UDim2.new(0.05, 0, 0, 38), function()
    if LP.Backpack:FindFirstChild("Soul Slash") then return end
    local t = Instance.new("Tool", LP.Backpack)
    t.Name, t.RequiresHandle = "Soul Slash", false
    t.Activated:Connect(ExecuteSoulSlash)
end, false)

createBtn("HOLLOW SLASH (SK 1)", UDim2.new(0.05, 0, 0, 71), function()
    if LP.Backpack:FindFirstChild("Hollow Slash") then return end
    local t = Instance.new("Tool", LP.Backpack)
    t.Name, t.RequiresHandle = "Hollow Slash", false
    t.Activated:Connect(function()
        local mousePos = LP:GetMouse().Hit.Position
        local target = nil
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and (p.Character.HumanoidRootPart.Position - mousePos).Magnitude < 40 then target = p break end
        end
        if target then ExecuteHollowSlash(target) end
    end)
end, true)

createBtn("PHANTOM RUSH (SK 2)", UDim2.new(0.05, 0, 0, 104), ExecutePhantomRush, false)
createBtn("DEATH SPIN (SK 3)", UDim2.new(0.05, 0, 0, 137), ExecuteDeathSpin, true)


createBtn("FLING AURA (บอลติดตัว)", UDim2.new(0.05, 0, 0, 203), function()
    if FLING_AURA.On then
        FLING_AURA.On = false
        FLING_AURA.Ball = nil
    else
        StartFlingAura()
    end
end, true)

createBtn("Regeneration scythe", UDim2.new(0.05, 0, 0, 170), function()
    isAttacking, skill2Active, soulSlashActive, deathSpinActive = false, false, false, false
    FLING_AURA.On = false
    FLING_AURA.Ball = nil
    if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then LP.Character.Humanoid.WalkSpeed = 16 end
end, false)

local Footer = Instance.new("TextLabel", Main)
Footer.Size, Footer.Position, Footer.Text = UDim2.new(1, 0, 0, 16), UDim2.new(0, 0, 1, -16), "Sin Of Greed stage 1"
Footer.TextColor3, Footer.Font, Footer.TextSize, Footer.BackgroundTransparency, Footer.BackgroundColor3 = Color3.fromRGB(255, 200, 200), Enum.Font.SourceSansItalic, 9, 0.8, Color3.fromRGB(30, 5, 5)

local FooterStroke = Instance.new("UIStroke", Footer)
FooterStroke.Color = Color3.fromRGB(180, 40, 40)
FooterStroke.Thickness = 1

MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and UDim2.new(0, 160, 0, 35) or UDim2.new(0, 160, 0, 315)
    MinBtn.Text = isMinimized and "▼" or "▲"
    TS:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    Content.Visible, Footer.Visible = not isMinimized, not isMinimized
end)

RS.Heartbeat:Connect(function()
    local root = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    -- ===== FLING AURA: บอลติดตัว + สั่น ใครแตะโดนปลิว =====
    if FLING_AURA.On then
        local ball = FLING_AURA.Ball
        if not (ball and ball.Parent) then
            FLING_AURA.Ball = GetBallFast()
        else
            ball.Anchored = false
            ball.CanCollide = false -- เฉพาะ client เรา: เราไม่โดนบอลตัวเองปลิว คนอื่นยังโดนเต็ม ๆ
            local targetPos = root.CFrame * CFrame.new(0, 0, FLING_AURA.Distance).Position
            local jitter = (math.floor(tick() * 20) % 2 == 0) and 1 or -1
            local pull = (targetPos - ball.Position) * FLING_AURA.Pull
            ball.AssemblyLinearVelocity = pull + Vector3.new(jitter * FLING_AURA.Shake, jitter * FLING_AURA.Shake, jitter * FLING_AURA.Shake)
            ball.AssemblyAngularVelocity = Vector3.new(jitter * 99999, jitter * 99999, jitter * 99999)
        end
    end

    if not petMode or isAttacking or skill2Active or soulSlashActive or deathSpinActive or #wingRemoteCache < 1 then return end
    if tick() - lastUpdate < 0.025 then return end
    lastUpdate = tick()
    local idlePos = root.CFrame * CFrame.new(2.5, -0.5, -0.5) * CFrame.Angles(math.rad(85), math.rad(10), math.rad(33))
    for i, offset in ipairs(ScytheParts) do moveProp(i, idlePos * CFrame.new(0, math.sin(tick() * 2) * 0.25, 0) * offset) end
end)