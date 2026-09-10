local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local Gui = Instance.new("ScreenGui", gethui and gethui() or LP:WaitForChild("PlayerGui"))
Gui.Name = "QuantumShieldV1_Mini"

local targetPlayer = nil
local active = false
local deathPenalty = false
local isMinimized = false
local remoteCache = {}
local currentIdx = 1

-- [[ UI HELPER: GLOW / GRADIENT ANIMATION ]] --
local function applyGlow(gradient)
    task.spawn(function()
        while gradient and gradient.Parent do
            local t = TweenService:Create(gradient, TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Offset = Vector2.new(1, 0)})
            t:Play()
            t.Completed:Wait()
            if gradient and gradient.Parent then
                gradient.Offset = Vector2.new(-1, 0)
            end
        end
    end)
end

-- [[ MAIN CONTAINER (LINGKARAN UTAMA - KECIL) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 140, 0, 140) -- Skala lebih kecil (140x140)
Main.Position = UDim2.new(0.5, -70, 0.5, -70)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true 
Main.ClipsDescendants = true

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(1, 0)

local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(15, 45, 105)
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local BlueGrad = Instance.new("UIGradient", Main)
BlueGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 15, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 60, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 15, 40))
})
BlueGrad.Rotation = 45
applyGlow(BlueGrad)

-- [[ FOLDER / MINIMIZE BUTTON ]] --
local FoldBtn = Instance.new("TextButton", Gui)
FoldBtn.Size = UDim2.new(0, 24, 0, 24)
FoldBtn.Position = UDim2.new(0.5, 45, 0.5, -65) -- Menempel di pojok kanan atas UI
FoldBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 105)
FoldBtn.Text = "-"
FoldBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FoldBtn.Font = Enum.Font.SourceSansBold
FoldBtn.TextSize = 16
FoldBtn.ZIndex = 10

local FoldCorner = Instance.new("UICorner", FoldBtn)
FoldCorner.CornerRadius = UDim.new(1, 0)

local FoldStroke = Instance.new("UIStroke", FoldBtn)
FoldStroke.Thickness = 1
FoldStroke.Color = Color3.fromRGB(255, 255, 255)

-- Hubungkan posisi tombol Lipat dengan Dragging UI Utama
Main:GetPropertyChangedSignal("Position"):Connect(function()
    FoldBtn.Position = UDim2.new(Main.Position.X.Scale, Main.Position.X.Offset + 45, Main.Position.Y.Scale, Main.Position.Y.Offset - 65)
end)

-- [[ TITLE LABEL ]] --
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(0.8, 0, 0, 20)
Title.Position = UDim2.new(0.1, 0, 0.1, 0)
Title.BackgroundTransparency = 1
Title.Text = "TRAP VOID V1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 12

-- [[ TOGGLE PENALTY (+ / -) BUTTON ]] --
local PlusBtn = Instance.new("TextButton", Main)
PlusBtn.Size = UDim2.new(0, 18, 0, 18)
PlusBtn.Position = UDim2.new(0.5, -9, 0.26, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.Font = Enum.Font.SourceSansBold
PlusBtn.TextSize = 12

local PlusCorner = Instance.new("UICorner", PlusBtn)
PlusCorner.CornerRadius = UDim.new(1, 0)

local PlusStroke = Instance.new("UIStroke", PlusBtn)
PlusStroke.Thickness = 1
PlusStroke.Color = Color3.fromRGB(0, 120, 255)

-- [[ PENALTY BADGE / INDICATOR ]] --
local PenaltyFrame = Instance.new("Frame", Main)
PenaltyFrame.Size = UDim2.new(0.7, 0, 0, 14)
PenaltyFrame.Position = UDim2.new(0.15, 0, 0.40, 0)
PenaltyFrame.BackgroundColor3 = Color3.fromRGB(15, 45, 105)
PenaltyFrame.BorderSizePixel = 0
PenaltyFrame.Visible = false

local PenaltyCorner = Instance.new("UICorner", PenaltyFrame)
PenaltyCorner.CornerRadius = UDim.new(0.5, 0)

local PenaltyLabel = Instance.new("TextLabel", PenaltyFrame)
PenaltyLabel.Size = UDim2.new(1, 0, 1, 0)
PenaltyLabel.BackgroundTransparency = 1
PenaltyLabel.Text = "CHAOS MODE"
PenaltyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PenaltyLabel.Font = Enum.Font.SourceSansBold
PenaltyLabel.TextSize = 8

-- [[ INPUT TARGET BOX ]] --
local Box = Instance.new("TextBox", Main)
Box.Size = UDim2.new(0.75, 0, 0, 20)
Box.Position = UDim2.new(0.125, 0, 0.52, 0)
Box.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
Box.PlaceholderText = "Target Name"
Box.PlaceholderColor3 = Color3.fromRGB(120, 140, 180)
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.Font = Enum.Font.SourceSans
Box.TextSize = 11

local BoxCorner = Instance.new("UICorner", Box)
BoxCorner.CornerRadius = UDim.new(0.4, 0)

local BoxStroke = Instance.new("UIStroke", Box)
BoxStroke.Thickness = 1
BoxStroke.Color = Color3.fromRGB(30, 70, 150)

-- [[ ACTIVATE / STOP BUTTON ]] --
local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.65, 0, 0, 22)
Button.Position = UDim2.new(0.175, 0, 0.72, 0)
Button.BackgroundColor3 = Color3.fromRGB(15, 45, 105)
Button.Text = "ACTIVATE"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSansBold
Button.TextSize = 11

