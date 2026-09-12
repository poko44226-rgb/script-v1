-- [[ ENGINE SPIDER ACID V5.1 - SMOOTH GROUND PREDATOR ]] --
-- Features: Auto Seat Void-Kill | Aid Teammates | Dual Beast Overdrive
-- Fix: Menghapus fitur manjat (Anti-Bug / Murni Merayap Rata Tanah)
-- Credits: coolbo1 txt

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local WS = workspace

local petMode = false
local dualRampageActive = false
local dualStringActive = false
local superBeastActive = false 

local wingRemoteCache = {}
local currentCFrames = {}
local posAbyss = nil   
local posToxic = nil   
local lastSync = 0
local lastShotAbyss = 0
local lastShotToxic = 0

-- [[ CONFIGURATION MATRIX V5.1 ]] --
local BASE_ABYSS_SPEED = 24       
local BASE_TOXIC_SPEED = 18       
local BEAST_MULTIPLIER = 1.8   
local COOLDOWN_SHATTER = 0.25

-- [[ VOID BANISHER CORE (ยกมาจาก Verity) ]] --
local DEEP_VOID_Y = -9e9
local BANISH_TIME = 15
local banishActiveSeats = {}

-- [[ INTEGRATED AUTO-EAT VOID BANISH SYSTEM (จาก Verity Void Core) ]] --
local function banishSeatToVoid(seat, x, z)
    if banishActiveSeats[seat] then return end
    banishActiveSeats[seat] = true

    task.spawn(function()
        local startT = tick()
        local voidCF = CFrame.new(x, DEEP_VOID_Y, z)

        -- กระแทกซ้ำต่อเนื่อง 15 วิ กันกลับมา/กันหลุดจากหลุม
        while tick() - startT < BANISH_TIME do
            if not seat or not seat.Parent then break end
            pcall(function()
                local seatRemote = seat:FindFirstChild("SetCurrentCFrame") or seat:FindFirstChildOfClass("RemoteFunction")
                if seatRemote then
                    seatRemote:InvokeServer(voidCF)
                else
                    seat.CFrame = voidCF
                end
            end)
            task.wait()
        end

        banishActiveSeats[seat] = nil
    end)
end

local function processVoidEater(spiderPosition)
    task.spawn(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                local pRoot = p.Character:FindFirstChild("HumanoidRootPart")
                local hum = p.Character:FindFirstChildOfClass("Humanoid")

                if pRoot and hum and hum.SeatPart then
                    -- คนนั่งอยู่บนตัวแมงมุม (ใกล้ใจกลางตัว) = โดนพาวาปต่างโลก
                    if (pRoot.Position - spiderPosition.Position).Magnitude < 6 then
                        banishSeatToVoid(hum.SeatPart, pRoot.Position.X, pRoot.Position.Z)
                    end
                end
            end
        end
    end)
end

