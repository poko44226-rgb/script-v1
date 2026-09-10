-- WHITELIST REMOVED (Open Access)
-- (ตัวแปร Players/LP ถูกประกาศใหม่ด้านล่างในโค้ดหลักอยู่แล้ว)

local servicesToVerify = {"MLModelDeliveryService", "PartyEmulatorService", "OmniRecommendationsService", "PlatformFriendsService"}
for _, serviceName in ipairs(servicesToVerify) do
    local success = pcall(function()
        local service = game:GetService(serviceName)
        if typeof(service) ~= "Instance" or not service:IsA(serviceName) or service.ClassName ~= serviceName or service.Parent ~= game then 
            error("detected by Dyton", 0) 
        end
        local secondaryCheck = game:GetService(serviceName)
        if service ~= secondaryCheck then error("detected by Dyton", 0) end
    end)
    if not success then error("detected by Dyton", 0) end
end

local friendCheck = pcall(function()
    local pf = game:GetService("PlatformFriendsService")
    local fs = game:GetService("FriendService")
    if pf == fs then error("detected by Dyton", 0) end
end)
if not friendCheck then error("detected by Dyton", 0) end

local integrityState = true
local secureKey = "ULTRA_SECURITY_VALIDATION"

local function verifyEnvironment()
    local success, res = pcall(function()
        local t = {}
        table.freeze(t)
        t.newKey = 1
    end)
    if success then return false end

    local success2, res2 = pcall(function()
        return string.dump(function() end)
    end)
    if success2 then return false end

    local timeCheck = pcall(function()
        local t1 = os.time()
        local t2 = os.time()
        if t2 < t1 then integrityState = false end
    end)
    if not timeCheck then return false end

    local tableManipulation = pcall(function()
        local frozen = table.freeze({A = 1})
        local _, err = pcall(function() frozen.A = 2 end)
        if not err then integrityState = false end
    end)
    if not tableManipulation then return false end

    return true
end

local function performAdvancedStaticChecks()
    if not verifyEnvironment() then return false end
    local isDeepStackValid = true
    local _, stackErr = pcall(function()
        local function deepCheck(depth)
            if depth > 0 then deepCheck(depth - 1) else error("deep_marker") end
        end
        deepCheck(10)
    end)
    if not stackErr or not string.find(stackErr, "deep_marker") then isDeepStackValid = false end
    if not isDeepStackValid then return false end

    if type(delay) ~= "function" or type(tick) ~= "function" then return false end
    if math.floor(math.pi) ~= 3 or math.clamp(5, 1, 3) ~= 3 then return false end

    return true
end

local function runAdvancedRealTimeMonitor()
    while integrityState do
        if not verifyEnvironment() then integrityState = false end
        
        local closureCheck = pcall(function()
            local f = function() end
            if getfenv(f) ~= getfenv(0) then integrityState = false end
        end)
        if not closureCheck then integrityState = false end

        local stringAdvancedCheck = pcall(function()
            if string.reverse("ABC") ~= "CBA" or string.split("A,B", ",")[1] ~= "A" then integrityState = false end
        end)
        if not stringAdvancedCheck then integrityState = false end

        local tableFindCheck = pcall(function()
            local array = {"X", "Y"}
            if table.find(array, "X") ~= 1 or table.find(array, "Z") ~= nil then integrityState = false end
        end)
        if not tableFindCheck then integrityState = false end

        if not integrityState then
            while true do
                pcall(function() return coroutine.yield() end)
            end
        end
        task.wait(0.2)
    end
end

local isExecutionSafe, verificationResult = pcall(performAdvancedStaticChecks)
if not isExecutionSafe or verificationResult ~= true then
    integrityState = false
    while true do
        pcall(function() return coroutine.yield() end)
    end
else
    task.spawn(runAdvancedRealTimeMonitor)
end

-- [[ ENTITY: RADAR TEROR (ANIMATED WALK ENGINE V5.4 - ABSOLUTE DIRECT ALIGNMENT) ]] --
-- Engine Core: DYTON_txt (Terrifying Ground Radar Layout)
-- Josep Bart Core: Multi-Group CFrame Lerp Blending, Lock 1-15 Anti-Despawn, Continuous Pathing
-- Reconstruction Feature: Auto-Rebuild Prop Array on Re-Summon
-- Fixed Core: Absolute Tracking Continuity, Smooth Sinusoidal Walk-Weight Blending, Anti-Freeze State
-- New Adaption: Height Teleportation Adaptor V1.1 (Strict Anti-Fly & Direct Front Teleport)
-- Patch V5.4: Anti-Lean Core Alignment, Added WALK_OFFSET Calibration Config
-- Modification: Wither-Style Detachable Hand Grab Projectile System
-- Edits: Animatronic FNAF Idle Breathing & Micro-Glitch Mechanics (GLITCH UNLEASHED MULTI-FRAME EXTENSION)
-- Chameleon Patch: Raycast Ground-Color Adaptation Camouflage System by Josep Bart
-- FIX NOTE: Eliminating Delay & Prop Desynchronization on State Toggle (Instant Snap Realignment)

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local OwnerName = LP.Name
local petMode = false
local rampageMode = false 
local camoMode = false -- [[ CAMOUFLAGE SYSTEM STATE ]]
local wingRemoteCache = {}
local PERMANENT_PROP_LOCK = {} 
local currentCFrames = {}
local lastNetworkUpdate = 0
local lastColorUpdate = 0
local lastValidationTime = 0
local colorIndex = 1

-- [[ STATE UNTUK LOCK POSISI SAAT SCRIPT SEOLAH-OLAH MATI ]] --
local engineActiveState = false -- true = aktif jalan, false = "seolah-olah mati" tapi loop tetap jalan
local savedPositionsOnDisable = {}
local snapNextFrame = false -- Trigger untuk menghilangkan delay saat diaktifkan kembali

-- [[ ENEMY CONTROL TRACKER ]] --
local witherCurrentPos = Vector3.zero 
local lastLookAtPos = Vector3.zero 
local isMovingState = false 
local lastOwnerVelocity = Vector3.new(0,0,1) 

