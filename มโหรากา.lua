-- [[ ENGINE RIKA PROJECT V6 - FULL BODY FIX ]] --
-- Fix: 15 Props tetap full body | Credits: CELAX MODULO
-- UI THEME: PUTIH HITAM + COLOR SYSTEM + TARGET SYSTEM

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

local isMinimized, petMode, curseProtectMode, antiLag, pureMode = false, false, false, false, false
local wingRemoteCache, currentCFrames, targetPlayer = {}, {}, nil
local activeAnim = nil
local lastSync = 0
local targetMode = "Me"
local rikaColor = "MERAH"

-- ========== WARNA UNTUK RIKA (UNGU HITAM = DARK PURPLE) ==========
local colorPresets = {
    MERAH = Color3.fromRGB(255, 0, 0),
    HITAM = Color3.fromRGB(0, 0, 0),
    HITAM_PUTIH = Color3.fromRGB(255, 255, 255),
    MAROON = Color3.fromRGB(128, 0, 0),
    BURGUNDY = Color3.fromRGB(128, 0, 32),
    DARK_RED = Color3.fromRGB(139, 0, 0),
    UNGU_HITAM = Color3.fromRGB(48, 0, 80)     -- Ungu kehitaman (gabungan ungu + hitam)
}

local colorNames = {"MERAH", "HITAM", "HITAM PUTIH", "MAROON", "BURGUNDY", "DARK RED", "UNGU HITAM"}

local function getRikaColor()
    return colorPresets[rikaColor]
end

-- ========== FUNGSI GANTI WARNA RIKA ==========
local function SetRikaColor(colorName)
    rikaColor = colorName
    if petMode then
        for i, prop in ipairs(wingRemoteCache) do
            if prop and prop.Parent then
                local colR = prop:FindFirstChild("ChangePropColor")
                if colR then
                    if rikaColor == "HITAM_PUTIH" then
                        local color = (math.floor(tick() * 2) % 2 == 0) and Color3.fromRGB(0,0,0) or Color3.fromRGB(255,255,255)
                        colR:InvokeServer(color)
                    else
                        colR:InvokeServer(colorPresets[rikaColor])
                    end
                end
            end
        end
    end
    ShowNotification("WARNA RIKA", "Warna berubah menjadi " .. colorName, 1)
end

