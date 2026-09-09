-- [[ PRISON LIFE - AIM & ESP v1.1 ]] --
-- ฟังก์ชัน:
--   • ล็อกเป้า (Aimbot) ปรับจุดล็อกได้: หัว / อก(Torso) / ตัว(HumanoidRootPart)
--   • ขอบเขตการล็อก: ปรับ FOV (วงกลม) + ระยะล็อกสูงสุด
--   • กรองเฉพาะฝ่าย: อาชญากร / ตำรวจ / นักโทษ
--   • มองผู้คน (ESP Highlight ทะลุกำแพง) แยกสีตามฝ่าย
--   • [NEW] กระสุนติดตาม (TRACER) กระสุนเรืองแสงบินตามเป้า -> ชนแล้วแฟลช
--         ^^^ ผูกกับจุดล็อกเดียวกัน: สลับหัว/อก/ตัว กระสุนไล่ตามจุดนั้นอัตโนมัติ
--   • [NEW] SILENT AIM: ดึงเส้นยิงจากปืนจริงให้โดนเป้าที่ล็อกไว้ (hook Raycast ของเกม)
--   • [NEW] เส้นเลเซอร์จากปากกระบอกปืน -> เป้าล็อก ขณะเล็ง
--   • คีย์ลัด: X = เปิด/ปิด Aimbot | คลิกขวาค้าง = ล็อก

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer

local Camera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    Camera = Workspace.CurrentCamera
end)

-- ================== [[ SETTINGS ]] ==================
local Settings = {
    Aimbot      = false,
    ESP         = false,
    TeamCriminal= true,
    TeamGuards  = true,
    TeamInmates = true,
    TargetPart  = "Head",
    FOV         = 120,
    Range       = 300,
    Smoothness  = 0.35,
    WallCheck   = true,
    ToggleMode  = false,
    -- [NEW]
    Tracer      = true,   -- กระสุนติดตาม
    SilentAim   = false,  -- ยิงออโต้โดน (เสี่ยงโดนแบนเล็กน้อย)
    Laser       = true,   -- เส้นเลเซอร์ขณะล็อก
}

local AIM_KEY = Enum.UserInputType.MouseButton2
local TOGGLE_KEY = Enum.KeyCode.X

local TeamColors = {
    Criminal = Color3.fromRGB(255, 60, 60),
    Guards   = Color3.fromRGB(60, 130, 255),
    Inmates  = Color3.fromRGB(255, 170, 60),
}

local aimingHeld = false
local toggleLocked = false
local currentTarget = nil

-- ================== [[ LOGIC]] ==================
local function teamAllowed(p)
    local t = p.Team
    if not t then return false end
    local n = t.Name
    if n == "Criminal" then return Settings.TeamCriminal end
    if n == "Guards"   then return Settings.TeamGuards   end
    if n == "Inmates"  then return Settings.TeamInmates  end
    return false
end

local function isVisible(part)
    if not Settings.WallCheck then return true end
    local char = part:FindFirstAncestorOfClass("Model")
    if not char then return false end
    local origin = Camera.CFrame.Position
    local direction = part.Position - origin
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {LP.Character, Camera}
    local hit = Workspace:Raycast(origin, direction, params)
    if not hit then return true end
    return hit.Instance:IsDescendantOf(char)
end

local function getTarget()
    local best, bestDist = nil, Settings.FOV
    local mousePos = UIS:GetMouseLocation()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and teamAllowed(p) and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local part = p.Character:FindFirstChild(Settings.TargetPart)
            if hum and hum.Health > 0 and part then
                local dist3d = (part.Position - Camera.CFrame.Position).Magnitude
                if dist3d <= Settings.Range then
                    local sp, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local d2d = (Vector2.new(sp.X, sp.Y) - mousePos).Magnitude
                        if d2d < bestDist and isVisible(part) then
                            bestDist = d2d
                            best = part
                        end
                    end
                end
            end
        end
    end
    return best
end