-- =============================================================================
-- [[ CONFIGURASI MANUAL RADAR TEROR - OPTIMASI BERBOBOT V5.4 ]] --
-- =============================================================================
local TARGET_HEIGHT_LOCK = 35      -- Diubah ke 30 Stud DI ATAS TARGET
local CHASE_SPEED = 18             -- Kecepatan langkah perpindahan
local BASE_ANIM_SPEED = 0.22       -- Kecepatan ayunan kaki raksasa
local LERP_ALPHA = 1.5             -- SEKARANG DIATUR KE 1.5 (Respons Kilat & Presisi)
local TIMER_TARGET_ALL = 15.0       -- Durasi kunci target sebelum berpindah (Rampage Mode)

-- [[ NEW CONFIG: WITHER HAND GRAB PROJECTILE ]] --
local TARGET_AREA = 50             -- Radius area target untuk memicu copotnya tangan (Studs)
local HAND_FLY_SPEED = 80          -- Kecepatan proyektil tangan mengejar target
local GRAB_COOLDOWN = 7           -- Cooldown serangan grab (Detik)

-- [[ KALIBRASI KEMIRINGAN JALAN / KEJAR (PATCH V5.4) ]] --
local WALK_OFFSET = 19              -- [UBAH DI SINI] Nilai derajat (Degree) untuk meluruskan/memiringkan engine pas jalan.

-- [[ NEW MECHANISM CONFIG: HEIGHT READAPTIVE ]] --
local MAX_HEIGHT_THRESHOLD = 15    -- Toleransi tinggi (30 studs)
local STR_FRONT_OFFSET = 8         -- Jarak teleportasi depan target

-- [[ CONFIG ADJUSTMENT & POSITION OFFSET ]] --
local PET_OFFSET = Vector3.new(-10, 0, -5) -- Offset posisi dari Owner
local MANUAL_ROTATION = Vector3.new(0, 0, 0)
local AUTONOMOUS_BUFFER_RADIUS = 6        -- Radius buffer berhenti jalan
local MAX_VERTICAL_SPEED = 140            

-- [[ NEW CONFIG: ANIMATRONIC GLITCH & IDLE BREATHING ]] --
local BREATH_SPEED = 0.12          -- Kecepatan nafas animatronic saat idle
local BREATH_HEIGHT = 0.12         -- Tinggi ayunan nafas (Studs)
local GLITCH_CHANCE = 0.3         -- Peluang terjadinya glitch patah per tick acak (Ditingkatkan untuk Multi-Frame)
local GLITCH_MAX_ROT = 1           -- Maksimal derajat patahan rotasi glitch (Degree)

local TargetPlayer = nil       
local lastTargetSwitchTime = 0

-- Interpolation Weight Tracker
local currentWalkWeight = 0  
local movementBlend = 0      
local dynamicAnimTime = 0

-- [[ MULTI-FRAME GLITCH RUNTIME TRACKER (1-15) ]] --
local multiGlitchCF = {}
local nextGlitchCheckFrame = {}
for i = 1, 15 do
    multiGlitchCF[i] = CFrame.new()
    nextGlitchCheckFrame[i] = 0
end

-- [[ HAND GRAB SYSTEM STATES ]] --
local handGrabState = {
    [2] = { active = false, currentPos = Vector3.zero, lastTrackedCF = CFrame.new() }, -- Lengan Kanan
    [3] = { active = false, currentPos = Vector3.zero, lastTrackedCF = CFrame.new() }  -- Lengan Kiri
}
local lastGrabAttackTime = 0
-- =============================================================================

local COLORS = {
    AbyssGreen = Color3.fromRGB(180, 70, 40),  
    DarkAbyss = Color3.fromRGB(45, 40, 35),
    Void = Color3.fromRGB(15, 15, 15),
    Accent = Color3.fromRGB(255, 255, 255),
    SuccessGreen = Color3.fromRGB(0, 255, 120),
    WarningRed = Color3.fromRGB(255, 0, 50),
    CamoDefault = Color3.fromRGB(100, 100, 100)
}

-- [[ FUNCTION UNTUK MENDETEKSI WARNA BLOK DI BAWAH / DIINJAK ]] --
local function GetGroundColor()
    local castOrigin = witherCurrentPos
    local castDirection = Vector3.new(0, -100, 0)
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    
    local ignoreList = {LP.Character}
    for _, prop in pairs(PERMANENT_PROP_LOCK) do
        if prop then table.insert(ignoreList, prop) end
    end
    raycastParams.FilterDescendantsInstances = ignoreList
    
    local raycastResult = workspace:Raycast(castOrigin, castDirection, raycastParams)
    
    if raycastResult and raycastResult.Instance then
        return raycastResult.Instance.Color
    end
    return COLORS.CamoDefault
end

local function getTerrorColor(t, offset)
    if not engineActiveState then
        return COLORS.DarkAbyss -- Warna redup saat "Mati"
    end
    if camoMode then
        return GetGroundColor()
    elseif rampageMode then
        local cycle = (t * 2 + (offset * 0.1)) % 1
        return cycle < 0.5 and COLORS.WarningRed:Lerp(COLORS.Void, cycle * 2) or COLORS.Void:Lerp(COLORS.WarningRed, (cycle - 0.5) * 2)
    else
        local cycle = (t * 0.5 + (offset * 0.1)) % 1
        return cycle < 0.5 and COLORS.AbyssGreen:Lerp(COLORS.DarkAbyss, cycle * 2) or COLORS.DarkAbyss:Lerp(COLORS.Void, (cycle - 0.5) * 2)
    end
end

-- =============================================================================
-- [[ ASSET DATA CENTRALIZATION: AUTOMATIC OBJECT-SPACE MAPPER ]] --
-- =============================================================================
local function getOff(base, target) return base:ToObjectSpace(target) end

local baseRef = CFrame.new(232.3023986, 38.9824333, -60.8036194, 0.9778366, 0, 0.2093695, 0, 1, 0, -0.2093695, 0, 0.9778366)
local baseRefW1 = CFrame.new(129.9228515625, 35.143611907958984, -61.29117965698242, 0.9641245007514954, -0.02713889442384243, 0.26405954360961914, 0.000028596616175491363, 0.9947707056999207, 0.10213346779346466, -0.26545047760009766, -0.09846165031194687, 0.959082305431366)
local baseRefW2 = CFrame.new(128.08718872070312, 35.143611907958984, -61.53959655761719, 0.7951629161834717, -0.03949219360947609, 0.6051066517829895, -0.0779120922088623, 0.9829525947570801, 0.16653534770011902, -0.60136878490448, -0.1795673817396164, 0.7785313129425049)

