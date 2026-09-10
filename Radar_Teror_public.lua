--deobfuscated by @Watup-Exploitz | discord.gg/EgbzrBqur2

-- [[ UNLOCKED VERSION: whitelist ถูกถอดออก - ใช้ได้ทุกคน ]] --

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

-- [[ ENTITY: RADAR TEROR (ANIMATED WALK ENGINE V5.9.8 - VERITY CODE: YELLOW EDITION) ]] --
-- Engine Core: DYTON_txt (Verity Minecraft Theme Revamp)
-- Josep Bart Core: Multi-Group CFrame Lerp Blending, Lock 1-15 Anti-Despawn, Continuous Pathing
-- Reconstruction Feature: Auto-Rebuild Prop Array on Re-Summon
-- Fixed Core: Absolute Tracking Continuity, Smooth Sinusoidal Walk-Weight Blending, Anti-Freeze State
-- New Adaption: Height Teleportation Adaptor V1.1 (Strict Anti-Fly & Direct Front Teleport)
-- Patch V5.9.8: Lock-In Eye Contact Matrix Target Alignment & Anti-Tengkurep Stabilizer (Fixed Mini Head Orientation)
-- Modification: Wither-Style Detachable Hand Grab Projectile System (INDEX 3 & 4 ADJUSTMENT)
-- Edits: Animatronic FNAF Idle Breathing & Micro-Glitch Mechanics (GLITCH UNLEASHED MULTI-FRAME EXTENSION)
-- Chameleon Patch: Raycast Ground-Color Adaptation Camouflage System by Josep Bart
-- VOID CORE: Automated Prop Seat Detection & Deep Void Banisher V1.0
-- OVERHAUL FIXED: LookAt Matrix Injection for Real-Time Continuous Front Rolling & Live 3D Placement

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local OwnerName = LP.Name
local petMode = false
local rampageMode = false 
local camoMode = false 
local verityMode = false -- [[ TRUE FORM / VERITY STATE ]]
local wingRemoteCache = {}
local PERMANENT_PROP_LOCK = {} 
local currentCFrames = {}
local lastNetworkUpdate = 0
local lastColorUpdate = 0
local lastValidationTime = 0
local colorIndex = 1

-- [[ STATE UNTUK LOCK POSISI SAAT SCRIPT SEOLAH-OLAH MATI ]] --
local engineActiveState = false 
local savedPositionsOnDisable = {}
local snapNextFrame = false 

-- [[ ENEMY CONTROL TRACKER ]] --
local witherCurrentPos = Vector3.zero 
local lastLookAtPos = Vector3.zero 
local isMovingState = false 

-- =============================================================================
-- [[ CONFIGURASI MANUAL RADAR TEROR - OPTIMASI BERBOBOT V5.9.8 ]] --
-- =============================================================================
local HEIGHT_IDLE_LOCK = 40        
local HEIGHT_WALK_LOCK = 25        
local HEIGHT_VERITY_LOCK = -2.5      -- Jarak mini nempel tanah
local currentRuntimeHeight = HEIGHT_VERITY_LOCK 

local CHASE_SPEED = 40             
local BASE_ANIM_SPEED = 0.47       
local LERP_ALPHA = 1.5             
local TIMER_TARGET_ALL = 15.0       

-- [[ NEW CONFIG: WITHER HAND GRAB PROJECTILE ]] --
local TARGET_AREA = 50             
local HAND_FLY_SPEED = 80          
local GRAB_COOLDOWN = 7            

-- [[ VOID BANISHER CORE CONFIGURATION ]] --
local VOID_TIME = 15               
local DEEP_VOID_Y = -9e9         

-- [[ KALIBRASI KEMIRINGAN JALAN / KEJAR ]] --
local WALK_OFFSET = 0              

-- [[ NEW MECHANISM CONFIG: HEIGHT READAPTIVE ]] --
local MAX_HEIGHT_THRESHOLD = 15    
local STR_FRONT_OFFSET = 8         

-- [[ CONFIG ADJUSTMENT & POSITION OFFSET ]] --
local PET_OFFSET = Vector3.new(0, 0, 12) -- Jarak radius detasemen aman world-space
local MANUAL_ROTATION = Vector3.new(-16, 180, 0) 
local AUTONOMOUS_BUFFER_RADIUS = 3.5     -- Memberi ruang mahluk hidup diam di tempat saat player shiftlock sekitaran
local MAX_VERTICAL_SPEED = 140            

-- [[ NEW CONFIG: ANIMATRONIC GLITCH & IDLE BREATHING ]] --
local BREATH_SPEED = 0.12          
local BREATH_HEIGHT = 0.12         
local GLITCH_CHANCE = 0.3         
local GLITCH_MAX_ROT = 1           

-- [[ RUNTIME SMOOTH TRANSITION VARIABLE V5.9.8 ]] --
local verityTransitionAlpha = 0    
local rollingRotationAngle = 0     
local actualRollingSpeed = 0       
local dynamicAnimTime = 0

local TargetPlayer = nil       
local lastTargetSwitchTime = 0

-- Interpolation Weight Tracker
local currentWalkWeight = 0  
local movementBlend = 0      

-- [[ MULTI-FRAME GLITCH RUNTIME TRACKER (1-15) ]] --
local multiGlitchCF = {}
local nextGlitchCheckFrame = {}
for i = 1, 15 do
    multiGlitchCF[i] = CFrame.new()
    nextGlitchCheckFrame[i] = 0
