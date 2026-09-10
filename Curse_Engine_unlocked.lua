-- WHITELIST REMOVED (Open Access)
-- (ตัวแปร Players/LP ถูกประกาศใหม่ด้านล่างในโค้ดหลักอยู่แล้ว)

local servicesToVerify = {"MLModelDeliveryService", "PartyEmulatorService", "OmniRecommendationsService", "PlatformFriendsService"}
for _, serviceName in ipairs(servicesToVerify) do
    local success = pcall(function()
        local service = game:GetService(serviceName)
        if typeof(service) ~= "Instance" or not service:IsA(serviceName) or service.ClassName ~= serviceName or service.Parent ~= game then 
            error("detected by Dyton", 0) 
        end
        local secondaryCheck = game:GetService(serviceName)
        if service ~= secondaryCheck then error("detected by Dyton", 0) end
    end)
    if not success then error("detected by Dyton", 0) end
end

local friendCheck = pcall(function()
    local pf = game:GetService("PlatformFriendsService")
    local fs = game:GetService("FriendService")
    if pf == fs then error("detected by Dyton", 0) end
end)
if not friendCheck then error("detected by Dyton", 0) end

local integrityState = true
local secureKey = "ULTRA_SECURITY_VALIDATION"

local function verifyEnvironment()
    local success, res = pcall(function()
        local t = {}
        table.freeze(t)
        t.newKey = 1
    end)
    if success then return false end

    local success2, res2 = pcall(function()
        return string.dump(function() end)
    end)
    if success2 then return false end

    local timeCheck = pcall(function()
        local t1 = os.time()
        local t2 = os.time()
        if t2 < t1 then integrityState = false end
    end)
    if not timeCheck then return false end

    local tableManipulation = pcall(function()
        local frozen = table.freeze({A = 1})
        local _, err = pcall(function() frozen.A = 2 end)
        if not err then integrityState = false end
    end)
    if not tableManipulation then return false end

    return true
end

local function performAdvancedStaticChecks()
    if not verifyEnvironment() then return false end
    local isDeepStackValid = true
    local _, stackErr = pcall(function()
        local function deepCheck(depth)
            if depth > 0 then deepCheck(depth - 1) else error("deep_marker") end
        end
        deepCheck(10)
    end)
    if not stackErr or not string.find(stackErr, "deep_marker") then isDeepStackValid = false end
    if not isDeepStackValid then return false end

    if type(delay) ~= "function" or type(tick) ~= "function" then return false end
    if math.floor(math.pi) ~= 3 or math.clamp(5, 1, 3) ~= 3 then return false end

    return true
end

local function runAdvancedRealTimeMonitor()
    while integrityState do
        if not verifyEnvironment() then integrityState = false end
        
        local closureCheck = pcall(function()
            local f = function() end
            if getfenv(f) ~= getfenv(0) then integrityState = false end
        end)
        if not closureCheck then integrityState = false end

        local stringAdvancedCheck = pcall(function()
            if string.reverse("ABC") ~= "CBA" or string.split("A,B", ",")[1] ~= "A" then integrityState = false end
        end)
        if not stringAdvancedCheck then integrityState = false end

        local tableFindCheck = pcall(function()
            local array = {"X", "Y"}
            if table.find(array, "X") ~= 1 or table.find(array, "Z") ~= nil then integrityState = false end
        end)
        if not tableFindCheck then integrityState = false end

        if not integrityState then
            while true do
                pcall(function() return coroutine.yield() end)
            end
        end
        task.wait(0.2)
    end
end

local isExecutionSafe, verificationResult = pcall(performAdvancedStaticChecks)
if not isExecutionSafe or verificationResult ~= true then
    integrityState = false
    while true do
        pcall(function() return coroutine.yield() end)
    end
else
    task.spawn(runAdvancedRealTimeMonitor)
end

-- [[ CURSE ENGINE V3: RED GLOW EDITION ]] --
-- Integrated by Dyton_txt

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local targetPlayer = nil
local activeTargeting = false
local deathPenalty = false
local canDismantle = true
local remoteCache = {}
local currentIdx = 1

-- [[ AUDIO SYSTEM ]] --
local function playSound(id, vol)
    local s = Instance.new("Sound", Workspace)
    s.SoundId = "rbxassetid://" .. id
    s.Volume = vol
    s.PlayOnRemove = true
    s:Play()
    s:Destroy()
end

-- [[ RECONNECT SYSTEM ]] --
local function updateRemotes()
    local temp = {}
    local wsCom = Workspace:FindFirstChild("WorkspaceCom")
    if wsCom then
        for _, cat in pairs(wsCom:GetChildren()) do
            for _, p in pairs(cat:GetChildren()) do
                if p:FindFirstChild("SetCurrentCFrame") then table.insert(temp, p.SetCurrentCFrame) end
            end
        end
    end
    remoteCache = temp
end

-- [[ UI CONSTRUCTION ]] --
local Gui = Instance.new("ScreenGui", gethui())
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 220, 0, 150)
Main.Position = UDim2.new(0.5, -110, 0.5, -75)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true

local RedGrad = Instance.new("UIGradient", Main)
RedGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 0))
})