-- [[ RADAR AI CHIP: TWO PREY TRACKING ]] --
local function getTwoTargetsV5()
    local targetList = {}
    local myRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    
    for _, p in pairs(Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local tRoot = p.Character.HumanoidRootPart
            if p ~= LP then
                table.insert(targetList, tRoot)
            end
        end
    end
    
    if myRoot and #targetList > 0 then
        table.sort(targetList, function(a, b)
            return (a.Position - myRoot.Position).Magnitude < (b.Position - myRoot.Position).Magnitude
        end)
    end
    return targetList[1], targetList[2]
end

local function moveProp(index, targetCF, speed, dt, colorType)
    local prop = wingRemoteCache[index]
    if not prop or not prop.Parent then return end 
    local alpha = math.clamp(dt * speed, 0, 1)
    currentCFrames[index] = (currentCFrames[index] or targetCF):Lerp(targetCF, alpha)
    
    task.spawn(function()
        local cfRemote = prop:FindFirstChild("SetCurrentCFrame")
        if cfRemote then cfRemote:InvokeServer(currentCFrames[index]) end
        
        if tick() - lastSync > 0.15 then
            local cr = prop:FindFirstChild("ChangePropColor")
            if cr then
                if colorType == "AMETHYST" then
                    local c = superBeastActive and Color3.fromRGB(255, 0, 100) or Color3.fromRGB(140, 30, 220)
                    cr:InvokeServer(c)
                elseif colorType == "TOXIC" then
                    local c = superBeastActive and Color3.fromRGB(200, 255, 0) or Color3.fromRGB(10, 240, 50)
                    cr:InvokeServer(c)
                end
            end
        end
    end)
end

local function shootLotsWeapon(spiderPos, targetRoot)
    local foundLot = nil
    for _, v in pairs(WS:GetDescendants()) do
        if v.Name:find("001_lots") and v:FindFirstChild("SetCurrentCFrame") and not v:SetAttribute("InUse") then
            foundLot = v; break
        end
    end
    if foundLot then
        foundLot:SetAttribute("InUse", true)
        task.spawn(function()
            for i = 1, 4 do
                local currentPos = spiderPos.Position:Lerp(targetRoot.Position, i/4)
                local rot = CFrame.Angles(math.random(-180,180), math.random(-180,180), math.random(-180,180))
                foundLot.SetCurrentCFrame:InvokeServer(CFrame.new(currentPos) * rot)
                task.wait()
            end
            foundLot:SetAttribute("InUse", nil)
        end)
    end
end

-- [[ CORE HEARTBEAT RUNNER V5.1 ]] --
RS.Heartbeat:Connect(function(dt)
    if not petMode or #wingRemoteCache < 1 then return end
    local myRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    
    local t = tick()
    if not posAbyss then posAbyss = myRoot.CFrame * CFrame.new(7, 0, -10) end
    if not posToxic then posToxic = myRoot.CFrame * CFrame.new(-7, 0, -10) end
    
    local target1, target2 = getTwoTargetsV5()

    -- [[ VOID TRAP: นั่งบนบล็อก 1 หรือ 7 = วาปต่างโลกทันที (ถาวร ไม่ต้องเปิด rampage) ]] --
    do
        local coreAbyss = posAbyss and posAbyss.Position
        local coreToxic = posToxic and posToxic.Position
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                local seat = hum and hum.SeatPart
                if seat and seat:IsA("BasePart") then
                    local sp = seat.Position
                    local onAbyss = coreAbyss and (sp - coreAbyss).Magnitude < 5
                    local onToxic = coreToxic and (sp - coreToxic).Magnitude < 5
                    if onAbyss or onToxic then
                        banishSeatToVoid(seat, sp.X, sp.Z)
                    end
                end
            end
        end
    end
    
    local currentAbyssSpeed = superBeastActive and (BASE_ABYSS_SPEED * BEAST_MULTIPLIER) or BASE_ABYSS_SPEED
    local currentToxicSpeed = superBeastActive and (BASE_TOXIC_SPEED * BEAST_MULTIPLIER) or BASE_TOXIC_SPEED
    local stepSpeed = superBeastActive and 48 or 26 
    
    -- --- CONTROL ABYSS SPIDER (Murni Ground Level) ---
    if dualRampageActive and target1 then
        local lookAt = CFrame.lookAt(Vector3.new(posAbyss.Position.X, myRoot.Position.Y - 0.5, posAbyss.Position.Z), Vector3.new(target1.Position.X, myRoot.Position.Y - 0.5, target1.Position.Z))
        posAbyss = lookAt * CFrame.new(0, 0, -currentAbyssSpeed * dt)
        
        processVoidEater(posAbyss) 
        if dualStringActive and t - lastShotAbyss > COOLDOWN_SHATTER then
            lastShotAbyss = t; shootLotsWeapon(posAbyss, target1)
        end
    else
        posAbyss = posAbyss:Lerp(myRoot.CFrame * CFrame.new(7, -0.5, -12), math.clamp(dt * 5, 0, 1))
    end

    -- --- CONTROL TOXIC SPIDER (Murni Ground Level) ---
    local toxicTarget = target2 or target1
    if dualRampageActive and toxicTarget then
        local lookAt = CFrame.lookAt(Vector3.new(posToxic.Position.X, myRoot.Position.Y - 0.5, posToxic.Position.Z), Vector3.new(toxicTarget.Position.X, myRoot.Position.Y - 0.5, toxicTarget.Position.Z))
        posToxic = lookAt * CFrame.new(0, 0, -currentToxicSpeed * dt)
        
        processVoidEater(posToxic) 
        if dualStringActive and t - lastShotToxic > COOLDOWN_SHATTER then
            lastShotToxic = t; shootLotsWeapon(posToxic, toxicTarget)
        end
    else
        posToxic = posToxic:Lerp(myRoot.CFrame * CFrame.new(-7, -0.5, -12), math.clamp(dt * 5, 0, 1))
    end

    -- =========================================================================
    -- 🕷️ ANATOMY PERFECT FORMATION SYNC
    -- =========================================================================
    local waveA = math.sin(t * stepSpeed) * 1.3
    local waveB = math.cos(t * stepSpeed) * 1.3

    -- 🔮 SPIDER 1: TARANTULA ABYSS --- ---
    moveProp(1, posAbyss * CFrame.new(0, 0.6, -1.0) * CFrame.Angles(math.rad(-10), 0, 0), 16, dt, "AMETHYST") 
    moveProp(2, posAbyss * CFrame.new(0, 1.1, 1.0) * CFrame.Angles(math.rad(15), 0, 0), 16, dt, "AMETHYST")  
    moveProp(3, posAbyss * CFrame.new(2.6, 0.2 + waveA * 0.3, -0.8 + waveA * 0.4) * CFrame.Angles(0, math.rad(-45), math.rad(-40)), 15, dt, "AMETHYST")
    moveProp(4, posAbyss * CFrame.new(-2.6, 0.2 + waveB * 0.3, -0.8 + waveB * 0.4) * CFrame.Angles(0, math.rad(45), math.rad(40)), 15, dt, "AMETHYST")
    moveProp(5, posAbyss * CFrame.new(2.8, 0.2 + waveB * 0.3, 0.8 - waveB * 0.4) * CFrame.Angles(0, math.rad(45), math.rad(-40)), 15, dt, "AMETHYST")
    moveProp(6, posAbyss * CFrame.new(-2.8, 0.2 + waveA * 0.3, 0.8 - waveA * 0.4) * CFrame.Angles(0, math.rad(-45), math.rad(40)), 15, dt, "AMETHYST")

    -- 🟢 SPIDER 2: SPIDER ACID TOXIC --- ---
    moveProp(7, posToxic * CFrame.new(0, 0.6, -1.0) * CFrame.Angles(math.rad(-10), 0, 0), 16, dt, "TOXIC") 
    moveProp(8, posToxic * CFrame.new(0, 1.1, 1.0) * CFrame.Angles(math.rad(15), 0, 0), 16, dt, "TOXIC")  
    moveProp(9, posToxic * CFrame.new(2.6, 0.2 + waveB * 0.3, -0.8 + waveB * 0.4) * CFrame.Angles(0, math.rad(-45), math.rad(-40)), 15, dt, "TOXIC")
    moveProp(10, posToxic * CFrame.new(-2.6, 0.2 + waveA * 0.3, -0.8 + waveA * 0.4) * CFrame.Angles(0, math.rad(45), math.rad(40)), 15, dt, "TOXIC")
    moveProp(11, posToxic * CFrame.new(2.8, 0.2 + waveA * 0.3, 0.8 - waveA * 0.4) * CFrame.Angles(0, math.rad(45), math.rad(-40)), 15, dt, "TOXIC")
    moveProp(12, posToxic * CFrame.new(-2.6, 0.2 + waveB * 0.3, 0.8 - waveB * 0.4) * CFrame.Angles(0, math.rad(-45), math.rad(40)), 15, dt, "TOXIC")

    for i = 13, 15 do moveProp(i, CFrame.new(0, -500, 0), 5, dt, "NONE") end
    if tick() - lastSync > 0.15 then lastSync = tick() end
end)

-- [[ UI SYSTEM FRAME ]] --
local Gui = Instance.new("ScreenGui")
Gui.Name = "DualSpiderGuiV5"
Gui.ResetOnSpawn = false
Gui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 210, 0, 310)
Main.Position = UDim2.new(0.5, -105, 0.25, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 5, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
Main.Parent = Gui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local MainGrad = Instance.new("UIGradient")
MainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 0, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 30))
})
MainGrad.Parent = Main

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -10, 0, 20)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.Text = "DUAL SPIDER OVERDRIVE V5.1"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 13
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Credits = Instance.new("TextLabel")
Credits.Size = UDim2.new(1, -10, 0, 15)
Credits.Position = UDim2.new(0, 10, 0, 22)
Credits.Text = "By coolbo1 txt"
Credits.TextColor3 = Color3.fromRGB(200,200,200)
Credits.Font = Enum.Font.SourceSans
Credits.TextSize = 10
Credits.BackgroundTransparency = 1
Credits.TextXAlignment = Enum.TextXAlignment.Left
Credits.Parent = Header

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, 0, 1, -45)
Content.Position = UDim2.new(0, 0, 0, 45)
Content.BackgroundTransparency = 1
Content.Parent = Main

