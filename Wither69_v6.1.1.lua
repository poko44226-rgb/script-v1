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


local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")

local OwnerName = LP.Name
local petMode = false
local rampageMode = false
local sitFlingMode = false
local wingRemoteCache = {}
local PERMANENT_PROP_LOCK = {}
local currentCFrames = {}
local lastNetworkUpdate = 0
local lastColorUpdate = 0
local lastScanTime = 0
local colorIndex = 1


local isSummoning = false
local summonStartTime = 0
local summonOriginPos = Vector3.zero
local rampageBlacklist = {}
local targetAttackTrack = { player = nil, startTime = 0, initialPos = Vector3.zero }
local hasFetchedBall = false


local estimatedPing = 0.03
local witherCurrentPos = Vector3.zero
local lastAttackTime = 0
local activeProjectiles = {}
local lastLookAtPos = Vector3.zero
local soakAnchor = nil
local permaSoakList = {}

local WITHER_SPEED = 8
local PROJECTILE_SPEED = 15
local ATTACK_COOLDOWN = 2.8
local HOVER_HEIGHT = 24
local RANDOM_DRIFT_SCALE = 50
local RAMPAGE_RADIUS = 400

local SUMMON_DURATION = 11.5
local IMPACT_LINGER_TIME = 0.5
local MAX_STUCK_TIME = 6.0

local PET_OFFSET = Vector3.new(-5, 6, 1)

local MANUAL_ROTATION = Vector3.new(-20, 360, 0)
local TargetPlayer = nil

local VOID_DEPTH = -2000
local DRAG_VELOCITY = Vector3.new(0, -1.5e11, 0)
local UNSEAT_FORCE = Vector3.new(0, 5000, 0)
local SIT_FLING_HOLD_TIME = 0.6
local SIT_FLING_SOAK_TIME = 4.0
local SOAK_RELEASE_Y = -500
local SOAK_GRACE_TIME = 2.5
local SIT_SNATCH_RADIUS = 15
local SIT_SNATCH_ONLY_RAMPAGE = true -- true = เป้าที่พิมพ์เลือกเองถูกล็อก สับเป้าคนนั่งเฉพาะโหมด Rampage
local MANUAL_HOVER_HEIGHT = 16 -- v6.1.1: ความสูงที่วิเทอร์ 'วนรอบ' เป้า (บล็อก) ห้ามต่ำกว่า ~12 ไม่งั้น lookAt ตรงดิ่ง ตัววิเทอร์จะหมุนควงสว่าน


local NPC_APPROACH_RANGE = 5
local NPC_HOMING_SPEED_MULT = 20
local NPC_LOCK_ON_DELAY = 0.12
local NPC_PREDICTION_LEAD = 0.2


local FALLEN_THRESHOLD = -2000
local sitFlingPaused = false


local COLORS = {
    AbyssRed = Color3.fromRGB(100, 0, 180),
    DarkAbyss = Color3.fromRGB(30, 0, 60),
    Void = Color3.fromRGB(10, 0, 20),
    Accent = Color3.fromRGB(255, 255, 255),
    SuccessGreen = Color3.fromRGB(0, 255, 120),
    WarningRed = Color3.fromRGB(15, 30, 60),
    SitFlingPurple = Color3.fromRGB(255, 0, 255),

    PureWhiteOnly = Color3.fromRGB(255, 255, 255),
    SoulArmorWhite = Color3.fromRGB(0, 0, 0),
    SoulAuraBlue = Color3.fromRGB(180, 220, 255)
}

local function getAbyssColor(t, offset)
    if isSummoning then
        return COLORS.PureWhiteOnly
    elseif rampageMode then
        local cycle = (t * 1.5 + (offset * 0.15)) % 1
        return cycle < 0.5 and COLORS.SoulArmorWhite:Lerp(COLORS.SoulAuraBlue, cycle * 2) or COLORS.SoulAuraBlue:Lerp(COLORS.SoulArmorWhite, (cycle - 0.5) * 2)
    else
        local cycle = (t * 0.3 + (offset * 0.1)) % 1
        return cycle < 0.5 and COLORS.AbyssRed:Lerp(COLORS.DarkAbyss, cycle * 2) or COLORS.DarkAbyss:Lerp(COLORS.Void, (cycle - 0.5) * 2)
    end
end

local function getOff(base, target) return base:ToObjectSpace(target) end

local baseRef = CFrame.new(199.91932678222656, 12.894913673400879, -64.45938873291016, -0.9999717473983765, 0.0023622966837137938, -0.007140748668462038, 0.00002453153138048947, 0.9504163265228271, 0.31098055839538574, 0.0075213126838207245, 0.31097161769866943, -0.9503894448280334)