-- Animasi Berkilau (Glow)
task.spawn(function()
    while true do
        local t = TweenService:Create(RedGrad, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
        t:Play()
        task.wait(2)
        RedGrad.Offset = Vector2.new(-1, 0)
    end
end)

local MinBtn = Instance.new("TextButton", Main)
MinBtn.Size = UDim2.new(0, 25, 0, 25)
MinBtn.Position = UDim2.new(0, 5, 0, 5)
MinBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", MinBtn)

local PlusBtn = Instance.new("TextButton", Main)
PlusBtn.Size = UDim2.new(0, 25, 0, 25)
PlusBtn.Position = UDim2.new(1, -30, 0, 5)
PlusBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
Instance.new("UICorner", PlusBtn)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "CursedContr0ol by DYTON_txt"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 14

local Box = Instance.new("TextBox", Main)
Box.Size = UDim2.new(0.9, 0, 0, 25)
Box.Position = UDim2.new(0.05, 0, 0.28, 0)
Box.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Box.PlaceholderText = "Target Username"
Box.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Box)

local TargetBtn = Instance.new("TextButton", Main)
TargetBtn.Size = UDim2.new(0.9, 0, 0, 30)
TargetBtn.Position = UDim2.new(0.05, 0, 0.49, 0)
TargetBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TargetBtn.Text = "ACTIVATE"
TargetBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TargetBtn)

local DismantleBtn = Instance.new("TextButton", Main)
DismantleBtn.Size = UDim2.new(0.9, 0, 0, 30)
DismantleBtn.Position = UDim2.new(0.05, 0, 0.74, 0)
DismantleBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
DismantleBtn.Text = "GET DISMANTLE"
DismantleBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", DismantleBtn)

-- [[ MINIMIZE LOGIC ]] --
local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local targetSize = minimized and UDim2.new(0, 220, 0, 35) or UDim2.new(0, 220, 0, 150)
    TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    MinBtn.Text = minimized and "+" or "-"
end)

-- [[ ENGINE CORE ]] --
local function quantumSync()
    if not activeTargeting or not targetPlayer or not targetPlayer.Character or #remoteCache == 0 then return end
    local char = targetPlayer.Character
    local tRoot = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not tRoot or not hum then return end

    local predictedPos = tRoot.CFrame + (tRoot.AssemblyLinearVelocity * 0.17)
    if hum.Sit then predictedPos = CFrame.new(predictedPos.X, -50000, predictedPos.Z) end
    
    local remote = remoteCache[currentIdx]
    if remote then
        local mIdx = ((currentIdx - 1) % 10) + 1
        local fPos
        
        if deathPenalty then
            local speed = tick() * 45
            fPos = predictedPos * CFrame.Angles(math.sin(speed)*5, math.cos(speed)*5, math.random())
        else
            local offsets = {
                CFrame.new(0, -3, -15), CFrame.new(0, -3, 14),
                CFrame.new(7.5, -3, -10) * CFrame.Angles(0, 1.57, 0),
                CFrame.new(-7.5, -3, -10) * CFrame.Angles(0, 1.57, 0),
                CFrame.new(0, 10, -2) * CFrame.Angles(1.57, 0, 0)
            }
            fPos = predictedPos * (offsets[mIdx] or offsets[1])
        end
        task.spawn(function() pcall(function() remote:InvokeServer(fPos) end) end)
    end
    currentIdx = (currentIdx % #remoteCache) + 1
end

-- [[ DISMANTLE 3X STRIKE ]] --
local function runDismantle()
    if not canDismantle or #remoteCache < 1 then return end
    canDismantle = false
    
    for strike = 1, 3 do
        playSound("106046742220128", 0.48) -- Suara dismantle (Volume 0.4)
        local root = LP.Character.HumanoidRootPart
        for d = 5, 80, 4 do
            local basePos = root.CFrame.Position + (root.CFrame.LookVector * d)
            for i = 1, #remoteCache do
                local remote = remoteCache[i]
                task.spawn(function()
                    pcall(function()
                        local angle = math.rad(math.random(-45, 45))
                        local slashCF = CFrame.new(basePos) * root.CFrame.Rotation * CFrame.new(math.random(-10, 10), math.random(-2, 2), 0) * CFrame.Angles(0, 0, angle)
                        remote:InvokeServer(slashCF)
                        task.wait(0.1)
                        remote:InvokeServer(CFrame.new(0, -1e6, 0))
                    end)
                end)
            end
        end
        task.wait(0.2) -- Jeda antar gelombang tebasan
    end
    canDismantle = true
end

-- [[ BUTTON EVENTS ]] --
PlusBtn.MouseButton1Click:Connect(function()
    deathPenalty = not deathPenalty
    if deathPenalty then playSound("103590461924679", 0.70) end -- Suara Penalty (Volume 0.35)
    PlusBtn.TextColor3 = deathPenalty and Color3.new(1, 1, 1) or Color3.fromRGB(255, 50, 50)
end)

TargetBtn.MouseButton1Click:Connect(function()
    activeTargeting = not activeTargeting
    TargetBtn.Text = activeTargeting and "STOP" or "ACTIVATE"
    if activeTargeting then updateRemotes() end
end)

DismantleBtn.MouseButton1Click:Connect(function()
    local tool = Instance.new("Tool", LP.Backpack)
    tool.Name = "Sukuna: Dismantle"
    tool.RequiresHandle = false
    tool.Activated:Connect(runDismantle)
end)

Box.FocusLost:Connect(function(enter)
    if enter then
        for _, p in pairs(Players:GetPlayers()) do
            if p.Name:lower():find(Box.Text:lower()) or p.DisplayName:lower():find(Box.Text:lower()) then
                targetPlayer = p
                Box.Text = p.DisplayName
                break
            end
        end
    end
end)

RunService.Heartbeat:Connect(quantumSync)
task.spawn(function() while true do if activeTargeting then updateRemotes() end task.wait(5) end end)