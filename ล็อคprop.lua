-- ART ANYTHING PROP Bug Fix
-- By: ShinraLiox

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

local propCache = {}
local capturedOffsets = {}
local formationCaptured = false
local followActive = false
local frameCount = 0

-- ============================================================
-- Helpers Nya
-- ============================================================
local function getPropCFrame(prop)
local ok, cf = pcall(function()
if prop:IsA("BasePart") then
return prop.CFrame
elseif prop:IsA("Model") then
return prop:GetPivot()
else
return prop.CFrame
end
end)
if ok then return cf end
return nil
end

local function scanProps()
propCache = {}
local ok,wc = pcall(function()
return workspace:WaitForChild("WorkspaceCom",3):WaitForChild("001_TrafficCones",3)
end)
if ok and wc then
for _,v in ipairs(wc:GetChildren()) do
if v.Name:find("Prop") and v.Name:find(LP.Name) then
table.insert(propCache, v)
end
end
else
local function search(p,d)
if d>5 then return end
for _,c in ipairs(p:GetChildren()) do
if c.Name:find(LP.Name) and c:FindFirstChild("SetCurrentCFrame") then
local dup=false
for _,x in ipairs(propCache) do if x==c then dup=true break end end
if not dup then table.insert(propCache,c) end
end
search(c,d+1)
end
end
search(workspace,0)
end
return #propCache
end

-- ============================================================
-- Nih Gui
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ArtAnythingProp"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
local okp = pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not okp then ScreenGui.Parent = LP.PlayerGui end

local MW,MH = 330,84
local MF = Instance.new("Frame")
MF.Size = UDim2.new(0,MW,0,MH)
MF.Position = UDim2.new(0.5,-MW/2,0.08,0)
MF.BackgroundColor3 = Color3.fromRGB(10,10,11)
MF.BorderSizePixel = 0
MF.Active = true; MF.Draggable = true
MF.Parent = ScreenGui
Instance.new("UICorner",MF).CornerRadius = UDim.new(0,14)
local mS = Instance.new("UIStroke",MF)
mS.Color = Color3.fromRGB(150,150,158); mS.Thickness = 1.6
mS.Transparency = 0.1

Instance.new("UIGradient",MF).Color = ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(26,26,28)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(12,12,13)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(4,4,4))
}

-- Shine sweep
local ShineCon = Instance.new("Frame",MF)
ShineCon.Size = UDim2.new(1,0,1,0); ShineCon.BackgroundTransparency=1
ShineCon.ClipsDescendants = true
Instance.new("UICorner",ShineCon).CornerRadius = UDim.new(0,14)
local Shine = Instance.new("Frame",ShineCon)
Shine.Size = UDim2.new(0.1,0,1,0); Shine.Position = UDim2.new(-0.12,0,0,0)
Shine.BackgroundColor3 = Color3.fromRGB(255,255,255); Shine.BorderSizePixel=0
Shine.BackgroundTransparency = 0.78
local ShG = Instance.new("UIGradient",Shine)
ShG.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(1,1)
})
task.spawn(function()
while ScreenGui.Parent do
Shine.Position = UDim2.new(-0.12,0,0,0)
local tw = TS:Create(Shine,TweenInfo.new(2.4,Enum.EasingStyle.Linear),{Position=UDim2.new(1.12,0,0,0)})
tw:Play(); tw.Completed:Wait(); task.wait(4)
end
end)

-- Badge icon
local Badge = Instance.new("Frame",MF)
Badge.Size = UDim2.new(0,48,0,48)
Badge.Position = UDim2.new(0,12,0,10)
Badge.BackgroundColor3 = Color3.fromRGB(22,22,24)
Instance.new("UICorner",Badge).CornerRadius = UDim.new(0,10)
local bS = Instance.new("UIStroke",Badge)
bS.Color = Color3.fromRGB(160,160,168); bS.Thickness=1.2

local BadgeIcon = Instance.new("TextLabel",Badge)
BadgeIcon.Size = UDim2.new(1,0,1,0)
BadgeIcon.Text = "✦"
BadgeIcon.Font = Enum.Font.GothamBold
BadgeIcon.TextColor3 = Color3.fromRGB(210,210,216)
BadgeIcon.TextSize = 24
BadgeIcon.BackgroundTransparency = 1

