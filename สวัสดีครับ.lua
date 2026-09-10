deobfuscated by @Watup-Exploitz | discord.gg/EgbzrBqur2

local AllowedID = 3117817379 -- ID Khusus Request Lo (Ganti atau tambah jika mau share)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- Fungsi Kick Internal (Anti-Bypass)
local function SafetyCheck()
    if LP.UserId ~= AllowedID then
        LP:Kick("DYTON SECURITY: User Not Whitelisted. Access Revoked.")
        return false
    end
    return true
end

-- Lock Pertama (Initial Check)
if not SafetyCheck() then return end

local function getG(name)
    local decoded = ""
    for i = 1, #name do
        decoded = decoded .. string.char(string.byte(name, i))
    end
    return _G[decoded]
end

local function callEncrypted(obj, fname, ...)
    local fn = obj[fname]
    return fn(...)
end

local suspicionScore = 0
local maxScore = 400
local timingData = {}
local clockSources = {
    tick = tick(),
    clock = callEncrypted(getG("os") or os, "clock"),
    time = callEncrypted(getG("os") or os, "time")
}
local performanceBaseline = {}

local function safeNum(n)
    local offset = (tick() > 0 and 0 or 1)
    return n + offset + (math.random() > 2 and 1 or 0)
end

local function calculateDynamicScore(baseScore, severity, confidence)
    local m = getG("math") or math
    return callEncrypted(m, "floor", baseScore * severity * confidence)
end

local function establishPerformanceBaseline()
    local m = getG("math") or math
    local o = getG("os") or os
    
    local methods = {[1] = "sqrt", [2] = "sin", [3] = "clock"}
    local start = callEncrypted(o, methods[3])
    
    for i = 1, safeNum(1000) do
        local x = callEncrypted(m, methods[1], i) * callEncrypted(m, methods[2], i)
    end
    performanceBaseline.math = callEncrypted(o, methods[3]) - start
    
    start = callEncrypted(o, methods[3])
    for i = 1, safeNum(1000) do
        local Vec3 = getG("Vector3") or Vector3
        local props = {[1] = "new", [2] = "Magnitude"}
        local v = callEncrypted(Vec3, props[1], i, i, i)
        local mag = v[props[2]]
    end
    performanceBaseline.vector = callEncrypted(o, methods[3]) - start
    
    start = callEncrypted(o, methods[3])
    local buf = getG("buffer") or buffer
    local bufMethods = {[1] = "create", [2] = "writeu8"}
    local b = callEncrypted(buf, bufMethods[1], safeNum(1024))
    for i = 0, safeNum(255) do
        callEncrypted(buf, bufMethods[2], b, i, i)
    end
    performanceBaseline.buffer = callEncrypted(o, methods[3]) - start
end

local taskLib = getG("task") or task
local taskMethods = {[1] = "spawn", [2] = "wait"}
callEncrypted(taskLib, taskMethods[1], function()
    callEncrypted(taskLib, taskMethods[2], 0.05)
    pcall(establishPerformanceBaseline)
end)

local function testBufferIntegrity()
    local score = 0
    local severity = 1.0
    local confidence = 0.95
    
    local success, result = pcall(function()
        local startTick = tick()
        local startClock = os.clock()
        
        local b1 = buffer.create(256)
        local b2 = buffer.create(256)
        
        for i = 0, 31 do
            buffer.writeu8(b1, i, i * 7 % 256)
        end
        
        local readback = {}
        for i = 0, 31 do
            readback[i] = buffer.readu8(b1, i)
            if readback[i] ~= (i * 7 % 256) then
                return false, 1.2, 0.98
            end
        end
        
        buffer.writef32(b1, 64, 3.14159)
        buffer.writef64(b1, 72, 2.718281828)
        buffer.writei32(b1, 80, -42)
        buffer.writeu32(b1, 84, 4294967295)
        
        if math.abs(buffer.readf32(b1, 64) - 3.14159) > 0.0001 then return false, 1.1, 0.97 end
        if math.abs(buffer.readf64(b1, 72) - 2.718281828) > 0.000001 then return false, 1.1, 0.97 end
        if buffer.readi32(b1, 80) ~= -42 then return false, 1.0, 0.99 end
        if buffer.readu32(b1, 84) ~= 4294967295 then return false, 1.0, 0.99 end
        
        buffer.copy(b2, 0, b1, 0, 32)
        for i = 0, 31 do
            if buffer.readu8(b2, i) ~= buffer.readu8(b1, i) then
                return false, 1.3, 0.96
            end
        end
        
        buffer.fill(b2, 100, 0xAB, 50)
        for i = 100, 149 do
            if buffer.readu8(b2, i) ~= 0xAB then
                return false, 1.2, 0.95
            end
        end
        
        local b3 = buffer.create(1024)
        buffer.writeu16(b3, 0, 65535)
        buffer.writei16(b3, 2, -32768)
        if buffer.readu16(b3, 0) ~= 65535 then return false, 1.0, 0.98 end
        if buffer.readi16(b3, 2) ~= -32768 then return false, 1.0, 0.98 end
        
        local copyStart = os.clock()
        buffer.copy(b3, 512, b1, 0, 256)
        local copyElapsed = os.clock() - copyStart
        
        local baselineRatio = copyElapsed / (performanceBaseline.buffer + 0.0001)
        if baselineRatio > 50 then return false, 1.4, 0.9 end
        
        for i = 0, 31 do
            if buffer.readu8(b3, 512 + i) ~= buffer.readu8(b1, i) then
                return false, 1.3, 0.97
            end
        end
        
        local tickElapsed = tick() - startTick
        local clockElapsed = os.clock() - startClock
        
        timingData.buffer = clockElapsed
        timingData.bufferTick = tickElapsed
        
        local clockDrift = math.abs(tickElapsed - clockElapsed)
        if clockDrift > 0.5 then return false, 1.1, 0.85 end
        
        local relativeTime = clockElapsed / (performanceBaseline.buffer * 300 + 0.001)
        if relativeTime > 20 then return false, 1.2, 0.88 end
        
        return true, 1.0, 0.95
    end)
    
    if not success then
        score = score + calculateDynamicScore(12, severity, confidence)
    elseif result == false then
        local sev = select(2, pcall(function() return result end)) or severity
        local conf = select(3, pcall(function() return result end)) or confidence
        score = score + calculateDynamicScore(12, sev, conf)
    end
    
    local errorScore = 0
    local err1Success, err1Msg = pcall(function() buffer.readu32(nil, 0) end)
    local err2Success, err2Msg = pcall(function() buffer.create(-5) end)
    local err3Success, err3Msg = pcall(function() 
        local b = buffer.create(10)
        buffer.readu32(b, 1000)
    end)
    
    if err1Success or err2Success or err3Success then
        errorScore = errorScore + calculateDynamicScore(8, 1.2, 0.9)
    else
        if not string.find(tostring(err1Msg), "buffer") and not string.find(tostring(err1Msg), "nil") then
            errorScore = errorScore + calculateDynamicScore(3, 0.8, 0.75)
        end
    end
    
    return score + errorScore