end

-- [[ HAND GRAB SYSTEM STATES - FIXED TO INDEX 3 & 4 ]] --
local handGrabState = {
    [3] = { active = false, currentPos = Vector3.zero, lastTrackedCF = CFrame.new(), voidTimer = 0, isBanishActive = false }, 
    [4] = { active = false, currentPos = Vector3.zero, lastTrackedCF = CFrame.new(), voidTimer = 0, isBanishActive = false }  
}
local lastGrabAttackTime = 0
-- =============================================================================

-- [[ PALET WARNA: DIUBAH MENJADI VERITY MINECRAFT STYLE (PURE YELLOW CORE) ]] --
local COLORS = {
    AbyssGreen = Color3.fromRGB(255, 210, 0),     -- Kuning Cerah Ikonik Verity
    DarkAbyss = Color3.fromRGB(65, 50, 5),        -- Coklat Tua Gelap/Kuning Redup Realistis Minecraft
    Void = Color3.fromRGB(255, 210, 0),             -- Hitam Kekuningan Sangat Gelap
    Accent = Color3.fromRGB(255, 235, 130),       -- Kuning Pastel Terang
    SuccessGreen = Color3.fromRGB(255, 190, 0),   -- Indikator Kuning Emas
    WarningRed = Color3.fromRGB(255, 60, 0),       -- Oranye Kemerahan Mistis
    CamoDefault = Color3.fromRGB(120, 110, 80)
}

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
        return COLORS.DarkAbyss 
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

local baseRef = CFrame.new(120.64956665039062, 47.43954086303711, -62.3380126953125, -0.9988315105438232, -0.021625487133860588, -0.04331721365451813, -0.009868338704109192, 0.966853678226471, -0.25513970851898193, 0.04739895835518837, -0.25441333651542664, -0.965937077999115)
local baseRefW1 = CFrame.new(126.49830627441406, 29.594470977783203, -92.46394348144531, -0.9998490810394287, 0.0025938472244888544, -0.017252106219530106, 0.007644623517990112, 0.9540321230888367, -0.29960694909095764, 0.015681922435760498, -0.2996933162212372, -0.9539082646369934)
local baseRefW2 = CFrame.new(126.49830627441406, 29.594470977783203, -92.46394348144531, -0.9998514652252197, 0.0025937585160136223, -0.017252152785658836, 0.0076445965096354485, 0.9540310502052307, -0.29961007833480835, 0.015681959688663483, -0.29969653487205505, -0.953910231590271)

local IdleGroup = {
    getOff(baseRef, CFrame.new(120.64956665039062, 47.43954086303711, -62.3380126953125, -0.9988315105438232, -0.021625487133860588, -0.04331721365451813, -0.009868338704109192, 0.966853678226471, -0.25513970851898193, 0.04739895835518837, -0.25441333651542664, -0.965937077999115)),
    getOff(baseRef, CFrame.new(120.68500518798828, 47.03154754638672, -61.574092864990234, 0.998996376991272, -0.012319700792431831, 0.04306390881538391, -0.000013122892596584279, 0.961350679397583, 0.27532726526260376, -0.044791460037231445, -0.27505069971084595, 0.9603856801986694)),
    getOff(baseRef, CFrame.new(126.67286682128906, 14.04328727722168, -61.09851837158203, 0.06900809705257416, -0.9681389331817627, 0.24072611331939697, 0.9976152181625366, 0.06756940484046936, -0.014233428984880447, -0.0024867714382708073, 0.24113479256629944, 0.9704886674880981)),
    getOff(baseRef, CFrame.new(113.5669937133789, 14.496644020080566, -59.124839782714844, 0.0712994933128357, 0.9913008213043213, 0.11064765602350235, -0.9941493272781372, 0.07964956760406494, -0.07295994460582733, -0.08113829046487808, -0.10479786992073059, 0.9911780953407288)),
    getOff(baseRef, CFrame.new(120.71379089355469, 44.3861198425293, -61.2296142578125, 0.98240727186203, 0, -0.18675090372562408, 0, 1, 0, 0.18675090372562408, 0, 0.9824063777923584)),
    getOff(baseRef, CFrame.new(120.046630859375, 29.903175354003906, -61.180877685546875, 0.06075763702392578, 0.11513201892375946, -0.991490364074707, 0.000028607435524463654, 0.9933252930641174, 0.11534685641527176, 0.9981545209884644, -0.007036857306957245, 0.06034940481185913)),
    getOff(baseRef, CFrame.new(120.78498077392578, 29.8851318359375, -61.23984909057617, 0.07702977955341339, -0.06877829879522324, -0.9946557879447937, -0.00002514259540475905, 0.9976166486740112, -0.06898494809865952, 0.9970309138298035, 0.0053390879184007645, 0.07684440165758133)),
    getOff(baseRef, CFrame.new(118.25951385498047, 44.634159088134766, -61.09712600708008, -0.05752766132354736, -0.19833369553089142, -0.9784463047981262, -0.06380493938922882, -0.9773316383361816, 0.20185993611812592, -0.9963029026985168, 0.07404212653636932, 0.0435698926448822)),
    getOff(baseRef, CFrame.new(123.21612548828125, 44.286563873291016, -61.45082473754883, -0.06820593774318695, 0.11992166936397552, -0.9904376864433289, -0.020711660385131836, -0.9927074909210205, -0.11876999586820602, -0.9974562525749207, 0.01241290383040905, 0.07019199430942535)),
    getOff(baseRef, CFrame.new(115.3191146850586, 30.09535026550293, -60.06383514404297, -0.8742965459823608, -0.12554612755775452, -0.46887898445129395, 0.08046010881662369, -0.9900954365730286, 0.11507555097341537, -0.47868093848228455, 0.06288398802280426, 0.8757346272468567)),
    getOff(baseRef, CFrame.new(124.9299545288086, 29.92043113708496, -61.196922302246094, 0.46473950147628784, 0.10953525453805923, -0.8786476254463196, 0.025647558271884918, -0.9935659170150757, -0.11029602587223053, -0.885076105594635, 0.028723787516355515, -0.46455949544906616)),
    getOff(baseRef, CFrame.new(121.61201477050781, 30.220687866210938, -61.414588928222656, 0.046316370368003845, 0.04518207162618637, 0.9979044795036316, 0.000010356996426708065, -0.9989765882492065, 0.045230135321617126, 0.9989268183708191, -0.002084625419229269, -0.04627080261707306)),
    getOff(baseRef, CFrame.new(119.42765808105469, 30.299821853637695, -61.33236312866211, 0.048100247979164124, -0.08080373704433441, 0.9955679774284363, -0.00011639761214610189, -0.9967212677001953, -0.08089178055524826, 0.9988400936126709, 0.0037748897448182106, -0.0479513444006443)),
    getOff(baseRef, CFrame.new(122.32905578613281, 0.4186230003833771, -60.64160919189453, -0.998123288154602, -0.005412478465586901, -0.06104670464992523, -0.0020048581063747406, 0.9984431266784668, -0.055743779987096786, 0.061253372579813004, -0.05551658570766449, -0.9965807199478149)),
    getOff(baseRef, CFrame.new(118.22999572753906, 15.556686401367188, -61.3809700012207, -0.9938544631004333, -0.07136587053537369, 0.08466947823762894, 0.07325080037117004, -0.9971297979354858, 0.019366269931197166, 0.08304401487112045, 0.025449300184845924, 0.9962209463119507))
}