local function createBtn(name, y, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.9, 0, 0, 34)
    b.Position = UDim2.new(0.05, 0, 0, y)
    b.BackgroundColor3 = color or Color3.fromRGB(20, 20, 20)
    b.Text = name
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 11
    b.BackgroundTransparency = 0.3
    b.Parent = Content
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local bSummon = createBtn("SUMMON DUAL BREAKOUT", 10, Color3.fromRGB(50, 20, 70))
local bRampage = createBtn("SKILL 1: DUAL RAMPAGE (OFF)", 55)
local bString = createBtn("SKILL 2: DOUBLE LOTS STRING (OFF)", 100, Color3.fromRGB(0, 60, 20))
local bBeast = createBtn("⚠️ ACTIVATED BEAST MODE OVERDRIVE", 145, Color3.fromRGB(150, 0, 0))

-- [[ OBJECT CACHE ENGINE ]] --
local function updateCache()
    wingRemoteCache = {}
    local wsCom = WS:FindFirstChild("WorkspaceCom")
    if not wsCom then return end
    local tcCategory = wsCom:FindFirstChild("001_TrafficCones")
    local source = tcCategory and tcCategory:GetChildren() or wsCom:GetDescendants()
    
    for _, p in pairs(source) do
        if p:IsA("Model") and p:FindFirstChild("SetCurrentCFrame") and p.Name:find(LP.Name) then
            table.insert(wingRemoteCache, p)
        end
    end
    table.sort(wingRemoteCache, function(a, b) 
        return (tonumber(a.Name:match("%d+")) or 0) < (tonumber(b.Name:match("%d+")) or 0) 
    end)
