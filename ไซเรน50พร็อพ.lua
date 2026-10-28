-- [[ INDOMINUS REX CUSTOM CAMOUFLAGE CORE V11.0.0 + ABYSS RED DEEP HORROR ENGINE ]] --
-- Engine Core: DYTON_txt (Eternatus Framework & Zero-Delay Bypass Engine)
-- Developer: Josep Bart

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local OwnerName = LP.Name
local petMode = false
local noclip = false
local IsInvisible = false 
local isReloading = false
local isMinimized = false
local AirWalkActive = false
local isBiting = false
local isBitingState = 0
local isSkilling = false
local isSkillState = 0
local isEmoting = false
local isEmoteState = 0
local camouflageActive = false 

if _G.a then
    for _, connection in pairs(_G.a) do
        pcall(function() connection:Disconnect() end)
    end
    _G.a = nil
end

if game:GetService("Workspace"):FindFirstChild("AbyssAirWalkPlatform") then
    game:GetService("Workspace"):FindFirstChild("AbyssAirWalkPlatform"):Destroy()
end

-- [[ CONFIGURATION MATRIX - INDEPENDENT OFFSETS ]] --
local Config = {
    Idle = { Offset = Vector3.new(-22.2, -111.5, 360), Rotation = Vector3.new(-3, 540.3, 0) },
    Walk = { Offset = Vector3.new(-22.2, -109.5, 360), Rotation = Vector3.new(-3, 540.3, 0) },
    Bite = { Offset = Vector3.new(-22.2, -110.5, 360), Rotation = Vector3.new(-3, 540, 0.3) },
    Skill = { Offset = Vector3.new(-22.2, -108.5, 360), Rotation = Vector3.new(-3, 540, 0.3) },
    Emote = { Offset = Vector3.new(-22.2, -111.5, 360), Rotation = Vector3.new(-3, 540, 0.3) }
}

-- [[ OVERCLOCKED CACHE & ASYNC BYPASS BUFFERS ]] --
local PROP_CACHE = {}          
local CURRENT_CFRAMES = {}     
local TARGET_CFRAMES = {}      
local LAST_SEND_TIME = {}      
local COLOR_SENDING = {}       
local NETWORK_STATE = {}        
local LAST_SCALE_CACHE = {}
local SCALE_SENDING = {}
local TEXTURE_APPLIED = {}      
local PROP_COLOR_CACHE = {}

local lastColorUpdate = 0
local colorIndex = 1
local originalPos = nil
local snapNextFrame = false
local TOTAL_MAX_PROPS = 40     

local BASE_TICK_RATE = 0.033 
local NETWORK_TICK_RATE = 0.033 
local estimatedPing = 0.03   
local lastPosition = Vector3.zero
local MAX_CHOKE_TIMEOUT = 0.05  

local TargetHeight = 100 
local CurrentGroundY = 0
local SmoothHeight = 0 
local LastValidYaw = 0

local Platform = Instance.new("Part")
Platform.Name = "AbyssAirWalkPlatform"
Platform.Size = Vector3.new(25, 1, 25)
Platform.Transparency = 1 
Platform.Anchored = true
Platform.CanCollide = false
Platform.Parent = game:GetService("Workspace")

-- [[ ENHANCED FLEXIBLE MULTI-DIRECTIONAL CAMOUFLAGE SCANNER ]] --
local function GetPropScannedColor(id, prop)
    if not camouflageActive then
        if id == 16 or id == 17 then return Color3.fromRGB(0, 0, 0)
        elseif id >= 18 and id <= 22 then return Color3.fromRGB(255, 255, 255)
        else return Color3.fromRGB(130, 0, 0) end
    end

    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    local exclude = {LP.Character, Platform}
    for _, p in pairs(PROP_CACHE) do if p and p.Parent then table.insert(exclude, p) end end
    rayParams.FilterDescendantsInstances = exclude

    local startPos
    if prop and prop:IsA("BasePart") then startPos = prop.Position
    elseif CURRENT_CFRAMES[id] then startPos = CURRENT_CFRAMES[id].Position end

    if not startPos then
        local char = LP.Character
        if char then
            local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
            if torso then startPos = torso.Position end
        end
    end

    if startPos then
        local scanDirections = {
            Vector3.new(0, -100, 0), Vector3.new(0, -100, 100), Vector3.new(0, -100, -100),
            Vector3.new(100, -100, 0), Vector3.new(-100, -100, 0), Vector3.new(0, 0, -200)
        }
        for _, dir in ipairs(scanDirections) do
            local rayHit = workspace:Raycast(startPos, dir, rayParams)
            if rayHit and rayHit.Instance and rayHit.Instance.CanCollide then
                PROP_COLOR_CACHE[id] = rayHit.Instance.Color
                return rayHit.Instance.Color
            end
        end
    end
    return PROP_COLOR_CACHE[id] or Color3.fromRGB(45, 80, 35)
