-- [[ ระเบิด ONLY - DRAGGABLE UI & UNLIMITED DUPE ]] --
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local OwnerName = LP.Name
local isReloading = false
local originalPos = nil

-- ทำลาย UI เก่าหากมีอยู่แล้ว
if CoreGui:FindFirstChild("BombSystemUI") then
    CoreGui.BombSystemUI:Destroy()
end

-- 1. สร้าง ScreenGui หลัก
local sg = Instance.new("ScreenGui")
sg.Name = "BombSystemUI"
sg.ResetOnSpawn = false
sg.Parent = CoreGui

-- 2. สร้างปุ่มลอย [ B ] สำหรับ เปิด/ปิด เมนู
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "ToggleButton"
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0.02, 0, 0.4, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
toggleBtn.BorderColor3 = Color3.fromRGB(255, 30, 30)
toggleBtn.BorderSizePixel = 2
toggleBtn.Text = "B"
toggleBtn.TextColor3 = Color3.fromRGB(255, 30, 30)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 24
toggleBtn.Parent = sg

local btnCorner = Instance.new("UICorner", toggleBtn)
btnCorner.CornerRadius = UDim.new(0, 8)

-- 3. สร้าง Frame หน้าต่างเมนูหลัก
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 210)
mainFrame.Position = UDim2.new(0.02, 55, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
mainFrame.BorderColor3 = Color3.fromRGB(150, 0, 0)
mainFrame.BorderSizePixel = 1
mainFrame.ClipsDescendants = true
mainFrame.Parent = sg

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 6)

-- หัวข้อ UI (Title Bar) สำหรับใช้นิ้วลากเลื่อนหน้าต่าง
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 28)
titleLabel.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
titleLabel.BorderSizePixel = 0
titleLabel.Text = "ระเบิดลงเซิร์ฟ"
titleLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 14
titleLabel.Parent = mainFrame

-- ตัวนับจำนวนระเบิด (Counter)
local Counter = Instance.new("TextLabel")
Counter.Size = UDim2.new(1, 0, 0, 20)
Counter.Position = UDim2.new(0, 0, 0, 30)
Counter.BackgroundTransparency = 1
Counter.Text = "BOMBS: 0"
Counter.TextColor3 = Color3.fromRGB(255, 255, 255)
Counter.Font = Enum.Font.SourceSansBold
Counter.TextSize = 13
Counter.Parent = mainFrame

-- [[ ฟังก์ชันทำให้ Element สามารถลากเลื่อนตามนิ้วสัมผัส/เมาส์ได้ ]] --
local function makeDraggable(guiObject, dragHandle)
    local handle = dragHandle or guiObject
    local dragging = false
    local dragStart, startPos
    local hasMoved = false

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            hasMoved = false
            dragStart = input.Position
            startPos = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if delta.Magnitude > 5 then
                hasMoved = true
            end
            guiObject.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    return function() return hasMoved end
end

-- ผูกระบบลากเลื่อนกับปุ่ม B และ แถบหัวข้อหน้าต่าง
local wasBtnDragged = makeDraggable(toggleBtn)
makeDraggable(mainFrame, titleLabel)

-- ฟังก์ชันปรับแต่งสไตล์ปุ่มกด
local function styleButton(btn)
    btn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    btn.BorderColor3 = Color3.fromRGB(150, 0, 0)
    btn.BorderSizePixel = 1
    btn.TextColor3 = Color3.fromRGB(255, 30, 30)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 11

    btn.MouseEnter:Connect(function()
        btn.BorderColor3 = Color3.fromRGB(255, 50, 50)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    btn.MouseLeave:Connect(function()
        btn.BorderColor3 = Color3.fromRGB(150, 0, 0)
        btn.TextColor3 = Color3.fromRGB(255, 30, 30)
    end)
end

local function createMenuButton(txt, yPos)
    local btn = Instance.new("TextButton")
    btn.Text = txt
    btn.Position = UDim2.new(0, 10, 0, yPos)
    btn.Size = UDim2.new(1, -20, 0, 30)
    styleButton(btn)
    btn.Parent = mainFrame
    return btn
end

-- สร้างปุ่มฟังก์ชันระเบิด
local bReload   = createMenuButton("หยิบระเบิด", 55)
local bEquip    = createMenuButton("ถือระเบิดทั้งหมด", 90)
local bBlast    = createMenuButton("วางระเบิดทั้งหมด", 125)
local bDetonate = createMenuButton("จุดระเบิดทั้งหมด", 160)

-- [[ LOGIC SYSTEM / ฟังก์ชันการทำงาน ]] --

local function getBombCount()
    local count = 0
    local bp = LP:FindFirstChild("Backpack")
    local char = LP.Character
    if bp then for _, item in pairs(bp:GetChildren()) do if item.Name == "Bomb" then count = count + 1 end end end
    if char then for _, item in pairs(char:GetChildren()) do if item.Name == "Bomb" then count = count + 1 end end end
    return count
end

-- ระบบดึงระเบิดอัตโนมัติ (หยิบยาวๆ จนกว่าจะกดหยุดเอง)
bReload.MouseButton1Click:Connect(function()
    isReloading = not isReloading
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    
    local success, detectorPath = pcall(function()
        return workspace.WorkspaceCom["001_CriminalWeapons"].GiveTools.Bomb.ClickDetector
    end)

    if not success or not detectorPath then
        bReload.Text = "NOT FOUND BOMB!"
        task.wait(1)
        bReload.Text = "หยิบระเบิด"
        isReloading = false
        return
    end

    if isReloading then
        bReload.Text = "หยุดและกลับ"
        bReload.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        bReload.TextColor3 = Color3.new(1, 1, 1)
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
        bReload.Text = "หยิบระเบิด"
        bReload.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
        bReload.TextColor3 = Color3.fromRGB(255, 30, 30)
        if root and originalPos then 
            root.CFrame = originalPos 
            originalPos = nil 
        end
    end
end)

-- ถือระเบิดทั้งหมด
bEquip.MouseButton1Click:Connect(function()
    local bp = LP:FindFirstChild("Backpack")
    local char = LP.Character
    if bp and char then
        for _, v in pairs(bp:GetChildren()) do 
            if v.Name == "Bomb" then 
                v.Parent = char 
            end 
        end
    end
end)

-- วางระเบิดทั้งหมด
bBlast.MouseButton1Click:Connect(function()
    local char = LP.Character
    if not char then return end
    local bombs = {}
    local bp = LP:FindFirstChild("Backpack")
    
    if bp then for _, v in pairs(bp:GetChildren()) do if v.Name == "Bomb" then table.insert(bombs, v) end end end
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
        if i % 20 == 0 then RS.Heartbeat:Wait() end
    end
end)

-- จุดชนวนระเบิดทั้งหมด (แก้คำว่า val ออกแล้ว)
bDetonate.MouseButton1Click:Connect(function()
    local args = { "Bomb" .. OwnerName }
    pcall(function() 
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args)) 
    end)
end)

-- เปิด/ปิด UI เมื่อกดปุ่ม [ B ] (ป้องกันการเปิดปิดขณะลากปุ่ม)
toggleBtn.MouseButton1Click:Connect(function()
    if not wasBtnDragged() then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- ระบบอัปเดตตัวนับระเบิด Realtime
task.spawn(function() 
    while task.wait(0.3) do 
        Counter.Text = "จำนวนระเบิดในเป๋า: " .. getBombCount() 
    end 
end)
