-- [[ ZTX|GRUP|ZUKLIR BOMB ]] --
-- Theme: Abu Golden & Merah Golden

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local WorkspaceService = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local bombActive = false
local isFiring = false
local isDetonating = false
local minimized = false
local MAX_BOMBS = 100000

local TARGET_POSITION = CFrame.new(-141.3, -27.6, 243.2)
local lastPosition = nil

local screenGui = Instance.new("ScreenGui", gethui())
screenGui.Name = "ZTXGrupZuklirBomb"
screenGui.IgnoreGuiInset = true

-- [[ MAIN FRAME 200x200 ]] --
local Frame = Instance.new("Frame", screenGui)
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Position = UDim2.new(0.5, -100, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60) -- Abu tua
Frame.BorderSizePixel = 2
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

-- [[ ABU GOLDEN GRADIENT ]] --
local GrayGoldGrad = Instance.new("UIGradient", Frame)
GrayGoldGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(105, 105, 105)), -- Abu
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(255, 215, 0)),  -- Golden
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(105, 105, 105))  -- Abu
})

task.spawn(function()
    while true do
        local t = TweenService:Create(GrayGoldGrad, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
        t:Play()
        
        local rot = TweenService:Create(GrayGoldGrad, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Rotation = GrayGoldGrad.Rotation + 90
        })
        rot:Play()
        
        task.wait(2)
        GrayGoldGrad.Offset = Vector2.new(-1, 0)
    end
end)

-- [[ TITLE BAR ]] --
local TitleBar = Instance.new("Frame", Frame)
TitleBar.Size = UDim2.new(1, 0, 0, 28)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundTransparency = 1

local MinBtn = Instance.new("TextButton", TitleBar)
MinBtn.Size = UDim2.new(0, 22, 0, 22)
MinBtn.Position = UDim2.new(1, -26, 0.5, -11)
MinBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MinBtn.Text = "-"
MinBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 13
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 5)

local MainTitle = Instance.new("TextLabel", TitleBar)
MainTitle.Size = UDim2.new(1, -35, 1, 0)
MainTitle.Position = UDim2.new(0, 10, 0, 0)
MainTitle.BackgroundTransparency = 1
MainTitle.Text = "ZTX|GRUP|ZUKLIR"
MainTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
MainTitle.Font = Enum.Font.SourceSansBold
MainTitle.TextSize = 12
MainTitle.TextXAlignment = Enum.TextXAlignment.Left

-- [[ STOCK LABEL ]] --
local StockLabel = Instance.new("TextLabel", Frame)
StockLabel.Size = UDim2.new(1, -20, 0, 35)
StockLabel.Position = UDim2.new(0, 10, 0, 35)
StockLabel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
StockLabel.Text = "ZTX|GRUP|ZUKLIR 0"
StockLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
StockLabel.Font = Enum.Font.SourceSansBold
StockLabel.TextSize = 13
Instance.new("UICorner", StockLabel).CornerRadius = UDim.new(0, 6)

-- Animasi Stroke Abu Golden
local StockStroke = Instance.new("UIStroke", StockLabel)
StockStroke.Thickness = 2
StockStroke.Color = Color3.fromRGB(255, 215, 0)

task.spawn(function()
    while true do
        TweenService:Create(StockStroke, TweenInfo.new(0.5), {Color = Color3.fromRGB(105, 105, 105)}):Play()
        task.wait(0.5)
        TweenService:Create(StockStroke, TweenInfo.new(0.5), {Color = Color3.fromRGB(255, 215, 0)}):Play()
        task.wait(0.5)
    end
end)

local function updateBombCount()
    local count = 0
    if player.Character then
        for _, v in pairs(player.Character:GetChildren()) do
            if v.Name == "Bomb" then count = count + 1 end
        end
    end
    for _, v in pairs(player.Backpack:GetChildren()) do
        if v.Name == "Bomb" then count = count + 1 end
    end
    StockLabel.Text = "ZTX|GRUP|ZUKLIR " .. count
end
RunService.Heartbeat:Connect(updateBombCount)

-- [[ BUTTON CREATOR ]] --
local function CreateButton(text, posY)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(1, -20, 0, 26)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 215, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
    
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Thickness = 1.5
    btnStroke.Color = Color3.fromRGB(255, 0, 0)
    
    -- Animasi Merah Golden
    task.spawn(function()
        while true do
            TweenService:Create(btnStroke, TweenInfo.new(0.6), {Color = Color3.fromRGB(255, 215, 0)}):Play()
            task.wait(0.6)
            TweenService:Create(btnStroke, TweenInfo.new(0.6), {Color = Color3.fromRGB(255, 0, 0)}):Play()
            task.wait(0.6)
        end
    end)
    
    return btn