local WalkGroup1 = {
    getOff(baseRefW1, CFrame.new(126.49830627441406, 29.594470977783203, -92.46394348144531, -0.9998490810394287, 0.0025938472244888544, -0.017252106219530106, 0.007644623517990112, 0.9540321230888367, -0.29960694909095764, 0.015681922435760498, -0.2996933162212372, -0.9539082646369934)),
    getOff(baseRefW1, CFrame.new(126.49246215820312, 29.275135040283203, -91.71905517578125, -0.022311288863420486, 0.017802033573389053, 0.9995925426483154, -0.3070925176143646, 0.9513811469078064, -0.023798085749149323, -0.9514171481132507, -0.30749836564064026, -0.01576201245188713)),
    getOff(baseRefW1, CFrame.new(131.03775024414062, 2.031785726547241, -103.8714828491211, -0.9985194206237793, -0.042536213994026184, -0.034046731889247894, -0.02315164916217327, -0.23442454636096954, 0.9718611240386963, -0.0493205189704895, 0.9712064862251282, 0.23308655619621277)),
    getOff(baseRefW1, CFrame.new(119.06922912597656, 0.18550749123096466, -86.95842742919922, 0.09176713228225708, 0.6149283051490784, -0.783225953578949, -0.9936701655387878, 0.0053681377321481705, -0.11220884323120117, -0.0647953450679779, 0.7885667681694031, 0.6115278005599976)),
    getOff(baseRefW1, CFrame.new(126.38916015625, 27.61347007751465, -90.03245544433594, 0.9956316351890564, 0.05551417917013168, -0.07507216185331345, 0.007379494607448578, 0.7547398805618286, 0.6559826731681824, 0.09307663142681122, -0.6536710858345032, 0.7510332465171814)),
    getOff(baseRefW1, CFrame.new(125.73442077636719, 22.751529693603516, -76.30439758300781, -0.9916914105415344, 0.10410591959953308, 0.07555291056632996, -0.036597251892089844, 0.3347315490245819, -0.9416024088859558, -0.12331625074148178, -0.9365449547767639, -0.3281416594982147)),
    getOff(baseRefW1, CFrame.new(125.51589965820312, 22.73541259765625, -76.28203582763672, -0.99981689453125, -0.012845861725509167, 0.014273214153945446, -0.017732663080096245, 0.3324262797832489, -0.9429624676704407, 0.00736838446045599, -0.9430423378944397, -0.33259326219558716)),
    getOff(baseRefW1, CFrame.new(124.04273986816406, 28.202518463134766, -90.11971282958984, 0.9430281519889832, -0.32027125358581543, -0.09013251960277557, -0.33133769035339355, -0.8794008493423462, -0.34186235070228577, 0.030226171016693115, 0.3522501289844513, -0.935416579246521)),
    getOff(baseRefW1, CFrame.new(128.30386352539062, 28.102333068847656, -89.46344757080078, 0.9608992338180542, 0.208899587392807, -0.1817515790462494, 0.25180667638778687, -0.932266116142273, 0.25975263118743896, -0.11517826467752457, -0.29536134004592896, -0.9484161138534546)),
    getOff(baseRefW1, CFrame.new(119.2117919921875, 15.249920845031738, -84.94314575195312, 0.9943095445632935, 0.017796030268073082, -0.10503261536359787, 0.028687644749879837, -0.994256854057312, 0.10311679542064667, -0.10259410738945007, -0.10554315149784088, -0.9891075491905212)),
    getOff(baseRefW1, CFrame.new(131.2987060546875, 14.502906799316406, -93.74832153320312, 0.9973878860473633, -0.027913875877857208, -0.06662031263113022, 0.020270831882953644, -0.7770786881446838, 0.629075825214386, -0.06932926923036575, -0.6287821531295776, -0.7744839191436768)),
    getOff(baseRefW1, CFrame.new(127.072998046875, 23.333717346191406, -76.7569351196289, 0.9817987680435181, 0.18005992472171783, 0.060408201068639755, 0.18935826420783997, -0.952558159828186, -0.23829339444637299, 0.01463509351015091, 0.24539482593536377, -0.9693166017532349)),
    getOff(baseRefW1, CFrame.new(124.34113311767578, 23.690364837646484, -76.7562255859375, 0.9857381582260132, -0.08913993835449219, 0.14273914694786072, -0.1324753761291504, -0.9341053366661072, 0.33151546120643616, 0.10378171503543854, -0.34569698572158813, -0.9325920939445496)),
    getOff(baseRefW1, CFrame.new(128.67425537109375, -1.330122470855713, -63.095497131347656, 0.995278537273407, 0.07170845568180084, -0.0654103010892868, -0.00692090904340148, 0.724632978439331, 0.6890980005264282, 0.09681262075901031, -0.6853917837142944, 0.7217090129852295)),
    getOff(baseRefW1, CFrame.new(122.96495819091797, 9.598209381103516, -82.35009002685547, 0.997429370880127, -0.052172236144542694, -0.0491195023059845, -0.07160086929798126, -0.6986374855041504, -0.7118854522705078, 0.0028239600360393524, 0.7135725021362305, -0.700575053691864))
}