local IdleGroup = {
    getOff(baseRef, CFrame.new(232.3023986, 38.9824333, -60.8036194, 0.9778366, 0, 0.2093695, 0, 1, 0, -0.2093695, 0, 0.9778366)),
    getOff(baseRef, CFrame.new(240.5371551, 14.1102228, -61.0283889, 0.0689053, -0.9858456, 0.1528403, 0.9976123, 0.0675192, -0.0142623, 0.003741, 0.1534587, 0.9881479)),
    getOff(baseRef, CFrame.new(223.9678344, 13.8164434, -61.1750602, 0.0957036, 0.994655, 0.0388204, -0.9926096, 0.0982859, -0.0711995, -0.0746343, -0.0317192, 0.9967064)),
    getOff(baseRef, CFrame.new(233.2430877, 30.9469032, -60.8869628, -0.9996326, 0, 0.0270163, 0, 1, 0, -0.0270162, 0, -0.9996349)),
    getOff(baseRef, CFrame.new(231.1674194, 30.9406814, -60.9370002, -0.999633, 0, 0.0270163, 0, 1, 0, -0.0270162, 0, -0.9996349)),
    getOff(baseRef, CFrame.new(229.3403015, 46.3689079, -60.9576072, 0.0209904, -0.3375093, -0.9410883, -0.0417356, -0.9407709, 0.3364637, -0.9989098, 0.0322142, -0.0338341)),
    getOff(baseRef, CFrame.new(235.5837097, 46.1672821, -60.8119506, 0.021395, 0.2705215, -0.962475, -0.020707, -0.962369, -0.270952, -0.9995556, 0.0257268, -0.0149883)),
    getOff(baseRef, CFrame.new(238.8957366, 32.4837913, -60.8953971, 0.5420891, -0.0358051, -0.8395596, 0.025655, -0.9979245, 0.059124, -0.839931, -0.0535894, -0.5400453)),
    getOff(baseRef, CFrame.new(240.2358093, 32.4837913, -59.6607055, 0.5420868, -0.0358051, -0.839561, 0.0256553, -0.9979242, 0.0591239, -0.8399324, -0.0535894, -0.5400428)),
    getOff(baseRef, CFrame.new(224.958847, 32.1642532, -61.0450554, -0.4817858, 0.0486538, -0.8749402, 0.0182126, -0.9976887, -0.0655083, -0.8761031, -0.0474958, 0.4797812)),
    getOff(baseRef, CFrame.new(223.504074, 32.7658501, -59.7457008, -0.5307044, 0.0486943, -0.8461601, 0.0144331, -0.9976881, -0.0664664, -0.8474373, -0.0474866, 0.5287698)),
    getOff(baseRef, CFrame.new(233.2770691, 31.0102139, -60.9098816, -0.0433366, 0.0451849, 0.9980379, 0.0000572, -0.9989781, 0.0452298, 0.9990602, 0.0020171, 0.0432893)),
    getOff(baseRef, CFrame.new(231.0491486, 31.1578026, -61.0026741, -0.0241801, -0.0807743, 0.9964392, -0.0015258, -0.9967264, -0.0808346, 0.9997105, -0.0034747, 0.0239726)),
    getOff(baseRef, CFrame.new(229.8385773, 16.4252281, -61.1181717, -0.9972924, -0.0733744, -0.0049038, 0.0732669, -0.9971246, 0.0193554, -0.0063099, 0.0189438, 0.9997989)),
    getOff(baseRef, CFrame.new(234.092453, 1.4564791, -60.2311058, -0.9998741, -0.0008774, -0.0159508, 0.0000145, 0.9984403, -0.0558303, -0.0159749, -0.0558234, -0.9983163))
}