local function aimAt(part, dt)
    local sp = Camera:WorldToViewportPoint(part.Position)
    local mouse = UIS:GetMouseLocation()
    local delta = Vector2.new(sp.X, sp.Y) - mouse
    local alpha = 1 - math.exp(-(1 - Settings.Smoothness) * 18 * dt)
    if typeof(mousemoverel) == "function" then
        mousemoverel(delta.X * alpha, delta.Y * alpha)
    else
        local targetCF = CFrame.new(Camera.CFrame.Position, part.Position)
        Camera.CFrame = Camera.CFrame:Lerp(targetCF, alpha)
    end
end

-- ================== [[ ESP ]] ==================
local highlights = {}

local function syncESP()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP then
            local h = highlights[p]
            if Settings.ESP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                if not (h and h.Parent) then
                    h = Instance.new("Highlight")
                    h.FillTransparency = 0.65
                    h.OutlineTransparency = 0
                    highlights[p] = h
                end
                h.Adornee = p.Character
                h.Parent = CoreGui
                local col = TeamColors[p.Team and p.Team.Name or ""]
                h.FillColor = col or Color3.fromRGB(200, 200, 200)
                h.OutlineColor = col or Color3.fromRGB(255, 255, 255)
            elseif h then
                h:Destroy()
                highlights[p] = nil
            end
        end
    end
    for p, h in pairs(highlights) do
        if not p.Parent then
            h:Destroy()
            highlights[p] = nil
        end
    end
end

-- ================== [[ TRACER กระสุนติดตาม ]] ==================
local activeTracers = {}
local impactFlashes = {}

local function getMuzzlePos()
    local char = LP.Character
    if not char then return nil end
    local tool = char:FindFirstChildOfClass("Tool")
    if tool then
        local h = tool:FindFirstChild("Handle")
        if h then return h.Position end
    end
    local arm = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightUpperArm")
    if arm then return arm.Position end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    return hrp and (hrp.Position + Vector3.new(0, 1, 0)) or nil
end

local function spawnImpactFlash(pos)
    local p = Instance.new("Part")
    p.Shape = Enum.PartType.Ball
    p.Size = Vector3.new(1.2, 1.2, 1.2)
    p.Material = Enum.Material.Neon
    p.Color = Color3.fromRGB(255, 120, 40)
    p.CanCollide = false
    p.Anchored = true
    p.CFrame = CFrame.new(pos)
    p.Parent = Workspace
    local l = Instance.new("PointLight")
    l.Brightness = 5 l.Range = 12 l.Color = p.Color
    l.Parent = p
    table.insert(impactFlashes, {part = p, life = 0})
end

-- ยิงกระสุนติดตาม 1 นัด: บินตาม currentTarget (จุดล็อก หัว/อก/ตัว) ถ้าเป้าหายบินตรงต่อ
local function fireTracer()
    local from = getMuzzlePos()
    if not from then return end
    local b = Instance.new("Part")
    b.Shape = Enum.PartType.Ball
    b.Size = Vector3.new(0.28, 0.28, 0.28)
    b.Material = Enum.Material.Neon
    b.Color = Color3.fromRGB(255, 220, 80)
    b.CanCollide = false
    b.Anchored = true
    b.CFrame = CFrame.new(from)
    b.Parent = Workspace
    local l = Instance.new("PointLight")
    l.Brightness = 3 l.Range = 9 l.Color = b.Color
    l.Parent = b
    table.insert(activeTracers, {
        part = b,
        dir = Camera.CFrame.LookVector,  -- ทิศตอนยิง กันเป้าหาย
        life = 0
    })
end

local TRACER_SPEED = 320  -- ความเร็วกระสุน (studs/วิ)

