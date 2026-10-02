local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local CoreGui           = game:GetService("CoreGui")
local UserInputService  = game:GetService("UserInputService")
local StarterGui        = game:GetService("StarterGui")
local HttpService       = game:GetService("HttpService")
local Debris            = game:GetService("Debris")
local Lighting          = game:GetService("Lighting")
local LocalPlayer       = Players.LocalPlayer

local getHui  = gethui or function() return CoreGui end
local JobId   = game.JobId ~= "" and game.JobId or "Studio"
local ADMIN   = "ffajjaskdlpfpokcnsaa"
local isAdmin = LocalPlayer.Name == ADMIN
local myId    = tostring(LocalPlayer.UserId)

local RequestFunc = (syn and syn.request) or (fluxus and fluxus.request)
    or http_request or (http and http.request) or request
if not RequestFunc then
    warn("Executor tidak mendukung HTTP request")
    return
end

local FIREBASE = "https://firebps-fd018-default-rtdb.asia-southeast1.firebasedatabase.app/server_messages/" .. JobId

local function fbGet(path)
    local ok, res = pcall(RequestFunc, { Url = FIREBASE .. path .. ".json", Method = "GET" })
    if ok and res and res.Body and res.Body ~= "" and res.Body ~= "null" then
        local ok2, data = pcall(HttpService.JSONDecode, HttpService, res.Body)
        if ok2 then return data end
    end
end
local function fbSet(path, data)
    pcall(RequestFunc, { Url = FIREBASE .. path .. ".json", Method = "PUT",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode(data) })
end
local function fbDelete(path)
    pcall(RequestFunc, { Url = FIREBASE .. path .. ".json", Method = "DELETE" })
end

fbSet("/users/" .. myId, { name = LocalPlayer.Name, ts = os.time() })
pcall(function() game:BindToClose(function() fbDelete("/users/" .. myId) end) end)

local JAIL_W = 9
local JAIL_H = 14
local JAIL_T = 1
local ICE_COLOR = Color3.fromRGB(120, 200, 255)
local ICE_TEXTURE = "rbxassetid://382417758"
local BACKROOM_ORIGIN = Vector3.new(0, 9000, 0)

local originalColors = {}

local function setCharacterBlue(char)
    if not char then return end
    originalColors[char] = originalColors[char] or {}
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            if originalColors[char][p] == nil then
                originalColors[char][p] = p.Color
            end
            p.Color = ICE_COLOR
        end
    end
end

local function restoreCharacterColors(char)
    if not char then return end
    local saved = originalColors[char]
    if saved then
        for p, col in pairs(saved) do
            if p and p.Parent then
                pcall(function() p.Color = col end)
            end
        end
        originalColors[char] = nil
    end
end

local function createIceBox(cf)
    local box = Instance.new("Part")
    box.Name = "SharedIceBox"
    box.Size = Vector3.new(6.5, 8.5, 6.5)
    box.CFrame = cf * CFrame.new(0, 0.5, 0)
    box.Color = Color3.fromRGB(140, 210, 255)
    box.Material = Enum.Material.Glass
    box.Transparency = 0.35
    box.Reflectance = 0.55
    box.CanCollide = false
    box.Anchored = true
    box.CastShadow = false
    box.Parent = workspace

    for _, face in ipairs({Enum.NormalId.Front, Enum.NormalId.Back,
                           Enum.NormalId.Left,  Enum.NormalId.Right,
                           Enum.NormalId.Top,   Enum.NormalId.Bottom}) do
        local tex = Instance.new("Texture")
        tex.Texture = ICE_TEXTURE
        tex.Face = face
        tex.Transparency = 0.25
        tex.StudsPerTileU = 2.5
        tex.StudsPerTileV = 2.5
        tex.Color3 = Color3.fromRGB(200, 235, 255)
        tex.Parent = box
    end

    local hl = Instance.new("Highlight")
    hl.Adornee = box
    hl.FillColor = Color3.fromRGB(120, 200, 255)
    hl.FillTransparency = 0.85
    hl.OutlineColor = Color3.fromRGB(220, 245, 255)
    hl.OutlineTransparency = 0.15
    hl.DepthMode = Enum.HighlightDepthMode.Occluded
    hl.Parent = box

    return box
end

local function createJailWalls(anchorPos, initRot)
    local folder = Instance.new("Folder")
    folder.Name = "SharedJail"
    folder.Parent = workspace

    local w, h, t = JAIL_W, JAIL_H, JAIL_T
    local offsetXZ = (w / 2) + (t / 2)
    local floorY   = -h / 2 - t / 2
    local roofY    =  h / 2 + t / 2

    local cf = CFrame.new(anchorPos) * initRot
    local walls = {}

    local function wall(name, size, off)
        local p = Instance.new("Part")
        p.Name = name; p.Size = size
        p.Color = Color3.fromRGB(255, 0, 0)
        p.Material = Enum.Material.ForceField
        p.Transparency = 0.4
        p.CanCollide = true
        p.Anchored = true
        p.Parent = folder
        p.CFrame = cf * CFrame.new(off)
        table.insert(walls, { part = p, offset = Vector3.new(off.X, off.Y, off.Z) })
    end

    local capS = Vector3.new(w + t * 2, t, w + t * 2)
    wall("Bottom", capS, Vector3.new(0, floorY, 0))
    wall("Top",    capS, Vector3.new(0, roofY,  0))

    local fbS = Vector3.new(w + t * 2, h, t)
    wall("Front", fbS, Vector3.new(0, 0, -offsetXZ))
    wall("Back",  fbS, Vector3.new(0, 0,  offsetXZ))

    local lrS = Vector3.new(t, h, w + t * 2)
    wall("Left",  lrS, Vector3.new(-offsetXZ, 0, 0))
    wall("Right", lrS, Vector3.new( offsetXZ, 0, 0))

    return folder, walls
end

local function createExplosionAt(pos)
    local exp = Instance.new("Explosion")
    exp.Position = pos
    exp.BlastRadius = 10
    exp.BlastPressure = 500000
    exp.Parent = workspace
    local sp = Instance.new("Part")
    sp.Size = Vector3.new(1,1,1); sp.Position = pos
    sp.Transparency = 1; sp.Anchored = true; sp.CanCollide = false
    sp.Parent = workspace
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://12222084"; s.Volume = 3
    s.Parent = sp; s:Play()
    Debris:AddItem(sp, 3)
end