local WalkGroup1 = {
    getOff(baseRefW1, CFrame.new(129.9228515625, 35.143611907958984, -61.29117965698242, 0.9641245007514954, -0.02713889442384243, 0.26405954360961914, 0.000028596616175491363, 0.9947707056999207, 0.10213346779346466, -0.26545047760009766, -0.09846165031194687, 0.959082305431366)),
    getOff(baseRefW1, CFrame.new(138.50, 10.702008247375488, -59.50, 0.06897057592868805, -0.924700915813446, 0.3743951618671417, 0.9976230263710022, 0.06402607262134552, -0.025645166635513306, -0.0002570378128439188, 0.3752707242965698, 0.9269136786460876)),
    getOff(baseRefW1, CFrame.new(120.50, 11.609552383422852, -67.80, 0.091289222240448, 0.8899009227752686, -0.4469262957572937, -0.9925974607467651, 0.04521351680159569, -0.11272122710943222, -0.08010299503803253, 0.4539071023464203, 0.8874409198760986)),
    getOff(baseRefW1, CFrame.new(130.7450408935547, 27.108081817626953, -60.88818359375, -0.9995296001434326, -0.002943190047517419, -0.030620986595749855, 0.000011974968401773367, 0.9953750371932983, -0.09606330841779709, 0.030762100592255592, -0.09601821005344391, -0.994907021522522)),
    getOff(baseRefW1, CFrame.new(128.66993713378906, 27.10186004638672, -60.81836700439453, -0.9995267391204834, -0.0029590465128421783, -0.030619366094470024, 0.000027914971724385396, 0.9952751398086548, -0.09709475934505463, 0.030762003734707832, -0.09704966843128204, -0.9948040246963501)),
    getOff(baseRefW1, CFrame.new(126.98838806152344, 42.530086517333984, -62.083473205566406, 0.9399992823600769, -0.33746337890625, 0.050199348479509354, -0.3375626802444458, -0.8985608220100403, 0.28042829036712646, -0.04952710494399071, -0.2805478274822235, -0.9585614800453186)),
    getOff(baseRefW1, CFrame.new(133.13690185546875, 42.328460693359375, -62.72903060913086, 0.957082211971283, 0.28976520895957947, -0.005433846265077591, 0.2688964903354645, -0.8948335647583008, -0.3563224971294403, -0.10811269283294678, 0.33956918120384216, -0.9343461990356445)),
    getOff(baseRefW1, CFrame.new(137.60, 29.06888198852539, -58.36807632446289, 0.542, -0.035, -0.839, 0.025, -0.997, 0.059, -0.839, -0.053, -0.540)),
    getOff(baseRefW1, CFrame.new(138.80, 29.979955673217773, -56.32234573364258, 0.542, -0.035, -0.839, 0.025, -0.997, 0.059, -0.839, -0.053, -0.540)),
    getOff(baseRefW1, CFrame.new(121.00, 28.983482360839844, -66.433349609375, -0.481, 0.048, -0.874, 0.018, -0.997, -0.065, -0.876, -0.047, 0.479)),
    getOff(baseRefW1, CFrame.new(121.15, 29.64547348022461, -64.65916442871094, -0.530, 0.048, -0.846, 0.014, -0.997, -0.066, -0.847, -0.047, 0.528)),
    getOff(baseRefW1, CFrame.new(130.7776336669922, 27.1713924407959, -60.91302490234375, -0.9989818334579468, 0.04042067378759384, 0.02020900510251522, -0.045151181519031525, -0.9115496873855591, -0.40870776772499084, 0.0019012321718037128, -0.4092026650905609, 0.9124417304992676)),
    getOff(baseRefW1, CFrame.new(128.54808044433594, 27.318981170654297, -60.877105712890625, -0.9964650869369507, -0.07153870165348053, 0.044020600616931915, 0.08085013926029205, -0.9589792490005493, 0.2717016935348511, 0.022777654230594635, 0.2743014097213745, 0.9613741040229797)),
    getOff(baseRefW1, CFrame.new(127.70258331298828, 13.187357902526855, -57.15911102294922, -0.9959995746612549, -0.04767129197716713, 0.0755796805024147, 0.0732669, -0.9202494621276855, 0.3844219446182251, 0.051226235926151276, 0.3884177803993225, 0.9200584292411804)),
    getOff(baseRefW1, CFrame.new(131.29457092285156, -1.1201149225234985, -66.09347534179688, -0.9983353614807129, -0.003677826374769211, -0.05755890905857086, -0.0004622979904524982, 0.9984447360038757, -0.055778902024030685, 0.05767443776130676, -0.05565943941473961, -0.996782660484314))
}

local WalkGroup2 = {
    getOff(baseRefW2, CFrame.new(128.08718872070312, 35.143611907958984, -61.53959655761719, 0.7951629161834717, -0.03949219360947609, 0.6051066517829895, -0.0779120922088623, 0.9829525947570801, 0.16653534770011902, -0.60136878490448, -0.1795673817396164, 0.7785313129425049)),
    getOff(baseRefW2, CFrame.new(136.50, 10.525710105895996, -67.90, 0.06894943118095398, -0.9715144038200378, 0.22673563659191132, 0.997619092464447, 0.06748367100954056, -0.01421639695763588, -0.0014899704838171601, 0.2271759957075119, 0.9738526344299316)),
    getOff(baseRefW2, CFrame.new(118.00, 10.830269813537598, -57.50, 0.09715007990598679, 0.9915374517440796, -0.08609023690223694, -0.9951514005661011, 0.09544254839420319, -0.02375989593565464, -0.015342273749411106, 0.08798099309206009, 0.9960039854049683)),
    getOff(baseRefW2, CFrame.new(129.00091552734375, 27.108081817626953, -61.270626068115234, -0.9988399744033813, -0.004494875203818083, -0.047996003180742264, 0.00001235430590895703, 0.995619535446167, -0.09349801391363144, 0.04820599406957626, -0.09338988363742828, -0.9944643974304199)),
    getOff(baseRefW2, CFrame.new(126.92736053466797, 27.10186004638672, -61.16438293457031, -0.9988415241241455, -0.004626719281077385, -0.04798770695924759, -0.00002800416223180946, 0.9954398274421692, -0.09539211541414261, 0.04821024835109711, -0.09527989476919174, -0.9942867755889893)),
    getOff(baseRefW2, CFrame.new(124.72425842285156, 42.530086517333984, -62.586944580078125, 0.9423377513885498, -0.3255261480808258, -0.07766629755496979, -0.332121342420578, -0.8810988664627075, -0.3366834819316864, 0.0411674939095974, 0.34306421875953674, -0.9384084939956665)),
    getOff(baseRefW2, CFrame.new(130.73532104492188, 42.50539779663086, -62.447452545166016, 0.9599224328994751, 0.2731432020664215, -0.06278303265571594, 0.28022274374961853, -0.9314389228820801, 0.23216478526592255, 0.00493581872433424, -0.24045337736606598, -0.9706517457962036)),
    getOff(baseRefW2, CFrame.new(135.80, 28.644969940185547, -66.71939849853516, 0.477, -0.039, -0.877, 0.025, -0.997, 0.059, -0.878, -0.050, -0.475)),
    getOff(baseRefW2, CFrame.new(136.30, 28.613550186157227, -65.05243682861328, 0.477, -0.039, -0.877, 0.025, -0.997, 0.059, -0.878, -0.050, -0.475)),
    getOff(baseRefW2, CFrame.new(119.10, 29.791667938232422, -58.10007858276367, -0.546, 0.044, -0.836, 0.018, -0.997, -0.065, -0.837, -0.051, 0.544)),
    getOff(baseRefW2, CFrame.new(117.80, 29.89547348022461, -56.54653549194336, -0.592, 0.044, -0.804, 0.014, -0.997, -0.066, -0.805, -0.051, 0.590)),
    getOff(baseRefW2, CFrame.new(129.0330810546875, 27.171390533447266, -61.29603576660156, -0.9940800666809082, 0.06494835019111633, 0.08712039142847061, -0.04510005563497543, -0.9760092496871948, 0.21300722658634186, 0.09886486083269119, 0.20781610906124115, 0.9731579422950745)),
    getOff(baseRefW2, CFrame.new(126.80448913574219, 27.318981170654297, -61.22097396850586, -0.9952222108840942, -0.08892518281936646, 0.04020283371210098, 0.07029175758361816, -0.9389462471008301, -0.33679333329200745, 0.06769794970750809, -0.3323611915111542, 0.9407194256782532)),
    getOff(baseRefW2, CFrame.new(125.64264678955078, 14.084943771362305, -66.05441284179688, -0.9949436187744141, -0.0717380940914154, 0.07027923315763474, 0.0732669, -0.9971262216567993, 0.019371315836906433, 0.06868738681077957, 0.02442222461104393, 0.9973392486572266)),
    getOff(baseRefW2, CFrame.new(130.24258422851562, 0.48375242948532104, -50.58259963989258, -0.9971590042114258, -0.04048840329051018, -0.06346297264099121, -0.0004535670159384608, 0.846259355545044, -0.5327719449996948, 0.07527715712785721, -0.5312296152114868, -0.8438765406608582))
}
-- =============================================================================