local function updateTracers(dt)
    for i = #activeTracers, 1, -1 do
        local tr = activeTracers[i]
        tr.life = tr.life + dt
        local pos = tr.part.Position
        local goal, reached
        if currentTarget and currentTarget.Parent then
            goal = currentTarget.Position  -- << ติดตามจุดล็อก (หัว/อก/ตัว) แบบเรียลไทม์
        else
            goal = pos + tr.dir * (TRACER_SPEED * dt)  -- เป้าหาย -> บินตรงต่อ
        end
        local delta = goal - pos
        local step = TRACER_SPEED * dt
        if delta.Magnitude <= math.max(step, 0.6) then
            reached = true
        end
        if reached or tr.life > 3 then
            spawnImpactFlash(goal)
            tr.part:Destroy()
            table.remove(activeTracers, i)
        else
            tr.part.CFrame = CFrame.new(pos + delta.Unit * step, goal)
        end
    end
    -- แฟลชจางลง
    for i = #impactFlashes, 1, -1 do
        local f = impactFlashes[i]
        f.life = f.life + dt
        local a = 1 - f.life / 0.18
        if a <= 0 then
            f.part:Destroy()
            table.remove(impactFlashes, i)
        else
            f.part.Transparency = 1 - a
            f.part.Size = Vector3.new(1.2 + f.life * 8, 1.2 + f.life * 8, 1.2 + f.life * 8)
        end
    end
end

-- ================== [[ LASER เส้นเลเซอร์ ]] ==================
local laserPart = Instance.new("Part")
laserPart.Size = Vector3.new(0.06, 0.06, 1)
laserPart.Material = Enum.Material.Neon
laserPart.Color = Color3.fromRGB(255, 60, 60)
laserPart.CanCollide = false
laserPart.Anchored = true
laserPart.Transparency = 1
laserPart.Parent = Workspace

local function updateLaser()
    if Settings.Laser and currentTarget and currentTarget.Parent then
        local muzzle = getMuzzlePos()
        if muzzle then
            local goal = currentTarget.Position
            local mid = (muzzle + goal) / 2
            local dist = (goal - muzzle).Magnitude
            if dist > 0.5 then
                laserPart.Size = Vector3.new(0.06, 0.06, dist)
                laserPart.CFrame = CFrame.lookAt(mid, goal)
                laserPart.Transparency = 0.15
                return
            end
        end
    end
    laserPart.Transparency = 1
end

-- ================== [[ SILENT AIM (hook Raycast เกม) ]] ==================
local silentHooked = false
local oldNamecallFn = nil
local inRedirect = false

local function installSilentAim()
    if silentHooked then return end
    if typeof(hookmetamethod) ~= "function" then
        print("[PL Aim&ESP] executor ไม่มี hookmetamethod -> Silent Aim ใช้ไม่ได้ (Aimbot ปกติ)")
        return
    end
    local ok, res = pcall(function()
        return hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if not inRedirect and method == "Raycast" and self == Workspace
                and Settings.SilentAim
                and (typeof(checkcaller) ~= "function" or not checkcaller()) then
                local args = {...}
                local origin, direction = args[1], args[2]
                if typeof(origin) == "Vector3" and typeof(direction) == "Vector3" then
                    inRedirect = true
                    local t = getTarget()  -- เล็กเป้าสดใหม่ทุกนัด
                    inRedirect = false
                    if t and t.Parent then
                        local newDir = t.Position - origin
                        if newDir.Magnitude > 0.01 then
                            args[2] = newDir.Unit * direction.Magnitude
                            return oldNamecallFn(self, table.unpack(args))
                        end
                    end
                end
            end
            return oldNamecallFn(self, ...)
        end))
    end)
    if ok and type(res) == "function" then
        oldNamecallFn = res
        silentHooked = true
        print("[PL Aim&ESP] Silent Aim hook ติดตั้งแล้ว")
    else
        print("[PL Aim&ESP] ติดตั้ง Silent Aim ไม่สำเร็จ:", tostring(res))
    end
end
installSilentAim()

-- ================== [[ GUI ]] ==================
local sg = Instance.new("ScreenGui")
sg.Name = "PL_AimESP"
sg.ResetOnSpawn = false
sg.Parent = CoreGui