local TitleL = Instance.new("TextLabel",MF)
TitleL.Text = "ART ANYTHING PROP LX"
TitleL.Position = UDim2.new(0,70,0,10)
TitleL.Size = UDim2.new(1,-130,0,22)
TitleL.Font = Enum.Font.GothamBold
TitleL.TextColor3 = Color3.fromRGB(235,235,238)
TitleL.TextSize = 15
TitleL.BackgroundTransparency = 1
TitleL.TextXAlignment = Enum.TextXAlignment.Left

local SubL = Instance.new("TextLabel",MF)
SubL.Text = "By ShinraLiox --  TIKTOK king_allgame"
SubL.Position = UDim2.new(0,71,0,32)
SubL.Size = UDim2.new(1,-130,0,16)
SubL.Font = Enum.Font.Gotham
SubL.TextColor3 = Color3.fromRGB(140,140,148)
SubL.TextSize = 10
SubL.BackgroundTransparency = 1
SubL.TextXAlignment = Enum.TextXAlignment.Left

local TogBtn = Instance.new("TextButton",MF)
TogBtn.Size = UDim2.new(0,44,0,38)
TogBtn.Position = UDim2.new(1,-54,0,10)
TogBtn.BackgroundColor3 = Color3.fromRGB(20,20,22)
TogBtn.Text = "▲"
TogBtn.TextColor3 = Color3.fromRGB(200,200,206)
TogBtn.TextSize = 16
TogBtn.Font = Enum.Font.GothamBold
TogBtn.BorderSizePixel = 0
Instance.new("UICorner",TogBtn).CornerRadius = UDim.new(0,9)
Instance.new("UIStroke",TogBtn).Color = Color3.fromRGB(150,150,158)

local DividerLine = Instance.new("Frame",MF)
DividerLine.Size = UDim2.new(1,-24,0,1)
DividerLine.Position = UDim2.new(0,12,0,54)
DividerLine.BackgroundColor3 = Color3.fromRGB(70,70,75)
DividerLine.BorderSizePixel = 0

local FBox = Instance.new("Frame",MF)
FBox.BackgroundColor3 = Color3.fromRGB(8,8,9)
FBox.Position = UDim2.new(0,0,1.04,0)
FBox.Size = UDim2.new(1,0,0,330)
FBox.BorderSizePixel = 0
Instance.new("UICorner",FBox).CornerRadius = UDim.new(0,14)
local fbS = Instance.new("UIStroke",FBox)
fbS.Color = Color3.fromRGB(120,120,128); fbS.Thickness = 1.2

local Scroll = Instance.new("ScrollingFrame",FBox)
Scroll.Size = UDim2.new(1,-8,1,-8); Scroll.Position = UDim2.new(0,4,0,4)
Scroll.BackgroundTransparency = 1; Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3; Scroll.ScrollBarImageColor3 = Color3.fromRGB(150,150,158)
Scroll.CanvasSize = UDim2.new(0,0,0,0)

local UL = Instance.new("UIListLayout",Scroll)
UL.Padding = UDim.new(0,5); UL.HorizontalAlignment = Enum.HorizontalAlignment.Center
UL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
Scroll.CanvasSize = UDim2.new(0,0,0,UL.AbsoluteContentSize.Y+10)
end)
local UP = Instance.new("UIPadding",Scroll)
UP.PaddingTop = UDim.new(0,5); UP.PaddingLeft = UDim.new(0,4); UP.PaddingRight = UDim.new(0,4)

TogBtn.MouseButton1Click:Connect(function()
FBox.Visible = not FBox.Visible
TogBtn.Text = FBox.Visible and "▲" or "▼"
end)

local function mkRow(h)
local f=Instance.new("Frame"); f.Size=UDim2.new(0.97,0,0,h)
f.BackgroundTransparency=1; f.Parent=Scroll; return f
end
local function mkSec(txt)
local f=Instance.new("Frame"); f.Size=UDim2.new(0.97,0,0,18)
f.BackgroundTransparency=1; f.Parent=Scroll
local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,0,1,0)
l.Text=txt; l.TextColor3=Color3.fromRGB(150,150,158)
l.TextSize=9; l.Font=Enum.Font.GothamBold
l.BackgroundTransparency=1; l.TextXAlignment=Enum.TextXAlignment.Left
local d=Instance.new("Frame",f); d.Size=UDim2.new(1,0,0,1)
d.Position=UDim2.new(0,0,1,-1); d.BackgroundColor3=Color3.fromRGB(60,60,65)
d.BorderSizePixel=0
end
local function mkBtn(txt,bg,par)
local b=Instance.new("TextButton")
b.BackgroundColor3=bg or Color3.fromRGB(20,20,22)
b.Text=txt; b.TextColor3=Color3.fromRGB(220,220,225)
b.TextSize=10; b.Font=Enum.Font.GothamBold
b.BorderSizePixel=0; b.Parent=par or Scroll
Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
local s=Instance.new("UIStroke",b); s.Color=Color3.fromRGB(120,120,128); s.Thickness=1
return b
end
local function mkLbl(par,txt,sz,col)
local l=Instance.new("TextLabel",par); l.Size=UDim2.new(1,0,1,0)
l.Text=txt; l.TextColor3=col or Color3.fromRGB(210,210,215)
l.TextSize=sz or 10; l.Font=Enum.Font.GothamBold; l.BackgroundTransparency=1
return l
end

