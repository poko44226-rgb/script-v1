local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- ลบ UI เก่าออกหากมีอยู่แล้ว
if player.PlayerGui:FindFirstChild("BallPliew_UI_V1") then
    player.PlayerGui.BallPliew_UI_V1:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "BallPliew_UI_V1"
Gui.ResetOnSpawn = false
Gui.Parent = player:WaitForChild("PlayerGui")

-- ========================================================
-- 1. ปุ่มเปิด/ปิด UI (สี่เหลี่ยมเล็ก ไอคอน P - ไม่ขยับย่อขยาย)
-- ========================================================
local ToggleBtn = Instance.new("TextButton", Gui)
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -20)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
ToggleBtn.Text = "P"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 20
ToggleBtn.Active = true
ToggleBtn.Draggable = true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 8)

local BtnStroke = Instance.new("UIStroke", ToggleBtn)
BtnStroke.Color = Color3.fromRGB(100, 100, 255)
BtnStroke.Thickness = 2

-- ========================================================
-- 2. หน้าต่างหลัก (Main Frame)
-- ========================================================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 240, 0, 180)
Main.Position = UDim2.new(0.5, -120, 0.5, -90)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.Active = true
Main.Draggable = true
Main.Visible = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Color = Color3.fromRGB(45, 45, 55)
MainStroke.Thickness = 1.5

-- Event กดปุ่ม P เพื่อซ่อน/แสดง (ไม่มี Animation ย่อขยาย)
local isMenuOpen = true
ToggleBtn.MouseButton1Click:Connect(function()
    isMenuOpen = not isMenuOpen
    Main.Visible = isMenuOpen
end)

-- Layout ช่วยจัดระเบียบปุ่มภายใน Frame
local UIList = Instance.new("UIListLayout", Main)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local UIPadding = Instance.new("UIPadding", Main)
UIPadding.PaddingTop = UDim.new(0, 10)
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingLeft = UDim.new(0, 10)
UIPadding.PaddingRight = UDim.new(0, 10)

-- หัวข้อ: บอลปลิว v1 | โดย P9D
local Title = Instance.new("TextLabel", Main)
Title.LayoutOrder = 1
Title.Size = UDim2.new(1, 0, 0, 25)
Title.BackgroundTransparency = 1
Title.Text = "บอลปลิว v1 | โดย P9D"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14

-- ช่องใส่ชื่อผู้เล่น
local Box = Instance.new("TextBox", Main)
Box.LayoutOrder = 2
Box.Size = UDim2.new(1, 0, 0, 32)
Box.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Box.PlaceholderText = "ใส่ชื่อผู้เล่น..."
Box.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.Font = Enum.Font.Gotham
Box.TextSize = 13
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

-- ปุ่ม บอลปลิว: ปิด
local Button = Instance.new("TextButton", Main)
Button.LayoutOrder = 3
Button.Size = UDim2.new(1, 0, 0, 34)
Button.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
Button.Text = "บอลปลิว: ปิด"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 13
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

-- ปุ่ม โจมตีทุกคน: ปิด
local EveryoneButton = Instance.new("TextButton", Main)
EveryoneButton.LayoutOrder = 4
EveryoneButton.Size = UDim2.new(1, 0, 0, 34)
EveryoneButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
EveryoneButton.Text = "โจมตีทุกคน: ปิด"
EveryoneButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EveryoneButton.Font = Enum.Font.GothamBold
EveryoneButton.TextSize = 13
Instance.new("UICorner", EveryoneButton).CornerRadius = UDim.new(0, 6)

-- ========================================================
-- 3. ระบบคำนวณและฟังก์ชันควบคุม (Backend Logic)
-- ========================================================
local targetPlayer 
local targetPart
local active = false
local evActive = false
local renderConn

local rng = Random.new()
local orbitOffset = Vector3.zero
local desiredOrbitOffset = Vector3.zero
local nextOrbitTime = 0

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
    EveryoneButton.Text = "โจมตีทุกคน: ปิด"
    EveryoneButton.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    Button.Text = "บอลปลิว: ปิด"
    Button.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
    if renderConn then renderConn:Disconnect(); renderConn = nil end
end

local function Enable()
    if active then return end
    active = true
    Button.Text = "บอลปลิว: เปิด"
    Button.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
    
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
                if speed > 15 then
                    leadDist = 15
                end
                lead = velocity.Unit * leadDist
            end

            local now = os.clock()
            if now >= nextOrbitTime then
                local angle = rng:NextNumber(0, math.pi * 2)
                local radius = rng:NextNumber(0.7, 1.5)
                desiredOrbitOffset = Vector3.new(
                    math.cos(angle) * radius,
                    rng:NextNumber(-1.1, 1.1),
                    math.sin(angle) * radius
                )
                nextOrbitTime = now + rng:NextNumber(0.12, 0.25)
            end

            local smoothing = math.clamp(deltaTime * 16, 0, 1)
            orbitOffset = orbitOffset:Lerp(desiredOrbitOffset, smoothing)

            Attachment1.WorldPosition = targetPart.Position + lead + orbitOffset
        end
    end)
end

-- กดปุ่ม Q เพื่อ Toggle สลับเปิด/ปิด
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
        EveryoneButton.Text = "โจมตีทุกคน: เปิด"
        EveryoneButton.BackgroundColor3 = Color3.fromRGB(40, 180, 80)
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