end

local function ApplyPropTextureOnce(id, prop)
    if id == 1 or id == 2 then return end
    if TEXTURE_APPLIED[id] then return end
    TEXTURE_APPLIED[id] = true
    task.spawn(function()
        local textureRemote = prop:FindFirstChild("ApplyTexture")
        if textureRemote and textureRemote:IsA("RemoteFunction") then
            pcall(function() textureRemote:InvokeServer("BrickGray") end)
        end
    end)
end

local function UpdateAndValidateRodanProps()
    local targetFolder = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
    if not targetFolder then return false end

    local targetPropName = "Prop" .. OwnerName 
    if OwnerName == "terasiremik" then targetPropName = "Propterasiremik" end

    for id, storedProp in pairs(PROP_CACHE) do
        if not storedProp or not storedProp.Parent then 
            PROP_CACHE[id] = nil; CURRENT_CFRAMES[id] = nil; TARGET_CFRAMES[id] = nil
            LAST_SEND_TIME[id] = nil; COLOR_SENDING[id] = nil; NETWORK_STATE[id] = nil
            LAST_SCALE_CACHE[id] = nil; SCALE_SENDING[id] = nil; TEXTURE_APPLIED[id] = nil; PROP_COLOR_CACHE[id] = nil
        end
    end

    local children = targetFolder:GetChildren()
    table.sort(children, function(a, b) return a:GetDebugId() < b:GetDebugId() end)

    for _, child in ipairs(children) do 
        if child.Name == targetPropName then
            local alreadyRegistered = false
            for _, storedProp in pairs(PROP_CACHE) do if storedProp == child then alreadyRegistered = true break end end
            if not alreadyRegistered then
                for id = 1, TOTAL_MAX_PROPS do
                    if not PROP_CACHE[id] then
                        PROP_CACHE[id] = child
                        CURRENT_CFRAMES[id] = nil; TARGET_CFRAMES[id] = nil; LAST_SEND_TIME[id] = 0
                        COLOR_SENDING[id] = false; NETWORK_STATE[id] = false; LAST_SCALE_CACHE[id] = nil
                        SCALE_SENDING[id] = false; TEXTURE_APPLIED[id] = nil
                        ApplyPropTextureOnce(id, child)
                        break
                    end
                end
            end
        end
    end
    return true
end

local function UpdateGroundY()
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    local exclusionList = {char, Platform}
    for _, propPart in pairs(PROP_CACHE) do if propPart and propPart.Parent then table.insert(exclusionList, propPart) end end
    raycastParams.FilterDescendantsInstances = exclusionList
    local startPosition = Vector3.new(root.Position.X, root.Position.Y + 50, root.Position.Z)
    local raycastResult = game:GetService("Workspace"):Raycast(startPosition, Vector3.new(0, -2000, 0), raycastParams)
    if raycastResult then CurrentGroundY = raycastResult.Position.Y end
end

local function getBombCount()
    local count = 0
    local bp = LP:FindFirstChild("Backpack")
    local char = LP.Character
    if bp then for _, item in pairs(bp:GetChildren()) do if item.Name == "Bomb" then count = count + 1 end end end
    if char then for _, item in pairs(char:GetChildren()) do if item.Name == "Bomb" then count = count + 1 end end end
    return count
end