end

local function testRandomDeterminism()
    local score = 0
    local success, result = pcall(function()
        local rng1 = Random.new(987654321)
        local rng2 = Random.new(987654321)
        
        for i = 1, 50 do
            local n1 = rng1:NextNumber()
            local n2 = rng2:NextNumber()
            if n1 ~= n2 then
                return false, 1.5, 0.99
            end
        end
        
        local rng3 = Random.new(111111)
        local rng4 = Random.new(111111)
        
        for i = 1, 30 do
            local int1 = rng3:NextInteger(1, 1000000)
            local int2 = rng4:NextInteger(1, 1000000)
            if int1 ~= int2 then
                return false, 1.5, 0.99
            end
        end
        
        local rng5 = Random.new(555)
        local seenValues = {}
        for i = 1, 100 do
            local val = rng5:NextNumber()
            if val < 0 or val >= 1 then
                return false, 1.2, 0.95
            end
            if seenValues[val] then
                return false, 1.4, 0.97
            end
            seenValues[val] = true
        end
        
        return true, 1.0, 0.95
    end)
    
    if success and result == false then
        local sev = 1.0
        local conf = 0.95
        score = score + calculateDynamicScore(8, sev, conf)
    elseif not success then
        score = score + calculateDynamicScore(8, 1.0, 0.95)
    end
    
    return score
end

local function testRaycastConsistency()
    local score = 0
    local success, result = pcall(function()
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Include
        params.FilterDescendantsInstances = {workspace}
        params.IgnoreWater = true
        params.RespectCanCollide = true
        
        local origin = Vector3.new(0, 1000, 0)
        local direction = Vector3.new(0, -2000, 0)
        
        local cast1 = workspace:Raycast(origin, direction, params)
        local cast2 = workspace:Raycast(origin, direction, params)
        
        if (cast1 == nil) ~= (cast2 == nil) then
            return false
        end
        
        if cast1 and cast2 then
            if (cast1.Position - cast2.Position).Magnitude > 0.001 then
                return false
            end
            if cast1.Instance ~= cast2.Instance then
                return false
            end
        end
        
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {}
        
        local castExclude = workspace:Raycast(origin, direction, params)
        
        if typeof(params.FilterDescendantsInstances) ~= "table" then
            return false
        end
        
        return true
    end)
    
    if not success or not result then
        score = score + 10
    end
    
    return score
end

local function testOverlapBehavior()
    local score = 0
    local success, result = pcall(function()
        local params = OverlapParams.new()
        params.FilterType = Enum.RaycastFilterType.Include
        params.FilterDescendantsInstances = {workspace}
        params.MaxParts = 10
        params.RespectCanCollide = false
        
        local cf = CFrame.new(0, 0, 0)
        local size = Vector3.new(5000, 5000, 5000)
        
        local parts1 = workspace:GetPartBoundsInBox(cf, size, params)
        local parts2 = workspace:GetPartBoundsInBox(cf, size, params)
        
        if #parts1 ~= #parts2 then
            return false
        end
        
        params.MaxParts = 1
        local partsLimited = workspace:GetPartBoundsInBox(cf, size, params)
        
        if #partsLimited > 1 then
            return false
        end
        
        local paramsRadius = OverlapParams.new()
        paramsRadius.FilterType = Enum.RaycastFilterType.Exclude
        local partsInRadius = workspace:GetPartBoundsInRadius(Vector3.zero, 1000, paramsRadius)
        
        if typeof(partsInRadius) ~= "table" then
            return false
        end
        
        return true
    end)
    
    if not success or not result then
        score = score + 9
    end
    
    return score
end

local function testPathfindingValidity()
    local score = 0
    local success, result = pcall(function()
        local pfs = game:GetService("PathfindingService")
        
        local path1 = pfs:CreatePath({
            AgentRadius = 2,
            AgentHeight = 5,
            AgentCanJump = true,
            AgentCanClimb = false,
            WaypointSpacing = 4,
            Costs = {
                Water = 20
            }
        })
        
        local path2 = pfs:CreatePath({
            AgentRadius = 3,
            AgentHeight = 6,
            AgentCanJump = false
        })
        
        if typeof(path1) ~= "Instance" or typeof(path2) ~= "Instance" then
            return false
        end
        
        if not path1:IsA("Path") or not path2:IsA("Path") then
            return false
        end
        
        local status1 = path1.Status
        if typeof(status1) ~= "EnumItem" then
            return false
        end
        
        local blocked1 = path1.Blocked
        if typeof(blocked1.Connect) ~= "function" then
            return false
        end
        
        return true
    end)
    
    if not success or not result then
        score = score + 7
    end
    
    return score
end

local function testShapecastAccuracy()
    local score = 0
    local success, result = pcall(function()
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {}
        
        local origin = Vector3.new(0, 500, 0)
        local direction = Vector3.new(0, -1000, 0)
        
        local sphereResult = workspace:Spherecast(origin, 10, direction, params)
        local blockResult = workspace:Blockcast(CFrame.new(origin), Vector3.new(5, 5, 5), direction, params)
        
        if sphereResult and typeof(sphereResult.Position) ~= "Vector3" then
            return false
        end
        
        if blockResult and typeof(blockResult.Normal) ~= "Vector3" then
            return false
        end
        
        local sphere2 = workspace:Spherecast(origin, 10, direction, params)
        
        if (sphereResult == nil) ~= (sphere2 == nil) then
            return false
        end
        
        return true
    end)
    
    if not success or not result then
        score = score + 11
    end
    
    return score
end

