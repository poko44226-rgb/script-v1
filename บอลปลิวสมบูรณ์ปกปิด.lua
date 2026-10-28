local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

if player.PlayerGui:FindFirstChild("ControlRoom_V2") then
    player.PlayerGui.ControlRoom_V2:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "ControlRoom_V2"
Gui.ResetOnSpawn = false
Gui.Parent = player:WaitForChild("PlayerGui")

local ToggleBtn = Instance.new("TextButton", Gui)
ToggleBtn.Size = UDim2.new(0, 45, 0, 45)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -100)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
ToggleBtn.Text = "P"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 22
ToggleBtn.Active = true
ToggleBtn.Draggable = true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)

local BtnStroke = Instance.new("UIStroke", ToggleBtn)
BtnStroke.Color = Color3.fromRGB(255, 255, 255)
BtnStroke.Thickness = 2

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 260, 0, 125)
Main.Position = UDim2.new(0.5, -130, 0.5, -82)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Main.Active = true
Main.Draggable = true
Main.Visible = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local isMenuOpen = true
ToggleBtn.MouseButton1Click:Connect(function()
    isMenuOpen = not isMenuOpen
    Main.Visible = isMenuOpen
    
    TweenService:Create(ToggleBtn, TweenInfo.new(0.1), {Size = UDim2.new(0, 38, 0, 38)}):Play()
    task.wait(0.1)
    TweenService:Create(ToggleBtn, TweenInfo.new(0.1), {Size = UDim2.new(0, 45, 0, 45)}):Play()
end)

local EveryoneButton = Instance.new("TextButton", Main)
EveryoneButton.Size = UDim2.new(0, 130, 0, 25)
EveryoneButton.Position = UDim2.new(0, 3, 0, -9)
EveryoneButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
EveryoneButton.Text = "T4rget To Everyone"
EveryoneButton.TextColor3 = Color3.new(1, 1, 1)
EveryoneButton.Font = Enum.Font.GothamBold
EveryoneButton.TextSize = 13
EveryoneButton.ZIndex = 5
Instance.new("UICorner", EveryoneButton).CornerRadius = UDim.new(0, 5)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Title.Text = "Controlroom v2 | Tight & Strong"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Instance.new("UICorner", Title)