end

local ReloadBombBtn = CreateButton("GET BOMB", 80)
local EquipBombBtn = CreateButton("EQUIP ALL BOMBS", 112)
local FireStrikeBtn = CreateButton("PLACE ALL (MOUSE)", 144)
local FireCannonBtn = CreateButton("BLAST CANNON", 176)

-- [[ GAME LOGIC ]] --

local function GetClickDetectorAtPosition(position)
    local nearestCD = nil
    local minDistance = 10
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("ClickDetector") and v.Parent then
            local partPos = v.Parent:IsA("BasePart") and v.Parent.Position or nil
            if partPos then
                local distance = (partPos - position).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    nearestCD = v
                end
            end
        end
    end
    return nearestCD
end

task.spawn(function()
    while true do
        if bombActive then
            local currentCount = 0
            if player.Character then
                for _, v in pairs(player.Character:GetChildren()) do
                    if v.Name == "Bomb" then currentCount = currentCount + 1 end
                end
            end
            for _, v in pairs(player.Backpack:GetChildren()) do
                if v.Name == "Bomb" then currentCount = currentCount + 1 end
            end
            
            if currentCount >= MAX_BOMBS then
                bombActive = false
                ReloadBombBtn.Text = "GET BOMB"
                if lastPosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = lastPosition
                    lastPosition = nil
                end
            else
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local rootPart = char.HumanoidRootPart
                    local nearbyCD = GetClickDetectorAtPosition(rootPart.Position)
                    if nearbyCD then
                        rootPart.CFrame = nearbyCD.Parent:IsA("BasePart") and nearbyCD.Parent.CFrame or rootPart.CFrame
                        fireclickdetector(nearbyCD)
                    end
                end
            end
        end
        task.wait(0.1)
    end
end)

ReloadBombBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    if not bombActive then
        lastPosition = char.HumanoidRootPart.CFrame
        char.HumanoidRootPart.CFrame = TARGET_POSITION
        task.wait(0.1)
        bombActive = true
        ReloadBombBtn.Text = "LOADING..."
    else
        bombActive = false
        ReloadBombBtn.Text = "GET BOMB"
        if lastPosition then
            char.HumanoidRootPart.CFrame = lastPosition
            lastPosition = nil
        end
    end
end)

EquipBombBtn.MouseButton1Click:Connect(function()
    for _, v in pairs(player.Backpack:GetChildren()) do
        if v.Name == "Bomb" then v.Parent = player.Character end
    end
end)

FireStrikeBtn.MouseButton1Click:Connect(function()
    if isFiring then return end
    isFiring = true
    local allBombs = {}
    if player.Character then
        for _, v in pairs(player.Character:GetChildren()) do
            if v.Name == "Bomb" then table.insert(allBombs, v) end
        end
    end
    for _, v in pairs(player.Backpack:GetChildren()) do
        if v.Name == "Bomb" then table.insert(allBombs, v) end
    end
    
    if #allBombs == 0 then isFiring = false return end
    
    local mouse = player:GetMouse()
    local targetPosition = mouse.Hit
    local char = player.Character
    local originalPos = char.HumanoidRootPart.CFrame
    
    char.HumanoidRootPart.CFrame = targetPosition
    task.wait(0.1)
    
    for _, bomb in pairs(allBombs) do
        bomb.Parent = player.Character
        pcall(function()
            if bomb:FindFirstChild("RemoteEvent") then
                bomb.RemoteEvent:FireServer("PlaceBomb")
            else
                bomb:Activate()
            end
        end)
    end
    
    char.HumanoidRootPart.CFrame = originalPos
    isFiring = false
end)

FireCannonBtn.MouseButton1Click:Connect(function()
    if isDetonating then return end
    isDetonating = true
    
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            local n = v.Name:lower()
            if n:find("bomb") or n:find("explode") or n:find("detonate") then
                pcall(function() v:FireServer("Detonate") end)
            end
        end
    end
    
    if player.Character then
        for _, v in pairs(player.Character:GetChildren()) do
            if v.Name == "Bomb" and v:FindFirstChild("RemoteEvent") then
                pcall(function() v.RemoteEvent:FireServer("Detonate") end)
            end
        end
    end
    
    isDetonating = false
end)

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    local targetSize = minimized and UDim2.new(0, 200, 0, 28) or UDim2.new(0, 200, 0, 200)
    TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
    MinBtn.Text = minimized and "+" or "-"
end)