local function testAttributeSignalIntegrity()
    local score = 0
    local success, result = pcall(function()
        local obj = Instance.new("Folder")
        
        obj:SetAttribute("TestNum", 100)
        obj:SetAttribute("TestStr", "hello")
        obj:SetAttribute("TestBool", true)
        obj:SetAttribute("TestVec", Vector3.new(1, 2, 3))
        
        if obj:GetAttribute("TestNum") ~= 100 then return false end
        if obj:GetAttribute("TestStr") ~= "hello" then return false end
        if obj:GetAttribute("TestBool") ~= true then return false end
        local vec = obj:GetAttribute("TestVec")
        if vec.X ~= 1 or vec.Y ~= 2 or vec.Z ~= 3 then return false end
        
        local triggered = false
        local conn = obj:GetAttributeChangedSignal("TestNum"):Connect(function()
            triggered = true
        end)
        
        obj:SetAttribute("TestNum", 200)
        task.wait(0.05)
        
        conn:Disconnect()
        
        if not triggered then return false end
        if obj:GetAttribute("TestNum") ~= 200 then return false end
        
        obj:SetAttribute("TestNum", nil)
        if obj:GetAttribute("TestNum") ~= nil then return false end
        
        obj:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + 7
    end
    
    return score
end

local function testCollectionServiceConsistency()
    local score = 0
    local success, result = pcall(function()
        local cs = game:GetService("CollectionService")
        local tagName = "NeoCheck_" .. tostring(math.random(100000, 999999))
        
        local obj1 = Instance.new("Part")
        local obj2 = Instance.new("Part")
        local obj3 = Instance.new("Part")
        
        cs:AddTag(obj1, tagName)
        cs:AddTag(obj2, tagName)
        
        if not cs:HasTag(obj1, tagName) then return false end
        if not cs:HasTag(obj2, tagName) then return false end
        if cs:HasTag(obj3, tagName) then return false end
        
        local tagged = cs:GetTagged(tagName)
        if #tagged ~= 2 then return false end
        
        local found1, found2 = false, false
        for _, obj in ipairs(tagged) do
            if obj == obj1 then found1 = true end
            if obj == obj2 then found2 = true end
        end
        if not found1 or not found2 then return false end
        
        cs:RemoveTag(obj1, tagName)
        if cs:HasTag(obj1, tagName) then return false end
        
        local taggedAfter = cs:GetTagged(tagName)
        if #taggedAfter ~= 1 then return false end
        
        cs:AddTag(obj3, tagName)
        local allTags = cs:GetTags(obj3)
        local hasTag = false
        for _, t in ipairs(allTags) do
            if t == tagName then hasTag = true end
        end
        if not hasTag then return false end
        
        obj1:Destroy()
        obj2:Destroy()
        obj3:Destroy()
        
        return true
    end)
    
    if not success or not result then
        score = score + 6
    end
    
    return score
end

local function testRegion3Expansion()
    local score = 0
    local success, result = pcall(function()
        local r1 = Region3.new(Vector3.new(-50, -50, -50), Vector3.new(50, 50, 50))
        local expanded = r1:ExpandToGrid(4)
        
        if typeof(expanded.Size) ~= "Vector3" then return false end
        if typeof(expanded.CFrame) ~= "CFrame" then return false end
        
        local r2 = Region3.new(Vector3.new(10, 20, 30), Vector3.new(100, 200, 300))
        local size = r2.Size
        
        if size.X <= 0 or size.Y <= 0 or size.Z <= 0 then return false end
        
        local r3 = Region3.new(Vector3.zero, Vector3.new(16, 16, 16))
        local expandedGrid = r3:ExpandToGrid(4)
        
        local terrain = workspace.Terrain
        local materials, sizes = terrain:ReadVoxels(expandedGrid, 4)
        
        if typeof(materials) ~= "table" or typeof(sizes) ~= "table" then
            return false
        end
        
        return true
    end)
    
    if not success or not result then
        score = score + 8
    end
    
    return score
end

local function testPhysicalPropertiesCalculation()
    local score = 0
    local success, result = pcall(function()
        local props1 = PhysicalProperties.new(0.7, 0.3, 0.5, 1, 1)
        
        if props1.Density ~= 0.7 then return false end
        if props1.Friction ~= 0.3 then return false end
        if props1.Elasticity ~= 0.5 then return false end
        if props1.FrictionWeight ~= 1 then return false end
        if props1.ElasticityWeight ~= 1 then return false end
        
        local props2 = PhysicalProperties.new(Enum.Material.Concrete)
        if typeof(props2.Density) ~= "number" then return false end
        if props2.Density <= 0 then return false end
        
        local props3 = PhysicalProperties.new(Enum.Material.Wood)
        if props2.Density == props3.Density then return false end
        
        local part = Instance.new("Part")
        part.Size = Vector3.new(4, 1, 2)
        part.CustomPhysicalProperties = props1
        
        local retrieved = part.CustomPhysicalProperties
        if retrieved.Density ~= 0.7 then return false end
        
        part:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + 5
    end
    
    return score
end

local function testRunServiceFrameTiming()
    local score = 0
    local success, result = pcall(function()
        local rs = game:GetService("RunService")
        
        if typeof(rs.Heartbeat) ~= "RBXScriptSignal" then return false end
        if typeof(rs.RenderStepped) ~= "RBXScriptSignal" then return false end
        if typeof(rs.Stepped) ~= "RBXScriptSignal" then return false end
        
        local frameCount = 0
        local dtSum = 0
        local conn
        
        conn = rs.Heartbeat:Connect(function(dt)
            frameCount = frameCount + 1
            dtSum = dtSum + dt
            if frameCount >= 3 then
                conn:Disconnect()
            end
        end)
        
        task.wait(0.2)
        
        if frameCount < 3 then return false end
        if dtSum <= 0 then return false end
        
        local avgDt = dtSum / frameCount
        if avgDt <= 0 or avgDt > 1 then return false end
        
        if typeof(rs:IsClient()) ~= "boolean" then return false end
        if typeof(rs:IsServer()) ~= "boolean" then return false end
        if typeof(rs:IsStudio()) ~= "boolean" then return false end
        
        return true
    end)
    
    if not success or not result then
        score = score + 9
    end
    
    return score
end

local function testTerrainVoxelOperations()
    local score = 0
    local success, result = pcall(function()
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if not terrain then return false end
        
        local region = Region3.new(Vector3.new(-32, -32, -32), Vector3.new(32, 32, 32)):ExpandToGrid(4)
        
        local materials, sizes = terrain:ReadVoxels(region, 4)
        
        if typeof(materials) ~= "table" then return false end
        if typeof(sizes) ~= "table" then return false end
        
        local sizeX = materials.Size.X
        local sizeY = materials.Size.Y
        local sizeZ = materials.Size.Z
        
        if sizeX <= 0 or sizeY <= 0 or sizeZ <= 0 then return false end
        
        local testMat = materials[1][1][1]
        if typeof(testMat) ~= "EnumItem" then return false end
        
        local testSize = sizes[1][1][1]
        if typeof(testSize) ~= "number" then return false end
        
        return true
    end)
    
    if not success or not result then
        score = score + 8
    end
    
    return score
end

suspicionScore = suspicionScore + testBufferIntegrity()
suspicionScore = suspicionScore + testRandomDeterminism()
suspicionScore = suspicionScore + testRaycastConsistency()
suspicionScore = suspicionScore + testOverlapBehavior()
suspicionScore = suspicionScore + testPathfindingValidity()
suspicionScore = suspicionScore + testShapecastAccuracy()
suspicionScore = suspicionScore + testAttributeSignalIntegrity()
suspicionScore = suspicionScore + testCollectionServiceConsistency()
suspicionScore = suspicionScore + testRegion3Expansion()
suspicionScore = suspicionScore + testPhysicalPropertiesCalculation()
suspicionScore = suspicionScore + testRunServiceFrameTiming()
suspicionScore = suspicionScore + testTerrainVoxelOperations()

local function testCrossAPIConsistency()
    local score = 0
    local success, result = pcall(function()
        local part = Instance.new("Part")
        part.Size = Vector3.new(10, 1, 10)
        part.Position = Vector3.new(0, 100, 0)
        part.Anchored = true
        part.Parent = workspace
        
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Include
        raycastParams.FilterDescendantsInstances = {part}
        
        local rayResult = workspace:Raycast(Vector3.new(0, 150, 0), Vector3.new(0, -100, 0), raycastParams)
        
        if not rayResult then return false end
        if rayResult.Instance ~= part then return false end
        
        local overlapParams = OverlapParams.new()
        overlapParams.FilterType = Enum.RaycastFilterType.Include
        overlapParams.FilterDescendantsInstances = {part}
        
        local overlapParts = workspace:GetPartBoundsInBox(CFrame.new(0, 100, 0), Vector3.new(15, 5, 15), overlapParams)
        
        local foundInOverlap = false
        for _, p in ipairs(overlapParts) do
            if p == part then
                foundInOverlap = true
                break
            end
        end
        
        if not foundInOverlap then return false end
        
        local sphereResult = workspace:Spherecast(Vector3.new(0, 150, 0), 3, Vector3.new(0, -100, 0), raycastParams)
        
        if not sphereResult then return false end
        if sphereResult.Instance ~= part then return false end
        
        if (rayResult.Position - sphereResult.Position).Magnitude > 10 then
            return false
        end
        
        local region = Region3.new(Vector3.new(-20, 90, -20), Vector3.new(20, 110, 20))
        local partsInRegion = workspace:FindPartsInRegion3(region, part, 100)
        
        local foundInRegion = false
        for _, p in ipairs(partsInRegion) do
            if p == part then
                foundInRegion = true
                break
            end
        end
        
        if not foundInRegion then return false end
        
        part:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + 15
    end
    
    return score
end

local function testSchedulerOrder()
    local score = 0
    local success, result = pcall(function()
        local order = {}
        
        task.spawn(function()
            table.insert(order, "spawn")
        end)
        
        task.defer(function()
            table.insert(order, "defer")
        end)
        
        coroutine.wrap(function()
            table.insert(order, "wrap")
        end)()
        
        table.insert(order, "sync")
        
        task.wait()
        
        if #order < 4 then return false end
        
        if order[1] ~= "wrap" then return false end
        if order[2] ~= "sync" then return false end
        if order[3] ~= "spawn" then return false end
        if order[4] ~= "defer" then return false end
        
        local orderCheck2 = {}
        
        task.defer(function()
            table.insert(orderCheck2, 1)
        end)
        
        task.defer(function()
            table.insert(orderCheck2, 2)
        end)
        
        task.defer(function()
            table.insert(orderCheck2, 3)
        end)
        
        task.wait()
        
        if orderCheck2[1] ~= 1 or orderCheck2[2] ~= 2 or orderCheck2[3] ~= 3 then
            return false
        end
        
        return true
    end)
    
    if not success or not result then
        score = score + 10
    end
    
    return score
end

local function testMetatableBehavior()
    local score = 0
    local success, result = pcall(function()
        local part = Instance.new("Part")
        
        local mt = getmetatable(part)
        if not mt then return false end
        
        if typeof(mt) ~= "table" then return false end
        
        local indexTest = mt.__index
        if not indexTest then return false end
        
        local nameLookup = indexTest(part, "Name")
        if typeof(nameLookup) ~= "string" then return false end
        
        local vec = Vector3.new(1, 2, 3)
        local vecMt = getmetatable(vec)
        
        if not vecMt then return false end
        
        local addFunc = vecMt.__add
        if typeof(addFunc) ~= "function" then return false end
        
        local vec2 = Vector3.new(4, 5, 6)
        local result = vec + vec2
        
        if result.X ~= 5 or result.Y ~= 7 or result.Z ~= 9 then
            return false
        end
        
        local cf = CFrame.new(10, 20, 30)
        local cfMt = getmetatable(cf)
        
        if not cfMt then return false end
        
        local mulFunc = cfMt.__mul
        if typeof(mulFunc) ~= "function" then return false end
        
        local cf2 = CFrame.new(1, 0, 0)
        local cfResult = cf * cf2
        
        if typeof(cfResult) ~= "CFrame" then return false end
        
        local enumItem = Enum.Material.Plastic
        local enumMt = getmetatable(enumItem)
        
        if not enumMt then return false end
        
        part:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + 12
    end
    
    return score
end

local function testWeakTableGC()
    local score = 0
    local success, result = pcall(function()
        local weak = setmetatable({}, {__mode = "v"})
        
        local obj1 = Instance.new("Part")
        local obj2 = Instance.new("Folder")
        local obj3 = Instance.new("Model")
        
        weak[1] = obj1
        weak[2] = obj2
        weak[3] = obj3
        
        if weak[1] ~= obj1 then return false, 1.0, 0.95 end
        if weak[2] ~= obj2 then return false, 1.0, 0.95 end
        if weak[3] ~= obj3 then return false, 1.0, 0.95 end
        
        obj2 = nil
        obj3 = nil
        
        for i = 1, 5 do
            local trash = {}
            for j = 1, 500 do
                trash[j] = Instance.new("Part")
            end
        end
        
        collectgarbage("collect")
        task.wait(0.03)
        collectgarbage("collect")
        
        if weak[1] ~= obj1 then return false, 1.1, 0.9 end
        
        local weakKeys = setmetatable({}, {__mode = "k"})
        
        local key1 = Instance.new("Part")
        local key2 = Instance.new("Folder")
        
        weakKeys[key1] = "value1"
        weakKeys[key2] = "value2"
        
        if weakKeys[key1] ~= "value1" then return false, 1.0, 0.92 end
        
        key2 = nil
        collectgarbage("collect")
        task.wait(0.03)
        
        if weakKeys[key1] ~= "value1" then return false, 1.0, 0.9 end
        
        obj1:Destroy()
        key1:Destroy()
        
        return true, 1.0, 0.7
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(9, 0.9, 0.7)
    elseif not success then
        score = score + calculateDynamicScore(9, 0.9, 0.7)
    end
    
    return score
end

local function testPhysicsConsistency()
    local score = 0
    local success, result = pcall(function()
        local part = Instance.new("Part")
        part.Size = Vector3.new(4, 2, 4)
        part.Material = Enum.Material.Plastic
        part.Position = Vector3.new(0, 100, 0)
        part.Anchored = false
        part.Parent = workspace
        
        task.wait(0.1)
        
        local mass1 = part:GetMass()
        if mass1 <= 0 then return false end
        
        local assemblyMass = part.AssemblyMass
        if math.abs(mass1 - assemblyMass) > 0.01 then
            return false
        end
        
        part.Size = Vector3.new(8, 4, 8)
        task.wait(0.05)
        
        local mass2 = part:GetMass()
        if mass2 <= mass1 then return false end
        
        if mass2 / mass1 < 7.9 or mass2 / mass1 > 8.1 then
            return false
        end
        
        local pivot1 = part:GetPivot()
        if typeof(pivot1) ~= "CFrame" then return false end
        
        local newPivot = CFrame.new(50, 200, 50)
        part:PivotTo(newPivot)
        
        local pivot2 = part:GetPivot()
        if (pivot2.Position - newPivot.Position).Magnitude > 0.01 then
            return false
        end
        
        part.AssemblyLinearVelocity = Vector3.new(10, 0, 0)
        task.wait(0.05)
        
        local vel = part.AssemblyLinearVelocity
        if vel.X < 5 then return false end
        
        part:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + 11
    end
    
    return score
end

local function testEnumIntegrity()
    local score = 0
    local success, result = pcall(function()
        local material = Enum.Material.Plastic
        
        if typeof(material) ~= "EnumItem" then return false end
        
        if typeof(material.Name) ~= "string" then return false end
        if typeof(material.Value) ~= "number" then return false end
        
        local materialStr = tostring(material)
        if not string.find(materialStr, "Plastic") then return false end
        
        local allMaterials = Enum.Material:GetEnumItems()
        if typeof(allMaterials) ~= "table" then return false end
        if #allMaterials < 10 then return false end
        
        local foundPlastic = false
        for _, mat in ipairs(allMaterials) do
            if mat == Enum.Material.Plastic then
                foundPlastic = true
                break
            end
        end
        
        if not foundPlastic then return false end
        
        local materialByValue = nil
        for _, mat in ipairs(allMaterials) do
            if mat.Value == material.Value then
                materialByValue = mat
                break
            end
        end
        
        if materialByValue ~= material then return false end
        
        local normStyle = Enum.NormalId.Top
        if typeof(normStyle.Name) ~= "string" then return false end
        if normStyle.Name ~= "Top" then return false end
        
        local filterType = Enum.RaycastFilterType.Include
        local filterExclude = Enum.RaycastFilterType.Exclude
        
        if filterType == filterExclude then return false end
        if filterType.Value == filterExclude.Value then return false end
        
        return true
    end)
    
    if not success or not result then
        score = score + 8
    end
    
    return score
end


local function testCFrameMatrixOperations()
    local score = 0
    local success, result = pcall(function()
        local cf1 = CFrame.new(10, 20, 30)
        local cf2 = CFrame.Angles(math.rad(45), math.rad(90), math.rad(30))
        
        local combined = cf1 * cf2
        if typeof(combined) ~= "CFrame" then return false end
        
        local inv = cf1:Inverse()
        local identity = cf1 * inv
        
        if math.abs(identity.Position.X) > 0.001 then return false end
        if math.abs(identity.Position.Y) > 0.001 then return false end
        if math.abs(identity.Position.Z) > 0.001 then return false end
        
        local lookVector = cf2.LookVector
        local rightVector = cf2.RightVector
        local upVector = cf2.UpVector
        
        if typeof(lookVector) ~= "Vector3" then return false end
        if typeof(rightVector) ~= "Vector3" then return false end
        if typeof(upVector) ~= "Vector3" then return false end
        
        local dot1 = lookVector:Dot(rightVector)
        local dot2 = lookVector:Dot(upVector)
        local dot3 = rightVector:Dot(upVector)
        
        if math.abs(dot1) > 0.01 then return false end
        if math.abs(dot2) > 0.01 then return false end
        if math.abs(dot3) > 0.01 then return false end
        
        local x, y, z, r00, r01, r02, r10, r11, r12, r20, r21, r22 = cf2:GetComponents()
        
        if typeof(r00) ~= "number" then return false end
        if typeof(r11) ~= "number" then return false end
        if typeof(r22) ~= "number" then return false end
        
        local rebuilt = CFrame.new(x, y, z, r00, r01, r02, r10, r11, r12, r20, r21, r22)
        
        local diff = (rebuilt.Position - cf2.Position).Magnitude
        if diff > 0.001 then return false end
        
        local point = Vector3.new(5, 10, 15)
        local transformed = cf1:PointToWorldSpace(point)
        local localBack = cf1:PointToObjectSpace(transformed)
        
        if (localBack - point).Magnitude > 0.001 then return false end
        
        return true
    end)
    
    if not success or not result then
        score = score + 10
    end
    
    return score
end

local function testInstanceIdentityConsistency()
    local score = 0
    local success, result = pcall(function()
        local part = Instance.new("Part")
        part.Name = "TestPart"
        part.Position = Vector3.new(0, 50, 0)
        part.Parent = workspace
        
        local foundByName = workspace:FindFirstChild("TestPart")
        if foundByName ~= part then return false end
        
        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Include
        params.FilterDescendantsInstances = {part}
        
        local rayResult = workspace:Raycast(Vector3.new(0, 100, 0), Vector3.new(0, -100, 0), params)
        
        if rayResult and rayResult.Instance ~= part then
            return false
        end
        
        local overlapParams = OverlapParams.new()
        overlapParams.FilterType = Enum.RaycastFilterType.Include
        overlapParams.FilterDescendantsInstances = {part}
        
        local parts = workspace:GetPartBoundsInBox(CFrame.new(0, 50, 0), Vector3.new(10, 10, 10), overlapParams)
        
        local foundInOverlap = false
        for _, p in ipairs(parts) do
            if p == part then
                foundInOverlap = true
            elseif p.Name == part.Name and p ~= part then
                return false
            end
        end
        
        part:SetAttribute("UniqueID", 123456)
        local attrVal = part:GetAttribute("UniqueID")
        
        if attrVal ~= 123456 then return false end
        
        local cs = game:GetService("CollectionService")
        cs:AddTag(part, "IdentityTest")
        
        local tagged = cs:GetTagged("IdentityTest")
        local foundInTags = false
        for _, obj in ipairs(tagged) do
            if obj == part then
                foundInTags = true
            end
        end
        
        if not foundInTags then return false end
        
        part:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + 13
    end
    
    return score
end

local function testTimingAnomalies()
    local score = 0
    local success, result = pcall(function()
        if not timingData.buffer then return true, 1.0, 0.5 end
        
        local vectorStart = os.clock()
        for i = 1, 10000 do
            local v = Vector3.new(i, i * 2, i * 3)
            local mag = v.Magnitude
            local norm = v.Unit
        end
        local vectorTime = os.clock() - vectorStart
        
        local vectorRatio = vectorTime / (performanceBaseline.vector * 10 + 0.0001)
        if vectorRatio > 30 then return false, 1.3, 0.82 end
        
        local mathStart = os.clock()
        for i = 1, 10000 do
            local x = math.sqrt(i)
            local y = math.sin(i)
            local z = math.cos(i)
        end
        local mathTime = os.clock() - mathStart
        
        local mathRatio = mathTime / (performanceBaseline.math * 10 + 0.0001)
        if mathRatio > 30 then return false, 1.3, 0.82 end
        
        local bufferRatio = timingData.buffer / (performanceBaseline.buffer * 300 + 0.0001)
        if bufferRatio > 25 then return false, 1.4, 0.85 end
        
        if timingData.bufferTick and math.abs(timingData.buffer - timingData.bufferTick) > 1.0 then
            return false, 1.2, 0.78
        end
        
        local taskStart = os.clock()
        local counter = 0
        for i = 1, 3 do
            task.wait()
            counter = counter + 1
        end
        local taskTime = os.clock() - taskStart
        
        if counter ~= 3 then return false, 1.5, 0.95 end
        
        local avgFrameTime = taskTime / 3
        if avgFrameTime < 0.008 then return false, 1.2, 0.75 end
        if avgFrameTime > 0.5 then return false, 0.9, 0.6 end
        
        local tickNow = tick()
        local clockNow = os.clock()
        local timeNow = os.time()
        
        if tickNow < clockSources.tick then return false, 1.3, 0.9 end
        if clockNow < clockSources.clock then return false, 1.3, 0.9 end
        if timeNow < clockSources.time then return false, 1.1, 0.88 end
        
        return true, 1.0, 0.85
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(12, 1.1, 0.85)
    elseif not success then
        score = score + calculateDynamicScore(12, 1.1, 0.85)
    end
    
    return score
end

local function testCoroutineBehavior()
    local score = 0
    local success, result = pcall(function()
        local co = coroutine.create(function(a, b)
            local sum = a + b
            coroutine.yield(sum)
            return sum * 2
        end)
        
        if coroutine.status(co) ~= "suspended" then return false end
        
        local success1, val1 = coroutine.resume(co, 10, 20)
        if not success1 then return false end
        if val1 ~= 30 then return false end
        if coroutine.status(co) ~= "suspended" then return false end
        
        local success2, val2 = coroutine.resume(co)
        if not success2 then return false end
        if val2 ~= 60 then return false end
        if coroutine.status(co) ~= "dead" then return false end
        
        local co2 = coroutine.create(function()
            for i = 1, 5 do
                coroutine.yield(i)
            end
        end)
        
        local results = {}
        while coroutine.status(co2) ~= "dead" do
            local ok, val = coroutine.resume(co2)
            if ok and val then
                table.insert(results, val)
            end
        end
        
        if #results ~= 5 then return false end
        for i = 1, 5 do
            if results[i] ~= i then return false end
        end
        
        local running = coroutine.running()
        if typeof(running) ~= "thread" then return false end
        
        local isYieldable = coroutine.isyieldable()
        if typeof(isYieldable) ~= "boolean" then return false end
        
        local wrapCo = coroutine.wrap(function(x)
            coroutine.yield(x * 2)
            return x * 3
        end)
        
        local wrapResult1 = wrapCo(5)
        if wrapResult1 ~= 10 then return false end
        
        local wrapResult2 = wrapCo()
        if wrapResult2 ~= 15 then return false end
        
        return true
    end)
    
    if not success or not result then
        score = score + calculateDynamicScore(10, 1.0, 0.9)
    end
    
    return score
end

local function testUserdataEquality()
    local score = 0
    local success, result = pcall(function()
        local part1 = Instance.new("Part")
        local part2 = Instance.new("Part")
        
        if rawequal(part1, part2) then return false end
        if rawequal(part1, part1) == false then return false end
        
        local ref1 = part1
        if not rawequal(part1, ref1) then return false end
        
        local vec1 = Vector3.new(1, 2, 3)
        local vec2 = Vector3.new(1, 2, 3)
        local vec3 = vec1
        
        if rawequal(vec1, vec2) then return false end
        if not rawequal(vec1, vec3) then return false end
        
        local cf1 = CFrame.new(10, 20, 30)
        local cf2 = CFrame.new(10, 20, 30)
        local cf3 = cf1
        
        if rawequal(cf1, cf2) then return false end
        if not rawequal(cf1, cf3) then return false end
        
        part1.Parent = workspace
        local foundPart = workspace:FindFirstChild(part1.Name)
        
        if foundPart then
            if not rawequal(part1, foundPart) then return false end
        end
        
        local enum1 = Enum.Material.Plastic
        local enum2 = Enum.Material.Plastic
        
        if not rawequal(enum1, enum2) then return false end
        
        part1:Destroy()
        part2:Destroy()
        
        return true
    end)
    
    if not success or not result then
        score = score + calculateDynamicScore(11, 1.0, 0.95)
    end
    
    return score
end

local function testMetamethodDepth()
    local score = 0
    local success, result = pcall(function()
        local part = Instance.new("Part")
        local mt = getmetatable(part)
        
        if not mt then return false end
        
        local nameCallTest = false
        local oldNamecall = mt.__namecall
        if oldNamecall then
            if typeof(oldNamecall) ~= "function" then return false end
            nameCallTest = true
        end
        
        local typeTest = typeof(part)
        if typeTest ~= "Instance" then return false end
        
        local vec = Vector3.new(5, 10, 15)
        local vecMt = getmetatable(vec)
        
        if not vecMt.__add then return false end
        if not vecMt.__sub then return false end
        if not vecMt.__mul then return false end
        if not vecMt.__div then return false end
        if not vecMt.__unm then return false end
        
        local negVec = -vec
        if negVec.X ~= -5 or negVec.Y ~= -10 or negVec.Z ~= -15 then
            return false
        end
        
        local vecSum = vec + Vector3.new(1, 1, 1)
        if vecSum.X ~= 6 or vecSum.Y ~= 11 or vecSum.Z ~= 16 then
            return false
        end
        
        local cf = CFrame.new(10, 20, 30)
        local cfMt = getmetatable(cf)
        
        if not cfMt.__mul then return false end
        
        local vecTransformed = cf * Vector3.new(1, 0, 0)
        if typeof(vecTransformed) ~= "Vector3" then return false end
        
        local cfCombined = cf * CFrame.Angles(0, math.rad(90), 0)
        if typeof(cfCombined) ~= "CFrame" then return false end
        
        local tbl = {a = 1, b = 2}
        local tblMt = {
            __index = function(t, k)
                return "custom_" .. tostring(k)
            end,
            __newindex = function(t, k, v)
                rawset(t, k, v * 10)
            end
        }
        setmetatable(tbl, tblMt)
        
        local customVal = tbl.nonexistent
        if customVal ~= "custom_nonexistent" then return false end
        
        tbl.c = 5
        if rawget(tbl, "c") ~= 50 then return false end
        
        part:Destroy()
        return true
    end)
    
    if not success or not result then
        score = score + calculateDynamicScore(13, 1.0, 0.92)
    end
    
    return score
end

local function testErrorStringValidation()
    local score = 0
    local errorTests = 0
    local errorPassed = 0
    
    local raycastErr = pcall(function()
        workspace:Raycast(Vector3.new(0, 0, 0), nil, RaycastParams.new())
    end)
    if not raycastErr then errorPassed = errorPassed + 1 end
    errorTests = errorTests + 1
    
    local cfErr = pcall(function()
        CFrame.new(nil, 0, 0)
    end)
    if not cfErr then errorPassed = errorPassed + 1 end
    errorTests = errorTests + 1
    
    local vec3Err = pcall(function()
        Vector3.new("not a number", 0, 0)
    end)
    if not vec3Err then errorPassed = errorPassed + 1 end
    errorTests = errorTests + 1
    
    local instanceErr = pcall(function()
        Instance.new("NonExistentClass")
    end)
    if not instanceErr then errorPassed = errorPassed + 1 end
    errorTests = errorTests + 1
    
    local region3Err = pcall(function()
        Region3.new(Vector3.new(10, 10, 10), Vector3.new(0, 0, 0))
    end)
    if not region3Err then errorPassed = errorPassed + 1 end
    errorTests = errorTests + 1
    
    local enumErr = pcall(function()
        local invalid = Enum.Material["NonExistent"]
    end)
    if not enumErr then errorPassed = errorPassed + 1 end
    errorTests = errorTests + 1
    
    if errorPassed < errorTests * 0.8 then
        score = score + calculateDynamicScore(9, 1.0, 0.88)
    end
    
    return score
end

local function testEngineStateConsistency()
    local score = 0
    local success, result = pcall(function()
        local ws = workspace
        local game_ref = game
        
        if ws.Parent ~= game_ref then return false end
        
        local lighting = game:GetService("Lighting")
        if lighting.Parent ~= game_ref then return false end
        
        local replicated = game:GetService("ReplicatedStorage")
        if replicated.Parent ~= game_ref then return false end
        
        local players = game:GetService("Players")
        if players.Parent ~= game_ref then return false end
        
        local dataModel = game
        if typeof(dataModel) ~= "Instance" then return false end
        if not dataModel:IsA("DataModel") then return false end
        
        if workspace ~= game.Workspace then return false end
        if not rawequal(workspace, game.Workspace) then return false end
        
        local folder = Instance.new("Folder")
        folder.Name = "TestEngineState"
        folder.Parent = workspace
        
        if folder.Parent ~= workspace then return false end
        
        local descendant = workspace:IsAncestorOf(folder)
        if not descendant then return false end
        
        local ancestor = folder:IsDescendantOf(workspace)
        if not ancestor then return false end
        
        folder:Destroy()
        
        if folder.Parent ~= nil then return false end
        
        return true
    end)
    
    if not success or not result then
        score = score + calculateDynamicScore(12, 1.0, 0.93)
    end
    
    return score
end

local function testMemoryPressure()
    local score = 0
    local success, result = pcall(function()
        local allocations = {}
        
        for i = 1, 500 do
            allocations[i] = buffer.create(512)
        end
        
        collectgarbage("collect")
        local memBefore = collectgarbage("count")
        
        for i = 1, 500 do
            allocations[i] = nil
        end
        
        collectgarbage("collect")
        task.wait(0.03)
        collectgarbage("collect")
        
        local memAfter = collectgarbage("count")
        
        local memReduction = (memBefore - memAfter) / memBefore
        if memReduction < 0.05 then return false, 0.8, 0.65 end
        
        local userdata = {}
        for i = 1, 300 do
            userdata[i] = Vector3.new(i, i * 2, i * 3)
        end
        
        local sampleVec = userdata[150]
        if sampleVec.X ~= 150 then return false, 1.0, 0.9 end
        
        userdata = nil
        collectgarbage("collect")
        
        return true, 1.0, 0.7
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(8, 0.9, 0.7)
    elseif not success then
        score = score + calculateDynamicScore(8, 0.9, 0.7)
    end
    
    return score
end

local function testAdvancedSerialization()
    local score = 0
    local success, result = pcall(function()
        local ns = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 1),
            NumberSequenceKeypoint.new(1, 0)
        })
        
        if typeof(ns) ~= "NumberSequence" then return false, 1.0, 0.95 end
        if #ns.Keypoints ~= 3 then return false, 1.0, 0.95 end
        if ns.Keypoints[2].Value ~= 1 then return false, 1.0, 0.95 end
        
        local cs = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.new(0, 0, 1))
        })
        
        if typeof(cs) ~= "ColorSequence" then return false, 1.0, 0.95 end
        if #cs.Keypoints ~= 2 then return false, 1.0, 0.95 end
        
        local nr = NumberRange.new(5, 10)
        if typeof(nr) ~= "NumberRange" then return false, 1.0, 0.95 end
        if nr.Min ~= 5 then return false, 1.0, 0.95 end
        if nr.Max ~= 10 then return false, 1.0, 0.95 end
        
        local faces = Faces.new(Enum.NormalId.Top, Enum.NormalId.Bottom)
        if typeof(faces) ~= "Faces" then return false, 1.0, 0.92 end
        
        local axes = Axes.new(Enum.Axis.X, Enum.Axis.Y)
        if typeof(axes) ~= "Axes" then return false, 1.0, 0.92 end
        
        return true, 1.0, 0.85
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(7, 0.8, 0.85)
    elseif not success then
        score = score + calculateDynamicScore(7, 0.8, 0.85)
    end
    
    return score
end

local function testTweenServiceBehavior()
    local score = 0
    local success, result = pcall(function()
        local tweenService = game:GetService("TweenService")
        
        if typeof(tweenService) ~= "Instance" then return false, 1.0, 0.95 end
        
        local part = Instance.new("Part")
        part.Position = Vector3.new(0, 0, 0)
        part.Parent = workspace
        
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        
        if typeof(tweenInfo) ~= "TweenInfo" then return false, 1.0, 0.95 end
        if tweenInfo.Time ~= 0.1 then return false, 1.0, 0.95 end
        if tweenInfo.EasingStyle ~= Enum.EasingStyle.Linear then return false, 1.0, 0.93 end
        
        local tween = tweenService:Create(part, tweenInfo, {Position = Vector3.new(10, 0, 0)})
        
        if typeof(tween) ~= "Instance" then return false, 1.1, 0.92 end
        if not tween:IsA("Tween") then return false, 1.1, 0.92 end
        
        if tween.PlaybackState ~= Enum.PlaybackState.Begin then return false, 1.0, 0.9 end
        
        tween:Play()
        
        if tween.PlaybackState ~= Enum.PlaybackState.Playing then return false, 1.0, 0.88 end
        
        task.wait(0.15)
        
        if (part.Position - Vector3.new(10, 0, 0)).Magnitude > 1 then return false, 0.9, 0.75 end
        
        part:Destroy()
        
        return true, 1.0, 0.85
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(9, 1.0, 0.85)
    elseif not success then
        score = score + calculateDynamicScore(9, 1.0, 0.85)
    end
    
    return score
end

local function testStringManipulation()
    local score = 0
    local success, result = pcall(function()
        local str1 = "Hello World"
        local str2 = string.rep("A", 1000)
        
        if #str2 ~= 1000 then return false, 1.0, 0.95 end
        
        local parts = string.split(str1, " ")
        if #parts ~= 2 then return false, 1.0, 0.95 end
        if parts[1] ~= "Hello" then return false, 1.0, 0.95 end
        
        local lower = string.lower(str1)
        if lower ~= "hello world" then return false, 1.0, 0.95 end
        
        local upper = string.upper(str1)
        if upper ~= "HELLO WORLD" then return false, 1.0, 0.95 end
        
        local matched = string.match("test123abc", "%d+")
        if matched ~= "123" then return false, 1.0, 0.93 end
        
        local gsub_result = string.gsub("aabbcc", "b", "x")
        if gsub_result ~= "aaxxcc" then return false, 1.0, 0.93 end
        
        local utf8_len = utf8.len("hello")
        if utf8_len ~= 5 then return false, 1.0, 0.9 end
        
        local chars = {}
        for pos, code in utf8.codes("test") do
            table.insert(chars, code)
        end
        if #chars ~= 4 then return false, 1.0, 0.9 end
        
        return true, 1.0, 0.92
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(6, 0.9, 0.92)
    elseif not success then
        score = score + calculateDynamicScore(6, 0.9, 0.92)
    end
    
    return score
end

local function testTableOperations()
    local score = 0
    local success, result = pcall(function()
        local tbl = {1, 2, 3, 4, 5}
        
        table.insert(tbl, 6)
        if #tbl ~= 6 then return false, 1.0, 0.95 end
        if tbl[6] ~= 6 then return false, 1.0, 0.95 end
        
        local removed = table.remove(tbl, 3)
        if removed ~= 3 then return false, 1.0, 0.95 end
        if #tbl ~= 5 then return false, 1.0, 0.95 end
        
        table.sort(tbl, function(a, b) return a > b end)
        if tbl[1] ~= 6 then return false, 1.0, 0.93 end
        
        local copy = table.clone(tbl)
        if #copy ~= #tbl then return false, 1.0, 0.92 end
        if rawequal(copy, tbl) then return false, 1.1, 0.95 end
        
        local found = table.find(tbl, 4)
        if not found then return false, 1.0, 0.9 end
        
        table.clear(tbl)
        if #tbl ~= 0 then return false, 1.0, 0.93 end
        
        local packed = table.pack(1, 2, 3, nil, 5)
        if packed.n ~= 5 then return false, 1.0, 0.9 end
        
        local a, b, c = table.unpack({10, 20, 30})
        if a ~= 10 or b ~= 20 or c ~= 30 then return false, 1.0, 0.92 end
        
        if success and result == false then
        score = score + calculateDynamicScore(7, 0.95, 0.92)
    elseif not success then
        score = score + calculateDynamicScore(7, 0.95, 0.92)
    end
    
    return score
end

local function testBitOperations()
    local score = 0
    local success, result = pcall(function()
        if not bit32 then return true, 1.0, 0.5 end
        
        local and_result = bit32.band(0xFF, 0x0F)
        if and_result ~= 0x0F then return false, 1.0, 0.95 end
        
        local or_result = bit32.bor(0xF0, 0x0F)
        if or_result ~= 0xFF then return false, 1.0, 0.95 end
        
        local xor_result = bit32.bxor(0xFF, 0x0F)
        if xor_result ~= 0xF0 then return false, 1.0, 0.95 end
        
        local not_result = bit32.bnot(0)
        if not_result ~= 0xFFFFFFFF then return false, 1.0, 0.93 end
        
        local lshift_result = bit32.lshift(1, 8)
        if lshift_result ~= 256 then return false, 1.0, 0.93 end
        
        local rshift_result = bit32.rshift(256, 4)
        if rshift_result ~= 16 then return false, 1.0, 0.93 end
        
        local extract_result = bit32.extract(0xABCD, 4, 8)
        if extract_result ~= 0xBC then return false, 1.0, 0.9 end
        
        local replace_result = bit32.replace(0xFF00, 0xAB, 0, 8)
        if replace_result ~= 0xFFAB then return false, 1.0, 0.9 end
        
        return true, 1.0, 0.92
    end)
    
    if success and result == false then
        score = score + calculateDynamicScore(7, 0.9, 0.92)
    elseif not success then
        score = score + calculateDynamicScore(7, 0.9, 0.92)
    end
    
    return score
end

suspicionScore = suspicionScore + testBufferIntegrity()
suspicionScore = suspicionScore + testRandomDeterminism()
suspicionScore = suspicionScore + testRaycastConsistency()
suspicionScore = suspicionScore + testOverlapBehavior()
suspicionScore = suspicionScore + testPathfindingValidity()
suspicionScore = suspicionScore + testShapecastAccuracy()
suspicionScore = suspicionScore + testAttributeSignalIntegrity()
suspicionScore = suspicionScore + testCollectionServiceConsistency()
suspicionScore = suspicionScore + testRegion3Expansion()
suspicionScore = suspicionScore + testPhysicalPropertiesCalculation()
suspicionScore = suspicionScore + testRunServiceFrameTiming()
suspicionScore = suspicionScore + testTerrainVoxelOperations()
suspicionScore = suspicionScore + testCrossAPIConsistency()
suspicionScore = suspicionScore + testSchedulerOrder()
suspicionScore = suspicionScore + testMetatableBehavior()
suspicionScore = suspicionScore + testWeakTableGC()
suspicionScore = suspicionScore + testPhysicsConsistency()
suspicionScore = suspicionScore + testEnumIntegrity()
suspicionScore = suspicionScore + testCFrameMatrixOperations()
suspicionScore = suspicionScore + testInstanceIdentityConsistency()
suspicionScore = suspicionScore + testTimingAnomalies()
suspicionScore = suspicionScore + testCoroutineBehavior()
suspicionScore = suspicionScore + testUserdataEquality()
suspicionScore = suspicionScore + testMetamethodDepth()
suspicionScore = suspicionScore + testErrorStringValidation()
suspicionScore = suspicionScore + testEngineStateConsistency()
suspicionScore = suspicionScore + testMemoryPressure()
suspicionScore = suspicionScore + testAdvancedSerialization()
suspicionScore = suspicionScore + testTweenServiceBehavior()
suspicionScore = suspicionScore + testStringManipulation()
suspicionScore = suspicionScore + testTableOperations()
suspicionScore = suspicionScore + testBitOperations()

local taskMethods = {[1] = "wait"}
callEncrypted(taskLib, taskMethods[1], safeNum(1))

local threshold = safeNum(250)
local detected = suspicionScore >= threshold

local messages = {
    [true] = {100, 121, 116, 111, 110, 32, 97, 108, 119, 97, 121, 115, 32, 119, 97, 116, 99, 104, 105, 110, 103, 32, 121, 111, 117, 240, 159, 146, 128},
    [false] = {112, 97, 115, 115}
}

local msg = ""
for _, byte in ipairs(messages[detected]) do
    msg = msg .. string.char(byte)
end

if detected then
    error(msg)
else
    print(msg) -- Menampilkan "pass"
    
    -- ===================================================
    -- SCRIPT UTAMA BOMB BLAST CANNON DISIMPAN DI SINI
    -- ===================================================
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
end