end

-- [[ BUTTON TRIGGERS CONNECTORS ]] --
bSummon.MouseButton1Click:Connect(function()
    petMode = not petMode
    bSummon.Text = petMode and "DUAL CORE: ONLINE" or "SUMMON DUAL BREAKOUT"
    bSummon.BackgroundColor3 = petMode and Color3.fromRGB(20, 80, 40) or Color3.fromRGB(50, 20, 70)
    if petMode then posAbyss, posToxic = nil, nil; updateCache() end
end)

bRampage.MouseButton1Click:Connect(function()
    dualRampageActive = not dualRampageActive
    bRampage.Text = dualRampageActive and "SKILL 1: DUAL RAMPAGE (ACTIVE)" or "SKILL 1: DUAL RAMPAGE (OFF)"
    bRampage.BackgroundColor3 = dualRampageActive and Color3.fromRGB(140, 20, 20) or Color3.fromRGB(20, 20, 20)
end)

bString.MouseButton1Click:Connect(function()
    dualStringActive = not dualStringActive
    bString.Text = dualStringActive and "SKILL 2: DUAL STRING (LAUNCHING)" or "SKILL 2: DOUBLE LOTS STRING (OFF)"
    bString.BackgroundColor3 = dualStringActive and Color3.fromRGB(140, 140, 20) or Color3.fromRGB(0, 60, 20)
end)

bBeast.MouseButton1Click:Connect(function()
    superBeastActive = not superBeastActive
    bBeast.Text = superBeastActive and "OVERDRIVE: GANAS MAXIMAL" or "⚠️ ACTIVATED BEAST MODE OVERDRIVE"
    bBeast.BackgroundColor3 = superBeastActive and Color3.fromRGB(255, 30, 0) or Color3.fromRGB(150, 0, 0)
end)

task.spawn(function() 
    while true do 
        if petMode then updateCache() end
        task.wait(5) 
    end 
end)

print("🕷️ SPIDER V5.1 GROUND MASTER ACTIVATED!")