local function ValidateAndLockProps()
    local trafficCones = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_TrafficCones")
    if not trafficCones then return false end

    local targetName = (OwnerName == "terasiremik") and "Propterasiremik" or ("Prop" .. OwnerName)
    
    local rawProps = {}
    for _, v in ipairs(trafficCones:GetChildren()) do 
        if v.Name == targetName then table.insert(rawProps, v) end
    end

    local changed = false
    for id, storedProp in pairs(PERMANENT_PROP_LOCK) do
        if not storedProp or not storedProp.Parent then 
            PERMANENT_PROP_LOCK[id] = nil
            currentCFrames[id] = nil 
            changed = true
        end
    end

    for _, prop in ipairs(rawProps) do
        local alreadyRegistered = false
        for id, storedProp in pairs(PERMANENT_PROP_LOCK) do
            if storedProp == prop then alreadyRegistered = true break end
        end
        
        if not alreadyRegistered then
            for id = 1, #IdleGroup do
                if not PERMANENT_PROP_LOCK[id] then
                    PERMANENT_PROP_LOCK[id] = prop
                    currentCFrames[id] = nil 
                    changed = true
                    break
                end
            end
        end
    end

    if changed then
        wingRemoteCache = {}
        for id = 1, #IdleGroup do
            if PERMANENT_PROP_LOCK[id] and PERMANENT_PROP_LOCK[id].Parent then
                wingRemoteCache[id] = PERMANENT_PROP_LOCK[id]
            end
        end
    end

    return true
end

local function FindNearestPrey()
    local nearestPlayer = nil
    local shortestDistance = math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local torso = p.Character:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and torso then
                local dist = (witherCurrentPos - torso.Position).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    nearestPlayer = p
                end
            end
        end
    end
    return nearestPlayer
end

local function SwitchToNextTarget()
    local validTargets = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p ~= TargetPlayer and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local torso = p.Character:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and torso then table.insert(validTargets, p) end
        end
    end
    if #validTargets > 0 then return validTargets[math.random(1, #validTargets)] end
    return FindNearestPrey()
end

-- [[ INTERFACE GUI ]] --
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "Radar_Terror_Control"
local main = Instance.new("Frame", sg)
main.Size, main.Position = UDim2.new(0, 180, 0, 200), UDim2.new(0.05, 0, 0.4, 0)
main.BackgroundColor3, main.BorderSizePixel = Color3.fromRGB(5, 15, 10), 0

local titleBar = Instance.new("Frame", main)
titleBar.Size, titleBar.BackgroundColor3 = UDim2.new(1, 0, 0, 25), Color3.fromRGB(15, 30, 20)
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size, titleLabel.Position = UDim2.new(1, -10, 1, 0), UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency, titleLabel.Text = 1, "RADAR TEROR WALKING V5.4"
titleLabel.TextColor3, titleLabel.Font, titleLabel.TextSize = Color3.new(1, 1, 1), Enum.Font.SourceSansBold, 12
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local statusLabel = Instance.new("TextLabel", main)
statusLabel.Size, statusLabel.Position = UDim2.new(1, -10, 0, 15), UDim2.new(0, 5, 1, -30)
statusLabel.BackgroundTransparency, statusLabel.Text = 1, "STATUS: STANDBY"
statusLabel.TextColor3, statusLabel.Font, statusLabel.TextSize = COLORS.SuccessGreen, Enum.Font.Code, 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

local creditLabel = Instance.new("TextLabel", main)
creditLabel.Size, creditLabel.Position = UDim2.new(1, 0, 0, 15), UDim2.new(0, 0, 1, -15)
creditLabel.BackgroundTransparency, creditLabel.Text = 1, "Partner Dyton - Josep Bart"
creditLabel.TextColor3, creditLabel.Font, creditLabel.TextSize = COLORS.Accent, Enum.Font.Code, 10

local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local container = Instance.new("Frame", main)
container.Size, container.Position, container.BackgroundTransparency = UDim2.new(1, -10, 1, -65), UDim2.new(0, 5, 0, 30), 1

local function styleBtn(b)
    b.BackgroundColor3, b.BorderSizePixel, b.BorderColor3 = COLORS.Void, 1, Color3.fromRGB(0, 60, 30)
    b.TextColor3, b.Font, b.TextSize = Color3.new(0.8, 1, 0.8), Enum.Font.SourceSansBold, 11
end

local SummonBtn = Instance.new("TextButton", container)
SummonBtn.Text, SummonBtn.Position, SummonBtn.Size = "SUMMON RADAR TEROR", UDim2.new(0,0,0,0), UDim2.new(1,0,0.22,0) styleBtn(SummonBtn)

local TargetBox = Instance.new("TextBox", container)
TargetBox.Size, TargetBox.Position = UDim2.new(1, 0, 0.20, 0), UDim2.new(0, 0, 0.26, 0)
TargetBox.BackgroundColor3, TargetBox.BorderColor3, TargetBox.TextColor3 = Color3.fromRGB(5, 10, 5), Color3.fromRGB(0, 60, 30), Color3.fromRGB(180, 255, 180)
TargetBox.PlaceholderText, TargetBox.Font, TargetBox.TextSize, TargetBox.ClearTextOnFocus = "Lock Target Individual", Enum.Font.Code, 10, false