-- ========== FUNGSI SPECIAL FOR MY FRIEND ==========
local function SpecialForMyFriend()
    local allPlayers = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP then
            table.insert(allPlayers, plr)
        end
    end
    
    if #allPlayers > 0 then
        local random = allPlayers[math.random(1, #allPlayers)]
        targetPlayer = random
        TargetBox.Text = random.Name
        targetMode = "Manual"
        TargetModeBtn.Text = "TARGET: MANUAL"
        ShowNotification("SPECIAL FOR MY FRIEND", "Target: " .. random.Name, 1.5)
    else
        ShowNotification("SPECIAL FOR MY FRIEND", "Tidak ada pemain lain di server!", 1.5)
    end
end

-- ========== FUNGSI NOTIF ==========
local function ShowNotification(title, text, duration)
    duration = duration or 2
    local notifGui = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
    notifGui.IgnoreGuiInset = true
    
    local frame = Instance.new("Frame", notifGui)
    frame.Size = UDim2.new(0, 250, 0, 40)
    frame.Position = UDim2.new(0.5, -125, 0.85, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    frame.BackgroundTransparency = 0.1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local titleLabel = Instance.new("TextLabel", frame)
    titleLabel.Size = UDim2.new(1, -10, 0, 18)
    titleLabel.Position = UDim2.new(0, 5, 0, 2)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    titleLabel.TextSize = 11
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, -10, 0, 18)
    textLabel.Position = UDim2.new(0, 5, 0, 20)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextSize = 10
    textLabel.Font = Enum.Font.Gotham
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    task.wait(duration)
    notifGui:Destroy()
end

-- ========== FUNGSI MAHORAGA SKILL ==========
local function MahoragaSkill()
    local notif = Instance.new("TextLabel", LP:WaitForChild("PlayerGui"))
    notif.Size = UDim2.new(0, 280, 0, 40)
    notif.Position = UDim2.new(0.5, -140, 0.4, 0)
    notif.Text = "MAHORAGA SKILL ACTIVATED! LOADING..."
    notif.TextColor3 = Color3.fromRGB(255, 215, 0)
    notif.Font = Enum.Font.GothamBold
    notif.TextSize = 14
    notif.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    notif.BackgroundTransparency = 0.3
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 10)
    
    task.spawn(function()
        loadstring(game:HttpGet("https://pastefy.app/wGrcuwH6/raw"))()
    end)
    
    task.wait(1.5)
    notif:Destroy()
end

-- [[ ANIMATION ]] --
local function playAnim(id, loop)
    if activeAnim then activeAnim:Stop() end
    local char = LP.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://"..id
        activeAnim = hum:LoadAnimation(anim)
        activeAnim.Looped = loop or false
        activeAnim:Play()
    end
end

-- [[ GRADIENT HITAM PUTIH ]] --
local COLORS = {
    Color3.fromRGB(30, 30, 30),
    Color3.fromRGB(80, 80, 80),
    Color3.fromRGB(160, 160, 160),
    Color3.fromRGB(255, 255, 255)
}

local function getGradientColor(t, offset)
    local cycle = (t * 0.4 + (offset * 0.1)) % 1
    if cycle < 0.33 then return COLORS[1]:Lerp(COLORS[2], cycle/0.33)
    elseif cycle < 0.66 then return COLORS[2]:Lerp(COLORS[3], (cycle-0.33)/0.33)
    else return COLORS[3]:Lerp(COLORS[4], (cycle-0.66)/0.34) end
end

-- [[ VOID SENTENCE LOGIC ]] --
local function checkSeatedTarget()
    if not (pureMode or curseProtectMode) then return end
    for _, prop in ipairs(wingRemoteCache) do
        local seat = prop:FindFirstChildOfClass("Seat") or prop:FindFirstChildOfClass("VehicleSeat")
        if seat and seat.Occupant then
            local char = seat.Occupant.Parent
            local targetLP = Players:GetPlayerFromCharacter(char)
            if targetLP and targetLP ~= LP then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = CFrame.new(0, -9e9, 0) end
            end
        end
    end
end

-- [[ UI CONSTRUCTION ]] --
local Gui = Instance.new("ScreenGui", game.CoreGui)
local Main = Instance.new("Frame", Gui)
Main.Size, Main.Position = UDim2.new(0, 190, 0, 520), UDim2.new(0.5, -95, 0.35, 0)
Main.BackgroundColor3, Main.BorderSizePixel = Color3.new(1,1,1), 0
Main.Active, Main.Draggable, Main.ClipsDescendants = true, true, true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local MainGrad = Instance.new("UIGradient", Main)
MainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, COLORS[1]),
    ColorSequenceKeypoint.new(0.3, COLORS[2]),
    ColorSequenceKeypoint.new(0.6, COLORS[3]),
    ColorSequenceKeypoint.new(1, COLORS[4])
})

