local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local targetPrefix = "CandyCorn26"

if player.PlayerGui:FindFirstChild("CandyCornFarm_GUI") then
    player.PlayerGui.CandyCornFarm_GUI:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "CandyCornFarm_GUI"
Gui.ResetOnSpawn = false
Gui.Parent = player:WaitForChild("PlayerGui")

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 240, 0, 195)
Main.Position = UDim2.new(0.5, -120, 0.4, 0)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Title.Text = "ฟาร์มลูกอมฮาโลวีน (วาร์ป)"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13
Instance.new("UICorner", Title)

local DelayBox = Instance.new("TextBox", Main)
DelayBox.Size = UDim2.new(0.9, 0, 0, 32)
DelayBox.Position = UDim2.new(0.05, 0, 0.22, 0)
DelayBox.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
DelayBox.Text = "1"
DelayBox.PlaceholderText = "เวลารอเก็บชิ้นถัดไป (วินาที)"
DelayBox.TextColor3 = Color3.new(1, 1, 1)
DelayBox.Font = Enum.Font.GothamSemibold
DelayBox.TextSize = 14
Instance.new("UICorner", DelayBox).CornerRadius = UDim.new(0, 6)

local ESPButton = Instance.new("TextButton", Main)
ESPButton.Size = UDim2.new(0.9, 0, 0, 38)
ESPButton.Position = UDim2.new(0.05, 0, 0.42, 0)
ESPButton.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
ESPButton.Text = "มองหาโทเค็น | ปิด"
ESPButton.TextColor3 = Color3.new(1, 1, 1)
ESPButton.Font = Enum.Font.GothamBold
ESPButton.TextSize = 14
Instance.new("UICorner", ESPButton).CornerRadius = UDim.new(0, 6)

local TeleportButton = Instance.new("TextButton", Main)
TeleportButton.Size = UDim2.new(0.9, 0, 0, 38)
TeleportButton.Position = UDim2.new(0.05, 0, 0.68, 0)
TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
TeleportButton.Text = "วาร์ปเก็บอัตโนมัติ | ปิด"
TeleportButton.TextColor3 = Color3.new(1, 1, 1)
TeleportButton.Font = Enum.Font.GothamBold
TeleportButton.TextSize = 14
Instance.new("UICorner", TeleportButton).CornerRadius = UDim.new(0, 6)

local espEnabled = false
local teleportEnabled = false
local espTable = {}
local collectedParts = {}

local function CreateESP(item)
    if not item:FindFirstChild("ESP_Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "ESP_Highlight"
        highlight.Adornee = item
        highlight.FillColor = Color3.fromRGB(255, 165, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.4
        highlight.OutlineTransparency = 0
        highlight.Parent = item

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_Billboard"
        billboard.Adornee = item
        billboard.Size = UDim2.new(0, 30, 0, 30)
        billboard.StudsOffset = Vector3.new(0, 1.5, 0)
        billboard.AlwaysOnTop = true

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "•"
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        textLabel.TextStrokeTransparency = 0
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 22
        textLabel.Parent = billboard

        billboard.Parent = item
        table.insert(espTable, item)
    end
end

local function RemoveESP()
    for _, item in ipairs(espTable) do
        if item then
            local hl = item:FindFirstChild("ESP_Highlight")
            if hl then hl:Destroy() end
            local bb = item:FindFirstChild("ESP_Billboard")
            if bb then bb:Destroy() end
        end
    end
    espTable = {}
end

ESPButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    if espEnabled then
        ESPButton.Text = "มองหาโทเค็น | เปิด"
        ESPButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if string.match(obj.Name, "^" .. targetPrefix) then
                CreateESP(obj)
            end
        end
    else
        ESPButton.Text = "มองหาโทเค็น | ปิด"
        ESPButton.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
        RemoveESP()
    end
end)

Workspace.DescendantAdded:Connect(function(obj)
    if espEnabled and string.match(obj.Name, "^" .. targetPrefix) then
        task.wait(0.1)
        CreateESP(obj)
    end
end)

RunService.Heartbeat:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        if teleportEnabled and char.Humanoid.Sit then
            char.Humanoid.Sit = false
        end
    end
end)

task.spawn(function()
    while true do
        if teleportEnabled then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local nearestItem = nil
                local targetObj = nil
                local shortestDist = math.huge
                
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if string.match(obj.Name, "^" .. targetPrefix) and not collectedParts[obj] then
                        local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                        if part and not collectedParts[part] then
                            local dist = (hrp.Position - part.Position).Magnitude
                            if dist < shortestDist then
                                shortestDist = dist
                                nearestItem = part
                                targetObj = obj
                            end
                        end
                    end
                end

                if nearestItem and targetObj then
                    collectedParts[targetObj] = true
                    collectedParts[nearestItem] = true

                    hrp.CFrame = nearestItem.CFrame + Vector3.new(0, 2, 0)
                    
                    pcall(function()
                        ReplicatedStorage.Remotes.Halloween2026_CollectCandyCorn:InvokeServer(targetObj.Name)
                    end)

                    local waitTime = tonumber(DelayBox.Text) or 1
                    if waitTime < 0.1 then waitTime = 0.1 end

                    hrp.Anchored = true
                    task.wait(waitTime)
                    hrp.Anchored = false
                else
                    task.wait(0.5)
                end
            else
                task.wait(1)
            end
        else
            task.wait(0.4)
        end
    end
end)

TeleportButton.MouseButton1Click:Connect(function()
    teleportEnabled = not teleportEnabled
    if teleportEnabled then
        collectedParts = {}
        TeleportButton.Text = "วาร์ปเก็บอัตโนมัติ | เปิด"
        TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.Anchored = false
        end
        TeleportButton.Text = "วาร์ปเก็บอัตโนมัติ | ปิด"
        TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
    end
end)