local fovCircle = Instance.new("Frame")
fovCircle.Size = UDim2.new(0, Settings.FOV * 2, 0, Settings.FOV * 2)
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
fovCircle.BackgroundTransparency = 1
fovCircle.Visible = false
fovCircle.Parent = sg
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0)
corner.Parent = fovCircle
local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.5
stroke.Color = Color3.fromRGB(255, 80, 80)
stroke.Parent = fovCircle

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 230, 0, 400)
main.Position = UDim2.new(0.02, 0, 0.18, 0)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = sg

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 26)
title.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
title.BorderSizePixel = 0
title.Text = "  PRISON LIFE - AIM & ESP v1.1"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 12
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local function mkBtn(txt, x, y, w, h, col)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, w, 0, h)
    b.Position = UDim2.new(0, x, 0, y)
    b.BackgroundColor3 = col or Color3.fromRGB(30, 30, 36)
    b.BorderColor3 = Color3.fromRGB(70, 70, 80)
    b.BorderSizePixel = 1
    b.Text = txt
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 10
    b.Parent = main
    return b
end

local function mkLabel(txt, x, y, w)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(0, w, 0, 14)
    l.Position = UDim2.new(0, x, 0, y)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.TextColor3 = Color3.fromRGB(200, 200, 200)
    l.Font = Enum.Font.Code
    l.TextSize = 10
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = main
    return l
end

local function refreshTogBtn(b, on, baseCol)
    b.BackgroundColor3 = on and Color3.fromRGB(40, 110, 50) or (baseCol or Color3.fromRGB(60, 35, 35))
    b.TextColor3 = on and Color3.new(1, 1, 1) or Color3.fromRGB(170, 170, 170)
end

-- Row 1
local aimBtn = mkBtn("AIMBOT: OFF", 6, 34, 108, 24, Color3.fromRGB(90, 30, 30))
local espBtn = mkBtn("ESP: OFF", 118, 34, 108, 24, Color3.fromRGB(90, 30, 30))

-- Row 2
local partBtn = mkBtn("จุดล็อก: หัว (HEAD)", 6, 64, 220, 22, Color3.fromRGB(35, 45, 70))

-- Row 3
mkLabel("กรองฝ่าย:", 6, 92, 100)
local criminalBtn = mkBtn("อาชญากร: ON", 6, 108, 108, 20)
local guardsBtn   = mkBtn("ตำรวจ: ON", 118, 108, 108, 20)
local inmatesBtn  = mkBtn("นักโทษ: ON", 6, 132, 108, 20)
local wallBtn     = mkBtn("เช็กกำแพง: ON", 118, 132, 108, 20)
local toggleModeBtn = mkBtn("โหมดล็อกค้าง: OFF", 6, 156, 220, 20)

-- Sliders
local function mkSlider(label, y, getter, setter, fmt, minV, maxV, step)
    mkLabel(label, 6, y, 110)
    local minus = mkBtn("-", 120, y - 3, 24, 20)
    local plus  = mkBtn("+", 196, y - 3, 24, 20)
    local val = mkLabel(fmt(getter()), 148, y, 46)
    val.TextXAlignment = Enum.TextXAlignment.Center
    minus.MouseButton1Click:Connect(function()
        setter(math.clamp(getter() - step, minV, maxV))
        val.Text = fmt(getter())
    end)
    plus.MouseButton1Click:Connect(function()
        setter(math.clamp(getter() + step, minV, maxV))
        val.Text = fmt(getter())
    end)
end

mkSlider("FOV (วงล็อก):", 186, function() return Settings.FOV end,
    function(v) Settings.FOV = v fovCircle.Size = UDim2.new(0, v*2, 0, v*2) end,
    function(v) return tostring(math.floor(v)) end, 30, 400, 10)
mkSlider("ระยะล็อก:", 212, function() return Settings.Range end,
    function(v) Settings.Range = v end,
    function(v) return tostring(math.floor(v)) end, 50, 1000, 25)