-- [[ ASSET MATRIX POOL CORE ]] --
local AnimationPool = {
    Idle = {
        [1]  = { CFrame = CFrame.new(-38.516, 57.827, 361.625) * CFrame.Angles(math.rad(177.14), math.rad(-15.81), math.rad(-91.63)), Scale = 0.8090 },
        [2]  = { CFrame = CFrame.new(-11.169, 56.888, 364.421) * CFrame.Angles(math.rad(177.30), math.rad(21.86), math.rad(94.66)), Scale = 0.8090 },
        [3]  = { CFrame = CFrame.new(-23.835, 102.927, 357.791) * CFrame.Angles(math.rad(-152.48), math.rad(74.32), math.rad(161.61)), Scale = 2.1637 },
        -- [TRUNCATED FOR MESSAGE LIMIT: COPY THE REST OF Idle, Walk1, Walk1combo, Walk2, Walk2combo, Bite1, Bite2, Skill1, Skill2, Emote1, Emote2 FROM YOUR ORIGINAL FILE HERE]
    }
}

local function UnpackMatrixData(data)
    if typeof(data) == "CFrame" then return data, nil end
    if typeof(data) == "table" then return data.CFrame or CFrame.identity, data.Scale end
    return CFrame.identity, nil
end

-- [[ UI CONTEXT CREATION - DEEP HORROR ABYSS THEME ]] --
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "Indominus_Camouflage_Overclock_Hub"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 220, 0, 460) 
main.Position = UDim2.new(0.05, 0, 0.15, 0)
main.BackgroundColor3 = Color3.fromRGB(5, 0, 0) 
main.BorderSizePixel = 0
main.ClipsDescendants = true

local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 8, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "SIREN HEAD THE STALKER- Josep Bart"
titleLabel.TextColor3 = Color3.fromRGB(255, 30, 30)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 13
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local MinBtn = Instance.new("TextButton", titleBar)
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Position = UDim2.new(1, -26, 0, 4)
MinBtn.BackgroundColor3 = Color3.fromRGB(5, 0, 0)
MinBtn.BorderSizePixel = 1
MinBtn.BorderColor3 = Color3.fromRGB(150, 0, 0)
MinBtn.Text = "▲"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.TextSize = 12
local btnCorner = Instance.new("UICorner", MinBtn)
btnCorner.CornerRadius = UDim.new(0, 4)

local contentContainer = Instance.new("Frame", main)
contentContainer.Size = UDim2.new(1, 0, 1, -30)
contentContainer.Position = UDim2.new(0, 0, 0, 30)
contentContainer.BackgroundTransparency = 1
contentContainer.ClipsDescendants = true

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
    b.BackgroundColor3, b.BorderSizePixel, b.BorderColor3 = Color3.fromRGB(40, 0, 0), 1, Color3.fromRGB(150, 0, 0)
    b.TextColor3, b.Font, b.TextSize = Color3.fromRGB(255, 30, 30), Enum.Font.SourceSansBold, 11
    b.MouseEnter:Connect(function() b.BorderColor3 = Color3.fromRGB(255, 30, 30) b.TextColor3 = Color3.new(1,1,1) end)
    b.MouseLeave:Connect(function() b.BorderColor3 = Color3.fromRGB(150, 0, 0) b.TextColor3 = Color3.fromRGB(255, 30, 30) end)
end

local function createBtn(txt, pos, size, parent)
    local b = Instance.new("TextButton", parent or contentContainer)
    b.Text, b.Position, b.Size = txt, pos, size styleBtn(b)
    return b
end

local mainFrame = Instance.new("Frame", contentContainer)
mainFrame.Size = UDim2.new(1, -10, 0, 95)
mainFrame.Position = UDim2.new(0, 5, 0, 5)
mainFrame.BackgroundTransparency = 1

local SummonBtn  = createBtn("SUMMON SIREN HEAD", UDim2.new(0,0,0,0), UDim2.new(1,0,0.30,0), mainFrame)
local cBtn       = createBtn("Noclip: OFF", UDim2.new(0,0,0.35,0), UDim2.new(0.5,-2,0.30,0), mainFrame)
local airWalkBtn = createBtn("Air Walk: OFF", UDim2.new(0.5,2,0.35,0), UDim2.new(0.5,-2,0.30,0), mainFrame)
local camoBtn  = createBtn("SKILL KAMUFLASE: OFF", UDim2.new(0,0,0.70,0), UDim2.new(1,0,0.30,0), mainFrame)