task.spawn(function()
    while true do
        local tw = TS:Create(MainGrad, TweenInfo.new(3, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
        tw:Play()
        tw.Completed:Wait()
        MainGrad.Offset = Vector2.new(-1, 0)
    end
end)

-- [[ HEADER ]] --
local Header = Instance.new("Frame", Main); Header.Size = UDim2.new(1, 0, 0, 40); Header.BackgroundTransparency = 1
local Title = Instance.new("TextLabel", Header)
Title.Size, Title.Position = UDim2.new(1, -35, 0, 20), UDim2.new(0, 10, 0, 5)
Title.Text, Title.TextColor3, Title.Font, Title.TextSize = "ENGINE RIKA PROJECT V6", Color3.new(0,0,0), "SourceSansBold", 13
Title.BackgroundTransparency, Title.TextXAlignment = 1, "Left"

local Credits = Instance.new("TextLabel", Header)
Credits.Size, Credits.Position = UDim2.new(1, -35, 0, 15), UDim2.new(0, 10, 0, 20)
Credits.Text, Credits.TextColor3, Credits.Font, Credits.TextSize = "Credits: CELAX MODULO", Color3.fromRGB(80,80,80), "SourceSans", 10
Credits.BackgroundTransparency, Credits.TextXAlignment = 1, "Left"

local MinBtn = Instance.new("TextButton", Header)
MinBtn.Size, MinBtn.Position = UDim2.new(0, 22, 0, 22), UDim2.new(1, -28, 0, 9)
MinBtn.BackgroundColor3, MinBtn.Text, MinBtn.TextColor3 = Color3.new(0,0,0), "▲", Color3.new(255,255,255)
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1, 0)

local Content = Instance.new("Frame", Main)
Content.Size, Content.Position, Content.BackgroundTransparency = UDim2.new(1, 0, 1, -40), UDim2.new(0, 0, 0, 40), 1

-- [[ TARGET SYSTEM ]] --
local TargetBox = Instance.new("TextBox", Content)
TargetBox.Size, TargetBox.Position = UDim2.new(0.9, 0, 0, 25), UDim2.new(0.05, 0, 0, 5)
TargetBox.BackgroundColor3, TargetBox.Text, TargetBox.PlaceholderText = Color3.new(0,0,0), "", "Target Name (Username or Display)..."
TargetBox.TextColor3, TargetBox.Font, TargetBox.TextSize, TargetBox.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 9, 0.3
Instance.new("UICorner", TargetBox).CornerRadius = UDim.new(0, 6)

-- Baris tombol target
local TargetButtonBar = Instance.new("Frame", Content)
TargetButtonBar.Size = UDim2.new(0.9, 0, 0, 20)
TargetButtonBar.Position = UDim2.new(0.05, 0, 0, 33)
TargetButtonBar.BackgroundTransparency = 1

local TargetModeBtn = Instance.new("TextButton", TargetButtonBar)
TargetModeBtn.Size = UDim2.new(0.48, 0, 1, 0)
TargetModeBtn.Position = UDim2.new(0, 0, 0, 0)
TargetModeBtn.BackgroundColor3, TargetModeBtn.Text = Color3.new(0,0,0), "TARGET: ME"
TargetModeBtn.TextColor3, TargetModeBtn.Font, TargetModeBtn.TextSize, TargetModeBtn.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 9, 0.2
Instance.new("UICorner", TargetModeBtn).CornerRadius = UDim.new(0, 4)

local SpecialFriendBtn = Instance.new("TextButton", TargetButtonBar)
SpecialFriendBtn.Size = UDim2.new(0.48, 0, 1, 0)
SpecialFriendBtn.Position = UDim2.new(0.52, 0, 0, 0)
SpecialFriendBtn.BackgroundColor3, SpecialFriendBtn.Text = Color3.new(0,0,0), "SPECIAL FOR MY FRIEND"
SpecialFriendBtn.TextColor3, SpecialFriendBtn.Font, SpecialFriendBtn.TextSize, SpecialFriendBtn.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 8, 0.2
Instance.new("UICorner", SpecialFriendBtn).CornerRadius = UDim.new(0, 4)

TargetBox.FocusLost:Connect(function(ep)
    if ep and targetMode == "Manual" then
        local s = TargetBox.Text:lower()
        local found = false
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():find(s) or p.DisplayName:lower():find(s) then
                TargetBox.Text = p.Name
                targetPlayer = p
                found = true
                break
            end
        end
        if not found then
            TargetBox.Text = ""
            targetPlayer = nil
        end
    end
end)

TargetModeBtn.MouseButton1Click:Connect(function()
    if targetMode == "Me" then
        targetMode = "Manual"
        TargetModeBtn.Text = "TARGET: MANUAL"
    else
        targetMode = "Me"
        TargetModeBtn.Text = "TARGET: ME"
        targetPlayer = nil
        TargetBox.Text = ""
    end
end)

SpecialFriendBtn.MouseButton1Click:Connect(function()
    SpecialForMyFriend()
end)

local function createBtn(name, pos, color)
    local b = Instance.new("TextButton", Content)
    b.Size, b.Position = UDim2.new(0.9, 0, 0, 35), pos
    b.BackgroundColor3, b.Text = color or Color3.new(0,0,0), name
    b.TextColor3, b.Font, b.TextSize, b.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 11, 0.2
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local bCurse = createBtn("Summon Rika", UDim2.new(0.05, 0, 0, 60))
local bPure = createBtn("True Love [Laser]", UDim2.new(0.05, 0, 0, 100), Color3.new(0,0,0))
local bCurseProtect = createBtn("Curse Protect", UDim2.new(0.05, 0, 0, 140), Color3.new(0,0,0))

-- BARIS WARNA (2 baris)
local ColorBar1 = Instance.new("Frame", Content)
ColorBar1.Size = UDim2.new(0.9, 0, 0, 35)
ColorBar1.Position = UDim2.new(0.05, 0, 0, 180)
ColorBar1.BackgroundTransparency = 1

-- Baris 1: MERAH, HITAM, HITAM PUTIH
local btnMerah = Instance.new("TextButton", ColorBar1)
btnMerah.Size = UDim2.new(0.31, -2, 1, 0)
btnMerah.Position = UDim2.new(0, 0, 0, 0)
btnMerah.BackgroundColor3, btnMerah.Text = Color3.new(0,0,0), "MERAH"
btnMerah.TextColor3, btnMerah.Font, btnMerah.TextSize, btnMerah.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 10, 0.2
Instance.new("UICorner", btnMerah).CornerRadius = UDim.new(0, 4)

local btnHitam = Instance.new("TextButton", ColorBar1)
btnHitam.Size = UDim2.new(0.31, -2, 1, 0)
btnHitam.Position = UDim2.new(0.33, 0, 0, 0)
btnHitam.BackgroundColor3, btnHitam.Text = Color3.new(0,0,0), "HITAM"
btnHitam.TextColor3, btnHitam.Font, btnHitam.TextSize, btnHitam.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 10, 0.2
Instance.new("UICorner", btnHitam).CornerRadius = UDim.new(0, 4)

local btnHitamPutih = Instance.new("TextButton", ColorBar1)
btnHitamPutih.Size = UDim2.new(0.31, -2, 1, 0)
btnHitamPutih.Position = UDim2.new(0.66, 0, 0, 0)
btnHitamPutih.BackgroundColor3, btnHitamPutih.Text = Color3.new(0,0,0), "HITAM PUTIH"
btnHitamPutih.TextColor3, btnHitamPutih.Font, btnHitamPutih.TextSize, btnHitamPutih.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 9, 0.2
Instance.new("UICorner", btnHitamPutih).CornerRadius = UDim.new(0, 4)

-- Baris 2: MAROON, BURGUNDY, DARK RED, UNGU HITAM
local ColorBar2 = Instance.new("Frame", Content)
ColorBar2.Size = UDim2.new(0.9, 0, 0, 35)
ColorBar2.Position = UDim2.new(0.05, 0, 0, 218)
ColorBar2.BackgroundTransparency = 1

local btnMaroon = Instance.new("TextButton", ColorBar2)
btnMaroon.Size = UDim2.new(0.23, -2, 1, 0)
btnMaroon.Position = UDim2.new(0, 0, 0, 0)
btnMaroon.BackgroundColor3, btnMaroon.Text = Color3.new(0,0,0), "MAROON"
btnMaroon.TextColor3, btnMaroon.Font, btnMaroon.TextSize, btnMaroon.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 10, 0.2
Instance.new("UICorner", btnMaroon).CornerRadius = UDim.new(0, 4)

local btnBurgundy = Instance.new("TextButton", ColorBar2)
btnBurgundy.Size = UDim2.new(0.23, -2, 1, 0)
btnBurgundy.Position = UDim2.new(0.24, 0, 0, 0)
btnBurgundy.BackgroundColor3, btnBurgundy.Text = Color3.new(0,0,0), "BURGUNDY"
btnBurgundy.TextColor3, btnBurgundy.Font, btnBurgundy.TextSize, btnBurgundy.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 9, 0.2
Instance.new("UICorner", btnBurgundy).CornerRadius = UDim.new(0, 4)

local btnDarkRed = Instance.new("TextButton", ColorBar2)
btnDarkRed.Size = UDim2.new(0.23, -2, 1, 0)
btnDarkRed.Position = UDim2.new(0.48, 0, 0, 0)
btnDarkRed.BackgroundColor3, btnDarkRed.Text = Color3.new(0,0,0), "DARK RED"
btnDarkRed.TextColor3, btnDarkRed.Font, btnDarkRed.TextSize, btnDarkRed.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 10, 0.2
Instance.new("UICorner", btnDarkRed).CornerRadius = UDim.new(0, 4)

local btnUnguHitam = Instance.new("TextButton", ColorBar2)
btnUnguHitam.Size = UDim2.new(0.23, -2, 1, 0)
btnUnguHitam.Position = UDim2.new(0.72, 0, 0, 0)
btnUnguHitam.BackgroundColor3, btnUnguHitam.Text = Color3.new(0,0,0), "UNGU HITAM"
btnUnguHitam.TextColor3, btnUnguHitam.Font, btnUnguHitam.TextSize, btnUnguHitam.BackgroundTransparency = Color3.new(255,255,255), "SourceSansBold", 9, 0.2
Instance.new("UICorner", btnUnguHitam).CornerRadius = UDim.new(0, 4)

btnMerah.MouseButton1Click:Connect(function() SetRikaColor("MERAH") end)
btnHitam.MouseButton1Click:Connect(function() SetRikaColor("HITAM") end)
btnHitamPutih.MouseButton1Click:Connect(function() SetRikaColor("HITAM_PUTIH") end)
btnMaroon.MouseButton1Click:Connect(function() SetRikaColor("MAROON") end)
btnBurgundy.MouseButton1Click:Connect(function() SetRikaColor("BURGUNDY") end)
btnDarkRed.MouseButton1Click:Connect(function() SetRikaColor("DARK_RED") end)
btnUnguHitam.MouseButton1Click:Connect(function() SetRikaColor("UNGU_HITAM") end)

local bAntiLag = createBtn("ANTI-LAG SERVER", UDim2.new(0.05, 0, 0, 295), Color3.new(0,0,0))
local bMahoraga = createBtn("Mahoraga Skill Adapting", UDim2.new(0.05, 0, 0, 335), Color3.new(0,0,0))

-- [[ STATUS BAR DI BAWAH ]] --
local StatusBar = Instance.new("Frame", Main)
StatusBar.Size = UDim2.new(1, 0, 0, 20)
StatusBar.Position = UDim2.new(0, 0, 1, -20)
StatusBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
StatusBar.BackgroundTransparency = 0
Instance.new("UICorner", StatusBar).CornerRadius = UDim.new(0, 0)

local StatusText = Instance.new("TextLabel", StatusBar)
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.Text = "ENGINE RIKA PROJECT V6 | 87%"
StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 8
StatusText.BackgroundTransparency = 1

-- [[ RIKA DATA ]] --
local baseRef = CFrame.new(-123.344, 22.311, -45.023)
local function getOffset(currentCF) return baseRef:ToObjectSpace(currentCF) end

local RikaLego = {
    Head1 = getOffset(CFrame.new(-124.9, 20.311, -54.0, 0.157, -0.030, 0.987, 0.136, -0.989, -0.052, 0.978, 0.143, -0.151)),
    Head2 = getOffset(CFrame.new(-124.9, 15.611, -54.2, 0.128, 0, -0.991, 0, 1, 0, 0.991, 0, 0.128)),
    JawOpen = getOffset(CFrame.new(-124.9, 13.611, -51.7, 0.094, -0.015, -0.995, 0.380, 0.924, 0.033, 0.919, -0.392, 0.099)),
    BodyMid = getOffset(CFrame.new(-123.648, 13.441, -42.100, 0.041, -0.029, 0.998, -0.783, -0.621, 0.014, 0.620, -0.782, -0.048)),
    BodyTop = getOffset(CFrame.new(-123.188, 10.532, -42.058, -0.017, 0.885, 0.464, -0.801, -0.290, 0.523, 0.597, -0.362, 0.714)),
    BodyBot = getOffset(CFrame.new(-123.946, 10.314, -42.487, -0.077, -0.959, -0.271, 0.740, -0.237, 0.629, -0.668, -0.152, 0.728)),
    ArmR1 = getOffset(CFrame.new(-127.969, 12.386, -46.190, 0.881, -0.231, -0.412, 0.418, 0.787, 0.452, 0.219, -0.571, 0.790)),
    ArmR2 = getOffset(CFrame.new(-128.625, 7.399, -48.148, -0.786, -0.278, -0.551, 0.358, 0.521, -0.774, 0.503, -0.806, -0.310)),
    ArmL1 = getOffset(CFrame.new(-119.358, 14.090, -49.189, -0.415, -0.569, -0.709, 0.235, 0.685, -0.688, 0.878, -0.453, -0.150)),
    ArmL2 = getOffset(CFrame.new(-120.394, 9.930, -56.302, 0.633, -0.733, -0.246, 0.503, 0.632, -0.588, 0.587, 0.248, 0.769)),
    Tail = getOffset(CFrame.new(-123.060, 2.186, -34.023, 0.031, -0.027, -0.999, -0.534, 0.844, -0.040, 0.844, 0.535, 0.011)),
}

local RikaWalk = {
    L1 = getOffset(CFrame.new(-119.637, 11.356, -51.452, -0.165, 0.572, -0.802, 0.635, 0.684, 0.357, 0.754, -0.451, -0.477)),
    L2 = getOffset(CFrame.new(-122.213, 5.717, -54.026, 0.777, -0.600, -0.185, 0.297, 0.091, 0.950, -0.553, -0.794, 0.249)),
    R1 = getOffset(CFrame.new(-130.782, 12.306, -43.430, 0.725, -0.649, 0.226, 0.488, 0.718, 0.495, -0.484, -0.249, 0.838)),
    R2 = getOffset(CFrame.new(-139.161, 5.042, -40.774, 0.618, -0.278, -0.734, 0.739, 0.521, 0.425, 0.264, -0.806, 0.528))
}

-- [[ PROPERTY MOVER ]] --
local function moveProp(index, targetCF, alpha)
    local prop = wingRemoteCache[index]
    if not prop or not prop.Parent then return end 
    currentCFrames[index] = (currentCFrames[index] or targetCF):Lerp(targetCF, alpha or 0.2)
    task.spawn(function()
        local cfRemote = prop:FindFirstChild("SetCurrentCFrame")
        if cfRemote then cfRemote:InvokeServer(currentCFrames[index]) end
        if tick() - lastSync > 0.15 then
            local cr = prop:FindFirstChild("ChangePropColor")
            if cr then 
                if rikaColor == "HITAM_PUTIH" then
                    local color = (math.floor(tick() * 2) % 2 == 0) and Color3.fromRGB(0,0,0) or Color3.fromRGB(255,255,255)
                    cr:InvokeServer(color)
                else
                    cr:InvokeServer(colorPresets[rikaColor])
                end
            end
        end
    end)
end

-- [[ FUNGSI ASSIGN PROP ]] --
local function getPropIndex(partId, totalProps)
    if totalProps >= 10 then
        return partId
    else
        local mapping = {
            [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 5,
            [6] = 6, [7] = 7, [8] = 8, [9] = 9, [10] = 10
        }
        return mapping[partId] or (partId > 10 and 10 or partId)
    end
end

-- [[ ENGINE ]] --
RS.Heartbeat:Connect(function()
    if not petMode or #wingRemoteCache < 1 then return end
    
    -- TARGET CHAR
    local targetChar
    if targetMode == "Me" then
        targetChar = LP.Character
    else
        if targetPlayer and targetPlayer.Character then
            targetChar = targetPlayer.Character
        else
            targetChar = LP.Character
        end
    end
    
    local root = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local t, vel = tick(), root.AssemblyLinearVelocity.Magnitude
    local alpha = 0.25
    local totalProps = #wingRemoteCache
    
    checkSeatedTarget()

    if pureMode then
        local beamCenter = root.CFrame * CFrame.new(0, 1.5, -2)
        for i = 1, totalProps do
            moveProp(i, beamCenter * CFrame.new(0, 0, -(i * 2.5)) * CFrame.Angles(0, 0, (t*160) + (i*0.5)) * CFrame.Angles(math.rad(90), 0, 0), 0.7)
        end
    else
        local currentBase = root.CFrame * CFrame.new(6, 12.5 + (math.sin(t*5)*0.6), 7)
        
        for i = 1, totalProps do
            local partId = getPropIndex(i, totalProps)
            
            if partId == 1 then 
                moveProp(i, currentBase * RikaLego.Head1, alpha)
            elseif partId == 2 then 
                moveProp(i, currentBase * RikaLego.Head2:Lerp(RikaLego.JawOpen, (math.sin(t*4)+1)/2), alpha)
            elseif partId == 3 then 
                moveProp(i, currentBase * RikaLego.BodyMid, alpha)
            elseif partId == 4 then 
                moveProp(i, currentBase * RikaLego.BodyTop, alpha)
            elseif partId == 5 then 
                moveProp(i, currentBase * RikaLego.BodyBot, alpha)
            elseif partId >= 6 and partId <= 9 then
                if curseProtectMode and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local tr = targetPlayer.Character.HumanoidRootPart
                    local attackPos = CFrame.new(tr.Position + (tr.AssemblyLinearVelocity * 0.15))
                    local offsets = {CFrame.new(-1.2, 0, -2.5), CFrame.new(1.2, 0, -2.5), CFrame.new(0, 1.5, -2.5), CFrame.new(0, -1.5, -2.5)}
                    local armIdx = (partId - 6) % 4 + 1
                    moveProp(i, attackPos * offsets[armIdx], 0.9)
                elseif vel > 2 then
                    local wc = math.sin(t*15)*30
                    local walkAnims = {RikaWalk.R1 * CFrame.Angles(math.rad(wc), 0, 0), RikaWalk.R2 * CFrame.Angles(math.rad(-wc), 0, 0), RikaWalk.L1 * CFrame.Angles(math.rad(-wc), 0, 0), RikaWalk.L2 * CFrame.Angles(math.rad(wc), 0, 0)}
                    local armIdx = (partId - 6) % 4 + 1
                    moveProp(i, currentBase * walkAnims[armIdx], alpha)
                else
                    local sway = CFrame.Angles(0, 0, math.rad(math.sin(t*2.5)*7))
                    local idleAnims = {RikaLego.ArmR1 * sway, RikaLego.ArmR2 * sway, RikaLego.ArmL1 * sway:Inverse(), RikaLego.ArmL2 * sway:Inverse()}
                    local armIdx = (partId - 6) % 4 + 1
                    moveProp(i, currentBase * idleAnims[armIdx], alpha)
                end
            elseif partId == 10 then 
                moveProp(i, currentBase * RikaLego.Tail, alpha)
            else
                local auraSway = CFrame.new(0, math.sin(t+i)*0.5, 0) * CFrame.Angles(0, 0, math.rad(math.sin(t*2)*10))
                moveProp(i, currentBase * RikaLego.Tail * CFrame.new(0, 0, -(i-10)*1.5) * auraSway, alpha)
            end
        end
    end
    if tick() - lastSync > 0.15 then lastSync = tick() end
end)

-- [[ SCANNER ]] --
local function updatePropCache()
    local temp = {}
    local wsCom = workspace:FindFirstChild("WorkspaceCom")
    if not wsCom then return end
    
    local targetCategory = wsCom:FindFirstChild("001_TrafficCones")
    if targetCategory then
        for _, p in pairs(targetCategory:GetChildren()) do
            if p:FindFirstChild("SetCurrentCFrame") and p.Name:find(LP.Name) then
                table.insert(temp, p)
            end
        end
    else
        for _, cat in pairs(wsCom:GetChildren()) do
            for _, p in pairs(cat:GetChildren()) do
                if p:FindFirstChild("SetCurrentCFrame") and p.Name:find(LP.Name) then
                    table.insert(temp, p)
                end
            end
        end
    end
    
    table.sort(temp, function(a, b)
        local numA = tonumber(a.Name:match("%d+")) or 0
        local numB = tonumber(b.Name:match("%d+")) or 0
        return numA < numB
    end)
    
    wingRemoteCache = temp
    print("Props found: "..#temp)
end

-- [[ BUTTON EVENTS ]] --
bCurse.MouseButton1Click:Connect(function()
    petMode = not petMode; bCurse.Text = petMode and "RIKA: ACTIVE" or "Summon Rika"
    if petMode then updatePropCache(); playAnim("131394054896531", false) end
end)

bPure.MouseButton1Click:Connect(function()
    pureMode = not pureMode; bPure.Text = pureMode and "TRUE LOVE ACTIVE ❤️" or "True Love [Laser]"
    if pureMode then playAnim("132403499220167", true) elseif activeAnim then activeAnim:Stop() end
end)

bCurseProtect.MouseButton1Click:Connect(function() 
    curseProtectMode = not curseProtectMode; bCurseProtect.Text = curseProtectMode and "CURSE PROTECT: ACTIVE" or "Curse Protect" 
end)

bAntiLag.MouseButton1Click:Connect(function() 
    antiLag = not antiLag; bAntiLag.Text = antiLag and "ANTI-LAG: ON" or "ANTI-LAG SERVER" 
    if antiLag then 
        for _, v in ipairs(workspace:GetChildren()) do 
            if v.Name == "Bomb" or v.Name == "Rocket" then v:Destroy() end 
        end 
    end
end)

bMahoraga.MouseButton1Click:Connect(function()
    MahoragaSkill()
end)

MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized; MinBtn.Text = isMinimized and "▼" or "▲"
    TS:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {Size = isMinimized and UDim2.new(0, 190, 0, 40) or UDim2.new(0, 190, 0, 520)}):Play()
    Content.Visible = not isMinimized
end)

-- Auto update cache
task.spawn(function()
    while true do 
        if petMode then updatePropCache() end
        task.wait(5) 
    end
end)

print("✅ ENGINE RIKA PROJECT V6 - PUTIH HITAM THEME + COLOR SYSTEM + SPECIAL FOR MY FRIEND + SUMMON RIKA LOADED")