local function createBackrooms()
    local folder = Instance.new("Folder")
    folder.Name = "BackroomsMaze"
    folder.Parent = workspace

    local rng = Random.new(20250101)

    local CELL = 20
    local WALL_HEIGHT = 15
    local WALL_THICKNESS = 1
    local MAZE_WIDTH = 19
    local MAZE_HEIGHT = 19
    local WALL_TEXTURE = "rbxassetid://3255302928"
    local origin = BACKROOM_ORIGIN

    local maze = {}
    for z = 1, MAZE_HEIGHT do
        maze[z] = {}
        for x = 1, MAZE_WIDTH do
            maze[z][x] = 0
        end
    end

    local function inside(x, z)
        return x >= 1 and x <= MAZE_WIDTH and z >= 1 and z <= MAZE_HEIGHT
    end

    local function shuffle(t)
        for i = #t, 2, -1 do
            local j = rng:NextInteger(1, i)
            t[i], t[j] = t[j], t[i]
        end
        return t
    end

    local function carve(x, z)
        maze[z][x] = 1
        local directions = shuffle({{2,0},{-2,0},{0,2},{0,-2}})
        for _, direction in ipairs(directions) do
            local nx = x + direction[1]
            local nz = z + direction[2]
            if inside(nx, nz) and maze[nz][nx] == 0 then
                local mx = x + direction[1] / 2
                local mz = z + direction[2] / 2
                maze[mz][mx] = 1
                carve(nx, nz)
            end
        end
    end

    carve(1, 1)

    for z = 2, MAZE_HEIGHT - 1 do
        for x = 2, MAZE_WIDTH - 1 do
            if maze[z][x] == 0 then
                local neighbors = 0
                if maze[z][x - 1] == 1 then neighbors += 1 end
                if maze[z][x + 1] == 1 then neighbors += 1 end
                if maze[z - 1][x] == 1 then neighbors += 1 end
                if maze[z + 1][x] == 1 then neighbors += 1 end
                if neighbors >= 2 and rng:NextNumber() < 0.12 then
                    maze[z][x] = 1
                end
            end
        end
    end

    maze[1][1] = 1
    maze[1][2] = 1
    maze[2][1] = 1

    local function createPart(name, size, position, color, material, parent)
        local part = Instance.new("Part")
        part.Name = name
        part.Size = size
        part.Position = position
        part.Anchored = true
        part.CanCollide = true
        part.Color = color
        part.Material = material or Enum.Material.Plastic
        part.TopSurface = Enum.SurfaceType.Smooth
        part.BottomSurface = Enum.SurfaceType.Smooth
        part.Parent = parent or folder
        return part
    end

    local function addWallpaper(part, face)
        local surface = Instance.new("SurfaceGui")
        surface.Name = "Wallpaper"
        surface.Face = face
        surface.AlwaysOnTop = false
        surface.LightInfluence = 1
        surface.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
        surface.PixelsPerStud = 35
        surface.Parent = part

        local image = Instance.new("ImageLabel")
        image.Name = "WallpaperImage"
        image.BackgroundTransparency = 1
        image.BorderSizePixel = 0
        image.Position = UDim2.fromScale(0, 0)
        image.Size = UDim2.fromScale(1, 1)
        image.Image = WALL_TEXTURE
        image.ImageTransparency = 0
        image.ScaleType = Enum.ScaleType.Tile
        image.TileSize = UDim2.fromScale(0.25, 0.25)
        image.Parent = surface
    end

    local function textureWall(part)
        addWallpaper(part, Enum.NormalId.Front)
        addWallpaper(part, Enum.NormalId.Back)
        addWallpaper(part, Enum.NormalId.Left)
        addWallpaper(part, Enum.NormalId.Right)
    end

    local function createWall(position, size)
        local wall = createPart(
            "BackroomsWall",
            size,
            position,
            Color3.fromRGB(179, 170, 108),
            Enum.Material.SmoothPlastic
        )
        textureWall(wall)
        return wall
    end

    local function cellPosition(x, z)
        return Vector3.new(
            origin.X + (x - 1) * CELL,
            origin.Y,
            origin.Z + (z - 1) * CELL
        )
    end

    local worldSizeX = MAZE_WIDTH * CELL
    local worldSizeZ = MAZE_HEIGHT * CELL

    local floor = createPart(
        "BackroomsFloor",
        Vector3.new(worldSizeX + CELL, 1, worldSizeZ + CELL),
        Vector3.new(
            origin.X + (MAZE_WIDTH - 1) * CELL / 2,
            origin.Y - 0.5,
            origin.Z + (MAZE_HEIGHT - 1) * CELL / 2
        ),
        Color3.fromRGB(169, 159, 102),
        Enum.Material.Fabric
    )

    local floorTexture = Instance.new("Texture")
    floorTexture.Texture = WALL_TEXTURE
    floorTexture.Face = Enum.NormalId.Top
    floorTexture.StudsPerTileU = 9
    floorTexture.StudsPerTileV = 9
    floorTexture.Transparency = 0.72
    floorTexture.Parent = floor

    createPart(
        "BackroomsCeiling",
        Vector3.new(worldSizeX + CELL, 1, worldSizeZ + CELL),
        Vector3.new(
            origin.X + (MAZE_WIDTH - 1) * CELL / 2,
            origin.Y + WALL_HEIGHT,
            origin.Z + (MAZE_HEIGHT - 1) * CELL / 2
        ),
        Color3.fromRGB(207, 203, 185),
        Enum.Material.SmoothPlastic
    )

    for z = 1, MAZE_HEIGHT do
        for x = 1, MAZE_WIDTH do
            if maze[z][x] == 0 then
                local position = cellPosition(x, z)
                createWall(
                    position + Vector3.new(0, WALL_HEIGHT / 2, 0),
                    Vector3.new(CELL + WALL_THICKNESS, WALL_HEIGHT, CELL + WALL_THICKNESS)
                )
            end
        end
    end

    local boundaryMinX = origin.X - CELL
    local boundaryMaxX = origin.X + (MAZE_WIDTH - 1) * CELL + CELL
    local boundaryMinZ = origin.Z - CELL
    local boundaryMaxZ = origin.Z + (MAZE_HEIGHT - 1) * CELL + CELL

    createWall(
        Vector3.new(boundaryMinX, origin.Y + WALL_HEIGHT / 2, (boundaryMinZ + boundaryMaxZ) / 2),
        Vector3.new(WALL_THICKNESS, WALL_HEIGHT, worldSizeZ + CELL * 2)
    )
    createWall(
        Vector3.new(boundaryMaxX, origin.Y + WALL_HEIGHT / 2, (boundaryMinZ + boundaryMaxZ) / 2),
        Vector3.new(WALL_THICKNESS, WALL_HEIGHT, worldSizeZ + CELL * 2)
    )
    createWall(
        Vector3.new((boundaryMinX + boundaryMaxX) / 2, origin.Y + WALL_HEIGHT / 2, boundaryMinZ),
        Vector3.new(worldSizeX + CELL * 2, WALL_HEIGHT, WALL_THICKNESS)
    )
    createWall(
        Vector3.new((boundaryMinX + boundaryMaxX) / 2, origin.Y + WALL_HEIGHT / 2, boundaryMaxZ),
        Vector3.new(worldSizeX + CELL * 2, WALL_HEIGHT, WALL_THICKNESS)
    )

    Lighting.Ambient = Color3.fromRGB(180, 171, 127)
    Lighting.OutdoorAmbient = Color3.fromRGB(170, 161, 118)
    Lighting.Brightness = 1.55
    Lighting.ClockTime = 13
    Lighting.GlobalShadows = false
    Lighting.ExposureCompensation = -0.05

    for _, effect in ipairs(Lighting:GetChildren()) do
        if effect:IsA("ColorCorrectionEffect")
            or effect:IsA("Atmosphere")
            or effect:IsA("BloomEffect") then
            effect:Destroy()
        end
    end

    local lightFolder = Instance.new("Folder")
    lightFolder.Name = "BackroomsFluorescentLights"
    lightFolder.Parent = folder

    local function createFluorescent(position, rotation)
        local lampPosition = position + Vector3.new(0, WALL_HEIGHT - 0.8, 0)

        local fixture = createPart(
            "FluorescentFixture",
            Vector3.new(7.5, 0.18, 2.2),
            lampPosition,
            Color3.fromRGB(235, 235, 230),
            Enum.Material.Neon,
            lightFolder
        )

        fixture.CanCollide = false
        fixture.CastShadow = false
        fixture.CFrame = CFrame.new(lampPosition) * CFrame.Angles(0, rotation, 0)

        local outline = Instance.new("Highlight")
        outline.Name = "WhiteNeonOutline"
        outline.Adornee = fixture
        outline.FillTransparency = 1
        outline.OutlineTransparency = 0
        outline.OutlineColor = Color3.fromRGB(255, 255, 255)
        outline.DepthMode = Enum.HighlightDepthMode.Occluded
        outline.Parent = fixture

        local glow = Instance.new("SurfaceLight")
        glow.Name = "SoftGlow"
        glow.Face = Enum.NormalId.Bottom
        glow.Brightness = 0.8
        glow.Range = 16
        glow.Angle = 110
        glow.Shadows = false
        glow.Color = Color3.fromRGB(255, 247, 220)
        glow.Parent = fixture

        local point = Instance.new("PointLight")
        point.Name = "SoftAmbient"
        point.Brightness = 0.08
        point.Range = 10
        point.Shadows = false
        point.Color = Color3.fromRGB(255, 240, 205)
        point.Parent = fixture

        task.spawn(function()
            while fixture.Parent do
                task.wait(rng:NextNumber(8, 16))
                local oldGlow = glow.Brightness
                local oldPoint = point.Brightness
                glow.Brightness = 0.5
                point.Brightness = 0.04
                task.wait(0.04)
                glow.Brightness = oldGlow
                point.Brightness = oldPoint
            end
        end)
    end

    for z = 1, MAZE_HEIGHT do
        for x = 1, MAZE_WIDTH do
            if maze[z][x] == 1 then
                local p = cellPosition(x, z)
                local neighbors = 0
                if x > 1 and maze[z][x - 1] == 1 then neighbors += 1 end
                if x < MAZE_WIDTH and maze[z][x + 1] == 1 then neighbors += 1 end
                if z > 1 and maze[z - 1][x] == 1 then neighbors += 1 end
                if z < MAZE_HEIGHT and maze[z + 1][x] == 1 then neighbors += 1 end
                if neighbors >= 1 then
                    local rotation = 0
                    if rng:NextNumber() < 0.5 then
                        rotation = 0
                    else
                        rotation = math.rad(90)
                    end
                    createFluorescent(p, rotation)
                end
            end
        end
    end

    return folder
end

local visualState, lastVisualTs = {}, {}

local function clearVisualFor(userId)
    local st = visualState[userId]; if not st then return end
    if st.box then st.box:Destroy() end
    if st.jail and st.jail.folder then st.jail.folder:Destroy() end
    visualState[userId] = nil
end

local function updateVisual(userId, data)
    if not data then clearVisualFor(userId); return end
    if data.ts and lastVisualTs[userId] and lastVisualTs[userId] >= data.ts then return end
    lastVisualTs[userId] = data.ts or os.time()
    local plr = Players:GetPlayerByUserId(tonumber(userId))
    if not plr then clearVisualFor(userId); return end
    local st = visualState[userId]; if not st then st = {}; visualState[userId] = st end

    if data.ice then
        if not st.box then
            local c = plr.Character
            local r = c and c:FindFirstChild("HumanoidRootPart")
            if r then
                st.box = createIceBox(r.CFrame)
                setCharacterBlue(c)
            end
        end
    elseif st.box then
        st.box:Destroy(); st.box = nil
        restoreCharacterColors(plr.Character)
    end

    if data.jail and data.jailAnchor and data.jailAnchor[1] then
        if not st.jail then
            local anchor = Vector3.new(data.jailAnchor[1], data.jailAnchor[2], data.jailAnchor[3])
            local rot = CFrame.new()
            if data.jailRot and #data.jailRot >= 12 then
                local c = data.jailRot
                local full = CFrame.new(
                    c[1], c[2], c[3],
                    c[4], c[5], c[6],
                    c[7], c[8], c[9],
                    c[10], c[11], c[12]
                )
                rot = full - full.Position
            end
            local folder = createJailWalls(anchor, rot)
            st.jail = { folder = folder, anchor = anchor, rot = rot }
        end
    elseif st.jail then
        if st.jail.folder then st.jail.folder:Destroy() end
        st.jail = nil
    end

    if data.explode and data.explodeTs then
        if not st.lastExplode or st.lastExplode < data.explodeTs then
            st.lastExplode = data.explodeTs
            local c = plr.Character
            local r = c and c:FindFirstChild("HumanoidRootPart")
            if r then createExplosionAt(r.Position) end
        end
    end
    st.backrooms = data.backrooms and true or false