local line = Instance.new("Frame", contentContainer)
line.Size = UDim2.new(1, -10, 0, 1)
line.Position = UDim2.new(0, 5, 0, 105)
line.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
line.BorderSizePixel = 0

local bombFrame = Instance.new("Frame", contentContainer)
bombFrame.Size = UDim2.new(1, -10, 0, 295)
bombFrame.Position = UDim2.new(0, 5, 0, 110) 
bombFrame.BackgroundTransparency = 1

local Counter = Instance.new("TextLabel", bombFrame)
Counter.Size = UDim2.new(1, 0, 0, 18)
Counter.Position = UDim2.new(0, 0, 0, 0)
Counter.Text = "BOMBS COUNTER: 0"
Counter.TextColor3 = Color3.fromRGB(255, 255, 255)
Counter.Font = Enum.Font.SourceSansBold
Counter.TextSize = 12
Counter.BackgroundTransparency = 1

local bReload   = createBtn("SKILL TP + DUPE BOMB", UDim2.new(0, 0, 0, 20), UDim2.new(1, 0, 0, 22), bombFrame)
local bEquip    = createBtn("EQUIP ALL BOMBS", UDim2.new(0, 0, 0, 45), UDim2.new(1, 0, 0, 22), bombFrame)
local bBlast    = createBtn("PLACE ALL BOMBS", UDim2.new(0, 0, 0, 70), UDim2.new(1, 0, 0, 22), bombFrame)
local bDetonate = createBtn("DETONATE ALL BOMBS", UDim2.new(0, 0, 0, 95), UDim2.new(1, 0, 0, 22), bombFrame)
local bBite     = createBtn("NIGHTMARE CLAW", UDim2.new(0, 0, 0, 120), UDim2.new(1, 0, 0, 22), bombFrame)
local bSkill    = createBtn("JUMPSCARE GRAB", UDim2.new(0, 0, 0, 145), UDim2.new(1, 0, 0, 22), bombFrame)
local bEmote    = createBtn("SIREN HEAD ROAR", UDim2.new(0, 0, 0, 170), UDim2.new(1, 0, 0, 22), bombFrame)
local invBtn    = createBtn("INVISIBLE: OFF", UDim2.new(0, 0, 0, 195), UDim2.new(1, 0, 0, 22), bombFrame)

local creditLabel = Instance.new("TextLabel", contentContainer)
creditLabel.Size = UDim2.new(1, 0, 0, 15)
creditLabel.Position = UDim2.new(0, 0, 1, -15)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "Engine: DYTON_txt & Josep Bart"
creditLabel.TextColor3 = Color3.fromRGB(150, 0, 0)
creditLabel.Font = Enum.Font.Code
creditLabel.TextSize = 9

camoBtn.MouseButton1Click:Connect(function()
    camouflageActive = not camouflageActive
    if camouflageActive then
        camoBtn.Text = "SKILL KAMUFLASE: ON"
        camoBtn.TextColor3 = Color3.fromRGB(50, 255, 50)
        camoBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    else
        camoBtn.Text = "SKILL KAMUFLASE: OFF"
        camoBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        camoBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    end
end)

local VisibleParts = {}
local function SetupCharacter()
    local char = LP.Character or LP.CharacterAdded:Wait()
    VisibleParts = {}
    for _, d in pairs(char:GetDescendants()) do
        if (d:IsA("BasePart") or d:IsA("Decal")) and d.Name ~= "HumanoidRootPart" then
            table.insert(VisibleParts, d)
        end
    end
end

local function restoreNaturalCollision(char)
    if not char then return end
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("BasePart") then
            local name = v.Name:lower()
            v.CanCollide = (name:find("torso") or name:find("root") or name:find("leg") or name:find("head")) and not noclip
        end
    end
end

local function ToggleInvis()
    IsInvisible = not IsInvisible
    invBtn.Text = IsInvisible and "INVISIBLE: ON" or "INVISIBLE: OFF"
    invBtn.TextColor3 = IsInvisible and Color3.fromRGB(255, 30, 30) or Color3.new(0.8, 0.8, 0.8)
    local targetTransparency = IsInvisible and 1 or 0
    for _, part in pairs(VisibleParts) do
        if part and part.Parent then pcall(function() part.Transparency = targetTransparency end) end
    end