local BtnCorner = Instance.new("UICorner", Button)
BtnCorner.CornerRadius = UDim.new(0.5, 0)

local BtnStroke = Instance.new("UIStroke", Button)
BtnStroke.Thickness = 1
BtnStroke.Color = Color3.fromRGB(255, 255, 255)

-- [[ LOGIKA ENGINE REQUISITES ]] --
local function updateRemotes()
    local temp = {}
    local wsCom = Workspace:FindFirstChild("WorkspaceCom")
    if not wsCom then return end
    for _, cat in pairs(wsCom:GetChildren()) do
        for _, p in pairs(cat:GetChildren()) do
            if p:FindFirstChild("SetCurrentCFrame") then 
                table.insert(temp, p.SetCurrentCFrame) 
            end
        end
    end
    remoteCache = temp
end

local function quantumSync()
    if not targetPlayer or not targetPlayer.Character or #remoteCache == 0 then return end
    local char = targetPlayer.Character
    local tRoot = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not tRoot or not hum then return end
    
    local distToFloor = (hum.HipHeight + (tRoot.Size.Y / 2))
    local velocity = tRoot.AssemblyLinearVelocity
    local predictedPos = tRoot.CFrame + (velocity * 0.175)
    
    if hum.Sit then
        predictedPos = CFrame.new(predictedPos.X, -50000, predictedPos.Z)
    end
    
    local remote = remoteCache[currentIdx]
    if remote then
        local mIdx = ((currentIdx - 1) % 10) + 1
        local fPos
        
        if deathPenalty then
            local speed = tick() * 40
            local randomSpin = CFrame.Angles(
                math.sin(speed + (mIdx * 0.5)) * 5,
                math.cos(speed + (mIdx * 0.8)) * 5, 
                math.tan(speed + (mIdx * 0.2)) * 0.5
            )
            fPos = predictedPos * randomSpin
        else
            local Y_Ground = -distToFloor
            local Y_Top = 10
            
            if mIdx == 1 then fPos = predictedPos * CFrame.new(0, Y_Ground, -18)
            elseif mIdx == 2 then fPos = predictedPos * CFrame.new(0, Y_Ground, 14)
            elseif mIdx == 3 then fPos = predictedPos * CFrame.new(7.5, Y_Ground, -10) * CFrame.Angles(0, 1.57, 0)
            elseif mIdx == 4 then fPos = predictedPos * CFrame.new(7.5, Y_Ground, 6) * CFrame.Angles(0, 1.57, 0)
            elseif mIdx == 5 then fPos = predictedPos * CFrame.new(-7.5, Y_Ground, -10) * CFrame.Angles(0, 1.57, 0)
            elseif mIdx == 6 then fPos = predictedPos * CFrame.new(-7.5, Y_Ground, 6) * CFrame.Angles(0, 1.57, 0)
            elseif mIdx == 7 then fPos = predictedPos * CFrame.new(0, Y_Ground, -2) * CFrame.Angles(1.57, 0, 0)
            elseif mIdx == 8 then fPos = predictedPos * CFrame.new(0, Y_Ground, -18) * CFrame.Angles(1.57, 0, 0)
            elseif mIdx == 9 then fPos = predictedPos * CFrame.new(0, Y_Top, -2) * CFrame.Angles(1.57, 0, 0)
            elseif mIdx == 10 then fPos = predictedPos * CFrame.new(0, Y_Top, -18) * CFrame.Angles(1.57, 0, 0)
            end
        end
        task.spawn(function() pcall(function() remote:InvokeServer(fPos) end) end)
    end
    currentIdx = (currentIdx % #remoteCache) + 1
end

-- [[ INTERAKSI UI ]] --

-- LOGIKA MINIMIZE / LIPAT UI
FoldBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    FoldBtn.Text = isMinimized and "+" or "-"
    
    if isMinimized then
        Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
    else
        Main:TweenSize(UDim2.new(0, 140, 0, 140), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
    end
end)

PlusBtn.MouseButton1Click:Connect(function()
    deathPenalty = not deathPenalty
    PenaltyFrame.Visible = deathPenalty
    PlusBtn.Text = deathPenalty and "-" or "+"
    
    if deathPenalty then
        PlusStroke.Color = Color3.fromRGB(255, 60, 60)
        PlusBtn.TextColor3 = Color3.fromRGB(255, 60, 60)
    else
        PlusStroke.Color = Color3.fromRGB(0, 120, 255)
        PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
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

Button.MouseButton1Click:Connect(function()
    active = not active
    Button.Text = active and "STOP" or "ACTIVATE"
    Button.BackgroundColor3 = active and Color3.fromRGB(180, 30, 30) or Color3.fromRGB(15, 45, 105)
    
    if active then updateRemotes() end
end)

-- Loop Eksekusi Utama
RunService.Heartbeat:Connect(function() 
    if active then 
        quantumSync() 
    end 
end)

task.spawn(function() 
    while true do 
        if active then 
            updateRemotes() 
        end 
        task.wait(4) 
    end 
end)