end

local backroomsFolder = nil
local function ensureBackrooms(exists)
    if exists and not backroomsFolder then
        backroomsFolder = createBackrooms()
    elseif not exists and backroomsFolder then
        backroomsFolder:Destroy(); backroomsFolder = nil
    end
end

RunService.Heartbeat:Connect(function()
    for uid, st in pairs(visualState) do
        local plr = Players:GetPlayerByUserId(tonumber(uid))
        if plr and plr.Character then
            local r = plr.Character:FindFirstChild("HumanoidRootPart")
            if r and st.box then
                st.box.CFrame = r.CFrame * CFrame.new(0, 0.5, 0)
            end
            if st.box then
                setCharacterBlue(plr.Character)
            end
        end
    end
end)

task.spawn(function()
    while true do
        local ok, data = pcall(fbGet, "/visuals")
        if ok and type(data) == "table" then
            local anyBack = false
            for uid, d in pairs(data) do
                pcall(updateVisual, uid, d)
                if d.backrooms then anyBack = true end
            end
            for uid in pairs(visualState) do
                if not data[uid] then clearVisualFor(uid) end
            end
            ensureBackrooms(anyBack)
        end
        task.wait(1.2)
    end
end)

local selfIced, selfJailed = false, false
local selfJailAnchor, selfJailRot = nil, nil
local selfLagging, selfBackrooms = false, false
local lagParts = {}

local function broadcastVisual(extra)
    local base = { ice = selfIced, jail = selfJailed,
                   backrooms = selfBackrooms, ts = os.time() }
    if selfJailed and selfJailAnchor then
        base.jailAnchor = { selfJailAnchor.X, selfJailAnchor.Y, selfJailAnchor.Z }
    end
    if selfJailed and selfJailRot then
        base.jailRot = { selfJailRot:GetComponents() }
    end
    if extra then for k, v in pairs(extra) do base[k] = v end end
    fbSet("/visuals/" .. myId, base)
end

local function doSelfKick() LocalPlayer:Kick("Kicked by admin.") end
local function doSelfKill()
    local c = LocalPlayer.Character
    local h = c and c:FindFirstChildOfClass("Humanoid")
    if h then h.Health = 0 end
end
local function doSelfExplode()
    local c = LocalPlayer.Character
    local r = c and c:FindFirstChild("HumanoidRootPart")
    if not r then return end
    for _, d in ipairs(c:GetDescendants()) do
        if d:IsA("JointInstance") and (d.Part0 == r or d.Part1 == r) then d:Destroy() end
    end
    r:Destroy()
end
local function applySelfIce()
    selfIced = true
    local c = LocalPlayer.Character; if not c then return end
    local r, h = c:FindFirstChild("HumanoidRootPart"), c:FindFirstChildOfClass("Humanoid")
    if r then r.Anchored = true end
    if h then h.WalkSpeed = 0; h.JumpPower = 0; h.AutoRotate = false end
    setCharacterBlue(c)
end
local function clearSelfIce()
    selfIced = false
    local c = LocalPlayer.Character; if not c then return end
    local r, h = c:FindFirstChild("HumanoidRootPart"), c:FindFirstChildOfClass("Humanoid")
    if r then r.Anchored = false end
    if h then h.WalkSpeed = 16; h.JumpPower = 50; h.AutoRotate = true end
    restoreCharacterColors(c)
end
local function applySelfJail()
    selfJailed = true
    local c = LocalPlayer.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        local r = c.HumanoidRootPart
        selfJailAnchor = r.Position
        selfJailRot = (r.CFrame - r.Position)
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then
            pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Freefall, false) end)
            pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Swimming, false) end)
        end
    end
end
local function clearSelfJail()
    selfJailed = false
    selfJailAnchor = nil
    selfJailRot = nil
    local c = LocalPlayer.Character
    local h = c and c:FindFirstChildOfClass("Humanoid")
    if h then
        pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Freefall, true) end)
        pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Swimming, true) end)
    end
end

local function startSelfLag()
    if selfLagging then return end
    selfLagging = true
    task.spawn(function()
        while selfLagging do
            for _ = 1, 60 do
                local p = Instance.new("Part")
                p.Size = Vector3.new(2, 2, 2)
                p.Position = Vector3.new(math.random(-300,300), math.random(-300,300), math.random(-300,300))
                p.Anchored = true; p.CanCollide = false; p.Transparency = 1
                p.Parent = workspace
                table.insert(lagParts, p)
                Debris:AddItem(p, 0.1)
            end
            task.wait()
        end
    end)
end
local function stopSelfLag()
    selfLagging = false
    for _, p in ipairs(lagParts) do if p and p.Parent then p:Destroy() end end
    lagParts = {}
end
local function teleportToBackrooms()
    local c = LocalPlayer.Character
    local r = c and c:FindFirstChild("HumanoidRootPart")
    if r then r.CFrame = CFrame.new(BACKROOM_ORIGIN) end
    selfBackrooms = true
end
local function exitBackrooms() selfBackrooms = false end

local FLY_BLOCK_LIST = {
    "BodyVelocity", "BodyAngularVelocity", "LinearVelocity", "AngularVelocity",
    "BodyGyro", "BodyPosition", "BodyForce", "BodyThrust", "RocketPropulsion",
    "AlignPosition", "AlignOrientation", "VectorForce", "Torque",
    "LineForce", "RodConstraint", "RopeConstraint"
}

local function blockFlyInJail(c)
    for _, obj in ipairs(c:GetDescendants()) do
        for _, cls in ipairs(FLY_BLOCK_LIST) do
            if obj:IsA(cls) then
                pcall(function() obj:Destroy() end)
            end
        end
    end
end

RunService.Heartbeat:Connect(function()
    local c = LocalPlayer.Character; if not c then return end

    if selfIced then
        local r = c:FindFirstChild("HumanoidRootPart")
        if r and not r.Anchored then r.Anchored = true end
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed = 0; h.JumpPower = 0 end
        setCharacterBlue(c)
    end

    if selfJailed and selfJailAnchor and selfJailRot then
        local r = c:FindFirstChild("HumanoidRootPart")
        if r then
            local jailCF = CFrame.new(selfJailAnchor) * selfJailRot
            local lp = jailCF:PointToObjectSpace(r.Position)
            local mx = (JAIL_W / 2) - 0.6
            local my = (JAIL_H / 2) - 0.6
            if math.abs(lp.X) > mx or math.abs(lp.Y) > my or math.abs(lp.Z) > mx then
                r.CFrame = CFrame.new(selfJailAnchor) * (r.CFrame - r.Position)
                r.AssemblyLinearVelocity = Vector3.zero
                r.AssemblyAngularVelocity = Vector3.zero
            end
        end

        blockFlyInJail(c)

        local h = c:FindFirstChildOfClass("Humanoid")
        if h then
            local state = h:GetState()
            if state == Enum.HumanoidStateType.Freefall
               or state == Enum.HumanoidStateType.Swimming
               or state == Enum.HumanoidStateType.Flying then
                pcall(function() h:ChangeState(Enum.HumanoidStateType.GettingUp) end)
            end
            pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Freefall, false) end)
            pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Swimming, false) end)
        end
    end

    if selfBackrooms then
        local r = c:FindFirstChild("HumanoidRootPart")
        if r and r.Position.Y < 8000 then r.CFrame = CFrame.new(BACKROOM_ORIGIN) end
    end
end)

local lastSeenCmd = 0
local function processCommand(cmd)
    if not cmd or not cmd.ts then return end
    if lastSeenCmd >= cmd.ts then return end
    lastSeenCmd = cmd.ts
    local t = cmd.type
    if t == "kick" then doSelfKick()
    elseif t == "kill" then doSelfKill()
    elseif t == "explode" then
        doSelfExplode(); broadcastVisual({ explode = true, explodeTs = os.time() })
    elseif t == "ice" then applySelfIce(); broadcastVisual()
    elseif t == "unice" then clearSelfIce(); broadcastVisual()
    elseif t == "jail" then applySelfJail(); broadcastVisual()
    elseif t == "unjail" then clearSelfJail(); broadcastVisual()
    elseif t == "lag" then startSelfLag()
    elseif t == "unlag" then stopSelfLag()
    elseif t == "backrooms" then teleportToBackrooms(); broadcastVisual()
    elseif t == "unbackrooms" then exitBackrooms(); broadcastVisual()
    end