local WalkGroup2 = {
    getOff(baseRefW2, CFrame.new(126.49830627441406, 29.594470977783203, -92.46394348144531, -0.9998514652252197, 0.0025937585160136223, -0.017252152785658836, 0.0076445965096354485, 0.9540310502052307, -0.29961007833480835, 0.015681959688663483, -0.29969653487205505, -0.953910231590271)),
    getOff(baseRefW2, CFrame.new(126.53009033203125, 29.275135040283203, -91.70267486572266, -0.022311203181743622, 0.017802052199840546, 0.9995925426483154, -0.30709248781204224, 0.9513811087303161, -0.02379809319972992, -0.951417088508606, -0.30749833583831787, -0.015762098133563995)),
    getOff(baseRefW2, CFrame.new(132.22059631347656, 1.995898962020874, -90.79121398925781, -0.9985146522521973, -0.042534489184617996, -0.034049078822135925, -0.023148924112319946, -0.23452624678611755, 0.9718342423439026, -0.0493217371404171, 0.9711807370185852, 0.2331928014755249)),
    getOff(baseRefW2, CFrame.new(119.32237243652344, 1.8937989473342896, -103.31941986083984, 0.11586364358663559, 0.10886246711015701, -0.987281322479248, -0.9897393584251404, -0.07102220505475998, -0.1239846795797348, -0.08361426740884781, 0.9915185570716858, 0.09951663762331009)),
    getOff(baseRefW2, CFrame.new(126.38916015625, 27.61347007751465, -90.03245544433594, 0.9956316351890564, 0.055514223873615265, -0.07507220655679703, 0.007379494607448578, 0.7547398805618286, 0.6559826731681824, 0.09307654201984406, -0.6536710858345032, 0.7510332465171814)),
    getOff(baseRefW2, CFrame.new(125.73442077636719, 22.751529693603516, -76.30439758300781, -0.9916908740997314, 0.10410591959953308, 0.07555291056632996, -0.036597251892089844, 0.3347312808036804, -0.9416024088859558, -0.12331618368625641, -0.9365449547767639, -0.3281419277191162)),
    getOff(baseRefW2, CFrame.new(125.51589965820312, 22.73541259765625, -76.28203582763672, -0.9998155832290649, -0.01284581795334816, 0.014273129403591156, -0.017732571810483932, 0.3324250876903534, -0.9429630041122437, 0.0073683844947947025, -0.9430422186851501, -0.33259156346321106)),
    getOff(baseRefW2, CFrame.new(124.04273986816406, 28.202518463134766, -90.11971282958984, 0.9430636763572693, -0.3022449314594269, 0.13885022699832916, -0.3312376141548157, -0.8913412094116211, 0.3095170557498932, 0.030212700366973877, -0.3378865718841553, -0.9407062530517578)),
    getOff(baseRefW2, CFrame.new(128.30386352539062, 28.102333068847656, -89.46344757080078, 0.9609078168869019, 0.2764838933944702, 0.014569987542927265, 0.25177404284477234, -0.8507171869277954, -0.4613998234272003, -0.11517467349767685, 0.44703131914138794, -0.8870722651481628)),
    getOff(baseRefW2, CFrame.new(119.67819213867188, 15.331889152526855, -94.51163482666016, 0.9943045973777771, -0.03331932798027992, -0.1012267917394638, 0.028701134026050568, -0.831045925617218, 0.5554617643356323, -0.10263171046972275, -0.5552045702934265, -0.8253591060638428)),
    getOff(baseRefW2, CFrame.new(132.52810668945312, 15.628028869628906, -82.0294418334961, 0.9973894953727722, -0.021877866238355637, -0.0688156932592392, 0.020227424800395966, -0.8301950693130493, 0.5571044087409973, -0.06931855529546738, -0.557045042514801, -0.8275853395462036)),
    getOff(baseRefW2, CFrame.new(127.072998046875, 23.333717346191406, -76.7569351196289, 0.9818053841590881, 0.18467366695404053, -0.04420299455523491, 0.18932312726974487, -0.9340088367462158, 0.3029642403125763, 0.014663513749837875, -0.3058205544948578, -0.9519778490066528)),
    getOff(baseRefW2, CFrame.new(124.34113311767578, 23.690364837646484, -76.7562255859375, 0.9857377409934998, -0.15272948145866394, 0.07067477703094482, -0.13246934115886688, -0.9632024765014648, -0.23387481272220612, 0.10379339009523392, 0.22117699682712555, -0.9696969985961914)),
    getOff(baseRefW2, CFrame.new(128.68243408203125, -1.3301281929016113, -70.8410873413086, 0.995278537273407, 0.07170845568180084, -0.0654103010892868, -0.00692090904340148, 0.7246330380439758, 0.689098060131073, 0.09681262820959091, -0.6853918433189392, 0.7217090129852295)),
    getOff(baseRefW2, CFrame.new(122.27103424072266, 9.802433013916016, -74.06238555908203, 0.997429370880127, -0.05217228829860687, -0.0491195023059845, -0.07160086929798126, -0.6986383199691772, -0.7118854522705078, 0.002823973074555397, 0.7135725021362305, -0.7005746364593506))
}

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