mkSlider("ความนุ่ม:", 238, function() return Settings.Smoothness end,
    function(v) Settings.Smoothness = v end,
    function(v) return string.format("%.2f", v) end, 0, 0.95, 0.05)

-- [NEW] Row: Tracer / Silent Aim / Laser
local tracerBtn = mkBtn("กระสุนติดตาม: ON", 6, 264, 220, 22, Color3.fromRGB(40, 110, 50))
local silentBtn = mkBtn("SILENT AIM: OFF", 6, 290, 220, 22, Color3.fromRGB(90, 30, 30))
local laserBtn  = mkBtn("เลเซอร์ล็อก: ON", 6, 316, 220, 22, Color3.fromRGB(40, 110, 50))

local targetLabel = mkLabel("เป้าหมาย: -", 6, 344, 220)
targetLabel.TextColor3 = Color3.fromRGB(255, 220, 120)
local help = mkLabel("X=เปิด/ปิด Aimbot | คลิกขวาค้าง=ล็อก", 6, 362, 220)
help.TextColor3 = Color3.fromRGB(140, 140, 140)
local help2 = mkLabel("คลิกซ้าย (ถือปืน)=ยิงกระสุนติดตาม", 6, 376, 220)
help2.TextColor3 = Color3.fromRGB(140, 140, 140)

-- ================== [[ GUI EVENTS ]] ==================
local PARTS = {"Head", "Torso", "HumanoidRootPart"}
local PART_NAMES = {Head = "หัว (HEAD)", Torso = "อก (TORSO)", HumanoidRootPart = "ตัว (ROOT)"}

aimBtn.MouseButton1Click:Connect(function()
    Settings.Aimbot = not Settings.Aimbot
    aimBtn.Text = Settings.Aimbot and "AIMBOT: ON" or "AIMBOT: OFF"
    refreshTogBtn(aimBtn, Settings.Aimbot, Color3.fromRGB(90, 30, 30))
    fovCircle.Visible = Settings.Aimbot
end)
espBtn.MouseButton1Click:Connect(function()
    Settings.ESP = not Settings.ESP
    espBtn.Text = Settings.ESP and "ESP: ON" or "ESP: OFF"
    refreshTogBtn(espBtn, Settings.ESP, Color3.fromRGB(90, 30, 30))
end)
partBtn.MouseButton1Click:Connect(function()
    local idx = table.find(PARTS, Settings.TargetPart) or 1
    idx = idx % #PARTS + 1
    Settings.TargetPart = PARTS[idx]
    partBtn.Text = "จุดล็อก: " .. PART_NAMES[Settings.TargetPart]
end)
criminalBtn.MouseButton1Click:Connect(function()
    Settings.TeamCriminal = not Settings.TeamCriminal
    criminalBtn.Text = "อาชญากร: " .. (Settings.TeamCriminal and "ON" or "OFF")
    refreshTogBtn(criminalBtn)
end)
guardsBtn.MouseButton1Click:Connect(function()
    Settings.TeamGuards = not Settings.TeamGuards
    guardsBtn.Text = "ตำรวจ: " .. (Settings.TeamGuards and "ON" or "OFF")
    refreshTogBtn(guardsBtn)
end)
inmatesBtn.MouseButton1Click:Connect(function()
    Settings.TeamInmates = not Settings.TeamInmates
    inmatesBtn.Text = "นักโทษ: " .. (Settings.TeamInmates and "ON" or "OFF")
    refreshTogBtn(inmatesBtn)
end)
wallBtn.MouseButton1Click:Connect(function()
    Settings.WallCheck = not Settings.WallCheck
    wallBtn.Text = "เช็กกำแพง: " .. (Settings.WallCheck and "ON" or "OFF")
    refreshTogBtn(wallBtn)
end)
toggleModeBtn.MouseButton1Click:Connect(function()
    Settings.ToggleMode = not Settings.ToggleMode
    toggleModeBtn.Text = "โหมดล็อกค้าง: " .. (Settings.ToggleMode and "ON" or "OFF")
    refreshTogBtn(toggleModeBtn)
    toggleLocked = false
end)
tracerBtn.MouseButton1Click:Connect(function()
    Settings.Tracer = not Settings.Tracer
    tracerBtn.Text = "กระสุนติดตาม: " .. (Settings.Tracer and "ON" or "OFF")
    refreshTogBtn(tracerBtn, Settings.Tracer, Color3.fromRGB(35, 40, 60))
end)
silentBtn.MouseButton1Click:Connect(function()
    Settings.SilentAim = not Settings.SilentAim
    silentBtn.Text = "SILENT AIM: " .. (Settings.SilentAim and "ON" or "OFF")
    refreshTogBtn(silentBtn, Settings.SilentAim, Color3.fromRGB(90, 30, 30))
    if Settings.SilentAim and not silentHooked then installSilentAim() end
end)
laserBtn.MouseButton1Click:Connect(function()
    Settings.Laser = not Settings.Laser
    laserBtn.Text = "เลเซอร์ล็อก: " .. (Settings.Laser and "ON" or "OFF")
    refreshTogBtn(laserBtn, Settings.Laser, Color3.fromRGB(35, 40, 60))
end)

