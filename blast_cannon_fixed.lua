local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- [[ BLAST CANNON V7 - CLEANED ]] --
task.spawn(function()
        local RunService = game:GetService("RunService")
        local TweenService = game:GetService("TweenService")

        local isReloading = false
        local isMinimized = false
        local originalPos = nil

        -- [[ UTILITY: COUNT BOMBS ]] --
        local function getBombCount()
            local count = 0
            local bp = LP:FindFirstChild("Backpack")
            local char = LP.Character
            if bp then
                for _, item in pairs(bp:GetChildren()) do
                    if item.Name == "Bomb" then count = count + 1 end
                end
            end
            if char then
                for _, item in pairs(char:GetChildren()) do
                    if item.Name == "Bomb" then count = count + 1 end
                end
            end
            return count
        end
        
        -- [[ UI CONSTRUCTION ]] --
        local Gui = Instance.new("ScreenGui", game.CoreGui)
        local Main = Instance.new("Frame", Gui)
        Main.Size = UDim2.new(0, 200, 0, 240)
        Main.Position = UDim2.new(0.5, -100, 0.4, 0)
        Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Main.BorderSizePixel = 0
        Main.Active = true 
        Main.Draggable = true
        Main.ClipsDescendants = true

        local UICorner = Instance.new("UICorner", Main)
        UICorner.CornerRadius = UDim.new(0, 10)

        local MainGrad = Instance.new("UIGradient", Main)
        MainGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 10, 40)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 80, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 80, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 10, 40))
        })

        task.spawn(function()
            while true do
                local t = TweenService:Create(MainGrad, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
                t:Play()
                task.wait(2)
                MainGrad.Offset = Vector2.new(-1, 0)
            end
        end)

        local Header = Instance.new("Frame", Main)
        Header.Size = UDim2.new(1, 0, 0, 45)
        Header.BackgroundTransparency = 1

        local Title = Instance.new("TextLabel", Header)
        Title.Size = UDim2.new(1, -35, 0, 25)
        Title.Position = UDim2.new(0, 10, 0, 5)
        Title.Text = "BLAST CANNON V7 by DYTON_txt"
        Title.TextColor3 = Color3.new(1, 1, 1)
        Title.Font = Enum.Font.SourceSansBold
        Title.TextSize = 14
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.BackgroundTransparency = 1

        local MinBtn = Instance.new("TextButton", Header)
        MinBtn.Size = UDim2.new(0, 25, 0, 25)
        MinBtn.Position = UDim2.new(1, -30, 0, 10)
        MinBtn.BackgroundColor3 = Color3.new(0,0,0)
        MinBtn.BackgroundTransparency = 0.6
        MinBtn.Text = "▲"
        MinBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", MinBtn)

        local Content = Instance.new("Frame", Main)
        Content.Size = UDim2.new(1, 0, 1, -45)
        Content.Position = UDim2.new(0, 0, 0, 45)
        Content.BackgroundTransparency = 1

        local Counter = Instance.new("TextLabel", Content)
        Counter.Size = UDim2.new(1, 0, 0, 30)
        Counter.Text = "BOMBS: 0"
        Counter.TextColor3 = Color3.fromRGB(255, 255, 255)
        Counter.Font = Enum.Font.SourceSansBold
        Counter.TextSize = 18
        Counter.BackgroundTransparency = 1

        local function createBtn(name, pos, color)
            local b = Instance.new("TextButton", Content)
            b.Size = UDim2.new(0.9, 0, 0, 40)
            b.Position = pos
            b.BackgroundColor3 = color or Color3.fromRGB(0, 0, 0)
            b.BackgroundTransparency = 0.3
            b.Text = name
            b.TextColor3 = Color3.new(1, 1, 1)
            b.Font = Enum.Font.SourceSansBold
            b.TextSize = 13
            Instance.new("UICorner", b)
            return b
        end

        local bReload = createBtn("AUTO RELOAD + TP", UDim2.new(0.05, 0, 0.15, 0))
        local bEquip = createBtn("EQUIP ALL", UDim2.new(0.05, 0, 0.45, 0))
        local bBlast = createBtn("BLAST CANNON", UDim2.new(0.05, 0, 0.75, 0), Color3.fromRGB(0, 80, 255))

        -- [[ LOGIC: AUTO RELOAD + TP ]] --
        bReload.MouseButton1Click:Connect(function()
            isReloading = not isReloading
            local char = LP.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local detectorPath = workspace.WorkspaceCom["001_CriminalWeapons"].GiveTools.Bomb.ClickDetector

            if isReloading then
                bReload.Text = "STOP & TP BACK"
                bReload.BackgroundColor3 = Color3.fromRGB(0, 80, 255)
                if root then
                    originalPos = root.CFrame
                    root.CFrame = detectorPath.Parent.CFrame
                end
                task.spawn(function()
                    while isReloading do
                        pcall(function() fireclickdetector(detectorPath) end)
                        task.wait(0.05)
                    end
                end)
            else
                bReload.Text = "AUTO RELOAD + TP"
                bReload.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                if root and originalPos then
                    root.CFrame = originalPos
                    originalPos = nil
                end
            end
        end)

        -- [[ LOGIC: EQUIP ALL ]] --
        bEquip.MouseButton1Click:Connect(function()
            for _, v in pairs(LP.Backpack:GetChildren()) do
                if v.Name == "Bomb" then v.Parent = LP.Character end
            end
        end)

        -- [[ LOGIC: BLAST CANNON (INSTANT ACTIVATION) ]] --
        bBlast.MouseButton1Click:Connect(function()
            local char = LP.Character
            if not char then return end

            local bombs = {}
            for _, v in pairs(LP.Backpack:GetChildren()) do if v.Name == "Bomb" then table.insert(bombs, v) end end
            for _, v in pairs(char:GetChildren()) do if v.Name == "Bomb" then table.insert(bombs, v) end end

            if #bombs == 0 then return end

            for i, bomb in ipairs(bombs) do
                task.spawn(function()
                    pcall(function()
                        bomb.Parent = char
                        task.wait()
                        bomb:Activate()
                    end)
                end)
                if i % 20 == 0 then RunService.Heartbeat:Wait() end
            end
        end)

        -- [[ MINIMIZE ]] --
        MinBtn.MouseButton1Click:Connect(function()
            isMinimized = not isMinimized
            local targetSize = isMinimized and UDim2.new(0, 200, 0, 45) or UDim2.new(0, 200, 0, 240)
            MinBtn.Text = isMinimized and "▼" or "▲"
            TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = targetSize}):Play()
            Content.Visible = not isMinimized
        end)

        task.spawn(function()
            while true do
                Counter.Text = "BOMBS: " .. getBombCount()
                task.wait(0.5)
            end
        end)
    end)