local WitherParts = {
    getOff(baseRef, CFrame.new(199.91932678222656, 12.894913673400879, -64.45938873291016, -0.9999717473983765, 0.0023622966837137938, -0.007140748668462038, 0.00002453153138048947, 0.9504163265228271, 0.31098055839538574, 0.0075213126838207245, 0.31097161769866943, -0.9503894448280334)),
    getOff(baseRef, CFrame.new(203.3807373046875, 12.144608497619629, -64.58366394042969, -0.9881877899169922, 0.0020154754165560007, 0.15324385464191437, 0.04300922527909279, 0.9633787870407104, 0.2646729052066803, -0.14709845185279846, 0.26813700795173645, -0.9520856738090515)),
    getOff(baseRef, CFrame.new(196.47140502929688, 12.144608497619629, -64.46726989746094, -0.9922080039978027, 0.0019081804202869534, -0.12461142241954803, -0.030268877744674683, 0.9662537574768066, 0.255808562040329, 0.12089492380619049, 0.25758394598960876, -0.9586628675460815)),
    getOff(baseRef, CFrame.new(200.55374145507812, 9.997815132141113, -65.8962631225586, 0.011634256690740585, -0.9998592734336853, 0.01209464855492115, -0.9996784925460815, -0.011900508776307106, -0.022389855235815048, 0.02253078483045101, -0.011830298230051994, -0.9996806383132935)),
    getOff(baseRef, CFrame.new(201.73304748535156, 11.699615478515625, -65.55762481689453, -0.9997870922088623, -0.020352469757199287, 0.0034083069767802954, -0.020009975880384445, 0.9965177774429321, 0.08094435930252075, -0.005043855868279934, 0.08085893094539642, -0.9967127442359924)),
    getOff(baseRef, CFrame.new(197.95692443847656, 11.64893627166748, -65.57623291015625, -0.9997870922088623, -0.020352384075522423, 0.003408305812627077, -0.020009886473417282, 0.9965177774429321, 0.08094478398561478, -0.005043855868279934, 0.08085934817790985, -0.9967127442359924)),
    getOff(baseRef, CFrame.new(199.9916534423828, 9.876144409179688, -65.82450103759766, -0.9997870922088623, -0.020351946353912354, 0.0034083069767802954, -0.020009439438581467, 0.9965176582336426, 0.08094686269760132, -0.005043855868279934, 0.08086142688989639, -0.9967127442359924)),
    getOff(baseRef, CFrame.new(200.1062469482422, 8.116905212402344, -65.7476577758789, -0.9997904300689697, -0.020351704210042953, 0.0034083081409335136, -0.020009208470582962, 0.9965173006057739, 0.08094825595617294, -0.005043872632086277, 0.08086279034614563, -0.9967158436775208)),
    getOff(baseRef, CFrame.new(200.07086181640625, 6.217313766479492, -65.79713439941406, -0.9997870922088623, -0.020351329818367958, 0.0034082906786352396, -0.020008813589811325, 0.9965173006057739, 0.08094976842403412, -0.005043855868279934, 0.0808643251657486, -0.9967123866081238)),
    getOff(baseRef, CFrame.new(200.62400817871094, 6.589557647705078, -66.70326232910156, 0.014601275324821472, -0.999857485294342, 0.008065760135650635, -0.9589880108833313, -0.01172405481338501, 0.2832024097442627, -0.2830718159675598, -0.011869758367538452, -0.9590224027633667))
}

local function GetBallSilent()
    local b = LP.Backpack:FindFirstChild("SoccerBall") or (LP.Character and LP.Character:FindFirstChild("SoccerBall"))

    if not b and not hasFetchedBall then
        hasFetchedBall = true
        pcall(function()
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end)
    end

    local ballsFolder = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_SoccerBalls")
    if ballsFolder then
        local ball = ballsFolder:FindFirstChild("Soccer" .. LP.Name)
        if ball then
            ball.CanCollide = false
            return ball
        end
    end
    return nil
end

local function FindNearestPrey()
    local nearestPlayer = nil
    local shortestDistance = RAMPAGE_RADIUS
    local myPos = witherCurrentPos

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and Players:FindFirstChild(p.Name) and not rampageBlacklist[p.Name] then
            local char = p.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
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

local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "Abyss_Wither_Control"
local main = Instance.new("Frame", sg)
main.Size, main.Position = UDim2.new(0, 200, 0, 220), UDim2.new(0.05, 0, 0.4, 0)
main.BackgroundColor3, main.BorderSizePixel = Color3.fromRGB(10, 10, 10), 0
main.ClipsDescendants = true