end

local function ActionToggleAirWalk()
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    AirWalkActive = not AirWalkActive
    if AirWalkActive then
        airWalkBtn.Text = "Air Walk: ON"
        airWalkBtn.TextColor3 = Color3.fromRGB(255, 30, 30)
        Platform.CanCollide = true
        UpdateGroundY()
        if root then
            SmoothHeight = CurrentGroundY + TargetHeight
            local rx, ry, rz = root.CFrame:ToOrientation()
            LastValidYaw = ry
            root.CFrame = CFrame.new(root.Position.X, SmoothHeight, root.Position.Z) * CFrame.Angles(0, LastValidYaw, 0)
        end
    else
        airWalkBtn.Text = "Air Walk: OFF"
        airWalkBtn.TextColor3 = Color3.new(0.85, 0.8, 0.8)
        Platform.CanCollide = false
        Platform.Position = Vector3.new(0, -999, 0)
    end
end

bBite.MouseButton1Click:Connect(function()
    if isBiting or isSkilling or isEmoting then return end
    isBiting = true
    bBite.Text = "BITING..."
    task.spawn(function()
        isBitingState = 1
        task.wait(1.5)
        isBitingState = 2
        task.wait(1.0)
        isBitingState = 0
        isBiting = false
        bBite.Text = "kill them and eat!"
    end)
end)

bSkill.MouseButton1Click:Connect(function()
    if isSkilling or isBiting or isEmoting then return end
    isSkilling = true
    bSkill.Text = "SKILLING..."
    task.spawn(function()
        isSkillState = 1
        task.wait(1.0)
        isSkillState = 2
        task.wait(1.2)
        isSkillState = 0
        isSkilling = false
        bSkill.Text = "HAHA GOT YOU"
    end)
end)

bEmote.MouseButton1Click:Connect(function()
    if isEmoting or isBiting or isSkilling then return end
    isEmoting = true
    bEmote.Text = "EMOTING..."
    task.spawn(function()
        isEmoteState = 1
        task.wait(2.5) 
        isEmoteState = 2 
        task.wait(2.5) 
        isEmoteState = 0
        isEmoting = false
        bEmote.Text = "ROARR"
    end)
end)

SummonBtn.MouseButton1Click:Connect(function()
    petMode = not petMode
    if petMode then
        SetupCharacter()
        noclip, snapNextFrame = true, true
        cBtn.Text, SummonBtn.TextColor3 = "Noclip: ON", Color3.fromRGB(255, 30, 30)
        UpdateAndValidateRodanProps()
        local char = LP.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            lastPosition = char.HumanoidRootPart.Position
        end
    else
        if IsInvisible then ToggleInvis() end
        if AirWalkActive then ActionToggleAirWalk() end
        noclip = false
        cBtn.Text, SummonBtn.TextColor3 = "Noclip: OFF", Color3.new(0.8,0.8,0.8)
        restoreNaturalCollision(LP.Character)
        table.clear(CURRENT_CFRAMES); table.clear(TARGET_CFRAMES); table.clear(LAST_SEND_TIME)
        table.clear(COLOR_SENDING); table.clear(NETWORK_STATE); table.clear(LAST_SCALE_CACHE)
        table.clear(SCALE_SENDING); table.clear(TEXTURE_APPLIED); table.clear(PROP_COLOR_CACHE)
    end
end)

cBtn.MouseButton1Click:Connect(function() noclip = not noclip cBtn.Text = noclip and "Noclip: ON" or "Noclip: OFF" restoreNaturalCollision(LP.Character) end)
airWalkBtn.MouseButton1Click:Connect(ActionToggleAirWalk)
invBtn.MouseButton1Click:Connect(ToggleInvis)