refreshTogBtn(criminalBtn, true)
refreshTogBtn(guardsBtn, true)
refreshTogBtn(inmatesBtn, true)
refreshTogBtn(wallBtn, true)
refreshTogBtn(tracerBtn, true, Color3.fromRGB(35, 40, 60))
refreshTogBtn(laserBtn, true, Color3.fromRGB(35, 40, 60))

-- ================== [[ INPUT ]] ==================
UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == TOGGLE_KEY then
        Settings.Aimbot = not Settings.Aimbot
        aimBtn.Text = Settings.Aimbot and "AIMBOT: ON" or "AIMBOT: OFF"
        refreshTogBtn(aimBtn, Settings.Aimbot, Color3.fromRGB(90, 30, 30))
        fovCircle.Visible = Settings.Aimbot
    end
    if input.UserInputType == AIM_KEY then
        if Settings.ToggleMode then
            toggleLocked = not toggleLocked
        else
            aimingHeld = true
        end
    end
    -- [NEW] คลิกซ้ายขณะถือปืน = ยิงกระสุนติดตาม (กระสุนจริงยิงตามเกมอยู่แล้ว)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and Settings.Tracer then
        local char = LP.Character
        if char and char:FindFirstChildOfClass("Tool") then
            fireTracer()
        end
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == AIM_KEY and not Settings.ToggleMode then
        aimingHeld = false
    end
end)

-- ================== [[ MAIN LOOP ]] ==================
local espTick = 0
RunService.RenderStepped:Connect(function(dt)
    local wantAim = Settings.Aimbot and (aimingHeld or toggleLocked)
    if wantAim then
        currentTarget = getTarget()
        if currentTarget then
            aimAt(currentTarget, dt)
        end
    else
        currentTarget = nil
    end
    fovCircle.Visible = Settings.Aimbot
    fovCircle.UIStroke.Color = currentTarget and Color3.fromRGB(80, 255, 120) or Color3.fromRGB(255, 80, 80)

    if currentTarget then
        local model = currentTarget:FindFirstAncestorOfClass("Model")
        local p = model and Players:GetPlayerFromCharacter(model)
        targetLabel.Text = "เป้าหมาย: " .. (p and p.Name or "?") .. " [" .. Settings.TargetPart .. "]"
    else
        targetLabel.Text = "เป้าหมาย: -"
    end

    updateTracers(dt)   -- [NEW]
    updateLaser()       -- [NEW]

    espTick = espTick + dt
    if espTick >= 0.5 then
        espTick = 0
        syncESP()
    end
end)

print("[PL Aim&ESP v1.1] loaded | X=aimbot, RMB=ล็อก, คลิกซ้าย(ถือปืน)=กระสุนติดตาม")