local titleBar = Instance.new("Frame", main)
titleBar.Size, titleBar.BackgroundColor3 = UDim2.new(1, 0, 0, 25), Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size, titleLabel.Position = UDim2.new(1, -10, 1, 0), UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency, titleLabel.Text = 1, "Wither Of Soulking V6.1.1"
titleLabel.TextColor3, titleLabel.Font, titleLabel.TextSize = Color3.new(1, 1, 1), Enum.Font.SourceSansBold, 12
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local ballStatusLabel = Instance.new("TextLabel", main)
ballStatusLabel.Size = UDim2.new(1, -10, 0, 15)
ballStatusLabel.Position = UDim2.new(0, 5, 1, -45)
ballStatusLabel.BackgroundTransparency = 1
ballStatusLabel.Text = "BALL: FETCHING..."
ballStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ballStatusLabel.Font = Enum.Font.Code
ballStatusLabel.TextSize = 10
ballStatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local sitStatusLabel = Instance.new("TextLabel", main)
sitStatusLabel.Size = UDim2.new(1, -10, 0, 15)
sitStatusLabel.Position = UDim2.new(0, 5, 1, -30)
sitStatusLabel.BackgroundTransparency = 1
sitStatusLabel.Text = "SIT FLING: OFF"
sitStatusLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
sitStatusLabel.Font = Enum.Font.Code
sitStatusLabel.TextSize = 10
sitStatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local creditLabel = Instance.new("TextLabel", main)
creditLabel.Size, creditLabel.Position = UDim2.new(1, 0, 0, 15), UDim2.new(0, 0, 1, -15)
creditLabel.BackgroundTransparency, creditLabel.Text = 1, "By DYTON.txt"
creditLabel.TextColor3, creditLabel.Font, creditLabel.TextSize = COLORS.Accent, Enum.Font.Code, 10

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
UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end end)

local function styleBtn(b)
    b.BackgroundColor3, b.BorderSizePixel, b.BorderColor3 = COLORS.Void, 1, Color3.fromRGB(40, 40, 40)
    b.TextColor3, b.Font, b.TextSize = Color3.new(0.8, 0.8, 0.8), Enum.Font.SourceSansBold, 11
    b.MouseEnter:Connect(function() b.BorderColor3 = (rampageMode and COLORS.SoulAuraBlue or COLORS.Accent) b.TextColor3 = Color3.new(1,1,1) end)
    b.MouseLeave:Connect(function() b.BorderColor3 = Color3.fromRGB(40, 40, 40) b.TextColor3 = Color3.new(0.8,0.8,0.8) end)
end

local container = Instance.new("Frame", main)
container.Size, container.Position, container.BackgroundTransparency = UDim2.new(1, -10, 1, -80), UDim2.new(0, 5, 0, 30), 1

local function createBtn(txt, pos, size)
    local b = Instance.new("TextButton", container)
    b.Text, b.Position, b.Size = txt, pos, size styleBtn(b)
    return b
end

local SummonBtn = createBtn("ACTIVATE WITHER", UDim2.new(0,0,0,0), UDim2.new(1,0,0.22,0))

local TargetBox = Instance.new("TextBox", container)
TargetBox.Size = UDim2.new(1, 0, 0.20, 0)
TargetBox.Position = UDim2.new(0, 0, 0.26, 0)
TargetBox.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
TargetBox.BorderSizePixel = 1
TargetBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
TargetBox.TextColor3 = Color3.fromRGB(180, 180, 180)
TargetBox.PlaceholderText = "Type Target & Press Enter"
TargetBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
TargetBox.Font = Enum.Font.Code
TargetBox.TextSize = 10
TargetBox.ClearTextOnFocus = false

local SitFlingBtn = createBtn("SIT FLING: OFF", UDim2.new(0, 0, 0.50, 0), UDim2.new(1, 0, 0.20, 0))

local RampageBtn = createBtn("TARGET ALL: OFF", UDim2.new(0, 0, 0.74, 0), UDim2.new(1, 0, 0.22, 0))

TargetBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if rampageMode then return end
        local searchKey = TargetBox.Text:lower()
        if searchKey == "" then
            TargetPlayer = nil
            TargetBox.Text = ""
            TargetBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
            return
        end

        local found = false
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():find(searchKey) or p.DisplayName:lower():find(searchKey) then
                TargetPlayer = p
                sitFlingPaused = false
                TargetBox.Text = p.DisplayName
                TargetBox.BorderColor3 = COLORS.SuccessGreen
                found = true
                break
            end
        end

        if not found then
            TargetPlayer = nil
            sitFlingPaused = false
            TargetBox.Text = "[NOT FOUND]"
            TargetBox.BorderColor3 = COLORS.WarningRed
            task.wait(1)
            TargetBox.Text = ""
            TargetBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
end)