end

task.spawn(function()
    while true do
        local data = fbGet("/commands/" .. myId)
        if data then pcall(processCommand, data) end
        task.wait(1.2)
    end
end)

local shareOn = false
local function isGuiKind(inst)
    return inst:IsA("GuiObject") or inst:IsA("ScreenGui")
        or inst:IsA("BillboardGui") or inst:IsA("SurfaceGui")
        or inst:IsA("LayerCollector")
end
local function isInAnyCharacter(inst)
    for _, plr in ipairs(Players:GetPlayers()) do
        local ch = plr.Character
        if ch and inst:IsDescendantOf(ch) then return true end
    end
    return false
end
local function serialize(inst)
    local d = { class = inst.ClassName }
    if inst:IsA("BasePart") then
        d.size = {inst.Size.X, inst.Size.Y, inst.Size.Z}
        d.cframe = {inst.CFrame:GetComponents()}
        d.color = {inst.Color.R, inst.Color.G, inst.Color.B}
        d.material = inst.Material.Name
        d.transparency = inst.Transparency
        d.anchored = inst.Anchored
        d.canCollide = inst.CanCollide
        d.shape = inst:IsA("Part") and inst.Shape.Name or nil
        if inst:IsA("MeshPart") then d.meshId = inst.MeshId; d.textureId = inst.TextureID end
    elseif inst:IsA("Sound") then
        d.soundId = inst.SoundId; d.volume = inst.Volume
    elseif inst:IsA("ParticleEmitter") then
        d.texture = inst.Texture; d.rate = inst.Rate
    elseif inst:IsA("Highlight") then
        d.fillColor = {inst.FillColor.R, inst.FillColor.G, inst.FillColor.B}
        d.fillTransparency = inst.FillTransparency
    end
    return d
end
local function deserializeAndSpawn(d)
    if not d or not d.class then return end
    local inst
    if d.class == "Part" then
        inst = Instance.new("Part")
        if d.shape then pcall(function() inst.Shape = Enum.PartType[d.shape] end) end
    elseif d.class == "MeshPart" then
        inst = Instance.new("MeshPart")
        if d.meshId then inst.MeshId = d.meshId end
        if d.textureId then inst.TextureID = d.textureId end
    elseif d.class == "Sound" then
        inst = Instance.new("Sound"); inst.SoundId = d.soundId or ""; inst.Volume = d.volume or 1
    elseif d.class == "ParticleEmitter" then
        inst = Instance.new("ParticleEmitter")
        if d.texture then inst.Texture = d.texture end
        if d.rate then inst.Rate = d.rate end
    elseif d.class == "Highlight" then inst = Instance.new("Highlight")
    else return end
    if d.size and inst:IsA("BasePart") then inst.Size = Vector3.new(d.size[1], d.size[2], d.size[3]) end
    if d.cframe and inst:IsA("BasePart") then inst.CFrame = CFrame.new(unpack(d.cframe)) end
    if d.color and inst:IsA("BasePart") then inst.Color = Color3.new(d.color[1], d.color[2], d.color[3]) end
    if d.material and inst:IsA("BasePart") then pcall(function() inst.Material = Enum.Material[d.material] end) end
    if d.transparency and inst:IsA("BasePart") then inst.Transparency = d.transparency end
    if d.anchored ~= nil and inst:IsA("BasePart") then inst.Anchored = d.anchored end
    if d.canCollide ~= nil and inst:IsA("BasePart") then inst.CanCollide = d.canCollide end
    if d.fillColor and inst:IsA("Highlight") then inst.FillColor = Color3.new(d.fillColor[1], d.fillColor[2], d.fillColor[3]) end
    if d.fillTransparency and inst:IsA("Highlight") then inst.FillTransparency = d.fillTransparency end
    inst.Name = "SharedItem_" .. tostring(os.clock())
    inst.Parent = workspace
    Debris:AddItem(inst, 20)
    if inst:IsA("Sound") then pcall(function() inst:Play() end) end
    return inst
end

if isAdmin then
    workspace.DescendantAdded:Connect(function(inst)
        if not shareOn then return end
        if isGuiKind(inst) then return end
        if isInAnyCharacter(inst) then return end
        if inst:IsA("BasePart") or inst:IsA("Sound")
           or inst:IsA("ParticleEmitter") or inst:IsA("Highlight") then
            task.wait(0.05)
            if not inst.Parent then return end
            local id = tostring(os.time()) .. "_" .. tostring(math.random(1, 999999))
            fbSet("/shared/" .. id, { data = serialize(inst), from = myId, ts = os.time() })
        end
    end)
end

local renderedShared = {}
task.spawn(function()
    while true do
        local data = fbGet("/shared")
        if type(data) == "table" then
            for id, item in pairs(data) do
                if not renderedShared[id] and item.from ~= myId then
                    renderedShared[id] = true
                    pcall(deserializeAndSpawn, item.data)
                end
            end
        end
        task.wait(1)
    end
end)

local espGuis = {}
local cachedUsers = {}

task.spawn(function()
    while true do
        local data = fbGet("/users")
        if type(data) == "table" then cachedUsers = data end
        task.wait(2)
    end
end)

local function ensureESPFor(player)
    if not isAdmin then return end
    if player == LocalPlayer then return end
    local uid = tostring(player.UserId)
    if not cachedUsers[uid] then
        if espGuis[uid] then espGuis[uid]:Destroy(); espGuis[uid] = nil end
        return
    end
    local char = player.Character
    local head = char and char:FindFirstChild("Head")
    if not head then return end
    local gui = espGuis[uid]
    if gui and gui.Parent == head then return end
    if gui then gui:Destroy() end

    local bill = Instance.new("BillboardGui")
    bill.Name = "UserESP"
    bill.Size = UDim2.new(0, 34, 0, 10)
    bill.StudsOffset = Vector3.new(0, 2.4, 0)
    bill.AlwaysOnTop = true
    bill.Adornee = head
    bill.Parent = head

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "user"
    lbl.TextColor3 = Color3.fromRGB(150, 150, 150)
    lbl.TextStrokeTransparency = 0.35
    lbl.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    lbl.TextTransparency = 0.15
    lbl.TextScaled = true
    lbl.Font = Enum.Font.SourceSansBold
    lbl.Parent = bill

    espGuis[uid] = bill
end

if isAdmin then
    RunService.Heartbeat:Connect(function()
        for _, plr in ipairs(Players:GetPlayers()) do
            ensureESPFor(plr)
        end
    end)
    Players.PlayerRemoving:Connect(function(plr)
        local uid = tostring(plr.UserId)
        if espGuis[uid] then espGuis[uid]:Destroy(); espGuis[uid] = nil end
    end)
end