bReload.MouseButton1Click:Connect(function()
    isReloading = not isReloading
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local detectorPath = workspace.WorkspaceCom["001_CriminalWeapons"].GiveTools.Bomb.ClickDetector

    if isReloading then
        bReload.Text = "STOP & TP BACK"
        bReload.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        bReload.TextColor3 = Color3.new(1, 1, 1)
        if root then originalPos = root.CFrame root.CFrame = detectorPath.Parent.CFrame end
        task.spawn(function()
            while isReloading do
                pcall(function() fireclickdetector(detectorPath) end)
                task.wait(0.05)
            end
        end)
    else
        bReload.Text = "SKILL TP + DUPE BOMB"
        bReload.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
        bReload.TextColor3 = Color3.fromRGB(255, 30, 30)
        if root and originalPos then root.CFrame = originalPos originalPos = nil end
    end
end)

bEquip.MouseButton1Click:Connect(function() for _, v in pairs(LP.Backpack:GetChildren()) do if v.Name == "Bomb" then v.Parent = LP.Character end end end)

bBlast.MouseButton1Click:Connect(function()
    local char = LP.Character
    if not char then return end
    local bombs = {}
    for _, v in pairs(LP.Backpack:GetChildren()) do if v.Name == "Bomb" then table.insert(bombs, v) end end
    for _, v in pairs(char:GetChildren()) do if v.Name == "Bomb" then table.insert(bombs, v) end end
    if #bombs == 0 then return end
    for i, bomb in ipairs(bombs) do
        task.spawn(function() pcall(function() bomb.Parent = char task.wait() bomb:Activate() end) end)
        if i % 20 == 0 then RS.Heartbeat:Wait() end
    end
end)

bDetonate.MouseButton1Click:Connect(function()
    local args = { "Bomb" .. OwnerName }
    pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args)) end)
end)

MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    local targetSize = isMinimized and UDim2.new(0, 220, 0, 30) or UDim2.new(0, 220, 0, 460)
    MinBtn.Text = isMinimized and "▼" or "▲"
    TS:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    contentContainer.Visible = not isMinimized
end)

task.spawn(function() while true do Counter.Text = "BOMBS COUNTER: " .. getBombCount() task.wait(0.4) end end)

local Connections = {}
Connections[1] = UIS.InputBegan:Connect(function(input, gameProcessed) 
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.G then ToggleInvis() 
        elseif input.KeyCode == Enum.KeyCode.J then ActionToggleAirWalk() end
    end 
end)

