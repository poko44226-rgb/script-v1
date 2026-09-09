-- [[ PROP SPAMMER - MAX 300 PROPS ]] --
-- วาง prop รอบตัวผู้เล่นแบบกริด/ซ้อนแถว สูงสุด 300 ชิ้น พร้อม GUI ควบคุม

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- =============================================================================
-- [[ CONFIG - ปรับตรงนี้ได้เลย ]] --
-- =============================================================================
local MAX_PROPS = 300          -- จำนวนสูงสุดที่จะวาง
local SPAWN_DELAY = 0.03       -- ดีเลย์ระหว่างชิ้น (วินาที) ลดลงเสี่ยงเด้ง/เซิร์ฟเวอร์คิก
local GRID_SPACING = 4         -- ระยะห่างแต่ละชิ้น (สตัด)
local GRID_ROWS = 10           -- กริดกว้างกี่แถว (10x10 = 100 ต่อชั้น)
local STACK_HEIGHT = 30        -- สูงสุดกี่ชั้น (เมื่อกริดเต็มจะซ้อนขึ้นไป)
local LAYER_STEP = 4           -- ระยะสูงต่อชั้น (สตัด)
local START_OFFSET = Vector3.new(0, 3, 0) -- จุดเริ่มวางสัมพัทธ์กับตัวผู้เล่น

-- !!! สำคัญ: ใส่ remote ปล่อย prop ของเกมตรงนี้ !!!
-- ตัวอย่างรูปแบบ: game.ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("SpawnProp", "TrafficCone", cf)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local function SPAWN_FUNCTION(cf)
    pcall(function()
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("SpawnProp", "TrafficCone", cf)
    end)
end
-- =============================================================================

local placing = false
local placedCount = 0
local placeThread = nil

-- [[ GUI ]] --
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "Prop_Spammer_300"

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 190, 0, 150)
main.Position = UDim2.new(0.05, 0, 0.55, 0)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BorderSizePixel = 0

local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 22)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -8, 1, 0)
titleLabel.Position = UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Prop Spammer (Max " .. MAX_PROPS .. ")"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 12
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local statusLabel = Instance.new("TextLabel", main)
statusLabel.Size = UDim2.new(1, -10, 0, 15)
statusLabel.Position = UDim2.new(0, 5, 0, 28)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "READY"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Font = Enum.Font.Code
statusLabel.TextSize = 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

local countLabel = Instance.new("TextLabel", main)
countLabel.Size = UDim2.new(1, -10, 0, 15)
countLabel.Position = UDim2.new(0, 5, 0, 46)
countLabel.BackgroundTransparency = 1
countLabel.Text = "PLACED: 0 / " .. MAX_PROPS
countLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
countLabel.Font = Enum.Font.Code
countLabel.TextSize = 10
countLabel.TextXAlignment = Enum.TextXAlignment.Left

local function styleBtn(b)
    b.BackgroundColor3 = Color3.fromRGB(10, 0, 20)
    b.BorderSizePixel = 1
    b.BorderColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 11
end

local startBtn = Instance.new("TextButton", main)
startBtn.Size = UDim2.new(1, -10, 0, 28)
startBtn.Position = UDim2.new(0, 5, 0, 68)
startBtn.Text = "START PLACING"
styleBtn(startBtn)

local clearBtn = Instance.new("TextButton", main)
clearBtn.Size = UDim2.new(1, -10, 0, 22)
clearBtn.Position = UDim2.new(0, 5, 0, 102)
clearBtn.Text = "RESET COUNTER"
styleBtn(clearBtn)

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
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
end)

-- [[ LOGIC ]] --
local function getBaseCFrame()
    local char = LP.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then return root.CFrame end
    return CFrame.new(0, 10, 0)
end

local function gridPosition(index, baseCF)
    -- วางแบบกริด GRID_ROWS x GRID_ROWS ต่อชั้น ชั้นเต็มค่อยซ้อนขึ้น LAYER_STEP
    local perLayer = GRID_ROWS * GRID_ROWS
    local layer = math.floor((index - 1) / perLayer)
    local inLayer = (index - 1) % perLayer
    local row = math.floor(inLayer / GRID_ROWS)
    local col = inLayer % GRID_ROWS
    local half = (GRID_ROWS - 1) * GRID_SPACING / 2
    local offset = Vector3.new(col * GRID_SPACING - half, layer * LAYER_STEP, row * GRID_SPACING - half)
    return baseCF * CFrame.new(START_OFFSET + offset)
end

startBtn.MouseButton1Click:Connect(function()
    if placing then
        placing = false
        startBtn.Text = "START PLACING"
        statusLabel.Text = "STOPPED"
        return
    end
    placing = true
    startBtn.Text = "STOP"
    statusLabel.Text = "PLACING..."
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 120)

    placeThread = task.spawn(function()
        local baseCF = getBaseCFrame()
        while placing and placedCount < MAX_PROPS do
            placedCount = placedCount + 1
            SPAWN_FUNCTION(gridPosition(placedCount, baseCF))
            countLabel.Text = "PLACED: " .. placedCount .. " / " .. MAX_PROPS
            if SPAWN_DELAY > 0 then task.wait(SPAWN_DELAY) end
        end
        placing = false
        startBtn.Text = "START PLACING"
        if placedCount >= MAX_PROPS then
            statusLabel.Text = "DONE: " .. MAX_PROPS .. " PROPS PLACED"
            statusLabel.TextColor3 = Color3.fromRGB(0, 255, 120)
        else
            statusLabel.Text = "STOPPED"
            statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
    end)
end)

clearBtn.MouseButton1Click:Connect(function()
    placedCount = 0
    countLabel.Text = "PLACED: 0 / " .. MAX_PROPS
    statusLabel.Text = "READY"
    statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
end)