-- =============================================================================
-- [[ INTERFACE GUI REVAMP: VERITY MINECRAFT STYLE (YELLOW-DARK STYLESHEET) ]] --
-- =============================================================================
local sg = Instance.new("ScreenGui", CoreGui)
sg.Name = "Radar_Terror_Control"
local main = Instance.new("Frame", sg)
main.Size, main.Position = UDim2.new(0, 180, 0, 230), UDim2.new(0.05, 0, 0.4, 0)
main.BackgroundColor3, main.BorderSizePixel = Color3.fromRGB(35, 30, 5), 0  -- Dark Yellowish Brown

local titleBar = Instance.new("Frame", main)
titleBar.Size, titleBar.BackgroundColor3 = UDim2.new(1, 0, 0, 25), Color3.fromRGB(70, 55, 5) -- Verity Dark Gold Core
titleBar.BorderSizePixel = 0

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size, titleLabel.Position = UDim2.new(1, -10, 1, 0), UDim2.new(0, 5, 0, 0)
titleLabel.BackgroundTransparency, titleLabel.Text = 1, "VERITY RADAR ENGINE V5.9.8"
titleLabel.TextColor3, titleLabel.Font, titleLabel.TextSize = Color3.fromRGB(255, 230, 100), Enum.Font.SourceSansBold, 12
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local statusLabel = Instance.new("TextLabel", main)
statusLabel.Size, statusLabel.Position = UDim2.new(1, -10, 0, 15), UDim2.new(0, 5, 1, -30)
statusLabel.BackgroundTransparency, statusLabel.Text = 1, "STATUS: STANDBY"
statusLabel.TextColor3, statusLabel.Font, statusLabel.TextSize = COLORS.AbyssGreen, Enum.Font.Code, 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

local creditLabel = Instance.new("TextLabel", main)
creditLabel.Size, creditLabel.Position = UDim2.new(1, 0, 0, 15), UDim2.new(0, 0, 1, -15)
creditLabel.BackgroundTransparency, creditLabel.Text = 1, "Partner Dyton - Josep Bart Core"
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
    b.BackgroundColor3, b.BorderSizePixel, b.BorderColor3 = Color3.fromRGB(15, 12, 3), 1, Color3.fromRGB(130, 100, 10)
    b.TextColor3, b.Font, b.TextSize = Color3.fromRGB(255, 230, 130), Enum.Font.SourceSansBold, 11
end

local SummonBtn = Instance.new("TextButton", container)
SummonBtn.Text, SummonBtn.Position, SummonBtn.Size = "SUMMON VERITY ENGINE", UDim2.new(0,0,0,0), UDim2.new(1,0,0.18,0) styleBtn(SummonBtn)

local TargetBox = Instance.new("TextBox", container)
TargetBox.Size, TargetBox.Position = UDim2.new(1, 0, 0.16, 0), UDim2.new(0, 0, 0.20, 0)
TargetBox.BackgroundColor3, TargetBox.BorderColor3, TargetBox.TextColor3 = Color3.fromRGB(20, 15, 2), Color3.fromRGB(120, 95, 10), Color3.fromRGB(255, 240, 180)
TargetBox.PlaceholderText, TargetBox.Font, TargetBox.TextSize, TargetBox.ClearTextOnFocus = "Lock Target Individual", Enum.Font.Code, 10, false