mkSec("🔍   SCAN PROPS")
local rS = mkRow(34)
local scanBtn = mkBtn("🔍  SCAN PROPS DI MAP", Color3.fromRGB(20,20,22), rS)
scanBtn.Size = UDim2.new(0.485,0,1,0); scanBtn.Position = UDim2.new(0,0,0,0)
local pcF = Instance.new("Frame",rS)
pcF.Size = UDim2.new(0.485,0,1,0); pcF.Position = UDim2.new(0.515,0,0,0)
pcF.BackgroundColor3 = Color3.fromRGB(15,15,16); pcF.BorderSizePixel=0
Instance.new("UICorner",pcF).CornerRadius = UDim.new(0,8)
Instance.new("UIStroke",pcF).Color = Color3.fromRGB(90,90,96)
local propCountLbl = mkLbl(pcF,"Props: 0",10)

mkSec("✦   SUMMON ART")
local rSum = mkRow(36)
local summonBtn = mkBtn("✦   SUMMON ART", Color3.fromRGB(35,35,38), rSum)
summonBtn.Size = UDim2.new(1,0,1,0); summonBtn.TextSize = 13
summonBtn.TextColor3 = Color3.fromRGB(235,235,240)

local rHint = mkRow(28)
local hintLbl = Instance.new("TextLabel",rHint)
hintLbl.Size = UDim2.new(1,0,1,0)
hintLbl.Text = "Taruh & bentuk prop dimana saja, lalu tekan Summon"
hintLbl.Font = Enum.Font.Gotham
hintLbl.TextColor3 = Color3.fromRGB(110,110,118)
hintLbl.TextSize = 9
hintLbl.BackgroundTransparency = 1
hintLbl.TextWrapped = true

mkSec("🎯   FOLLOW")
local rF = mkRow(34)
local followOffBtn = mkBtn("■  FOLLOW OFF", Color3.fromRGB(20,20,22), rF)
followOffBtn.Size = UDim2.new(0.485,0,1,0); followOffBtn.Position = UDim2.new(0,0,0,0)
local followOnBtn = mkBtn("▶  FOLLOW ON", Color3.fromRGB(15,15,16), rF)
followOnBtn.Size = UDim2.new(0.485,0,1,0); followOnBtn.Position = UDim2.new(0.515,0,0,0)

mkSec("🗑   RESET")
local rR = mkRow(34)
local resetBtn = mkBtn("🗑   RESET ART", Color3.fromRGB(45,15,15), rR)
resetBtn.Size = UDim2.new(1,0,1,0)
resetBtn.TextColor3 = Color3.fromRGB(255,150,150)

local rSt = mkRow(18)
local statusLbl = mkLbl(rSt,"Status :  Idle — scan & bentuk prop dulu",9,Color3.fromRGB(110,110,118))

-- ============================================================
-- BUTTON LOGIC WOY
-- ============================================================
scanBtn.MouseButton1Click:Connect(function()
local n = scanProps()
propCountLbl.Text = "Props: "..n
statusLbl.Text = "Status:  "..n.." props ditemukan"
scanBtn.Text = n>0 and ("✓ "..n.." PROPS") or "⚠ 0 PROPS"
scanBtn.BackgroundColor3 = n>0 and Color3.fromRGB(15,40,18) or Color3.fromRGB(45,10,10)
task.delay(2,function()
scanBtn.Text = "🔍  SCAN PROPS DI MAP"
scanBtn.BackgroundColor3 = Color3.fromRGB(20,20,22)
end)
end)