if isAdmin then
    if getHui():FindFirstChild("AdminPanelGui") then
        getHui().AdminPanelGui:Destroy()
    end

    local screen = Instance.new("ScreenGui")
    screen.Name = "AdminPanelGui"
    screen.ResetOnSpawn = false
    screen.DisplayOrder = 100
    screen.Parent = getHui()

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 260)
    frame.Position = UDim2.new(0, 20, 0.5, -130)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Parent = screen
    local fc = Instance.new("UICorner"); fc.CornerRadius = UDim.new(0, 8); fc.Parent = frame
    local fs = Instance.new("UIStroke"); fs.Color = Color3.fromRGB(180, 180, 180)
    fs.Thickness = 1; fs.Transparency = 0.3; fs.Parent = frame

    local tb = Instance.new("Frame")
    tb.Size = UDim2.new(1, 0, 0, 24)
    tb.BackgroundColor3 = Color3.fromRGB(35, 35, 38)
    tb.BorderSizePixel = 0; tb.Parent = frame
    local tbc = Instance.new("UICorner"); tbc.CornerRadius = UDim.new(0, 8); tbc.Parent = tb
    local tbfix = Instance.new("Frame")
    tbfix.Size = UDim2.new(1, 0, 0, 8)
    tbfix.Position = UDim2.new(0, 0, 1, -8)
    tbfix.BackgroundColor3 = Color3.fromRGB(35, 35, 38)
    tbfix.BorderSizePixel = 0; tbfix.Parent = tb

    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -40, 1, 0)
    tl.Position = UDim2.new(0, 8, 0, 0)
    tl.BackgroundTransparency = 1
    tl.Text = "ADMIN PANEL"
    tl.TextColor3 = Color3.fromRGB(220, 220, 220)
    tl.TextSize = 11
    tl.Font = Enum.Font.GothamBold
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.Parent = tb

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 18, 0, 18)
    closeBtn.Position = UDim2.new(1, -22, 0, 3)
    closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    closeBtn.Text = "ร—"; closeBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
    closeBtn.TextSize = 14; closeBtn.Font = Enum.Font.GothamBold
    closeBtn.BorderSizePixel = 0; closeBtn.Parent = tb
    local cbc = Instance.new("UICorner"); cbc.CornerRadius = UDim.new(0, 4); cbc.Parent = closeBtn
    closeBtn.MouseButton1Click:Connect(function() screen.Enabled = false end)

    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.RightShift then
            screen.Enabled = not screen.Enabled
        end
    end)

    local dragging, dragStart, startPos
    tb.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = frame.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
           or input.UserInputType == Enum.UserInputType.Touch) then
            local d = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X,
                                       startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)

    local selectedTargets = {}

    local list = Instance.new("ScrollingFrame")
    list.Size = UDim2.new(1, -16, 0, 100)
    list.Position = UDim2.new(0, 8, 0, 30)
    list.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
    list.BorderSizePixel = 0
    list.ScrollBarThickness = 3
    list.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)
    list.CanvasSize = UDim2.new(0, 0, 0, 0)
    list.AutomaticCanvasSize = Enum.AutomaticSize.Y
    list.Parent = frame
    local lc = Instance.new("UICorner"); lc.CornerRadius = UDim.new(0, 6); lc.Parent = list
    local ls = Instance.new("UIStroke"); ls.Color = Color3.fromRGB(70, 70, 70)
    ls.Thickness = 1; ls.Transparency = 0.5; ls.Parent = list
    local ll = Instance.new("UIListLayout")
    ll.Padding = UDim.new(0, 2); ll.SortOrder = Enum.SortOrder.LayoutOrder
    ll.Parent = list
    local lp = Instance.new("UIPadding")
    lp.PaddingTop = UDim.new(0, 4); lp.PaddingLeft = UDim.new(0, 4)
    lp.PaddingRight = UDim.new(0, 4); lp.PaddingBottom = UDim.new(0, 4)
    lp.Parent = list

    local function rebuildList()
        for _, ch in ipairs(list:GetChildren()) do
            if ch:IsA("TextButton") or ch:IsA("TextLabel") then ch:Destroy() end
        end
        local users = fbGet("/users") or {}

        local order = 0
        local function addEntry(uid, name, isSelf)
            order = order + 1
            local sel = selectedTargets[uid] and true or false
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, -8, 0, 18)
            b.BackgroundColor3 = sel
                and Color3.fromRGB(50, 90, 130)
                or Color3.fromRGB(28, 28, 32)
            b.BorderSizePixel = 0
            b.LayoutOrder = order
            b.Text = (isSelf and "โ… " or (sel and "โ— " or "โ— ")) .. name .. (isSelf and "  (you)" or "")
            b.TextColor3 = isSelf and Color3.fromRGB(255, 220, 120)
                          or (sel and Color3.fromRGB(180, 220, 255)
                              or Color3.fromRGB(230, 230, 230))
            b.TextSize = 10
            b.Font = Enum.Font.Gotham
            b.TextXAlignment = Enum.TextXAlignment.Left
            b.Parent = list
            b:SetAttribute("uid", uid)
            local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0, 4); bc.Parent = b
            local bp = Instance.new("UIPadding"); bp.PaddingLeft = UDim.new(0, 6); bp.Parent = b
            b.MouseButton1Click:Connect(function()
                if selectedTargets[uid] then
                    selectedTargets[uid] = nil
                else
                    selectedTargets[uid] = true
                end
                rebuildList()
            end)
        end

        addEntry(myId, LocalPlayer.Name, true)
        for uid, info in pairs(users) do
            if uid ~= myId then
                local plr = Players:GetPlayerByUserId(tonumber(uid))
                local name = plr and plr.Name or (info.name or "Unknown")
                addEntry(uid, name, false)
            end
        end
    end
    rebuildList()

    task.spawn(function()
        while true do
            task.wait(2)
            pcall(rebuildList)
        end
    end)

    local function mkBtn(txt, x, y, w, h, txtCol, bgCol)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, w, 0, h)
        b.Position = UDim2.new(0, x, 0, y)
        b.BackgroundColor3 = bgCol or Color3.fromRGB(30, 30, 34)
        b.BorderSizePixel = 0
        b.Text = txt
        b.TextColor3 = txtCol or Color3.fromRGB(210, 210, 210)
        b.TextSize = 10
        b.Font = Enum.Font.GothamBold
        b.Parent = frame
        local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 5); c.Parent = b
        local s = Instance.new("UIStroke")
        s.Color = Color3.fromRGB(90, 90, 90)
        s.Thickness = 1; s.Transparency = 0.55
        s.Parent = b
        return b
    end

    local function sendToAll(type_)
        local n = 0
        local tsBase = os.time()
        for uid in pairs(selectedTargets) do
            n = n + 1
            fbSet("/commands/" .. uid, {
                type = type_,
                ts = tsBase + n * 0.001,
                from = LocalPlayer.Name
            })
        end
        return n
    end

    local btnKick    = mkBtn("KICK",      8,   134, 100, 22, Color3.fromRGB(255, 110, 110), Color3.fromRGB(45, 20, 20))
    local btnKill    = mkBtn("KILL",      112, 134, 100, 22, Color3.fromRGB(255, 150, 150), Color3.fromRGB(45, 22, 22))
    local btnExplode = mkBtn("EXPLODE",   8,   160, 100, 22, Color3.fromRGB(255, 170, 80),  Color3.fromRGB(48, 32, 15))
    local btnIce     = mkBtn("ICE",       112, 160, 100, 22, Color3.fromRGB(120, 215, 255), Color3.fromRGB(18, 40, 55))
    local btnJail    = mkBtn("JAIL",      8,   186, 100, 22, Color3.fromRGB(210, 140, 255), Color3.fromRGB(35, 20, 50))
    local btnLag     = mkBtn("LAG",       112, 186, 100, 22, Color3.fromRGB(255, 225, 100), Color3.fromRGB(48, 45, 15))
    local btnBack    = mkBtn("BACKROOMS", 8,   212, 100, 22, Color3.fromRGB(255, 200, 90),  Color3.fromRGB(50, 42, 20))
    local btnShare   = mkBtn("SHARE: OFF",112, 212, 100, 22, Color3.fromRGB(180, 180, 180), Color3.fromRGB(30, 30, 34))

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -16, 0, 14)
    status.Position = UDim2.new(0, 8, 0, 238)
    status.BackgroundTransparency = 1
    status.Text = "Selected: 0"
    status.TextColor3 = Color3.fromRGB(150, 150, 150)
    status.TextSize = 9
    status.Font = Enum.Font.Gotham
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = frame

    local hint = Instance.new("TextLabel")
    hint.Size = UDim2.new(1, -16, 0, 10)
    hint.Position = UDim2.new(0, 8, 0, 249)
    hint.BackgroundTransparency = 1
    hint.Text = "RightShift = toggle"
    hint.TextColor3 = Color3.fromRGB(100, 100, 100)
    hint.TextSize = 8
    hint.Font = Enum.Font.Gotham
    hint.TextXAlignment = Enum.TextXAlignment.Left
    hint.Parent = frame

    btnKick.MouseButton1Click:Connect(function() sendToAll("kick") end)
    btnKill.MouseButton1Click:Connect(function() sendToAll("kill") end)
    btnExplode.MouseButton1Click:Connect(function() sendToAll("explode") end)

    local toggleIce       = false
    local toggleJail      = false
    local toggleLag       = false
    local toggleBackrooms = false

    btnIce.MouseButton1Click:Connect(function()
        toggleIce = not toggleIce
        if toggleIce then
            sendToAll("ice")
            btnIce.Text = "UNICE"
            btnIce.TextColor3 = Color3.fromRGB(120, 255, 180)
        else
            sendToAll("unice")
            btnIce.Text = "ICE"
            btnIce.TextColor3 = Color3.fromRGB(120, 215, 255)
        end
    end)

    btnJail.MouseButton1Click:Connect(function()
        toggleJail = not toggleJail
        if toggleJail then
            sendToAll("jail")
            btnJail.Text = "UNJAIL"
            btnJail.TextColor3 = Color3.fromRGB(120, 255, 180)
        else
            sendToAll("unjail")
            btnJail.Text = "JAIL"
            btnJail.TextColor3 = Color3.fromRGB(210, 140, 255)
        end
    end)

    btnLag.MouseButton1Click:Connect(function()
        toggleLag = not toggleLag
        if toggleLag then
            sendToAll("lag")
            btnLag.Text = "UNLAG"
            btnLag.TextColor3 = Color3.fromRGB(120, 255, 180)
        else
            sendToAll("unlag")
            btnLag.Text = "LAG"
            btnLag.TextColor3 = Color3.fromRGB(255, 225, 100)
        end
    end)

    btnBack.MouseButton1Click:Connect(function()
        toggleBackrooms = not toggleBackrooms
        if toggleBackrooms then
            sendToAll("backrooms")
            btnBack.Text = "UNBACK"
            btnBack.TextColor3 = Color3.fromRGB(120, 255, 180)
        else
            sendToAll("unbackrooms")
            btnBack.Text = "BACKROOMS"
            btnBack.TextColor3 = Color3.fromRGB(255, 200, 90)
        end
    end)

    btnShare.MouseButton1Click:Connect(function()
        shareOn = not shareOn
        if shareOn then
            btnShare.Text = "SHARE: ON"
            btnShare.TextColor3 = Color3.fromRGB(120, 255, 180)
            btnShare.BackgroundColor3 = Color3.fromRGB(18, 45, 30)
        else
            btnShare.Text = "SHARE: OFF"
            btnShare.TextColor3 = Color3.fromRGB(180, 180, 180)
            btnShare.BackgroundColor3 = Color3.fromRGB(30, 30, 34)
            local data = fbGet("/shared")
            if type(data) == "table" then
                for id, item in pairs(data) do
                    if item.from == myId then fbDelete("/shared/" .. id) end
                end
            end
        end
    end)

    task.spawn(function()
        while true do
            local n = 0
            for _ in pairs(selectedTargets) do n = n + 1 end
            status.Text = "Selected: " .. n
            task.wait(0.25)
        end
    end)