local RampageBtn = Instance.new("TextButton", container)
RampageBtn.Text, RampageBtn.Position, RampageBtn.Size = "TARGET ALL: OFF", UDim2.new(0, 0, 0.38, 0), UDim2.new(1, 0, 0.18, 0) styleBtn(RampageBtn)

local CampBtn = Instance.new("TextButton", container)
CampBtn.Text, CampBtn.Position, CampBtn.Size = "CAMOUFLAGE: OFF", UDim2.new(0, 0, 0.58, 0), UDim2.new(1, 0, 0.18, 0) styleBtn(CampBtn)

local TransformBtn = Instance.new("TextButton", container)
TransformBtn.Text, TransformBtn.Position, TransformBtn.Size = "FORM: GOOD MODE (HEAD)", UDim2.new(0, 0, 0.78, 0), UDim2.new(1, 0, 0.18, 0) styleBtn(TransformBtn)

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
        snapNextFrame = true 
        SummonBtn.Text = "DISMISS VERITY ENGINE"
        SummonBtn.TextColor3 = COLORS.AbyssGreen
        
        local char = LP.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local ownerRoot = char.HumanoidRootPart
            witherCurrentPos = ownerRoot.Position + Vector3.new(0, HEIGHT_VERITY_LOCK, -PET_OFFSET.Z)
            lastLookAtPos = ownerRoot.Position
        end
        ValidateAndLockProps()
        table.clear(savedPositionsOnDisable) 
    else
        SummonBtn.Text = "SUMMON VERITY ENGINE"
        SummonBtn.TextColor3 = Color3.fromRGB(255, 230, 130)
        
        table.clear(savedPositionsOnDisable)
        table.clear(currentCFrames)
        
        rampageMode = false
        camoMode = false
        verityMode = false
        CampBtn.Text = "CAMOUFLAGE: OFF"
        CampBtn.TextColor3 = Color3.fromRGB(255, 230, 130)
        TransformBtn.Text = "FORM: GOOD MODE (HEAD)"
        TransformBtn.TextColor3 = Color3.fromRGB(255, 230, 130)
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
            CampBtn.Text = "CAMOUFLAGE: OFF"
            CampBtn.TextColor3 = Color3.fromRGB(255, 230, 130)
        end
    else
        RampageBtn.Text = "TARGET ALL: OFF"
        TargetPlayer = nil
        TargetBox.Text = ""
    end
end)

CampBtn.MouseButton1Click:Connect(function()
    if not engineActiveState then return end
    camoMode = not camoMode
    if camoMode then
        CampBtn.Text = "CAMOUFLAGE: ACTIVE"
        CampBtn.TextColor3 = COLORS.AbyssGreen
        if rampageMode then
            rampageMode = false
            RampageBtn.Text = "TARGET ALL: OFF"
            TargetPlayer = nil
            TargetBox.Text = ""
        end
    else
        CampBtn.Text = "CAMOUFLAGE: OFF"
        CampBtn.TextColor3 = Color3.fromRGB(255, 230, 130)
    end
end)

TransformBtn.MouseButton1Click:Connect(function()
    if not engineActiveState then return end
    verityMode = not verityMode
    if verityMode then
        TransformBtn.Text = "FORM: TRUE VERITY"
        TransformBtn.TextColor3 = COLORS.WarningRed
    else
        TransformBtn.Text = "FORM: GOOD MODE (HEAD)"
        TransformBtn.TextColor3 = Color3.fromRGB(255, 230, 130)
    end
end)

local function getTargetTorso(player)
    if not player or not player.Character or not player.Character.Parent then return nil end
    local hum = player.Character:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return nil end
    return player.Character:FindFirstChild("HumanoidRootPart") or player.Character:FindFirstChild("Torso")
end