local Box = Instance.new("TextBox", Main)
Box.Size = UDim2.new(0.9, 0, 0, 50)
Box.Position = UDim2.new(0.05, 0, 0.3, 0)
Box.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
Box.PlaceholderText = "T4rget here..."
Box.Text = ""
Box.TextColor3 = Color3.new(1, 1, 1)
Box.Font = Enum.Font.GothamSemibold
Box.TextSize = 17
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0, 45)
Button.Position = UDim2.new(0.05, 0, 0.65, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
Button.Text = "Ball Lock | Off"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 18
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

local targetPlayer 
local targetPart
local active = false
local evActive = false
local renderConn

-- (ลบตัวแปร rng ที่ไม่ได้ใช้ออกแล้วตรงนี้)

local Folder = Instance.new("Folder", Workspace)
Folder.Name = "ControlRoom_DataFolder"
local Part = Instance.new("Part", Folder)
Part.Name = "TargetIndicator"
Part.Anchored = true 
Part.Transparency = 1 
Part.CanCollide = false
local Attachment1 = Instance.new("Attachment", Part)

if not getgenv().Network then
    getgenv().Network = {BaseParts = {}, Velocity = Vector3.new(10000, 10000, 10000)}
    RunService.Heartbeat:Connect(function()
        pcall(function()
            sethiddenproperty(player, "SimulationRadius", math.huge)
            for _,p in pairs(getgenv().Network.BaseParts) do
                if p:IsDescendantOf(Workspace) then 
                    p.Velocity = getgenv().Network.Velocity 
                end
            end
        end)
    end)
end

local function ForceBall(v)
    if v:IsA("BasePart") and not v.Anchored 
    and (v.Name:lower():find("ball") or v.Name:lower():find("soccer")) then
        pcall(function()
            v.CanCollide = false
            v.CanTouch = true
            if not table.find(getgenv().Network.BaseParts, v) then
                table.insert(getgenv().Network.BaseParts, v)
            end
            local att = v:FindFirstChild("J_Att") or Instance.new("Attachment", v)
            att.Name = "J_Att"
            
            local torque = v:FindFirstChild("J_Torque") or Instance.new("Torque", v)
            torque.Name = "J_Torque"
            torque.Attachment0 = att
            torque.Torque = Vector3.new(1e10, 1e10, 1e10) 
            
            local align = v:FindFirstChild("J_Align") or Instance.new("AlignPosition", v)
            align.Name = "J_Align"
            align.Attachment0 = att; align.Attachment1 = Attachment1
            align.MaxForce = math.huge
            align.MaxVelocity = math.huge
            align.Responsiveness = 500 
        end)
    end
end

local function Disable()
    active = false
    evActive = false
    EveryoneButton.Text = "T4rget To Everyone"
    Button.Text = "Ball Lock | Off"
    Button.BackgroundColor3 = Color3.fromRGB(0, 0, 139)
    if renderConn then renderConn:Disconnect(); renderConn = nil end
end

local function Enable()
    if active then return end
    active = true
    Button.Text = "Ball Lock | On"
    Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    
    task.spawn(function()
        while active do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                for _,v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") then
                        ForceBall(v)
                    end
                end
            end
            task.wait(1.5)
        end
    end)

    renderConn = RunService.RenderStepped:Connect(function(deltaTime)
        if targetPlayer and targetPlayer.Character then
            local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then targetPart = root end
        end

        if targetPart and targetPart.Parent then
            local velocity = targetPart.AssemblyLinearVelocity
            local lead = Vector3.zero
            local speed = velocity.Magnitude

            if speed > 1 then
                local leadDist = 4
                if speed > 16 then
                    -- ตอนวิ่ง: สลับระยะดักหน้า 4 กับ 15 แบบต่อเนื่อง
                    local wave = (math.sin(os.clock() * 10) + 1) / 2
                    leadDist = 4 + (15 - 4) * wave
                else
                    -- ตอนเดิน: ล็อกระยะไว้ที่ 4 นิ่งๆ
                    leadDist = 4
                end
                
                lead = velocity.Unit * leadDist
            end

            -- บอลเกาะนิ่งกลางตัวเป๊ะๆ ไม่เหวี่ยงสุ่ม
            Attachment1.WorldPosition = targetPart.Position + lead
        end
    end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Q then
        if active then Disable() else Enable() end
    end
end)

Button.MouseButton1Click:Connect(function()
    if active then Disable() else Enable() end
end)

Box.FocusLost:Connect(function(enter)
    if enter then
        local found = false
        for _,p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():find(Box.Text:lower()) or p.DisplayName:lower():find(Box.Text:lower()) then
                Box.Text = p.Name
                targetPlayer = p 
                targetPart = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                found = true
                break
            end
        end
        if not found then Box.Text = "" end
    end
end)

EveryoneButton.MouseButton1Click:Connect(function()
    if evActive then 
        Disable()
    else
        evActive = true
        EveryoneButton.Text = "Attacking All..."
        task.spawn(function()
            while evActive do
                for _,plr in ipairs(Players:GetPlayers()) do
                    if not evActive then break end
                    if plr ~= player and plr.Character then
                        local root = plr.Character:FindFirstChild("HumanoidRootPart")
                        if root then
                            targetPlayer = plr 
                            targetPart = root
                            Enable()
                            task.wait(1.2)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)

RunService.Heartbeat:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") and char.Humanoid.Sit then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Velocity = Vector3.new(0, 0, 0)
            hrp.RotVelocity = Vector3.new(0, 0, 0)
        end
    end
end)

Gui.Destroying:Connect(function()
    Disable()
    if Folder then Folder:Destroy() end
end)