-- [[ MAIN LOOP - INTERPOLATION MATRIX & ADAPTIVE LERP ENGINE ]] --
Connections[2] = RS.Heartbeat:Connect(function(dt)
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")

    if IsInvisible and root and hum then
        local OriginalCFrame = root.CFrame
        local OriginalCameraOffset = hum.CameraOffset
        local DownCFrame = OriginalCFrame * CFrame.new(0, -500000, 0)
        root.CFrame = DownCFrame
        hum.CameraOffset = DownCFrame:ToObjectSpace(CFrame.new(OriginalCFrame.Position)).Position
        RS.RenderStepped:Wait()
        root.CFrame = OriginalCFrame
        hum.CameraOffset = OriginalCameraOffset
    end

    if petMode then
        local t = tick()
        if t % 0.5 < dt then UpdateAndValidateRodanProps() end
        local totalRegisteredProps = TOTAL_MAX_PROPS 
        
        if root then
            local VirtualRootCFrame = root.CFrame
            local currentPos = VirtualRootCFrame.Position
            local calculatedVelocity = (currentPos - lastPosition) / math.max(dt, 0.001)
            lastPosition = currentPos

            local moveSpeed = calculatedVelocity.Magnitude
            local isWalking = moveSpeed > 1
            
            local activeConfig = Config.Idle
            local lerpSpeed = 6.5

            if isBiting then activeConfig = Config.Bite lerpSpeed = 5.0
            elseif isSkilling then activeConfig = Config.Skill lerpSpeed = 4.0
            elseif isEmoting then activeConfig = Config.Emote lerpSpeed = 4.0
            elseif isWalking then activeConfig = Config.Walk lerpSpeed = 10.5 end
            
            local baseAlpha = math.clamp(1 - math.exp(-lerpSpeed * dt), 0, 1)
            local localLerpAlpha = math.pow(baseAlpha, 0.75) 

            if estimatedPing > 0.15 then NETWORK_TICK_RATE = math.clamp(estimatedPing * 0.5, BASE_TICK_RATE, 0.8)
            else NETWORK_TICK_RATE = BASE_TICK_RATE end

            local safePing = math.clamp(estimatedPing, 0.01, 0.2)
            local predictedPosition = currentPos + (calculatedVelocity * safePing)
            
            local baseTargetCF = CFrame.new(predictedPosition, predictedPosition + VirtualRootCFrame.LookVector)
            local finalPos = baseTargetCF * CFrame.new(activeConfig.Offset.X, activeConfig.Offset.Y, activeConfig.Offset.Z)
            local rotCF = CFrame.Angles(math.rad(activeConfig.Rotation.X), math.rad(activeConfig.Rotation.Y), math.rad(activeConfig.Rotation.Z))

            if snapNextFrame then localLerpAlpha = 1 end
            local walkAnimSpeed = 0.27
            local cycle = (t * walkAnimSpeed) % 1.0

            for id = 1, totalRegisteredProps do
                local prop = PROP_CACHE[id]
                if prop and prop.Parent then
                    local rawEntry
                    
                    if isBiting then
                        if isBitingState == 1 then rawEntry = AnimationPool.Bite1[id] or AnimationPool.Idle[id]
                        elseif isBitingState == 2 then rawEntry = AnimationPool.Bite2[id] or AnimationPool.Bite1[id]
                        else rawEntry = AnimationPool.Idle[id] end
                    elseif isSkilling then
                        if isSkillState == 1 then rawEntry = AnimationPool.Skill1[id] or AnimationPool.Idle[id]
                        elseif isSkillState == 2 then rawEntry = AnimationPool.Skill2[id] or AnimationPool.Skill1[id]
                        else rawEntry = AnimationPool.Idle[id] end
                    elseif isEmoting then
                        if isEmoteState == 1 then rawEntry = AnimationPool.Emote1[id] or AnimationPool.Idle[id]
                        elseif isEmoteState == 2 then rawEntry = AnimationPool.Emote2[id] or AnimationPool.Emote1[id]
                        else rawEntry = AnimationPool.Idle[id] end
                    elseif isWalking then
                        local raw_w1  = AnimationPool.Walk1[id]      or AnimationPool.Idle[id]
                        local raw_w1c = AnimationPool.Walk1combo[id] or raw_w1
                        local raw_w2  = AnimationPool.Walk2[id]      or AnimationPool.Idle[id]
                        local raw_w2c = AnimationPool.Walk2combo[id] or raw_w2

                        local cf_w1  = UnpackMatrixData(raw_w1)
                        local cf_w1c = UnpackMatrixData(raw_w1c)
                        local cf_w2  = UnpackMatrixData(raw_w2)
                        local cf_w2c = UnpackMatrixData(raw_w2c)

                        local mixedOffset
                        if cycle < 0.25 then local alpha = cycle / 0.25 mixedOffset = cf_w1:Lerp(cf_w1c, alpha)
                        elseif cycle < 0.50 then local alpha = (cycle - 0.25) / 0.25 mixedOffset = cf_w1c:Lerp(cf_w2, alpha)
                        elseif cycle < 0.75 then local alpha = (cycle - 0.50) / 0.25 mixedOffset = cf_w2:Lerp(cf_w2c, alpha)
                        else local alpha = (cycle - 0.75) / 0.25 mixedOffset = cf_w2c:Lerp(cf_w1, alpha) end
                        rawEntry = mixedOffset
                    else
                        rawEntry = AnimationPool.Idle[id] or AnimationPool.Idle[((id - 1) % #AnimationPool.Idle) + 1]
                    end

                    local offsetCF, scaleVal = UnpackMatrixData(rawEntry)
                    
                    if isEmoting and isEmoteState == 2 then
                        local vibrateOffset = Vector3.new((math.random() - 0.5) * 6, (math.random() - 0.5) * 6, (math.random() - 0.5) * 6)
                        offsetCF = offsetCF * CFrame.new(vibrateOffset)
                    end

                    local targetCF = finalPos * rotCF * offsetCF
                    TARGET_CFRAMES[id] = targetCF

                    if snapNextFrame or not CURRENT_CFRAMES[id] then CURRENT_CFRAMES[id] = targetCF
                    else CURRENT_CFRAMES[id] = CURRENT_CFRAMES[id]:Lerp(targetCF, localLerpAlpha) end

                    if scaleVal and LAST_SCALE_CACHE[id] ~= scaleVal and not SCALE_SENDING[id] then
                        SCALE_SENDING[id] = true
                        task.spawn(function()
                            local scaleRemote = prop:FindFirstChild("SetCurrentScale")
                            if scaleRemote and scaleRemote:IsA("RemoteFunction") then
                                pcall(function() scaleRemote:InvokeServer(scaleVal) LAST_SCALE_CACHE[id] = scaleVal end)
                            end
                            SCALE_SENDING[id] = false
                        end)
                    end
                end
            end
            if snapNextFrame then snapNextFrame = false end
            local canUpdateColor = (t - lastColorUpdate > 0.015)
            
            for id = 1, totalRegisteredProps do
                local prop = PROP_CACHE[id]
                if prop and CURRENT_CFRAMES[id] then
                    if t - (LAST_SEND_TIME[id] or 0) >= NETWORK_TICK_RATE and not NETWORK_STATE[id] then
                        local cfR = prop:FindFirstChild("SetCurrentCFrame")
                        if cfR and cfR:IsA("RemoteFunction") then
                            LAST_SEND_TIME[id] = t 
                            NETWORK_STATE[id] = true 
                            task.spawn(function()
                                local startSend = os.clock()
                                local completed = false
                                task.spawn(function()
                                    local success = pcall(function() cfR:InvokeServer(CURRENT_CFRAMES[id]) end)
                                    completed = true
                                    NETWORK_STATE[id] = false 
                                    if success and id == 1 then estimatedPing = (estimatedPing * 0.95) + ((os.clock() - startSend) * 0.05) end
                                end)
                                task.delay(MAX_CHOKE_TIMEOUT, function() if not completed then NETWORK_STATE[id] = false end end)
                            end)
                        end
                    end

                    if canUpdateColor and id == colorIndex and not COLOR_SENDING[id] then
                        local crR = prop:FindFirstChild("ChangePropColor")
                        if crR then
                            COLOR_SENDING[id] = true
                            task.spawn(function()
                                local finishedColor = false
                                local scannedColor = GetPropScannedColor(id, prop)
                                task.spawn(function()
                                    pcall(function() crR:InvokeServer(scannedColor) end)
                                    finishedColor = true
                                    COLOR_SENDING[id] = false
                                end)
                                task.delay(0.1, function() if not finishedColor then COLOR_SENDING[id] = false end end)
                            end)
                        end
                    end
                end
            end
            
            if canUpdateColor then colorIndex = (colorIndex % totalRegisteredProps) + 1 lastColorUpdate = t end
        end
    end

    if AirWalkActive and root then
        UpdateGroundY()
        local actualTarget = CurrentGroundY + TargetHeight
        SmoothHeight = SmoothHeight + (actualTarget - SmoothHeight) * 0.15
        Platform.Position = Vector3.new(root.Position.X, SmoothHeight - 3.5, root.Position.Z)
        local lookVector = root.CFrame.LookVector
        local flatLook = Vector3.new(lookVector.X, 0, lookVector.Z)
        if flatLook.Magnitude > 0.001 then LastValidYaw = math.atan2(-flatLook.X, -flatLook.Z) end
        if math.abs(root.Position.Y - SmoothHeight) > 0.1 then
            root.CFrame = CFrame.new(root.Position.X, SmoothHeight, root.Position.Z) * CFrame.Angles(0, LastValidYaw, 0)
        end
    end
end)

Connections[3] = RS.Heartbeat:Connect(function()
    local char = LP.Character
    if noclip and char then 
        for _, v in pairs(char:GetDescendants()) do 
            if v:IsA("BasePart") then v.CanCollide = false end 
        end 
    end
end)

LP.CharacterAdded:Connect(function()
    task.wait(1)
    IsInvisible, isReloading, AirWalkActive, isBiting, isSkilling, isEmoting, camouflageActive = false, false, false, false, false, false, false
    Platform.CanCollide = false
    Platform.Position = Vector3.new(0, -999, 0)
end)