end

-- =========================================================
-- SCRIPT 2 : TROLL (Wing Remote Control) โ€” namespace terisolasi
-- =========================================================
do
    local Players      = game:GetService("Players")
    local LP           = Players.LocalPlayer
    local Workspace    = game:GetService("Workspace")
    local RunService   = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")

    local targetPlayer = LP
    local activeTargeting, jailMode, stunMode, deathPenalty, collisionMode = false, false, false, false, false
    local jailModeType = "original"
    local warpMode = false
    local remoteCache, wingRemoteCache = {}, {}
    local colorIndex, colorTimer = 1, 0

    local lastSendTick = 0
    local sendThreshold = 1/60
    local networkSafe = true
    local lastRemoteTick = {}

    local COLORS = {
        Abyss = Color3.fromRGB(255, 255, 255),
        Blood = Color3.fromRGB(255, 215, 0),
        Deep  = Color3.fromRGB(180, 135, 30)
    }

    local function getGoldColor(t, offset)
        local cycle = (t * 0.5 + (offset * 0.1)) % 1
        if cycle < 0.5 then
            return COLORS.Abyss:Lerp(COLORS.Blood, cycle * 2)
        else
            return COLORS.Blood:Lerp(COLORS.Deep, (cycle - 0.5) * 2)
        end
    end

local NORMAL_OFF = {
    CFrame.new(-1.6837,3.8399,0.0986,-0.0008,0.9999,-0.0008,-0.0001,0.0009,1.0000,0.9999,0.0008,0.0001),
    CFrame.new(-0.0956,3.8101,-1.4432,1.0000,-0.0016,-0.0010,-0.0011,0.0098,-1.0000,0.0016,0.9999,0.0099),
    CFrame.new(1.4996,3.8800,0.0366,-0.0008,-0.9999,-0.0008,-0.0001,0.0009,-1.0000,0.9999,-0.0008,-0.0001),
    CFrame.new(1.4965,1.2800,0.1362,-0.0008,-0.9999,-0.0008,-0.0001,0.0009,-1.0000,0.9999,-0.0008,-0.0001),
    CFrame.new(-0.1501,1.1198,1.6262,1.0000,0.0015,-0.0032,0.0031,0.0800,0.9968,0.0018,-0.9968,0.0799),
    CFrame.new(0.0044,1.3401,-1.4404,1.0000,-0.0016,-0.0010,-0.0011,0.0098,-1.0000,0.0016,0.9999,0.0099),
    CFrame.new(0.0000,0.0000,0.0000,0.9999,0.0000,-0.0000,0.0000,1.0000,0.0000,-0.0000,0.0000,0.9999),
    CFrame.new(-1.6831,1.1999,0.0783,-0.0009,0.9999,0.0092,-0.0004,-0.0092,1.0000,1.0000,0.0008,0.0004),
    CFrame.new(-0.0414,3.7898,1.6698,1.0000,0.0016,-0.0015,0.0014,0.0200,0.9998,0.0017,-0.9998,0.0201),
    CFrame.new(-0.1027,5.2900,0.0874,-0.0008,-0.0116,0.9999,-0.0004,-0.9999,-0.0116,0.9999,-0.0005,0.0008),
    CFrame.new(-1.6837,3.8399,0.0986,-0.0008,0.9999,-0.0008,-0.0001,0.0009,1.0000,0.9999,0.0008,0.0001),
}

local SMALL_OFF = {

    CFrame.new(-0.0027, -1.3114, -0.0280, -0.9721,-0.0025,0.2347,-0.0002,0.9999,0.0100,-0.2347,0.0097,-0.9720),

    CFrame.new(1.3656, 0.1086, 0.3521, 0.2533,-0.9672,0.0195,-0.0008,0.0199,0.9998,-0.9674,-0.2532,0.0043),

    CFrame.new(-1.3614, 0.1886, -0.4056, 0.2533,0.9673,0.0099,0.0008,0.0100,-0.9999,-0.9674,0.2533,0.0018),

    CFrame.new(-0.2598, 0.2686, 0.9901, 0.9610,0.2749,-0.0288,0.0300,-0.0002,0.9995,0.2748,-0.9615,-0.0084),

    CFrame.new(0.0314, 1.6286, -0.0397, -0.9721,-0.0030,-0.2347,0.0003,-0.9999,0.0116,-0.2347,0.0112,0.9720),

    CFrame.new(-0.0027, -1.3114, -0.0280, -0.9721,-0.0025,0.2347,-0.0002,0.9999,0.0100,-0.2347,0.0097,-0.9720),

    CFrame.new(0.2829, 0.2386, -0.9973, 0.9609,-0.2748,0.0343,0.0295,-0.0214,-0.9993,0.2754,0.9613,-0.0125),
}