local RampageBtn = Instance.new("TextButton", container)
RampageBtn.Text, RampageBtn.Position, RampageBtn.Size = "TARGET ALL: OFF", UDim2.new(0, 0, 0.50, 0), UDim2.new(1, 0, 0.22, 0) styleBtn(RampageBtn)

local CamoBtn = Instance.new("TextButton", container)
CamoBtn.Text, CamoBtn.Position, CamoBtn.Size = "CAMOUFLAGE: OFF", UDim2.new(0, 0, 0.76, 0), UDim2.new(1, 0, 0.22, 0) styleBtn(CamoBtn)

TargetBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if rampageMode then return end
        local searchKey = TargetBox.Text:lower()
        if searchKey == "" then TargetPlayer = nil TargetBox.Text = "" return end
        
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Name:lower():find(searchKey) or p.DisplayName:lower():find(searchKey) then
                TargetPlayer = p
                TargetBox.Text = p.DisplayName
                lastTargetSwitchTime = tick()
                break
            end
        end
    end
end)

SummonBtn.MouseButton1Click:Connect(function()
    engineActiveState = not engineActiveState
    
    if engineActiveState then
        petMode = true 
        snapNextFrame = true -- [[ FIX BY JOSEP: Paksa snap instan di frame berikutnya untuk hilangkan delay ]]
        SummonBtn.Text = "DISMISS RADAR TEROR"
        SummonBtn.TextColor3 = COLORS.SuccessGreen
        
        local char = LP.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local ownerRoot = char.HumanoidRootPart
            witherCurrentPos = ownerRoot.Position + Vector3.new(0, TARGET_HEIGHT_LOCK, 0)
            lastLookAtPos = witherCurrentPos + (ownerRoot.CFrame.LookVector * 20)
        end
        ValidateAndLockProps()
        table.clear(savedPositionsOnDisable) 
    else
        SummonBtn.Text = "SUMMON RADAR TEROR"
        SummonBtn.TextColor3 = Color3.new(0.8, 1, 0.8)
        
        -- [[ FIX OPTIMIZATION BY DYTON: Hancurkan cache pelacakan posisi lama secara total saat OFF ]]
        table.clear(savedPositionsOnDisable)
        table.clear(currentCFrames)
        
        rampageMode = false
        camoMode = false
        CamoBtn.Text = "CAMOUFLAGE: OFF"
        CamoBtn.TextColor3 = Color3.new(0.8, 1, 0.8)
        TargetPlayer = nil
        TargetBox.Text = ""
    end
end)

RampageBtn.MouseButton1Click:Connect(function()
    if not engineActiveState then return end
    rampageMode = not rampageMode
    if rampageMode then
        RampageBtn.Text = "TARGET ALL: ACTIVE"
        TargetBox.Text = "[CYCLING TARGETS]"
        TargetPlayer = FindNearestPrey()
        lastTargetSwitchTime = tick()
        if camoMode then
            camoMode = false
            CamoBtn.Text = "CAMOUFLAGE: OFF"
            CamoBtn.TextColor3 = Color3.new(0.8, 1, 0.8)
        end
    else
        RampageBtn.Text = "TARGET ALL: OFF"
        TargetPlayer = nil
        TargetBox.Text = ""
    end
end)

CamoBtn.MouseButton1Click:Connect(function()
    if not engineActiveState then return end
    camoMode = not camoMode
    if camoMode then
        CamoBtn.Text = "CAMOUFLAGE: ACTIVE"
        CamoBtn.TextColor3 = COLORS.SuccessGreen
        if rampageMode then
            rampageMode = false
            RampageBtn.Text = "TARGET ALL: OFF"
            TargetPlayer = nil
            TargetBox.Text = ""
        end
    else
        CamoBtn.Text = "CAMOUFLAGE: OFF"
        CamoBtn.TextColor3 = Color3.new(0.8, 1, 0.8)
    end
end)

local function getTargetTorso(player)
    if not player or not player.Character or not player.Character.Parent then return nil end
    local hum = player.Character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return nil end
    return player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("Torso")
end