summonBtn.MouseButton1Click:Connect(function()
if #propCache == 0 then
local n = scanProps()
propCountLbl.Text = "Props: "..n
if n == 0 then
statusLbl.Text = "Status:  ⚠ Tidak ada prop, taruh dulu!"
summonBtn.BackgroundColor3 = Color3.fromRGB(45,10,10)
task.delay(1.5,function() summonBtn.BackgroundColor3 = Color3.fromRGB(35,35,38) end)
return
end
end

local char = LP.Character  
local root = char and char:FindFirstChild("HumanoidRootPart")  
if not root then  
    statusLbl.Text = "Status:  ⚠ Character tidak ditemukan"  
    return  
end  

-- Capture posisi setiap prop relatif ke avatar saat ini  
capturedOffsets = {}  
for i, prop in ipairs(propCache) do  
    if prop and prop.Parent then  
        local propCF = getPropCFrame(prop)  
        if propCF then  
            capturedOffsets[i] = root.CFrame:ToObjectSpace(propCF)  
        end  
    end  
end  
formationCaptured = true  

-- Langsung kunci/snap bentuknya sekali saat disummon  
for i, prop in ipairs(propCache) do  
    local off = capturedOffsets[i]  
    if prop and prop.Parent and off then  
        local targetCF = root.CFrame * off  
        task.spawn(function()  
            local cfR = prop:FindFirstChild("SetCurrentCFrame")  
            if cfR then pcall(function() cfR:InvokeServer(targetCF) end) end  
        end)  
    end  
end  

summonBtn.Text = "✓  ART TERSIMPAN"  
summonBtn.BackgroundColor3 = Color3.fromRGB(40,55,42)  
statusLbl.Text = "Status:  ✦ Art tersimpan — "..#propCache.." props"  
task.delay(2,function()  
    summonBtn.Text = "✦   SUMMON ART ( LX )"  
    summonBtn.BackgroundColor3 = Color3.fromRGB(35,35,38)  
end)

end)

followOnBtn.MouseButton1Click:Connect(function()
if not formationCaptured then
statusLbl.Text = "Status:  ⚠ Summon Art dulu Anjeng!"
return
end
followActive = true
followOnBtn.BackgroundColor3 = Color3.fromRGB(35,35,40)
followOffBtn.BackgroundColor3 = Color3.fromRGB(15,15,16)
statusLbl.Text = "Status:   Following avatar"
end)

followOffBtn.MouseButton1Click:Connect(function()
followActive = false
followOffBtn.BackgroundColor3 = Color3.fromRGB(20,20,22)
followOnBtn.BackgroundColor3 = Color3.fromRGB(15,15,16)
statusLbl.Text = "Status:  Art diam di tempat"
end)

resetBtn.MouseButton1Click:Connect(function()
formationCaptured = false
followActive = false
capturedOffsets = {}
followOffBtn.BackgroundColor3 = Color3.fromRGB(20,20,22)
followOnBtn.BackgroundColor3 = Color3.fromRGB(15,15,16)
summonBtn.Text = "✦   SUMMON ART"
summonBtn.BackgroundColor3 = Color3.fromRGB(35,35,38)
statusLbl.Text = "Status:  Art direset — bentuk ulang prop"
end)

-- ============================================================
-- FOLLOW LOOP — anti lag / crash / freeze
-- Precompute semua target CFrame dulu sebelum invoke,
-- snap langsung tanpa lerp supaya prop tidak terbongkar
-- ============================================================
RS.Heartbeat:Connect(function(dt)
frameCount = frameCount + 1
if frameCount % 3 ~= 0 then return end
if not followActive or not formationCaptured or #capturedOffsets < 1 then return end

local char = LP.Character  
local root = char and char:FindFirstChild("HumanoidRootPart")  
if not root then return end  

local baseCF = root.CFrame  
local count = math.min(#propCache, #capturedOffsets)  

-- Precompute semua target sekaligus — mencegah formasi pecah/terbongkar  
local targets = {}  
for i = 1, count do  
    local off = capturedOffsets[i]  
    if off then targets[i] = baseCF * off end  
end  

for i = 1, count do  
    local prop = propCache[i]  
    local cf = targets[i]  
    if prop and prop.Parent and cf then  
        task.spawn(function()  
            local cfR = prop:FindFirstChild("SetCurrentCFrame")  
            if cfR then pcall(function() cfR:InvokeServer(cf) end) end  
        end)  
    end  
end

end)