SummonBtn.MouseButton1Click:Connect(function()
    petMode = not petMode
    if petMode then
        
        TargetPlayer = nil
        rampageMode = false
        sitFlingMode = false
        sitFlingPaused = false
        isSummoning = false
        hasFetchedBall = false
        soakAnchor = nil
        table.clear(currentCFrames)
        table.clear(activeProjectiles)
        table.clear(rampageBlacklist)
        table.clear(permaSoakList)
        

        SummonBtn.TextColor3 = COLORS.Accent
        SummonBtn.Text = "DEACTIVATE WITHER"
        hasFetchedBall = false

        local char = LP.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            summonOriginPos = char.HumanoidRootPart.Position
            witherCurrentPos = summonOriginPos
            lastLookAtPos = summonOriginPos + Vector3.new(0, 0, -1)
            isSummoning = true
            summonStartTime = tick()
        end

        local p = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_TrafficCones")
        local targetName = (OwnerName == "terasiremik") and "Propterasiremik" or ("Prop" .. OwnerName)

        local rawProps = {}
        for _, v in ipairs(p:GetChildren()) do
            if v.Name == targetName then table.insert(rawProps, v) end
        end

        for id, storedProp in pairs(PERMANENT_PROP_LOCK) do
            if not storedProp or not storedProp.Parent then PERMANENT_PROP_LOCK[id] = nil end
        end

        for _, prop in ipairs(rawProps) do
            local alreadyRegistered = false
            for id, storedProp in pairs(PERMANENT_PROP_LOCK) do
                if storedProp == prop then alreadyRegistered = true break end
            end
            if not alreadyRegistered then
                for id = 1, 15 do
                    if not PERMANENT_PROP_LOCK[id] then
                        PERMANENT_PROP_LOCK[id] = prop
                        break
                    end
                end
            end
        end

        wingRemoteCache = {}
        for id = 1, 15 do
            if PERMANENT_PROP_LOCK[id] and PERMANENT_PROP_LOCK[id].Parent then
                table.insert(wingRemoteCache, PERMANENT_PROP_LOCK[id])
            end
        end
    else
        
        TargetPlayer = nil
        rampageMode = false
        sitFlingMode = false
        sitFlingPaused = false
        isSummoning = false
        hasFetchedBall = false
        soakAnchor = nil
        

        SummonBtn.TextColor3 = Color3.new(0.8,0.8,0.8)
        SummonBtn.Text = "ACTIVATE WITHER"
        RampageBtn.Text = "TARGET ALL: OFF"
        RampageBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        SitFlingBtn.Text = "SIT FLING: OFF"
        SitFlingBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        TargetBox.Text = ""
        TargetBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
        table.clear(currentCFrames)
        table.clear(activeProjectiles)
        table.clear(rampageBlacklist)
        table.clear(permaSoakList)
    end
end)

SitFlingBtn.MouseButton1Click:Connect(function()
    if not petMode then return end
    sitFlingMode = not sitFlingMode
    if sitFlingMode then
        SitFlingBtn.Text = "SIT FLING: ACTIVE"
        SitFlingBtn.TextColor3 = COLORS.SitFlingPurple
        sitStatusLabel.Text = "SIT FLING: ON | SOAK FOREVER"
        sitStatusLabel.TextColor3 = COLORS.SitFlingPurple
    else
        SitFlingBtn.Text = "SIT FLING: OFF"
        SitFlingBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        sitStatusLabel.Text = "SIT FLING: OFF"
        sitStatusLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
        sitFlingPaused = false
        table.clear(permaSoakList)
        soakAnchor = nil
    end
end)

RampageBtn.MouseButton1Click:Connect(function()
    if not petMode or isSummoning then return end
    rampageMode = not rampageMode
    if rampageMode then
        table.clear(rampageBlacklist)
        RampageBtn.Text = "SOUL RAMPAGE: ACTIVE "
        RampageBtn.TextColor3 = COLORS.SoulAuraBlue
        TargetBox.Text = "[SOUL HUNTER]"
        TargetBox.BorderColor3 = COLORS.SoulAuraBlue
    else
        rampageMode = false
        sitFlingPaused = false
        RampageBtn.Text = "TARGET ALL: OFF"
        RampageBtn.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        TargetPlayer = nil
        TargetBox.Text = ""
        TargetBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
    end
end)

local function getTargetTorso(player)
    if not player or not player.Parent or not Players:FindFirstChild(player.Name) or not player.Character then return nil end
    local char = player.Character
    return char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
end

local function isPlayerBound(player)
    if not player then return false end
    for _, pd in pairs(activeProjectiles) do
        if pd.Victim == player then return true end
    end
    return false
end

local function getBallAuraOwner()
    local best = nil
    for auraId, pd in pairs(activeProjectiles) do
        if pd.IsStuck and pd.Victim and getTargetTorso(pd.Victim) then
            if not best or auraId < best then best = auraId end
        end
    end
    return best
end