-- [[ MAIN PATHFINDER & BLENDING RE-ENGINEERED V5.4 HEAVY ]] --
RS.Heartbeat:Connect(function(dt)
    if not petMode then return end 

    local t = tick()
    
    if t - lastValidationTime > 0.8 then 
        ValidateAndLockProps()
        lastValidationTime = t
    end

    -- [[ JIKA ENGINE DINONAKTIFKAN (MATI TOTAL) ]] --
    if not engineActiveState then
        statusLabel.Text = "STATUS: SHUTDOWN (POSITION LOCK)"
        statusLabel.TextColor3 = COLORS.WarningRed
        
        if t - lastNetworkUpdate > 0.014 then
            local canUpdateColor = (t - lastColorUpdate > 0.05)
            
            for i = 1, #IdleGroup do
                local prop = wingRemoteCache[i]
                if prop and prop.Parent then
                    -- [[ FIX CORE LOGIC: Baca langsung CFrame asli objek saat ini di Workspace ]]
                    -- Dengan ini, jika kamu geser atau taruh prop baru, dia tidak akan tersedot ke posisi lama
                    local currentObjectCF = prop.CFrame
                    
                    task.spawn(function()
                        local cfR = prop:FindFirstChild("SetCurrentCFrame")
                        if cfR then pcall(function() cfR:InvokeServer(currentObjectCF) end) end
                        
                        if canUpdateColor and i == colorIndex then
                            local crR = prop:FindFirstChild("ChangePropColor")
                            if crR then pcall(function() crR:InvokeServer(getTerrorColor(t, i)) end) end
                        end
                    end)
                end
            end
            if canUpdateColor then
                colorIndex = (colorIndex % #IdleGroup) + 1
                lastColorUpdate = t
            end
            lastNetworkUpdate = t
        end
        return 
    end

    local totalProps = 0
    for i = 1, #IdleGroup do
        if wingRemoteCache[i] then totalProps = totalProps + 1 end
    end
    if totalProps < 1 then return end

    -- ==========================================
    -- LOGIKA PERHITUNGAN GERAK DI BAWAH HANYA JALAN JIKALAU ENGINE SEDNG 'ON'
    -- ==========================================
    if rampageMode then
        local currentTargetTorso = getTargetTorso(TargetPlayer)
        if not TargetPlayer or not currentTargetTorso or (t - lastTargetSwitchTime >= TIMER_TARGET_ALL) then
            TargetPlayer = SwitchToNextTarget()
            lastTargetSwitchTime = t
            if TargetPlayer then 
                TargetBox.Text = "TEROR: " .. TargetPlayer.DisplayName
            else
                TargetBox.Text = "[NO PREY FOUND]"
            end
        end
    end

    local currentTarget = TargetPlayer
    local isPetState = false
    
    if not currentTarget or not getTargetTorso(currentTarget) or (currentTarget == LP and TargetBox.Text == "") then
        currentTarget = LP
        isPetState = true
    end

    local targetTorso = getTargetTorso(currentTarget)
    
    if targetTorso then
        local idealPos
        local targetHeight = targetTorso.Position.Y + TARGET_HEIGHT_LOCK

        local currentHeightDelta = math.abs(witherCurrentPos.Y - targetHeight)
        if currentHeightDelta > MAX_HEIGHT_THRESHOLD then
            local targetLookVector = targetTorso.CFrame.LookVector
            local frontFlatVector = Vector3.new(targetLookVector.X, 0, targetLookVector.Z).Unit
            
            if frontFlatVector.Magnitude ~= frontFlatVector.Magnitude then 
                frontFlatVector = Vector3.new(0, 0, -1) 
            end
            
            local teleportBase = targetTorso.Position + (frontFlatVector * STR_FRONT_OFFSET)
            witherCurrentPos = Vector3.new(teleportBase.X, targetHeight, teleportBase.Z)
        end

        if isPetState then
            local ownerRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            
            if ownerRoot then
                if ownerRoot.Velocity.Magnitude > 2 then
                    local moveDir = Vector3.new(ownerRoot.Velocity.X, 0, ownerRoot.Velocity.Z).Unit
                    lastOwnerVelocity = moveDir
                else
                    lastOwnerVelocity = Vector3.new(ownerRoot.CFrame.LookVector.X, 0, ownerRoot.CFrame.LookVector.Z).Unit
                end
                
                local currentHeadingRotation = CFrame.lookAt(Vector3.zero, lastOwnerVelocity)
                local petRaw = ownerRoot.Position + (currentHeadingRotation * PET_OFFSET)
                idealPos = Vector3.new(petRaw.X, targetHeight, petRaw.Z)
                
                lastLookAtPos = idealPos + (lastOwnerVelocity * 20)
            else
                idealPos = Vector3.new(targetTorso.Position.X, targetHeight, targetTorso.Position.Z)
                lastLookAtPos = idealPos + Vector3.new(0, 0, 20)
            end
        else
            local orbitRadius = 1.0 
            local orbitSpeed = 0.3 
            local offsetX = math.sin(t * orbitSpeed) * orbitRadius
            local offsetZ = math.cos(t * orbitSpeed) * orbitRadius
            
            idealPos = Vector3.new(targetTorso.Position.X + offsetX, targetHeight, targetTorso.Position.Z + offsetZ)
            lastLookAtPos = targetTorso.Position 
        end
        
        local distanceToIdeal = (Vector3.new(idealPos.X, 0, idealPos.Z) - Vector3.new(witherCurrentPos.X, 0, witherCurrentPos.Z)).Magnitude
        
        local shouldMove = true
        if isPetState and distanceToIdeal < AUTONOMOUS_BUFFER_RADIUS then
            shouldMove = false
        end

        local oldPos = witherCurrentPos

        if shouldMove then
            local moveDirection = (idealPos - witherCurrentPos).Unit
            local step = moveDirection * (CHASE_SPEED * dt)
            
            if step.Magnitude > (idealPos - witherCurrentPos).Magnitude then
                witherCurrentPos = idealPos
            else
                witherCurrentPos = witherCurrentPos + step
            end
            
            if isPetState then
                statusLabel.Text = camoMode and "CAMO: STALKING OWNER" or "FOLLOWING (SEJAJAR MAKSIMAL)"
                statusLabel.TextColor3 = COLORS.SuccessGreen
            else
                statusLabel.Text = camoMode and "CAMO: HUNTING MUSUH" or "STALKING MUSUH (HEAVY CHASE)"
                statusLabel.TextColor3 = COLORS.WarningRed
            end
        else
            if isPetState then
                statusLabel.Text = camoMode and "CAMO: IDLE" or "IDLE STATUS (SEJAJAR MAKSIMAL)"
                statusLabel.TextColor3 = COLORS.AbyssGreen
            end
        end
        
        local currentY = witherCurrentPos.Y
        local deltaY = targetHeight - currentY
        local maxVerticalStep = MAX_VERTICAL_SPEED * dt
        local finalY = currentY + math.clamp(deltaY, -maxVerticalStep, maxVerticalStep)
        
        witherCurrentPos = Vector3.new(witherCurrentPos.X, finalY, witherCurrentPos.Z)

        local groundDelta = Vector3.new(witherCurrentPos.X - oldPos.X, 0, witherCurrentPos.Z - oldPos.Z).Magnitude
        local realGroundVelocity = groundDelta / dt

        if realGroundVelocity > 1.5 then
            isMovingState = true
            dynamicAnimTime = dynamicAnimTime + (dt * realGroundVelocity * BASE_ANIM_SPEED)
        else
            isMovingState = false
        end
    else
        local ownerRoot = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if ownerRoot then
            local petRaw = (ownerRoot.CFrame * CFrame.new(PET_OFFSET)).Position
            witherCurrentPos = Vector3.new(petRaw.X, ownerRoot.Position.Y + TARGET_HEIGHT_LOCK, petRaw.Z)
        end
        isMovingState = false
    end

    if not isPetState and targetTorso then
        local distanceToTarget = (witherCurrentPos - targetTorso.Position).Magnitude
        
        if distanceToTarget <= TARGET_AREA and (t - lastGrabAttackTime >= GRAB_COOLDOWN) then
            if not handGrabState[2].active and not handGrabState[3].active then
                lastGrabAttackTime = t
                for _, armId in ipairs({2, 3}) do
                    if currentCFrames[armId] then
                        handGrabState[armId].active = true
                        handGrabState[armId].currentPos = currentCFrames[armId].Position
                        handGrabState[armId].lastTrackedCF = currentCFrames[armId]
                    end
                end
            end
        end
    end

    local forwardVector = (lastLookAtPos - witherCurrentPos).Unit
    local flatForward = Vector3.new(forwardVector.X, 0, forwardVector.Z).Unit
    if flatForward.Magnitude ~= flatForward.Magnitude then flatForward = Vector3.new(0,0,-1) end
    
    local finalPos = CFrame.fromMatrix(witherCurrentPos, flatForward:Cross(Vector3.new(0,1,0)), Vector3.new(0,1,0), -flatForward)
    
    local currentWalkOffset = isMovingState and WALK_OFFSET or 0
    local rotCF = CFrame.Angles(
        math.rad(MANUAL_ROTATION.X), 
        math.rad(MANUAL_ROTATION.Y + currentWalkOffset), 
        math.rad(MANUAL_ROTATION.Z)
    )

    if isMovingState then
        currentWalkWeight = (math.sin(dynamicAnimTime) + 1) / 2 
        movementBlend = math.min(movementBlend + (dt * 5.0), 1) 
    else
        movementBlend = math.max(movementBlend - (dt * 2.5), 0) 
    end

    -- Hitung interpolasi alpha
    local actualAlpha = math.clamp(LERP_ALPHA * dt * 60, 0, 1)
    
    -- [[ OVERRIDE ALPHA JIKA BARU MENYALA ]]
    if snapNextFrame then
        actualAlpha = 1 -- Langsung samakan posisi instan tanpa lerp/delay
    end

    for id = 1, 15 do
        if t >= nextGlitchCheckFrame[id] then
            if math.random() <= GLITCH_CHANCE then
                local rotX = math.random(-GLITCH_MAX_ROT, GLITCH_MAX_ROT)
                local rotY = math.random(-GLITCH_MAX_ROT, GLITCH_MAX_ROT)
                local rotZ = math.random(-GLITCH_MAX_ROT, GLITCH_MAX_ROT)
                multiGlitchCF[id] = CFrame.Angles(math.rad(rotX), math.rad(rotY), math.rad(rotZ))
                nextGlitchCheckFrame[id] = t + math.random(0.04, 0.12)
            else
                multiGlitchCF[id] = CFrame.new()
                nextGlitchCheckFrame[id] = t + math.random(0.1, 0.4)
            end
        end
    end

    for i = 1, #IdleGroup do
        local offsetIdle = IdleGroup[i]
        local offsetW1 = WalkGroup1[i]
        local offsetW2 = WalkGroup2[i]
        
        if offsetIdle and offsetW1 and offsetW2 then
            local blendedWalkOffset = offsetW1:Lerp(offsetW2, currentWalkWeight)
            local finalOffset = offsetIdle:Lerp(blendedWalkOffset, movementBlend)
            local targetCF = finalPos * rotCF * finalOffset
            
            local breathY = math.sin(t * BREATH_SPEED + (i * 0.15)) * BREATH_HEIGHT
            targetCF = targetCF * CFrame.new(0, breathY, 0)
            
            if multiGlitchCF[i] then
                targetCF = targetCF * multiGlitchCF[i]
            end
            
            if (i == 2 or i == 3) and handGrabState[i].active then
                if targetTorso and not isPetState then
                    local pTarget = targetTorso.Position
                    local dirToTarget = (pTarget - handGrabState[i].currentPos).Unit
                    local moveStep = dirToTarget * (HAND_FLY_SPEED * dt)
                    
                    if moveStep.Magnitude > (pTarget - handGrabState[i].currentPos).Magnitude then
                        handGrabState[i].currentPos = pTarget
                    else
                        handGrabState[i].currentPos = handGrabState[i].currentPos + moveStep
                    end
                    
                    local handLookCF = CFrame.lookAt(handGrabState[i].currentPos, pTarget)
                    if handLookCF.X ~= handLookCF.X then handLookCF = CFrame.new(handGrabState[i].currentPos) end
                    
                    handGrabState[i].lastTrackedCF = handLookCF
                    currentCFrames[i] = handLookCF
                else
                    handGrabState[i].active = false
                end
            else
                if not currentCFrames[i] or snapNextFrame then
                    currentCFrames[i] = targetCF
                else
                    currentCFrames[i] = currentCFrames[i]:Lerp(targetCF, actualAlpha)
                end
            end
        end
    end

    if snapNextFrame then
        snapNextFrame = false -- Matikan trigger snap setelah frame pertama dilewati secara bersih
    end

    if t - lastGrabAttackTime >= 4.0 then
        handGrabState[2].active = false
        handGrabState[3].active = false
    end

    if handGrabState[2].active or handGrabState[3].active then
        statusLabel.Text = "WITHER GRAB: PROYEKSI AKTIF!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
    end

    -- [[ TRANSMISI REMOTES REPLICATOR NETCORE ]] --
    if t - lastNetworkUpdate > 0.014 then
        local canUpdateColor = (t - lastColorUpdate > 0.05)
        
        for i = 1, #IdleGroup do
            local prop = wingRemoteCache[i]
            local targetCFrame = currentCFrames[i]
            
            if prop and targetCFrame and targetCFrame.X == targetCFrame.X then
                task.spawn(function()
                    local cfR = prop:FindFirstChild("SetCurrentCFrame")
                    if cfR then pcall(function() cfR:InvokeServer(targetCFrame) end) end
                    
                    if canUpdateColor and i == colorIndex then
                        local crR = prop:FindFirstChild("ChangePropColor")
                        if crR then pcall(function() crR:InvokeServer(getTerrorColor(t, i)) end) end
                    end
                end)
            end
        end
        if canUpdateColor then
            colorIndex = (colorIndex % #IdleGroup) + 1
            lastColorUpdate = t
        end
        lastNetworkUpdate = t
    end
end)