RS.Heartbeat:Connect(function(dt)
    if not petMode then return end 

    local t = tick()
    
    if t - lastValidationTime > 0.8 then 
        ValidateAndLockProps()
        lastValidationTime = t
    end

    if not engineActiveState then
        statusLabel.Text = "STATUS: SHUTDOWN (POSITION LOCK)"
        statusLabel.TextColor3 = COLORS.WarningRed
        
        if t - lastNetworkUpdate > 0.014 then
            local canUpdateColor = (t - lastColorUpdate > 0.05)
            
            for i = 1, #IdleGroup do
                local prop = wingRemoteCache[i]
                if prop and prop.Parent then
                    local currentObjectCF = prop.CFrame
                    
                    task.spawn(function()
                        local cfR = prop:FindFirstChild("SetCurrentCFrame")
                        if cfR then pcall(function() cfR:InvokeServer(currentObjectCF) end) end
                        
                        if canUpdateColor and i == colorIndex then
                            local crR = prop:FindFirstChild("ChangePropColor")
                            if crR then pcall(function() cfR:InvokeServer(getTerrorColor(t, i)) end) end
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

    if rampageMode then
        local currentTargetTorso = getTargetTorso(TargetPlayer)
        if not TargetPlayer or not currentTargetTorso or (t - lastTargetSwitchTime >= TIMER_TARGET_ALL) then
            TargetPlayer = FindNearestPrey()
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
    
    verityTransitionAlpha = verityTransitionAlpha + ((verityMode and 1 or 0) - verityTransitionAlpha) * math.clamp(dt * 4, 0, 1)

    -- [[ MATRIKS TINGGI VERITY SEPARATION ]] --
    local desiredHeightTarget = HEIGHT_VERITY_LOCK 
    if verityMode then
        if isMovingState then
            desiredHeightTarget = HEIGHT_WALK_LOCK 
        else
            desiredHeightTarget = HEIGHT_IDLE_LOCK 
        end
    end
    currentRuntimeHeight = currentRuntimeHeight + (desiredHeightTarget - currentRuntimeHeight) * math.clamp(dt * 6, 0, 1)
    
    local oldPos = witherCurrentPos
    local realGroundVelocity = 0

    if targetTorso then
        local idealPos
        local targetHeight = targetTorso.Position.Y + currentRuntimeHeight

        local currentHeightDelta = math.abs(witherCurrentPos.Y - targetHeight)
        if currentHeightDelta > MAX_HEIGHT_THRESHOLD then
            local targetLookVector = targetTorso.CFrame.LookVector
            local frontFlatVector = Vector3.new(targetLookVector.X, 0, targetLookVector.Z).Unit
            if frontFlatVector.Magnitude ~= frontFlatVector.Magnitude then frontFlatVector = Vector3.new(0, 0, -1) end
            
            local teleportBase = targetTorso.Position + (frontFlatVector * STR_FRONT_OFFSET)
            witherCurrentPos = Vector3.new(teleportBase.X, targetHeight, teleportBase.Z)
        end

        -- [[ RE-ENGINEERED 3D AUTONOMOUS WORLD-SPACE (DYNAMIC HARMONY FOR OWNER & TARGET) ]] --
        local currentDistanceToTarget = (Vector3.new(targetTorso.Position.X, 0, targetTorso.Position.Z) - Vector3.new(witherCurrentPos.X, 0, witherCurrentPos.Z)).Magnitude
        
        if currentDistanceToTarget > (PET_OFFSET.Z + AUTONOMOUS_BUFFER_RADIUS) then
            local headingDir = (witherCurrentPos - targetTorso.Position).Unit
            local flatHeading = Vector3.new(headingDir.X, 0, headingDir.Z).Unit
            if flatHeading.Magnitude ~= flatHeading.Magnitude then flatHeading = targetTorso.CFrame.LookVector end
            
            local worldTargetPoint = targetTorso.Position + (flatHeading * PET_OFFSET.Z)
            idealPos = Vector3.new(worldTargetPoint.X, targetHeight, worldTargetPoint.Z)
        else
            idealPos = Vector3.new(witherCurrentPos.X, targetHeight, witherCurrentPos.Z)
        end
        
        -- [[ STRICT LOCK-IN LOOKAT: Selalu mengunci pandangan ke arah pusat target/owner ]] --
        lastLookAtPos = targetTorso.Position
        
        local distanceToIdeal = (Vector3.new(idealPos.X, 0, idealPos.Z) - Vector3.new(witherCurrentPos.X, 0, witherCurrentPos.Z)).Magnitude
        
        local shouldMove = false
        if distanceToIdeal > 0.1 then
            shouldMove = true
        end

        if shouldMove then
            local moveDirection = (idealPos - witherCurrentPos).Unit
            local step = moveDirection * (CHASE_SPEED * dt)
            
            if step.Magnitude > (idealPos - witherCurrentPos).Magnitude then
                witherCurrentPos = idealPos
            else
                witherCurrentPos = witherCurrentPos + step
            end
            
            if isPetState then
                statusLabel.Text = camoMode and "CAMO: STALKING OWNER" or "VERITY MINI: JALAN INDEPENDEN 3D"
                statusLabel.TextColor3 = COLORS.AbyssGreen
            else
                statusLabel.Text = camoMode and "CAMO: HUNTING MUSUH" or "STALKING MUSUH (DYNAMIC HARMONY)"
                statusLabel.TextColor3 = COLORS.WarningRed
            end
        else
            if isPetState then
                statusLabel.Text = camoMode and "CAMO: IDLE" or "VERITY MINI: LOCK IN EYE CONTACT"
                statusLabel.TextColor3 = COLORS.AbyssGreen
            else
                statusLabel.Text = camoMode and "CAMO: IDLE" or "STALKING: LOCK IN MEMANDANG TARGET"
                statusLabel.TextColor3 = COLORS.WarningRed
            end
        end
        
        local currentY = witherCurrentPos.Y
        local deltaY = targetHeight - currentY
        local maxVerticalStep = MAX_VERTICAL_SPEED * dt
        local finalY = currentY + math.clamp(deltaY, -maxVerticalStep, maxVerticalStep)
        
        witherCurrentPos = Vector3.new(witherCurrentPos.X, finalY, witherCurrentPos.Z)

        local groundDelta = Vector3.new(witherCurrentPos.X - oldPos.X, 0, witherCurrentPos.Z - oldPos.Z).Magnitude
        realGroundVelocity = groundDelta / dt

        -- [[ INJEKSI MATRIKS INERSIA GULINGAN SMOOTH ]] --
        if realGroundVelocity > 0.5 then
            isMovingState = true
            dynamicAnimTime = dynamicAnimTime + (dt * realGroundVelocity * BASE_ANIM_SPEED)
            actualRollingSpeed = actualRollingSpeed + ((-realGroundVelocity * dt * 3.5) - actualRollingSpeed) * math.clamp(dt * 12, 0, 1)
        else
            isMovingState = false
            dynamicAnimTime = dynamicAnimTime + (0 - (dynamicAnimTime % (math.pi * 2))) * math.clamp(dt * 4, 0, 1)
            actualRollingSpeed = actualRollingSpeed * math.clamp(1 - (dt * 4.5), 0, 1)
        end
        rollingRotationAngle = rollingRotationAngle + actualRollingSpeed
    else
        isMovingState = false
    end

    if not isPetState and targetTorso and verityMode then 
        local distanceToTarget = (witherCurrentPos - targetTorso.Position).Magnitude
        
        if distanceToTarget <= TARGET_AREA and (t - lastGrabAttackTime >= GRAB_COOLDOWN) then
            if not handGrabState[3].active and not handGrabState[4].active then
                lastGrabAttackTime = t
                for _, armId in ipairs({3, 4}) do
                    if currentCFrames[armId] then
                        handGrabState[armId].active = true
                        handGrabState[armId].currentPos = currentCFrames[armId].Position
                        handGrabState[armId].lastTrackedCF = currentCFrames[armId]
                        handGrabState[armId].voidTimer = 0
                        handGrabState[armId].isBanishActive = false
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
        movementBlend = math.min(movementBlend + (dt * 4.0), 1) 
    else
        movementBlend = math.max(movementBlend - (dt * 2.0), 0) 
    end

    local actualAlpha = math.clamp(LERP_ALPHA * dt * 60, 0, 1)
    if snapNextFrame then actualAlpha = 1 end

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
            
            local targetCF = finalPos * rotCF
            
            if verityMode then
                targetCF = targetCF * finalOffset
            else
                -- MINI STATE LOGIC (PROP 1 & 2 DENGAN IMPLEMENTASI LOCK EYE CONTACT ANTI-TENGKUREP)
                if i == 1 or i == 2 then
                    local headPos = finalPos.Position
                    
                    -- [[ REAL-TIME DYNAMIC LOCK-IN EYE CONTACT (DIAM / JALAN) ]] --
                    -- Memaksa basis CFrame selalu lurus memandang koordinat X-Z player tanpa rotasi pitch/roll dasar yang miring berantakan
                    local lookDirection = (lastLookAtPos - headPos)
                    local flatLookDirection = Vector3.new(lookDirection.X, 0, lookDirection.Z).Unit
                    if flatLookDirection.Magnitude ~= flatLookDirection.Magnitude then flatLookDirection = Vector3.new(0,0,-1) end
                    
                    local lookTargetCFrame = CFrame.lookAt(headPos, headPos + flatLookDirection)
                    
                    -- SUNTIKAN STRUKTUR LOOKAT, AMANKAN ROTASI TETAP TEGAK MENATAP (YAW ONLY LOCK)
                    targetCF = lookTargetCFrame 
                             * CFrame.Angles(rollingRotationAngle, math.rad(180), 0) 
                             * finalOffset
                else
                    -- Buang sisa prop ke void terdalam
                    targetCF = CFrame.new(witherCurrentPos.X, DEEP_VOID_Y, witherCurrentPos.Z)
                end
            end
            
            local breathY = math.sin(t * BREATH_SPEED + (i * 0.15)) * BREATH_HEIGHT
            targetCF = targetCF * CFrame.new(0, breathY, 0)
            
            if multiGlitchCF[i] then targetCF = targetCF * multiGlitchCF[i] end

            -- Detachable Hand Projectile Handler (Index 3 & 4)
            if (i == 3 or i == 4) and handGrabState[i].active and verityMode then
                if targetTorso and not isPetState then
                    local pTarget = targetTorso.Position
                    local targetChar = targetTorso.Parent
                    local currentSeat = targetChar and targetChar:FindFirstChildOfClass("Humanoid") and targetChar:FindFirstChildOfClass("Humanoid").SeatPart
                    
                    if currentSeat and (currentSeat:IsA("Seat") or currentSeat:IsA("VehicleSeat")) then
                        handGrabState[i].isBanishActive = true
                    end
                    
                    if handGrabState[i].isBanishActive then
                        handGrabState[i].voidTimer = handGrabState[i].voidTimer + dt
                        local voidCF = CFrame.new(pTarget.X, DEEP_VOID_Y, pTarget.Z)
                        handGrabState[i].currentPos = voidCF.Position
                        currentCFrames[i] = voidCF
                        
                        if currentSeat then
                            task.spawn(function() pcall(function() currentSeat.CFrame = voidCF end) end)
                        elseif targetTorso then
                            task.spawn(function() pcall(function() targetTorso.CFrame = voidCF end) end)
                        end
                        
                        if handGrabState[i].voidTimer >= VOID_TIME then
                            handGrabState[i].active = false
                            handGrabState[i].isBanishActive = false
                        end
                    else
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
                    end
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

    if snapNextFrame then snapNextFrame = false end

    if t - lastGrabAttackTime >= 4.0 and not (handGrabState[3].isBanishActive or handGrabState[4].isBanishActive) then
        handGrabState[3].active = false
        handGrabState[4].active = false
    end

    if handGrabState[3].isBanishActive or handGrabState[4].isBanishActive then
        statusLabel.Text = "VOID CORE: TARGET BANISHED TO VOID!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
    elseif handGrabState[3].active or handGrabState[4].active then
        statusLabel.Text = "WITHER GRAB: PROYEKSI AKTIF!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 170, 0)
    end

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