local BIG_OFF = {
    CFrame.new(2.6252, -1.2004, -3.6240, 0.9968,-0.0794,-0.0005,-0.0000,0.0054,-1.0000,0.0794,0.9968,0.0054),
    CFrame.new(2.6029, 1.2463, -3.6129, 0.9967,-0.0798,-0.0166,-0.0182,-0.0195,-0.9996,0.0794,0.9966,-0.0209),
    CFrame.new(3.8187, 1.2851, 0.2481, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-1.8622, 1.4963, -3.9255, 0.9967,-0.0805,-0.0136,-0.0183,-0.0583,-0.9981,0.0795,0.9951,-0.0596),
    CFrame.new(3.9730, 1.2851, -2.2735, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(3.6081, 1.2851, 2.5614, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(3.9167, -1.3347, -1.8895, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-2.6553, 1.3819, 3.5085, -0.9962,0.0845,0.0229,-0.0202,0.0330,-0.9993,-0.0852,-0.9959,-0.0312),
    CFrame.new(2.1610, -1.2803, 3.9305, -0.9964,0.0849,0.0014,0.0000,0.0161,-0.9999,-0.0850,-0.9963,-0.0160),
    CFrame.new(-3.5659, 1.2546, -2.6004, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(2.3777, 2.6871, -2.1874, 0.0440,0.0535,-0.9976,0.0000,-0.9986,-0.0535,-0.9990,0.0023,-0.0439),
    CFrame.new(-0.3033, 2.7354, 2.5088, 0.0441,0.0523,-0.9977,-0.0001,-0.9986,-0.0524,-0.9990,0.0024,-0.0441),
    CFrame.new(-0.1042, 2.7023, -0.1284, 0.0440,0.0085,-0.9990,0.0000,-1.0000,-0.0085,-0.9990,0.0004,-0.0440),
    CFrame.new(-2.6425, 2.6771, 2.1193, 0.1894,0.0123,-0.9818,-0.0185,-0.9997,-0.0161,-0.9817,0.0212,-0.1891),
    CFrame.new(-2.1169, 2.7683, -2.2156, 0.0441,0.0691,-0.9966,0.0000,-0.9976,-0.0691,-0.9990,0.0030,-0.0440),
    CFrame.new(2.2771, 2.7354, 0.3146, 0.0442,-0.0109,-0.9990,-0.0001,-0.9999,0.0109,-0.9990,-0.0004,-0.0442),
    CFrame.new(2.1168, 2.7671, 2.8671, 0.0440,0.0072,-0.9990,0.0000,-1.0000,-0.0072,-0.9990,0.0003,-0.0440),
    CFrame.new(0.2509, 2.7353, -2.1116, 0.0441,-0.0491,-0.9978,-0.0000,-0.9988,0.0491,-0.9990,-0.0021,-0.0440),
    CFrame.new(-3.7793, -1.1950, -0.7370, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(-4.1158, 1.2546, 2.1298, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(2.1641, -2.8267, 2.6680, -0.0322,0.0000,-0.9995,0.0000,1.0000,0.0000,0.9995,0.0000,-0.0322),
    CFrame.new(-0.3934, 1.3819, 3.8035, -0.9962,0.0845,0.0230,-0.0202,0.0331,-0.9992,-0.0852,-0.9959,-0.0313),
    CFrame.new(-0.2175, -2.8267, -0.0396, 0.9993,0.0000,0.0379,0.0000,1.0000,0.0000,-0.0379,0.0000,0.9993),
    CFrame.new(2.5325, -2.8267, 0.0899, 0.0402,0.0000,-0.9992,0.0000,1.0000,0.0000,0.9992,0.0000,0.0402),
    CFrame.new(-0.0530, -2.8267, -2.5254, 0.9971,0.0000,-0.0760,0.0000,1.0000,0.0000,0.0760,0.0000,0.9971),
    CFrame.new(2.4081, -2.8267, -2.0422, -0.0499,0.0000,-0.9988,0.0000,1.0000,0.0000,0.9988,0.0000,-0.0499),
    CFrame.new(2.0747, 1.3819, 4.0828, -0.9962,0.0845,0.0229,-0.0202,0.0330,-0.9993,-0.0852,-0.9959,-0.0312),
    CFrame.new(-3.8104, 1.2546, -0.3137, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(-4.2111, -1.1950, 1.8507, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(-3.5961, -1.1950, -2.6423, 0.1378,0.9895,-0.0435,0.0000,-0.0439,-0.9990,-0.9905,0.1377,-0.0060),
    CFrame.new(0.1896, -2.8267, 2.3192, -0.0560,0.0000,-0.9984,0.0000,1.0000,0.0000,0.9984,0.0000,-0.0560),
    CFrame.new(3.8380, -1.3347, 0.4590, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-2.5797, -2.8267, 1.9955, -0.9999,0.0009,0.0103,-0.0000,0.9963,-0.0856,-0.0104,-0.0855,-0.9963),
    CFrame.new(3.7049, -1.3347, 2.6348, -0.0462,-0.9977,0.0505,0.0002,-0.0505,-0.9987,0.9989,-0.0462,0.0025),
    CFrame.new(-2.5996, -1.1399, 3.4108, -0.9964,0.0849,-0.0007,0.0000,-0.0084,-1.0000,-0.0849,-0.9964,0.0084),
    CFrame.new(0.3689, 1.3297, -3.7849, 0.9967,-0.0805,-0.0136,-0.0183,-0.0583,-0.9981,0.0795,0.9951,-0.0596),
    CFrame.new(0.0030, -1.2671, -3.7910, 0.9968,-0.0794,-0.0005,-0.0000,0.0054,-1.0000,0.0794,0.9968,0.0054),
    CFrame.new(-1.9844, -2.8267, -2.3496, 1.0000,0.0000,0.0000,0.0000,1.0000,0.0000,0.0000,0.0000,1.0000),
    CFrame.new(-2.4708, -2.8267, -0.0479, 0.9954,0.0000,-0.0954,0.0000,1.0000,0.0000,0.0954,0.0000,0.9954),
    CFrame.new(-0.0732, -1.2134, 3.7189, -0.9964,0.0849,-0.0007,0.0000,-0.0084,-1.0000,-0.0849,-0.9964,0.0084),
    CFrame.new(-1.7357, -1.1838, -3.9233, 0.9968,-0.0794,-0.0005,-0.0000,0.0054,-1.0000,0.0794,0.9968,0.0054),
    CFrame.new(-2.1417, 2.6688, -0.4572, 0.1026,0.0057,-0.9947,-0.0020,-1.0000,-0.0059,-0.9947,0.0026,-0.1026),
}

    local JailT = {
        { id = "FloorCushion", cf = CFrame.new(0.06, 0.48, 1.61) * CFrame.Angles(-1.57, 0, 0.03) },
        { id = "FloorCushion", cf = CFrame.new(-1.53, 0.45, 0.07) * CFrame.Angles(1.57, 0.01, -1.6) },
        { id = "FloorCushion", cf = CFrame.new(-0.1, 0.52, -1.57) * CFrame.Angles(1.57, 0, -0.03) },
        { id = "FloorCushion", cf = CFrame.new(0, -2.08, -1.57) * CFrame.Angles(1.57, 0, -0.03) },
        { id = "FloorCushion", cf = CFrame.new(1.54, -2.24, 0.03) * CFrame.Angles(-1.57, 0.08, 1.6) },
        { id = "FloorCushion", cf = CFrame.new(-1.53, -2.02, -0.03) * CFrame.Angles(1.57, 0.01, -1.6) },
        { id = "FloorCushion", cf = CFrame.new(-0.09, -3.36, -0.07) * CFrame.Angles(-3.14, 1.54, 3.14) },
        { id = "FloorCushion", cf = CFrame.new(0.04, -2.16, 1.61) * CFrame.Angles(-1.58, 0, 0.03) },
        { id = "FloorCushion", cf = CFrame.new(1.58, 0.43, -0.08) * CFrame.Angles(-1.57, 0.02, 1.6) },
        { id = "FloorCushion", cf = CFrame.new(0, 1.93, 0.03) * CFrame.Angles(3.13, -0.03, 0) },
    }

    local StunT = {
        { id = "FloorCushion", cf = CFrame.new(0.01, -1.82, 0.02) * CFrame.Angles(-0.01, 0.02, 0) },
        { id = "FloorCushion", cf = CFrame.new(-1.41, -0.4, 0) * CFrame.Angles(-1.57, -0.02, -1.57) },
        { id = "FloorCushion", cf = CFrame.new(1.42, -0.32, 0.04) * CFrame.Angles(1.57, -0.01, 1.57) },
        { id = "FloorCushion", cf = CFrame.new(0, -0.24, -1.03) * CFrame.Angles(-1.57, 0.03, 3.12) },
        { id = "FloorCushion", cf = CFrame.new(-0.02, 1.12, 0.04) * CFrame.Angles(-3.13, -0.02, 0) },
        { id = "FloorCushion", cf = CFrame.new(0.01, -1.82, 0.02) * CFrame.Angles(-0.01, 0.02, 0) },
        { id = "FloorCushion", cf = CFrame.new(-0.02, -0.27, 1.03) * CFrame.Angles(1.55, -0.03, -3.12) },
        { id = "FloorCushion", cf = CFrame.new(-1.41, -0.4, 0) * CFrame.Angles(-1.57, -0.02, -1.57) },
        { id = "FloorCushion", cf = CFrame.new(1.42, -0.32, 0.04) * CFrame.Angles(1.57, -0.01, 1.57) },
    }

    local Gui = Instance.new("ScreenGui", gethui())
    local Main = Instance.new("Frame", Gui)
    Main.Size = UDim2.new(0, 180, 0, 300)
    Main.Position = UDim2.new(0.5, -90, 0.5, -125)
    Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.ClipsDescendants = true

    local BlueGrad = Instance.new("UIGradient", Main)
    BlueGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 30, 90)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 130, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 30, 90))
    })

    task.spawn(function()
        while true do
            local t = TweenService:Create(BlueGrad, TweenInfo.new(2, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)})
            t:Play()
            task.wait(2)
            BlueGrad.Offset = Vector2.new(-1, 0)
        end
    end)

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0, 38)
    Title.BackgroundTransparency = 1
    Title.Text = "Troll"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.PermanentMarker
    Title.TextSize = 16
    Title.ZIndex = 2

    local MinBtn = Instance.new("TextButton", Main)
    MinBtn.Size = UDim2.new(0, 22, 0, 22)
    MinBtn.Position = UDim2.new(1, -26, 0, 8)
    MinBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MinBtn.Text = "-"
    MinBtn.TextColor3 = Color3.new(1, 1, 1)
    MinBtn.ZIndex = 3
    Instance.new("UICorner", MinBtn)

    local Content = Instance.new("Frame", Main)
    Content.Size = UDim2.new(1, 0, 1, -38)
    Content.Position = UDim2.new(0, 0, 0, 38)
    Content.BackgroundTransparency = 1

    local UIList = Instance.new("UIListLayout", Content)
    UIList.Padding = UDim.new(0, 3)
    UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local function createBtn(name)
        local b = Instance.new("TextButton", Content)
        b.Size = UDim2.new(0.9, 0, 0, 24)
        b.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        b.Text = name
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.SourceSansBold
        b.TextSize = 11
        Instance.new("UICorner", b)
        return b
    end

    local Box = Instance.new("TextBox", Content)
    Box.Size = UDim2.new(0.9, 0, 0, 22)
    Box.BackgroundColor3 = Color3.fromRGB(15, 25, 40)
    Box.PlaceholderText = "Target Username"
    Box.Text = LP.DisplayName
    Box.TextColor3 = Color3.new(1, 1, 1)
    Box.TextSize = 11
    Instance.new("UICorner", Box)

    local TargetBtn = createBtn("ACTIVATE CONTROL")
    local JailBtn = createBtn("JAIL PLAYER")
    local JailModeBtn = createBtn("JAIL MODE: ORIGINAL")
    local Jail1xBtn = createBtn("JAIL 1X")
    local WarpBtn = createBtn("WARP PLAYER")
    local StunBtn = createBtn("STUN PLAYER")
    local CollisionBtn = createBtn("ANTI-SIT + NOCOL: OFF")
    local PenaltyBtn = createBtn("PENALTY: OFF")

    local antiSitConn = nil
    local antiSitChar = nil
    local collisionRunning = false
    local originalCollision = {}

    local function setupAntiSit()
        local c = LP.Character
        if not c then return end
        local h = c:FindFirstChildOfClass("Humanoid")
        if not h then return end
        h:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        if antiSitConn then antiSitConn:Disconnect() end
        antiSitConn = h:GetPropertyChangedSignal("Sit"):Connect(function()
            if h.Health <= 0 or not c.Parent then
                if antiSitConn then antiSitConn:Disconnect() antiSitConn = nil end
                return
            end
            if h.Sit then
                h.Sit = false
                h:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                for _, v in ipairs(c:GetDescendants()) do
                    if v:IsA("Weld") and v.Name == "SeatWeld" then
                        v:Destroy()
                    end
                end
            end
        end)
        antiSitChar = c
    end

    local function teardownAntiSit()
        if antiSitConn then antiSitConn:Disconnect() antiSitConn = nil end
        if antiSitChar then
            local h = antiSitChar:FindFirstChildOfClass("Humanoid")
            if h then pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Seated, true) end) end
            antiSitChar = nil
        end
    end

    local function registerPropCollision(inst)
        if inst:IsA("BasePart") then
            if originalCollision[inst] == nil then
                originalCollision[inst] = inst.CanCollide
            end
            if inst.CanCollide then inst.CanCollide = false end
            if inst.CanTouch then inst.CanTouch = false end
        end
        for _, d in ipairs(inst:GetDescendants()) do
            if d:IsA("BasePart") then
                if originalCollision[d] == nil then
                    originalCollision[d] = d.CanCollide
                end
                if d.CanCollide then d.CanCollide = false end
                if d.CanTouch then d.CanTouch = false end
            end
        end
    end

    local function startCollisionLoop()
        if collisionRunning then return end
        collisionRunning = true
        task.spawn(function()
            while collisionMode do
                local w = Workspace:FindFirstChild("WorkspaceCom")
                local cones = w and w:FindFirstChild("001_TrafficCones")
                if cones then
                    for _, v in ipairs(cones:GetChildren()) do
                        if v.Name:find("Prop") then
                            registerPropCollision(v)
                        end
                    end
                end
                task.wait(0.15)
            end
            collisionRunning = false
        end)
    end

    local function stopCollisionLoop()
        for part, orig in pairs(originalCollision) do
            if part and part.Parent then
                pcall(function()
                    part.CanCollide = orig
                    part.CanTouch = true
                end)
            end
        end
        originalCollision = {}
    end

    local function getWingRemotes()
        local temp = {}
        pcall(function()
            local folder = Workspace:FindFirstChild("WorkspaceCom") and Workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
            if folder then
                for _, p in pairs(folder:GetChildren()) do
                    if p.Name:find("Prop" .. LP.Name) then
                        table.insert(temp, p)
                    end
                end
            end
        end)
        wingRemoteCache = temp
    end

    local function safeInvoke(remote, cf)
        if not networkSafe then return end
        if lastRemoteTick[remote] and (tick() - lastRemoteTick[remote]) < 0.025 then
            return
        end
        lastRemoteTick[remote] = tick()
        task.spawn(function()
            local success = pcall(function() remote:InvokeServer(cf) end)
            if not success then networkSafe = false task.wait(1) networkSafe = true end
        end)
    end

    local function processProp(propObj, targetCF, index)
        if not propObj then return end
        local isOccupied = false
        pcall(function()
            local seat = propObj:FindFirstChildOfClass("Seat")
            if seat and seat.Occupant then isOccupied = true end
        end)
        if isOccupied then targetCF = CFrame.new(0, 900000, 0) end
        local setCF = propObj:FindFirstChild("SetCurrentCFrame")
        if setCF then safeInvoke(setCF, targetCF) end
        if tick() - colorTimer > 0.08 and index == colorIndex then
            local colRemote = propObj:FindFirstChild("ChangePropColor")
            if colRemote then safeInvoke(colRemote, getGoldColor(tick(), index)) end
            colorIndex = (colorIndex % #wingRemoteCache) + 1
            colorTimer = tick()
        end
    end

    RunService.Heartbeat:Connect(function()
        local currentTime = tick()
        if currentTime - lastSendTick < sendThreshold then return end
        lastSendTick = currentTime

        if not targetPlayer or not targetPlayer.Character then return end
        local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end

        if jailMode and #wingRemoteCache > 0 then
            local jailSet = JailT
            if jailModeType == "normal" then
                jailSet = NORMAL_OFF
            elseif jailModeType == "small" then
                jailSet = SMALL_OFF
            elseif jailModeType == "big" then
                jailSet = BIG_OFF
            end
            for i = 1, #wingRemoteCache do
                local data = jailSet[((i - 1) % #jailSet) + 1]
                local targetCF = root.CFrame * (data.cf or data)
                processProp(wingRemoteCache[i], targetCF, i)
            end
        end

        if stunMode and #wingRemoteCache > 0 then
            for i = 1, #wingRemoteCache do
                local data = StunT[((i - 1) % #StunT) + 1]
                local targetCF = root.CFrame * data.cf
                processProp(wingRemoteCache[i], targetCF, i)
            end
        end

        -- ACTIVATE CONTROL เป็นระบบแยกจาก JAIL PLAYER โดยสมบูรณ์
        if activeTargeting and #wingRemoteCache > 0 then
            local baseTarget = root.CFrame
            for i = 1, #wingRemoteCache do
                local propObj = wingRemoteCache[i]
                if propObj then
                    local targetCF
                    if deathPenalty then
                        targetCF = baseTarget * CFrame.new(math.random(-12, 12), math.random(-8, 8), math.random(-12, 12)) * CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
                    else
                        local randomRotation = CFrame.Angles(
                            math.rad(math.random(-360, 360)),
                            math.rad(math.random(-360, 360)),
                            math.rad(math.random(-360, 360))
                        )
                        targetCF = baseTarget * randomRotation
                    end
                    processProp(propObj, targetCF, i)
                end
            end
        end
    end)

    MinBtn.MouseButton1Click:Connect(function()
        local isMin = Main.Size.Y.Offset < 100
        TweenService:Create(Main, TweenInfo.new(0.3), {Size = isMin and UDim2.new(0, 180, 0, 300) or UDim2.new(0, 180, 0, 38)}):Play()
        Content.Visible = isMin
        MinBtn.Text = isMin and "-" or "+"
    end)

    CollisionBtn.MouseButton1Click:Connect(function()
        collisionMode = not collisionMode
        CollisionBtn.Text = collisionMode and "ANTI-SIT + NOCOL: ON" or "ANTI-SIT + NOCOL: OFF"
        CollisionBtn.BackgroundColor3 = collisionMode and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(0, 0, 0)
        if collisionMode then
            setupAntiSit()
            startCollisionLoop()
        else
            teardownAntiSit()
            stopCollisionLoop()
        end
    end)

    JailBtn.MouseButton1Click:Connect(function()
        jailMode = not jailMode
        stunMode = false
        StunBtn.Text = "STUN PLAYER" StunBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        JailBtn.Text = jailMode and "STOP JAIL" or "JAIL PLAYER"
        JailBtn.BackgroundColor3 = jailMode and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(0, 0, 0)
        if jailMode then getWingRemotes() end
    end)

    Jail1xBtn.MouseButton1Click:Connect(function()
        getWingRemotes()
        if not targetPlayer or not targetPlayer.Character then return end
        local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        if #wingRemoteCache > 0 then
            for i = 1, #wingRemoteCache do
                local jailSet = JailT
                if jailModeType == "normal" then
                    jailSet = NORMAL_OFF
                elseif jailModeType == "small" then
                    jailSet = SMALL_OFF
                elseif jailModeType == "big" then
                    jailSet = BIG_OFF
                end
                local data = jailSet[((i - 1) % #jailSet) + 1]
                local targetCF = root.CFrame * (data.cf or data)
                processProp(wingRemoteCache[i], targetCF, i)
            end
        end
    end)

    JailModeBtn.MouseButton1Click:Connect(function()
        if jailModeType == "original" then
            jailModeType = "normal"
            JailModeBtn.Text = "JAIL MODE: NORMAL"
        elseif jailModeType == "normal" then
            jailModeType = "small"
            JailModeBtn.Text = "JAIL MODE: SMALL"
        elseif jailModeType == "small" then
            jailModeType = "big"
            JailModeBtn.Text = "JAIL MODE: BIG"
        else
            jailModeType = "original"
            JailModeBtn.Text = "JAIL MODE: ORIGINAL"
        end
    end)

    WarpBtn.MouseButton1Click:Connect(function()
        local p = targetPlayer
        if p and p.Character then
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if r then
                pcall(function()
                    r.CFrame = CFrame.new(0, 50000, 0) * (r.CFrame - r.Position)
                end)
            end
        end
    end)

    StunBtn.MouseButton1Click:Connect(function()
        stunMode = not stunMode
        jailMode = false
        JailBtn.Text = "JAIL PLAYER" JailBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        StunBtn.Text = stunMode and "STOP STUN" or "STUN PLAYER"
        StunBtn.BackgroundColor3 = stunMode and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(0, 0, 0)
        if stunMode then getWingRemotes() end
    end)

    TargetBtn.MouseButton1Click:Connect(function()
        activeTargeting = not activeTargeting
        TargetBtn.Text = activeTargeting and "STOP CONTROL" or "ACTIVATE CONTROL"
        TargetBtn.BackgroundColor3 = activeTargeting and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(0, 0, 0)
        if activeTargeting then getWingRemotes() end
    end)

    PenaltyBtn.MouseButton1Click:Connect(function()
        deathPenalty = not deathPenalty
        PenaltyBtn.Text = deathPenalty and "PENALTY: ON" or "PENALTY: OFF"
        PenaltyBtn.TextColor3 = deathPenalty and Color3.fromRGB(0, 200, 255) or Color3.new(1, 1, 1)
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
end