local function FindPreyList(maxCount)
    local candidates = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and Players:FindFirstChild(p.Name) and not rampageBlacklist[p.Name] and not isPlayerBound(p) then
            local char = p.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso") or char:FindFirstChild("HumanoidRootPart")
                if torso then
                    table.insert(candidates, {player = p, dist = (witherCurrentPos - torso.Position).Magnitude})
                end
            end
        end
    end
    table.sort(candidates, function(a, b)
        local aSoak = permaSoakList[a.player.Name] and 0 or 1
        local bSoak = permaSoakList[b.player.Name] and 0 or 1
        if aSoak ~= bSoak then return aSoak < bSoak end
        return a.dist < b.dist
    end)
    local result = {}
    for i = 1, math.min(maxCount or 1, #candidates) do
        result[i] = candidates[i].player
    end
    return result
end


local function FindSitterNear(pos)
    local best, bestDist = nil, SIT_SNATCH_RADIUS
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and Players:FindFirstChild(p.Name) then
            local char = p.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum and hum.Sit and hum.Health > 0 then
                local torso = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
                if torso then
                    local d = (torso.Position - pos).Magnitude
                    if d < bestDist then
                        best, bestDist = p, d
                    end
                end
            end
        end
    end
    return best
end


RS.Heartbeat:Connect(function(dt)
    local totalProps = #wingRemoteCache
    if not petMode or totalProps < 1 then return end

    local t = tick()
    local activeBall = GetBallSilent()
    local flingActiveThisFrame = false

    for _, proj in pairs(activeProjectiles) do
        if proj.IsStuck then flingActiveThisFrame = true break end
    end

    if isSummoning then
        ballStatusLabel.Text = "WITHER: AWAKENING (WHITE)..."
        ballStatusLabel.TextColor3 = COLORS.PureWhiteOnly
    elseif not activeBall then
        ballStatusLabel.Text = "BALL: DISPAWNED / MISSING "
        ballStatusLabel.TextColor3 = COLORS.WarningRed
    elseif flingActiveThisFrame then
        if sitFlingMode then
            ballStatusLabel.Text = "BALL: ETERNAL VOID SOAK "
            ballStatusLabel.TextColor3 = COLORS.SitFlingPurple
        else
            ballStatusLabel.Text = "BALL: FLINGING TARGET "
            ballStatusLabel.TextColor3 = (rampageMode and COLORS.SoulAuraBlue or COLORS.Accent)
        end
    else
        ballStatusLabel.Text = rampageMode and "BALL: SOUL RAMPAGE MODE " or "BALL: PET HOVER LOCK "
        ballStatusLabel.TextColor3 = rampageMode and COLORS.SoulAuraBlue or COLORS.SuccessGreen
    end

    if rampageMode and not isSummoning then
        if TargetPlayer then
            local enemyChar = TargetPlayer.Character
            local enemyHum = enemyChar and enemyChar:FindFirstChildOfClass("Humanoid")

            if not enemyChar or not enemyHum or enemyHum.Health <= 0 or rampageBlacklist[TargetPlayer.Name] or not Players:FindFirstChild(TargetPlayer.Name) then
                TargetPlayer = nil
            elseif not sitFlingMode then
                local enemyTorso = getTargetTorso(TargetPlayer)
                if enemyTorso then
                    local currentVelocity = enemyTorso.AssemblyLinearVelocity.Magnitude
                    local distanceMoved = (enemyTorso.Position - targetAttackTrack.initialPos).Magnitude

                    if currentVelocity > 120 or (flingActiveThisFrame and distanceMoved > 85) then
                        rampageBlacklist[TargetPlayer.Name] = true
                        TargetPlayer = nil
                    elseif t - targetAttackTrack.startTime > MAX_STUCK_TIME and distanceMoved < 8 then
                        rampageBlacklist[TargetPlayer.Name] = true
                        TargetPlayer = nil
                    end
                end
            elseif isPlayerBound(TargetPlayer) then
                TargetPlayer = nil
            end
        end

        if t - lastScanTime > 0.35 then
            lastScanTime = t
            if not TargetPlayer then
                local prey = FindPreyList(1)[1]
                if prey then
                    TargetPlayer = prey
                    sitFlingPaused = false
                    targetAttackTrack.player = prey
                    targetAttackTrack.startTime = t
                    if prey.Character and getTargetTorso(prey) then
                        targetAttackTrack.initialPos = getTargetTorso(prey).Position
                    end
                    TargetBox.Text = "HUNTING: " .. prey.DisplayName
                    TargetBox.BorderColor3 = COLORS.SoulAuraBlue
                else
                    TargetBox.Text = "[SCANNING FAIL...]"
                    TargetBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
                end
            end
        end
    end

    local finalPos
    local isPetState = false

    if isSummoning then
        local elapsed = t - summonStartTime
        if elapsed >= SUMMON_DURATION then
            isSummoning = false
        else
            local rotationSpeed = (elapsed ^ 2) * 12
            local currentAngle = elapsed * rotationSpeed
            local currentHeight = (elapsed / SUMMON_DURATION) * HOVER_HEIGHT
            witherCurrentPos = summonOriginPos + Vector3.new(0, currentHeight, 0)
            finalPos = CFrame.new(witherCurrentPos) * CFrame.Angles(0, currentAngle, 0)
        end
    end

    if not isSummoning then
        local currentTarget = TargetPlayer

        if not rampageMode and (not currentTarget or not currentTarget.Character or not getTargetTorso(currentTarget)) then
            currentTarget = LP
            isPetState = true
        end

        local targetTorso = getTargetTorso(currentTarget)

        if not targetTorso and rampageMode then
            if soakAnchor then
                local driftX = math.sin(t * 1.5) * RANDOM_DRIFT_SCALE
                local driftZ = math.cos(t * 1.2) * RANDOM_DRIFT_SCALE
                local driftY = math.sin(t * 2.5) * (RANDOM_DRIFT_SCALE * 0.4)
                local hoverPos = soakAnchor + Vector3.new(driftX, HOVER_HEIGHT + driftY, driftZ)
                local moveDir = hoverPos - witherCurrentPos
                local moveDist = moveDir.Magnitude
                if moveDist > 0.1 then
                    local maxMove = WITHER_SPEED * 5 * dt
                    witherCurrentPos = witherCurrentPos + (moveDir.Unit * math.min(moveDist, maxMove))
                end
                lastLookAtPos = lastLookAtPos:Lerp(soakAnchor, 1 - math.exp(-14 * dt))
                finalPos = CFrame.new(witherCurrentPos, lastLookAtPos)
            else
                finalPos = CFrame.new(witherCurrentPos, lastLookAtPos)
            end
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
                local driftX = math.sin(t * 1.5) * RANDOM_DRIFT_SCALE
                local driftZ = math.cos(t * 1.2) * RANDOM_DRIFT_SCALE
                local driftY = math.sin(t * 2.5) * (RANDOM_DRIFT_SCALE * 0.4)
                local anchorPos = soakAnchor or targetTorso.Position
                if rampageMode or soakAnchor then
                    -- [[ โหมดโจมตีทั้งหมด / ตอนกำลังดึงลง void: พฤติกรรมเดิม ]] --
                    idealTargetPos = anchorPos + Vector3.new(driftX, HOVER_HEIGHT + driftY, driftZ)
                else
                    -- [[ โหมดรายบุคคล v6.1.1: วนรอบเป้า ห้ามลอยเหนือหัวเป๊ะๆ (lookAt ตรงดิ่ง -> CFrame เสื่อม วิเทอร์หมุนควงสว่าน) ]] --
                    idealTargetPos = anchorPos + Vector3.new(driftX * 0.35, MANUAL_HOVER_HEIGHT + driftY * 0.5, driftZ * 0.35)
                end
            end

            local moveDirection = (idealTargetPos - witherCurrentPos)
            local distance = moveDirection.Magnitude

            if distance > 0.1 then
                local speedMod = isPetState and 15 or 5
                local maxMove = WITHER_SPEED * speedMod * dt
                local step = math.min(distance, maxMove)
                witherCurrentPos = witherCurrentPos + (moveDirection.Unit * step)
            end

            local rawLookAt
            if isPetState then
                local ownerChar = LP.Character
                local ownerRoot = ownerChar and ownerChar:FindFirstChild("HumanoidRootPart")
                if ownerRoot then
                    rawLookAt = ownerRoot.Position + (ownerRoot.CFrame.LookVector * 50)
                else
                    rawLookAt = witherCurrentPos + Vector3.new(0, 0, -5)
                end
            else
                local lookAnchor = soakAnchor or targetTorso.Position
                rawLookAt = Vector3.new(lookAnchor.X, witherCurrentPos.Y, lookAnchor.Z)
            end

            lastLookAtPos = lastLookAtPos:Lerp(rawLookAt, 1 - math.exp(-14 * dt))
            finalPos = CFrame.new(witherCurrentPos, lastLookAtPos)
        else
            finalPos = CFrame.new(witherCurrentPos)
        end
    end

    local rotCF = CFrame.Angles(math.rad(MANUAL_ROTATION.X), math.rad(MANUAL_ROTATION.Y), math.rad(MANUAL_ROTATION.Z))
    local lerpAlpha = 1 - math.exp(-22 * dt)

    if not isSummoning then
        local ballOwner = getBallAuraOwner()

        for auraId, projData in pairs(activeProjectiles) do
            local victim = projData.Victim
            local vTorso = getTargetTorso(victim)
            local vChar = victim and victim.Character
            local vHum = vChar and vChar:FindFirstChildOfClass("Humanoid")

            if not vTorso or not vHum or vHum.Health <= 0 or not Players:FindFirstChild(victim.Name) then
                activeProjectiles[auraId] = nil
            else
                local enemyVelocity = vTorso.AssemblyLinearVelocity
                local predictedPosition = vTorso.Position + (enemyVelocity * NPC_PREDICTION_LEAD)

                if projData.IsStuck then
                    if sitFlingMode then
                        
                        -- [[ FIX v6.1.0: ล็อกเป้าที่เลือกเอง - สับเป้าคนนั่งเฉพาะตอน Rampage ]] --
                        local canSnatch = (not SIT_SNATCH_ONLY_RAMPAGE) or rampageMode
                        local sitter = canSnatch and FindSitterNear(projData.CurrentPos) or nil
                        if sitter and sitter ~= projData.Victim then
                            if projData.Victim then permaSoakList[projData.Victim.Name] = nil end
                            permaSoakList[sitter.Name] = true
                            projData.Victim = sitter
                            if not rampageMode then
                                TargetPlayer = sitter
                                TargetBox.Text = sitter.DisplayName
                                TargetBox.BorderColor3 = COLORS.SuccessGreen
                            end
                            if not projData.VoidDragStarted then
                                projData.ImpactTime = t
                            end
                        end

                        if not projData.VoidDragStarted then
                            projData.CurrentPos = predictedPosition

                            if activeBall and ballOwner == auraId then
                                activeBall.CFrame = CFrame.new(predictedPosition)
                                activeBall.Velocity = Vector3.zero
                                activeBall.AssemblyLinearVelocity = Vector3.zero
                            end

                            if t - projData.ImpactTime >= SIT_FLING_HOLD_TIME then
                                projData.VoidDragStarted = true
                                if not soakAnchor then
                                    soakAnchor = predictedPosition
                                end
                            end
                        else
                            
                            local vHrp = vChar and vChar:FindFirstChild("HumanoidRootPart")
                            local dragElapsed = t - projData.ImpactTime - SIT_FLING_HOLD_TIME
                            local inGrace = dragElapsed < SOAK_GRACE_TIME
                            local victimStillInVoid = inGrace or (vHrp and (vHrp.Position.Y < SOAK_RELEASE_Y))

                            if not victimStillInVoid then
                                permaSoakList[victim.Name] = nil
                                activeProjectiles[auraId] = nil
                            else
                                -- v6.1.1: ออร์บเกาะตามตำแหน่งจริงของเป้า แทนการยืนนิ่งลึก -2000 (เดิมดูเหมือนลูกบอลโง่ๆ พุ่งดิ่งใต้แมพ)
                                local soakY = (vHrp and vHrp.Position.Y) or predictedPosition.Y
                                projData.CurrentPos = Vector3.new(predictedPosition.X, soakY, predictedPosition.Z)

                                if activeBall and ballOwner == auraId then
                                    activeBall.CFrame = CFrame.new(projData.CurrentPos)
                                    activeBall.Velocity = DRAG_VELOCITY
                                    activeBall.AssemblyLinearVelocity = DRAG_VELOCITY
                                end
                            end
                        end
                    else
                        projData.CurrentPos = predictedPosition

                        if activeBall and ballOwner == auraId then
                            activeBall.CFrame = CFrame.new(predictedPosition)
                            activeBall.Velocity = Vector3.new(0, 9e10, 0)
                        end

                        if t - projData.ImpactTime >= IMPACT_LINGER_TIME then
                            activeProjectiles[auraId] = nil
                        end
                    end
                else
                    if not projData.NpcPhase then
                        projData.NpcPhase = "approach"
                    end

                    if projData.NpcPhase == "approach" then
                        local pDir = (predictedPosition - projData.CurrentPos)
                        local pDist = pDir.Magnitude

                        if pDist > NPC_APPROACH_RANGE then
                            local pStep = math.min(pDist, PROJECTILE_SPEED * NPC_HOMING_SPEED_MULT * dt)
                            projData.CurrentPos = projData.CurrentPos + (pDir.Unit * pStep)
                        else
                            projData.NpcPhase = "locked"
                            projData.LockOnTime = t
                        end
                    elseif projData.NpcPhase == "locked" then
                        projData.CurrentPos = predictedPosition

                        local lockOnDelay = sitFlingMode and NPC_LOCK_ON_DELAY or 0.05
                        if (t - projData.LockOnTime) >= lockOnDelay then
                            projData.IsStuck = true
                            projData.ImpactTime = t
                            projData.CurrentPos = predictedPosition

                            if activeBall and ballOwner == auraId then
                                activeBall.CFrame = CFrame.new(predictedPosition)
                                if sitFlingMode then
                                    activeBall.Velocity = Vector3.zero
                                    activeBall.AssemblyLinearVelocity = Vector3.zero
                                else
                                    activeBall.Velocity = Vector3.new(0, 9e10, 0)
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        table.clear(activeProjectiles)
    end

    do
        local anySoak = false
        for _, pd in pairs(activeProjectiles) do
            if pd.VoidDragStarted then anySoak = true break end
        end
        if not anySoak then soakAnchor = nil end
    end

    for i = 1, totalProps do
        local targetCF
        if i <= 10 then
            local offset = WitherParts[i]

            if isPetState and not isSummoning then
                if i == 1 then
                    local breathZ = math.sin(t * 2.5) * 0.22
                    offset = offset * CFrame.new(0, 0, breathZ)
                elseif i == 2 then
                    local breathZ = math.cos(t * 2.3) * 0.18
                    offset = offset * CFrame.new(0, 0, breathZ)
                elseif i == 3 then
                    local breathZ = math.sin(t * 2.1) * 0.18
                    offset = offset * CFrame.new(0, 0, breathZ)
                end
            end

            targetCF = finalPos * rotCF * offset
        else
            local auraId = i - 10
            local activeProj = activeProjectiles[auraId]

            if activeProj and not isSummoning then
                targetCF = CFrame.new(activeProj.CurrentPos, lastLookAtPos)
            else
                local targetHeadId
                if auraId == 1 or auraId == 2 then
                    targetHeadId = 2
                elseif auraId == 3 or auraId == 4 then
                    targetHeadId = 3
                else
                    targetHeadId = 1
                end

                local headCFrame = currentCFrames[targetHeadId] or finalPos
                targetCF = headCFrame
            end
        end

        currentCFrames[i] = (currentCFrames[i] or targetCF):Lerp(targetCF, lerpAlpha)
    end

    if not isSummoning then
        local canFire = false
        if rampageMode then
            canFire = (#FindPreyList(1) > 0)
        elseif TargetPlayer and getTargetTorso(TargetPlayer) then
            canFire = true
        end

        if canFire and t - lastAttackTime > ATTACK_COOLDOWN then
            lastAttackTime = t

            local availableAuras = {}
            for auraId = 1, 5 do
                if not activeProjectiles[auraId] then
                    table.insert(availableAuras, auraId)
                end
            end

            local freeCount = #availableAuras
            if freeCount > 0 then
                if rampageMode then
                    local preyList = FindPreyList(freeCount)

                    task.defer(function()
                        for k = 1, freeCount do
                            local auraId = availableAuras[k]
                            local prey = preyList[k]

                            if prey then
                                local targetHeadId
                                if auraId == 1 or auraId == 2 then targetHeadId = 2
                                elseif auraId == 3 or auraId == 4 then targetHeadId = 3
                                else targetHeadId = 1 end

                                local headCFrame = currentCFrames[targetHeadId]
                                local preyTorso = getTargetTorso(prey)

                                if headCFrame and preyTorso and not isPlayerBound(prey) then
                                    local preyVelocity = preyTorso.AssemblyLinearVelocity
                                    local predictedTargetPos = preyTorso.Position + (preyVelocity * (dt + 0.05))

                                    if sitFlingMode then permaSoakList[prey.Name] = true end
                                    activeProjectiles[auraId] = {
                                        CurrentPos = headCFrame.Position,
                                        TargetPos = predictedTargetPos,
                                        IsStuck = false,
                                        ImpactTime = 0,
                                        Victim = prey
                                    }
                                end
                            end

                            if k < freeCount then task.wait(math.random(2, 5) / 100) end
                        end
                    end)
                else
                    
                    local burstCount = math.min(5, freeCount) -- v6.1.x: โหมดรายบุคคลยิง aura ครบ 5 ลูกใส่เป้าเดียว (เดิมยิงแค่ 1-2 ลูก)
                    local enemyTorso = getTargetTorso(TargetPlayer)

                    task.defer(function()
                        for k = 1, burstCount do
                            local auraId = availableAuras[k]

                            local targetHeadId
                            if auraId == 1 or auraId == 2 then targetHeadId = 2
                            elseif auraId == 3 or auraId == 4 then targetHeadId = 3
                            else targetHeadId = 1 end

                            local headCFrame = currentCFrames[targetHeadId]

                            if headCFrame and enemyTorso and TargetPlayer then
                                local enemyVelocity = enemyTorso.AssemblyLinearVelocity
                                local predictedTargetPos = enemyTorso.Position + (enemyVelocity * (dt + 0.05))

                                if sitFlingMode then permaSoakList[TargetPlayer.Name] = true end
                                activeProjectiles[auraId] = {
                                    CurrentPos = headCFrame.Position,
                                    TargetPos = predictedTargetPos,
                                    IsStuck = false,
                                    ImpactTime = 0,
                                    Victim = TargetPlayer
                                }
                            end

                            if k < burstCount then task.wait(math.random(4, 9) / 100) end
                        end
                    end)
                end
            end
        end
    end

    if sitFlingMode then
        local soakCount = 0
        for _, pd in pairs(activeProjectiles) do
            if pd.VoidDragStarted then soakCount = soakCount + 1 end
        end
        sitStatusLabel.Text = "SIT FLING: " .. soakCount .. "/5 VOID SOAK"
        sitStatusLabel.TextColor3 = soakCount > 0 and COLORS.SitFlingPurple or Color3.fromRGB(120, 120, 120)
    end

    if t - lastNetworkUpdate > 0.014 then
        local canUpdateColor = (t - lastColorUpdate > 0.05)
        local frameCFrames = currentCFrames
        local startSend = os.clock()

        for i = 1, totalProps do
            local prop = wingRemoteCache[i]
            local targetCFrame = frameCFrames[i]

            if prop and targetCFrame then
                task.spawn(function()
                    local cfR = prop:FindFirstChild("SetCurrentCFrame")
                    if cfR then
                        pcall(function()
                            cfR:InvokeServer(targetCFrame)
                            if i == 1 then
                                estimatedPing = (estimatedPing * 0.85) + ((os.clock() - startSend) * 0.15)
                            end
                        end)
                    end

                    if canUpdateColor and i == colorIndex then
                        local crR = prop:FindFirstChild("ChangePropColor")
                        if crR then pcall(function() crR:InvokeServer(getAbyssColor(t, i)) end) end
                    end
                end)
            end
        end

        if canUpdateColor then
            colorIndex = (colorIndex % totalProps) + 1
            lastColorUpdate = t
        end
        lastNetworkUpdate = t
    end
end)
