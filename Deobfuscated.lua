local Env = getfenv();
local r = {};
local v1 = {...};
local r1 = "PKR";
for H = 0, 8 do
    if H == 0 then
        if r1 ~= "PKR" then
            while true do end;
        end;
        r1 = false;
    else
        if H == 1 then
            if r1 == false then
            end;
        else
            if H == 2 then
                r1 = true;
            else
                if H == 3 then
                    if r1 == true then
                    else
                        while true do end;
                    end;
                else
                    if H == 4 then
                        r1 = true;
                    else
                        if H == 5 then
                            if r1 == true then
                            else
                                while true do end;
                            end;
                        else
                            if H == 6 then
                                r1 = true;
                            else
                                if H == 7 then
                                    if r1 == true then
                                    else
                                        while true do end;
                                    end;
                                else
                                    if H == 8 then
                                        r1 = false;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end; 
end;
r1 = true;
local r2 = string.gmatch;
local function r3(...)
    error("Tamper Detected!");
    return; 
end;
local r4 = false;
local v2 = pcall(function(...)
    r4 = true;
    return; 
end);
local v3 = v2;
if v2 then
    v3 = r4;
end;
local r5 = math.random;
local v4 = table.concat;
local r6 = table and table.unpack or unpack;
local r7 = r5(3, 65);
local v5 = ({
    pcall(function(...)
        return "yP" / (12742021 - "pfHSPH" ^ 14492603); 
    end)
})[2];
local r8 = tonumber(r2(tostring(v5), ":(%d*):")());
for v = 1, r7 do
    r9 = v;
    r10 = math.random(1, 100);
    r11 = r5(0, 255);
    r12 = r5(1, r10);
    r13 = r5(1, 2) == 1;
    r14 = v5.gsub(v5, ":(%d*):", ":" .. tostring(r5(0, 10000)) .. ":");
    f = {
        pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "khOhxfJMx39HO" / (10002226 - "TqL" ^ 6362819); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for H = 1, r10 do
                v1[v3] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end)
    };
    if r13 then
        r1 = r1 and (pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "khOhxfJMx39HO" / (10002226 - "TqL" ^ 6362819); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for H = 1, r10 do
                v1[v3] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end) == false and f[2] == r14);
        C = true;
    else
        r1 = r1 and pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "khOhxfJMx39HO" / (10002226 - "TqL" ^ 6362819); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for H = 1, r10 do
                v1[v3] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end);
        C = true;
        o = (0 + f[r12 + 1]) % 256;
        O = (0 + r11) % 256;
    end; 
end;
r1 = r1 and 0 == 0;
if r1 then
    r17 = math.floor;
    r18 = {};
    r19 = 2;
    r20 = 0;
    q = {};
    for S = 1, 256 do
        q[S] = S; 
    end;
    while not 256 do
        S = table.remove(q, math.random(1, #q));
        r18[S] = string.char(S - 1);
        v5 = #q == 0; 
    end;
    r21 = {};
    local function r22(...)
        if #r21 == 0 then
            r20 = (r20 * 1 + 22804824806133) % 35184372088832;
            repeat
                r19 = r19 * 47 % 257;
            until r19 ~= 1;
            v1 = r19 % 32;
            v3 = r17(r20 / 2 ^ (13 - (r19 - v1) / 32)) % 4294967296 / 2 ^ v1;
            B = r17(v3 % 1 * 4294967296) + r17(v3);
            R = B % 65536;
            E = (B - R) / 65536;
            r21 = {
                R % 256,
                (R - R % 256) / 256,
                E % 256,
                (E - E % 256) / 256
            };
        end;
        v1 = #r21;
        r21[v1] = nil;
        return r21[v1]; 
    end;
    r23 = {};
    r16 = setmetatable({}, {
        ["__index"] = r23,
        ["__metatable"] = nil
    });
    v3 = game;
    r24 = v3.GetService(v3, "Players");
    R = game;
    r25 = R.GetService(R, "RunService");
    E = game;
    r26 = E.GetService(E, "UserInputService");
    v4 = game;
    r27 = v4.GetService(v4, "TweenService");
    a = game;
    r28 = a.GetService(a, "HttpService");
    v2 = game;
    r29 = v2.GetService(v2, "SoundService");
    q = game;
    r30 = q.GetService(q, "TextService");
    r31 = r24.LocalPlayer;
    r32 = false;
    pcall(function(...)
        v3 = getgenv;
        if v3 then
            v1 = getgenv();
        end;
        C, D = true, v3;
        if v3 then
            v1 = D;
            if v1.INVINCIBLE_FLY_RUNNING == true then
                r32 = true;
            end;
            return;
        else
            D = _G;
        end; 
    end);
    if r32 then
        pcall(function(...)
            v3 = getgenv;
            if v3 then
                v1 = getgenv();
            end;
            v1 = v3 or _G;
            if type(v1.AlreadyRunningInvincibleFly) == "function" then
                v1.AlreadyRunningInvincibleFly();
            end;
            return; 
        end);
        return;
    end;
    pcall(function(...)
        v3 = getgenv;
        if v3 then
            v1 = getgenv();
        end;
        D = v3 and nil;
        _G.INVINCIBLE_FLY_RUNNING = true;
        return; 
    end);
    r33 = {
        ["killed"] = false,
        ["guiOpen"] = false,
        ["guiOpenedOnce"] = false,
        ["mouseAnchorNoticeShown"] = false,
        ["fpTweeningOut"] = false,
        ["fpCameraGen"] = 0
    };
    r33.autoExecEnabled = false;
    r33.autoExecFlagFile = "InvincibleFly_FE/autoexec.json";
    pcall(function(...)
        v1 = isfile;
        if v1 then
            D = isfile(r33.autoExecFlagFile);
        end;
        if v1 then
            C = r28;
            g = C.JSONDecode(C, readfile(r33.autoExecFlagFile));
            if g then
                D = g.enabled == true;
            end;
            if g then
                r33.autoExecEnabled = true;
            end;
        end;
        return; 
    end);
    r33.resolveQueueFunction = function(...)
        if type(queue_on_teleport) == "function" then
            return queue_on_teleport;
        end;
        if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
            return syn.queue_on_teleport;
        end;
        if type(queueFunction) == "function" then
            return queueFunction;
        end;
        return nil; 
    end;
    r33.registerAutoExec = function(...)
        r34 = r33.resolveQueueFunction();
        C = r34;
        if C then
            pcall(function(...)
                r34("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua\"))()");
                return; 
            end);
            D = game;
            C = D.GetService(D, "TeleportService").TeleportInitFailed;
            C.Connect(C, function(...)
                pcall(function(...)
                    r34("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua\"))()");
                    return; 
                end);
                return; 
            end);
        else
            warn("\xe2\x9a\xa0\xef\xb8\x8f Auto Execute is not supported on this executor.");
        end;
        return; 
    end;
    if r33.autoExecEnabled then
        r33.registerAutoExec();
    end;
    r33.fadingTracks = {};
    r33.suppressBlockDefaultAnimsUntil = 0;
    r33.replicatedIdleSwitchGeneration = 0;
    Y = true;
    J = r31.Character;
    o = J;
    if J then
        C = C;
        r35 = J;
        o = r35;
        r36 = o.WaitForChild(o, "Humanoid");
        J = r35;
        r37 = J.WaitForChild(J, "HumanoidRootPart");
        L = r36;
        r38 = L.WaitForChild(L, "Animator");
        Pg = r16;
        rg = r15;
        Ag = rg("z\xda\"", 15178877646648);
        kg = Pg[Ag];
        if (r36 and r36.RigType) ~= Enum.HumanoidRigType[kg] then
            r39 = Instance.new("ScreenGui");
            r39.Name = "IFlyR15Warning";
            r39.ResetOnSpawn = false;
            r39.IgnoreGuiInset = true;
            pcall(function(...)
                if gethui then
                    r39.Parent = gethui();
                else
                    v1 = game;
                    r39.Parent = v1.GetService(v1, "CoreGui");
                end;
                return; 
            end);
            r40 = Instance.new("CanvasGroup");
            r40.Size = UDim2.new(1, 0, 1, 0);
            r40.BackgroundTransparency = 1;
            r40.GroupTransparency = 0;
            r40.Parent = r39;
            kg = Instance.new("Frame");
            kg.Size = UDim2.new(0, 380, 0, 90);
            kg.AnchorPoint = Vector2.new(0.5, 0.5);
            kg.Position = UDim2.new(0.5, 0, 0.5, 0);
            kg.BackgroundColor3 = Color3.fromRGB(30, 14, 14);
            kg.BackgroundTransparency = .05;
            kg.BorderSizePixel = 0;
            kg.Parent = r40;
            Instance.new("UICorner", kg).CornerRadius = UDim.new(0, 14);
            Pg = Instance.new("UIStroke", kg);
            Pg.Color = Color3.fromRGB(220, 60, 60);
            Pg.Transparency = .3;
            Pg.Thickness = 1.5;
            rg = Instance.new("TextLabel", kg);
            rg.Size = UDim2.new(1, -24, 0, 28);
            rg.Position = UDim2.new(0, 12, 0, 12);
            rg.BackgroundTransparency = 1;
            rg.Text = "R15 Required";
            rg.TextColor3 = Color3.fromRGB(255, 190, 190);
            rg.Font = Enum.Font.GothamBold;
            rg.TextSize = 15;
            rg.TextXAlignment = Enum.TextXAlignment.Left;
            Ag = Instance.new("TextLabel", kg);
            Ag.Size = UDim2.new(1, -24, 0, 40);
            Ag.Position = UDim2.new(0, 12, 0, 42);
            Ag.BackgroundTransparency = 1;
            Ag.Text = "Invincible Fly only works with the R15 rig. Switch your avatar to R15 in the avatar editor (Body -> Scale-> Body type) settings, then rejoin. If this doesn't work your game may not support R15.";
            Ag.TextColor3 = Color3.fromRGB(200, 160, 160);
            Ag.Font = Enum.Font.Gotham;
            Ag.TextSize = 12;
            Ag.TextWrapped = true;
            Ag.TextXAlignment = Enum.TextXAlignment.Left;
            task.delay(10, function(...)
                C = r27;
                D = C.Create(C, r40, TweenInfo.new(1.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    ["GroupTransparency"] = 1
                });
                D.Play(D);
                task.delay(1.3, function(...)
                    local Z = {
                        575
                    };
                    pcall(function(...)
                        C = r[Z[5]];
                        C.Destroy(C);
                        return; 
                    end);
                    return; 
                end);
                return; 
            end);
            return;
        end;
        ls[19] = 23625188595186;
        ls[13] = 31684940690244;
        ls[3] = 16674645654697;
        ls[14] = "6b\xe6\xa45\x14\x993\x1e\xca\x10\xd7\xc1";
        Rg = r16;
        bg = "AnimationId";
        jg = "rbxassetid://108933593456838";
        Ng = "Start";
        Tg = "End";
        Gg = r15;
        dg = Gg("\x92\xe5\x9f\xaa\x0f^U\xb8\xa7\x9br\xff\x8d", 28515158091708);
        zg = r16[dg];
        ls[21] = 19930330220673;
        ls[11] = 8376515599993;
        ls[16] = "\xdd|%\xc8h\xa8@Yd\x1b-\xfb\xfe";
        ls[10] = "Ee\x04\xbda\xcc\xbe\xa2\xff\xa0\x81FX";
        ls[1] = 10295350797684;
        ls[18] = "\xa8\xd5\xab\x8a\xec\x10\x04\x11\xed\xc3\x7fL\xf1";
        ls[12] = "\x0c@\x95*!6qx\x10\xcc9\xd8\x04";
        ls[6] = "\xa6\xe3\xc7\xa6\x9a\xe7d\xdcq\xa9:G\n";
        ls[4] = "\xad\x1b\xad\x16\x99\xc1Z\x8bNv\xc0\xbd]";
        ls[9] = 17078384901665;
        ls[15] = 13441510355174;
        ls[8] = "\xb1\x0c\xaf\x10\xc9\x89\xc2\x19ff\xf0\x95\x0f";
        ls[1] = 2242041350184;
        ls[2] = "U\x15%\r\xf8\xb4\xa0r7p\x92\xa6\xdd";
        ls[7] = 22771537793751;
        ls[1] = r15(ls[2], ls[3]);
        ls[1] = 18868367148196;
        ls[3] = 33020716283936;
        ls[5] = 12731745349201;
        ls[2] = "\xdamE";
        ls[1] = r15(ls[2], ls[3]);
        ls[1] = r16;
        ls[2] = r15;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[1] = .9;
        ls[4] = "\t\xf0\xe4";
        ls[5] = 31239324234149;
        ls[1] = 15697510775067;
        ls[3] = 7419782437630;
        ls[1] = "\x1e\xc6vT\x85\x05\xac\x12\xd0\xc3\x8c\xd9\xf7\xc2|`\x07*\x06\x1a!J\x8e\x9e\x00\xb8\x08h";
        ls[2] = 23414728774958;
        ls[2] = "\x9aB\xa0\xa2+";
        ls[1] = r15(ls[2], ls[3]);
        ls[1] = r16;
        ls[2] = r15;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[3] = r16;
        ls[4] = r15;
        ls[5] = ls[4](ls[6], ls[7]);
        ls[17] = 15699658324253;
        ls[2] = ls[3][ls[5]];
        ls[1], ls[3] = 3, 1;
        ls[6] = "\xc5z@";
        ls[7], ls[1] = 7421929986816, 10858008684416;
        ls[2] = "`4\x94\x92\xfan\xf8\xb4\xea\xd3\xf1";
        ls[3] = 2676920060349;
        ls[1] = r15(ls[2], ls[3]);
        ls[4] = 10873041528718;
        ls[3] = "\x0b\xc9n\x9a\x97f5B\x83\xab\x9d\xd5e\xbb\xcdZ\xa2\x065\x02[\x9b\xa1\xd3\x9a79\x7f";
        ls[1] = r15;
        ls[2] = ls[1](ls[3], ls[4]);
        ls[5], ls[4] = 4654812860655, "\xc4i\xf4\xa1'";
        ls[1] = r16;
        ls[2] = r15;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[1] = 0;
        ls[3] = r16;
        ls[4] = r15;
        ls[5] = ls[4](ls[6], ls[7]);
        ls[2] = ls[3][ls[5]];
        ls[3] = 3;
        ls[5] = r16;
        ls[6] = r15;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[5] = 1;
        ls[3], ls[9], ls[4], ls[2], ls[6] = 5759726916852, 24278043547730, "\x02\xe9\xa3\xe2\x9dTJ\x87P\xe2D", "Y\x95R\xa0\x04\xa6\xa1AL\xce!", 27985787217359;
        ls[1] = r15(ls[2], ls[3]);
        ls[1] = r16;
        ls[7] = 27205153088248;
        ls[2] = r15;
        ls[8], ls[5] = "\x87\xe0\xa1", 1531202569618;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[5] = ",m\xfd#\x87C\xdd1\x16O\xe7\x9c\xcf\x98i.\xeds\xda\xfb\x14\r\x06\x1b\xcb\xab\x90R";
        ls[2] = r16;
        ls[3] = r15;
        ls[4] = ls[3](ls[5], ls[6]);
        ls[1] = ls[2][ls[4]];
        ls[6] = "Q\xc3\xf7T\xe6";
        ls[3] = r16;
        ls[4] = r15;
        ls[5] = ls[4](ls[6], ls[7]);
        ls[2] = ls[3][ls[5]];
        ls[3] = 0;
        ls[5] = r16;
        ls[6] = r15;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[7] = r16;
        ls[8] = r15;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[10] = "\xf6/x";
        ls[6] = ls[7][ls[9]];
        ls[5], ls[7] = 4, 1;
        ls[8] = 8735156314055;
        ls[1] = r16;
        ls[4], ls[5], ls[11] = "\xf5\x8fo\xdd\x01\xac\xfeD\xda\xc7d\xe6A", 22903612068690, 9342912733693;
        ls[2] = r15;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[3] = r16;
        ls[4] = r15;
        ls[7], ls[6] = 12243177909386, "\xae.;\x85b$\xac(\xd4i\xc5";
        ls[5] = ls[4](ls[6], ls[7]);
        ls[9], ls[7] = 29068152007103, "\x80['\xbe^u\x89\xca0\xa2TI,\xd0\x17\x8a\x04\xd1\xfd\xa3p\x95=:\x1fz7";
        ls[2] = ls[3][ls[5]];
        ls[4] = r16;
        ls[5] = r15;
        ls[6] = ls[5](ls[7], ls[8]);
        ls[3] = ls[4][ls[6]];
        ls[5] = r16;
        ls[6] = r15;
        ls[8] = "[n#8\x08";
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[5] = 0;
        ls[7] = r16;
        ls[8] = r15;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[6] = ls[7][ls[9]];
        ls[9] = r16;
        ls[10] = r15;
        ls[7] = 4;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[8] = ls[9][ls[11]];
        ls[9] = 1;
        ls[1] = {
            [ls[2]] = ls[3],
            [ls[4]] = ls[5],
            [ls[6]] = ls[7],
            [ls[8]] = ls[9]
        };
        ls[3] = r16;
        ls[8] = "]\xbeY%\xae\x0bR\x02n\xf8\xf9";
        ls[4] = r15;
        ls[13], ls[7], ls[6] = 25426982362240, 7722586872856, "9\xa5\x85\xfa\xce\x1d\xa5\x9d\xab\x11c";
        ls[5] = ls[4](ls[6], ls[7]);
        ls[12], ls[9] = "\x87L\x1f", 29571752291220;
        ls[2] = ls[3][ls[5]];
        ls[10] = 35014715703137;
        ls[5] = r16;
        ls[6] = r15;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[6] = r16;
        ls[9] = "\xae\xae\xbeE\xbf.Kj\xb0\xff\xb4\xfd\xa8\x89\xd5\r\x10f\x1c\xd1#g\x0f\xdcZ\x04\xb6\xfb";
        ls[7] = r15;
        ls[8] = ls[7](ls[9], ls[10]);
        ls[5] = ls[6][ls[8]];
        ls[7] = r16;
        ls[10] = "\x81\x83\x8e\xd5\xb8";
        ls[8] = r15;
        ls[11] = 25468859571367;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[6] = ls[7][ls[9]];
        ls[7] = 0;
        ls[9] = r16;
        ls[10] = r15;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[8] = ls[9][ls[11]];
        ls[11] = r16;
        ls[12] = r15;
        ls[9] = 3;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[10] = ls[11][ls[13]];
        ls[11] = 1;
        ls[3] = {
            [ls[4]] = ls[5],
            [ls[6]] = ls[7],
            [ls[8]] = ls[9],
            [ls[10]] = ls[11]
        };
        ls[11], ls[13], ls[15], ls[14] = 25556909087993, 2400959989948, 15115524945661, "./\xed";
        ls[5] = r16;
        ls[10], ls[8] = "\xaf\xab\xfcCx3<ET \xc4", "\x13l\xf55\x13\x19s|\xbf\x04";
        ls[6] = r15;
        ls[9] = 10735598380814;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[7] = r16;
        ls[8] = r15;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[6] = ls[7][ls[9]];
        ls[8] = r16;
        ls[12], ls[11] = 24948078893762, "\xf1\x9a:<\x12P\xf1\xaf\xa7a9\xc0W4*Zg\xbf\xcfh\xe5\xd6\xd0\xa4\x0f\xd3\x07";
        ls[9] = r15;
        ls[10] = ls[9](ls[11], ls[12]);
        ls[7] = ls[8][ls[10]];
        ls[9] = r16;
        ls[10] = r15;
        ls[12] = "\x93H\x93%\xa5";
        ls[11] = ls[10](ls[12], ls[13]);
        ls[20] = "0\xad\xef:\r\"J\x9a\xe3\x87\xf35G";
        ls[8] = ls[9][ls[11]];
        ls[11] = r16;
        ls[12] = r15;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[10] = ls[11][ls[13]];
        ls[9] = 0;
        ls[13] = r16;
        ls[14] = r15;
        ls[11] = 4;
        ls[15] = ls[14](ls[16], ls[17]);
        ls[12] = ls[13][ls[15]];
        ls[13] = 1;
        ls[5] = {
            [ls[6]] = ls[7],
            [ls[8]] = ls[9],
            [ls[10]] = ls[11],
            [ls[12]] = ls[13]
        };
        ls[11], ls[13], ls[10] = 12029496765379, 20262126569910, "0m\x01\xaf\x87\xe6\xca\xe2\xbaN\xb8T\x1f\x0bB\x93";
        ls[7] = r16;
        ls[8] = r15;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[12] = "\x99\x86\xd0\xb56\x84\x96\xbf\xf5q\x06";
        ls[6] = ls[7][ls[9]];
        ls[9] = r16;
        ls[17], ls[14] = 30304066563646, 11919971756893;
        ls[10] = r15;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[8] = ls[9][ls[11]];
        ls[10] = r16;
        ls[13], ls[15] = "\x95Q1\xaa\xc0XM\xbe\xa3\xdb5\xe5!L\x8d\x1fL\xab\x8c_c\x1a\xda\x08\x8a\xf7I", 16588743687257;
        ls[11] = r15;
        ls[12] = ls[11](ls[13], ls[14]);
        ls[9] = ls[10][ls[12]];
        ls[11] = r16;
        ls[14] = "!y\xde\xc1\xcc";
        ls[12] = r15;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[16] = "\xb0\x8f5";
        ls[10] = ls[11][ls[13]];
        ls[13] = r16;
        ls[14] = r15;
        ls[11] = 0;
        ls[15] = ls[14](ls[16], ls[17]);
        ls[12] = ls[13][ls[15]];
        ls[15] = r16;
        ls[16] = r15;
        ls[17] = ls[16](ls[18], ls[19]);
        ls[13], ls[19] = 3, 16870072630623;
        ls[14] = ls[15][ls[17]];
        ls[15] = 1;
        ls[7], ls[16] = {
            [ls[8]] = ls[9],
            [ls[10]] = ls[11],
            [ls[12]] = ls[13],
            [ls[14]] = ls[15]
        }, 4870641553848;
        ls[12] = "\x01\xaer\x1e\xf1\xd1\xb3F\x9d";
        ls[9] = r16;
        ls[13] = 27181530047202;
        ls[10] = r15;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[14], ls[17] = "\xdc\xbbW#\xc7\x11_\x81\xbb\xbdy", 6097965913647;
        ls[8] = ls[9][ls[11]];
        ls[11] = r16;
        ls[18] = "\xaa\x1f2";
        ls[12] = r15;
        ls[15] = 33910875421533;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[10] = ls[11][ls[13]];
        ls[15] = "\xad[=\xbe\xa3\xb6\x13j\xcb\x8b\x81\xbd\xdb\x8c\xb8\x14\xde\xa8\xac\xd7\x04\xc8\xfa\x93,\x94\x976";
        ls[12] = r16;
        ls[13] = r15;
        ls[14] = ls[13](ls[15], ls[16]);
        ls[11] = ls[12][ls[14]];
        ls[16] = "\x86\xcf\x90\xed\x12";
        ls[13] = r16;
        ls[14] = r15;
        ls[15] = ls[14](ls[16], ls[17]);
        ls[12] = ls[13][ls[15]];
        ls[13] = 0;
        ls[15] = r16;
        ls[16] = r15;
        ls[17] = ls[16](ls[18], ls[19]);
        ls[14] = ls[15][ls[17]];
        ls[17] = r16;
        ls[15] = 4;
        ls[18] = r15;
        ls[19] = ls[18](ls[20], ls[21]);
        ls[16] = ls[17][ls[19]];
        ls[17] = 1;
        ls[9] = {
            [ls[10]] = ls[11],
            [ls[12]] = ls[13],
            [ls[14]] = ls[15],
            [ls[16]] = ls[17]
        };
        r41 = {
            ["ChillLevitate"] = {
                ["AnimationId"] = "rbxassetid://125815409725539",
                ["Start"] = 1,
                ["End"] = 2.6,
                ["PlaybackSpeed"] = 0.5
            },
            ["MustacheMark"] = {
                ["AnimationId"] = "rbxassetid://77807262438365",
                ["Start"] = .1,
                ["End"] = 3,
                ["PlaybackSpeed"] = 1
            },
            ["ZombieMark"] = {
                ["AnimationId"] = "rbxassetid://75532269733454",
                ["Start"] = .1,
                ["End"] = 3,
                ["PlaybackSpeed"] = 1
            },
            ["RelaxedFly"] = {
                ["AnimationId"] = "rbxassetid://132783162476851",
                ["Start"] = .1,
                ["End"] = 5,
                ["PlaybackSpeed"] = 1
            },
            ["TrackSuitMark"] = {
                ["AnimationId"] = "rbxassetid://125313210961391",
                ["Start"] = .1,
                ["End"] = 4,
                ["PlaybackSpeed"] = 1
            },
            ["LongHairMark"] = {
                ["AnimationId"] = "rbxassetid://101003076314239",
                ["Start"] = .1,
                ["End"] = 4,
                ["PlaybackSpeed"] = 1
            },
            ["FlaxanMark"] = Rg,
            ["MasklessMark"] = {
                ["AnimationId"] = r16[r15("@<\x87\x10\xb3_3\xcc\x0b\x1e\x01;\x10G\x1a\x84\xaf{l\xff\x08N\x08)\x81\x9cJ", Gg)],
                [r16[r15("\xd1\xef\x0f\xac\xa5", dg)]] = .1,
                ["End"] = 4,
                ["PlaybackSpeed"] = 1
            },
            ["ViltrimiteMark"] = {
                ["AnimationId"] = "rbxassetid://124574039035034",
                ["Start"] = .1,
                ["End"] = 5,
                ["PlaybackSpeed"] = 1
            },
            ["PrisonerMark"] = {
                ["AnimationId"] = "rbxassetid://98385196315632",
                ["Start"] = 1,
                ["End"] = 4,
                ["PlaybackSpeed"] = .6
            },
            ["TargetMark"] = {
                ["AnimationId"] = "rbxassetid://122741335712327",
                ["Start"] = 1,
                ["End"] = 5.5,
                ["PlaybackSpeed"] = .6
            },
            ["NoGoggles"] = {
                ["AnimationId"] = "rbxassetid://77715558557237",
                ["Start"] = 1,
                ["End"] = 5,
                ["PlaybackSpeed"] = .7
            },
            ["SheistyMark"] = {
                ["AnimationId"] = "rbxassetid://121605966423204",
                ["Start"] = 1,
                ["End"] = 3.9,
                ["PlaybackSpeed"] = .6
            },
            ["AnnoyedIdle"] = {
                ["AnimationId"] = "rbxassetid://93326430026112",
                ["Start"] = .2,
                ["End"] = 3,
                ["PlaybackSpeed"] = 1.2
            },
            ["UpsideDown"] = {
                ["AnimationId"] = "rbxassetid://100566641677826",
                ["Start"] = .1,
                ["End"] = 3,
                ["PlaybackSpeed"] = 1
            },
            ["Conquest"] = {
                ["AnimationId"] = "rbxassetid://91850736796162",
                ["Start"] = 0.5,
                ["End"] = 2.5,
                ["PlaybackSpeed"] = .7
            },
            ["MohawkMark"] = {
                ["AnimationId"] = "rbxassetid://116733977004098",
                ["Start"] = 0.5,
                ["End"] = 3.5,
                ["PlaybackSpeed"] = 1
            },
            ["BulletProofMark"] = {
                ["AnimationId"] = "rbxassetid://95218435498795",
                ["Start"] = 0.5,
                ["End"] = 3.5,
                ["PlaybackSpeed"] = 1
            },
            ["Sinisterv3"] = {
                ["AnimationId"] = "rbxassetid://110525048751383",
                ["Start"] = 0.5,
                ["End"] = 3.5,
                ["PlaybackSpeed"] = 1
            },
            ["BaldMark"] = {
                ["AnimationId"] = "rbxassetid://76797102013719",
                ["Start"] = 0.5,
                ["End"] = 3.5,
                ["PlaybackSpeed"] = 1
            },
            ["ViltrimiteIdle"] = {
                ["AnimationId"] = "rbxassetid://92901321263182",
                ["Start"] = .1,
                ["End"] = 4,
                ["PlaybackSpeed"] = 1
            },
            ["Thragg"] = {
                ["AnimationId"] = "rbxassetid://114708567078493",
                ["Start"] = 0,
                ["End"] = 2,
                ["PlaybackSpeed"] = .3
            },
            ["CasualFloat"] = {
                ["AnimationId"] = "rbxassetid://130104867308995",
                ["Start"] = .1,
                ["End"] = 2.8,
                ["PlaybackSpeed"] = .6
            },
            ["Sinister2"] = {
                ["AnimationId"] = "rbxassetid://120442396223948",
                ["Start"] = .1,
                ["End"] = 2,
                ["PlaybackSpeed"] = 1
            },
            ["BasicIdle"] = {
                ["AnimationId"] = "rbxassetid://95101792406607",
                ["Start"] = .1,
                ["End"] = 2,
                ["PlaybackSpeed"] = .3
            },
            ["PreparedIdle"] = {
                ["AnimationId"] = "rbxassetid://74775170766222",
                ["Start"] = .1,
                ["End"] = 3,
                ["PlaybackSpeed"] = .3
            },
            ["MainInvincible"] = {
                ["AnimationId"] = "rbxassetid://85659907860049",
                ["Start"] = 1.6,
                ["End"] = 3,
                ["PlaybackSpeed"] = 1
            },
            ["HomelanderV2"] = {
                ["AnimationId"] = "rbxassetid://126046533185038",
                ["Start"] = .1,
                ["End"] = 4,
                ["PlaybackSpeed"] = 1
            },
            ["IntimidatingFly"] = {
                ["AnimationId"] = "rbxassetid://113644780745425",
                ["Start"] = 0,
                ["End"] = 3,
                [r16[r15("\x92\\ 7,y\xa7\xfc8\xa4\x95\x0e\xd5", ls[1])]] = 1
            },
            ["OmniMan"] = {
                ["AnimationId"] = "rbxassetid://117018025684593",
                ["Start"] = 0,
                [r16[r15("=x\x0b", ls[1])]] = 2,
                [r16[ls[1]]] = .8
            },
            ["SmugFly"] = {
                ["AnimationId"] = "rbxassetid://83065143783783",
                [r16[r15("\x8e.\x88(t", ls[1])]] = 0,
                [r16[ls[1]]] = 4,
                [ls[1][ls[3]]] = ls[1]
            },
            ["MetroMan"] = {
                [r16[r15("\xce\x9d:\xe3x\xf1\xf7\xf5\x00*\x1c", ls[1])]] = r16[r15(ls[1], ls[2])],
                [r16[ls[1]]] = 0,
                [ls[1][ls[3]]] = ls[1],
                [ls[2]] = ls[3]
            },
            [r16[r15("E( \x85\xa9i\xa8-\x13\xa5l\xfc+S", ls[1])]] = {
                [r16[ls[1]]] = r16[ls[2]],
                [ls[1][ls[3]]] = ls[1],
                [ls[2]] = ls[3],
                [ls[4]] = ls[5]
            },
            [r16[ls[1]]] = {
                [ls[1][ls[3]]] = ls[1],
                [ls[2]] = ls[3],
                [ls[4]] = ls[5],
                [ls[6]] = ls[7]
            },
            [ls[1][ls[3]]] = ls[1],
            [ls[2]] = ls[3],
            [ls[4]] = ls[5],
            [ls[6]] = ls[7],
            [ls[8]] = ls[9]
        };
        ls[12] = 2710207072732;
        ls[13] = 11617167321667;
        ls[7] = 2967912975052;
        r42 = {
            ["Sinister2"] = true,
            ["ViltrimiteMark"] = true,
            ["MustacheMark"] = true,
            ["Thragg"] = true,
            ["ZombieMark"] = true,
            ["RelaxedFly"] = true,
            ["AnnoyedIdle"] = true,
            ["BulletProofMark"] = true,
            ["LongHairMark"] = true,
            ["Sinisterv3"] = true,
            ["MasklessMark"] = true,
            ["FlaxanMark"] = true,
            ["IntimidatingFly"] = true,
            ["OmniMan"] = true,
            ["SmugFly"] = true,
            ["MetroMan"] = true,
            ["LaidBackFlight"] = true,
            ["AuraFarming"] = true,
            ["DemonicFlight"] = true,
            ["CockyFlight"] = true,
            ["MainMarkII"] = true,
            ["AggressiveFlight"] = true,
            ["AltMark19"] = true
        };
        ls[9], ls[1] = 26081984863970, 27394137416616;
        ls[14] = 13929004020396;
        r33.LEGACY_FORMAT_IDLES = {
            ["Conquest"] = true,
            ["ChillLevitate"] = true,
            ["CasualFloat"] = true,
            ["MohawkMark"] = true,
            ["BaldMark"] = true,
            ["PrisonerMark"] = true,
            ["TargetMark"] = true,
            ["SheistyMark"] = true,
            ["MainInvincible"] = true,
            ["UpsideDown"] = true,
            ["PreparedIdle"] = true,
            ["BasicIdle"] = true,
            ["ViltrimiteIdle"] = true
        };
        r33.SLOW_REPLICATION_IDLES = {
            ["TrackSuitMark"] = true,
            ["NoGoggles"] = true
        };
        ls[16] = 18115651158503;
        ls[2] = 13723913073133;
        ls[10] = 22054256365627;
        r43 = {
            {
                ["label"] = "CASUAL",
                ["names"] = {
                    "RelaxedFly",
                    "LaidBackFlight",
                    "ChillLevitate",
                    "CasualFloat"
                }
            },
            {
                ["label"] = "CONFIDENT & STYLISH",
                ["names"] = {
                    "CockyFlight",
                    "SmugFly",
                    "AuraFarming"
                }
            },
            {
                ["label"] = "INTENSE",
                ["names"] = {
                    "IntimidatingFly",
                    "AnnoyedIdle",
                    "DemonicFlight",
                    "AggressiveFlight",
                    "Conquest"
                }
            },
            {
                ["label"] = "MARKS & VARIANTS",
                ["names"] = {
                    "ViltrimiteMark",
                    "TrackSuitMark",
                    "BaldMark",
                    "LongHairMark",
                    "FlaxanMark",
                    "MasklessMark",
                    "BulletProofMark",
                    "PrisonerMark",
                    "TargetMark",
                    "SheistyMark",
                    "NoGoggles",
                    "AltMark19",
                    "MainMarkII",
                    "MainInvincible",
                    "MohawkMark",
                    "MustacheMark",
                    "Sinister2",
                    "Sinisterv3",
                    "ZombieMark"
                }
            },
            {
                ["label"] = "UNIQUE POSES",
                ["names"] = {
                    "UpsideDown",
                    "Thragg",
                    "PreparedIdle",
                    "BasicIdle",
                    "ViltrimiteIdle",
                    "MetroMan",
                    "OmniMan"
                }
            },
            {
                ["label"] = "HOMELANDER",
                ["names"] = {
                    "HomelanderV2"
                }
            }
        };
        ls[6] = 10258842461522;
        ls[5] = 4648370213097;
        ls[15] = 26120640749318;
        ls[8] = 21141547961577;
        ls[11] = 14793392567761;
        ls[4] = 16972081216958;
        ls[17] = 32828510631789;
        ls[3] = 26447068225590;
        ls[1] = "\x01\x16\x93}\x804V8";
        ls[2] = "\x08Cv\x93t\xaei\x93\xb7";
        ls[1] = r15(ls[2], ls[3]);
        ls[3] = "\x95\xe8\xc0\xe5Pp\xe3\xb1`\xd5\xc7\\\xbc\xd9";
        ls[1] = r15;
        ls[2] = ls[1](ls[3], ls[4]);
        ls[4] = "\xbb\x17\xcb\xff.\xaa\xe9M\",\xb3\xe2\x17\xe1\x8e\xfe";
        ls[1] = r16;
        ls[2] = r15;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[5] = "\x0br\xb6N2\"\xb8\xffY\xa23";
        ls[2] = r16;
        ls[3] = r15;
        ls[4] = ls[3](ls[5], ls[6]);
        ls[1] = ls[2][ls[4]];
        ls[3] = r16;
        ls[4] = r15;
        ls[6] = "\x03\x86\xe8\x13\xa8\xfa\xed\xb3{\xeeE\xdc";
        ls[5] = ls[4](ls[6], ls[7]);
        ls[7] = "\xf2a\x89\")\x16M\x11\xfbb\xe7\xcb\xdb";
        ls[2] = ls[3][ls[5]];
        ls[4] = r16;
        ls[5] = r15;
        ls[6] = ls[5](ls[7], ls[8]);
        ls[8] = "*\xbcz7\xd9{\xab}\x0ch\xc8\x7f\xac\x92";
        ls[3] = ls[4][ls[6]];
        ls[5] = r16;
        ls[6] = r15;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[9] = "\x17\t\xc2\xc2\xefk\x988\xdb\x0f\xcb";
        ls[4] = ls[5][ls[7]];
        ls[6] = r16;
        ls[7] = r15;
        ls[8] = ls[7](ls[9], ls[10]);
        ls[5] = ls[6][ls[8]];
        ls[10] = "\x1c\xc8\xec@\x97\xd1k;H\xa1\x97N";
        ls[7] = r16;
        ls[8] = r15;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[6] = ls[7][ls[9]];
        ls[8] = r16;
        ls[9] = r15;
        ls[11] = "\x06f\x9f\xa6\x880b0\x86\x00";
        ls[10] = ls[9](ls[11], ls[12]);
        ls[7] = ls[8][ls[10]];
        ls[12] = "\xfb\xc6\x8a^--R\x900\xe4\x96`";
        ls[9] = r16;
        ls[10] = r15;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[8] = ls[9][ls[11]];
        ls[10] = r16;
        ls[13] = "\xcd\xbe>W\xdfAw[\xf8'\xb6B\xba\x80`M";
        ls[11] = r15;
        ls[12] = ls[11](ls[13], ls[14]);
        ls[14] = "9\xc3\x06Dr\xd1\xfeX\x0e\x9a=|\xd1\x8dTI!";
        ls[9] = ls[10][ls[12]];
        ls[11] = r16;
        ls[12] = r15;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[10] = ls[11][ls[13]];
        ls[12] = r16;
        ls[13] = r15;
        ls[15] = "\x88:\xbda\x97\xc5\xfb r";
        ls[14] = ls[13](ls[15], ls[16]);
        ls[16] = "\xdb\x07_\x1a\xc6\xbf^Nn1e";
        ls[11] = ls[12][ls[14]];
        ls[13] = r16;
        ls[14] = r15;
        ls[15] = ls[14](ls[16], ls[17]);
        ls[12] = ls[13][ls[15]];
        r44 = {
            ["MustacheMark"] = "Mustache Mark",
            ["Thragg"] = "Thragg",
            ["RelaxedFly"] = "Relaxed Fly",
            ["ZombieMark"] = "Zombie Mark",
            ["ChillLevitate"] = "Chill Levitate",
            ["ViltrimiteMark"] = "Viltrimite Mark",
            ["NoGoggles"] = "No Goggles",
            ["TargetMark"] = "Target Mark",
            ["Sinisterv3"] = "Sinister v3",
            ["TrackSuitMark"] = "Track Suit Mark",
            ["BaldMark"] = "Bald Mark",
            ["LongHairMark"] = "Long Hair Mark",
            ["FlaxanMark"] = "Flaxan Mark",
            ["MasklessMark"] = "Maskless Mark",
            ["BulletProofMark"] = "Bullet Proof Mark",
            ["PrisonerMark"] = "Prisoner Mark",
            ["UpsideDown"] = "Upside Down",
            ["CasualFloat"] = "Casual Float",
            ["SheistyMark"] = "Sheisty Mark",
            ["PreparedIdle"] = "Prepared Idle",
            ["AnnoyedIdle"] = "Annoyed Idle",
            ["ViltrimiteIdle"] = "Viltrimite Idle",
            ["Sinister2"] = "Sinister 2",
            ["Conquest"] = "Conquest",
            ["MohawkMark"] = "Mohawk Mark",
            ["MainInvincible"] = "Main Invincible",
            ["BasicIdle"] = "Basic Idle",
            ["HomelanderV2"] = "Homelander Idle",
            ["IntimidatingFly"] = "Intimidating Fly",
            ["OmniMan"] = "Omni Man",
            ["SmugFly"] = r16[r15("Ss*\x1f\x87d\xcd\xac", ls[1])],
            [r16[r15(ls[1], ls[2])]] = r16[ls[1]],
            [r16[ls[2]]] = ls[1][ls[3]],
            [ls[1]] = ls[2],
            [ls[3]] = ls[4],
            [ls[5]] = ls[6],
            [ls[7]] = ls[8],
            [ls[9]] = ls[10],
            [ls[11]] = ls[12]
        };
        Rg = r16;
        bg = "AnimationId";
        jg = "rbxassetid://91788124131212";
        Ng = "LiftStart";
        Tg = "LiftEnd";
        r45 = {
            ["Homelander"] = {
                ["AnimationId"] = "rbxassetid://123190971900678",
                ["LiftStart"] = .7,
                ["LiftEnd"] = 1.9
            },
            ["Backflip"] = {
                ["AnimationId"] = "rbxassetid://117373674181293",
                ["LiftStart"] = .3,
                ["LiftEnd"] = 1.3
            },
            ["StandardJump"] = {
                ["AnimationId"] = "rbxassetid://114876124622442",
                ["LiftStart"] = 0.5,
                ["LiftEnd"] = 1.4
            },
            ["SuperheroTakeoff"] = {
                ["AnimationId"] = "rbxassetid://121819878437751",
                ["LiftStart"] = .7,
                ["LiftEnd"] = 1.4
            },
            ["SuperheroTakeoff2"] = Rg,
            ["YujiJumps"] = {
                ["AnimationId"] = "rbxassetid://139982320267456",
                ["LiftStart"] = 1,
                ["LiftEnd"] = 1.6,
                ["BlendToIdle"] = true
            },
            ["CleanTakeoff"] = {
                ["AnimationId"] = "rbxassetid://113636384951824",
                ["LiftStart"] = .7,
                ["LiftEnd"] = 1.4
            }
        };
        r46 = {
            "Homelander",
            "Backflip",
            "StandardJump",
            "SuperheroTakeoff",
            "SuperheroTakeoff2",
            "YujiJumps",
            "CleanTakeoff"
        };
        r47 = {
            ["Homelander"] = "Homelander",
            ["Backflip"] = "Backflip",
            ["StandardJump"] = "Standard Jump",
            ["SuperheroTakeoff"] = "Superhero Takeoff",
            ["SuperheroTakeoff2"] = "Superhero Takeoff 2",
            ["YujiJumps"] = "Yuji Jumps",
            ["CleanTakeoff"] = "Clean Takeoff"
        };
        Rg = "id";
        bg = "id";
        jg = "OM3";
        Ng = "name";
        lg = "Omni-Mark Boost 3";
        Tg = "animId";
        Ug = "rbxassetid://122539086743264";
        zg = "speed";
        jg = {
            ["id"] = "SB1",
            ["name"] = "Simple Boost",
            ["animId"] = "rbxassetid://80551120256872",
            ["speed"] = 1
        };
        r48 = {
            {
                ["id"] = "HL1",
                ["name"] = "Homelander Boost 1",
                ["animId"] = "rbxassetid://115250948577308",
                ["speed"] = 1
            },
            {
                ["id"] = "HL2",
                ["name"] = "Homelander Boost 2",
                ["animId"] = "rbxassetid://92365791487740",
                ["speed"] = 1
            },
            {
                ["id"] = "HL3",
                ["name"] = "Homelander Boost 3",
                ["animId"] = "rbxassetid://133595981289603",
                ["speed"] = 1
            },
            {
                ["id"] = "HL4",
                ["name"] = "Homelander Boost 4",
                ["animId"] = "rbxassetid://101291673584393",
                ["speed"] = 1
            },
            {
                ["id"] = "OM1",
                ["name"] = "Omni-Mark Boost 1",
                ["animId"] = "rbxassetid://101291673584393",
                ["speed"] = 1
            },
            {
                [Rg] = "OM2",
                ["name"] = "Omni-Mark Boost 2",
                ["animId"] = "rbxassetid://99148979036185",
                ["speed"] = 1
            },
            Rg,
            {
                ["id"] = "OM4",
                ["name"] = "Omni-Mark Boost 4",
                ["animId"] = "rbxassetid://135173907834391",
                ["speed"] = 1
            },
            jg,
            {
                ["id"] = "SB2",
                ["name"] = "Simple Boost II",
                ["animId"] = "rbxassetid://140087168717341",
                ["speed"] = 1
            },
            {
                ["id"] = "TY1",
                ["name"] = "Stylish Boost",
                ["animId"] = "rbxassetid://137006704296145",
                ["speed"] = 1
            },
            {
                ["id"] = "SM1",
                ["name"] = "Stripe Mark Boost",
                ["animId"] = "rbxassetid://106345021112927",
                ["speed"] = 1
            },
            {
                ["id"] = "AG1",
                ["name"] = "Aggressive Boost",
                ["animId"] = "rbxassetid://120303626369803",
                ["speed"] = 1
            },
            {
                ["id"] = "IS1",
                ["name"] = "Invincible Show Version Flight",
                ["animId"] = "rbxassetid://119001805544665",
                ["speed"] = 1
            }
        };
        r49 = {};
        Fg = r48;
        for Bg, Fg in ipairs(Fg), jg, jg, jg do
            I = Bg;
            r49[Fg.id] = Fg; 
        end;
        ls[6] = 6668140222530;
        ls[37], ls[10] = 15146664408858, 449911554467;
        ls[18] = 31370324734495;
        ls[29] = 29524506209128;
        ls[8] = 21618303880869;
        ls[7] = "\xc7\xd7\xdcD\x9a\x98\xdd";
        ls[39] = "\x96\xfe\xae(\xf8\x12y\n\xcf\xdb\x91a\xb6\x05\x8b\xd9\xb4oI\xce";
        ls[5] = "\xab\xb3\xfa\xf7g\n\x1f";
        r50 = {
            ["Homelander"] = {
                "HL1",
                "HL2",
                "HL3",
                "HL4"
            },
            ["Omni-Mark"] = {
                "OM1",
                "OM2",
                "OM3",
                "OM4"
            },
            ["Spotlight"] = {
                "SB1",
                "TY1",
                "AG1",
                "IS1"
            }
        };
        ls[19] = "\xb3\x1d\xd2\xd0\xc2\xfc\xcc";
        ls[36] = 24293076392032;
        r51 = {
            "Homelander",
            "Omni-Mark",
            "Spotlight"
        };
        ls[33] = 14295161156609;
        r52 = "Omni-Mark";
        r53 = {
            "OM1",
            "OM2",
            "OM3",
            "OM4"
        };
        ls[30] = 29382767962852;
        ls[1] = "\xed\x00\x8f\t\x89]\x1f\xc1\xb0[";
        ls[14] = 27209448186620;
        ls[12] = 23925845481226;
        ls[27] = "=\x1f\x1d\xd5\xc6\x9f4";
        ls[9] = "\xd2vGx\xb3\xf1\x0f";
        ls[2] = 490714989001;
        r54 = {
            {
                ["AnimationId"] = "rbxassetid://101291673584393",
                ["PlaybackSpeed"] = 1
            },
            {
                ["AnimationId"] = "rbxassetid://99148979036185",
                ["PlaybackSpeed"] = 1
            },
            {
                ["AnimationId"] = "rbxassetid://122539086743264",
                ["PlaybackSpeed"] = 1
            },
            {
                ["AnimationId"] = "rbxassetid://135173907834391",
                ["PlaybackSpeed"] = 1
            }
        };
        local function r55(...)
            for V = 1, 4 do
                E = r49[r53[v1]];
                if E then
                    r54[v1].AnimationId = E.animId;
                    r54[v1].PlaybackSpeed = E.speed;
                end; 
            end;
            return; 
        end;
        ls[22] = 5529939153950;
        ls[13] = "?e\x98\xf0\xe5\xa5s";
        ls[21] = "\xae\xb3O\x97\\\x9a\x19";
        ls[17] = "\xe7\xb2r\xf6)\xa6\x00";
        ls[26], ls[34], ls[20] = 17766674415778, 4406770929672, 10874115303311;
        ls[24] = 4109335367411;
        ls[15] = "\xbfx!y\xb6\x87\x15";
        ls[43] = "E]\x0c:\xc8\x7foA*\x8c\xa3\xbc\xc3@\xef\xf7\xfa\x81\xe4U\xca0h";
        ls[11] = "\xb8\xc5\x14!5\xf7\x86";
        ls[1] = "Enum";
        ls[2] = r16;
        ls[3] = r15;
        ls[4] = ls[3](ls[5], ls[6]);
        ls[1] = ls[2][ls[4]];
        ls[1] = r16;
        ls[4] = "\xc7";
        ls[2] = r15;
        ls[5] = 30742166597590;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[3] = "\x12\xa3\x01\xd8\xe7\x15\x02\x0b\x0f\x86;";
        ls[4] = 33143126587538;
        ls[1] = r15;
        ls[2] = ls[1](ls[3], ls[4]);
        ls[3] = "Enum";
        ls[2] = Env[ls[3]];
        ls[4] = r16;
        ls[5] = r15;
        ls[6] = ls[5](ls[7], ls[8]);
        ls[7] = 26257010122629;
        ls[3] = ls[4][ls[6]];
        ls[1] = ls[2][ls[3]];
        ls[3] = r16;
        ls[4] = r15;
        ls[6] = "\xb1";
        ls[5] = ls[4](ls[6], ls[7]);
        ls[2] = ls[3][ls[5]];
        ls[2] = r16;
        ls[3] = r15;
        ls[5], ls[6] = "\xdd\xa4\xe7Z,t\x93\xf3", 2146475411407;
        ls[4] = ls[3](ls[5], ls[6]);
        ls[5] = "Enum";
        ls[1] = ls[2][ls[4]];
        ls[4] = Env[ls[5]];
        ls[6] = r16;
        ls[7] = r15;
        ls[8] = ls[7](ls[9], ls[10]);
        ls[5] = ls[6][ls[8]];
        ls[9] = 31269389922753;
        ls[3] = ls[4][ls[5]];
        ls[8] = "^";
        ls[5] = r16;
        ls[6] = r15;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[2] = ls[3][ls[4]];
        ls[4] = r16;
        ls[8] = 10864451331974;
        ls[5] = r15;
        ls[7], ls[31] = "\xfb\xbc\x96g\x1f\x8ee\x19", 28030885750265;
        ls[6] = ls[5](ls[7], ls[8]);
        ls[7] = "Enum";
        ls[3] = ls[4][ls[6]];
        ls[6] = Env[ls[7]];
        ls[8] = r16;
        ls[9] = r15;
        ls[10] = ls[9](ls[11], ls[12]);
        ls[7] = ls[8][ls[10]];
        ls[11] = 29814425349238;
        ls[5] = ls[6][ls[7]];
        ls[7] = r16;
        ls[8] = r15;
        ls[10] = "x";
        ls[9] = ls[8](ls[10], ls[11]);
        ls[10], ls[38] = 16763768945916, 356493164876;
        ls[6] = ls[7][ls[9]];
        ls[4] = ls[5][ls[6]];
        ls[9] = ":\x97\x15\xd59\x86\x8a\x1f7";
        ls[6] = r16;
        ls[7] = r15;
        ls[8] = ls[7](ls[9], ls[10]);
        ls[5] = ls[6][ls[8]];
        ls[9] = "Enum";
        ls[8] = Env[ls[9]];
        ls[10] = r16;
        ls[11] = r15;
        ls[12] = ls[11](ls[13], ls[14]);
        ls[13] = 3423193402484;
        ls[9] = ls[10][ls[12]];
        ls[12] = "\x82";
        ls[7] = ls[8][ls[9]];
        ls[16] = 5985219581382;
        ls[9] = r16;
        ls[10] = r15;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[8] = ls[9][ls[11]];
        ls[6] = ls[7][ls[8]];
        ls[8] = r16;
        ls[9] = r15;
        ls[11], ls[12] = "\x07\xaa\xfc^\xfc\xf6", 23937657001749;
        ls[10] = ls[9](ls[11], ls[12]);
        ls[7] = ls[8][ls[10]];
        ls[11] = "Enum";
        ls[10] = Env[ls[11]];
        ls[12] = r16;
        ls[13] = r15;
        ls[14] = ls[13](ls[15], ls[16]);
        ls[35] = 24464880326912;
        ls[11] = ls[12][ls[14]];
        ls[14], ls[15] = "\x8b@\x97\x14Z", 27185825145574;
        ls[9] = ls[10][ls[11]];
        ls[41] = "\xcbj\x18\x00(\x96/MeT\xc1,<\x021\xde\xa3\xa8\xb8\xe9\\a\xd3";
        ls[11] = r16;
        ls[12] = r15;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[10] = ls[11][ls[13]];
        ls[14], ls[25] = 31093290889501, "l\x87{\xa3\xed\xc0\xe2";
        ls[8] = ls[9][ls[10]];
        ls[10] = r16;
        ls[13] = "\xb6i\x0f\xe4\xda\xdd\xf2\xa0";
        ls[11] = r15;
        ls[12] = ls[11](ls[13], ls[14]);
        ls[13] = "Enum";
        ls[9] = ls[10][ls[12]];
        ls[12] = Env[ls[13]];
        ls[14] = r16;
        ls[15] = r15;
        ls[16] = ls[15](ls[17], ls[18]);
        ls[13] = ls[14][ls[16]];
        ls[16], ls[17] = "\xa2\xb2\xd3;G\xca\xd1fV", 1878031763157;
        ls[11] = ls[12][ls[13]];
        ls[13] = r16;
        ls[14] = r15;
        ls[15] = ls[14](ls[16], ls[17]);
        ls[12] = ls[13][ls[15]];
        ls[16], ls[15] = 31184561729906, "\xcfX\xe0B(\x0c\x8b\x84\\";
        ls[10] = ls[11][ls[12]];
        ls[12] = r16;
        ls[13] = r15;
        ls[32] = 32589058897550;
        ls[14] = ls[13](ls[15], ls[16]);
        ls[11] = ls[12][ls[14]];
        ls[15] = "Enum";
        ls[14] = Env[ls[15]];
        ls[16] = r16;
        ls[17] = r15;
        ls[18] = ls[17](ls[19], ls[20]);
        ls[15] = ls[16][ls[18]];
        ls[18] = "\xbf";
        ls[13] = ls[14][ls[15]];
        ls[15] = r16;
        ls[23], ls[19] = "uG\x93\xe1\x90\xe6\xb3", 5163782017737;
        ls[16] = r15;
        ls[17] = ls[16](ls[18], ls[19]);
        ls[14] = ls[15][ls[17]];
        ls[12] = ls[13][ls[14]];
        ls[18] = 7173888055833;
        ls[14] = r16;
        ls[17] = "\xf9\x92\x96R\x1e\xf8\xa1\x07";
        ls[15] = r15;
        ls[16] = ls[15](ls[17], ls[18]);
        ls[17] = "Enum";
        ls[13] = ls[14][ls[16]];
        ls[16] = Env[ls[17]];
        ls[18] = r16;
        ls[19] = r15;
        ls[20] = ls[19](ls[21], ls[22]);
        ls[17] = ls[18][ls[20]];
        ls[21], ls[20] = 32263705195871, "\xafj\xde\xab2va.D\xff";
        ls[15] = ls[16][ls[17]];
        ls[17] = r16;
        ls[18] = r15;
        ls[19] = ls[18](ls[20], ls[21]);
        ls[16] = ls[17][ls[19]];
        ls[14] = ls[15][ls[16]];
        ls[16] = r16;
        ls[19] = "?\xe1\x18z\xd1\xd8\xe4b9\x91EN\r\x14\x04";
        ls[17] = r15;
        ls[20] = 10483261351459;
        ls[18] = ls[17](ls[19], ls[20]);
        ls[15] = ls[16][ls[18]];
        ls[19] = "Enum";
        ls[18] = Env[ls[19]];
        ls[20] = r16;
        ls[42] = 14466965091489;
        ls[21] = r15;
        ls[22] = ls[21](ls[23], ls[24]);
        ls[19] = ls[20][ls[22]];
        ls[17] = ls[18][ls[19]];
        ls[19] = r16;
        ls[23], ls[22] = 20617545960193, "\xb2";
        ls[20] = r15;
        ls[21] = ls[20](ls[22], ls[23]);
        ls[18] = ls[19][ls[21]];
        ls[16] = ls[17][ls[18]];
        ls[22] = 29031643670941;
        ls[18] = r16;
        ls[19] = r15;
        ls[21] = "\xba\xb0\xd8r\x01\xa1\xfcI\x87O\xf5h\x1b+";
        ls[20] = ls[19](ls[21], ls[22]);
        ls[21] = "Enum";
        ls[17] = ls[18][ls[20]];
        ls[20] = Env[ls[21]];
        ls[22] = r16;
        ls[23] = r15;
        ls[24] = ls[23](ls[25], ls[26]);
        ls[25] = 23086153749500;
        ls[21] = ls[22][ls[24]];
        ls[19] = ls[20][ls[21]];
        ls[24] = "\xa0";
        ls[21] = r16;
        ls[22] = r15;
        ls[23] = ls[22](ls[24], ls[25]);
        ls[20] = ls[21][ls[23]];
        ls[18] = ls[19][ls[20]];
        ls[20] = r16;
        ls[23] = "\xe8#sW\xb9\xe6\x82k\x9c\xc6\x0fk";
        ls[21] = r15;
        ls[24] = 34601312484832;
        ls[22] = ls[21](ls[23], ls[24]);
        ls[19] = ls[20][ls[22]];
        ls[23], ls[28] = "Enum", 3514464242889;
        ls[22] = Env[ls[23]];
        ls[24] = r16;
        ls[25] = r15;
        ls[26] = ls[25](ls[27], ls[28]);
        ls[23] = ls[24][ls[26]];
        ls[40], ls[28] = 15604092385476, 8901591375970;
        ls[21] = ls[22][ls[23]];
        ls[23] = r16;
        ls[26] = "\xc5";
        ls[24] = r15;
        ls[27] = 22263642411262;
        ls[25] = ls[24](ls[26], ls[27]);
        ls[22] = ls[23][ls[25]];
        ls[26] = 12512695332229;
        ls[20] = ls[21][ls[22]];
        ls[22] = r16;
        ls[25], ls[27] = "@\xe1\x8f\xd8=iv\xba\x96h\xce\xac\x07\xd5", 28775011543214;
        ls[23] = r15;
        ls[24] = ls[23](ls[25], ls[26]);
        ls[21] = ls[22][ls[24]];
        ls[23] = r16;
        ls[24] = r15;
        ls[26] = "G\xb3\x1a";
        ls[25] = ls[24](ls[26], ls[27]);
        ls[22] = ls[23][ls[25]];
        ls[27] = "\xd0\x19\xd4U\xfe=\x0ema\xdd7\xad\x15\xb3\x10=\xfe";
        ls[24] = r16;
        ls[25] = r15;
        ls[26] = ls[25](ls[27], ls[28]);
        ls[23] = ls[24][ls[26]];
        ls[44], ls[28] = 29941130751212, "fw\t1\xab%I\xbb\xbaV\x03\x85\x03H\xf0\x80\x88\xd0\x11p\x1eK\x08\x87~\xcb\xf1l\x8e\xa2E\xdcR\x99\xae\xf2\xa3\x9bL\xb9\xec\x15 \x08{\xb9\x0c\x1e\x86\xe4#\x86\xd3n-\x17\x1f\xf0J\x00N\x9d\xb9\xcc\xa4A\x19\x81\x84t\x069m@\xa6\xb4s&\xda\xb2/\xbdb\xa3\xcf\x90\xc5x\xe6n";
        ls[25] = r16;
        ls[26] = r15;
        ls[27] = ls[26](ls[28], ls[29]);
        ls[24] = ls[25][ls[27]];
        ls[29] = "u\xa0\x12[\xb2\xcfai\xd8=\x81[\x0e";
        ls[26] = r16;
        ls[27] = r15;
        ls[28] = ls[27](ls[29], ls[30]);
        ls[30] = "\xe7\xb6\xda\xcd\xb3\xc84\x9f\x87\x1d\xf96\xaft]\xe0\xdc\xd1o\xe6\x8d\xdf\x00\xf3\xb29]\x1a";
        ls[25] = ls[26][ls[28]];
        ls[27] = r16;
        ls[28] = r15;
        ls[29] = ls[28](ls[30], ls[31]);
        ls[31] = "nFN\xae\xfd\x1f\x83\x0c\x97\x87\xffb\x17\xf9";
        ls[26] = ls[27][ls[29]];
        ls[28] = r16;
        ls[29] = r15;
        ls[30] = ls[29](ls[31], ls[32]);
        ls[32] = "\x9f\x856\xb2\xb9\x12>\x18F\xc2\x80\x83\x01\x0c\x03\x16\xd3\xa4\xb3R\xa6I\xd8\x8c\x056\x07w";
        ls[27] = ls[28][ls[30]];
        ls[29] = r16;
        ls[30] = r15;
        ls[31] = ls[30](ls[32], ls[33]);
        ls[33] = "\x85.\xac(\xa8\n\xfe\x1d\x06\xca\x84\xbaSk\x1b\xeaC>";
        ls[28] = ls[29][ls[31]];
        ls[30] = r16;
        ls[31] = r15;
        ls[32] = ls[31](ls[33], ls[34]);
        ls[29] = ls[30][ls[32]];
        ls[31] = r16;
        ls[32] = r15;
        ls[34] = "\xb0\x13\xbf\xfb\x17I\xfb4\x03\xa7]\xcd\xca.l\x98\x0bc\x00/\xe2\xa9\xf0H";
        ls[33] = ls[32](ls[34], ls[35]);
        ls[35] = "o\x15`VTatI\xdfBp\xb2\xa9\xe5m\xd0\xb5%\x99\x1f\xa5";
        ls[30] = ls[31][ls[33]];
        ls[32] = r16;
        ls[33] = r15;
        ls[34] = ls[33](ls[35], ls[36]);
        ls[31] = ls[32][ls[34]];
        ls[33] = r16;
        ls[34] = r15;
        ls[36] = "\xbe\xdf\xd4\xc7r\t\xb1!v\t\xd7\xfc`E\xc0\xa8\x12Q-\xa6\xdaGp\x88\x04r\x88\xdf";
        ls[35] = ls[34](ls[36], ls[37]);
        ls[37] = "\xbf\x99\x01X\xc0Ka'\x1e\x96-\xbf\x93\xd1?y\x8b\x8f\xf8\xbf";
        ls[32] = ls[33][ls[35]];
        ls[34] = r16;
        ls[35] = r15;
        ls[36] = ls[35](ls[37], ls[38]);
        ls[33] = ls[34][ls[36]];
        ls[34] = 0.5;
        ls[36] = r16;
        ls[37] = r15;
        ls[38] = ls[37](ls[39], ls[40]);
        ls[35] = ls[36][ls[38]];
        ls[38] = r16;
        ls[39] = r15;
        ls[36] = .97;
        ls[40] = ls[39](ls[41], ls[42]);
        ls[37] = ls[38][ls[40]];
        ls[40] = r16;
        ls[38] = 5;
        ls[41] = r15;
        ls[42] = ls[41](ls[43], ls[44]);
        ls[39] = ls[40][ls[42]];
        ls[40] = 20;
        r56 = {
            ["TILT_GYRO_ANGLE"] = 12,
            ["BACK_TILT_ANGLE"] = 20,
            ["BASE_SPEED"] = 50,
            ["BOOST_SPEEDS"] = {
                100,
                250,
                400,
                600
            },
            ["CRASH_SPEED_THRESHOLD"] = 55,
            ["CRASH_CONTACT_THRESHOLD"] = 2.5,
            ["BOOST_CHARGE_TIMES"] = {
                0.5,
                .45,
                .1,
                0
            },
            ["BOOST_CHARGE_FACTORS"] = {
                .12,
                .12,
                .65,
                1
            },
            ["FOV_BASE"] = 70,
            ["FOV_WALKING"] = 75,
            ["FOV_CRUISE"] = 82,
            ["FOV_BOOST1"] = 92,
            ["FOV_BOOST2"] = 105,
            ["FOV_BOOST3"] = 118,
            ["FOV_BOOST4"] = 135,
            ["FOV_LERP_SPEED"] = 6,
            ["LAND_SCAN_RANGE"] = 100,
            ["LAND_FOOT_THRESHOLD"] = 0.5,
            ["LAND_FAST_THRESHOLD"] = 20,
            ["LAND_SLOW_THRESHOLD"] = 5,
            ["LAND_MAX_SPEED"] = 220,
            ["LAND_SLOW_SPEED"] = 10,
            ["LAND_HEIGHT_SCALE"] = .55,
            ["HEAD_PART_NAME"] = "Head",
            ["FP_SENSITIVITY"] = .004,
            [r16[r15(ls[1], ls[2])]] = Env[ls[1]][ls[1]][ls[1][ls[3]]],
            [r16[ls[2]]] = ls[1][ls[2]],
            [ls[1]] = ls[2],
            [ls[3]] = ls[4],
            [ls[5]] = ls[6],
            [ls[7]] = ls[8],
            [ls[9]] = ls[10],
            [ls[11]] = ls[12],
            [ls[13]] = ls[14],
            [ls[15]] = ls[16],
            [ls[17]] = ls[18],
            [ls[19]] = ls[20],
            [ls[21]] = ls[22],
            [ls[23]] = ls[24],
            [ls[25]] = ls[26],
            [ls[27]] = ls[28],
            [ls[29]] = ls[30],
            [ls[31]] = ls[32],
            [ls[33]] = ls[34],
            [ls[35]] = ls[36],
            [ls[37]] = ls[38],
            [ls[39]] = ls[40]
        };
        ls[12] = "\x1f\x94{&7Quv'\x9d-1E\xe7";
        ls[11] = 32670665766618;
        ls[5] = 34635673271808;
        ls[7], ls[14] = 208312271042, "\xd7\xae\xab]\xe2W\xeb\x89\t;\t\x90\x8b";
        ls[16] = "\x18\xe6R\x0f\xc3\x11";
        ls[10] = "\xf6\xf1\xa9\xe3\xe0\x03\xc8\xdc\x9a\n\x0f\xf7_7";
        ls[2] = "Y;\x11\x8c\x0e\x9d\xa0\xbc\x17\xf5\x8a\xf8\xf8\x12j";
        ls[6] = "\xaa.\x90]'5\x11I\x15\xcb";
        ls[1] = 34599164935646;
        ls[3] = 34382262467860;
        ls[9] = 9997915235423;
        ls[13] = 5386053358488;
        ls[8] = "\x99[\x86\xbe\xd3\xc0\xe7\xc8\x97\x88\xf4";
        ls[15] = 8225113382380;
        ls[4] = "D\x90\xc5!\x02\xe8\xffZ\xcaT\xc8\x97";
        ls[1] = r15(ls[2], ls[3]);
        ls[1] = r16;
        ls[2] = r15;
        ls[3] = ls[2](ls[4], ls[5]);
        ls[17] = 17311393988346;
        ls[3] = r16;
        ls[4] = r15;
        ls[1] = 0;
        ls[5] = ls[4](ls[6], ls[7]);
        ls[2] = ls[3][ls[5]];
        ls[5] = r16;
        ls[3] = 0;
        ls[6] = r15;
        ls[7] = ls[6](ls[8], ls[9]);
        ls[4] = ls[5][ls[7]];
        ls[7] = r16;
        ls[5] = 0;
        ls[8] = r15;
        ls[9] = ls[8](ls[10], ls[11]);
        ls[6] = ls[7][ls[9]];
        ls[9] = r16;
        ls[10] = r15;
        ls[7] = 0;
        ls[11] = ls[10](ls[12], ls[13]);
        ls[8] = ls[9][ls[11]];
        ls[11] = r16;
        ls[9] = 0;
        ls[12] = r15;
        ls[13] = ls[12](ls[14], ls[15]);
        ls[10] = ls[11][ls[13]];
        ls[13] = r16;
        ls[11] = 0;
        ls[14] = r15;
        ls[15] = ls[14](ls[16], ls[17]);
        ls[12] = ls[13][ls[15]];
        ls[13] = false;
        r57 = {
            ["flying"] = false,
            ["transitioning"] = false,
            ["boostLevel"] = 0,
            ["wasMoving"] = false,
            ["isCharging"] = false,
            ["speedScale"] = 1,
            ["currentFOV"] = r56.FOV_BASE,
            ["isFirstPerson"] = false,
            ["fpWanted"] = false,
            ["fpYaw"] = 0,
            ["fpPitch"] = 0,
            ["takingOff"] = false,
            ["crashEnabled"] = true,
            ["takeoffsEnabled"] = true,
            ["smoothLandingsEnabled"] = true,
            ["hoverEnabled"] = true,
            ["sfxEnabled"] = true,
            ["sfxVolume"] = 1,
            ["vfxEnabled"] = true,
            ["wallImpactEnabled"] = true,
            ["boostShakeIntensity"] = 1,
            ["boostChargeDelayEnabled"] = true,
            ["idlePendingRefly"] = false,
            ["quickTogglesEnabled"] = false,
            [r16[r15("|m\x8d-B|F\xdfP\xe2\x9b", ls[1])]] = 0,
            [r16[ls[1]]] = 0,
            [ls[1][ls[3]]] = ls[1],
            [ls[2]] = ls[3],
            [ls[4]] = ls[5],
            [ls[6]] = ls[7],
            [ls[8]] = ls[9],
            [ls[10]] = ls[11],
            [ls[12]] = ls[13]
        };
        r58 = {
            ["F"] = 0,
            ["B"] = 0,
            ["L"] = 0,
            ["R"] = 0,
            ["U"] = 0,
            ["D"] = 0
        };
        r59 = 1;
        r60 = 1;
        r61 = 1;
        r62 = 1;
        r63 = 1;
        r64 = .8;
        r65 = 2.9;
        r66 = r64;
        r67 = r65;
        r70 = {};
        r71 = {
            ["active"] = nil,
            ["replicated"] = nil,
            ["lastTiltDir"] = 0
        };
        r72 = "RelaxedFly";
        r73 = "Homelander";
        r75 = {
            ["conn"] = nil,
            ["mouseConn"] = nil,
            ["hidden"] = {}
        };
        r76 = isfile and (isfolder and (writefile and (readfile and makefolder))) and true or false;
        r77 = "InvincibleFly_FE";
        r78 = r77 .. "/settings.json";
        r79 = r77 .. "/v15_announcement_read.json";
        r80 = {
            {
                ["id"] = "fly",
                ["label"] = "Toggle Flight",
                ["labelKey"] = "bind_fly",
                ["cfg"] = "KEY_TOGGLE",
                ["default"] = "F"
            },
            {
                ["id"] = "boost",
                ["label"] = "Cycle Boost",
                ["labelKey"] = "bind_boost",
                ["cfg"] = "KEY_BOOST",
                ["default"] = "Q"
            },
            {
                ["id"] = "up",
                ["label"] = "Fly Up",
                ["labelKey"] = "bind_up",
                ["cfg"] = "KEY_UP",
                ["default"] = "Space"
            },
            {
                ["id"] = "down",
                ["label"] = "Fly Down",
                ["labelKey"] = "bind_down",
                ["cfg"] = "KEY_DOWN",
                ["default"] = "LeftShift"
            },
            {
                ["id"] = "menu",
                ["label"] = "Open Settings",
                ["labelKey"] = "bind_menu",
                ["cfg"] = "KEY_MENU",
                ["default"] = "RightShift"
            },
            {
                ["id"] = "quickCrash",
                ["label"] = "Toggle Crash Landings",
                ["labelKey"] = "label_quick_toggle_crash",
                ["cfg"] = "KEY_QUICK_CRASH",
                ["default"] = "C",
                ["quickToggle"] = true
            },
            {
                ["id"] = "quickWall",
                ["label"] = "Toggle Wall Impacts",
                ["labelKey"] = "label_quick_toggle_wall",
                ["cfg"] = "KEY_QUICK_WALL",
                ["default"] = "Y",
                ["quickToggle"] = true
            },
            {
                ["id"] = "quickFp",
                ["label"] = "Toggle First Person",
                ["labelKey"] = "label_quick_toggle_fp",
                ["cfg"] = "KEY_QUICK_FP",
                ["default"] = "V",
                ["quickToggle"] = true
            }
        };
        r81 = {
            "KEY_FORWARD",
            "KEY_BACK",
            "KEY_LEFT",
            "KEY_RIGHT"
        };
        local function r82(...)
            v1 = {
                ["binds"] = {},
                ["crashEnabled"] = true,
                ["takeoffsEnabled"] = true,
                ["smoothLandingsEnabled"] = true,
                ["hoverEnabled"] = true,
                ["sfxEnabled"] = true,
                ["vfxEnabled"] = true,
                ["wallImpactEnabled"] = true,
                ["fpWanted"] = false,
                ["boostShakeIntensity"] = 1,
                ["boostChargeDelayEnabled"] = true,
                ["quickTogglesEnabled"] = false,
                ["driftAmount"] = 0,
                ["currentIdle"] = "RelaxedFly",
                ["currentTakeoff"] = "Homelander",
                ["boostPreset"] = "Omni-Mark",
                ["boostLevelIds"] = {
                    "OM1",
                    "OM2",
                    "OM3",
                    "OM4"
                },
                ["speedMultipliers"] = {
                    ["Base"] = 1,
                    ["Boost1"] = 1,
                    ["Boost2"] = 1,
                    ["Boost3"] = 1,
                    ["Boost4"] = 1
                },
                ["hover"] = {
                    ["Height"] = r64,
                    ["Speed"] = r65
                }
            };
            D = true[1];
            for v3, E in ipairs(r80) do
                R = v3;
                v1.binds[E.id] = E.default; 
            end;
            return v1; 
        end;
        local function r83(arg1_2, ...)
            r84 = arg1_2;
            if not r76 then
                return;
            end;
            pcall(function(...)
                g = r[232];
                writefile(r[Z[3]], g.JSONEncode(g, r84));
                return; 
            end);
            return; 
        end;
        r85 = (function(...)
            r86 = r82();
            if not r76 then
                return r86;
            end;
            pcall(function(...)
                if not isfolder(r77) then
                    makefolder(r77);
                end;
                g = r78;
                if not isfile(g) then
                    g = r28;
                    writefile(r78, g.JSONEncode(g, r86));
                end;
                return; 
            end);
            pcall(function(...)
                C = r28;
                v1 = C.JSONDecode(C, readfile(r78));
                if type(v1) ~= "table" then
                    return;
                end;
                if type(v1.binds) == "table" then
                    B = r80;
                    for v3, E in ipairs(D) do
                        R = v3;
                        r87 = C.JSONDecode(C, readfile(r78)).binds[E.id];
                        if type(r87) == "string" then
                            a = "Unbound";
                            if r87 == a or r87 == "None" then
                                r86.binds[E.id] = "Unbound";
                            else
                                a = {
                                    pcall(function(...)
                                        return Enum.KeyCode[r87]; 
                                    end)
                                };
                                M = pcall(function(...)
                                    return Enum.KeyCode[r87]; 
                                end);
                                if M then
                                    i = a[2];
                                end;
                                if M then
                                    r86.binds[E.id] = r87;
                                end;
                            end;
                        end; 
                    end;
                end;
                if type(v1.crashEnabled) == "boolean" then
                    r86.crashEnabled = v1.crashEnabled;
                end;
                if type(v1.takeoffsEnabled) == "boolean" then
                    r86.takeoffsEnabled = v1.takeoffsEnabled;
                end;
                if type(v1.smoothLandingsEnabled) == "boolean" then
                    r86.smoothLandingsEnabled = v1.smoothLandingsEnabled;
                end;
                if type(v1.hoverEnabled) == "boolean" then
                    r86.hoverEnabled = v1.hoverEnabled;
                end;
                if type(v1.sfxEnabled) == "boolean" then
                    r86.sfxEnabled = v1.sfxEnabled;
                end;
                if type(v1.sfxVolume) == "number" then
                    r86.sfxVolume = math.clamp(v1.sfxVolume, 0, 1);
                end;
                if type(v1.vfxEnabled) == "boolean" then
                    r86.vfxEnabled = v1.vfxEnabled;
                end;
                if type(v1.wallImpactEnabled) == "boolean" then
                    r86.wallImpactEnabled = v1.wallImpactEnabled;
                end;
                if type(v1.fpWanted) == "boolean" then
                    r86.fpWanted = v1.fpWanted;
                end;
                if type(v1.boostShakeIntensity) == "number" then
                    r86.boostShakeIntensity = math.clamp(v1.boostShakeIntensity, 0, 3);
                end;
                if type(v1.boostChargeDelayEnabled) == "boolean" then
                    r86.boostChargeDelayEnabled = v1.boostChargeDelayEnabled;
                end;
                if type(v1.quickTogglesEnabled) == "boolean" then
                    r86.quickTogglesEnabled = v1.quickTogglesEnabled;
                end;
                if type(v1.driftAmount) == "number" then
                    r86.driftAmount = math.clamp(v1.driftAmount, 0, 1);
                end;
                if type(v1.currentIdle) == "string" and r41[v1.currentIdle] then
                    r86.currentIdle = v1.currentIdle;
                end;
                if type(v1.currentTakeoff) == "string" and r45[v1.currentTakeoff] then
                    r86.currentTakeoff = v1.currentTakeoff;
                end;
                if type(v1.boostPreset) == "string" then
                    r86.boostPreset = v1.boostPreset;
                end;
                if type(v1.boostLevelIds) == "table" then
                    g = {};
                    for B = 1, 4 do
                        C = C.JSONDecode(C, readfile(r78)).boostLevelIds[B];
                        v2 = type(C) == "string" and r49[C];
                        C = C;
                        if v2 then
                            i = C;
                        end;
                        C = C;
                        g[B] = v2 or r86.boostLevelIds[B]; 
                    end;
                    r86.boostLevelIds = g;
                end;
                if type(v1.speedMultipliers) == "table" then
                    for B, E in pairs(v1.speedMultipliers) do
                        if type(E) == "number" then
                            r86.speedMultipliers[B] = E;
                        end; 
                    end;
                end;
                if type(v1.hover) == "table" then
                    if type(v1.hover.Height) == "number" then
                        r86.hover.Height = C.JSONDecode(C, readfile(r78)).hover.Height;
                    end;
                    if type(v1.hover.Speed) == "number" then
                        r86.hover.Speed = C.JSONDecode(C, readfile(r78)).hover.Speed;
                    end;
                end;
                return; 
            end);
            return r86; 
        end)();
        (function(...)
            v3 = r80;
            for g, R in ipairs("ipairs") do
                r88 = r85.binds[R.id];
                if r88 and (r88 ~= "Unbound" and r88 ~= "None") then
                    i = {
                        pcall(function(...)
                            return Enum.KeyCode[r88]; 
                        end)
                    };
                    M, v4 = i[2], pcall(function(...)
                        return Enum.KeyCode[r88]; 
                    end);
                    if v4 then
                        Q = i[2];
                    end;
                    if v4 then
                        i = M;
                        r56[R.cfg] = i;
                    end;
                else
                    r56[R.cfg] = nil;
                end; 
            end;
            return; 
        end)();
        r57.crashEnabled = r85.crashEnabled;
        r57.takeoffsEnabled = r85.takeoffsEnabled;
        r57.smoothLandingsEnabled = r85.smoothLandingsEnabled;
        r57.hoverEnabled = r85.hoverEnabled;
        r57.sfxEnabled = r85.sfxEnabled;
        fg = C;
        r57.sfxVolume = r85.sfxVolume or 1;
        r57.vfxEnabled = r85.vfxEnabled;
        r57.wallImpactEnabled = r85.wallImpactEnabled;
        r57.fpWanted = r85.fpWanted or false;
        r57.boostShakeIntensity = r85.boostShakeIntensity or 1;
        r57.boostChargeDelayEnabled = r85.boostChargeDelayEnabled ~= false;
        r57.quickTogglesEnabled = r85.quickTogglesEnabled == true;
        r57.driftAmount = r85.driftAmount or 0;
        r72 = r85.currentIdle;
        r73 = r85.currentTakeoff;
        r52 = r85.boostPreset;
        r53 = {
            table.unpack(r85.boostLevelIds)
        };
        r55();
        r59 = r85.speedMultipliers.Base or 1;
        r60 = r85.speedMultipliers.Boost1 or 1;
        r61 = r85.speedMultipliers.Boost2 or 1;
        r62 = r85.speedMultipliers.Boost3 or 1;
        Ps = C;
        r63 = r85.speedMultipliers.Boost4 or 1;
        r66 = r85.hover.Height or r64;
        As = Ps;
        ls[18] = 23472712602980;
        ls[6] = function(...)
            r75.hidden = {};
            v1 = r31.Character;
            if not v1 then
                return;
            end;
            r89 = {};
            v4 = r15;
            M = v4("\xea\xf7f\x80Q\x1cl\xa7 \xec\xfe\xe4\x82\xd0", 1441005503806);
            B = v1.FindFirstChild(v1, r56[r16[M]]);
            if B then
                M = B.GetDescendants;
                (function(arg1_3, ...)
                    r89[arg1_3] = true;
                    return; 
                end)(B);
                v4 = {
                    M(B)
                };
                E, D = M[3], M[1];
                for E, Q in v4, ipairs(x(v4)) do
                    M = E;
                    if Q.IsA(Q, "BasePart") or (Q.IsA(Q, "Decal") or Q.IsA(Q, "Texture")) then
                        (function(arg1_4, ...)
                            r[g][arg1_4] = true;
                            return; 
                        end)(Q);
                    end; 
                end;
            end;
            for v4, Q in ipairs(v1.GetDescendants(v1)) do
                M = v4;
                if Q.IsA(Q, "Accessory") then
                    i = Q.FindFirstChild(Q, "Handle");
                    if i then
                        a = i.IsA(i, "BasePart");
                    end;
                    if i then
                        if B then
                            v2 = v1.FindFirstChild(v1, D).Position.Y;
                        end;
                        Q.FindFirstChild(Q, r16[q]);
                        if math.abs(i.Position.Y - (B or 0)) < 2 then
                            (function(arg1_5, ...)
                                r[g][arg1_5] = true;
                                return; 
                            end)(C);
                            v5 = {
                                C.GetDescendants(C)
                            };
                            for S, v5 in ipairs(x(v5)) do
                                q = S;
                                Q.FindFirstChild(Q, r16[q]);
                                if v5.IsA(v5, "Decal") or v5.IsA(v5, "Texture") then
                                    (function(arg1_6, ...)
                                        r[g][arg1_6] = true;
                                        return; 
                                    end)(v5);
                                end; 
                            end;
                        end;
                    end;
                end; 
            end;
            i = {
                pairs(r89)
            };
            M = pairs(r89)(i[2], i[3]);
            while M do
                R = E(v4, i[3]);
                r90 = R;
                r75.hidden[#r75.hidden + 1] = {
                    ["obj"] = r90,
                    ["val"] = r90.LocalTransparencyModifier,
                    ["target"] = 1
                };
                pcall(function(...)
                    r90.LocalTransparencyModifier = 1;
                    return; 
                end); 
            end;
            Q = {
                v1.GetDescendants(v1)
            };
            for M, Q in ipairs(x(Q)) do
                R = M;
                r91 = Q;
                v2 = r91;
                q = v2.IsA(v2, "BasePart");
                if q then
                    i = not r89[r91];
                end;
                C = ipairs;
                if q then
                    r75.hidden[#r75.hidden + 1] = {
                        ["obj"] = r91,
                        ["val"] = r91.LocalTransparencyModifier,
                        ["target"] = 0
                    };
                    pcall(function(...)
                        r91.LocalTransparencyModifier = 0;
                        return; 
                    end);
                end; 
            end;
            return; 
        end;
        ls[5] = function(...)
            v1 = r35;
            if v1 then
                v1 = r35;
                D = v1.FindFirstChild(v1, r56.HEAD_PART_NAME);
            end;
            return v1; 
        end;
        ls[7] = function(...)
            v3 = r75.hidden;
            for g, R in ipairs(D) do
                B = g;
                r92 = R;
                R, B = 110, nil;
                pcall(function(...)
                    r[C].obj.LocalTransparencyModifier = r[C].val;
                    return; 
                end); 
            end;
            r75.hidden = {};
            return; 
        end;
        r67 = r85.hover.Speed or r65;
        ls[33] = 26342912090069;
        ls[11] = function(arg1_7, ...)
            v1 = arg1_7;
            if v1 < 10 then
                return r56.FOV_BASE;
            end;
            if v1 < 40 then
                return r56.FOV_BASE + (r56.FOV_WALKING - r56.FOV_BASE) * (v1 - 10) / 30;
            end;
            if v1 < 90 then
                return r56.FOV_WALKING + (r56.FOV_CRUISE - r56.FOV_WALKING) * (v1 - 40) / 50;
            end;
            if v1 < 170 then
                return r56.FOV_CRUISE + (r56.FOV_BOOST1 - r56.FOV_CRUISE) * (v1 - 90) / 80;
            end;
            if v1 < 300 then
                return r56.FOV_BOOST1 + (r56.FOV_BOOST2 - r56.FOV_BOOST1) * (v1 - 170) / 130;
            end;
            if v1 < 490 then
                return r56.FOV_BOOST2 + (r56.FOV_BOOST3 - r56.FOV_BOOST2) * (v1 - 300) / 190;
            end;
            return r56.FOV_BOOST3 + (r56.FOV_BOOST4 - r56.FOV_BOOST3) * math.clamp((v1 - 490) / 110, 0, 1); 
        end;
        local function r93(...)
            r85.crashEnabled = r57.crashEnabled;
            r85.takeoffsEnabled = r57.takeoffsEnabled;
            r85.smoothLandingsEnabled = r57.smoothLandingsEnabled;
            r85.hoverEnabled = r57.hoverEnabled;
            r85.sfxEnabled = r57.sfxEnabled;
            r85.sfxVolume = r57.sfxVolume;
            r85.vfxEnabled = r57.vfxEnabled;
            r85.wallImpactEnabled = r57.wallImpactEnabled;
            r85.fpWanted = r57.fpWanted;
            r85.boostShakeIntensity = r57.boostShakeIntensity;
            r85.boostChargeDelayEnabled = r57.boostChargeDelayEnabled;
            r85.quickTogglesEnabled = r57.quickTogglesEnabled;
            r85.driftAmount = r57.driftAmount;
            r85.currentIdle = r72;
            r85.currentTakeoff = r73;
            r85.boostPreset = r52;
            r85.boostLevelIds = {
                table.unpack(r53)
            };
            r85.speedMultipliers = {
                ["Base"] = r59,
                ["Boost1"] = r60,
                ["Boost2"] = r61,
                ["Boost3"] = r62,
                ["Boost4"] = r63
            };
            r85.hover = {
                ["Height"] = r66,
                ["Speed"] = r67
            };
            r83(r85);
            return; 
        end;
        local function r94(arg1_8, ...)
            v1 = arg1_8;
            if not v1 then
                return "Unbound";
            end;
            C = v1.Name;
            return C.gsub(C, "(%l)(%u)", "%1 %2"); 
        end;
        ls[45] = "\"-\xa3\x1d\xfeFKN";
        ls[39] = 6866788522235;
        local function r95(arg1_9, ...)
            g = Instance.new("Animation");
            D = arg1_9;
            g.AnimationId = D;
            C = r38;
            return C.LoadAnimation(C, g); 
        end;
        ls[19], ls[30] = 2762822027789, 33803497962233;
        r96 = .35;
        ls[21] = 19288213014059;
        local function r97(arg1_10, arg2_10, ...)
            r98 = arg1_10;
            r99 = arg2_10;
            if not r98 then
                return;
            end;
            D = r99 and task.delay(r99 + .05, function(...)
                 
            end);
            r99 = r[Z[1]];
            r[Z[2]].fadingTracks[r98] = true;
            pcall(function(...)
                local Z = {
                    305,
                    Z[3],
                    Z[4],
                    306
                };
                C = r[Z[1]].IsPlaying;
                if C then
                    C = r[Z[1]];
                    C.Stop(C, r[Z[4]]);
                end;
                return; 
            end);
            task.delay(r99 + .05, function(...)
                local Z = {
                    305,
                    Z[2],
                    Z[3],
                    Z[4]
                };
                pcall(function(...)
                    C = r[v1];
                    C.Destroy(C);
                    return; 
                end);
                r[Z[2]].fadingTracks[r[Z[1]]] = nil;
                return; 
            end);
            return; 
        end;
        local function r100(arg1_11, ...)
            local Z = {
                61,
                60,
                438,
                215
            };
            r101 = arg1_11;
            if not r101 then
                return;
            end;
            task.spawn(function(...)
                local Z = {
                    Z[3],
                    428,
                    Z[1],
                    Z[2],
                    Z[4]
                };
                C = pcall;
                v3 = {
                    C(function(...)
                        local Z = {
                            Z[1],
                            Z[2]
                        };
                        return r[Z[1]](r[Z[2]]); 
                    end)
                };
                g = v3[1];
                r102 = v3[2];
                if g then
                    D = r102;
                end;
                C = C;
                if not g then
                    return;
                end;
                r102.Priority = Enum.AnimationPriority.Idle;
                pcall(function(...)
                    C = r102;
                    C.Play(C, 0, 0, 1);
                    return; 
                end);
                C = r[Z[5]].Heartbeat;
                C.Wait(C);
                pcall(function(...)
                    C = r102;
                    C.Stop(C, 0);
                    return; 
                end);
                pcall(function(...)
                    C = r102;
                    C.Destroy(C);
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        ls[36], ls[2] = "\x04\xfdY\xf9", "ensureReplicatedIdleAnimInstance";
        local function r103(...)
            local Z = {
                176,
                61,
                60,
                572,
                53
            };
            if not r[Z[1]] or not r[Z[1]].Parent then
                return;
            end;
            if os.clock() < r[Z[4]].suppressBlockDefaultAnimsUntil then
                return;
            end;
            v3 = r[Z[1]];
            v3 = "ipairs";
            for g, R in ipairs(v3.GetPlayingAnimationTracks(v3)) do
                B = g;
                r104 = R;
                if r[C] ~= r[Z[5]].active and (r[C] ~= r[Z[5]].replicated and not r[Z[4]].fadingTracks[r[C]]) then
                    pcall(function(...)
                        C = r[C];
                        C.Stop(C, 0);
                        return; 
                    end);
                end; 
            end;
            return; 
        end;
        local function r105(arg1_12, ...)
            local Z = {
                217,
                61,
                60,
                38,
                39
            };
            C = r[Z[1]];
            D = C.Create(C, workspace.CurrentCamera, TweenInfo.new(arg1_12 or .8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                ["FieldOfView"] = r[Z[4]].FOV_BASE
            });
            D.Play(D);
            r[Z[5]].currentFOV = r[Z[4]].FOV_BASE;
            return; 
        end;
        ls[52] = 21718164918018;
        ls[1] = r33;
        ls[1][ls[2]] = function(arg1_13, ...)
            local Z = {
                572,
                61,
                60
            };
            v1 = arg1_13;
            if r[Z[1]].replicatedIdleAnimInstance and r[Z[1]].replicatedIdleAnimInstance.Parent == v1 then
                return r[Z[1]].replicatedIdleAnimInstance;
            end;
            v3 = r[Z[3]];
            g = v1.FindFirstChild(v1, "ReplicatedIdle");
            if not g then
                g = Instance.new("Animation");
                g.Name = "ReplicatedIdle";
                v3 = arg1_13;
                g.Parent = v3;
            end;
            r[Z[1]].replicatedIdleAnimInstance = g;
            return g; 
        end;
        ls[3] = function(arg1_14, ...)
            local Z = {
                174,
                61,
                60,
                445,
                572,
                241,
                54,
                176,
                53,
                439,
                242,
                215,
                443,
                39,
                440
            };
            r108 = arg1_14;
            if not r[Z[1]] or not r[Z[1]].Parent then
                return;
            end;
            r[Z[4]]();
            r[Z[5]].replicatedIdleSwitchGeneration = r[Z[5]].replicatedIdleSwitchGeneration + 1;
            r109 = r[Z[5]].replicatedIdleSwitchGeneration;
            r110 = r[Z[6]][r[Z[7]]];
            if not r110 then
                return;
            end;
            B = r[Z[7]];
            r111 = Instance.new("Animation");
            r111.AnimationId = r110.AnimationId;
            M = {
                pcall(function(...)
                    local Z = {
                        Z[8],
                        291
                    };
                    C = r[Z[1]];
                    return C.LoadAnimation(C, r[Z[2]]); 
                end)
            };
            r112 = M[2];
            if not M[1] or not r112 then
                return;
            end;
            r[Z[9]].active = r112;
            r112.Looped = false;
            pcall(function(...)
                local Z = {
                    292,
                    286,
                    Z[10],
                    3,
                    Z[2],
                    Z[3]
                };
                C = r[Z[1]];
                C.Play(C, r[Z[2]] or r[Z[3]], 1, r[Z[4]].PlaybackSpeed);
                r[Z[1]].TimePosition = r[Z[4]].Start;
                return; 
            end);
            if r[Z[11]][B] then
                r113 = r[Z[1]].Parent;
                if r113 then
                    r114 = r[Z[5]].ensureReplicatedIdleAnimInstance(r113);
                    r114.AnimationId = r110.AnimationId;
                    task.spawn(function(...)
                        local Z = {
                            Z[2],
                            Z[3],
                            Z[5],
                            2,
                            16,
                            4,
                            3,
                            Z[8],
                            Z[9],
                            Z[12],
                            Z[13]
                        };
                        task.wait(.15);
                        if r[Z[3]].replicatedIdleSwitchGeneration ~= r[Z[4]] then
                            return;
                        end;
                        if not r[Z[5]] or not r[Z[5]].Parent then
                            return;
                        end;
                        if r[Z[6]].AnimationId ~= r[Z[7]].AnimationId then
                            return;
                        end;
                        C = r[Z[8]];
                        r115 = C.LoadAnimation(C, r[Z[6]]);
                        if r[Z[3]].replicatedIdleSwitchGeneration ~= r[Z[4]] then
                            pcall(function(...)
                                C = r115;
                                C.Destroy(C);
                                return; 
                            end);
                            return;
                        end;
                        r[Z[9]].replicated = r115;
                        r115.Looped = true;
                        C = r115;
                        C.Play(C, .05, 1, r[Z[7]].PlaybackSpeed);
                        pcall(function(...)
                            local Z = {
                                27,
                                Z[1],
                                Z[2],
                                Z[7]
                            };
                            r[Z[1]].TimePosition = r[Z[4]].Start;
                            return; 
                        end);
                        D, g = .3[1], .3[2];
                        for v3, E in ipairs({
                            .3,
                            .8
                        }) do
                            R = v3;
                            r116 = E;
                            E = 24;
                            task.spawn(function(...)
                                local Z = {
                                    Z[1],
                                    Z[2],
                                    24,
                                    Z[3],
                                    Z[4],
                                    Z[9],
                                    27
                                };
                                task.wait(r[Z[3]]);
                                if r[Z[4]].replicatedIdleSwitchGeneration ~= r[Z[5]] then
                                    return;
                                end;
                                if r[Z[6]].replicated ~= r[Z[7]] then
                                    return;
                                end;
                                pcall(function(...)
                                    C = r[27];
                                    C.AdjustWeight(C, 1, .05);
                                    return; 
                                end);
                                return; 
                            end); 
                        end;
                        r117 = r[Z[7]].Start;
                        r118 = r[Z[7]].End;
                        r119 = true;
                        C = r[Z[10]].Heartbeat;
                        r[Z[11]] = C.Connect(C, function(arg1_15, ...)
                            local Z = {
                                Z[9],
                                Z[1],
                                Z[2],
                                27,
                                Z[11],
                                571,
                                570,
                                Z[7],
                                569
                            };
                            v1 = arg1_15;
                            C = r[Z[1]].replicated ~= r[Z[4]];
                            if C then
                                if r[Z[5]] then
                                    C = r[Z[5]];
                                    C.Disconnect(C);
                                    r[Z[5]] = nil;
                                end;
                                return;
                            end;
                            R = {
                                pcall(function(...)
                                    local Z = {
                                        Z[4],
                                        Z[2],
                                        Z[3]
                                    };
                                    return r[Z[1]].TimePosition; 
                                end)
                            };
                            B, v3 = C, R[2];
                            C = B;
                            if not R[1] or not v3 then
                                return;
                            end;
                            C = C;
                            if r[Z[6]] and v3 >= r[Z[7]] then
                                pcall(function(...)
                                    local Z = {
                                        Z[4],
                                        Z[2],
                                        Z[3],
                                        Z[7],
                                        Z[6]
                                    };
                                    r[Z[1]].TimePosition = r[Z[4]];
                                    C = r[Z[1]];
                                    C.AdjustSpeed(C, 0);
                                    r[Z[5]] = false;
                                    return; 
                                end);
                            else
                                if not r[Z[6]] then
                                    r120 = R[2] - arg1_15 * r[Z[8]].PlaybackSpeed;
                                    if r120 <= r[Z[9]] then
                                        pcall(function(...)
                                            local Z = {
                                                Z[4],
                                                Z[2],
                                                Z[3],
                                                Z[9],
                                                Z[8],
                                                Z[6]
                                            };
                                            r[Z[1]].TimePosition = r[Z[4]];
                                            C = r[Z[1]];
                                            C.AdjustSpeed(C, r[Z[5]].PlaybackSpeed);
                                            r[Z[6]] = true;
                                            return; 
                                        end);
                                    else
                                        pcall(function(...)
                                            local Z = {
                                                Z[4],
                                                Z[2],
                                                Z[3],
                                                590
                                            };
                                            r[Z[1]].TimePosition = r[Z[4]];
                                            return; 
                                        end);
                                    end;
                                end;
                                return;
                            end; 
                        end);
                        return; 
                    end);
                end;
            end;
            r121 = true;
            r122 = B == "BasicIdle";
            r123 = r110.PlaybackSpeed;
            C = r[Z[12]].Heartbeat;
            r[Z[15]] = C.Connect(C, function(arg1_16, ...)
                local Z = {
                    Z[14],
                    Z[2],
                    Z[3],
                    Z[9],
                    292,
                    Z[15],
                    Z[1],
                    Z[4],
                    3,
                    112,
                    111,
                    113,
                    Z[10]
                };
                v1 = arg1_16;
                if not r[Z[1]].flying or (not r[Z[4]].active or r[Z[4]].active ~= r[Z[5]]) then
                    if r[Z[6]] then
                        C = r[Z[6]];
                        C.Disconnect(C);
                        r[Z[6]] = nil;
                    end;
                    return;
                end;
                if not r[Z[7]] or not r[Z[7]].Parent then
                    r[Z[8]]();
                    return;
                end;
                R = {
                    pcall(function(...)
                        local Z = {
                            Z[5],
                            Z[2],
                            Z[3]
                        };
                        return r[Z[1]].TimePosition; 
                    end)
                };
                v3 = R[2];
                C = D[a];
                if not R[1] or not v3 then
                    r[Z[8]]();
                    return;
                end;
                r124 = r[Z[9]].Start;
                r125 = r[Z[9]].End;
                if r[Z[10]] then
                    C = D[a];
                    if r[Z[11]] and v3 >= r125 then
                        pcall(function(...)
                            local Z = {
                                Z[5],
                                Z[2],
                                Z[3],
                                404,
                                Z[12],
                                Z[13],
                                Z[11]
                            };
                            r[Z[1]].TimePosition = r[Z[4]];
                            C = r[Z[1]];
                            C.AdjustSpeed(C, r[Z[5]]);
                            C = not r[Z[1]].IsPlaying;
                            if C then
                                C = r[Z[1]];
                                C.Play(C, r[Z[6]], 1, r[Z[5]]);
                            end;
                            r[Z[7]] = true;
                            return; 
                        end);
                    else
                        C = C;
                        if not r121 and R[2] <= r124 then
                            pcall(function(...)
                                local Z = {
                                    Z[5],
                                    Z[2],
                                    Z[3],
                                    404,
                                    Z[12],
                                    Z[11]
                                };
                                r[Z[1]].TimePosition = r[Z[4]];
                                C = r[Z[1]];
                                C.AdjustSpeed(C, r[Z[5]]);
                                r[Z[6]] = true;
                                return; 
                            end);
                        end;
                        pcall(function(...)
                            local Z = {
                                Z[5],
                                Z[12]
                            };
                            C = r[Z[1]];
                            C.AdjustSpeed(C, r[Z[2]]);
                            return; 
                        end);
                    end;
                else
                    C = D[a];
                    if r[Z[11]] and v3 >= r125 then
                        pcall(function(...)
                            local Z = {
                                Z[5],
                                Z[2],
                                Z[3],
                                405,
                                Z[11]
                            };
                            r[Z[1]].TimePosition = r[Z[4]];
                            C = r[Z[1]];
                            C.AdjustSpeed(C, 0);
                            r[Z[5]] = false;
                            return; 
                        end);
                    else
                        if not r[Z[11]] then
                            r126 = R[2] - arg1_16 * r[Z[9]].PlaybackSpeed;
                            if r126 <= r124 then
                                pcall(function(...)
                                    local Z = {
                                        Z[5],
                                        Z[2],
                                        Z[3],
                                        404,
                                        Z[9],
                                        Z[11]
                                    };
                                    r[Z[1]].TimePosition = r[Z[4]];
                                    C = r[Z[1]];
                                    C.AdjustSpeed(C, r[Z[5]].PlaybackSpeed);
                                    r[Z[6]] = true;
                                    return; 
                                end);
                            else
                                pcall(function(...)
                                    local Z = {
                                        Z[5],
                                        Z[2],
                                        Z[3],
                                        295
                                    };
                                    r[Z[1]].TimePosition = r[Z[4]];
                                    return; 
                                end);
                            end;
                        end;
                        if not r[Z[5]].IsPlaying then
                            pcall(function(...)
                                local Z = {
                                    Z[5],
                                    Z[13],
                                    Z[10],
                                    Z[12],
                                    Z[11],
                                    Z[9],
                                    Z[2],
                                    Z[3]
                                };
                                C = r[Z[1]];
                                v4 = r[Z[3]];
                                if v4 then
                                    R = r[Z[4]];
                                end;
                                Q = r[Z[5]];
                                if Q then
                                    v4 = r[Z[6]].PlaybackSpeed;
                                end;
                                C = C;
                                C = C;
                                C = C;
                                C.Play(C, r[Z[2]], 1, v4 or (Q or 0));
                                return; 
                            end);
                        end;
                        return;
                    end;
                end; 
            end);
            return; 
        end;
        ls[1] = function(...)
            local Z = {
                440,
                443,
                53,
                61,
                60,
                441,
                439
            };
            if r[Z[1]] then
                pcall(function(...)
                    C = r[Z[1]];
                    C.Disconnect(C);
                    return; 
                end);
                r[Z[1]] = nil;
            end;
            if r[Z[2]] then
                pcall(function(...)
                    C = r[Ns];
                    C.Disconnect(C);
                    return; 
                end);
                r[Z[2]] = nil;
            end;
            if r[Z[3]].active then
                r[Z[6]](r[Z[3]].active, r[Z[7]]);
                r[Z[3]].active = nil;
            end;
            if r[Z[3]].replicated then
                r[Z[6]](r[Z[3]].replicated, r[Z[7]]);
                r[Z[3]].replicated = nil;
            end;
            return; 
        end;
        ls[49] = 19472902244055;
        r127 = ls[1];
        ls[1] = 446;
        ls[17], ls[28] = "\x84\xd7'\x89\x81,X\n", 4085712326365;
        ls[4] = function(arg1_17, ...)
            local Z = {
                174,
                61,
                60,
                445,
                36,
                176,
                53,
                439
            };
            if not r[Z[1]] or not r[Z[1]].Parent then
                return;
            end;
            r[Z[4]]();
            r128 = r[Z[5]][arg1_17];
            if not r128 then
                return;
            end;
            r129 = Instance.new("Animation");
            r129.AnimationId = r128.AnimationId;
            E = {
                pcall(function(...)
                    local Z = {
                        Z[6],
                        17
                    };
                    C = r[Z[1]];
                    return C.LoadAnimation(C, r[Z[2]]); 
                end)
            };
            r130 = E[2];
            if not E[1] or not r130 then
                return;
            end;
            r[Z[7]].active = r130;
            r130.Looped = true;
            r130.Priority = Enum.AnimationPriority.Action4;
            pcall(function(...)
                local Z = {
                    18,
                    Z[8],
                    313,
                    Z[2],
                    Z[3]
                };
                C = r[Z[1]];
                C.Play(C, r[Z[2]], 1, r[Z[3]].PlaybackSpeed);
                return; 
            end);
            return; 
        end;
        ls[2] = function(...)
            local Z = {
                440,
                443,
                53,
                61,
                60,
                441,
                439
            };
            if r[Z[1]] then
                pcall(function(...)
                    C = r[Z[1]];
                    C.Disconnect(C);
                    return; 
                end);
                r[Z[1]] = nil;
            end;
            if r[Z[2]] then
                pcall(function(...)
                    C = r[Ns];
                    C.Disconnect(C);
                    return; 
                end);
                r[Z[2]] = nil;
            end;
            if r[Z[3]].active then
                r[Z[6]](r[Z[3]].active, r[Z[7]]);
                r[Z[3]].active = nil;
            end;
            if r[Z[3]].replicated then
                pcall(function(...)
                    local Z = {
                        Z[3],
                        Z[4],
                        Z[5]
                    };
                    C = r[Z[1]].replicated;
                    C.Stop(C, 0);
                    return; 
                end);
                pcall(function(...)
                    local Z = {
                        Z[3],
                        Z[4],
                        Z[5]
                    };
                    C = r[Z[1]].replicated;
                    C.Destroy(C);
                    return; 
                end);
                r[Z[3]].replicated = nil;
            end;
            return; 
        end;
        r[ls[1]] = ls[2];
        ls[2] = 447;
        r[ls[2]] = ls[3];
        ls[3] = 448;
        r[ls[3]] = ls[4];
        ls[4] = 449;
        r[ls[4]] = ls[5];
        ls[9] = function(arg1_18, ...)
            local Z = {
                61,
                60,
                57,
                572,
                215,
                ls[4],
                173
            };
            r131 = arg1_18;
            r132 = workspace.CurrentCamera.CFrame;
            r133 = r132.LookVector;
            r134 = r[Z[3]].savedCameraDistance or 12;
            r[Z[4]].fpTweeningOut = true;
            r[Z[4]].fpCameraGen = r[Z[4]].fpCameraGen + 1;
            r135 = r[Z[4]].fpCameraGen;
            r136 = 0;
            r137 = .3;
            D = r[Z[5]].RenderStepped;
            r138 = D.Connect(D, function(arg1_19, ...)
                local Z = {
                    Z[4],
                    Z[1],
                    Z[2],
                    281,
                    280,
                    282,
                    279,
                    Z[6],
                    276,
                    277,
                    278,
                    Z[7],
                    275
                };
                C = r[Z[1]].fpCameraGen ~= r[Z[4]];
                if C then
                    if r[Z[5]] then
                        C = r[Z[5]];
                        C.Disconnect(C);
                        r[Z[5]] = nil;
                    end;
                    r[Z[1]].fpTweeningOut = false;
                    return;
                end;
                r[Z[6]] = r[Z[6]] + arg1_19;
                r139 = math.clamp(r[Z[6]] / r[Z[7]], 0, 1);
                r139 = 1 - (1 - r139) ^ 2;
                r140 = r[Z[8]]();
                C = C;
                if not pcall(function(...)
                    local Z = {
                        Z[9],
                        299,
                        Z[2],
                        Z[3],
                        Z[10],
                        Z[11],
                        Z[12],
                        298
                    };
                    C = r[Z[2]];
                    if C then
                        g = r[Z[2]].Position;
                        v3 = g - r[Z[5]] * r[Z[6]] + Vector3.new(0, 2, 0);
                        R = RaycastParams.new();
                        R.FilterDescendantsInstances = {
                            r[Z[7]]
                        };
                        R.FilterType = Enum.RaycastFilterType.Exclude;
                        C = workspace;
                        E = C.Raycast(C, g, v3 - g, R);
                        if E then
                            v3 = g - r[Z[5]] * math.max((E.Position - g).Magnitude - 0.5, 1) + Vector3.new(0, 2, 0);
                        end;
                        v1, v3, R, g = CFrame.new(v3, g), nil, nil, nil;
                    end;
                    v3 = r[Z[1]];
                    workspace.CurrentCamera.CFrame = v3.Lerp(v3, r[Z[1]], r[Z[8]]);
                    return; 
                end) or r139 >= 1 then
                    if r[Z[5]] then
                        R = r[Z[5]];
                        R.Disconnect(R);
                        r[Z[5]] = nil;
                    end;
                    r[Z[1]].fpTweeningOut = false;
                    if r[Z[13]] then
                        pcall(r131);
                    end;
                end;
                return; 
            end);
            return; 
        end;
        ls[5] = 450;
        r[ls[5]] = ls[6];
        ls[8] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[4],
                57,
                572,
                216,
                38,
                215,
                ls[5]
            };
            if r[Z[1]].isFirstPerson then
                return;
            end;
            if not r[Z[1]].flying and not r[Z[1]].takingOff then
                return;
            end;
            v1 = r[Z[4]]();
            if not v1 then
                return;
            end;
            r[Z[1]].isFirstPerson = true;
            v3 = workspace.CurrentCamera.CFrame.LookVector;
            r[Z[1]].fpYaw = math.atan2(-v3.X, -v3.Z);
            r[Z[1]].fpPitch = math.asin(math.clamp(v3.Y, -1, 1));
            B = workspace.CurrentCamera;
            r[Z[5]].savedCameraType = B.CameraType;
            r[Z[5]].savedCameraSubject = B.CameraSubject;
            r[Z[5]].savedFOV = B.FieldOfView;
            r[Z[5]].savedCameraDistance = (B.CFrame.Position - v1.Position).Magnitude;
            r141 = B.CFrame;
            r142 = 0;
            r143 = .45;
            r144 = 2.5;
            r145 = false;
            r[Z[6]].fpCameraGen = r[Z[6]].fpCameraGen + 1;
            r146 = r[Z[6]].fpCameraGen;
            B.CameraType = Enum.CameraType.Scriptable;
            r[Z[7]].MouseBehavior = Enum.MouseBehavior.LockCenter;
            a = r[Z[7]].InputChanged;
            r[Z[5]].mouseConn = a.Connect(a, function(arg1_20, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    Z[8]
                };
                v1 = arg1_20;
                if not r[Z[1]].isFirstPerson then
                    return;
                end;
                if v1.UserInputType == Enum.UserInputType.MouseMovement then
                    r[Z[1]].fpYaw = r[Z[1]].fpYaw - v1.Delta.X * r[Z[4]].FP_SENSITIVITY;
                    r[Z[1]].fpPitch = math.clamp(r[Z[1]].fpPitch - v1.Delta.Y * r[Z[4]].FP_SENSITIVITY, math.rad(-80), math.rad(80));
                end;
                return; 
            end);
            a = r[Z[9]].RenderStepped;
            r[Z[5]].conn = a.Connect(a, function(arg1_21, ...)
                local Z = {
                    Z[6],
                    Z[2],
                    Z[3],
                    Z[1],
                    70,
                    Z[5],
                    Z[7],
                    Z[4],
                    68,
                    66,
                    67,
                    65,
                    69,
                    Z[10]
                };
                if r[Z[1]].killed then
                    return;
                end;
                if not r[Z[4]].isFirstPerson then
                    return;
                end;
                if r[Z[1]].fpCameraGen ~= r[Z[5]] then
                    if r[Z[6]].conn then
                        C = r[Z[6]].conn;
                        C.Disconnect(C);
                        r[Z[6]].conn = nil;
                    end;
                    return;
                end;
                if not r[Z[1]].guiOpen and r[Z[7]].MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                    r[Z[7]].MouseBehavior = Enum.MouseBehavior.LockCenter;
                end;
                g = r[Z[8]]();
                if not g then
                    return;
                end;
                if r[Z[9]] < r[Z[10]] then
                    C = r[Z[9]] + arg1_21;
                    r[Z[9]] = C;
                    R = r[Z[11]];
                    B = 1 - (1 - math.clamp(r[Z[9]] / r[Z[10]], 0, 1)) ^ 3;
                    E = R.Lerp(R, CFrame.new(g.CFrame.Position) * CFrame.Angles(0, r[Z[4]].fpYaw, 0) * CFrame.Angles(r[Z[4]].fpPitch, 0, 0) * CFrame.new(r[Z[4]].fpShakeOffsetX, r[Z[4]].fpShakeOffsetY, 0) * CFrame.Angles(r[Z[4]].fpShakePitch, r[Z[4]].fpShakeYaw, r[Z[4]].fpShakeRoll), B);
                    M = R.Lerp(R, CFrame.new(g.CFrame.Position) * CFrame.Angles(0, r[Z[4]].fpYaw, 0) * CFrame.Angles(r[Z[4]].fpPitch, 0, 0) * CFrame.new(r[Z[4]].fpShakeOffsetX, r[Z[4]].fpShakeOffsetY, 0) * CFrame.Angles(r[Z[4]].fpShakePitch, r[Z[4]].fpShakeYaw, r[Z[4]].fpShakeRoll), B);
                    workspace.CurrentCamera.CFrame = M;
                    C = C;
                    if not r[Z[12]] and (E.Position - g.CFrame.Position).Magnitude < r[Z[13]] then
                        r[Z[12]] = true;
                        r[Z[14]]();
                    end;
                else
                    workspace.CurrentCamera.CFrame = CFrame.new(g.CFrame.Position) * CFrame.Angles(0, r[Z[4]][r[Z[2]][r[Z[3]](O, S)]], 0) * CFrame.Angles(r[Z[4]].fpPitch, 0, 0) * CFrame.new(r[Z[4]].fpShakeOffsetX, r[Z[4]].fpShakeOffsetY, 0) * CFrame.Angles(R, E, v4);
                    if not r[Z[12]] then
                        r[Z[12]] = true;
                        r[Z[14]]();
                    end;
                    return;
                end; 
            end);
            a = r[Z[9]].Heartbeat;
            r[Z[5]].enforceConn = a.Connect(a, function(...)
                local Z = {
                    Z[6],
                    Z[2],
                    Z[3],
                    Z[1],
                    70,
                    Z[5],
                    Z[7]
                };
                if r[Z[1]].killed then
                    return;
                end;
                if not r[Z[4]].isFirstPerson then
                    return;
                end;
                if r[Z[1]].fpCameraGen ~= r[Z[5]] then
                    if r[Z[6]].enforceConn then
                        C = r[Z[6]].enforceConn;
                        C.Disconnect(C);
                        r[Z[6]].enforceConn = nil;
                    end;
                    return;
                end;
                if not r[Z[1]].guiOpen and r[Z[7]].MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                    r[Z[7]].MouseBehavior = Enum.MouseBehavior.LockCenter;
                end;
                v3 = r[Z[6]].hidden;
                for g, R in ipairs("ipairs") do
                    B = g;
                    r147 = R;
                    R = 302;
                    pcall(function(...)
                        local Z = {
                            C,
                            Z[2],
                            Z[3]
                        };
                        if r[Z[1]].obj.LocalTransparencyModifier ~= r[Z[1]].target then
                            r[Z[1]].obj.LocalTransparencyModifier = r[Z[1]].target;
                        end;
                        return; 
                    end); 
                end;
                return; 
            end);
            return; 
        end;
        ls[31] = 8461343792840;
        ls[6] = 451;
        r[ls[6]] = ls[7];
        ls[29] = 33442709698985;
        ls[7] = 452;
        r[ls[7]] = ls[8];
        ls[8] = 453;
        ls[10] = function(...)
            local Z = {
                39,
                61,
                60,
                57,
                ls[6],
                216,
                ls[8],
                174
            };
            if not r[Z[1]].isFirstPerson then
                return;
            end;
            r[Z[1]].isFirstPerson = false;
            r[Z[1]].fpShakePitch = 0;
            r[Z[1]].fpShakeYaw = 0;
            r[Z[1]].fpShakeRoll = 0;
            r[Z[1]].fpShakeOffsetX = 0;
            r[Z[1]].fpShakeOffsetY = 0;
            if r[Z[4]].mouseConn then
                C = r[Z[4]].mouseConn;
                C.Disconnect(C);
                r[Z[4]].mouseConn = nil;
            end;
            if r[Z[4]].conn then
                C = r[Z[4]].conn;
                C.Disconnect(C);
                r[Z[4]].conn = nil;
            end;
            if r[Z[4]].enforceConn then
                C = r[Z[4]].enforceConn;
                C.Disconnect(C);
                r[Z[4]].enforceConn = nil;
            end;
            r[Z[5]]();
            r[Z[6]].MouseBehavior = Enum.MouseBehavior.Default;
            r[Z[7]](function(...)
                local Z = {
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[8]
                };
                r148 = workspace.CurrentCamera;
                pcall(function(...)
                    local Z = {
                        591,
                        Z[1],
                        Z[2],
                        Z[3],
                        Z[4]
                    };
                    C = r[Z[1]];
                    C.CameraType = r[Z[4]].savedCameraType or Enum.CameraType.Custom;
                    r[Z[1]].CameraSubject = r[Z[4]].savedCameraSubject or r[Z[5]];
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        r[ls[8]] = ls[9];
        ls[9] = 454;
        ls[38] = "\xa1+\xa1q";
        r[ls[9]] = ls[10];
        pg, ls[32] = nil, 18516169081692;
        ls[10] = 455;
        ls[12] = function(arg1_22, ...)
            local Z = {
                43,
                61,
                60,
                ls[10],
                39,
                38
            };
            if not r[Z[1]] or not r[Z[1]].Parent then
                return;
            end;
            r[Z[5]].currentFOV = r[Z[5]].currentFOV + (r[Z[4]](r[Z[1]].Velocity.Magnitude) - r[Z[5]].currentFOV) * math.min(r[Z[6]].FOV_LERP_SPEED * arg1_22, 1);
            workspace.CurrentCamera.FieldOfView = r[Z[5]].currentFOV;
            return; 
        end;
        ls[107] = 5733956326620;
        r[ls[10]] = ls[11];
        ls[11] = 456;
        r[ls[11]] = ls[12];
        ls[14] = r16;
        ls[15] = r15;
        ls[16] = ls[15](ls[17], ls[18]);
        ls[13] = ls[14][ls[16]];
        ls[15] = r16;
        ls[20] = 31742924518266;
        ls[16] = r15;
        ls[18] = "E\x10\x8a\xf3\x0e;,\xd5\x14";
        ls[17] = ls[16](ls[18], ls[19]);
        ls[14] = ls[15][ls[17]];
        ls[19] = "!Nu\xa7k\x96\x967";
        ls[16] = r16;
        ls[17] = r15;
        ls[18] = ls[17](ls[19], ls[20]);
        ls[15] = ls[16][ls[18]];
        ls[17] = r16;
        ls[20] = "\x1d\xe5\xba\x9d4{|\x01\xf3";
        ls[18] = r15;
        ls[19] = ls[18](ls[20], ls[21]);
        ls[16] = ls[17][ls[19]];
        ls[35] = 31124430352698;
        ls[61] = 457;
        ls[12] = {
            ls[13],
            ls[14],
            ls[15],
            ls[16]
        };
        ls[15], ls[55], ls[19] = "getPartLowestWorldPoint", "\x0f\x13\xd4", "1\xb8\xfcc\x0c\x07\x80\x06\xc6\x19\xec\x14\x1d\xaeY\x17-\x12\n.\xff\x11\xf8b\xb2";
        ls[13] = 458;
        ls[34] = "?i\xb6\xf0f\xd9\xf1\xdbz\xb3";
        r[ls[13]] = ls[12];
        ls[12] = function(arg1_23, ...)
            local Z = {
                61,
                60
            };
            v1 = arg1_23;
            g = v1.CFrame;
            v3 = v1.Size * 0.5;
            for v4, i in ipairs("ipairs") do
                Q = v4;
                for q, O in ipairs({
                    -1,
                    1
                }) do
                    o = q;
                    for Y, v in ipairs({
                        -1,
                        1
                    }) do
                        X = Y;
                        t = v1.CFrame * Vector3.new(i * v3.X, O * v3.Y, v * v3.Z);
                        if t.Y < math.huge then
                            B = t.Y;
                            R = t;
                        end; 
                    end; 
                end; 
            end;
            return math.huge, nil; 
        end;
        ls[26], ls[22] = "\x81l\x1e\x91JnY2\xd1\x89\xe0\xe3s\x13\xe8?\x88", "Enum";
        ls[14] = r33;
        ls[14][ls[15]] = ls[12];
        ls[14] = function(arg1_24, ...)
            local Z = {
                222,
                61,
                60,
                572
            };
            g = r[Z[1]].Character;
            if not g then
                return nil, nil;
            end;
            v4 = "ipairs";
            for E, Q in ipairs(arg1_24) do
                i = g.FindFirstChild(g, Q);
                if i then
                    a = i.IsA(i, "BasePart");
                end;
                if i then
                    C = r[Z[4]].getPartLowestWorldPoint;
                    q = {
                        C(i)
                    };
                    a = q[1];
                    q = not nil or a < nil;
                    if q then
                        q = q[2];
                        B, C = q[2], q[1];
                        v3 = a;
                    end;
                end; 
            end;
            return nil, nil; 
        end;
        ls[12] = 459;
        r[ls[12]] = ls[14];
        ls[14] = r33;
        ls[16] = r16;
        ls[17] = r15;
        ls[119], ls[20] = "{.RkAL.|{2\xda\x9e", 21735345311506;
        ls[18] = ls[17](ls[19], ls[20]);
        ls[15] = ls[16][ls[18]];
        ls[16], ls[17] = 2.5, "ensureFootTracker";
        ls[14][ls[15]] = ls[16];
        ls[82] = 213681144007;
        ls[14] = 460;
        ls[15] = function(arg1_25, ...)
            local Z = {
                54,
                61,
                60,
                ls[12],
                ls[13],
                175,
                572
            };
            M = r[Z[3]];
            E = "UpsideDown";
            if r[Z[1]] == E and not arg1_25 then
                E = {
                    r[Z[4]]({
                        "Head"
                    })
                };
                v3, g = E[2], E[1];
            end;
            if not g then
                M = {
                    r[Z[4]](r[Z[5]])
                };
                v3, g = M[2], M[1];
            end;
            C = not g;
            if C then
                g = r[Z[6]].Position.Y - 3;
                v3 = Vector3.new(r[Z[6]].Position.X, g, r[Z[6]].Position.Z);
            end;
            if nil then
                C = not g;
                v4 = r[Z[6]] and r[Z[6]].Parent;
            end;
            C = C;
            if nil then
                v4 = r[Z[6]].Position;
                Q = nil.X - v4.X;
                i = nil.Z - v4.Z;
                v2 = math.sqrt(Q * Q + i * i);
                if v2 > r[Z[7]].FOOT_POINT_MAX_HORIZ_DIST then
                    a = r[Z[7]].FOOT_POINT_MAX_HORIZ_DIST / v2;
                    Vector3.new(v4.X + Q * a, nil.Y, v4.Z + i * a);
                end;
            end;
            return g, nil; 
        end;
        r[ls[14]] = ls[15];
        ls[16] = r33;
        ls[42] = 4216712826711;
        ls[15] = function(...)
            local Z = {
                572,
                61,
                60
            };
            if r[Z[1]].footTrackerPart and r[Z[1]].footTrackerPart.Parent then
                return r[Z[1]].footTrackerPart;
            end;
            v1 = Instance.new("Part");
            v1.Name = "IFlyFootTracker";
            v1.Anchored = true;
            v1.CanCollide = false;
            v1.CanQuery = false;
            v1.CanTouch = false;
            v1.CastShadow = false;
            v1.Transparency = 1;
            v1.Size = Vector3.new(3.5, 1.2, 3);
            v1.Parent = workspace;
            r[Z[1]].footTrackerPart = v1;
            return v1; 
        end;
        ls[48] = "\xea\x10\xda";
        ls[16][ls[17]] = ls[15];
        ls[16] = r33;
        ls[17] = "startFootTracker";
        ls[15] = function(...)
            local Z = {
                572,
                61,
                60,
                215,
                ls[14]
            };
            r[Z[1]].ensureFootTracker();
            if r[Z[1]].footTrackerConn then
                return;
            end;
            v1 = r[Z[4]].Heartbeat;
            r[Z[1]].footTrackerConn = v1.Connect(v1, function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    Z[5]
                };
                if r[Z[1]].killed then
                    if r[Z[1]].footTrackerConn then
                        C = r[Z[1]].footTrackerConn;
                        C.Disconnect(C);
                        r[Z[1]].footTrackerConn = nil;
                    end;
                    return;
                end;
                if not r[Z[1]].footTrackerPart or not r[Z[1]].footTrackerPart.Parent then
                    return;
                end;
                g = {
                    r[Z[4]]()
                };
                v1 = g[2];
                g = g[1];
                if v1 then
                    r[Z[1]].footTrackerPart.CFrame = CFrame.new(v1.X, v1.Y, v1.Z);
                end;
                return; 
            end);
            return; 
        end;
        ls[16][ls[17]] = ls[15];
        ls[16] = r33;
        ls[27], ls[59] = 16454521863132, 21705279622902;
        ls[15] = function(...)
            local Z = {
                572,
                61,
                60
            };
            if r[Z[1]].footTrackerConn then
                C = r[Z[1]].footTrackerConn;
                C.Disconnect(C);
                r[Z[1]].footTrackerConn = nil;
            end;
            return; 
        end;
        ls[17] = "stopFootTracker";
        ls[16][ls[17]] = ls[15];
        ls[15] = 461;
        ls[16] = function(arg1_26, arg2_26, ...)
            local Z = {
                61,
                60,
                173,
                ls[14],
                175,
                38
            };
            g = arg2_26;
            v3 = RaycastParams.new();
            v3.FilterDescendantsInstances = {
                r[Z[3]]
            };
            v3.FilterType = Enum.RaycastFilterType.Exclude;
            v3.RespectCanCollide = true;
            R = {
                r[Z[4]](arg1_26)
            };
            B = R[2];
            R = R[1];
            if R then
                R = R;
                E, C = B and B.X, r[Z[4]];
                if B then
                    C = C;
                    if B then
                        C = D + 0.5;
                        if g then
                            Q = arg2_26 > C;
                        end;
                        if g then
                            M = arg2_26;
                        end;
                        Q = workspace;
                        v2 = C;
                        a = Q.Raycast(Q, Vector3.new(v4 and B.X, C, B and B.Z), Vector3.new(0, -r[Z[6]].LAND_SCAN_RANGE, 0), RaycastParams.new());
                        if a then
                            q = a.Position.Y;
                        end;
                        C = C;
                        return a or nil;
                    else
                        v4 = r[Z[5]].Position.Z;
                    end;
                else
                    E = r[Z[5]].Position.X;
                end;
            else
                D = r[Z[5]].Position.Y;
            end; 
        end;
        ls[17] = function(...)
            local Z = {
                61,
                60,
                43,
                175,
                52
            };
            r[Z[3]] = Instance.new("BodyVelocity");
            r[Z[3]].Name = "IFlyVel";
            r[Z[3]].MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
            r[Z[3]].Velocity = Vector3.zero;
            r[Z[3]].Parent = r[Z[4]];
            r[Z[5]] = Instance.new("BodyGyro");
            r[Z[5]].Name = "IFlyGyro";
            r[Z[5]].MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000);
            r[Z[5]].P = 12000;
            r[Z[5]].D = 600;
            r[Z[5]].CFrame = r[Z[4]].CFrame;
            r[Z[5]].Parent = r[Z[4]];
            return; 
        end;
        r[ls[15]] = ls[16];
        ls[16] = 462;
        r[ls[16]] = ls[17];
        ls[17] = 463;
        ls[18] = function(...)
            local Z = {
                43,
                61,
                60,
                52
            };
            if r[Z[1]] and r[Z[1]].Parent then
                C = r[Z[1]];
                C.Destroy(C);
            end;
            if r[Z[4]] and r[Z[4]].Parent then
                C = r[Z[4]];
                C.Destroy(C);
            end;
            r[Z[1]] = nil;
            r[Z[4]] = nil;
            return; 
        end;
        r[ls[17]] = ls[18];
        ls[116] = 11416371472776;
        ls[21] = Env[ls[22]];
        ls[23] = r16;
        ls[24] = r15;
        ls[25] = ls[24](ls[26], ls[27]);
        ls[22] = ls[23][ls[25]];
        ls[81] = 2105671976873;
        ls[20] = ls[21][ls[22]];
        ls[22] = r16;
        ls[25], ls[26] = "\xa2&\xce\x01\xda\xc5\xbb", 23935509452563;
        ls[23] = r15;
        ls[24] = ls[23](ls[25], ls[26]);
        ls[27] = "\x97\x10\xbc\xe6y\r0\x92.\x12\r\x8cFuP:\x10";
        ls[21] = ls[22][ls[24]];
        ls[23] = "Enum";
        ls[19] = ls[20][ls[21]];
        ls[22] = Env[ls[23]];
        ls[24] = r16;
        ls[25] = r15;
        ls[26] = ls[25](ls[27], ls[28]);
        ls[23] = ls[24][ls[26]];
        ls[26] = "\xa6Z\xb8\x9e\x8d\xaa\xd1\xbf";
        ls[21] = ls[22][ls[23]];
        ls[27] = 26765979279711;
        ls[23] = r16;
        ls[24] = r15;
        ls[25] = ls[24](ls[26], ls[27]);
        ls[24] = "Enum";
        ls[22] = ls[23][ls[25]];
        ls[20] = ls[21][ls[22]];
        ls[87], ls[51] = 8229408480752, 13065689247624;
        ls[23] = Env[ls[24]];
        ls[25] = r16;
        ls[26] = r15;
        ls[28] = "\x95\x94\xb7\xe8\xdf\x83\x9e\xfcv\xd01pmd\x1c\xe2\xc5";
        ls[27] = ls[26](ls[28], ls[29]);
        ls[24] = ls[25][ls[27]];
        ls[27] = "\xc4\x02W\xf2:\x0e\x82\xf3!";
        ls[22] = ls[23][ls[24]];
        ls[24] = r16;
        ls[25] = r15;
        ls[28] = 20083879987472;
        ls[26] = ls[25](ls[27], ls[28]);
        ls[23] = ls[24][ls[26]];
        ls[46], ls[138] = 20046297876717, 14253283947482;
        ls[21] = ls[22][ls[23]];
        ls[25], ls[29] = "Enum", "\xb9\x07\x00\xa5\x9aY\xc1+\xf3*t%H\xd1Qj)";
        ls[24] = Env[ls[25]];
        ls[26] = r16;
        ls[27] = r15;
        ls[28] = ls[27](ls[29], ls[30]);
        ls[25] = ls[26][ls[28]];
        ls[28] = "o\xb9\x11\xcb&\x06N";
        ls[23] = ls[24][ls[25]];
        ls[29], ls[118], ls[44] = 2766043351568, 8416245259934, 15746904406345;
        ls[25] = r16;
        ls[26] = r15;
        ls[27] = ls[26](ls[28], ls[29]);
        ls[24] = ls[25][ls[27]];
        ls[41] = "\x167i\x1a\xc7\x94";
        ls[22] = ls[23][ls[24]];
        ls[30], ls[26] = "F\xa0\x01\xd9Xx\x8f\xb72\xc0oc\x9d\x95}B\n", "Enum";
        ls[25] = Env[ls[26]];
        ls[74] = "\x9b\xf9\x82U\x91@\xe5U\x95\xa7H6";
        ls[27] = r16;
        ls[28] = r15;
        ls[29] = ls[28](ls[30], ls[31]);
        ls[26] = ls[27][ls[29]];
        ls[24] = ls[25][ls[26]];
        ls[31] = "\xd0\xc8\xc6*\xbfm]\xd1\xb0\x11\xcf\xf3$(\x8ah=";
        ls[26] = r16;
        ls[27] = r15;
        ls[29], ls[30] = "W}\x88\xb4\x103\x82C\xdf\xa1\x93\xf1\xad,T+", 20165486856540;
        ls[28] = ls[27](ls[29], ls[30]);
        ls[25] = ls[26][ls[28]];
        ls[132] = "w^\x136\x19Y\xb0\xc8\x1d=";
        ls[23] = ls[24][ls[25]];
        ls[27] = "Enum";
        ls[26] = Env[ls[27]];
        ls[28] = r16;
        ls[29] = r15;
        ls[99] = "{9Ov5Q";
        ls[30] = ls[29](ls[31], ls[32]);
        ls[102], ls[31] = 3509095369924, 3395275263066;
        ls[27] = ls[28][ls[30]];
        ls[25] = ls[26][ls[27]];
        ls[27] = r16;
        ls[103], ls[30], ls[32] = 11282149648651, "V\xfb\x07\x08\xaa\x9a", "\xd2\x02\xc7^\x88>\xf0\x1a\x15\xf3\x81\xb7\xc6\x03\x10\x1f\x86";
        ls[28] = r15;
        ls[29] = ls[28](ls[30], ls[31]);
        ls[26] = ls[27][ls[29]];
        ls[24] = ls[25][ls[26]];
        ls[28], ls[80] = "Enum", "\x7f\x0f\x93\x80\x1a\xc8e";
        ls[27] = Env[ls[28]];
        ls[29] = r16;
        ls[30] = r15;
        ls[31] = ls[30](ls[32], ls[33]);
        ls[28] = ls[29][ls[31]];
        ls[26] = ls[27][ls[28]];
        ls[28] = r16;
        ls[29] = r15;
        ls[33], ls[32], ls[31] = 15039286949558, 8711533273009, "\xed0I\x0b\x18I1\xa0";
        ls[30] = ls[29](ls[31], ls[32]);
        ls[27] = ls[28][ls[30]];
        ls[25] = ls[26][ls[27]];
        ls[18] = {
            ls[19],
            ls[20],
            ls[21],
            ls[22],
            ls[23],
            ls[24],
            ls[25]
        };
        ls[19] = 464;
        r[ls[19]] = ls[18];
        ls[22] = function(...)
            local Z = {
                175,
                61,
                60
            };
            r[Z[1]].AssemblyLinearVelocity = Vector3.zero;
            r[Z[1]].AssemblyAngularVelocity = Vector3.zero;
            return; 
        end;
        ls[20] = function(...)
            local Z = {
                174,
                61,
                60,
                ls[19]
            };
            if not r[Z[1]] or not r[Z[1]].Parent then
                return;
            end;
            v3 = r[Z[4]];
            for g, R in ipairs(D) do
                r149 = R;
                pcall(function(...)
                    local Z = {
                        Z[1],
                        13
                    };
                    C = r[Z[1]];
                    C.SetStateEnabled(C, r[Z[2]], false);
                    return; 
                end); 
            end;
            pcall(function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3]
                };
                r[Z[1]].Sit = false;
                return; 
            end);
            return; 
        end;
        ls[18] = 465;
        r[ls[18]] = ls[20];
        ls[27], ls[29] = "*\x84\xe8\xc96b\x88", "-\xeay\xf3";
        ls[21] = function(...)
            local Z = {
                174,
                61,
                60,
                ls[19]
            };
            if not r[Z[1]] or not r[Z[1]].Parent then
                return;
            end;
            v3 = r[Z[4]];
            for g, R in ipairs(D) do
                r150 = R;
                pcall(function(...)
                    local Z = {
                        Z[1],
                        72
                    };
                    C = r[Z[1]];
                    C.SetStateEnabled(C, r[Z[2]], true);
                    return; 
                end); 
            end;
            return; 
        end;
        ls[20] = 466;
        ls[56], ls[31], ls[85], ls[30], ls[28] = 4301541019558, "5\x86\xc8\xbd", 5119757259424, 12901401734895, 30564993789745;
        r[ls[20]] = ls[21];
        ls[21] = 467;
        r[ls[21]] = ls[22];
        ls[24] = r16;
        ls[25] = r15;
        ls[26] = ls[25](ls[27], ls[28]);
        ls[23] = ls[24][ls[26]];
        ls[24] = nil;
        ls[26] = r16;
        ls[27] = r15;
        ls[28] = ls[27](ls[29], ls[30]);
        ls[25] = ls[26][ls[28]];
        ls[32], ls[136] = 30825921015844, 3837670395382;
        ls[28] = r16;
        ls[10] = nil;
        ls[29] = r15;
        ls[30] = ls[29](ls[31], ls[32]);
        ls[27] = ls[28][ls[30]];
        ls[104], ls[66], ls[28], ls[26] = 24239387662382, "\x1c\x8a\x9f\xf2j_", nil, nil;
        ls[22] = {
            [ls[23]] = ls[24],
            [ls[25]] = ls[26],
            [ls[27]] = ls[28]
        };
        ls[23] = 468;
        ls[24] = function(...)
            local Z = {
                ls[23],
                61,
                60
            };
            r[Z[1]].part = Instance.new("Part");
            r[Z[1]].part.Name = "IFlySpeedLines";
            r[Z[1]].part.Anchored = true;
            r[Z[1]].part.CanCollide = false;
            r[Z[1]].part.CanTouch = false;
            r[Z[1]].part.CanQuery = false;
            r[Z[1]].part.CastShadow = false;
            r[Z[1]].part.Transparency = 1;
            r[Z[1]].part.Size = Vector3.new(1, 1, 1);
            r[Z[1]].part.Parent = workspace;
            r[Z[1]].emitter = Instance.new("ParticleEmitter");
            r[Z[1]].emitter.Texture = "rbxassetid://2597342345";
            r[Z[1]].emitter.Orientation = Enum.ParticleOrientation.VelocityParallel;
            r[Z[1]].emitter.EmissionDirection = Enum.NormalId.Front;
            r[Z[1]].emitter.SpreadAngle = Vector2.new(90, 90);
            r[Z[1]].emitter.Rate = 0;
            r[Z[1]].emitter.Lifetime = NumberRange.new(0.25, .45);
            r[Z[1]].emitter.Speed = NumberRange.new(100, 180);
            r[Z[1]].emitter.LightEmission = 1;
            r[Z[1]].emitter.LightInfluence = 0;
            r[Z[1]].emitter.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(.1, .85),
                NumberSequenceKeypoint.new(.9, .85),
                NumberSequenceKeypoint.new(1, 0)
            });
            r[Z[1]].emitter.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(.1, 0),
                NumberSequenceKeypoint.new(.9, 0),
                NumberSequenceKeypoint.new(1, 1)
            });
            r[Z[1]].emitter.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
            });
            r[Z[1]].emitter.RotSpeed = NumberRange.new(0, 0);
            r[Z[1]].emitter.Parent = r[Z[1]].part;
            return; 
        end;
        ls[37] = 14385358222421;
        ls[25] = function(arg1_27, ...)
            local Z = {
                38,
                61,
                60
            };
            v1 = arg1_27;
            if v1 < 60 then
                return 0;
            end;
            if v1 < 120 then
                return (v1 - 60) / 60 * .35;
            end;
            if v1 < 220 then
                return .35 + (v1 - 120) / 100 * .3;
            end;
            if v1 < 380 then
                return .65 + (v1 - 220) / 160 * 0.25;
            end;
            C = v1 < 600;
            if C then
                return .9 + (v1 - 380) / 220 * .1;
            end;
            g = (r[Z[1]].BOOST_SPEEDS[4] or 600) * 3;
            if g <= 600 then
                return 1;
            end;
            return 1 + math.clamp((v1 - 600) / (g - 600), 0, 1) * .6; 
        end;
        r[ls[23]] = ls[22];
        ls[22] = 469;
        ls[32] = "8Q\xdc\xba\x06f";
        r[ls[22]] = ls[24];
        ls[24] = 470;
        r[ls[24]] = ls[25];
        ls[26] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[23],
                ls[22],
                215,
                175,
                43,
                ls[24],
                38
            };
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            if not r[Z[4]].part then
                r[Z[5]]();
            end;
            r151 = -1;
            g = r[Z[6]].RenderStepped;
            r[Z[4]].conn = g.Connect(g, function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    Z[7],
                    Z[4],
                    126,
                    Z[8],
                    Z[9],
                    Z[10]
                };
                if not r[Z[1]].flying or (not r[Z[4]] or (not r[Z[4]].Parent or (not r[Z[5]].part or not r[Z[5]].part.Parent))) then
                    if r[Z[5]].emitter and r[Z[6]] ~= 0 then
                        r[Z[5]].emitter.Rate = 0;
                        r[Z[6]] = 0;
                    end;
                    return;
                end;
                v1 = C;
                C = C;
                C = C;
                v1 = r[Z[7]] and r[Z[7]].Parent and r[Z[7]].Velocity.Magnitude or 0;
                v3 = math.floor(r[Z[8]](v1) * 280);
                B = workspace.CurrentCamera;
                E = C;
                E = r[Z[9]].BOOST_SPEEDS[4] or 600;
                v4 = 1 + v1 / 1200;
                if v1 > E then
                    Q = v1 - E;
                    v4, M = 1 + v1 / 1200 + Q / 400, 15 + Q + Q * 0.25;
                end;
                a = 180 * v4;
                r[Z[5]].emitter.Speed = NumberRange.new(100 * v4, a);
                M = math.min(15 + v1 * .08, a * .45 * 0.75);
                r[Z[5]].part.CFrame = CFrame.lookAt(B.CFrame.Position + B.CFrame.LookVector * M, B.CFrame.Position);
                if v3 ~= r[Z[6]] then
                    r[Z[5]].emitter.Rate = v3;
                    r[Z[6]] = v3;
                end;
                return; 
            end);
            return; 
        end;
        ls[27] = function(...)
            local Z = {
                ls[23],
                61,
                60
            };
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            if r[Z[1]].emitter then
                r[Z[1]].emitter.Rate = 0;
            end;
            if r[Z[1]].part and r[Z[1]].part.Parent then
                C = r[Z[1]].part;
                C.Destroy(C);
                r[Z[1]].part = nil;
                r[Z[1]].emitter = nil;
            end;
            return; 
        end;
        ls[25] = 471;
        r[ls[25]] = ls[26];
        ls[57] = 3258905889755;
        ls[26] = 472;
        r[ls[26]] = ls[27];
        ls[29] = r16;
        ls[30] = r15;
        ls[31] = ls[30](ls[32], ls[33]);
        ls[28] = ls[29][ls[31]];
        ls[29] = 0;
        ls[31] = r16;
        ls[32] = r15;
        ls[33] = ls[32](ls[34], ls[35]);
        ls[30] = ls[31][ls[33]];
        ls[31] = 0;
        ls[33] = r16;
        ls[34] = r15;
        ls[35] = ls[34](ls[36], ls[37]);
        ls[32] = ls[33][ls[35]];
        ls[33] = nil;
        ls[35] = r16;
        ls[54] = 9990398813272;
        ls[36] = r15;
        ls[37] = ls[36](ls[38], ls[39]);
        ls[34] = ls[35][ls[37]];
        ls[37] = "math";
        ls[36] = Env[ls[37]];
        ls[38] = r16;
        ls[39] = r15;
        ls[40] = ls[39](ls[41], ls[42]);
        ls[37] = ls[38][ls[40]];
        ls[38] = 9999;
        ls[35] = ls[36][ls[37]];
        ls[37] = 1000;
        ls[36] = ls[35](ls[37], ls[38]);
        ls[53], ls[27] = "i*\x82\xef\xe1", {
            [ls[28]] = ls[29],
            [ls[30]] = ls[31],
            [ls[32]] = ls[33],
            [ls[34]] = ls[36]
        };
        ls[28] = 473;
        r[ls[28]] = ls[27];
        ls[30], ls[58] = .35, 14240398652366;
        ls[29] = function(arg1_28, arg2_28, arg3_28, ...)
            local Z = {
                61,
                60
            };
            v1, v3 = arg1_28, arg3_28;
            g = arg2_28;
            return math.sin(v1 * g + v3) * 0.5 + math.sin(v1 * g * 2.1 + v3 * 1.3) * .3 + math.sin(v1 * g * 3.7 + v3 * 2.7) * .2; 
        end;
        ls[33], ls[42] = 1, 18923129652439;
        ls[27] = 474;
        ls[41] = "H!\xe2\x0fZ\xc9";
        r[ls[27]] = ls[29];
        ls[31], ls[32] = .55, .85;
        ls[29] = {
            ls[30],
            ls[31],
            ls[32],
            ls[33]
        };
        ls[32] = function(...)
            local Z = {
                ls[28],
                61,
                60,
                215,
                572,
                39,
                43,
                ls[27]
            };
            if r[Z[1]].conn then
                return;
            end;
            v1 = r[Z[4]].RenderStepped;
            r[Z[1]].conn = v1.Connect(v1, function(arg1_29, ...)
                local Z = {
                    Z[5],
                    Z[2],
                    Z[3],
                    Z[6],
                    Z[1],
                    Z[7],
                    Z[8]
                };
                if r[Z[1]].killed then
                    return;
                end;
                if not r[Z[4]].flying and os.clock() > r[Z[5]].shakeUntil then
                    return;
                end;
                if r[Z[4]].isFirstPerson then
                    return;
                end;
                if r[Z[1]].fpTweeningOut then
                    return;
                end;
                g = workspace.CurrentCamera;
                C = os.clock;
                v3 = C();
                C = C;
                C = C;
                R = math.clamp(((r[Z[6]] and r[Z[6]].Parent and r[Z[6]].Velocity.Magnitude or 0) - 50) / 420, 0, 1);
                E = R * R * .012 * r[Z[4]].boostShakeIntensity;
                r[Z[5]].trauma = math.max(0, r[Z[5]].trauma - arg1_29 * (2.5 + r[Z[5]].trauma * 3));
                v4 = r[Z[5]].trauma * r[Z[5]].trauma * .05;
                M = E * r[Z[7]](v3, 18, r[Z[5]].seed) + v4 * r[Z[7]](v3, 22, r[Z[5]].seed + 100);
                Q = E * r[Z[7]](v3, 15, r[Z[5]].seed + 50) + v4 * r[Z[7]](v3, 25, r[Z[5]].seed + 200);
                i = E * .4 * r[Z[7]](v3, 12, r[Z[5]].seed + 75) + v4 * 0.5 * r[Z[7]](v3, 20, r[Z[5]].seed + 300);
                C = C;
                if math.abs(M) < .0001 and (math.abs(Q) < .0001 and math.abs(i) < .0001) then
                    return;
                end;
                g.CFrame = g.CFrame * CFrame.Angles(M, Q, i);
                return; 
            end);
            return; 
        end;
        ls[30] = 475;
        ls[33] = function(...)
            local Z = {
                ls[28],
                61,
                60
            };
            r[Z[1]].trauma = 0;
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            return; 
        end;
        r[ls[30]] = ls[29];
        ls[43] = "D\xfc\xf9\xe0";
        ls[29] = 476;
        ls[39], ls[115] = 20042002778345, "\xd5\x03\x06\x05a6\xca\x1f}";
        ls[31] = function(arg1_30, ...)
            local Z = {
                ls[30],
                39,
                61,
                60,
                ls[28]
            };
            g = r[Z[1]][arg1_30] * r[Z[2]].boostShakeIntensity;
            r[Z[5]].trauma = math.min(r[Z[5]].trauma + g, 1);
            r[Z[2]].fpShakeTrauma = math.min(r[Z[2]].fpShakeTrauma + g, 1);
            return; 
        end;
        r[ls[29]] = ls[31];
        ls[31] = 477;
        r[ls[31]] = ls[32];
        ls[32] = 478;
        r[ls[32]] = ls[33];
        ls[111], ls[38] = 12767179910770, "p\xd7\x08\xf2";
        ls[35] = r16;
        ls[67] = 4536697655425;
        ls[36] = r15;
        ls[37] = ls[36](ls[38], ls[39]);
        ls[34] = ls[35][ls[37]];
        ls[37] = "math";
        ls[36] = Env[ls[37]];
        ls[38] = r16;
        ls[39] = r15;
        ls[40] = ls[39](ls[41], ls[42]);
        ls[37] = ls[38][ls[40]];
        ls[41], ls[38] = 17933109477693, 9999;
        ls[35] = ls[36][ls[37]];
        ls[37] = 1000;
        ls[24] = nil;
        ls[36] = ls[35](ls[37], ls[38]);
        ls[42] = 32624493459119;
        ls[37] = r16;
        ls[38] = r15;
        ls[40] = "\r\xcay{";
        ls[39] = ls[38](ls[40], ls[41]);
        ls[35] = ls[37][ls[39]];
        ls[84], ls[41], ls[37] = 6298761762538, "\xab7\xc0\x14", nil;
        ls[33] = {
            [ls[34]] = ls[36],
            [ls[35]] = ls[37]
        };
        ls[34] = 479;
        ls[114] = 10981492762611;
        ls[36] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[34]
            };
            r[Z[1]].fpShakeTrauma = 0;
            r[Z[1]].fpShakePitch = 0;
            r[Z[1]].fpShakeYaw = 0;
            r[Z[1]].fpShakeRoll = 0;
            r[Z[1]].fpShakeOffsetX = 0;
            r[Z[1]].fpShakeOffsetY = 0;
            if r[Z[4]].conn then
                C = r[Z[4]].conn;
                C.Disconnect(C);
                r[Z[4]].conn = nil;
            end;
            return; 
        end;
        ls[35] = function(...)
            local Z = {
                ls[34],
                61,
                60,
                215,
                39,
                ls[28],
                43,
                ls[27]
            };
            if r[Z[1]].conn then
                return;
            end;
            v1 = r[Z[4]].RenderStepped;
            r[Z[1]].conn = v1.Connect(v1, function(arg1_31, ...)
                local Z = {
                    Z[5],
                    Z[2],
                    Z[3],
                    Z[6],
                    Z[7],
                    Z[8],
                    Z[1]
                };
                if not r[Z[1]].flying and os.clock() > r[Z[4]].shakeUntil then
                    r[Z[1]].fpShakePitch = 0;
                    r[Z[1]].fpShakeYaw = 0;
                    r[Z[1]].fpShakeRoll = 0;
                    r[Z[1]].fpShakeOffsetX = 0;
                    r[Z[1]].fpShakeOffsetY = 0;
                    return;
                end;
                if not r[Z[1]].isFirstPerson then
                    r[Z[1]].fpShakePitch = 0;
                    r[Z[1]].fpShakeYaw = 0;
                    r[Z[1]].fpShakeRoll = 0;
                    r[Z[1]].fpShakeOffsetX = 0;
                    r[Z[1]].fpShakeOffsetY = 0;
                    return;
                end;
                C = os.clock;
                g = C();
                C = C;
                C = C;
                B = math.clamp(((r[Z[5]] and r[Z[5]].Parent and r[Z[5]].Velocity.Magnitude or 0) - 40) / 260, 0, 1);
                R = B * B * .026 * r[Z[1]].boostShakeIntensity;
                r[Z[1]].fpShakeTrauma = math.max(0, r[Z[1]].fpShakeTrauma - arg1_31 * (2.5 + r[Z[1]].fpShakeTrauma * 3));
                E = r[Z[1]].fpShakeTrauma * r[Z[1]].fpShakeTrauma * .09;
                r[Z[1]].fpShakePitch = R * r[Z[6]](g, 18, r[Z[7]].seed) + E * r[Z[6]](g, 22, r[Z[7]].seed + 100);
                r[Z[1]].fpShakeYaw = R * r[Z[6]](g, 15, r[Z[7]].seed + 50) + E * r[Z[6]](g, 25, r[Z[7]].seed + 200);
                r[Z[1]].fpShakeRoll = R * .4 * r[Z[6]](g, 12, r[Z[7]].seed + 75) + E * 0.5 * r[Z[6]](g, 20, r[Z[7]].seed + 300);
                v4 = (R + E) * 1.4;
                r[Z[1]].fpShakeOffsetX = v4 * r[Z[6]](g, 16, r[Z[7]].seed + 400);
                r[Z[1]].fpShakeOffsetY = v4 * r[Z[6]](g, 19, r[Z[7]].seed + 500);
                return; 
            end);
            return; 
        end;
        r[ls[34]] = ls[33];
        ls[33] = 480;
        r[ls[33]] = ls[35];
        ls[35] = 481;
        r[ls[35]] = ls[36];
        ls[38] = r16;
        ls[39] = r15;
        ls[40] = ls[39](ls[41], ls[42]);
        ls[37] = ls[38][ls[40]];
        ls[38] = nil;
        ls[40] = r16;
        ls[41] = r15;
        ls[42] = ls[41](ls[43], ls[44]);
        ls[39] = ls[40][ls[42]];
        ls[40] = nil;
        ls[42] = r16;
        ls[43] = r15;
        ls[44] = ls[43](ls[45], ls[46]);
        ls[41] = ls[42][ls[44]];
        ls[44] = "Vector3";
        ls[43] = Env[ls[44]];
        ls[45] = r16;
        ls[46] = r15;
        ls[47] = ls[46](ls[48], ls[49]);
        ls[44] = ls[45][ls[47]];
        ls[45], ls[47], ls[50] = 0, 9361166901774, "=\x14\xda\x04/";
        ls[42] = ls[43][ls[44]];
        ls[44], ls[46] = 0, -1;
        ls[43] = ls[42](ls[44], ls[45], ls[46]);
        ls[36] = {
            [ls[37]] = ls[38],
            [ls[39]] = ls[40],
            [ls[41]] = ls[43]
        };
        ls[37] = 482;
        r[ls[37]] = ls[36];
        ls[38] = function(...)
            local Z = {
                61,
                60,
                ls[37]
            };
            r[Z[3]].blur = Instance.new("BlurEffect");
            r[Z[3]].blur.Size = 0;
            r[Z[3]].blur.Parent = workspace.CurrentCamera;
            return; 
        end;
        ls[36] = 483;
        ls[49] = 20458627320429;
        r[ls[36]] = ls[38];
        ls[46] = "2\xb3\xba";
        ls[39] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[37],
                ls[36],
                215,
                43
            };
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            if not r[Z[4]].blur then
                r[Z[5]]();
            end;
            r152 = 0;
            r[Z[4]].lastLook = workspace.CurrentCamera.CFrame.LookVector;
            g = r[Z[6]].Heartbeat;
            r[Z[4]].conn = g.Connect(g, function(arg1_32, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    150,
                    Z[4],
                    Z[7]
                };
                v1 = arg1_32;
                C = not r[Z[1]].flying;
                if C then
                    r[Z[4]] = r[Z[4]] * .85;
                    if r[Z[5]].blur then
                        r[Z[5]].blur.Size = r[Z[4]];
                    end;
                    return;
                end;
                v3 = workspace.CurrentCamera.CFrame.LookVector;
                r[Z[5]].lastLook = v3;
                R = C;
                M = r[Z[6]] and r[Z[6]].Parent;
                C, E = C, "clamp";
                if M then
                    E = r[Z[6]].Velocity.Magnitude;
                end;
                o = math.clamp(((E or 0) - 100) / 500, 0, 1) * 4 + math.clamp((v3 - r[Z[5]].lastLook).Magnitude * 55, 0, 5) > r[Z[4]];
                a = C;
                if o then
                    v2 = math.min(v1 * 14, 1);
                end;
                D, C = o, C;
                if o then
                    C = C;
                    a = D;
                    r[Z[4]] = r[Z[4]] + (E + v4 - r[Z[4]]) * a;
                    if r[Z[5]].blur then
                        r[Z[5]].blur.Size = math.max(0, r[Z[4]]);
                    end;
                    return;
                else
                    D = math[r[Z[2]][r[Z[3]]("D\x8e\xfa", S)]](v1 * 6, 1);
                end; 
            end);
            return; 
        end;
        ls[38] = 484;
        r[ls[38]] = ls[39];
        ls[41] = 485;
        ls[39] = 486;
        ls[40] = function(...)
            local Z = {
                ls[37],
                61,
                60,
                217
            };
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            if r[Z[1]].blur and r[Z[1]].blur.Parent then
                C = r[Z[4]];
                D = C.Create(C, r[Z[1]].blur, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ["Size"] = 0
                });
                D.Play(D);
                task.delay(0.5, function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[3]
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3]
                        };
                        C = r[Z[1]].blur;
                        C.Destroy(C);
                        return; 
                    end);
                    r[Z[1]].blur = nil;
                    return; 
                end);
            end;
            return; 
        end;
        r[ls[39]] = ls[40];
        ls[40] = nil;
        r[ls[41]] = ls[40];
        ls[43] = r16;
        ls[44] = r15;
        ls[48], ls[106] = "j\xe0)q", "\xc5x\xc7";
        ls[45] = ls[44](ls[46], ls[47]);
        ls[42] = ls[43][ls[45]];
        ls[45] = r16;
        ls[43] = nil;
        ls[46] = r15;
        ls[47] = ls[46](ls[48], ls[49]);
        ls[109] = 7609840540591;
        ls[44] = ls[45][ls[47]];
        ls[47] = r16;
        ls[48] = r15;
        ls[100], ls[45] = 3548825029865, nil;
        ls[49] = ls[48](ls[50], ls[51]);
        ls[46] = ls[47][ls[49]];
        ls[47], ls[49] = {}, "\xe0A";
        ls[40], ls[120] = {
            [ls[42]] = ls[43],
            [ls[44]] = ls[45],
            [ls[46]] = ls[47]
        }, 5465512678370;
        ls[42] = 487;
        ls[43] = 488;
        ls[50] = 2611419810176;
        r[ls[42]] = ls[40];
        ls[40], ls[51] = false, 14276906988528;
        r[ls[43]] = ls[40];
        ls[46] = r16;
        ls[47] = r15;
        ls[78] = 25408728194159;
        ls[48] = ls[47](ls[49], ls[50]);
        ls[45] = ls[46][ls[48]];
        ls[47] = r16;
        ls[50] = "\xa1\x80:\x08u%\xc4\"MH\x85\x94\x07\xa8\x01R\xb3@]\x81\xb3\x91w";
        ls[48] = r15;
        ls[49] = ls[48](ls[50], ls[51]);
        ls[51] = "\x01m\xae\xe9\xe5\xd0\xf8";
        ls[46] = ls[47][ls[49]];
        ls[48] = r16;
        ls[49] = r15;
        ls[50] = ls[49](ls[51], ls[52]);
        ls[47] = ls[48][ls[50]];
        ls[50] = r16;
        ls[51] = r15;
        ls[52] = ls[51](ls[53], ls[54]);
        ls[49] = ls[50][ls[52]];
        ls[50], ls[75], ls[48] = nil, 8577311448884, 0;
        ls[52] = r16;
        ls[53] = r15;
        ls[54] = ls[53](ls[55], ls[56]);
        ls[51] = ls[52][ls[54]];
        ls[52] = 1;
        ls[44] = {
            [ls[45]] = ls[46],
            [ls[47]] = ls[48],
            [ls[49]] = ls[50],
            [ls[51]] = ls[52]
        };
        ls[47] = r16;
        ls[51] = 12917508353790;
        ls[48] = r15;
        ls[50], ls[52] = "\x18[", 11673003600503;
        ls[49] = ls[48](ls[50], ls[51]);
        ls[46] = ls[47][ls[49]];
        ls[53] = 22451552965037;
        ls[48] = r16;
        ls[49] = r15;
        ls[55], ls[51], ls[54] = 11806151650035, "\x04r`\xea\xea\xce\xa2\xb6\x8d%\x05\n'\xc3H^zb\xba\xb7-v\x1d", "\x03\x12O\xeer";
        ls[50] = ls[49](ls[51], ls[52]);
        ls[47] = ls[48][ls[50]];
        ls[49] = r16;
        ls[52] = "\xcep\xcc\xc95V\x99";
        ls[50] = r15;
        ls[51] = ls[50](ls[52], ls[53]);
        ls[48] = ls[49][ls[51]];
        ls[51] = r16;
        ls[52] = r15;
        ls[53] = ls[52](ls[54], ls[55]);
        ls[49], ls[56] = 2, "I\x03p";
        ls[50] = ls[51][ls[53]];
        ls[53] = r16;
        ls[54] = r15;
        ls[55] = ls[54](ls[56], ls[57]);
        ls[52] = ls[53][ls[55]];
        ls[53], ls[51] = 1.3, 4;
        ls[45], ls[133] = {
            [ls[46]] = ls[47],
            [ls[48]] = ls[49],
            [ls[50]] = ls[51],
            [ls[52]] = ls[53]
        }, 5765095789817;
        ls[48] = r16;
        ls[51] = "\x87\xd1";
        ls[49] = r15;
        ls[52] = 23819541796519;
        ls[50] = ls[49](ls[51], ls[52]);
        ls[53], ls[52] = 22718922838694, "\x91Ky\x97\xc0\x82\xce\x13\xe0\xcd\xac\x9e0\xe3X\xb1\x91\x18\x16\t%\xf4@";
        ls[47] = ls[48][ls[50]];
        ls[49] = r16;
        ls[54] = 7337101793969;
        ls[50] = r15;
        ls[57] = "Vo\xf7";
        ls[51] = ls[50](ls[52], ls[53]);
        ls[48] = ls[49][ls[51]];
        ls[50] = r16;
        ls[55] = "3\x1b\xb7\xe6~";
        ls[51] = r15;
        ls[53] = "\x8d\x14F;\xf9\xe5\x1f";
        ls[52] = ls[51](ls[53], ls[54]);
        ls[49] = ls[50][ls[52]];
        ls[52] = r16;
        ls[53] = r15;
        ls[50], ls[56] = .6, 12074595298285;
        ls[54] = ls[53](ls[55], ls[56]);
        ls[51] = ls[52][ls[54]];
        ls[54] = r16;
        ls[55] = r15;
        ls[56] = ls[55](ls[57], ls[58]);
        ls[52] = 4.5;
        ls[53] = ls[54][ls[56]];
        ls[54] = 1.6;
        ls[46], ls[58] = {
            [ls[47]] = ls[48],
            [ls[49]] = ls[50],
            [ls[51]] = ls[52],
            [ls[53]] = ls[54]
        }, "\xbb{)";
        ls[49] = r16;
        ls[54] = 23513516037514;
        ls[50] = r15;
        ls[53], ls[57], ls[56] = 25169276459920, 1840449652402, "\xe8\xdd\"\x85H";
        ls[34] = nil;
        ls[52] = "\x1c\x13";
        ls[51] = ls[50](ls[52], ls[53]);
        ls[55] = 19114261529993;
        ls[48] = ls[49][ls[51]];
        ls[50] = r16;
        ls[53] = "W\xdb\x06\xbf\x14\ts\xa1;\x88a\xbcX\xa9\xac\xd7w\x80\xfcA\xadvW\xb3n\xb2\xce\xda";
        ls[51] = r15;
        ls[52] = ls[51](ls[53], ls[54]);
        ls[54], ls[86] = "Z\xe1\xe1\xe1UW]", 25249809554395;
        ls[49] = ls[50][ls[52]];
        ls[51] = r16;
        ls[52] = r15;
        ls[53] = ls[52](ls[54], ls[55]);
        ls[50] = ls[51][ls[53]];
        ls[53] = r16;
        ls[54] = r15;
        ls[55] = ls[54](ls[56], ls[57]);
        ls[51] = 0;
        ls[52] = ls[53][ls[55]];
        ls[55] = r16;
        ls[56] = r15;
        ls[57] = ls[56](ls[58], ls[59]);
        ls[54] = ls[55][ls[57]];
        ls[55], ls[79] = 2, 1444226827585;
        ls[56] = 489;
        ls[57] = function(...)
            local Z = {
                ls[56],
                61,
                60,
                222
            };
            if r[Z[1]] then
                return;
            end;
            v1 = Instance.new("ScreenGui");
            v1.Name = "IFlyFlash";
            v1.ResetOnSpawn = false;
            v1.IgnoreGuiInset = true;
            v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v1.Parent = r[Z[4]].PlayerGui;
            g = Instance.new("Frame");
            g.Name = "Flash";
            g.Size = UDim2.new(1, 0, 1, 0);
            g.Position = UDim2.new(0, 0, 0, 0);
            g.BackgroundColor3 = Color3.new(1, 1, 1);
            g.BackgroundTransparency = 1;
            g.BorderSizePixel = 0;
            g.ZIndex = 10;
            g.Parent = v1;
            r[Z[1]] = v1;
            return; 
        end;
        ls[53] = 5;
        ls[47] = {
            [ls[48]] = ls[49],
            [ls[50]] = ls[51],
            [ls[52]] = ls[53],
            [ls[54]] = ls[55]
        };
        ls[59] = function(...)
            local Z = {
                ls[56]
            };
            if r[Z[1]] then
                pcall(function(...)
                    C = r[Z[1]];
                    C.Destroy(C);
                    return; 
                end);
                r[Z[1]] = nil;
            end;
            return; 
        end;
        ls[40] = {
            ls[44],
            ls[45],
            ls[46],
            ls[47]
        };
        ls[44] = 490;
        r[ls[44]] = ls[40];
        ls[45] = function(...)
            local Z = {
                ls[41],
                61,
                60,
                219
            };
            if not r[Z[1]] or not r[Z[1]].Parent then
                r[Z[1]] = Instance.new("Folder");
                r[Z[1]].Name = "IFlySounds";
                r[Z[1]].Parent = r[Z[4]];
            end;
            return r[Z[1]]; 
        end;
        ls[50] = 491;
        ls[40] = 492;
        ls[47] = function(arg1_33, arg2_33, arg3_33, ...)
            local Z = {
                61,
                60,
                ls[40]
            };
            B = Instance.new("Sound");
            D = arg1_33;
            B.SoundId = D;
            C = "Looped";
            B[C] = arg2_33 or false;
            B.Volume = arg3_33 or 1;
            B.Parent = r[Z[3]]();
            return B; 
        end;
        ls[46] = function(arg1_34, ...)
            local Z = {
                39,
                61,
                60
            };
            v3 = As;
            return (arg1_34 or 1) * (r[Z[1]].sfxVolume or 1); 
        end;
        r[ls[40]] = ls[45];
        ls[48] = function(arg1_35, arg2_35, arg3_35, ...)
            local Z = {
                61,
                60,
                217
            };
            v1 = arg1_35;
            if not v1 or not v1.Parent then
                return;
            end;
            C = r[Z[3]];
            D = C.Create(C, v1, TweenInfo.new(arg3_35, Enum.EasingStyle.Linear), {
                ["Volume"] = arg2_35
            });
            D.Play(D);
            return; 
        end;
        ls[45] = 493;
        ls[92] = 494;
        r[ls[45]] = ls[46];
        ls[46] = 495;
        ls[49] = function(...)
            local Z = {
                ls[42],
                61,
                60,
                ls[46]
            };
            r[Z[1]].low = r[Z[4]]("rbxassetid://119669684568685", true, 0);
            r[Z[1]].high = r[Z[4]]("rbxassetid://139956407844683", true, 0);
            C = r[Z[1]].low;
            C.Play(C);
            C = r[Z[1]].high;
            C.Play(C);
            return; 
        end;
        r[ls[46]] = ls[47];
        ls[47] = 496;
        ls[54] = function(arg1_36, ...)
            local Z = {
                39,
                61,
                60,
                ls[44],
                ls[43],
                ls[46],
                217,
                ls[45]
            };
            v1 = arg1_36;
            if not r[Z[1]].sfxEnabled then
                return;
            end;
            g = r[Z[4]][v1];
            if not g then
                return;
            end;
            r[Z[5]] = true;
            r153 = r[Z[6]](g.id, false, 0);
            r153.TimePosition = g.startAt or 0;
            if v1 == 1 then
                r153.PlaybackSpeed = 1.35;
            end;
            D = r153;
            D.Play(D);
            D = r[Z[7]];
            v3 = D.Create(D, r153, TweenInfo.new(.12, Enum.EasingStyle.Linear), {
                ["Volume"] = r[Z[8]](g.vol)
            });
            v3.Play(v3);
            E = r[Z[2]];
            if g.endAt then
                v4 = true;
                v3 = g.endAt - (g.startAt or 0);
                task.delay(math.max(0, v3 - .2), function(...)
                    local Z = {
                        Z[7],
                        293,
                        Z[2],
                        Z[3]
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3],
                            Z[4]
                        };
                        C = r[Z[1]];
                        D = C.Create(C, r[Z[2]], TweenInfo.new(.22, Enum.EasingStyle.Linear), {
                            ["Volume"] = 0
                        });
                        D.Play(D);
                        task.delay(0.25, function(...)
                            local Z = {
                                Z[2]
                            };
                            pcall(function(...)
                                local Z = {
                                    Z[2]
                                };
                                C = r[Z[1]];
                                C.Stop(C);
                                C = r[Z[1]];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                        return; 
                    end);
                    return; 
                end);
            else
                v3 = 3;
                E = r153.Ended;
                E.Connect(E, function(...)
                    pcall(function(...)
                        C = r[B];
                        C.Destroy(C);
                        return; 
                    end);
                    return; 
                end);
            end;
            task.delay(v3, function(...)
                r[ls[43]] = false;
                return; 
            end);
            return; 
        end;
        r[ls[47]] = ls[48];
        ls[48] = 497;
        r[ls[48]] = ls[49];
        ls[53] = function(...)
            local Z = {
                ls[42],
                61,
                60,
                ls[47],
                ls[41],
                ls[43]
            };
            B = r[Z[1]];
            v3 = B.conns;
            g, D = B[3], B[1];
            for g, R in v3, ipairs(v3) do
                B = g;
                r154 = R;
                pcall(function(...)
                    C = r154;
                    C.Disconnect(C);
                    return; 
                end); 
            end;
            r[Z[1]].conns = {};
            if r[Z[1]].low then
                r[Z[4]](r[Z[1]].low, 0, 0.5);
                task.delay(.6, function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[3]
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3]
                        };
                        C = r[Z[1]].low;
                        C.Stop(C);
                        C = r[Z[1]].low;
                        C.Destroy(C);
                        return; 
                    end);
                    r[Z[1]].low = nil;
                    return; 
                end);
            end;
            if r[Z[1]].high then
                r[Z[4]](r[Z[1]].high, 0, 0.5);
                task.delay(.6, function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[3]
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3]
                        };
                        C = r[Z[1]].high;
                        C.Stop(C);
                        C = r[Z[1]].high;
                        C.Destroy(C);
                        return; 
                    end);
                    r[Z[1]].high = nil;
                    return; 
                end);
            end;
            if r[Z[5]] then
                task.delay(1, function(...)
                    pcall(function(...)
                        C = r[ls[41]];
                        C.Destroy(C);
                        return; 
                    end);
                    r[ls[41]] = nil;
                    return; 
                end);
            end;
            r[Z[6]] = false;
            return; 
        end;
        ls[49] = function(...)
            local Z = {
                38,
                61,
                60,
                ls[44],
                v2,
                215
            };
            R = "rbxassetid://91992256988574";
            v1 = {
                r[Z[1]].CRASH_SOUND_ID,
                r[Z[1]].WALL_SFX_FLASHBANG,
                r[Z[1]].WALL_SFX_IMPACT_EXTRA,
                "rbxassetid://119669684568685",
                "rbxassetid://139956407844683",
                R
            };
            B = r[Z[4]];
            v3, D = R[3], R[1];
            for v3, E in B, ipairs(B) do
                R = v3;
                v1[#v1 + 1] = E.id; 
            end;
            r155 = Instance.new("Folder");
            r155.Name = "IFlySoundCache";
            r155.Parent = r[Z[5]];
            g = {};
            for E, M in ipairs(v1) do
                r156 = M;
                v4 = E;
                v2 = {
                    pcall(function(...)
                        local Z = {
                            Z[2],
                            Z[3],
                            122,
                            229
                        };
                        v1 = Instance.new("Sound");
                        v1.SoundId = r[Z[3]];
                        v1.Volume = 0;
                        v1.Parent = r[Z[4]];
                        return v1; 
                    end)
                };
                Q = v2[1];
                r157 = v2[2];
                if Q then
                    i = r157;
                end;
                if Q then
                    pcall(function(...)
                        C = r157;
                        C.Play(C);
                        return; 
                    end);
                    g[#g + 1] = r157;
                end; 
            end;
            C = r[Z[6]].Heartbeat;
            C.Wait(C);
            for E, M in ipairs(g) do
                v4 = E;
                r158 = M;
                pcall(function(...)
                    C = r158;
                    C.Stop(C);
                    return; 
                end);
                pcall(function(...)
                    C = r158;
                    C.Destroy(C);
                    return; 
                end); 
            end;
            pcall(function(...)
                C = r155;
                C.Destroy(C);
                return; 
            end);
            return; 
        end;
        ls[51] = function(arg1_37, arg2_37, arg3_37, ...)
            local Z = {
                ls[42],
                61,
                60,
                ls[43],
                39
            };
            g = arg2_37;
            v1 = arg1_37;
            if not r[Z[1]].low or not r[Z[1]].low.Parent then
                return;
            end;
            C = not arg3_37;
            if C then
                r[Z[1]].low.Volume = r[Z[1]].low.Volume * .85;
                r[Z[1]].high.Volume = r[Z[1]].high.Volume * .85;
                return;
            end;
            B = r[Z[4]] and .2 or 1;
            if v1 <= 2 then
                E = g * .7 * B;
                R = 0;
            else
                E = math.max(0, (1 - (v1 - 2)) * .3) * B;
                R = g * .8 * B;
            end;
            i = r[Z[5]].sfxVolume or 1;
            r[Z[1]].low.Volume = r[Z[1]].low.Volume + (nil * i - r[Z[1]].low.Volume) * .07;
            r[Z[1]].high.Volume = r[Z[1]].high.Volume + (nil * i - r[Z[1]].high.Volume) * .07;
            return; 
        end;
        ls[52] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[48],
                215,
                ls[42],
                43,
                42,
                ls[50]
            };
            if not r[Z[1]].sfxEnabled then
                return;
            end;
            r[Z[4]]();
            C = r[Z[5]].Heartbeat;
            r[Z[6]].conns[#r[Z[6]].conns + 1] = C.Connect(C, function(...)
                local Z = {
                    Z[6],
                    Z[2],
                    Z[3],
                    Z[1],
                    Z[7],
                    Z[8],
                    Z[9]
                };
                if not r[Z[1]].low or not r[Z[1]].low.Parent then
                    return;
                end;
                C = not r[Z[4]].flying;
                if C then
                    r[Z[1]].low.Volume = r[Z[1]].low.Volume * .88;
                    r[Z[1]].high.Volume = r[Z[1]].high.Volume * .88;
                    return;
                end;
                C = C;
                C = C;
                r[Z[7]](r[Z[4]].boostLevel, math.clamp(((r[Z[5]] and r[Z[5]].Parent and r[Z[5]].Velocity.Magnitude or 0) - 60) / 540, 0, 1), Vector3.new(r[Z[6]].L + r[Z[6]].R, r[Z[6]].U + r[Z[6]].D, r[Z[6]].F + r[Z[6]].B).Magnitude > .01);
                return; 
            end);
            return; 
        end;
        ls[97] = "#\t\xec\x1d";
        r[ls[50]] = ls[51];
        ls[51] = 498;
        r[ls[51]] = ls[52];
        ls[52] = 499;
        r[ls[52]] = ls[53];
        ls[53] = 500;
        r[ls[53]] = ls[54];
        ls[54] = 501;
        ls[55] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[46],
                217,
                ls[45]
            };
            if not r[Z[1]].sfxEnabled then
                return;
            end;
            r159 = r[Z[4]]("rbxasset://sounds/action_footsteps_plastic.mp3", false, 0);
            r159.PlaybackSpeed = .3;
            C = r159;
            C.Play(C);
            C = r[Z[5]];
            D = C.Create(C, r159, TweenInfo.new(.08, Enum.EasingStyle.Linear), {
                ["Volume"] = r[Z[6]](0.5)
            });
            D.Play(D);
            task.delay(.6, function(...)
                local Z = {
                    Z[5],
                    163,
                    Z[2],
                    Z[3]
                };
                pcall(function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[3],
                        Z[4]
                    };
                    C = r[Z[1]];
                    D = C.Create(C, r[Z[2]], TweenInfo.new(.35, Enum.EasingStyle.Linear), {
                        ["Volume"] = 0
                    });
                    D.Play(D);
                    task.delay(.4, function(...)
                        local Z = {
                            Z[2]
                        };
                        pcall(function(...)
                            local Z = {
                                Z[2]
                            };
                            C = r[Z[1]];
                            C.Stop(C);
                            C = r[Z[1]];
                            C.Destroy(C);
                            return; 
                        end);
                        return; 
                    end);
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        ls[68], ls[69] = "p\xc3\xfe\x82\xe8#\xbb", 9220502430091;
        r[ls[54]] = ls[55];
        ls[77], ls[55] = "i\t\xa8\x9d\xd19\xbf\x1d\\D\xaf\xbea\xf0\xbc6\x1c\x8e\xbc\t", nil;
        r[ls[56]] = ls[55];
        ls[55] = 502;
        r[ls[55]] = ls[57];
        ls[57] = 503;
        ls[58] = function(arg1_38, arg2_38, arg3_38, ...)
            local Z = {
                39,
                61,
                60,
                ls[55],
                ls[56],
                217
            };
            r160 = arg3_38;
            g = arg2_38;
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            r[Z[4]]();
            B = r[Z[5]];
            if B then
                B = r[Z[5]];
                D = B.FindFirstChild(B, "Flash");
            end;
            r161 = B;
            if not r161 then
                return;
            end;
            r161.BackgroundTransparency = 1;
            C = r[Z[6]];
            D = C.Create(C, r161, TweenInfo.new(g, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["BackgroundTransparency"] = 1 - arg1_38
            });
            D.Play(D);
            task.delay(g, function(...)
                local Z = {
                    Z[6],
                    225,
                    Z[2],
                    Z[3],
                    316
                };
                pcall(function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[3],
                        Z[4],
                        Z[5]
                    };
                    C = r[Z[1]];
                    D = C.Create(C, r[Z[2]], TweenInfo.new(r[Z[5]], Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        ["BackgroundTransparency"] = 1
                    });
                    D.Play(D);
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        r[ls[57]] = ls[58];
        ls[123] = 504;
        ls[58] = 505;
        ls[48] = nil;
        r[ls[58]] = ls[59];
        ls[59] = 506;
        ls[60] = function(arg1_39, ...)
            local Z = {
                61,
                60,
                39,
                ls[28],
                ls[57]
            };
            v1 = arg1_39;
            g = math.clamp(.7 + (v1 - 1) * .1, .7, 1) * r[Z[3]].boostShakeIntensity;
            r[Z[4]].trauma = math.min(r[Z[4]].trauma + g, 1);
            r[Z[3]].fpShakeTrauma = math.min(r[Z[3]].fpShakeTrauma + g, 1);
            r[Z[5]](0.25 + (v1 - 1) * .05, .04, .35 + v1 * .05);
            return; 
        end;
        r[ls[59]] = ls[60];
        ls[60] = nil;
        r[ls[61]] = ls[60];
        ls[63] = r16;
        ls[64] = r15;
        ls[65] = ls[64](ls[66], ls[67]);
        ls[62] = ls[63][ls[65]];
        ls[65] = r16;
        ls[66] = r15;
        ls[67] = ls[66](ls[68], ls[69]);
        ls[63] = nil;
        ls[64] = ls[65][ls[67]];
        ls[65] = nil;
        ls[36] = nil;
        ls[60] = {
            [ls[62]] = ls[63],
            [ls[64]] = ls[65]
        };
        ls[62] = 507;
        r[ls[62]] = ls[60];
        ls[60] = 10;
        ls[69] = function(...)
            local Z = {
                381,
                384,
                218,
                61,
                60
            };
            if not r[Z[1]] then
                return true;
            end;
            v3 = {
                pcall(function(...)
                    return readfile(r[Z[2]]); 
                end)
            };
            r162 = v3[2];
            if not v3[1] or not r162 then
                return false;
            end;
            R = {
                pcall(function(...)
                    local Z = {
                        a,
                        294
                    };
                    C = r[Z[1]];
                    return C.JSONDecode(C, r[Z[2]]); 
                end)
            };
            v1 = R[2];
            B = R[1];
            if B then
                D, C = v1 and v1.read == true, pcall;
            end;
            return B; 
        end;
        ls[64] = function(arg1_40, arg2_40, arg3_40, arg4_40, arg5_40, ...)
            local Z = {
                217,
                61,
                60
            };
            C = r[Z[1]];
            v1, B, R, g = arg1_40, arg4_40, arg5_40, arg2_40;
            E = TweenInfo.new;
            M = arg3_40 or 0.25;
            i = C;
            Q = B;
            if B then
                C = i;
                if R then
                    C = C;
                    E = C.Create(C, arg1_40, v4[r[Z[2]][a]](v3 or 0.25, B, R), arg2_40);
                    E.Play(E);
                    return E;
                else
                    i = Enum.EasingDirection.Out;
                end;
            else
                Q = Enum.EasingStyle.Quint;
            end; 
        end;
        ls[65] = function(...)
            local Z = {
                ls[61],
                61,
                60,
                222
            };
            if r[Z[1]] and r[Z[1]].Parent then
                return r[Z[1]];
            end;
            r163 = Instance.new("ScreenGui");
            r163.Name = "IFlyNotify";
            r163.ResetOnSpawn = false;
            r163.IgnoreGuiInset = true;
            r163.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            if gethui then
                r163.Parent = gethui();
            else
                g = syn;
                if g and syn.protect_gui then
                    syn.protect_gui(r163);
                    g = game;
                    r163.Parent = g.GetService(g, "CoreGui");
                else
                    g = pcall(function(...)
                        local Z = {
                            601,
                            Z[2],
                            Z[3]
                        };
                        v1 = game;
                        r[Z[1]].Parent = v1.GetService(v1, "CoreGui");
                        return; 
                    end);
                    if not g then
                        v3 = r[Z[4]];
                        r163.Parent = v3.WaitForChild(v3, "PlayerGui");
                    end;
                    r[Z[1]] = r163;
                    return r163;
                end;
            end; 
        end;
        ls[63] = 508;
        ls[66] = function(arg1_41, arg2_41, arg3_41, ...)
            local Z = {
                61,
                60,
                215
            };
            v1, v3, g = arg1_41, arg3_41, arg2_41;
            if g == "success" then
                B = Instance.new("Frame");
                B.Size = UDim2.new(0, 8, 0, 2.5);
                B.Position = UDim2.new(.28, 0, .56, 0);
                B.AnchorPoint = Vector2.new(0, 0.5);
                B.Rotation = 45;
                D = arg3_41;
                B.BackgroundColor3 = D;
                B.BorderSizePixel = 0;
                D = arg1_41;
                B.Parent = D;
                Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0);
                R = Instance.new("Frame");
                R.Size = UDim2.new(0, 14, 0, 2.5);
                R.Position = UDim2.new(.46, 0, .46, 0);
                R.AnchorPoint = Vector2.new(0, 0.5);
                R.Rotation = -45;
                R.BackgroundColor3 = v3;
                R.BorderSizePixel = 0;
                R.Parent = v1;
                Instance.new("UICorner", R).CornerRadius = UDim.new(1, 0);
            else
                if g == "error" then
                    B = Instance.new("Frame");
                    B.Size = UDim2.new(0, 16, 0, 2.5);
                    B.Position = UDim2.new(0.5, 0, 0.5, 0);
                    B.AnchorPoint = Vector2.new(0.5, 0.5);
                    B.Rotation = 45;
                    D = arg3_41;
                    B.BackgroundColor3 = D;
                    B.BorderSizePixel = 0;
                    D = arg1_41;
                    B.Parent = D;
                    Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0);
                    R = Instance.new("Frame");
                    R.Size = UDim2.new(0, 16, 0, 2.5);
                    R.Position = UDim2.new(0.5, 0, 0.5, 0);
                    R.AnchorPoint = Vector2.new(0.5, 0.5);
                    R.Rotation = -45;
                    R.BackgroundColor3 = v3;
                    R.BorderSizePixel = 0;
                    R.Parent = v1;
                    Instance.new("UICorner", R).CornerRadius = UDim.new(1, 0);
                else
                    if arg2_41 == "loading" then
                        r164 = Instance.new("Frame");
                        r164.Size = UDim2.new(0, 18, 0, 18);
                        r164.Position = UDim2.new(0.5, 0, 0.5, 0);
                        r164.AnchorPoint = Vector2.new(0.5, 0.5);
                        r164.BackgroundTransparency = 1;
                        R = arg1_41;
                        r164.Parent = R;
                        Instance.new("UICorner", r164).CornerRadius = UDim.new(1, 0);
                        R = Instance.new("UIStroke");
                        D = arg3_41;
                        R.Color = D;
                        R.Thickness = 2.5;
                        R.Transparency = .15;
                        R.Parent = r164;
                        r165 = Instance.new("UIGradient");
                        r165.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(.7, .2),
                            NumberSequenceKeypoint.new(1, 1)
                        });
                        r165.Parent = R;
                        task.spawn(function(...)
                            local Z = {
                                127,
                                Z[1],
                                Z[2],
                                128,
                                Z[3]
                            };
                            C = r[Z[1]].Parent;
                            while C do
                                r[Z[4]].Rotation = os.clock() * 220 % 360;
                                C = r[Z[5]].Heartbeat;
                                C.Wait(C); 
                            end;
                            return; 
                        end);
                    else
                        if arg2_41 == "reset" then
                            B = Instance.new("Frame");
                            B.Size = UDim2.new(0, 16, 0, 16);
                            B.Position = UDim2.new(0.5, 0, 0.5, 0);
                            B.AnchorPoint = Vector2.new(0.5, 0.5);
                            B.BackgroundTransparency = 1;
                            D = arg1_41;
                            B.Parent = D;
                            Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0);
                            R = Instance.new("UIStroke");
                            D = arg3_41;
                            R.Color = D;
                            R.Thickness = 2.5;
                            R.Transparency = .1;
                            R.Parent = B;
                            E = Instance.new("UIGradient");
                            E.Rotation = 90;
                            E.Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, .3),
                                NumberSequenceKeypoint.new(1, 1)
                            });
                            E.Parent = R;
                        else
                            B = Instance.new("Frame");
                            B.Size = UDim2.new(0, 8, 0, 8);
                            B.Position = UDim2.new(0.5, 0, 0.5, 0);
                            B.AnchorPoint = Vector2.new(0.5, 0.5);
                            D = arg3_41;
                            B.BackgroundColor3 = D;
                            B.BorderSizePixel = 0;
                            D = arg1_41;
                            B.Parent = D;
                            Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0);
                        end;
                        return;
                    end;
                end;
            end; 
        end;
        r[ls[63]] = ls[60];
        ls[60] = 509;
        r[ls[60]] = ls[64];
        ls[64] = 510;
        ls[67] = function(arg1_42, ...)
            local Z = {
                ls[62],
                61,
                60,
                ls[63],
                ls[60]
            };
            v1 = arg1_42;
            g = r[Z[1]][v1];
            if not g or not g.Parent then
                return;
            end;
            v3 = -130;
            if v1 == "loading" and (r[Z[1]].flying and r[Z[1]].flying.Parent) then
                v3 = v3 - r[Z[1]].flying.AbsoluteSize.Y - r[Z[4]];
            end;
            g.SetAttribute(g, "HomeY", v3);
            if not g.GetAttribute(g, "Entering") then
                r[Z[5]](g, {
                    ["Position"] = UDim2.new(1, -(g.AbsoluteSize.X + 16), 1, v3)
                }, .3, Enum.EasingStyle.Quint);
            end;
            return; 
        end;
        r[ls[64]] = ls[65];
        ls[50] = nil;
        ls[65] = 511;
        r[ls[65]] = ls[66];
        ls[66] = 512;
        r[ls[66]] = ls[67];
        ls[68] = function(...)
            if not r76 then
                return;
            end;
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[5]
                };
                if not isfolder(r[Z[1]]) then
                    makefolder(r[Z[1]]);
                end;
                writefile(r[Z[2]], "{\"read\":true}");
                return; 
            end);
            return; 
        end;
        ls[67] = 513;
        r[ls[67]] = ls[68];
        ls[68] = 514;
        r[ls[68]] = ls[69];
        ls[69] = r33;
        ls[71] = r16;
        ls[72] = r15;
        ls[73] = ls[72](ls[74], ls[75]);
        ls[70] = ls[71][ls[73]];
        ls[71] = false;
        ls[69][ls[70]] = ls[71];
        ls[69] = r33;
        ls[71] = r16;
        ls[72] = r15;
        ls[74], ls[75] = "\xc8\xce>\xf5,\xbb+y{5\xd3\xa5\xde\xec\xf9\x16\xc4^", 14676351137124;
        ls[73] = ls[72](ls[74], ls[75]);
        ls[70] = ls[71][ls[73]];
        ls[71], ls[74] = 3, "QB\xedG\x87\x88\xd2\xd1P\xfc\x8b\x02\x84lf\x8a";
        ls[69][ls[70]] = ls[71];
        ls[75] = 12640474508796;
        ls[69] = r33;
        ls[71] = r16;
        ls[72] = r15;
        ls[73] = ls[72](ls[74], ls[75]);
        ls[70] = ls[71][ls[73]];
        ls[72] = r77;
        ls[74] = r16;
        ls[75] = r15;
        ls[76] = ls[75](ls[77], ls[78]);
        ls[75] = 2565247502677;
        ls[73] = ls[74][ls[76]];
        ls[74] = "\xf4\xc47{\xecf\x0fH\xe3B\xdc\xe3\xff";
        ls[71] = ls[72] .. ls[73];
        ls[69][ls[70]] = ls[71];
        ls[71] = "getGuiHintCount";
        ls[69] = function(...)
            local Z = {
                381,
                572,
                61,
                60,
                218
            };
            if not r[Z[1]] then
                return 0;
            end;
            v3 = {
                pcall(function(...)
                    local Z = {
                        Z[2],
                        Z[3],
                        Z[4]
                    };
                    return readfile(r[Z[1]].guiHintCountFile); 
                end)
            };
            r166 = v3[2];
            if not v3[1] or not r166 then
                return 0;
            end;
            R = {
                pcall(function(...)
                    local Z = {
                        a,
                        352
                    };
                    C = r[Z[1]];
                    return C.JSONDecode(C, r[Z[2]]); 
                end)
            };
            v1 = R[2];
            B = R[1];
            if B then
                if v1 then
                    R = type(R[2].count) == "number";
                end;
                C = pcall;
                D = v1;
            end;
            if B then
                return v1.count;
            end;
            return 0; 
        end;
        ls[70] = r33;
        ls[70][ls[71]] = ls[69];
        ls[70] = r33;
        ls[69] = function(...)
            local Z = {
                381,
                572,
                61,
                60,
                382,
                218
            };
            if not r[Z[1]] then
                return;
            end;
            r167 = r[Z[2]].getGuiHintCount() + 1;
            pcall(function(...)
                local Z = {
                    Z[5],
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[6],
                    296
                };
                if not isfolder(r[Z[1]]) then
                    makefolder(r[Z[1]]);
                end;
                g = r[Z[5]];
                writefile(r[Z[2]].guiHintCountFile, g.JSONEncode(g, {
                    ["count"] = r[Z[6]]
                }));
                return; 
            end);
            return; 
        end;
        ls[71] = "incrementGuiHintCount";
        ls[70][ls[71]] = ls[69];
        ls[112] = 22431151247770;
        ls[69] = r33;
        ls[71] = r16;
        ls[72] = r15;
        ls[73] = ls[72](ls[74], ls[75]);
        ls[78] = 17943847223623;
        ls[70] = ls[71][ls[73]];
        ls[72] = r77;
        ls[74] = r16;
        ls[77] = "\x9bC\xcc\r\x05\xc2]\xa2$\xf0Ha\x8c\x8b\xc3\xd4\x94\xc0v\t\xbfg";
        ls[75] = r15;
        ls[76] = ls[75](ls[77], ls[78]);
        ls[73] = ls[74][ls[76]];
        ls[71] = ls[72] .. ls[73];
        ls[69][ls[70]] = ls[71];
        ls[71] = "hasSeenCrashHint";
        ls[70] = r33;
        ls[69] = function(...)
            local Z = {
                381,
                572,
                61,
                60,
                218
            };
            if not r[Z[1]] then
                return true;
            end;
            v3 = {
                pcall(function(...)
                    local Z = {
                        Z[2],
                        Z[3],
                        Z[4]
                    };
                    return readfile(r[Z[1]].crashHintFile); 
                end)
            };
            r168 = v3[2];
            if not v3[1] or not r168 then
                return false;
            end;
            R = {
                pcall(function(...)
                    local Z = {
                        a,
                        408
                    };
                    C = r[Z[1]];
                    return C.JSONDecode(C, r[Z[2]]); 
                end)
            };
            v1 = R[2];
            B = R[1];
            if B then
                D, C = v1 and v1.seen == true, pcall;
            end;
            return B; 
        end;
        ls[83] = 16967786118586;
        ls[70][ls[71]] = ls[69];
        ls[73] = "parseVersionParts";
        ls[70] = r33;
        ls[71] = "markCrashHintSeen";
        ls[69] = function(...)
            if not r76 then
                return;
            end;
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[5]
                };
                if not isfolder(r[Z[1]]) then
                    makefolder(r[Z[1]]);
                end;
                writefile(r[Z[2]].crashHintFile, "{\"seen\":true}");
                return; 
            end);
            return; 
        end;
        ls[70][ls[71]] = ls[69];
        ls[137] = "\x8e\x1f(\x04(P.\x18B\xea\xbe\x0e\xb2\t";
        ls[70] = r33;
        ls[69] = function(arg1_43, ...)
            r169 = arg1_43;
            if not r76 then
                return;
            end;
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[5],
                    Z[6],
                    237
                };
                if not isfolder(r[Z[1]]) then
                    makefolder(r[Z[1]]);
                end;
                g = r[Z[5]];
                writefile(r[Z[2]].autoExecFlagFile, g.JSONEncode(g, {
                    ["enabled"] = r[Z[6]]
                }));
                return; 
            end);
            return; 
        end;
        ls[71] = "saveAutoExecFlag";
        ls[70][ls[71]] = ls[69];
        ls[69] = function(arg1_44, arg2_44, arg3_44, ...)
            local Z = {
                ls[68],
                61,
                60,
                ls[60],
                ls[67]
            };
            v3, g, v1 = arg3_44, arg2_44, arg1_44;
            if r[Z[1]]() then
                return;
            end;
            q = 2602829613432;
            r170 = Instance.new("ScreenGui");
            r170.Name = "IFlyAnnouncement";
            r170.ResetOnSpawn = false;
            a, v2 = "!\xe4\xbb\xf1\xbf\x07z", 11495830792658;
            i = r[Z[3]](a, v2);
            Q, M = 12850934329024, "\xb0n\n\"\xd1\x8b\x83!Q\xd1\x18\xfa";
            r170.ZIndexBehavior = Enum[r[Z[2]][r[Z[3]]("j~k\x14\x06\xe9\xd4\xce\xa7\xf5\xe7\xf1\xb4Y", q)]][r[Z[2]][i]];
            v4 = r[Z[3]](M, Q);
            r170[r[Z[2]][v4]] = 50;
            if gethui then
                r170.Parent = gethui();
            else
                R = syn;
                if R and syn.protect_gui then
                    syn.protect_gui(r170);
                    R = game;
                    r170.Parent = R.GetService(R, "CoreGui");
                else
                    R = game;
                    r170.Parent = R.GetService(R, "CoreGui");
                end;
                r171 = Instance.new("Frame");
                r171.Size = UDim2.new(1, 0, 1, 0);
                r171.BackgroundColor3 = Color3.new(0, 0, 0);
                r171.BackgroundTransparency = 1;
                r171.BorderSizePixel = 0;
                r171.Parent = r170;
                r[Z[4]](r171, {
                    ["BackgroundTransparency"] = .45
                }, 0.5, Enum.EasingStyle.Sine);
                r172 = Instance.new("CanvasGroup");
                r172.Size = UDim2.new(0, 420, 0, 0);
                r172.AutomaticSize = Enum.AutomaticSize.Y;
                r172.AnchorPoint = Vector2.new(0.5, 0.5);
                r172.Position = UDim2.new(0.5, 0, .52, 0);
                r172.BackgroundTransparency = 1;
                r172.GroupTransparency = 0;
                r172.BorderSizePixel = 0;
                r172.Parent = r170;
                v4 = Instance.new("Frame");
                v4.Size = UDim2.new(1, 0, 1, 0);
                v4.AutomaticSize = Enum.AutomaticSize.Y;
                v4.BackgroundColor3 = Color3.fromRGB(20, 14, 38);
                v4.BackgroundTransparency = .04;
                v4.BorderSizePixel = 0;
                v4.Parent = r172;
                Instance.new("UICorner", v4).CornerRadius = UDim.new(0, 18);
                M = Instance.new("UIStroke");
                M.Color = Color3.fromRGB(130, 90, 200);
                M.Transparency = .3;
                M.Thickness = 1.5;
                M.Parent = v4;
                Q = Instance.new("Frame");
                Q.Size = UDim2.new(1, 0, 0, 4);
                Q.BackgroundColor3 = Color3.fromRGB(150, 110, 230);
                Q.BorderSizePixel = 0;
                Q.Parent = v4;
                Instance.new("UICorner", Q).CornerRadius = UDim.new(0, 18);
                i = Instance.new("UIGradient");
                i.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 70, 200)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(190, 140, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 70, 200))
                });
                i.Parent = Q;
                a = Instance.new("UIPadding");
                a.PaddingLeft = UDim.new(0, 28);
                a.PaddingRight = UDim.new(0, 28);
                a.PaddingTop = UDim.new(0, 28);
                a.PaddingBottom = UDim.new(0, 24);
                a.Parent = v4;
                v2 = Instance.new("UIListLayout");
                v2.SortOrder = Enum.SortOrder.LayoutOrder;
                v2.Padding = UDim.new(0, 12);
                v2.Parent = v4;
                q = Instance.new("TextLabel");
                q.Size = UDim2.new(1, 0, 0, 14);
                q.BackgroundTransparency = 1;
                D, o = v3, "Text";
                if v3 then
                    C = r[Z[3]];
                    q[C] = v3;
                    q.TextColor3 = Color3.fromRGB(150, 120, 200);
                    q.Font = Enum.Font.GothamBold;
                    q.TextSize = 11;
                    q.TextXAlignment = Enum.TextXAlignment.Left;
                    q.LayoutOrder = 1;
                    D = Instance.new("Frame");
                    q.Parent = D;
                    o = Instance.new("TextLabel");
                    o.Size = UDim2.new(1, 0, 0, 0);
                    o.AutomaticSize = Enum.AutomaticSize.Y;
                    o.BackgroundTransparency = 1;
                    D = arg1_44;
                    o.Text = D;
                    o.TextColor3 = Color3.fromRGB(245, 238, 255);
                    o.Font = Enum.Font.GothamBold;
                    o.TextSize = 22;
                    o.TextWrapped = true;
                    o.TextXAlignment = Enum.TextXAlignment.Left;
                    o.LayoutOrder = 2;
                    o.Parent = v4;
                    O = Instance.new("Frame");
                    O.Size = UDim2.new(1, 0, 0, 1);
                    O.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                    O.BackgroundTransparency = .82;
                    O.BorderSizePixel = 0;
                    O.LayoutOrder = 3;
                    O.Parent = v4;
                    S = Instance.new("TextLabel");
                    S.Size = UDim2.new(1, 0, 0, 0);
                    S.AutomaticSize = Enum.AutomaticSize.Y;
                    S.BackgroundTransparency = 1;
                    D = arg2_44;
                    S.Text = D;
                    S.TextColor3 = Color3.fromRGB(210, 200, 235);
                    S.Font = Enum.Font.Gotham;
                    S.TextSize = 14;
                    S.TextWrapped = true;
                    S.LineHeight = 1.4;
                    S.TextXAlignment = Enum.TextXAlignment.Left;
                    S.LayoutOrder = 4;
                    S.Parent = v4;
                    r173 = Instance.new("TextButton");
                    r173.Size = UDim2.new(1, 0, 0, 42);
                    r173.BackgroundColor3 = Color3.fromRGB(130, 90, 210);
                    r173.BackgroundTransparency = .3;
                    r173.Text = "Got it";
                    r173.TextColor3 = Color3.fromRGB(248, 244, 255);
                    r173.Font = Enum.Font.GothamBold;
                    r173.TextSize = 13;
                    r173.AutoButtonColor = false;
                    r173.LayoutOrder = 5;
                    r173.Parent = v4;
                    Instance.new("UICorner", r173).CornerRadius = UDim.new(0, 12);
                    C = r173.MouseEnter;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[4],
                            151,
                            Z[2],
                            Z[3]
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .15
                        }, .15, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    C = r173.MouseLeave;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[4],
                            151,
                            Z[2],
                            Z[3]
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .3
                        }, .15, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    local function r174(...)
                        local Z = {
                            Z[5],
                            Z[4],
                            324,
                            Z[2],
                            Z[3],
                            325,
                            5
                        };
                        r[Z[1]]();
                        r[Z[2]](r[Z[3]], {
                            ["BackgroundTransparency"] = 1
                        }, .35, Enum.EasingStyle.Sine);
                        r[Z[2]](r[Z[6]], {
                            ["GroupTransparency"] = 1,
                            ["Position"] = UDim2.new(0.5, 0, .54, 0)
                        }, .35, Enum.EasingStyle.Quint);
                        task.delay(.4, function(...)
                            local Z = {
                                5
                            };
                            pcall(function(...)
                                C = r[5];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                        return; 
                    end;
                    C = r173.MouseButton1Click;
                    C.Connect(C, r174);
                    C = r171.InputBegan;
                    C.Connect(C, function(arg1_45, ...)
                        local Z = {
                            Z[2],
                            Z[3],
                            152
                        };
                        if arg1_45.UserInputType == Enum.UserInputType.MouseButton1 then
                            r[Z[3]]();
                        end;
                        return; 
                    end);
                    r172.Position = UDim2.new(0.5, 0, .56, 0);
                    r172.GroupTransparency = 1;
                    r[Z[4]](r172, {
                        ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                        ["GroupTransparency"] = 0
                    }, .45, Enum.EasingStyle.Back);
                    return;
                else
                    D = "";
                end;
            end; 
        end;
        ls[71] = function(arg1_46, arg2_46, arg3_46, arg4_46, arg5_46, arg6_46, arg7_46, ...)
            local Z = {
                61,
                60,
                ls[62],
                ls[64],
                ls[60],
                220,
                ls[65],
                ls[63],
                ls[66],
                215
            };
            B, Q, v3 = arg4_46, As, arg3_46;
            r175 = arg6_46;
            g = arg2_46;
            r176 = arg7_46;
            v1, R = arg1_46, arg5_46 or 3;
            if v3 then
                v3, C = v3, Q;
                i = C;
                if B then
                    B, C = B, r175 or "flying";
                    r175 = r175 or "flying";
                    C = C;
                    if not r[Z[3]][r175] then
                        r175 = "flying";
                    end;
                    C = C;
                    if r[Z[3]][r175] and r[Z[3]][r175].Parent then
                        r177 = r[Z[3]][r175];
                        r[Z[3]][r175] = nil;
                        pcall(function(...)
                            local Z = {
                                Z[5],
                                283,
                                Z[1],
                                Z[2]
                            };
                            r[Z[1]](r[Z[2]], {
                                ["Position"] = r[Z[2]].Position + UDim2.new(0, r[Z[2]].AbsoluteSize.X + 40, 0, 0),
                                ["GroupTransparency"] = 1
                            }, .22, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                            return; 
                        end);
                        task.delay(.26, function(...)
                            pcall(function(...)
                                C = r[o];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                    end;
                    Y = 12;
                    r178 = 14;
                    r179 = 12;
                    r180 = 34;
                    S = r178 + r180 + 12;
                    h = 380 - S - 16;
                    J = r[Z[6]];
                    if g then
                        L = arg2_46 ~= "";
                    end;
                    C = C;
                    if g then
                        I = r[Z[6]];
                        J = I.GetTextSize(I, arg2_46, 12, Enum.Font.Gotham, Vector2.new(h, math.huge)).X;
                    end;
                    r181 = math.clamp(S + math.max(J.GetTextSize(J, v1, 14, Enum.Font.GothamBold, Vector2.new(h, math.huge)).X, 0) + 16, 230, 380);
                    r182 = Instance.new("CanvasGroup");
                    r182.Size = UDim2.new(0, r181, 0, 0);
                    r182.AutomaticSize = Enum.AutomaticSize.Y;
                    r182.Position = UDim2.new(1, r181 + 20, 1, -130);
                    r182.AnchorPoint = Vector2.new(0, 0);
                    r182.BackgroundColor3 = Color3.fromRGB(250, 248, 254);
                    r182.BackgroundTransparency = .08;
                    r182.GroupTransparency = 1;
                    r182.BorderSizePixel = 0;
                    xg = r[Z[4]]();
                    r182.Parent = xg;
                    wg = r182;
                    wg.SetAttribute(wg, "Entering", true);
                    r[Z[3]][r175] = r182;
                    Instance.new("UICorner", r182).CornerRadius = UDim.new(0, 16);
                    Cg = Instance.new("ImageLabel");
                    Cg.BackgroundTransparency = 1;
                    Cg.Image = "rbxassetid://6014261993";
                    Cg.ImageColor3 = Color3.fromRGB(25, 15, 45);
                    Cg.ImageTransparency = .72;
                    Cg.ScaleType = Enum.ScaleType.Slice;
                    Cg.SliceCenter = Rect.new(49, 49, 450, 450);
                    Cg.Size = UDim2.new(1, 24, 1, 24);
                    Cg.Position = UDim2.new(0, -12, 0, -9);
                    Cg.ZIndex = 0;
                    Cg.Parent = r182;
                    xg = Instance.new("UIStroke");
                    xg.Color = Color3.new(1, 1, 1);
                    xg.Transparency = .3;
                    xg.Thickness = 1.3;
                    xg.Parent = r182;
                    r183 = Instance.new("UIGradient");
                    r183.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(190, 140, 255)),
                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 90, 230)),
                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 140, 255))
                    });
                    r183.Parent = xg;
                    Zg = Instance.new("UIGradient");
                    Zg.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 228, 246))
                    });
                    Zg.Rotation = 105;
                    Zg.Parent = r182;
                    r184 = Instance.new("Frame");
                    r184.Size = UDim2.new(0, r180, 0, r180);
                    r184.Position = UDim2.new(0, r178, 0, r179);
                    rg = v3;
                    r184.BackgroundColor3 = rg;
                    r184.BackgroundTransparency = .78;
                    r184.Parent = r182;
                    Instance.new("UICorner", r184).CornerRadius = UDim.new(1, 0);
                    r185 = Instance.new("UIStroke");
                    r185.Color = v3;
                    r185.Transparency = .35;
                    r185.Thickness = 1.3;
                    r185.Parent = r184;
                    r[Z[7]](r184, B, v3);
                    rg = Instance.new("Frame");
                    rg.Size = UDim2.new(1, -(S + 16), 0, 0);
                    rg.AutomaticSize = Enum.AutomaticSize.Y;
                    rg.Position = UDim2.new(0, S, 0, r179 - 2);
                    rg.BackgroundTransparency = 1;
                    rg.Parent = r182;
                    Ag = Instance.new("UIListLayout");
                    Ag.SortOrder = Enum.SortOrder.LayoutOrder;
                    Ag.Padding = UDim.new(0, 3);
                    Ag.Parent = rg;
                    Dg = Instance.new("TextLabel");
                    Dg.Size = UDim2.new(1, 0, 0, 16);
                    Dg.LayoutOrder = 1;
                    Dg.BackgroundTransparency = 1;
                    Dg.Text = v1;
                    Dg.TextColor3 = Color3.fromRGB(24, 10, 52);
                    Dg.Font = Enum.Font.GothamBold;
                    Dg.TextSize = 14;
                    Dg.TextXAlignment = Enum.TextXAlignment.Left;
                    Dg.TextTruncate = Enum.TextTruncate.AtEnd;
                    Dg.Parent = rg;
                    yg = Instance.new("TextLabel");
                    yg.Size = UDim2.new(1, 0, 0, 0);
                    yg.AutomaticSize = Enum.AutomaticSize.Y;
                    yg.LayoutOrder = 2;
                    yg.BackgroundTransparency = 1;
                    Hg = C;
                    Pg = "Text";
                    gg = g;
                    if g then
                        yg[r[Z[1]][Bg]] = g;
                        C = C;
                        yg.TextColor3 = Color3.fromRGB(70, 44, 108);
                        yg.Font = Enum.Font.Gotham;
                        yg.TextSize = 12;
                        yg.TextWrapped = true;
                        yg.TextXAlignment = Enum.TextXAlignment.Left;
                        yg.TextYAlignment = Enum.TextYAlignment.Top;
                        if g then
                            Pg = arg2_46 ~= "";
                        end;
                        C = C;
                        if g then
                            Instance.new("TextLabel").Parent = Instance.new("Frame");
                        end;
                        gg = Instance.new("Frame");
                        gg.Size = UDim2.new(1, 0, 0, 7);
                        gg.BackgroundTransparency = 1;
                        gg.LayoutOrder = 3;
                        Hg = Instance.new("Frame");
                        gg.Parent = Hg;
                        Hg = Instance.new("Frame");
                        Hg.Size = UDim2.new(1, 0, 0, 3);
                        Hg.LayoutOrder = 4;
                        Hg.BackgroundColor3 = Color3.fromRGB(60, 45, 95);
                        Hg.BackgroundTransparency = .85;
                        Hg.BorderSizePixel = 0;
                        Hg.Parent = rg;
                        Instance.new("UICorner", Hg).CornerRadius = UDim.new(1, 0);
                        Bg = Instance.new("Frame");
                        Bg.Size = UDim2.new(1, 0, 1, 0);
                        Fg = M;
                        Bg.BackgroundColor3 = Fg;
                        Bg.BorderSizePixel = 0;
                        Bg.Parent = Hg;
                        Instance.new("UICorner", Bg).CornerRadius = UDim.new(1, 0);
                        Fg = Instance.new("UIGradient");
                        Fg.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, M),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 225, 255))
                        });
                        Fg.Parent = Bg;
                        Rg = Instance.new("Frame");
                        Rg.Size = UDim2.new(1, 0, 0, 12);
                        Rg.LayoutOrder = 5;
                        Rg.BackgroundTransparency = 1;
                        Rg.Parent = rg;
                        r184.Size = UDim2.new(0, 0, 0, 0);
                        r184.Position = UDim2.new(0, r178 + r180 / 2, 0, r179 + r180 / 2);
                        C = C;
                        if r175 == "loading" and (r[Z[3]].flying and r[Z[3]].flying.Parent) then
                            Pg = -130 - r[Z[3]].flying.AbsoluteSize.Y - r[Z[8]];
                        end;
                        r[Z[5]](r182, {
                            ["Position"] = UDim2.new(1, -(r181 + 16), 1, -130),
                            ["GroupTransparency"] = 0
                        }, .42, Enum.EasingStyle.Back);
                        task.delay(.42, function(...)
                            local Z = {
                                594,
                                Z[1],
                                Z[2],
                                252,
                                Z[9]
                            };
                            C = r[Z[1]];
                            C.SetAttribute(C, "Entering", nil);
                            if r[Z[4]] == "flying" then
                                r[Z[5]]("loading");
                            end;
                            return; 
                        end);
                        task.delay(.1, function(...)
                            local Z = {
                                Z[5],
                                596,
                                Z[1],
                                Z[2],
                                380,
                                378,
                                379
                            };
                            pcall(function(...)
                                local Z = {
                                    Z[1],
                                    Z[2],
                                    Z[3],
                                    Z[4],
                                    Z[5],
                                    Z[6],
                                    Z[7]
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["Size"] = UDim2.new(0, r[Z[5]], 0, r[Z[5]]),
                                    ["Position"] = UDim2.new(0, r[Z[6]], 0, r[Z[7]])
                                }, 0.5, Enum.EasingStyle.Elastic);
                                return; 
                            end);
                            return; 
                        end);
                        if r175 == "flying" then
                            task.spawn(function(...)
                                local Z = {
                                    594,
                                    Z[1],
                                    Z[2],
                                    Z[9],
                                    Z[10]
                                };
                                D = r[Z[1]];
                                while D.Parent do
                                    if r[Z[1]].AbsoluteSize.Y ~= r[Z[1]].AbsoluteSize.Y then
                                        v1 = r[Z[1]].AbsoluteSize.Y;
                                        r[Z[4]]("loading");
                                    end;
                                    D = r[Z[5]].Heartbeat;
                                    D.Wait(D); 
                                end;
                                return; 
                            end);
                        end;
                        task.spawn(function(...)
                            local Z = {
                                Z[1],
                                Z[2],
                                594,
                                595,
                                597,
                                Z[10]
                            };
                            v1 = os.clock();
                            C = r[Z[3]].Parent;
                            while C do
                                r[Z[4]].Rotation = (os.clock() - v1) * 40 % 360;
                                r[Z[5]].Transparency = .3 + 0.25 * (0.5 + 0.5 * math.sin((os.clock() - v1) * 3));
                                C = r[Z[6]].Heartbeat;
                                C.Wait(C); 
                            end;
                            return; 
                        end);
                        r[Z[5]](Bg, {
                            ["Size"] = UDim2.new(0, 0, 1, 0)
                        }, D, Enum.EasingStyle.Linear);
                        r186 = false;
                        local function r187(...)
                            local Z = {
                                14,
                                Z[3],
                                252,
                                594,
                                Z[5],
                                Z[1],
                                Z[2],
                                593,
                                Z[9]
                            };
                            if r[Z[1]] then
                                return;
                            end;
                            r[Z[1]] = true;
                            if r[Z[2]][r[Z[3]]] ~= r[Z[4]] then
                                return;
                            end;
                            r[Z[2]][r[Z[3]]] = nil;
                            pcall(function(...)
                                local Z = {
                                    Z[5],
                                    Z[4],
                                    Z[6],
                                    Z[7],
                                    Z[8]
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["Position"] = r[Z[2]].Position + UDim2.new(0, r[Z[5]] + 40, 0, 0),
                                    ["GroupTransparency"] = 1
                                }, .32, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                                return; 
                            end);
                            task.delay(.38, function(...)
                                local Z = {
                                    Z[4],
                                    Z[3],
                                    Z[6],
                                    Z[7],
                                    Z[9]
                                };
                                pcall(function(...)
                                    C = r[Z[4]];
                                    C.Destroy(C);
                                    return; 
                                end);
                                if r[Z[2]] == "flying" then
                                    r[Z[5]]("loading");
                                end;
                                return; 
                            end);
                            return; 
                        end;
                        if r176 then
                            pcall(function(...)
                                local Z = {
                                    594,
                                    Z[1],
                                    Z[2],
                                    253,
                                    15
                                };
                                r[Z[1]].Active = true;
                                C = r[Z[1]].InputBegan;
                                C.Connect(C, function(arg1_47, ...)
                                    local Z = {
                                        Z[2],
                                        Z[3],
                                        Z[4],
                                        Z[5]
                                    };
                                    v1 = arg1_47;
                                    if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                                        pcall(r[Z[3]]);
                                        r[Z[4]]();
                                    end;
                                    return; 
                                end);
                                return; 
                            end);
                        end;
                        task.delay(D, r187);
                        return;
                    else
                        gg = "";
                    end;
                else
                    Q = "info";
                end;
            else
                M = Color3.fromRGB(170, 120, 230);
            end; 
        end;
        ls[70] = 515;
        r[ls[70]] = ls[71];
        ls[71] = function(arg1_48, ...)
            local Z = {
                61,
                60
            };
            g = {};
            D = tostring(arg1_48);
            E = {
                D.gmatch(D, "%d+")
            };
            B = E[1](E[2], E[3]);
            while B do
                E = B;
                table.insert(g, tonumber(E)); 
            end;
            return g; 
        end;
        ls[72] = r33;
        ls[77] = "D_\xf6$\x9e\xd9m";
        ls[72][ls[73]] = ls[71];
        ls[71] = function(arg1_49, arg2_49, ...)
            local Z = {
                572,
                61,
                60
            };
            v3 = r[Z[1]].parseVersionParts(arg2_49);
            B = r[Z[1]].parseVersionParts(arg1_49);
            C = math.max;
            for s = 1, C(#B, #v3) do
                a, v2 = v3[v4] or 0, C;
                v2 = B[v4] or 0;
                if v2 > a then
                    return true;
                else
                    if v2 < a then
                        return false;
                    else
                        
                    end;
                end; 
            end;
            return false; 
        end;
        ls[22] = nil;
        ls[117] = "\xc6\xd2=\xae\xbb\xd5\xb57\xe44\xef}";
        ls[72] = r33;
        ls[73] = "isRemoteVersionNewer";
        ls[72][ls[73]] = ls[71];
        ls[73], ls[78] = "fetchUrl", 29645842738137;
        ls[72] = r33;
        ls[71] = function(arg1_50, ...)
            local Z = {
                61,
                60,
                218
            };
            r188 = arg1_50;
            E = {
                pcall(function(...)
                    C = game;
                    return C.HttpGet(C, r188, true); 
                end)
            };
            v3, g = E[2], E[1];
            if g then
                R, C = type(v3) == "string" and v3 ~= "", pcall;
            end;
            if g then
                return v3;
            end;
            C = pcall;
            M = {
                C(function(...)
                    local Z = {
                        a,
                        124
                    };
                    C = r[Z[1]];
                    return C.GetAsync(C, r[Z[2]]); 
                end)
            };
            g = M[1];
            v3 = M[2];
            if g then
                v4, C = type(v3) == "string" and v3 ~= "", pcall;
            end;
            if g then
                return v3;
            end;
            M = typeof(request) == "function" and request;
            C = C;
            if M then
                r189 = M;
                if r189 then
                    a = {
                        pcall(function(...)
                            local Z = {
                                357,
                                Z[1],
                                Z[2],
                                124
                            };
                            v1 = r[Z[1]]({
                                ["Url"] = r[Z[4]],
                                ["Method"] = "GET"
                            });
                            if v1 then
                                D = v1.Body;
                            end;
                            return v1; 
                        end)
                    };
                    v3 = a[2];
                    g = a[1];
                    if g then
                        C = pcall;
                        i = type(v3) == "string" and v3 ~= "";
                    end;
                    if g then
                        return v3;
                    end;
                end;
                if syn and typeof(syn.request) == "function" then
                    q = {
                        pcall(function(...)
                            local Z = {
                                Z[1],
                                Z[2],
                                124
                            };
                            v1 = syn.request({
                                ["Url"] = r[Z[3]],
                                ["Method"] = "GET"
                            });
                            if v1 then
                                D = v1.Body;
                            end;
                            return v1; 
                        end)
                    };
                    g = q[1];
                    v3 = q[2];
                    if g then
                        v2, C = type(v3) == "string" and v3 ~= "", pcall;
                    end;
                    if g then
                        return v3;
                    end;
                end;
                return nil;
            else
                v4, C = typeof(http_request) == "function" and http_request, C;
            end; 
        end;
        ls[72][ls[73]] = ls[71];
        ls[73] = "checkForUpdate";
        ls[71] = function(...)
            local Z = {
                572,
                61,
                60,
                38,
                ls[70]
            };
            if r[Z[1]].killed then
                return false;
            end;
            if r[Z[1]].updateNoticeShown then
                return true;
            end;
            v1 = r[Z[1]].fetchUrl(r[Z[4]].VERSION_CHECK_URL);
            if type(v1) ~= "string" then
                return false;
            end;
            g = v1.match(v1, "%S+");
            if not g or g == "" then
                return false;
            end;
            if r[Z[1]].isRemoteVersionNewer(g, r[Z[4]].SCRIPT_VERSION) then
                r[Z[1]].updateNoticeShown = true;
                pcall(function(...)
                    local Z = {
                        Z[5],
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]]("Invincible Fly", "This is not the latest iteration of the script! Please re-execute to get it", Color3.fromRGB(225, 95, 95), "error", 8);
                    return; 
                end);
                return true;
            end;
            return false; 
        end;
        ls[72] = r33;
        ls[72][ls[73]] = ls[71];
        ls[73] = "Color3";
        ls[72] = Env[ls[73]];
        ls[74] = r16;
        ls[75] = r15;
        ls[76] = ls[75](ls[77], ls[78]);
        ls[73] = ls[74][ls[76]];
        ls[74] = 255;
        ls[71] = ls[72][ls[73]];
        ls[75], ls[73] = 255, 255;
        ls[72] = ls[71](ls[73], ls[74], ls[75]);
        ls[71] = 516;
        r[ls[71]] = ls[72];
        ls[74] = "Color3";
        ls[73] = Env[ls[74]];
        ls[75] = r16;
        ls[76] = r15;
        ls[78] = "\x96\x89\x83=\x00\x9c\x89";
        ls[77] = ls[76](ls[78], ls[79]);
        ls[76] = 244;
        ls[74] = ls[75][ls[77]];
        ls[75] = 230;
        ls[72] = ls[73][ls[74]];
        ls[74] = 232;
        ls[73] = ls[72](ls[74], ls[75], ls[76]);
        ls[76] = "Color3";
        ls[72] = 517;
        r[ls[72]] = ls[73];
        ls[74] = 518;
        ls[73] = .72;
        r[ls[74]] = ls[73];
        ls[75] = Env[ls[76]];
        ls[77] = r16;
        ls[78] = r15;
        ls[108] = "q\x9a=";
        ls[79] = ls[78](ls[80], ls[81]);
        ls[76] = ls[77][ls[79]];
        ls[77] = 110;
        ls[73] = ls[75][ls[76]];
        ls[78], ls[81], ls[76] = 230, "\x9f\x1d\x93\x87\xd2\x9fr", 150;
        ls[75] = ls[73](ls[76], ls[77], ls[78]);
        ls[73] = 519;
        ls[77] = "Color3";
        r[ls[73]] = ls[75];
        ls[76] = Env[ls[77]];
        ls[78] = r16;
        ls[79] = r15;
        ls[80] = ls[79](ls[81], ls[82]);
        ls[77] = ls[78][ls[80]];
        ls[79], ls[78], ls[82] = 250, 190, "H\xfa\xf8uix\xbd";
        ls[75] = ls[76][ls[77]];
        ls[77] = 210;
        ls[76] = ls[75](ls[77], ls[78], ls[79]);
        ls[78] = "Color3";
        ls[77] = Env[ls[78]];
        ls[79] = r16;
        ls[80] = r15;
        ls[81] = ls[80](ls[82], ls[83]);
        ls[101] = 23271916754089;
        ls[78] = ls[79][ls[81]];
        ls[75] = ls[77][ls[78]];
        ls[80], ls[78], ls[79] = 48, 22, 8;
        ls[77] = ls[75](ls[78], ls[79], ls[80]);
        ls[75] = 520;
        ls[79], ls[83], ls[98] = "Color3", "9\xae\xf0\xc2\x88\x0fA", 15933741185527;
        r[ls[75]] = ls[77];
        ls[78] = Env[ls[79]];
        ls[80] = r16;
        ls[81] = r15;
        ls[82] = ls[81](ls[83], ls[84]);
        ls[79] = ls[80][ls[82]];
        ls[135], ls[84], ls[80] = "\xb69A,\x0e\x1b@\x99\x8dm", "\x97Z$\x99\xb01\x90", 28;
        ls[77] = ls[78][ls[79]];
        ls[79], ls[81] = 55, 90;
        ls[78] = ls[77](ls[79], ls[80], ls[81]);
        ls[80] = "Color3";
        ls[77] = 521;
        r[ls[77]] = ls[78];
        ls[79] = Env[ls[80]];
        ls[81] = r16;
        ls[82] = r15;
        ls[83] = ls[82](ls[84], ls[85]);
        ls[80] = ls[81][ls[83]];
        ls[82] = 115;
        ls[78] = ls[79][ls[80]];
        ls[113], ls[80], ls[81] = "\xb3\xbc\xa9C\xe8:\xcd\xb9\xa0\xeaer\xcf`", 80, 50;
        ls[91] = 522;
        ls[79] = ls[78](ls[80], ls[81], ls[82]);
        ls[78] = 523;
        r[ls[78]] = ls[79];
        ls[81] = "Color3";
        ls[80] = Env[ls[81]];
        ls[82] = r16;
        ls[85] = "\xf9\xc1Ig\xd7\xad\xf4";
        ls[83] = r15;
        ls[84] = ls[83](ls[85], ls[86]);
        ls[81] = ls[82][ls[84]];
        ls[55] = nil;
        ls[83], ls[82] = 95, 95;
        ls[79] = ls[80][ls[81]];
        ls[81], ls[86] = 225, "\x86\x1c\x17\x1d\x08n\r";
        ls[80] = ls[79](ls[81], ls[82], ls[83]);
        ls[79] = 524;
        r[ls[79]] = ls[80];
        ls[88], ls[82] = "maybeShowCrashHint", "Color3";
        ls[81] = Env[ls[82]];
        ls[121] = "\x11\xdf\x82\xf3\x9eOz*\xbc\xf7\xd7\x03";
        ls[83] = r16;
        ls[84] = r15;
        ls[85] = ls[84](ls[86], ls[87]);
        ls[82] = ls[83][ls[85]];
        ls[80] = ls[81][ls[82]];
        ls[83], ls[84], ls[82] = 195, 140, 95;
        ls[81] = ls[80](ls[82], ls[83], ls[84]);
        ls[80] = 525;
        r[ls[80]] = ls[81];
        ls[84] = 526;
        ls[83] = 527;
        ls[81] = r[ls[73]];
        ls[82] = 528;
        r[ls[82]] = ls[81];
        ls[81] = nil;
        r[ls[83]] = ls[81];
        ls[81] = nil;
        ls[85] = 529;
        r[ls[84]] = ls[81];
        ls[81] = nil;
        r[ls[85]] = ls[81];
        ls[81] = function(...)
            local Z = {
                61,
                60,
                ls[85],
                222,
                437,
                38,
                ls[60],
                ls[73],
                215,
                216,
                386,
                ls[70],
                ls[79],
                385,
                387,
                389,
                ls[80],
                ls[71],
                ls[75],
                436,
                ls[78],
                ls[77],
                243,
                244,
                54,
                39,
                241,
                442,
                572,
                ls[1],
                ls[2],
                56,
                246,
                247,
                55,
                245,
                34,
                33,
                32,
                35,
                249,
                37,
                248,
                220,
                ls[7],
                ls[82],
                ls[9],
                44,
                47,
                45,
                40,
                49,
                50,
                46,
                41,
                48,
                ls[72],
                ls[74],
                ls[83],
                ls[84]
            };
            r[Z[3]] = {
                ["open"] = false,
                ["minimized"] = false,
                ["capturing"] = nil,
                ["inputLockUntil"] = 0,
                ["container"] = nil,
                ["card"] = nil,
                ["buttons"] = {},
                ["footer"] = nil
            };
            r190 = 340;
            r191 = 50;
            r192 = 560;
            r193 = .2;
            local function r195(...)
                local Z = {
                    130,
                    Z[1],
                    Z[2],
                    Z[4]
                };
                if r[Z[1]] and r[Z[1]].Parent then
                    return r[Z[1]];
                end;
                r196 = Instance.new("ScreenGui");
                r196.Name = "IFlyMenu";
                r196.ResetOnSpawn = false;
                r196.IgnoreGuiInset = true;
                r196.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                if gethui then
                    r196.Parent = gethui();
                else
                    g = syn;
                    if g and syn.protect_gui then
                        syn.protect_gui(r196);
                        g = game;
                        r196.Parent = g.GetService(g, "CoreGui");
                    else
                        g = pcall(function(...)
                            local Z = {
                                233,
                                Z[2],
                                Z[3]
                            };
                            v1 = game;
                            r[Z[1]].Parent = v1.GetService(v1, "CoreGui");
                            return; 
                        end);
                        if not g then
                            v3 = r[Z[4]];
                            r196.Parent = v3.WaitForChild(v3, "PlayerGui");
                        end;
                        r[Z[1]] = r196;
                        return r196;
                    end;
                end; 
            end;
            local function r197(...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    Z[5],
                    Z[6]
                };
                if r[Z[1]].footer then
                    r[Z[1]].footer.Text = r[Z[4]](r[Z[5]].KEY_MENU) .. " to hide   \xe2\x80\xa2   drag the top bar to move";
                end;
                return; 
            end;
            local function r198(arg1_51, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[7]
                };
                r199 = arg1_51;
                r200 = r199.Size;
                r[Z[3]](r199, {
                    ["Size"] = r200 - UDim2.new(0, 6, 0, 4)
                }, .07, Enum.EasingStyle.Quad);
                task.delay(.08, function(...)
                    local Z = {
                        Z[3],
                        164,
                        Z[1],
                        Z[2],
                        165
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3],
                            Z[4],
                            Z[5]
                        };
                        r[Z[1]](r[Z[2]], {
                            ["Size"] = r[Z[5]]
                        }, 0.25, Enum.EasingStyle.Back);
                        return; 
                    end);
                    return; 
                end);
                return; 
            end;
            local function r201(...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    136
                };
                r[Z[1]].capturing = nil;
                r[Z[1]].inputLockUntil = os.clock() + r[Z[4]];
                return; 
            end;
            local function r202(arg1_52, arg2_52, arg3_52, ...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    Z[7],
                    Z[8],
                    Z[9],
                    Z[5],
                    Z[6],
                    140,
                    Z[10],
                    Z[11],
                    Z[12],
                    Z[13],
                    Z[14],
                    Z[15],
                    Z[16],
                    143,
                    145,
                    Z[17]
                };
                r203 = arg1_52;
                r204 = arg2_52;
                r205 = arg3_52;
                if r[Z[1]].capturing then
                    return;
                end;
                C = r[Z[1]];
                C.capturing = r203;
                B = r205;
                if B then
                    r205 = B;
                    r204.Text = "press a key";
                    r[Z[4]](r204, {
                        ["BackgroundColor3"] = r[Z[5]],
                        ["BackgroundTransparency"] = .55
                    }, .2, Enum.EasingStyle.Sine);
                    if r205 then
                        r205.Color = r[Z[5]];
                    end;
                    task.spawn(function(...)
                        local Z = {
                            Z[2],
                            Z[3],
                            Z[1],
                            334,
                            336,
                            335,
                            Z[6],
                            Z[4]
                        };
                        os.clock();
                        g = r[Z[3]].capturing == r[Z[4]];
                        D = g;
                        while not g do
                            if g then
                                if r[Z[6]] then
                                    r[Z[6]].Transparency = .1 + .35 * (0.5 + 0.5 * math.sin((os.clock() - C()) * 6));
                                end;
                                C = r[Z[7]].Heartbeat;
                                C.Wait(C);
                            end;
                            if r[Z[6]] then
                                r[Z[6]].Color = Color3.fromRGB(140, 100, 210);
                                r[Z[6]].Transparency = 0.5;
                                break;
                            end;
                            pcall(function(...)
                                local Z = {
                                    Z[8],
                                    Z[5],
                                    Z[1],
                                    Z[2]
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["BackgroundColor3"] = Color3.fromRGB(36, 26, 64),
                                    ["BackgroundTransparency"] = .12
                                }, 0.25, Enum.EasingStyle.Sine);
                                return; 
                            end);
                            return; 
                        end;
                        D = r[Z[5]].Parent; 
                    end);
                    local function r206(...)
                        local Z = {
                            336,
                            Z[2],
                            Z[3],
                            Z[7],
                            Z[8],
                            334,
                            Z[9]
                        };
                        r[Z[1]].Text = r[Z[4]](r[Z[5]][r[Z[6]].cfg]);
                        r[Z[7]]();
                        return; 
                    end;
                    C = r[Z[10]].InputBegan;
                    r207 = C.Connect(C, function(arg1_53, ...)
                        local Z = {
                            Z[2],
                            Z[3],
                            76,
                            75,
                            Z[11],
                            Z[8],
                            Z[12],
                            Z[7],
                            Z[13],
                            Z[14],
                            334,
                            Z[15],
                            Z[1],
                            Z[16],
                            336,
                            Z[9],
                            Z[17],
                            Z[18],
                            Z[19]
                        };
                        v1 = arg1_53;
                        if v1.UserInputType ~= Enum.UserInputType.Keyboard then
                            return;
                        end;
                        g = v1.KeyCode;
                        C = r[Z[3]];
                        C.Disconnect(C);
                        E = "Escape";
                        if g == Enum.KeyCode[E] or g == Enum.KeyCode.Unknown then
                            r[Z[4]]();
                            return;
                        end;
                        R = r[Z[5]];
                        B, D = E[3], E[1];
                        for B, v4 in R, ipairs(R) do
                            E = B;
                            if r[Z[6]][v4] == g then
                                r[Z[7]]("Occupied Key", r[Z[8]](v1.KeyCode) .. " is used for movement", r[Z[9]], "error", 2.5);
                                r[Z[4]]();
                                return;
                            else
                                
                            end; 
                        end;
                        for E, M in ipairs(r[Z[10]]) do
                            v4 = E;
                            if M.id ~= r[Z[11]].id and r[Z[6]][M.cfg] == g then
                                v3, M = M, nil;
                            else
                                
                            end; 
                        end;
                        B = r[Z[6]][r[Z[11]].cfg];
                        r[Z[6]][r[Z[11]].cfg] = g;
                        r[Z[12]].binds[r[Z[11]].id] = g.Name;
                        if nil then
                            v4 = r[Z[6]][r[Z[11]].cfg];
                            r[Z[6]][nil.cfg] = v4;
                            r[Z[12]].binds[nil.id] = B.Name;
                            R = r[Z[13]].buttons[nil.id];
                            if R then
                                R.Text = r[Z[8]](r[Z[6]][r[Z[11]].cfg]);
                            end;
                        end;
                        r[Z[14]](r[Z[12]]);
                        r[Z[15]].Text = r[Z[8]](g);
                        r[Z[16]]();
                        r[Z[17]](r[Z[15]]);
                        r[Z[18]]();
                        if nil then
                            r[Z[7]]("Keys Swapped", r[Z[11]].label .. " \xe2\x86\x92 " .. r[Z[8]](g) .. "  |  " .. nil.label .. " \xe2\x86\x92 " .. r[Z[8]](B), r[Z[19]], "success", 3);
                        else
                            r[Z[7]]("Keybind Saved", r[Z[11]].label .. "  \xe2\x86\x92  " .. r[Z[8]](g), r[Z[19]], "success", 2);
                        end;
                        return; 
                    end);
                    return;
                else
                    B = r204;
                    D = B.FindFirstChildOfClass(B, "UIStroke");
                end; 
            end;
            local function r208(arg1_54, arg2_54, arg3_54, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[8],
                    Z[7]
                };
                g = arg2_54;
                r209 = arg3_54;
                r210 = Instance.new("Frame");
                r210.Size = UDim2.new(0, 44, 0, 24);
                C = r210;
                D = "BackgroundColor3";
                E = C;
                if g then
                    v4 = r[Z[3]];
                end;
                C = C;
                R = g;
                if g then
                    C = C;
                    C[r[Z[1]][r[Z[2]]("\xdauW31\x10f\txq\x9c\"\x0f\xaf\x8c\x99", Q)]] = v4;
                    r210.BackgroundTransparency = 0.25;
                    r210.ClipsDescendants = true;
                    r210.Active = true;
                    R = arg1_54;
                    r210.Parent = R;
                    Instance.new("UICorner", r210).CornerRadius = UDim.new(1, 0);
                    R = Instance.new("UIStroke");
                    R.Color = Color3.new(1, 1, 1);
                    R.Transparency = .6;
                    R.Thickness = 1;
                    R.Parent = r210;
                    r211 = Instance.new("Frame");
                    r211.Size = UDim2.new(0, 18, 0, 18);
                    C = r211;
                    D = "Position";
                    M = C;
                    if g then
                        Q = UDim2.new(1, -21, 0.5, -9);
                    end;
                    v4, C = g, C;
                    if g then
                        C = C;
                        C[r[Z[1]][r[Z[2]]("\x8e@\xad\x08\x81\x80\xc1\xc5", a)]] = Q;
                        r211.BackgroundColor3 = Color3.new(1, 1, 1);
                        r211.Parent = r210;
                        Instance.new("UICorner", r211).CornerRadius = UDim.new(1, 0);
                        v4 = Instance.new("UIStroke");
                        v4.Color = Color3.fromRGB(0, 0, 0);
                        v4.Transparency = .85;
                        v4.Thickness = 1;
                        v4.Parent = r211;
                        r212 = arg2_54;
                        C = r210.InputBegan;
                        C.Connect(C, function(arg1_55, ...)
                            local Z = {
                                Z[1],
                                Z[2],
                                351,
                                Z[3],
                                Z[4],
                                310,
                                234,
                                309
                            };
                            v1 = arg1_55;
                            v3 = v1.UserInputType;
                            if v3 == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                                C = not r[Z[3]];
                                r[Z[3]] = C;
                                v3, g = r[Z[3]] and r[Z[4]], C;
                                C, D = C, v3;
                                if v3 then
                                    E = r[Z[3]];
                                    g, B = D, "new";
                                    if E then
                                        B = UDim2.new(1, -21, 0.5, -9);
                                    end;
                                    D, C = B and r[Z[8]](r[Z[3]]), C;
                                    D = UDim2.new(0, 3, 0.5, -9);
                                    C = C;
                                    r[Z[5]](r[Z[6]], {
                                        ["BackgroundColor3"] = g
                                    }, 0.25, Enum.EasingStyle.Sine);
                                    r[Z[5]](r[Z[7]], {
                                        ["Position"] = D
                                    }, 0.25, Enum.EasingStyle.Back);
                                    r[Z[8]](r[Z[3]]);
                                    return;
                                else
                                    D = Color3.fromRGB(120, 112, 140);
                                end;
                            end; 
                        end);
                        return {
                            ["set"] = function(arg1_56, ...)
                                local Z = {
                                    351,
                                    Z[3],
                                    Z[1],
                                    Z[2],
                                    Z[4],
                                    310,
                                    234
                                };
                                v1 = arg1_56;
                                if r[Z[1]] == v1 then
                                    return;
                                end;
                                r[Z[1]] = v1;
                                g = v1;
                                v3 = r[Z[1]] and r[Z[2]];
                                C, D = v1, v3;
                                if v3 then
                                    E = r[Z[1]];
                                    B = "new";
                                    if E then
                                        B = UDim2.new(1, -21, 0.5, -9);
                                    end;
                                    D, C = B and r[Z[5]](r[Z[7]], {
                                        ["Position"] = v3
                                    }, 0.25, Enum.EasingStyle.Back), v1;
                                    D = UDim2.new(0, 3, 0.5, -9);
                                    C = v1;
                                    r[Z[5]](r[Z[6]], {
                                        ["BackgroundColor3"] = v3
                                    }, 0.25, Enum.EasingStyle.Sine);
                                    r[Z[5]](r[Z[7]], {
                                        ["Position"] = D
                                    }, 0.25, Enum.EasingStyle.Back);
                                    return;
                                else
                                    D = Color3.fromRGB(120, 112, 140);
                                end; 
                            end
                        };
                    else
                        UDim2.new(0, 3, 0.5, -9);
                    end;
                else
                    Color3.fromRGB(120, 112, 140);
                end; 
            end;
            local function r213(arg1_57, arg2_57, arg3_57, arg4_57, arg5_57, arg6_57, arg7_57, arg8_57, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[18],
                    Z[7],
                    Z[19],
                    Z[8],
                    Z[20],
                    Z[10]
                };
                B = arg4_57;
                r214 = arg5_57;
                r215 = arg6_57;
                r216 = arg7_57;
                r217 = arg8_57;
                r218 = Instance.new("Frame");
                r218.Size = UDim2.new(1, 0, 0, 58);
                r218.BackgroundColor3 = r[Z[3]];
                r218.BackgroundTransparency = .9;
                r218.BorderSizePixel = 0;
                i = arg2_57;
                r218.LayoutOrder = i;
                i = arg1_57;
                r218.Parent = i;
                Instance.new("UICorner", r218).CornerRadius = UDim.new(0, 13);
                r219 = Instance.new("UIStroke", r218);
                r219.Color = Color3.new(1, 1, 1);
                r219.Transparency = .86;
                r219.Thickness = 1;
                C = r218.MouseEnter;
                C.Connect(C, function(...)
                    local Z = {
                        Z[4],
                        413,
                        Z[1],
                        Z[2],
                        414
                    };
                    r[Z[1]](r[Z[2]], {
                        ["BackgroundTransparency"] = .8
                    }, .15, Enum.EasingStyle.Sine);
                    r[Z[1]](r[Z[5]], {
                        ["Transparency"] = .62
                    }, .15, Enum.EasingStyle.Sine);
                    return; 
                end);
                C = r218.MouseLeave;
                C.Connect(C, function(...)
                    local Z = {
                        Z[4],
                        413,
                        Z[1],
                        Z[2],
                        414
                    };
                    r[Z[1]](r[Z[2]], {
                        ["BackgroundTransparency"] = .9
                    }, .2, Enum.EasingStyle.Sine);
                    r[Z[1]](r[Z[5]], {
                        ["Transparency"] = .86
                    }, .2, Enum.EasingStyle.Sine);
                    return; 
                end);
                a = Instance.new("TextLabel", r218);
                a.Size = UDim2.new(.6, 0, 0, 20);
                a.Position = UDim2.new(0, 14, 0, 6);
                a.BackgroundTransparency = 1;
                D = arg3_57;
                a.Text = D;
                a.TextColor3 = r[Z[5]];
                a.TextSize = 12;
                a.Font = Enum.Font.GothamMedium;
                a.TextXAlignment = Enum.TextXAlignment.Left;
                r220 = Instance.new("TextLabel", r218);
                r220.Size = UDim2.new(.38, 0, 0, 20);
                r220.Position = UDim2.new(.62, 0, 0, 6);
                r220.BackgroundTransparency = 1;
                r220.TextColor3 = r[Z[6]];
                r220.TextSize = 12;
                r220.Font = Enum.Font.GothamBold;
                r220.TextXAlignment = Enum.TextXAlignment.Right;
                local function r221(arg1_58, ...)
                    local Z = {
                        410,
                        Z[1],
                        Z[2]
                    };
                    v1 = arg1_58;
                    g = r[Z[1]];
                    C = r[v2];
                    if g then
                        return g and string.format("%.1f", v1);
                    else
                        M = v1 >= 100 and "%.0f";
                        C = v3;
                        if M then
                            C = "x";
                            D = "x" .. string.format(M, arg1_58);
                        else
                            E = "%.2f";
                        end;
                    end; 
                end;
                r220.Text = r221(B());
                r222 = Instance.new("Frame", r218);
                r222.Size = UDim2.new(1, -28, 0, 6);
                r222.Position = UDim2.new(0, 14, 0, 38);
                r222.BackgroundColor3 = Color3.new(1, 1, 1);
                r222.BackgroundTransparency = .88;
                r222.BorderSizePixel = 0;
                Instance.new("UICorner", r222).CornerRadius = UDim.new(1, 0);
                r223 = Instance.new("Frame", r222);
                r223.Name = "Fill";
                r223.BackgroundColor3 = r[Z[6]];
                r223.BorderSizePixel = 0;
                Instance.new("UICorner", r223).CornerRadius = UDim.new(1, 0);
                r224 = Instance.new("Frame", r222);
                r224.Size = UDim2.new(0, 14, 0, 14);
                r224.AnchorPoint = Vector2.new(0.5, 0.5);
                r224.BackgroundColor3 = Color3.new(1, 1, 1);
                r224.BorderSizePixel = 0;
                r224.ZIndex = 2;
                Instance.new("UICorner", r224).CornerRadius = UDim.new(1, 0);
                v5 = Instance.new("UIStroke", r224);
                v5.Color = r[Z[6]];
                v5.Thickness = 1.5;
                local function r225(arg1_59, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        410,
                        412,
                        411,
                        415,
                        416,
                        409,
                        Z[4],
                        418,
                        419,
                        Z[7]
                    };
                    C = math.max;
                    E = r[Z[3]];
                    v3 = C;
                    if E then
                        B = r[Z[4]];
                    end;
                    C = C;
                    v1 = C(arg1_59, E or .01);
                    r[Z[5]](v1);
                    r[Z[6]].Text = r[Z[7]](v1);
                    v3 = math.clamp((v1 - r[Z[4]]) / (r[Z[8]] - r[Z[4]]), 0, 1);
                    r[Z[9]](r[Z[10]], {
                        ["Size"] = UDim2.new(v3, 0, 1, 0)
                    }, .1, Enum.EasingStyle.Sine);
                    r[Z[11]].Position = UDim2.new(v3, 0, 0.5, 0);
                    r[Z[12]]();
                    return; 
                end;
                X = math.clamp((B() - r216) / (r217 - r216), 0, 1);
                r223.Size = UDim2.new(X, 0, 1, 0);
                r224.Position = UDim2.new(X, 0, 0.5, 0);
                r226 = false;
                local function r227(arg1_60, ...)
                    local Z = {
                        417,
                        Z[1],
                        Z[2],
                        420,
                        412,
                        409
                    };
                    g = r[Z[1]].AbsoluteSize.X;
                    r[Z[4]](r[Z[5]] + (r[Z[6]] - r[Z[5]]) * math.clamp(arg1_60 - r[Z[1]].AbsolutePosition.X, 0, g) / math.max(g, 1));
                    return; 
                end;
                C = r222.InputBegan;
                C.Connect(C, function(arg1_61, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        422,
                        421
                    };
                    v1 = arg1_61;
                    if v1.UserInputType == Enum.UserInputType.MouseButton1 then
                        r[Z[3]] = true;
                        r[Z[4]](v1.Position.X);
                    end;
                    return; 
                end);
                C = r224.InputBegan;
                C.Connect(C, function(arg1_62, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        422
                    };
                    if arg1_62.UserInputType == Enum.UserInputType.MouseButton1 then
                        r[Z[3]] = true;
                    end;
                    return; 
                end);
                C = r[Z[8]].InputChanged;
                C.Connect(C, function(arg1_63, ...)
                    local Z = {
                        422,
                        Z[1],
                        Z[2],
                        421
                    };
                    v1 = arg1_63;
                    if not r[Z[1]] then
                        return;
                    end;
                    if v1.UserInputType == Enum.UserInputType.MouseMovement then
                        r[Z[4]](v1.Position.X);
                    end;
                    return; 
                end);
                C = r[Z[8]].InputEnded;
                C.Connect(C, function(arg1_64, ...)
                    local Z = {
                        422,
                        Z[1],
                        Z[2]
                    };
                    if r[Z[1]] and arg1_64.UserInputType == Enum.UserInputType.MouseButton1 then
                        r[Z[1]] = false;
                    end;
                    return; 
                end);
                return {
                    ["container"] = r218,
                    ["fill"] = r223,
                    ["valueLabel"] = r220,
                    ["apply"] = r225
                }; 
            end;
            local function r228(arg1_65, arg2_65, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[21],
                    Z[18],
                    Z[22],
                    Z[19],
                    Z[8],
                    Z[7],
                    143,
                    Z[9]
                };
                r229 = arg2_65;
                r230 = Color3.fromRGB(42, 27, 78);
                r231 = Color3.fromRGB(78, 48, 138);
                r232 = Color3.fromRGB(20, 48, 36);
                r233 = Color3.fromRGB(35, 90, 65);
                r234 = Color3.fromRGB(50, 160, 110);
                r235 = Color3.fromRGB(190, 240, 210);
                r236 = Color3.fromRGB(190, 235, 205);
                r237 = Color3.fromRGB(200, 240, 215);
                r238 = Instance.new("Frame");
                r238.Size = UDim2.new(1, 0, 1, 0);
                r238.BackgroundTransparency = 1;
                r238.Visible = false;
                v2 = arg1_65;
                r238.Parent = v2;
                v2 = Instance.new("Frame");
                v2.Size = UDim2.new(1, 0, 0, 26);
                v2.BackgroundTransparency = 1;
                v2.Parent = r238;
                q = Instance.new("TextLabel");
                q.Size = UDim2.new(1, -70, 1, 0);
                q.Position = UDim2.new(0, 2, 0, 0);
                q.BackgroundTransparency = 1;
                q.Text = r229.headerText;
                q.TextColor3 = r[Z[3]];
                q.TextSize = 10;
                q.Font = Enum.Font.GothamBold;
                q.TextXAlignment = Enum.TextXAlignment.Left;
                q.Parent = v2;
                o = Instance.new("Frame");
                o.Size = UDim2.new(0, 40, 0, 18);
                o.Position = UDim2.new(1, -44, 0.5, -9);
                o.BackgroundColor3 = r[Z[4]];
                o.BackgroundTransparency = .72;
                o.Parent = v2;
                Instance.new("UICorner", o).CornerRadius = UDim.new(1, 0);
                O = Instance.new("UIStroke", o);
                O.Color = Color3.new(1, 1, 1);
                O.Transparency = 0.75;
                O.Thickness = 1;
                S = Instance.new("TextLabel", o);
                p = "H\xf3\xf7\xfa\x16t";
                S.Size = UDim2.new(1, 0, 1, 0);
                S.BackgroundTransparency = 1;
                if r229[r[Z[1]][r[Z[2]](p, 14035307705103)]] then
                    t = r229.groups;
                    for v, p in ipairs("ipairs") do
                        h = v;
                        table.insert({}, {
                            ["isHeader"] = true,
                            ["label"] = p.label
                        });
                        for I, ug in ipairs(p.names) do
                            f = I;
                            table.insert({}, {
                                ["isHeader"] = false,
                                ["name"] = ug
                            });
                            ug, Y = nil, 0 + 1; 
                        end; 
                    end;
                else
                    p = r229.order;
                    for h, p in ipairs(p) do
                        X = h;
                        table.insert({}, {
                            ["isHeader"] = false,
                            ["name"] = p
                        });
                        Y, p = 0 + 1, nil; 
                    end;
                    S.Text = tostring(0);
                    S.TextColor3 = r[Z[5]];
                    S.TextSize = 10;
                    S.Font = Enum.Font.GothamBold;
                    if r229.searchable then
                        X = 34;
                        p = Instance.new("Frame");
                        p.Size = UDim2.new(1, 0, 0, 30);
                        p.Position = UDim2.new(0, 0, 0, 28);
                        p.BackgroundColor3 = r[Z[4]];
                        p.BackgroundTransparency = .86;
                        p.Parent = r238;
                        Instance.new("UICorner", p).CornerRadius = UDim.new(0, 10);
                        L = Instance.new("UIStroke", p);
                        L.Color = Color3.new(1, 1, 1);
                        L.Transparency = .8;
                        L.Thickness = 1;
                        I = Instance.new("Frame");
                        I.Size = UDim2.new(0, 11, 0, 11);
                        I.Position = UDim2.new(0, 10, 0.5, -8);
                        I.BackgroundTransparency = 1;
                        I.Parent = p;
                        Instance.new("UICorner", I).CornerRadius = UDim.new(1, 0);
                        f = Instance.new("UIStroke", I);
                        f.Color = r[Z[3]];
                        f.Thickness = 1.5;
                        ug = Instance.new("Frame");
                        ug.Size = UDim2.new(0, 6, 0, 1.5);
                        ug.Position = UDim2.new(0, 18, 0.5, 2);
                        ug.Rotation = 45;
                        ug.BackgroundColor3 = r[Z[3]];
                        ug.BorderSizePixel = 0;
                        ug.Parent = p;
                        r239 = Instance.new("TextBox");
                        r239.Size = UDim2.new(1, -34, 1, 0);
                        r239.Position = UDim2.new(0, 28, 0, 0);
                        r239.BackgroundTransparency = 1;
                        r239.Text = "";
                        r239.PlaceholderText = "Search idles\xe2\x80\xa6";
                        r239.PlaceholderColor3 = r[Z[3]];
                        r239.TextColor3 = r[Z[6]];
                        r239.Font = Enum.Font.GothamMedium;
                        r239.TextSize = 12;
                        r239.TextXAlignment = Enum.TextXAlignment.Left;
                        r239.ClearTextOnFocus = false;
                        r239.Parent = p;
                    end;
                    p = Instance.new("ScrollingFrame");
                    p.Name = "AnimationScroller";
                    p.Size = UDim2.new(1, 0, 1, -(30 + 0));
                    p.Position = UDim2.new(0, 0, 0, 30 + 0);
                    p.BackgroundTransparency = 1;
                    p.ScrollBarThickness = 4;
                    p.ScrollBarImageColor3 = r[Z[7]];
                    p.ScrollBarImageTransparency = .35;
                    p.CanvasSize = UDim2.new(0, 0, 0, 0);
                    p.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                    p.Parent = r238;
                    L = Instance.new("UIListLayout");
                    L.Padding = UDim.new(0, 7);
                    L.SortOrder = Enum.SortOrder.LayoutOrder;
                    L.Parent = p;
                    I = Instance.new("UIPadding");
                    I.PaddingRight = UDim.new(0, 8);
                    I.PaddingTop = UDim.new(0, 2);
                    I.PaddingBottom = UDim.new(0, 6);
                    I.Parent = p;
                    r240 = {};
                    local function r241(arg1_66, arg2_66, arg3_66, arg4_66, ...)
                        local Z = {
                            Z[8],
                            Z[1],
                            Z[2],
                            397,
                            398,
                            395,
                            396,
                            399,
                            401,
                            402,
                            400,
                            Z[6]
                        };
                        v1 = arg1_66;
                        r242 = arg3_66;
                        E = D[X];
                        B = arg4_66;
                        r243 = r242 and 0 or .3;
                        local function E(arg1_67, arg2_67, ...)
                            local Z = {
                                406,
                                Z[1],
                                407,
                                Z[2],
                                Z[3]
                            };
                            g = arg2_67;
                            r244 = arg1_67;
                            if r[Z[1]] then
                                R = "pairs";
                                for B, v4 in pairs(g) do
                                    r245 = B;
                                    r246 = v4;
                                    pcall(function(...)
                                        local Z = {
                                            599,
                                            287,
                                            288
                                        };
                                        r[Z[1]][r[Z[2]]] = r[Z[3]];
                                        return; 
                                    end); 
                                end;
                            else
                                r[Z[2]](r244, g, r[Z[3]], Enum.EasingStyle.Quint);
                            end;
                            return; 
                        end;
                        if arg2_66 then
                            D = v1.selGrad;
                            Q = C;
                            v4 = "Color";
                            M, C = B and ColorSequence.new({
                                ColorSequenceKeypoint.new(0, r[Z[4]]),
                                ColorSequenceKeypoint.new(1, r[Z[5]])
                            }), C;
                            if B then
                                v1.selGrad[r[Z[2]][r[Z[3]]("\xef\x18{\xdb\xfe", v2)]] = i and ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, r[Z[4]]),
                                    ColorSequenceKeypoint.new(1, r[Z[5]])
                                });
                                D = v1.selStrokeGrad;
                                Q = C;
                                v4 = "Color";
                                if B then
                                    i = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 220, 170)),
                                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 180, 130)),
                                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 220, 170))
                                    });
                                end;
                                C, M = C, B;
                                if B then
                                    v1.selStrokeGrad[r[Z[2]][r[Z[3]]("G\x03)o\xe9", v2)]] = M;
                                    D(v1.selBg, {
                                        ["BackgroundTransparency"] = .04
                                    });
                                    v4 = v1.glow;
                                    Q = "ImageTransparency";
                                    a = "ImageColor3";
                                    i, q = .62, C;
                                    if B then
                                    end;
                                    C = C;
                                    v2 = B;
                                    if B then
                                        D(v1[M], {
                                            ["ImageTransparency"] = .62,
                                            [r[Z[2]][r[Z[3]]("/#\xe6\x04o\x08eP\x98\x9d\x0b", S)]] = o
                                        });
                                        D(v1.baseStroke, {
                                            ["Transparency"] = 1
                                        });
                                        D(v1.selStroke, {
                                            ["Transparency"] = 0.25
                                        });
                                        D(v1.label, {
                                            ["TextColor3"] = Color3.fromRGB(248, 244, 255)
                                        });
                                        v1.label.Font = Enum.Font.GothamBold;
                                        D(v1.ring, {
                                            ["BackgroundTransparency"] = 1
                                        });
                                        v4 = v1.ringStroke;
                                        Q = "Transparency";
                                        i = 0.25;
                                        q = C;
                                        a = "Color";
                                        v2, C = B and r[Z[9]], C;
                                        if B then
                                            D(v1[M], {
                                                ["Transparency"] = 0.25,
                                                [r[Z[2]][r[Z[3]]("g \x99k\xd7", S)]] = o and r[Z[9]]
                                            });
                                            v4 = v1.dot;
                                            Q = "BackgroundTransparency";
                                            i = 0;
                                            q = C;
                                            a = "BackgroundColor3";
                                            v2, C = B and r[Z[10]], C;
                                            if B then
                                                D(v1[M], {
                                                    ["BackgroundTransparency"] = 0,
                                                    [r[Z[2]][r[Z[3]]("\x05\x1b\xed\x00qd\xf83\x05\xdb\xf7\xf5\xb0\xff]?", S)]] = o and r[Z[10]]
                                                });
                                                D(v1.chevron, {
                                                    ["TextTransparency"] = 1
                                                });
                                                if B then
                                                    o = r235;
                                                end;
                                                C = C;
                                                if B then
                                                    D(v1.sheen, {
                                                        ["BackgroundTransparency"] = 0,
                                                        ["BackgroundColor3"] = B
                                                    });
                                                    C = C;
                                                    return;
                                                else
                                                    v2 = Color3.fromRGB(222, 198, 255);
                                                end;
                                            else
                                                v2 = Color3.fromRGB(235, 220, 255);
                                            end;
                                        else
                                            v2 = Color3.fromRGB(222, 200, 255);
                                        end;
                                    else
                                        v2 = Color3.fromRGB(110, 60, 190);
                                    end;
                                else
                                    M = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(190, 140, 255)),
                                        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 90, 230)),
                                        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 140, 255))
                                    });
                                end;
                            else
                                M = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, r[Z[6]]),
                                    ColorSequenceKeypoint.new(1, r[Z[7]])
                                });
                            end;
                        else
                            E(v1.selBg, {
                                ["BackgroundTransparency"] = 1
                            });
                            E(v1.glow, {
                                ["ImageTransparency"] = 1
                            });
                            E(v1.baseStroke, {
                                ["Transparency"] = .86
                            });
                            E(v1.selStroke, {
                                ["Transparency"] = 1
                            });
                            E(v1.label, {
                                ["TextColor3"] = r[Z[12]]
                            });
                            v1.label.Font = Enum.Font.GothamMedium;
                            E(v1.ringStroke, {
                                ["Transparency"] = 1
                            });
                            E(v1.dot, {
                                ["BackgroundTransparency"] = 1
                            });
                            E(v1.sheen, {
                                ["BackgroundTransparency"] = 1
                            });
                        end; 
                    end;
                    local function r247(arg1_68, ...)
                        local Z = {
                            394,
                            Z[1],
                            Z[2],
                            28,
                            29
                        };
                        R = r[Z[4]];
                        for B, v4 in pairs("pairs") do
                            M = B == r[Z[1]].getCurrent();
                            if M then
                                o = r[Z[1]].isPending;
                                if o then
                                    v2 = r[Z[1]].isPending(B);
                                end;
                                C, i = r[Z[5]], o;
                            end;
                            r[Z[5]](v4, M, arg1_68, M); 
                        end;
                        return; 
                    end;
                    r248 = {};
                    for Pg, rg in ipairs({}) do
                        if rg.isHeader then
                            Dg = Instance.new("Frame");
                            Dg.Size = UDim2.new(1, 0, 0, 22);
                            Dg.BackgroundTransparency = 1;
                            yg = Pg;
                            Dg.LayoutOrder = yg;
                            yg = Instance.new("ScrollingFrame");
                            Dg.Parent = yg;
                            yg = Instance.new("Frame");
                            yg.Size = UDim2.new(0, 3, 0, 11);
                            yg.Position = UDim2.new(0, 2, 0.5, -5);
                            yg.BackgroundColor3 = r[Z[7]];
                            yg.BorderSizePixel = 0;
                            yg.Parent = Dg;
                            Instance.new("UICorner", yg).CornerRadius = UDim.new(1, 0);
                            gg = Instance.new("TextLabel");
                            gg.Size = UDim2.new(1, -16, 1, 0);
                            gg.Position = UDim2.new(0, 12, 0, 0);
                            gg.BackgroundTransparency = 1;
                            gg.Text = rg.label;
                            gg.TextColor3 = r[Z[3]];
                            gg.TextSize = 10;
                            gg.Font = Enum.Font.GothamBold;
                            gg.TextXAlignment = Enum.TextXAlignment.Left;
                            gg.Parent = Dg;
                            Dg, Cg = nil, {
                                ["frame"] = Dg,
                                ["names"] = {}
                            };
                            table.insert(r248, Cg);
                        end;
                        r249 = rg.name;
                        if Cg then
                            table.insert(Cg.names, r249);
                        end;
                        C = D[X];
                        r250 = Instance.new("TextButton");
                        r250.Name = r249;
                        r250.Size = UDim2.new(1, 0, 0, 46);
                        r250.BackgroundColor3 = r[Z[4]];
                        r250.BackgroundTransparency = .9;
                        r250.Text = "";
                        r250.AutoButtonColor = false;
                        r250.ClipsDescendants = false;
                        Fg = Pg;
                        r250.LayoutOrder = Fg;
                        Fg = p;
                        r250.Parent = Fg;
                        Instance.new("UICorner", r250).CornerRadius = UDim.new(0, 13);
                        Bg = Instance.new("ImageLabel");
                        Bg.BackgroundTransparency = 1;
                        Bg.Image = "rbxassetid://6014261993";
                        Bg.ImageColor3 = Color3.fromRGB(110, 60, 190);
                        Bg.ImageTransparency = 1;
                        Bg.ScaleType = Enum.ScaleType.Slice;
                        Bg.SliceCenter = Rect.new(49, 49, 450, 450);
                        Bg.Size = UDim2.new(1, 26, 1, 26);
                        Bg.Position = UDim2.new(0, -13, 0, -11);
                        Bg.ZIndex = 0;
                        Bg.Parent = r250;
                        Fg = Instance.new("Frame");
                        Fg.Size = UDim2.new(1, 0, 1, 0);
                        Fg.BackgroundColor3 = Color3.new(1, 1, 1);
                        Fg.BackgroundTransparency = 1;
                        Fg.BorderSizePixel = 0;
                        Fg.ZIndex = 1;
                        Fg.Parent = r250;
                        Instance.new("UICorner", Fg).CornerRadius = UDim.new(0, 13);
                        Rg = Instance.new("UIGradient");
                        Rg.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, r230),
                            ColorSequenceKeypoint.new(1, r231)
                        });
                        Rg.Rotation = 22;
                        Rg.Parent = Fg;
                        bg = Instance.new("Frame");
                        bg.Size = UDim2.new(1, 0, 1, 0);
                        bg.BackgroundColor3 = Color3.fromRGB(222, 198, 255);
                        bg.BackgroundTransparency = 1;
                        bg.BorderSizePixel = 0;
                        bg.ZIndex = 2;
                        bg.Parent = r250;
                        Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 13);
                        jg = Instance.new("UIGradient");
                        jg.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(.42, 1),
                            NumberSequenceKeypoint.new(0.5, .82),
                            NumberSequenceKeypoint.new(.58, 1),
                            NumberSequenceKeypoint.new(1, 1)
                        });
                        jg.Parent = bg;
                        r251 = Instance.new("UIStroke");
                        r251.Color = Color3.new(1, 1, 1);
                        r251.Transparency = .86;
                        r251.Thickness = 1;
                        r251.Parent = r250;
                        lg = Instance.new("Frame");
                        lg.Size = UDim2.new(1, 0, 1, 0);
                        lg.BackgroundTransparency = 1;
                        lg.ZIndex = 3;
                        lg.Parent = r250;
                        Instance.new("UICorner", lg).CornerRadius = UDim.new(0, 13);
                        Tg = Instance.new("UIStroke");
                        Tg.Color = Color3.new(1, 1, 1);
                        Tg.Transparency = 1;
                        Tg.Thickness = 1.4;
                        Tg.Parent = lg;
                        Ug = Instance.new("UIGradient");
                        Ug.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(190, 140, 255)),
                            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 90, 230)),
                            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 140, 255))
                        });
                        Ug.Parent = Tg;
                        zg = Instance.new("TextLabel");
                        zg.Size = UDim2.new(1, -76, 1, 0);
                        zg.Position = UDim2.new(0, 16, 0, 0);
                        zg.BackgroundTransparency = 1;
                        cg = r229.displayNames[r249] or r249;
                        zg.Text = cg;
                        zg.TextColor3 = r[Z[6]];
                        zg.TextSize = 13;
                        zg.Font = Enum.Font.GothamMedium;
                        zg.TextXAlignment = Enum.TextXAlignment.Left;
                        zg.TextTruncate = Enum.TextTruncate.AtEnd;
                        zg.ZIndex = 4;
                        zg.Parent = r250;
                        r252 = Instance.new("TextLabel");
                        r252.Size = UDim2.new(0, 18, 1, 0);
                        r252.Position = UDim2.new(1, -28, 0, 0);
                        r252.BackgroundTransparency = 1;
                        r252.Text = "\xe2\x80\xba";
                        r252.TextColor3 = r[Z[5]];
                        r252.TextSize = 18;
                        r252.Font = Enum.Font.GothamBold;
                        r252.TextTransparency = 1;
                        r252.ZIndex = 4;
                        r252.Parent = r250;
                        Gg = Instance.new("Frame");
                        Gg.Size = UDim2.new(0, 20, 0, 20);
                        Gg.Position = UDim2.new(1, -32, 0.5, -10);
                        Gg.BackgroundTransparency = 1;
                        Gg.ZIndex = 4;
                        Gg.Parent = r250;
                        Instance.new("UICorner", Gg).CornerRadius = UDim.new(1, 0);
                        dg = Instance.new("UIStroke", Gg);
                        dg.Color = Color3.fromRGB(222, 200, 255);
                        dg.Transparency = 1;
                        dg.Thickness = 1.6;
                        Kg = Instance.new("Frame", Gg);
                        Kg.Size = UDim2.new(0, 8, 0, 8);
                        Kg.Position = UDim2.new(0.5, -4, 0.5, -4);
                        Kg.BackgroundColor3 = Color3.fromRGB(235, 220, 255);
                        Kg.BackgroundTransparency = 1;
                        Kg.ZIndex = 4;
                        Instance.new("UICorner", Kg).CornerRadius = UDim.new(1, 0);
                        Gg, Eg, Fg = nil, {
                            ["button"] = r250,
                            ["selBg"] = Fg,
                            ["selGrad"] = Rg,
                            ["sheen"] = bg,
                            ["sheenGrad"] = jg,
                            ["baseStroke"] = r251,
                            ["selStroke"] = Tg,
                            ["selStrokeGrad"] = Ug,
                            ["glow"] = Bg,
                            ["label"] = zg,
                            ["ring"] = Gg,
                            ["ringStroke"] = dg,
                            ["dot"] = Kg,
                            ["chevron"] = r252
                        }, nil;
                        r240[r249] = Eg;
                        Wg = r250.MouseEnter;
                        Wg.Connect(Wg, function(...)
                            local Z = {
                                394,
                                Z[1],
                                Z[2],
                                71,
                                Z[8],
                                118,
                                119,
                                120
                            };
                            if r[Z[1]].getCurrent() == r[Z[4]] then
                                return;
                            end;
                            if r[Z[1]].hoverGate and not r[Z[1]].hoverGate() then
                                return;
                            end;
                            r[Z[5]](r[Z[6]], {
                                ["BackgroundTransparency"] = .78
                            }, .15, Enum.EasingStyle.Sine);
                            r[Z[5]](r[Z[7]], {
                                ["Transparency"] = .6
                            }, .15, Enum.EasingStyle.Sine);
                            r[Z[5]](r[Z[8]], {
                                ["TextTransparency"] = .35
                            }, .15, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        Wg = r250.MouseLeave;
                        Wg.Connect(Wg, function(...)
                            local Z = {
                                Z[8],
                                118,
                                Z[1],
                                Z[2],
                                394,
                                71,
                                119,
                                120
                            };
                            r[Z[1]](r[Z[2]], {
                                ["BackgroundTransparency"] = .9
                            }, .2, Enum.EasingStyle.Sine);
                            if r[Z[5]].getCurrent() ~= r[Z[6]] then
                                r[Z[1]](r[Z[7]], {
                                    ["Transparency"] = .86
                                }, .2, Enum.EasingStyle.Sine);
                            end;
                            r[Z[1]](r[Z[8]], {
                                ["TextTransparency"] = 1
                            }, .2, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        Wg = r250.MouseButton1Click;
                        Wg.Connect(Wg, function(...)
                            local Z = {
                                Z[9],
                                118,
                                394,
                                Z[1],
                                Z[2],
                                71,
                                30
                            };
                            r[Z[1]](r[Z[2]]);
                            r[Z[3]].onSelect(r[Z[6]], function(...)
                                r[ug](false);
                                return; 
                            end);
                            return; 
                        end); 
                    end;
                    r247(true);
                    local function kg(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            403,
                            28,
                            394,
                            Z[10]
                        };
                        os.clock();
                        C = r[Z[3]].Parent;
                        while C do
                            if r[Z[3]].Visible then
                                g = r[Z[4]][r[Z[5]].getCurrent()];
                                if g then
                                    v3 = os.clock() - os.clock();
                                    g.sheenGrad.Offset = Vector2.new(math.sin(v3 * .55) * .9, 0);
                                    g.selStrokeGrad.Rotation = v3 * 42 % 360;
                                    g.ringStroke.Transparency = .2 + 0.25 * (0.5 + 0.5 * math.sin(v3 * 2.4));
                                end;
                            end;
                            C = r[Z[6]].Heartbeat;
                            C.Wait(C); 
                        end;
                        return; 
                    end;
                    task.spawn(kg);
                    if r239 then
                        Zg = r239;
                        kg = Zg.GetPropertyChangedSignal(Zg, "Text");
                        kg.Connect(kg, function(...)
                            local Z = {
                                366,
                                Z[1],
                                Z[2],
                                31,
                                28,
                                394
                            };
                            C = r[Z[1]].Text;
                            D = C.lower(C);
                            C = D.gsub(D, "^%s+", "");
                            R = r[Z[3]]("", 22388200264050);
                            v1 = C.gsub(C, "%s+$", r[Z[2]][R]);
                            D = R[1];
                            for v3, E in ipairs(r[Z[4]]) do
                                R = v3;
                                for i, v2 in ipairs(E.names) do
                                    a = i;
                                    if r[Z[5]][v2] then
                                        O = r[Z[6]].displayNames[v2];
                                        o = O;
                                        if O then
                                            o = O.lower(O);
                                            O = v1 == "" or o.find(o, v1, 1, true) ~= nil;
                                            q.button.Visible = O;
                                            if O then
                                                v4 = true;
                                            end;
                                        else
                                            o = v2;
                                        end;
                                    end; 
                                end;
                                E.frame.Visible = v1 == ""; 
                            end;
                            return; 
                        end);
                    end;
                    return r238, r247;
                end; 
            end;
            local function r253(arg1_69, ...)
                local Z = {
                    146,
                    Z[1],
                    Z[2],
                    Z[23],
                    Z[24],
                    Z[25],
                    Z[26],
                    Z[27],
                    Z[28],
                    Z[20],
                    Z[29],
                    Z[12],
                    Z[17],
                    Z[8],
                    Z[30],
                    Z[31],
                    Z[32],
                    Z[3]
                };
                B = {
                    r[Z[1]](arg1_69, {
                        ["groups"] = r[Z[4]],
                        ["searchable"] = true,
                        ["displayNames"] = r[Z[5]],
                        ["headerText"] = "CHOOSE YOUR IDLE",
                        ["getCurrent"] = function(...)
                            return r[Z[25]]; 
                        end,
                        ["isPending"] = function(...)
                            local Z = {
                                Z[7],
                                Z[2],
                                Z[3]
                            };
                            return r[Z[1]].idlePendingRefly; 
                        end,
                        ["onSelect"] = function(arg1_70, arg2_70, ...)
                            local Z = {
                                Z[6],
                                Z[8],
                                Z[9],
                                Z[2],
                                Z[3],
                                Z[10],
                                Z[7],
                                Z[11],
                                Z[12],
                                Z[13],
                                Z[14],
                                Z[15],
                                Z[16]
                            };
                            v1 = arg1_70;
                            g = arg2_70;
                            if r[Z[1]] == v1 then
                                return;
                            end;
                            v3 = r[Z[2]][v1];
                            if v3 then
                                r[Z[3]](v3.AnimationId);
                            end;
                            r[Z[1]] = v1;
                            r[Z[6]]();
                            if r[Z[7]].flying and r[Z[8]].LEGACY_FORMAT_IDLES[v1] then
                                r[Z[7]].idlePendingRefly = true;
                                g();
                                r[Z[9]]("Idle Queued", "This animation is in an older format, and needs you to land and take off again (or toggle flight) for it to work.", r[Z[10]], "info", 4);
                                return;
                            end;
                            r[Z[7]].idlePendingRefly = false;
                            g();
                            C = v1;
                            if r[Z[7]].flying and r[Z[8]].SLOW_REPLICATION_IDLES[v1] then
                                r[Z[9]]("Heads Up", "This animation may look slow or delayed for other players at first, but works fine once it's loaded in.", r[Z[11]], "info", 4);
                            end;
                            if r[Z[7]].flying then
                                r[Z[8]].suppressBlockDefaultAnimsUntil = os.clock() + .3;
                                r[Z[12]]();
                                r[Z[13]]();
                            end;
                            return; 
                        end
                    })
                };
                v3 = B[1];
                r[Z[17]] = v3.FindFirstChild(v3, "AnimationScroller");
                r[Z[18]].refreshIdlesList = B[2];
                return v3; 
            end;
            local function r254(arg1_71, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[18],
                    Z[22],
                    Z[26],
                    Z[8],
                    Z[7],
                    Z[3],
                    Z[20],
                    146,
                    Z[33],
                    Z[34],
                    Z[35],
                    Z[36],
                    Z[28],
                    Z[12]
                };
                g = Instance.new("Frame");
                g.Size = UDim2.new(1, 0, 1, 0);
                g.BackgroundTransparency = 1;
                g.Visible = false;
                D = arg1_71;
                g.Parent = D;
                v3 = Instance.new("Frame");
                v3.Size = UDim2.new(1, 0, 0, 28);
                v3.BackgroundColor3 = r[Z[3]];
                v3.BackgroundTransparency = .9;
                v3.Parent = g;
                Instance.new("UICorner", v3).CornerRadius = UDim.new(0, 8);
                B = Instance.new("TextLabel");
                B.Size = UDim2.new(1, -56, 1, 0);
                B.Position = UDim2.new(0, 10, 0, 0);
                B.BackgroundTransparency = 1;
                B.Text = "Takeoff Animation";
                B.TextColor3 = r[Z[4]];
                B.TextSize = 11;
                B.Font = Enum.Font.GothamSemibold;
                B.TextXAlignment = Enum.TextXAlignment.Left;
                B.Parent = v3;
                r255 = Instance.new("Frame");
                r255.Size = UDim2.new(0, 36, 0, 18);
                r255.Position = UDim2.new(1, -46, 0.5, -9);
                C = r255;
                C = C;
                C = C;
                C.BackgroundColor3 = r[Z[5]].takeoffsEnabled and r[Z[6]] or r[Z[3]];
                C = r255;
                v4 = C;
                Q = C;
                C.BackgroundTransparency = r[Z[5]].takeoffsEnabled and .2 or .8;
                r255.Parent = v3;
                Instance.new("UICorner", r255).CornerRadius = UDim.new(1, 0);
                r256 = Instance.new("Frame");
                r256.Size = UDim2.new(0, 14, 0, 14);
                D = r256;
                E = "Position";
                Q = C;
                v2 = r[Z[5]].takeoffsEnabled;
                if v2 then
                    i = UDim2.new(1, -16, 0.5, -7);
                end;
                C = C;
                M = v2;
                if v2 then
                    r[v4].Position = i;
                    C = C;
                    r256.BackgroundColor3 = Color3.new(1, 1, 1);
                    r256.Parent = r255;
                    Instance.new("UICorner", r256).CornerRadius = UDim.new(1, 0);
                    E = Instance.new("TextButton");
                    E.Size = UDim2.new(1, 0, 1, 0);
                    E.BackgroundTransparency = 1;
                    E.Text = "";
                    E.Parent = r255;
                    local function r257(arg1_72, ...)
                        local Z = {
                            Z[7],
                            300,
                            Z[1],
                            Z[2],
                            Z[6],
                            Z[3],
                            77
                        };
                        C = r[Z[1]];
                        v1 = arg1_72;
                        if v1 then
                            v4 = r[Z[5]];
                        end;
                        C = C;
                        M, i = C, C;
                        C(r[Z[2]], {
                            ["BackgroundColor3"] = v1 or r[Z[6]],
                            ["BackgroundTransparency"] = v1 and .2 or .8
                        }, .15, Enum.EasingStyle.Sine);
                        R = "Position";
                        v4 = C;
                        if v1 then
                            M = UDim2.new(1, -16, 0.5, -7);
                        end;
                        E, C = v1, C;
                        if v1 then
                            C = C;
                            r[Z[1]](r[Z[7]], {
                                [r[Z[3]][r[Z[4]]("\xfb|c\xaf\xf8E\xdf\x9f", i)]] = E
                            }, .15, Enum.EasingStyle.Sine);
                            return;
                        else
                            E = UDim2.new(0, 2, 0.5, -7);
                        end; 
                    end;
                    r[Z[8]].takeoffTabSwitch = r257;
                    D = E.MouseButton1Click;
                    D.Connect(D, function(...)
                        local Z = {
                            Z[5],
                            Z[1],
                            Z[2],
                            Z[9],
                            358,
                            Z[8]
                        };
                        r[Z[1]].takeoffsEnabled = not r[Z[1]].takeoffsEnabled;
                        r[Z[4]]();
                        r[Z[5]](r[Z[1]].takeoffsEnabled);
                        if r[Z[6]].takeoffToggleHandle then
                            r[Z[6]].takeoffToggleHandle.set(r[Z[1]].takeoffsEnabled);
                        end;
                        return; 
                    end);
                    Q = Instance.new("Frame");
                    Q.Size = UDim2.new(1, 0, 1, -34);
                    Q.Position = UDim2.new(0, 0, 0, 34);
                    Q.BackgroundTransparency = 1;
                    i = Instance.new("Frame");
                    Q.Parent = i;
                    r[Z[10]](Q, {
                        ["order"] = r[Z[11]],
                        ["displayNames"] = r[Z[12]],
                        ["headerText"] = "CHOOSE YOUR TAKEOFF",
                        ["getCurrent"] = function(...)
                            return r[Z[35]]; 
                        end,
                        ["onSelect"] = function(arg1_73, arg2_73, ...)
                            local Z = {
                                Z[13],
                                Z[14],
                                Z[15],
                                Z[1],
                                Z[2],
                                Z[9],
                                Z[16],
                                Z[12],
                                Z[6]
                            };
                            v1 = arg1_73;
                            if r[Z[1]] == v1 then
                                return;
                            end;
                            v3 = r[Z[2]][v1];
                            if v3 then
                                r[Z[3]](v3.AnimationId);
                            end;
                            r[Z[1]] = v1;
                            r[Z[6]]();
                            arg2_73();
                            v4 = v1;
                            M = r[Z[8]][v1];
                            if M then
                                C, v3 = C, nil;
                                r[Z[7]]("Takeoff Selected", M, r[Z[9]], "success", 1.5);
                                return;
                            else
                                E = arg1_73;
                            end; 
                        end
                    }).Visible = true;
                    return g;
                else
                    M = UDim2.new(0, 2, 0.5, -7);
                end; 
            end;
            local function r258(arg1_74, arg2_74, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[7],
                    Z[3],
                    Z[10],
                    Z[8],
                    Z[21],
                    Z[18],
                    Z[37],
                    Z[19],
                    Z[38],
                    Z[39],
                    Z[40],
                    Z[41],
                    Z[28],
                    Z[42],
                    Z[20],
                    Z[12],
                    Z[22],
                    Z[43]
                };
                r259 = arg2_74;
                v3 = Instance.new("Frame");
                v3.Size = UDim2.new(1, 0, 1, 0);
                v3.BackgroundTransparency = 1;
                v3.Visible = false;
                D = arg1_74;
                v3.Parent = D;
                local function r262(...)
                    local Z = {
                        579,
                        580,
                        Z[1],
                        Z[2],
                        Z[3]
                    };
                    if r[Z[1]] then
                        r263 = r[Z[1]];
                        r[Z[1]] = nil;
                        r[Z[2]] = nil;
                        r263.ClipsDescendants = true;
                        r[Z[5]](r263, {
                            ["Size"] = UDim2.new(0, r263.AbsoluteSize.X, 0, 0),
                            ["BackgroundTransparency"] = 1
                        }, .18, Enum.EasingStyle.Quint);
                        E = r263;
                        v4 = {
                            E.GetDescendants(E)
                        };
                        for R, E in ipairs(x(v4)) do
                            g = R;
                            r264 = E;
                            Q = r264;
                            if Q.IsA(Q, "TextLabel") or Q.IsA(Q, "TextButton") then
                                pcall(function(...)
                                    local Z = {
                                        600,
                                        Z[3],
                                        Z[4]
                                    };
                                    r[Z[1]].TextTransparency = 1;
                                    return; 
                                end);
                                pcall(function(...)
                                    local Z = {
                                        600,
                                        Z[3],
                                        Z[4]
                                    };
                                    r[Z[1]].BackgroundTransparency = 1;
                                    return; 
                                end);
                            end;
                            v4 = r264;
                            if v4.IsA(v4, "UIStroke") then
                                pcall(function(...)
                                    local Z = {
                                        600,
                                        Z[3],
                                        Z[4]
                                    };
                                    r[Z[1]].Transparency = 1;
                                    return; 
                                end);
                            end; 
                        end;
                        task.delay(.22, function(...)
                            pcall(function(...)
                                C = r[v1];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                    end;
                    return; 
                end;
                r[Z[4]].closeBoostDropdown = r262;
                C = r[Z[5]].InputBegan;
                C.Connect(C, function(arg1_75, arg2_75, ...)
                    local Z = {
                        579,
                        Z[1],
                        Z[2],
                        580,
                        578
                    };
                    v1, g = arg1_75, arg2_75;
                    if not r[Z[1]] then
                        return;
                    end;
                    if v1.UserInputType ~= Enum.UserInputType.MouseButton1 and v1.UserInputType ~= Enum.UserInputType.Touch then
                        return;
                    end;
                    r265 = v1.Position;
                    local function B(arg1_76, ...)
                        local Z = {
                            Z[2],
                            Z[3],
                            350
                        };
                        r266 = arg1_76;
                        if not r266 or not r266.Parent then
                            return false;
                        end;
                        B = {
                            pcall(function(...)
                                local Z = {
                                    250,
                                    Z[1],
                                    Z[2]
                                };
                                return r[Z[1]].AbsolutePosition; 
                            end)
                        };
                        g = B[2];
                        E = {
                            pcall(function(...)
                                local Z = {
                                    250,
                                    Z[1],
                                    Z[2]
                                };
                                return r[Z[1]].AbsoluteSize; 
                            end)
                        };
                        B = E[2];
                        if not B[1] or not E[1] then
                            return false;
                        end;
                        return r[Z[3]].X >= g.X and (r[Z[3]].X <= g.X + B.X and (r[Z[3]].Y >= g.Y and r[Z[3]].Y <= g.Y + B.Y)); 
                    end;
                    if B(r[Z[1]]) or B(r[Z[4]]) then
                        return;
                    end;
                    r[Z[5]]();
                    return; 
                end);
                local function r267(arg1_77, arg2_77, arg3_77, ...)
                    local Z = {
                        579,
                        580,
                        578,
                        Z[1],
                        Z[2],
                        577,
                        Z[6],
                        Z[3]
                    };
                    v1 = arg1_77;
                    B = r[Z[1]];
                    g = arg2_77;
                    if B then
                        D = r[Z[2]] == v1;
                    end;
                    if B then
                        r[Z[3]]();
                        return;
                    end;
                    r[Z[3]]();
                    r[Z[2]] = v1;
                    r268 = Color3.fromRGB(24, 18, 42);
                    r269 = Color3.fromRGB(60, 45, 95);
                    r270 = Color3.fromRGB(248, 244, 255);
                    r271 = Color3.fromRGB(210, 195, 235);
                    B = Instance.new("Frame");
                    B.Name = "BoostDropdown";
                    B.BackgroundColor3 = r268;
                    B.BackgroundTransparency = .08;
                    B.BorderSizePixel = 0;
                    B.Size = UDim2.new(0, v1.AbsoluteSize.X, 0, 0);
                    B.ZIndex = 20;
                    B.ClipsDescendants = false;
                    B.Parent = r[Z[6]];
                    Instance.new("UICorner", B).CornerRadius = UDim.new(0, 14);
                    Q = Instance.new("UIGradient");
                    Q.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 90, 180)),
                        ColorSequenceKeypoint.new(.3, r268),
                        ColorSequenceKeypoint.new(1, r268)
                    });
                    Q.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, .6),
                        NumberSequenceKeypoint.new(.3, 1),
                        NumberSequenceKeypoint.new(1, 1)
                    });
                    Q.Rotation = 90;
                    Q.Parent = B;
                    i = Instance.new("UIStroke");
                    i.Color = Color3.fromRGB(140, 100, 210);
                    i.Transparency = .3;
                    i.Thickness = 1.2;
                    i.Parent = B;
                    a = Instance.new("ImageLabel");
                    a.BackgroundTransparency = 1;
                    a.Image = "rbxassetid://6014261993";
                    a.ImageColor3 = Color3.fromRGB(80, 40, 140);
                    a.ImageTransparency = .55;
                    a.ScaleType = Enum.ScaleType.Slice;
                    a.SliceCenter = Rect.new(49, 49, 450, 450);
                    a.Size = UDim2.new(1, 22, 1, 22);
                    a.Position = UDim2.new(0, -11, 0, -8);
                    a.ZIndex = 19;
                    a.Parent = B;
                    v2 = Instance.new("Frame");
                    v2.Size = UDim2.new(1, 0, 1, 0);
                    v2.BackgroundTransparency = 1;
                    v2.ClipsDescendants = true;
                    v2.ZIndex = 20;
                    v2.Parent = B;
                    q = v1.AbsolutePosition;
                    o = r[Z[6]].AbsolutePosition;
                    O = q.X - o.X;
                    v5 = r[Z[6]].AbsoluteSize.X;
                    if O + v1.AbsoluteSize.X > v5 - 8 then
                        O = v5 - v1.AbsoluteSize.X - 8;
                    end;
                    B.Position = UDim2.new(0, O, 0, q.Y - o.Y + v1.AbsoluteSize.Y + 6);
                    X = Instance.new("ScrollingFrame");
                    X.Size = UDim2.new(1, 0, 1, 0);
                    X.BackgroundTransparency = 1;
                    X.ScrollBarThickness = 3;
                    X.ScrollBarImageColor3 = Color3.fromRGB(140, 100, 210);
                    X.ScrollBarImageTransparency = .35;
                    X.CanvasSize = UDim2.new(0, 0, 0, 0);
                    X.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                    X.ZIndex = 21;
                    X.Parent = v2;
                    v = Instance.new("UIListLayout");
                    v.Padding = UDim.new(0, 1);
                    v.Parent = X;
                    t = Instance.new("UIPadding");
                    t.PaddingTop = UDim.new(0, 5);
                    t.PaddingBottom = UDim.new(0, 5);
                    t.Parent = X;
                    for L, I in ipairs(g) do
                        h = L;
                        r272 = I.label == arg3_77;
                        r273 = Instance.new("TextButton");
                        r273.Size = UDim2.new(1, 0, 0, 38);
                        C = v1;
                        r273.BackgroundColor3 = r272 and r269 or r268;
                        r273.BackgroundTransparency = r272 and .3 or 1;
                        r273.Text = "";
                        r273.AutoButtonColor = false;
                        r273.ZIndex = 21;
                        xg = X;
                        r273.Parent = xg;
                        if r272 then
                            Cg = Instance.new("Frame");
                            Cg.Size = UDim2.new(0, 3, .55, 0);
                            Cg.Position = UDim2.new(0, 7, .225, 0);
                            Cg.BackgroundColor3 = r[Z[7]];
                            Cg.BorderSizePixel = 0;
                            Cg.ZIndex = 22;
                            Cg.Parent = r273;
                            Instance.new("UICorner", Cg).CornerRadius = UDim.new(1, 0);
                            xg = Instance.new("UIStroke");
                            xg.Color = r[Z[7]];
                            xg.Transparency = 0.5;
                            xg.Thickness = 2;
                            xg.Parent = Cg;
                        end;
                        r274 = Instance.new("TextLabel");
                        r274.Size = UDim2.new(1, -18, 1, 0);
                        r274.Position = UDim2.new(0, r272 and 18 or 14, 0, 0);
                        r274.BackgroundTransparency = 1;
                        r274.Text = I.label;
                        Cg = r274;
                        xg = "TextColor3";
                        Zg = v1;
                        kg = r272 and r270;
                        C, Vg = v1, kg;
                        if kg then
                            r[wg].TextColor3 = kg;
                            C = v1;
                            C = v1;
                            r274.Font = r272 and Enum.Font.GothamBold or Enum.Font.Gotham;
                            r274.TextSize = 12;
                            r274.TextXAlignment = Enum.TextXAlignment.Left;
                            r274.TextTruncate = Enum.TextTruncate.AtEnd;
                            r274.ZIndex = 22;
                            r274.Parent = r273;
                            Cg = r273.MouseEnter;
                            Cg.Connect(Cg, function(...)
                                local Z = {
                                    268,
                                    Z[8],
                                    269,
                                    Z[4],
                                    Z[5],
                                    99,
                                    210,
                                    100
                                };
                                if not r[Z[1]] then
                                    r[Z[2]](r[Z[3]], {
                                        ["BackgroundColor3"] = r[Z[6]],
                                        ["BackgroundTransparency"] = .6
                                    }, .12, Enum.EasingStyle.Sine);
                                    r[Z[2]](r[Z[7]], {
                                        ["TextColor3"] = r[Z[8]]
                                    }, .12, Enum.EasingStyle.Sine);
                                end;
                                return; 
                            end);
                            Cg = r273.MouseLeave;
                            Cg.Connect(Cg, function(...)
                                local Z = {
                                    268,
                                    Z[8],
                                    269,
                                    Z[4],
                                    Z[5],
                                    98,
                                    210,
                                    101
                                };
                                if not r[Z[1]] then
                                    r[Z[2]](r[Z[3]], {
                                        ["BackgroundColor3"] = r[Z[6]],
                                        ["BackgroundTransparency"] = 1
                                    }, .12, Enum.EasingStyle.Sine);
                                    r[Z[2]](r[Z[7]], {
                                        ["TextColor3"] = r[Z[8]]
                                    }, .12, Enum.EasingStyle.Sine);
                                end;
                                return; 
                            end);
                            r275 = I;
                            xg = r273.MouseButton1Click;
                            xg.Connect(xg, function(...)
                                local Z = {
                                    Z[3],
                                    239,
                                    Z[4],
                                    Z[5]
                                };
                                r[Z[1]]();
                                r[Z[2]].onSelect();
                                return; 
                            end);
                        else
                            Vg = r271;
                        end; 
                    end;
                    r[Z[1]] = B;
                    r[Z[8]](B, {
                        ["Size"] = UDim2.new(0, v1.AbsoluteSize.X, 0, math.min(#g * (38 + 1) + 10, 240))
                    }, .22, Enum.EasingStyle.Quint);
                    return; 
                end;
                r276 = Instance.new("ScrollingFrame");
                r276.Size = UDim2.new(1, 0, 1, 0);
                r276.BackgroundTransparency = 1;
                r276.ScrollBarThickness = 5;
                r276.ScrollBarImageColor3 = r[Z[6]];
                r276.ScrollBarImageTransparency = .3;
                r276.CanvasSize = UDim2.new(0, 0, 0, 0);
                r276.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                r276.Parent = v3;
                Q = Instance.new("UIListLayout");
                Q.SortOrder = Enum.SortOrder.LayoutOrder;
                Q.Padding = UDim.new(0, 10);
                Q.Parent = r276;
                (function(arg1_78, arg2_78, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[7],
                        582
                    };
                    v3 = Instance.new("TextLabel");
                    v3.Size = UDim2.new(1, 0, 0, 14);
                    v3.BackgroundTransparency = 1;
                    D = arg1_78;
                    v3.Text = D;
                    v3.TextColor3 = r[Z[3]];
                    v3.TextSize = 10;
                    v3.Font = Enum.Font.GothamBold;
                    v3.TextXAlignment = Enum.TextXAlignment.Left;
                    D = arg2_78;
                    v3.LayoutOrder = D;
                    v3.Parent = r[Z[4]];
                    return; 
                end)("PRESET", 1);
                r277 = Instance.new("TextButton");
                r277.Size = UDim2.new(1, 0, 0, 46);
                r277.BackgroundColor3 = r[Z[8]];
                r277.BackgroundTransparency = .88;
                r277.Text = "";
                r277.AutoButtonColor = false;
                r277.LayoutOrder = 2;
                r277.Parent = r276;
                Instance.new("UICorner", r277).CornerRadius = UDim.new(0, 12);
                v2 = Instance.new("UIStroke");
                v2.Color = Color3.new(1, 1, 1);
                v2.Transparency = .65;
                v2.Thickness = 1;
                v2.Parent = r277;
                r278 = Instance.new("TextLabel");
                r278.Name = "PresetName";
                r278.Size = UDim2.new(1, -44, 1, 0);
                r278.Position = UDim2.new(0, 16, 0, 0);
                r278.BackgroundTransparency = 1;
                r278.Text = r[Z[9]];
                r278.TextColor3 = r[Z[10]];
                r278.Font = Enum.Font.GothamBold;
                r278.TextSize = 13;
                r278.TextXAlignment = Enum.TextXAlignment.Left;
                r278.Parent = r277;
                o = Instance.new("TextLabel");
                o.Size = UDim2.new(0, 28, 1, 0);
                o.Position = UDim2.new(1, -32, 0, 0);
                o.BackgroundTransparency = 1;
                o.Text = "\xe2\x96\xbc";
                o.TextColor3 = r[Z[6]];
                o.Font = Enum.Font.GothamBold;
                o.TextSize = 14;
                o.Parent = r277;
                local function r279(...)
                    local Z = {
                        Z[11],
                        Z[1],
                        Z[2],
                        Z[12],
                        Z[9],
                        Z[13],
                        Z[14],
                        Z[15],
                        Z[16],
                        Z[17],
                        584,
                        582,
                        Z[18],
                        Z[6]
                    };
                    v1 = {};
                    B = r[Z[1]];
                    for v3, E in ipairs(D) do
                        r280 = E;
                        table.insert(v1, {
                            ["label"] = r280,
                            ["onSelect"] = function(...)
                                local Z = {
                                    Z[4],
                                    153,
                                    Z[5],
                                    Z[6],
                                    Z[7],
                                    Z[8],
                                    Z[2],
                                    Z[3],
                                    Z[9],
                                    Z[10],
                                    Z[11],
                                    Z[12],
                                    Z[13],
                                    Z[14]
                                };
                                v1 = r[Z[1]][r[Z[2]]];
                                if not v1 then
                                    return;
                                end;
                                r[Z[3]] = r[Z[2]];
                                for g = 1, 4 do
                                    r[Z[4]][g] = v1[g];
                                    v4 = r[Z[5]][v1[g]];
                                    if v4 then
                                        r[Z[6]](v4.animId);
                                    end; 
                                end;
                                r[Z[9]]();
                                r[Z[10]]();
                                v4 = 30184877583823;
                                r[Z[11]][r[Z[7]][r[Z[8]]("\xde\xd1M|", v4)]] = r[Z[2]];
                                D = 1;
                                for g = D, 4 do
                                    D = r[Z[12]];
                                    Q = true;
                                    v4 = D.FindFirstChild(D, "LvlRow" .. g, Q);
                                    if v4 then
                                        Q = r[Z[5]][r[Z[4]][g]];
                                        if v4.FindFirstChild(v4, "CurLabel", true) then
                                            if Q then
                                                v2 = D.name;
                                            end;
                                            C = C;
                                            if Q then
                                                v4.FindFirstChild(v4, r[Z[7]][r[Z[8]](v2, q)], true).Text = Q;
                                                C = C;
                                            else
                                                i = "?";
                                            end;
                                        end;
                                    end; 
                                end;
                                r[Z[13]]("Boost Preset", r[Z[2]], r[Z[14]], "success", 1.5);
                                return; 
                            end
                        }); 
                    end;
                    if r[Z[5]] == "Custom" then
                        table.insert(v1, 1, {
                            ["label"] = "Custom (modified)",
                            ["onSelect"] = function(...)
                                return; 
                            end
                        });
                    end;
                    return v1; 
                end;
                C = r277.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        581,
                        583,
                        585,
                        Z[37]
                    };
                    r[Z[1]](r[Z[2]], r[Z[3]](), r[Z[4]]);
                    return; 
                end);
                S = Instance.new("TextButton");
                S.Size = UDim2.new(1, 0, 0, 28);
                S.BackgroundTransparency = 1;
                S.Text = "";
                S.AutoButtonColor = false;
                S.LayoutOrder = 3;
                S.Parent = r276;
                v5 = Instance.new("Frame");
                v5.AnchorPoint = Vector2.new(0, 0.5);
                v5.Size = UDim2.new(.18, 0, 0, 1);
                v5.Position = UDim2.new(0, 0, 0.5, 0);
                v5.BackgroundColor3 = r[Z[7]];
                v5.BackgroundTransparency = 0.5;
                v5.BorderSizePixel = 0;
                v5.Parent = S;
                Y = Instance.new("Frame");
                Y.AnchorPoint = Vector2.new(1, 0.5);
                Y.Size = UDim2.new(.18, 0, 0, 1);
                Y.Position = UDim2.new(1, 0, 0.5, 0);
                Y.BackgroundColor3 = r[Z[7]];
                Y.BackgroundTransparency = 0.5;
                Y.BorderSizePixel = 0;
                Y.Parent = S;
                r281 = Instance.new("TextLabel");
                r281.AnchorPoint = Vector2.new(0.5, 0.5);
                r281.Size = UDim2.new(.64, 0, 1, 0);
                r281.Position = UDim2.new(0.5, 0, 0.5, 0);
                r281.BackgroundTransparency = 1;
                r281.Text = "ADVANCED  \xe2\x96\xb6";
                r281.TextColor3 = r[Z[7]];
                r281.Font = Enum.Font.GothamBold;
                r281.TextSize = 10;
                r281.Parent = S;
                C = S.MouseEnter;
                C.Connect(C, function(...)
                    local Z = {
                        Z[3],
                        586,
                        Z[1],
                        Z[2],
                        Z[19]
                    };
                    r[Z[1]](r[Z[2]], {
                        ["TextColor3"] = r[Z[5]]
                    }, .15, Enum.EasingStyle.Sine);
                    return; 
                end);
                C = S.MouseLeave;
                C.Connect(C, function(...)
                    local Z = {
                        Z[3],
                        586,
                        Z[1],
                        Z[2],
                        Z[7]
                    };
                    r[Z[1]](r[Z[2]], {
                        ["TextColor3"] = r[Z[5]]
                    }, .15, Enum.EasingStyle.Sine);
                    return; 
                end);
                r282 = Instance.new("Frame");
                r282.Name = "AdvancedBody";
                r282.Size = UDim2.new(1, 0, 0, 0);
                r282.BackgroundTransparency = 1;
                r282.ClipsDescendants = true;
                r282.LayoutOrder = 4;
                r282.Visible = false;
                r282.Parent = r276;
                t = Instance.new("UIListLayout");
                t.SortOrder = Enum.SortOrder.LayoutOrder;
                wg = 30139779050917;
                t.Padding = UDim.new(0, 6);
                t.Parent = r282;
                r283 = 0;
                for J = 1, 4 do
                    wg = Instance.new("Frame");
                    wg.Name = "LvlRow" .. J;
                    wg.Size = UDim2.new(1, 0, 0, 44);
                    wg.BackgroundColor3 = r[Z[8]];
                    wg.BackgroundTransparency = .9;
                    wg.LayoutOrder = ug;
                    wg.Parent = r282;
                    Instance.new("UICorner", wg).CornerRadius = UDim.new(0, 10);
                    Cg = Instance.new("UIStroke");
                    Cg.Color = Color3.new(1, 1, 1);
                    Cg.Transparency = .76;
                    Cg.Thickness = 1;
                    Cg.Parent = wg;
                    xg = Instance.new("TextLabel");
                    xg.Size = UDim2.new(.36, 0, 1, 0);
                    xg.Position = UDim2.new(0, 12, 0, 0);
                    xg.BackgroundTransparency = 1;
                    xg.Text = ({
                        "Boost 1",
                        "Boost 2",
                        "Boost 3",
                        r[Z[1]][r[Z[2]]("\x08\r\xb2\xb4n\x85\xcb", wg)]
                    })[J];
                    xg.TextColor3 = r[Z[10]];
                    xg.Font = Enum.Font.GothamBold;
                    xg.TextSize = 12;
                    xg.TextXAlignment = Enum.TextXAlignment.Left;
                    xg.Parent = wg;
                    r284 = Instance.new("TextButton");
                    r284.Size = UDim2.new(.6, -8, .6, 0);
                    r284.Position = UDim2.new(.38, 0, .2, 0);
                    r284.BackgroundColor3 = r[Z[8]];
                    r284.BackgroundTransparency = .76;
                    r284.Text = "";
                    r284.AutoButtonColor = false;
                    r284.Parent = wg;
                    Instance.new("UICorner", r284).CornerRadius = UDim.new(0, 8);
                    Zg = Instance.new("UIStroke");
                    Zg.Color = r[Z[6]];
                    Zg.Transparency = .55;
                    Zg.Thickness = 1;
                    Zg.Parent = r284;
                    kg = r[Z[14]][r[Z[13]][J]];
                    Pg = Instance.new("TextLabel");
                    Pg.Name = "CurLabel";
                    Pg.Size = UDim2.new(1, -22, 1, 0);
                    Pg.Position = UDim2.new(0, 8, 0, 0);
                    Pg.BackgroundTransparency = 1;
                    C = "Text";
                    rg = C;
                    D, C = kg and kg.name, C;
                    if kg then
                        C = r[Z[2]];
                        Pg[C] = Ag and kg.name;
                        Pg.TextColor3 = r[Z[19]];
                        Pg.Font = Enum.Font.Gotham;
                        Pg.TextSize = 11;
                        Pg.TextXAlignment = Enum.TextXAlignment.Left;
                        Pg.TextTruncate = Enum.TextTruncate.AtEnd;
                        Pg.Parent = r284;
                        rg = Instance.new("TextLabel");
                        rg.Size = UDim2.new(0, 16, 1, 0);
                        rg.Position = UDim2.new(1, -18, 0, 0);
                        rg.BackgroundTransparency = 1;
                        rg.Text = "\xe2\x96\xbc";
                        rg.TextColor3 = r[Z[6]];
                        rg.Font = Enum.Font.GothamBold;
                        rg.TextSize = 11;
                        rg.Parent = r284;
                        r285 = J;
                        r286 = Pg;
                        C = r284.MouseButton1Click;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[20],
                                Z[1],
                                Z[2],
                                Z[13],
                                203,
                                Z[15],
                                Z[12],
                                Z[9],
                                Z[16],
                                Z[17],
                                Z[14],
                                202,
                                584,
                                Z[18],
                                Z[6],
                                581,
                                284
                            };
                            v1 = {};
                            C = ipairs;
                            B = r[Z[1]];
                            for v3, E in C(D) do
                                r287 = E;
                                table.insert(v1, {
                                    ["label"] = r287.name,
                                    ["onSelect"] = function(...)
                                        local Z = {
                                            Z[4],
                                            Z[5],
                                            74,
                                            Z[2],
                                            Z[3],
                                            Z[6],
                                            Z[7],
                                            Z[8],
                                            Z[9],
                                            Z[10],
                                            Z[11],
                                            Z[12],
                                            Z[13],
                                            Z[14],
                                            Z[15]
                                        };
                                        r[Z[1]][r[Z[2]]] = r[Z[3]].id;
                                        r[Z[6]](r[Z[3]].animId);
                                        C = pairs;
                                        B = r[Z[7]];
                                        for v3, E in C(D) do
                                            R = v3;
                                            if E then
                                                v4 = true;
                                                for Q = 1, 4 do
                                                    if r[Z[4]][Q] ~= E[Q] then
                                                        v4 = false;
                                                    else
                                                        
                                                    end; 
                                                end;
                                                if v4 then
                                                    r[Z[8]] = v3;
                                                    v1, R = true, nil;
                                                else
                                                    
                                                end;
                                            end; 
                                        end;
                                        if not false then
                                            r[Z[8]] = "Custom";
                                        end;
                                        r[Z[9]]();
                                        r[Z[10]]();
                                        v3 = r[Z[11]][r[Z[3]].id];
                                        if v3 then
                                            Q = v3.name;
                                        end;
                                        C = C;
                                        r[Z[12]].Text = v3 or "?";
                                        v1, C = nil, C;
                                        r[Z[13]].Text = r[Z[8]];
                                        r[Z[14]]("Boost " .. r[Z[2]], r[Z[3]].name, r[Z[15]], "success", 1.5);
                                        return; 
                                    end
                                }); 
                            end;
                            C = C;
                            r[Z[16]](r[Z[17]], v1, (r[Z[11]][r[Z[4]][r[Z[5]]]] or ).name or "");
                            return; 
                        end);
                        r283 = r283 + 44 + 6;
                    else
                        D = "?";
                    end; 
                end;
                C = r276.InputBegan;
                C.Connect(C, function(arg1_79, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        578
                    };
                    v1 = arg1_79;
                    if v1.UserInputType == Enum.UserInputType.MouseButton1 or v1.UserInputType == Enum.UserInputType.Touch then
                        r[Z[3]]();
                    end;
                    return; 
                end);
                r288 = false;
                C = S.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        578,
                        272,
                        586,
                        Z[1],
                        Z[2],
                        587,
                        Z[3],
                        588
                    };
                    r[Z[1]]();
                    C = not r[Z[2]];
                    r[Z[2]] = C;
                    D = r[Z[3]];
                    E = r[Z[2]] and "  \xe2\x96\xbc";
                    C = C;
                    if E then
                        r[Z[3]].Text = "ADVANCED" .. E;
                        C = C;
                        if r[Z[2]] then
                            r[Z[6]].Visible = true;
                            r[Z[7]](r[Z[6]], {
                                ["Size"] = UDim2.new(1, 0, 0, r[Z[8]] + 8)
                            }, .3, Enum.EasingStyle.Quint);
                        else
                            r[Z[7]](r[Z[6]], {
                                ["Size"] = UDim2.new(1, 0, 0, 0)
                            }, 0.25, Enum.EasingStyle.Quint);
                            task.delay(.28, function(...)
                                local Z = {
                                    Z[2],
                                    Z[6],
                                    Z[4],
                                    Z[5]
                                };
                                if not r[Z[1]] then
                                    r[Z[2]].Visible = false;
                                end;
                                return; 
                            end);
                        end;
                        return;
                    else
                        B = "  \xe2\x96\xb6";
                    end; 
                end);
                return v3; 
            end;
            local function r289(arg1_80, ...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[8],
                    Z[22],
                    Z[44],
                    Z[18],
                    Z[19],
                    147,
                    Z[7],
                    Z[10],
                    Z[20],
                    Z[13],
                    Z[3],
                    143,
                    Z[5],
                    Z[6],
                    141,
                    Z[15],
                    145,
                    Z[14],
                    Z[12],
                    Z[26],
                    131,
                    Z[45],
                    Z[46],
                    Z[47],
                    Z[9],
                    Z[29],
                    Z[48],
                    Z[49],
                    Z[50],
                    Z[51],
                    Z[52],
                    Z[53],
                    Z[54],
                    Z[55],
                    Z[56]
                };
                r290 = Instance.new("ScrollingFrame");
                r290.Size = UDim2.new(1, 0, 1, 0);
                r290.BackgroundTransparency = 1;
                r290.ScrollBarThickness = 5;
                r290.ScrollBarImageColor3 = r[Z[3]];
                r290.ScrollBarImageTransparency = .3;
                r290.CanvasSize = UDim2.new(0, 0, 0, 0);
                r290.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                r290.Visible = false;
                v3 = arg1_80;
                r290.Parent = v3;
                v3 = Instance.new("UIListLayout");
                v3.Padding = UDim.new(0, 8);
                v3.SortOrder = Enum.SortOrder.LayoutOrder;
                v3.Parent = r290;
                local function B(arg1_81, arg2_81, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        602,
                        Z[3],
                        Z[4],
                        Z[5]
                    };
                    v1 = arg1_81;
                    v3 = Instance.new("Frame");
                    v3.Size = UDim2.new(1, 0, 0, 22);
                    v3.BackgroundTransparency = 1;
                    D = arg2_81;
                    v3.LayoutOrder = D;
                    v3.Parent = r[Z[3]];
                    B = Instance.new("Frame");
                    B.Size = UDim2.new(0, 3, 0, 11);
                    B.Position = UDim2.new(0, 2, 0.5, -5);
                    B.BackgroundColor3 = r[Z[4]];
                    B.BorderSizePixel = 0;
                    B.Parent = v3;
                    Instance.new("UICorner", B).CornerRadius = UDim.new(1, 0);
                    R = Instance.new("UIGradient");
                    R.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 160, 255)),
                        ColorSequenceKeypoint.new(1, r[Z[4]])
                    });
                    R.Rotation = 90;
                    R.Parent = B;
                    E = Instance.new("TextLabel");
                    E.Size = UDim2.new(0, 0, 1, 0);
                    E.AutomaticSize = Enum.AutomaticSize.X;
                    E.Position = UDim2.new(0, 12, 0, 0);
                    E.BackgroundTransparency = 1;
                    D = arg1_81;
                    E.Text = D;
                    E.TextColor3 = r[Z[5]];
                    E.TextSize = 10;
                    E.Font = Enum.Font.GothamBold;
                    E.TextXAlignment = Enum.TextXAlignment.Left;
                    E.Parent = v3;
                    v4 = Instance.new("Frame");
                    v4.AnchorPoint = Vector2.new(1, 0.5);
                    v4.Position = UDim2.new(1, -2, 0.5, 0);
                    v4.BackgroundColor3 = Color3.new(1, 1, 1);
                    v4.BackgroundTransparency = .8;
                    v4.BorderSizePixel = 0;
                    v4.Parent = v3;
                    Instance.new("UICorner", v4).CornerRadius = UDim.new(1, 0);
                    M = Instance.new("UIGradient");
                    M.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(1, .35)
                    });
                    M.Parent = v4;
                    D = r[Z[6]];
                    v4.Size = UDim2.new(1, -(12 + D.GetTextSize(D, v1, 10, Enum.Font.GothamBold, Vector2.new(1000, 22)).X + 16), 0, 1);
                    return v3; 
                end;
                local function C(arg1_82, arg2_82, arg3_82, arg4_82, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[6],
                        Z[7],
                        Z[8],
                        Z[9]
                    };
                    r291 = Instance.new("Frame");
                    r291.Size = UDim2.new(1, 0, 0, 44);
                    r291.BackgroundColor3 = r[Z[3]];
                    r291.BackgroundTransparency = .9;
                    r291.BorderSizePixel = 0;
                    E = arg1_82;
                    r291.LayoutOrder = E;
                    Instance.new("UICorner", r291).CornerRadius = UDim.new(0, 13);
                    r292 = Instance.new("UIStroke", r291);
                    r292.Color = Color3.new(1, 1, 1);
                    r292.Transparency = .86;
                    r292.Thickness = 1;
                    v4 = Instance.new("TextLabel", r291);
                    v4.Size = UDim2.new(1, -70, 1, 0);
                    v4.Position = UDim2.new(0, 16, 0, 0);
                    v4.BackgroundTransparency = 1;
                    D = arg2_82;
                    v4.Text = D;
                    v4.TextColor3 = r[Z[4]];
                    v4.TextSize = 12;
                    v4.Font = Enum.Font.GothamMedium;
                    v4.TextXAlignment = Enum.TextXAlignment.Left;
                    M = Instance.new("Frame", r291);
                    M.Size = UDim2.new(0, 44, 0, 24);
                    M.Position = UDim2.new(1, -58, 0.5, -12);
                    M.BackgroundTransparency = 1;
                    C = r291.MouseEnter;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[6],
                            235,
                            Z[1],
                            Z[2],
                            236
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .8
                        }, .15, Enum.EasingStyle.Sine);
                        r[Z[1]](r[Z[5]], {
                            ["Transparency"] = .62
                        }, .15, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    C = r291.MouseLeave;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[6],
                            235,
                            Z[1],
                            Z[2],
                            236
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .9
                        }, .2, Enum.EasingStyle.Sine);
                        r[Z[1]](r[Z[5]], {
                            ["Transparency"] = .86
                        }, .2, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    return {
                        ["frame"] = r291,
                        ["toggle"] = r[Z[5]](M, arg3_82, arg4_82)
                    }; 
                end;
                local function E(arg1_83, arg2_83, arg3_83, arg4_83, arg5_83, arg6_83, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[6],
                        Z[9],
                        Z[7],
                        Z[3],
                        Z[10],
                        Z[11]
                    };
                    v3 = arg3_83;
                    r293 = arg4_83;
                    r294 = arg5_83;
                    r295 = arg6_83;
                    r294 = r294 or 0;
                    M = C;
                    r295 = r295 or 1;
                    r296 = Instance.new("Frame");
                    r296.Size = UDim2.new(1, 0, 0, 58);
                    r296.BackgroundColor3 = r[Z[3]];
                    r296.BackgroundTransparency = .9;
                    r296.BorderSizePixel = 0;
                    a = arg1_83;
                    r296.LayoutOrder = a;
                    Instance.new("UICorner", r296).CornerRadius = UDim.new(0, 13);
                    r297 = Instance.new("UIStroke", r296);
                    r297.Color = Color3.new(1, 1, 1);
                    r297.Transparency = .86;
                    r297.Thickness = 1;
                    i = r296.MouseEnter;
                    i.Connect(i, function(...)
                        local Z = {
                            Z[4],
                            87,
                            Z[1],
                            Z[2],
                            88
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .8
                        }, .15, Enum.EasingStyle.Sine);
                        r[Z[1]](r[Z[5]], {
                            ["Transparency"] = .62
                        }, .15, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    i = r296.MouseLeave;
                    i.Connect(i, function(...)
                        local Z = {
                            Z[4],
                            87,
                            Z[1],
                            Z[2],
                            88
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .9
                        }, .2, Enum.EasingStyle.Sine);
                        r[Z[1]](r[Z[5]], {
                            ["Transparency"] = .86
                        }, .2, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    a = Instance.new("TextLabel", r296);
                    a.Size = UDim2.new(.6, 0, 0, 20);
                    a.Position = UDim2.new(0, 14, 0, 6);
                    a.BackgroundTransparency = 1;
                    v2 = arg2_83;
                    a.Text = v2;
                    a.TextColor3 = r[Z[5]];
                    a.TextSize = 12;
                    a.Font = Enum.Font.GothamMedium;
                    a.TextXAlignment = Enum.TextXAlignment.Left;
                    r298 = Instance.new("TextLabel", r296);
                    r298.Size = UDim2.new(.38, -14, 0, 20);
                    r298.Position = UDim2.new(.62, 0, 0, 6);
                    r298.BackgroundTransparency = 1;
                    r298.TextColor3 = r[Z[6]];
                    r298.TextSize = 12;
                    r298.Font = Enum.Font.GothamBold;
                    r298.TextXAlignment = Enum.TextXAlignment.Right;
                    local function r299(arg1_84, ...)
                        local Z = {
                            Z[1],
                            Z[2]
                        };
                        return math.floor(arg1_84 * 100 + 0.5) .. "%"; 
                    end;
                    r298.Text = r299(v3());
                    r300 = Instance.new("Frame", r296);
                    r300.Size = UDim2.new(1, -28, 0, 6);
                    r300.Position = UDim2.new(0, 14, 0, 38);
                    r300.BackgroundColor3 = Color3.new(1, 1, 1);
                    r300.BackgroundTransparency = .88;
                    r300.BorderSizePixel = 0;
                    Instance.new("UICorner", r300).CornerRadius = UDim.new(1, 0);
                    r301 = Instance.new("Frame", r300);
                    r301.BackgroundColor3 = r[Z[6]];
                    r301.BorderSizePixel = 0;
                    Instance.new("UICorner", r301).CornerRadius = UDim.new(1, 0);
                    r302 = Instance.new("Frame", r300);
                    r302.Size = UDim2.new(0, 14, 0, 14);
                    r302.AnchorPoint = Vector2.new(0.5, 0.5);
                    r302.BackgroundColor3 = Color3.new(1, 1, 1);
                    r302.BorderSizePixel = 0;
                    r302.ZIndex = 2;
                    Instance.new("UICorner", r302).CornerRadius = UDim.new(1, 0);
                    v5 = Instance.new("UIStroke", r302);
                    v5.Color = r[Z[6]];
                    v5.Thickness = 1.5;
                    local function r303(arg1_85, ...)
                        local Z = {
                            Z[1],
                            Z[2],
                            92,
                            93,
                            84,
                            86,
                            89,
                            90,
                            85
                        };
                        v1 = math.clamp(arg1_85, 0, 1);
                        r[Z[3]].Size = UDim2.new(v1, 0, 1, 0);
                        r[Z[4]].Position = UDim2.new(v1, 0, 0.5, 0);
                        g = r[Z[5]] + (r[Z[6]] - r[Z[5]]) * v1;
                        r[Z[7]].Text = r[Z[8]](g);
                        r[Z[9]](g);
                        return; 
                    end;
                    r303((v3() - r294) / (r295 - r294));
                    r304 = false;
                    local function r305(arg1_86, ...)
                        local Z = {
                            91,
                            Z[1],
                            Z[2],
                            94
                        };
                        r[Z[4]]((arg1_86 - r[Z[1]].AbsolutePosition.X) / math.max(r[Z[1]].AbsoluteSize.X, 1));
                        return; 
                    end;
                    v = r300.InputBegan;
                    v.Connect(v, function(arg1_87, ...)
                        local Z = {
                            Z[1],
                            Z[2],
                            95,
                            96
                        };
                        v1 = arg1_87;
                        if v1.UserInputType == Enum.UserInputType.MouseButton1 then
                            r[Z[3]] = true;
                            r[Z[4]](v1.Position.X);
                        end;
                        return; 
                    end);
                    v = r302.InputBegan;
                    v.Connect(v, function(arg1_88, ...)
                        local Z = {
                            Z[1],
                            Z[2],
                            95
                        };
                        if arg1_88.UserInputType == Enum.UserInputType.MouseButton1 then
                            r[Z[3]] = true;
                        end;
                        return; 
                    end);
                    v = r[Z[7]].InputChanged;
                    v.Connect(v, function(arg1_89, ...)
                        local Z = {
                            95,
                            Z[1],
                            Z[2],
                            96
                        };
                        v1 = arg1_89;
                        if not r[Z[1]] then
                            return;
                        end;
                        if v1.UserInputType == Enum.UserInputType.MouseMovement then
                            r[Z[4]](v1.Position.X);
                        end;
                        return; 
                    end);
                    v = r[Z[7]].InputEnded;
                    v.Connect(v, function(arg1_90, ...)
                        local Z = {
                            95,
                            Z[1],
                            Z[2],
                            Z[8]
                        };
                        g = r[Z[1]];
                        if g then
                            D = arg1_90.UserInputType == Enum.UserInputType.MouseButton1;
                        end;
                        if g then
                            r[Z[1]] = false;
                            r[Z[4]]();
                        end;
                        return; 
                    end);
                    return {
                        ["frame"] = r296,
                        ["slider"] = {
                            ["setVal"] = function(arg1_91, ...)
                                local Z = {
                                    94,
                                    84,
                                    86
                                };
                                r[Z[1]]((arg1_91 - r[Z[2]]) / (r[Z[3]] - r[Z[2]]));
                                return; 
                            end
                        }
                    }; 
                end;
                local function v4(arg1_92, arg2_92, arg3_92, ...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[12],
                        602,
                        Z[9],
                        Z[13],
                        Z[14]
                    };
                    r306 = arg3_92;
                    r307 = Instance.new("TextButton");
                    r307.Size = UDim2.new(1, 0, 0, 26);
                    r307.BackgroundColor3 = r[Z[3]];
                    r307.BackgroundTransparency = .94;
                    R = arg2_92;
                    r307.Text = R;
                    r307.TextColor3 = Color3.fromRGB(200, 90, 100);
                    r307.TextSize = 10;
                    r307.Font = Enum.Font.GothamBold;
                    r307.AutoButtonColor = false;
                    R = arg1_92;
                    r307.LayoutOrder = R;
                    r307.Parent = r[Z[4]];
                    Instance.new("UICorner", r307).CornerRadius = UDim.new(0, 10);
                    r308 = Instance.new("UIStroke", r307);
                    r308.Color = r[Z[3]];
                    r308.Transparency = .78;
                    r308.Thickness = 1;
                    C = r307.MouseEnter;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[5],
                            108,
                            Z[1],
                            Z[2],
                            109
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .78
                        }, .15, Enum.EasingStyle.Sine);
                        r[Z[1]](r[Z[5]], {
                            ["Transparency"] = .4
                        }, .15, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    C = r307.MouseLeave;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[5],
                            108,
                            Z[1],
                            Z[2],
                            109
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = .94
                        }, .2, Enum.EasingStyle.Sine);
                        r[Z[1]](r[Z[5]], {
                            ["Transparency"] = .78
                        }, .2, Enum.EasingStyle.Sine);
                        return; 
                    end);
                    C = r307.MouseButton1Click;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[6],
                            Z[1],
                            Z[2],
                            Z[7],
                            108,
                            107
                        };
                        if r[Z[1]].capturing then
                            return;
                        end;
                        r[Z[4]](r[Z[5]]);
                        r[Z[6]]();
                        return; 
                    end);
                    return r307; 
                end;
                B("BINDINGS", 0);
                a = r[Z[20]];
                for i, q in ipairs(D) do
                    if not q.quickToggle then
                        (function(arg1_93, arg2_93, arg3_93, ...)
                            local Z = {
                                Z[1],
                                Z[2],
                                Z[6],
                                Z[9],
                                Z[7],
                                Z[15],
                                Z[16],
                                Z[13],
                                Z[14],
                                Z[17],
                                Z[12],
                                Z[18],
                                Z[11],
                                Z[19]
                            };
                            r309 = arg3_93;
                            r310 = Instance.new("Frame");
                            r310.Size = UDim2.new(1, 0, 0, 42);
                            r310.BackgroundColor3 = r[Z[3]];
                            r310.BackgroundTransparency = .9;
                            r310.BorderSizePixel = 0;
                            R = arg2_93;
                            r310.LayoutOrder = R;
                            R = arg1_93;
                            r310.Parent = R;
                            Instance.new("UICorner", r310).CornerRadius = UDim.new(0, 13);
                            r311 = Instance.new("UIStroke", r310);
                            r311.Color = Color3.new(1, 1, 1);
                            r311.Transparency = .86;
                            r311.Thickness = 1;
                            C = r310.MouseEnter;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[4],
                                    167,
                                    Z[1],
                                    Z[2],
                                    168
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["BackgroundTransparency"] = .8
                                }, .15, Enum.EasingStyle.Sine);
                                r[Z[1]](r[Z[5]], {
                                    ["Transparency"] = .62
                                }, .15, Enum.EasingStyle.Sine);
                                return; 
                            end);
                            C = r310.MouseLeave;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[4],
                                    167,
                                    Z[1],
                                    Z[2],
                                    168
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["BackgroundTransparency"] = .9
                                }, .2, Enum.EasingStyle.Sine);
                                r[Z[1]](r[Z[5]], {
                                    ["Transparency"] = .86
                                }, .2, Enum.EasingStyle.Sine);
                                return; 
                            end);
                            E = Instance.new("TextLabel", r310);
                            E.Size = UDim2.new(1, -150, 1, 0);
                            E.Position = UDim2.new(0, 16, 0, 0);
                            E.BackgroundTransparency = 1;
                            E.Text = r309.label;
                            E.TextColor3 = r[Z[5]];
                            E.TextSize = 12;
                            E.Font = Enum.Font.GothamMedium;
                            E.TextXAlignment = Enum.TextXAlignment.Left;
                            r312 = Instance.new("TextButton", r310);
                            r312.Size = UDim2.new(0, 78, 0, 26);
                            r312.Position = UDim2.new(1, -116, 0.5, -13);
                            r312.BackgroundColor3 = Color3.fromRGB(36, 26, 64);
                            r312.BackgroundTransparency = .12;
                            r312.Text = r[Z[6]](r[Z[7]][r309.cfg]);
                            r312.TextColor3 = Color3.fromRGB(240, 234, 252);
                            r312.TextSize = 11;
                            r312.Font = Enum.Font.GothamBold;
                            r312.AutoButtonColor = false;
                            Instance.new("UICorner", r312).CornerRadius = UDim.new(0, 8);
                            r313 = Instance.new("UIStroke", r312);
                            r313.Color = Color3.fromRGB(140, 100, 210);
                            r313.Transparency = 0.5;
                            r313.Thickness = 1;
                            C = r312.MouseEnter;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[4],
                                    170,
                                    Z[1],
                                    Z[2]
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["Transparency"] = .15
                                }, .15, Enum.EasingStyle.Sine);
                                return; 
                            end);
                            C = r312.MouseLeave;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[8],
                                    Z[1],
                                    Z[2],
                                    166,
                                    Z[4],
                                    170
                                };
                                if r[Z[1]].capturing ~= r[Z[4]] then
                                    r[Z[5]](r[Z[6]], {
                                        ["Transparency"] = 0.5
                                    }, .2, Enum.EasingStyle.Sine);
                                end;
                                return; 
                            end);
                            C = r312.MouseButton1Click;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[9],
                                    169,
                                    Z[10],
                                    166,
                                    170
                                };
                                r[Z[1]](r[Z[2]]);
                                r[Z[3]](r[Z[4]], r[Z[2]], r[Z[5]]);
                                return; 
                            end);
                            r314 = Instance.new("TextButton", r310);
                            r314.Size = UDim2.new(0, 26, 0, 26);
                            r314.Position = UDim2.new(1, -34, 0.5, -13);
                            r314.BackgroundColor3 = r[Z[3]];
                            r314.BackgroundTransparency = .88;
                            r314.Text = "\xc3\x97";
                            r314.TextColor3 = r[Z[11]];
                            r314.TextSize = 14;
                            r314.Font = Enum.Font.GothamBold;
                            r314.AutoButtonColor = false;
                            Instance.new("UICorner", r314).CornerRadius = UDim.new(0, 8);
                            r315 = Instance.new("UIStroke", r314);
                            r315.Color = r[Z[11]];
                            r315.Transparency = .7;
                            r315.Thickness = 1;
                            C = r314.MouseEnter;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[4],
                                    172,
                                    Z[1],
                                    Z[2]
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["Transparency"] = .3
                                }, .15, Enum.EasingStyle.Sine);
                                return; 
                            end);
                            C = r314.MouseLeave;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[4],
                                    172,
                                    Z[1],
                                    Z[2]
                                };
                                r[Z[1]](r[Z[2]], {
                                    ["Transparency"] = .7
                                }, .2, Enum.EasingStyle.Sine);
                                return; 
                            end);
                            C = r314.MouseButton1Click;
                            C.Connect(C, function(...)
                                local Z = {
                                    Z[8],
                                    Z[1],
                                    Z[2],
                                    Z[9],
                                    171,
                                    Z[7],
                                    166,
                                    Z[12],
                                    Z[13],
                                    169,
                                    Z[14]
                                };
                                if r[Z[1]].capturing then
                                    return;
                                end;
                                r[Z[4]](r[Z[5]]);
                                r[Z[6]][r[Z[7]].cfg] = nil;
                                r[Z[8]].binds[r[Z[7]].id] = "Unbound";
                                r[Z[9]]();
                                r[Z[10]].Text = "Unbound";
                                r[Z[11]]();
                                return; 
                            end);
                            r[Z[8]].buttons[r309.id] = r312;
                            return r310; 
                        end)(r290, i, q);
                    end; 
                end;
                v4(#r[Z[20]] + 0, "Reset keybindings to defaults", function(...)
                    local Z = {
                        Z[20],
                        Z[1],
                        Z[2],
                        Z[16],
                        Z[18],
                        Z[13],
                        Z[15],
                        Z[11],
                        Z[19],
                        Z[21],
                        Z[3]
                    };
                    v3 = r[Z[1]];
                    for g, R in ipairs(D) do
                        r316 = R;
                        Q = {
                            pcall(function(...)
                                local Z = {
                                    Z[2],
                                    Z[3],
                                    C
                                };
                                return Enum.KeyCode[r[Z[3]].default]; 
                            end)
                        };
                        v4, E = Q[2], Q[1];
                        if E then
                            M = Q[2];
                        end;
                        if E then
                            Q = v4;
                            r[Z[4]][r316.cfg] = Q;
                            r[Z[5]].binds[r316.id] = r316.default;
                        end;
                        M = r[Z[6]].buttons[r316.id];
                        if M then
                            M.Text = r[Z[7]](r[Z[4]][r316.cfg]);
                        end; 
                    end;
                    r[Z[8]]();
                    r[Z[9]]();
                    r[Z[10]]("Keybinds Reset", "All bindings restored to default", r[Z[11]], "success", 2);
                    return; 
                end);
                i = #r[Z[20]] + 1;
                B("QUICK TOGGLES", i);
                C = i + 1;
                i = C;
                a = i + 1;
                i = i + 1;
                r317 = {};
                q = i + 1;
                i = i + 1;
                h = r[Z[20]];
                for t, h in ipairs(h) do
                    v5 = t;
                    if h.quickToggle then
                        table.insert(r317, h);
                    end; 
                end;
                r318 = 42 * #r317 + 6 * math.max(#r317 - 1, 0);
                r319 = Instance.new("Frame");
                r319.BackgroundTransparency = 1;
                r319.ClipsDescendants = true;
                h = q;
                r319.LayoutOrder = h;
                C = C;
                r319.Size = UDim2.new(1, 0, 0, r[Z[22]].quickTogglesEnabled and r318 or 0);
                r319.Visible = r[Z[22]].quickTogglesEnabled;
                r319.Parent = r290;
                t = Instance.new("UIListLayout");
                t.SortOrder = Enum.SortOrder.LayoutOrder;
                t.Padding = UDim.new(0, 6);
                t.Parent = r319;
                L = r317;
                for J, L in ipairs(L) do
                    (function(arg1_94, arg2_94, arg3_94, ...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[6],
                            Z[9],
                            Z[7],
                            Z[15],
                            Z[16],
                            Z[13],
                            Z[14],
                            Z[17],
                            Z[12],
                            Z[18],
                            Z[11],
                            Z[19]
                        };
                        r309 = arg3_94;
                        r310 = Instance.new("Frame");
                        r310.Size = UDim2.new(1, 0, 0, 42);
                        r310.BackgroundColor3 = r[Z[3]];
                        r310.BackgroundTransparency = .9;
                        r310.BorderSizePixel = 0;
                        R = arg2_94;
                        r310.LayoutOrder = R;
                        R = arg1_94;
                        r310.Parent = R;
                        Instance.new("UICorner", r310).CornerRadius = UDim.new(0, 13);
                        r311 = Instance.new("UIStroke", r310);
                        r311.Color = Color3.new(1, 1, 1);
                        r311.Transparency = .86;
                        r311.Thickness = 1;
                        C = r310.MouseEnter;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[4],
                                167,
                                Z[1],
                                Z[2],
                                168
                            };
                            r[Z[1]](r[Z[2]], {
                                ["BackgroundTransparency"] = .8
                            }, .15, Enum.EasingStyle.Sine);
                            r[Z[1]](r[Z[5]], {
                                ["Transparency"] = .62
                            }, .15, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        C = r310.MouseLeave;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[4],
                                167,
                                Z[1],
                                Z[2],
                                168
                            };
                            r[Z[1]](r[Z[2]], {
                                ["BackgroundTransparency"] = .9
                            }, .2, Enum.EasingStyle.Sine);
                            r[Z[1]](r[Z[5]], {
                                ["Transparency"] = .86
                            }, .2, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        E = Instance.new("TextLabel", r310);
                        E.Size = UDim2.new(1, -150, 1, 0);
                        E.Position = UDim2.new(0, 16, 0, 0);
                        E.BackgroundTransparency = 1;
                        E.Text = r309.label;
                        E.TextColor3 = r[Z[5]];
                        E.TextSize = 12;
                        E.Font = Enum.Font.GothamMedium;
                        E.TextXAlignment = Enum.TextXAlignment.Left;
                        r312 = Instance.new("TextButton", r310);
                        r312.Size = UDim2.new(0, 78, 0, 26);
                        r312.Position = UDim2.new(1, -116, 0.5, -13);
                        r312.BackgroundColor3 = Color3.fromRGB(36, 26, 64);
                        r312.BackgroundTransparency = .12;
                        r312.Text = r[Z[6]](r[Z[7]][r309.cfg]);
                        r312.TextColor3 = Color3.fromRGB(240, 234, 252);
                        r312.TextSize = 11;
                        r312.Font = Enum.Font.GothamBold;
                        r312.AutoButtonColor = false;
                        Instance.new("UICorner", r312).CornerRadius = UDim.new(0, 8);
                        r313 = Instance.new("UIStroke", r312);
                        r313.Color = Color3.fromRGB(140, 100, 210);
                        r313.Transparency = 0.5;
                        r313.Thickness = 1;
                        C = r312.MouseEnter;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[4],
                                170,
                                Z[1],
                                Z[2]
                            };
                            r[Z[1]](r[Z[2]], {
                                ["Transparency"] = .15
                            }, .15, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        C = r312.MouseLeave;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[8],
                                Z[1],
                                Z[2],
                                166,
                                Z[4],
                                170
                            };
                            if r[Z[1]].capturing ~= r[Z[4]] then
                                r[Z[5]](r[Z[6]], {
                                    ["Transparency"] = 0.5
                                }, .2, Enum.EasingStyle.Sine);
                            end;
                            return; 
                        end);
                        C = r312.MouseButton1Click;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[9],
                                169,
                                Z[10],
                                166,
                                170
                            };
                            r[Z[1]](r[Z[2]]);
                            r[Z[3]](r[Z[4]], r[Z[2]], r[Z[5]]);
                            return; 
                        end);
                        r314 = Instance.new("TextButton", r310);
                        r314.Size = UDim2.new(0, 26, 0, 26);
                        r314.Position = UDim2.new(1, -34, 0.5, -13);
                        r314.BackgroundColor3 = r[Z[3]];
                        r314.BackgroundTransparency = .88;
                        r314.Text = "\xc3\x97";
                        r314.TextColor3 = r[Z[11]];
                        r314.TextSize = 14;
                        r314.Font = Enum.Font.GothamBold;
                        r314.AutoButtonColor = false;
                        Instance.new("UICorner", r314).CornerRadius = UDim.new(0, 8);
                        r315 = Instance.new("UIStroke", r314);
                        r315.Color = r[Z[11]];
                        r315.Transparency = .7;
                        r315.Thickness = 1;
                        C = r314.MouseEnter;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[4],
                                172,
                                Z[1],
                                Z[2]
                            };
                            r[Z[1]](r[Z[2]], {
                                ["Transparency"] = .3
                            }, .15, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        C = r314.MouseLeave;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[4],
                                172,
                                Z[1],
                                Z[2]
                            };
                            r[Z[1]](r[Z[2]], {
                                ["Transparency"] = .7
                            }, .2, Enum.EasingStyle.Sine);
                            return; 
                        end);
                        C = r314.MouseButton1Click;
                        C.Connect(C, function(...)
                            local Z = {
                                Z[8],
                                Z[1],
                                Z[2],
                                Z[9],
                                171,
                                Z[7],
                                166,
                                Z[12],
                                Z[13],
                                169,
                                Z[14]
                            };
                            if r[Z[1]].capturing then
                                return;
                            end;
                            r[Z[4]](r[Z[5]]);
                            r[Z[6]][r[Z[7]].cfg] = nil;
                            r[Z[8]].binds[r[Z[7]].id] = "Unbound";
                            r[Z[9]]();
                            r[Z[10]].Text = "Unbound";
                            r[Z[11]]();
                            return; 
                        end);
                        r[Z[8]].buttons[r309.id] = r312;
                        return r310; 
                    end)(r319, J, L); 
                end;
                ls[9] = 19665107896202;
                C(a, "Enable Quick Toggles", r[Z[22]].quickTogglesEnabled, function(arg1_95, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11],
                        83,
                        Z[9],
                        82
                    };
                    v1 = arg1_95;
                    r[Z[1]].quickTogglesEnabled = v1;
                    r[Z[4]]();
                    if v1 then
                        r[Z[5]].Visible = true;
                        r[Z[6]](r[Z[5]], {
                            ["Size"] = UDim2.new(1, 0, 0, r[Z[7]])
                        }, .3, Enum.EasingStyle.Quint);
                    else
                        r[Z[6]](r[Z[5]], {
                            ["Size"] = UDim2.new(1, 0, 0, 0)
                        }, 0.25, Enum.EasingStyle.Quint);
                        task.delay(.28, function(...)
                            local Z = {
                                Z[1],
                                Z[2],
                                Z[3],
                                Z[5]
                            };
                            if not r[Z[1]].quickTogglesEnabled then
                                r[Z[4]].Visible = false;
                            end;
                            return; 
                        end);
                    end;
                    return; 
                end).frame.Parent = r290;
                v4(i, "Reset quick toggle binds to defaults", function(...)
                    local Z = {
                        6,
                        Z[1],
                        Z[2],
                        Z[16],
                        Z[18],
                        Z[13],
                        Z[15],
                        Z[11],
                        Z[19],
                        Z[21],
                        Z[3]
                    };
                    v1, D = B[2], B[1];
                    for g, R in ipairs(r[Z[1]]) do
                        r320 = R;
                        Q = {
                            pcall(function(...)
                                local Z = {
                                    Z[2],
                                    Z[3],
                                    C
                                };
                                return Enum.KeyCode[r[Z[3]].default]; 
                            end)
                        };
                        v4 = Q[2];
                        E = Q[1];
                        if E then
                            M = Q[2];
                        end;
                        if E then
                            Q = v4;
                            r[Z[4]][r320.cfg] = Q;
                            r[Z[5]].binds[r320.id] = r320.default;
                        end;
                        M = r[Z[6]].buttons[r320.id];
                        if M then
                            M.Text = r[Z[7]](r[Z[4]][r320.cfg]);
                        end; 
                    end;
                    r[Z[8]]();
                    r[Z[9]]();
                    r[Z[10]]("Quick Toggles Reset", "Quick toggle binds restored to default", r[Z[11]], "success", 2);
                    return; 
                end);
                i = i + 1;
                B("AUDIO", i);
                i = i + 1;
                L = C(i, "Sound effects", r[Z[22]].sfxEnabled, function(arg1_96, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].sfxEnabled = arg1_96;
                    r[Z[4]]();
                    return; 
                end);
                L.frame.Parent = r290;
                r321 = L.toggle;
                i = i + 1;
                ug = E(i, "SFX Volume", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2]
                    };
                    return r[Z[1]].sfxVolume; 
                end, function(arg1_97, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].sfxVolume = math.clamp(arg1_97, 0, 1);
                    r[Z[4]]();
                    return; 
                end, 0, 1);
                ug.frame.Parent = r290;
                r322 = ug.slider;
                i = i + 1;
                v4(i, "Reset audio to defaults", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        183,
                        184,
                        Z[11]
                    };
                    r[Z[1]].sfxEnabled = true;
                    r[Z[1]].sfxVolume = 1;
                    r[Z[4]].set(true);
                    r[Z[5]].setVal(1);
                    r[Z[6]]();
                    return; 
                end);
                i = i + 1;
                B("VISUALS", i);
                i = i + 1;
                kg = C(i, "Visual effects", r[Z[22]].vfxEnabled, function(arg1_98, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].vfxEnabled = arg1_98;
                    r[Z[4]]();
                    return; 
                end);
                ls[1] = 11709511936665;
                kg.frame.Parent = r290;
                Pg = kg.toggle;
                i = i + 1;
                B("FLIGHT", i);
                i = i + 1;
                r323 = C(i, "Crash landings", r[Z[22]].crashEnabled, function(arg1_99, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].crashEnabled = arg1_99;
                    r[Z[4]]();
                    return; 
                end);
                r323.frame.Parent = r290;
                Bg = r323.toggle;
                r[Z[13]].crashToggleHandle = Bg;
                i = i + 1;
                r324 = C(i, "Wall impacts", r[Z[22]].wallImpactEnabled, function(arg1_100, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].wallImpactEnabled = arg1_100;
                    r[Z[4]]();
                    return; 
                end);
                r324.frame.Parent = r290;
                bg = r324.toggle;
                r[Z[13]].wallToggleHandle = bg;
                i = i + 1;
                r[Z[13]].scrollToCrashSettings = function(...)
                    local Z = {
                        185,
                        Z[1],
                        Z[2],
                        186,
                        602,
                        Z[9]
                    };
                    g = r[Z[4]].frame;
                    E = math.clamp((r[Z[1]].frame.AbsolutePosition.Y - r[Z[5]].AbsolutePosition.Y + r[Z[5]].CanvasPosition.Y + g.AbsolutePosition.Y - r[Z[5]].AbsolutePosition.Y + r[Z[5]].CanvasPosition.Y + g.AbsoluteSize.Y) / 2 - r[Z[5]].AbsoluteSize.Y / 2, 0, math.max(0, r[Z[5]].AbsoluteCanvasSize.Y - r[Z[5]].AbsoluteSize.Y));
                    r[Z[6]](r[Z[5]], {
                        ["CanvasPosition"] = Vector2.new(0, E)
                    }, .4, Enum.EasingStyle.Quint);
                    return; 
                end;
                Rg = C(i, "Takeoff animation", r[Z[22]].takeoffsEnabled, function(arg1_101, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11],
                        Z[13]
                    };
                    v1 = arg1_101;
                    g = arg1_101;
                    r[Z[1]].takeoffsEnabled = g;
                    r[Z[4]]();
                    if r[Z[5]].takeoffTabSwitch then
                        r[Z[5]].takeoffTabSwitch(v1);
                    end;
                    return; 
                end);
                Rg.frame.Parent = r290;
                lg = Rg.toggle;
                r[Z[13]].takeoffToggleHandle = lg;
                i = i + 1;
                Ng = C(i, "Smooth landings", r[Z[22]].smoothLandingsEnabled, function(arg1_102, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].smoothLandingsEnabled = arg1_102;
                    r[Z[4]]();
                    return; 
                end);
                ls[3] = "\x90D-";
                Ng.frame.Parent = r290;
                lg = Ng.toggle;
                i = i + 1;
                Ug = C(i, "Boost wind-up delay", r[Z[22]].boostChargeDelayEnabled, function(arg1_103, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].boostChargeDelayEnabled = arg1_103;
                    r[Z[4]]();
                    return; 
                end);
                Ug.frame.Parent = r290;
                zg = Ug.toggle;
                i = i + 1;
                r325 = r[Z[23]](r290, i, "Boost Screen Shake", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2]
                    };
                    return r[Z[1]].boostShakeIntensity; 
                end, function(arg1_104, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].boostShakeIntensity = arg1_104;
                    r[Z[4]]();
                    return; 
                end, false, 0, 3);
                i = i + 1;
                v4(i, "Reset boost screen shake to defaults", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        187,
                        Z[11]
                    };
                    r[Z[1]].boostShakeIntensity = 1;
                    r[Z[4]].apply(1);
                    r[Z[5]]();
                    return; 
                end);
                ls[6], i = 25554761538807, i + 1;
                mg = C(i, "First person", r[Z[22]].fpWanted, function(arg1_105, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[24],
                        Z[21],
                        Z[25],
                        Z[26]
                    };
                    v1 = arg1_105;
                    r[Z[1]].fpWanted = v1;
                    if v1 then
                        if r[Z[1]].flying then
                            r[Z[24]]();
                        else
                            r[Z[5]]("First Person", "Only works while flying, it'll switch on as soon as you take off.", r[Z[6]], "info", 3);
                        end;
                    else
                        r[Z[7]]();
                    end;
                    return; 
                end);
                mg.frame.Parent = r290;
                r326 = mg.toggle;
                Eg = r[Z[27]].Heartbeat;
                r327 = Eg.Connect(Eg, function(...)
                    local Z = {
                        Z[28],
                        Z[1],
                        Z[2],
                        602,
                        189,
                        188,
                        Z[22]
                    };
                    if r[Z[1]].killed or not r[Z[4]].Parent then
                        C = r[Z[5]];
                        C.Disconnect(C);
                        return;
                    end;
                    if r[Z[6]] then
                        r[Z[6]].set(r[Z[7]].fpWanted);
                    end;
                    return; 
                end);
                i = i + 1;
                ig = E(i, "Drift", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2]
                    };
                    return r[Z[1]].driftAmount; 
                end, function(arg1_106, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].driftAmount = math.clamp(arg1_106, 0, 1);
                    r[Z[4]]();
                    return; 
                end, 0, 1);
                ig.frame.Parent = r290;
                r328 = ig.slider;
                i = i + 1;
                v4(i, "Reset drift to default", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        190,
                        Z[11]
                    };
                    r[Z[1]].driftAmount = 0;
                    r[Z[4]].setVal(0);
                    r[Z[5]]();
                    return; 
                end);
                i = i + 1;
                B("SPEED MULTIPLIERS", i);
                i = i + 1;
                r329 = r[Z[23]](r290, i, "Base Speed", function(...)
                    return r[Z[48]]; 
                end, function(arg1_107, ...)
                    r[Z[48]] = arg1_107;
                    return; 
                end, false, .1, 10);
                i = i + 1;
                ls[2] = 22733955682996;
                r330 = r[Z[23]](r290, i, "Boost 1", function(...)
                    return r[Z[49]]; 
                end, function(arg1_108, ...)
                    r[Z[49]] = arg1_108;
                    return; 
                end, false, .1, 10);
                i = i + 1;
                r331 = r[Z[23]](r290, i, "Boost 2", function(...)
                    return r[Z[50]]; 
                end, function(arg1_109, ...)
                    r[Z[50]] = arg1_109;
                    return; 
                end, false, .1, 10);
                i = i + 1;
                r332 = r[Z[23]](r290, i, "Boost 3", function(...)
                    return r[Z[51]]; 
                end, function(arg1_110, ...)
                    r[Z[51]] = arg1_110;
                    return; 
                end, false, .1, 10);
                i = i + 1;
                r333 = r[Z[23]](r290, i, "Boost 4", function(...)
                    return r[Z[52]]; 
                end, function(arg1_111, ...)
                    r[Z[52]] = arg1_111;
                    return; 
                end, false, .1, 10);
                i = i + 1;
                v4(i, "Reset speed settings to defaults", function(...)
                    local Z = {
                        Z[29],
                        Z[30],
                        Z[31],
                        Z[32],
                        Z[33],
                        191,
                        Z[1],
                        Z[2],
                        192,
                        193,
                        194,
                        195,
                        Z[11]
                    };
                    r[Z[1]] = 1;
                    r[Z[2]] = 1;
                    r[Z[3]] = 1;
                    r[Z[4]] = 1;
                    r[Z[5]] = 1;
                    r[Z[6]].apply(1);
                    r[Z[9]].apply(1);
                    r[Z[10]].apply(1);
                    r[Z[11]].apply(1);
                    r[Z[12]].apply(1);
                    r[Z[13]]();
                    return; 
                end);
                i = i + 1;
                B("HOVER", i);
                i = i + 1;
                ws = C(i, "Hover", r[Z[22]].hoverEnabled, function(arg1_112, ...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        Z[11]
                    };
                    r[Z[1]].hoverEnabled = arg1_112;
                    r[Z[4]]();
                    return; 
                end);
                ws.frame.Parent = r290;
                ls[4] = 5557857293368;
                r334 = ws.toggle;
                i = i + 1;
                r335 = r[Z[23]](r290, i, "Hover Height", function(...)
                    return r[Z[53]]; 
                end, function(arg1_113, ...)
                    r[Z[53]] = arg1_113;
                    return; 
                end, true, 0.5, 2);
                i = i + 1;
                ls[5] = 11502273440216;
                r336 = r[Z[23]](r290, i, "Hover Speed", function(...)
                    return r[Z[54]]; 
                end, function(arg1_114, ...)
                    r[Z[54]] = arg1_114;
                    return; 
                end, true, 1, 5);
                i = i + 1;
                v4(i, "Reset hover settings to defaults", function(...)
                    local Z = {
                        Z[22],
                        Z[1],
                        Z[2],
                        196,
                        Z[36],
                        Z[34],
                        Z[37],
                        Z[35],
                        197,
                        198,
                        Z[11]
                    };
                    r[Z[1]].hoverEnabled = true;
                    r[Z[4]].set(true);
                    r[Z[6]] = r[Z[5]];
                    r[Z[8]] = r[Z[7]];
                    r[Z[9]].apply(r[Z[5]]);
                    r[Z[10]].apply(r[Z[7]]);
                    r[Z[11]]();
                    return; 
                end);
                i = i + 1;
                B("GENERAL", i);
                i = i + 1;
                ls[1] = "\x19\"m";
                C(i, "Auto Execute on Teleport", r[Z[28]][r[Z[1]][r[Z[2]]("\xcf6\xc0\x0f\xb5\x8b\xaa\xae$\x81\x14\xb0\r]\x04", ls[1])]], function(arg1_115, ...)
                    local Z = {
                        Z[28],
                        Z[1],
                        Z[2]
                    };
                    v1 = arg1_115;
                    g = arg1_115;
                    r[Z[1]].autoExecEnabled = g;
                    r[Z[1]].saveAutoExecFlag(v1);
                    if v1 then
                        r[Z[1]].registerAutoExec();
                    end;
                    return; 
                end).frame.Parent = r290;
                i = i + 1;
                B("CREDITS", i);
                i = i + 1;
                ls[1] = ")\xdb[iH";
                ls[2] = 26282780712861;
                Fs = Instance[r[Z[1]][r[Z[2]](ls[1], ls[2])]](r[Z[1]][r[Z[2]](ls[1], ls[2])]);
                ls[1] = 15747978180938;
                ls[1] = r[Z[2]];
                ls[2] = ls[1](ls[3], ls[4]);
                ls[1], ls[2] = 0, 168;
                Fs[r[Z[1]][r[Z[2]]("\xde\x0e`\xe7", ls[1])]] = UDim2[r[Z[1]][ls[2]]](1, 0, ls[1], ls[2]);
                ls[1] = 21985534791675;
                ls[3], ls[1] = 27544465859636, 29064930683324;
                Fs[r[Z[1]][r[Z[2]]("\x9d\x949\xf1n\\\xb6\xa8\x1arpdQ\x94\xab\xe2", ls[1])]] = r[Z[6]];
                Fs[r[Z[1]][r[Z[2]]("Q\xc6F\\'\xfc\x13\x7f\xe4\xf0f\x9b\x84BPf\xcf\xd9\xb2\xed>\r", ls[1])]] = .9;
                ls[1] = 25648179928398;
                Rs = i;
                Fs[r[Z[1]][r[Z[2]]("\xb7\xea\x14\xa1h\xfc\x9f\"(Px", ls[1])]] = Rs;
                ls[1] = 2278549686346;
                Fs[r[Z[1]][r[Z[2]]("\xbc\x96\xd1=2\xeb", ls[1])]] = r290;
                ls[4], ls[2] = "bZ\x16", "\xa2\x9c\xa0";
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[2] = "y\xf7V.\x17\xe7\x1f\xe2";
                ls[3] = 26260231446408;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[2], ls[1] = 6586533353462, "W\x82\x17'\x14\x93\xefR\xf6c\x86-";
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[3] = ls[2](ls[4], ls[5]);
                ls[2], ls[1] = ")Uy", 13;
                Instance[r[Z[1]][ls[1]]](r[Z[1]][ls[1]], Fs)[r[Z[1]][r[Z[2]](ls[1], ls[2])]] = UDim[ls[1][ls[3]]](0, ls[1]);
                ls[3] = 22915423589213;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[4] = "\x87\xb0\xaa";
                ls[3], ls[2] = 19583501027134, "\xf3\xaed\x94O\x93\xa5F";
                ls[5] = 9777791443858;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                Rs = Instance[r[Z[1]][ls[1]]](r[Z[1]][ls[1]], Fs);
                ls[2], ls[1] = 13326616473723, "\x15\x9c\xc6\xe3\xcf";
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[3] = ls[2](ls[4], ls[5]);
                ls[2], ls[1] = 1, 1;
                ls[1] = "\xfd\xd1gr\x85\xa6\xf1b\xb8\x8b\x7f\x1a";
                Rs[r[Z[1]][r[Z[2]](ls[1], ls[2])]] = Color3[ls[1][ls[3]]](1, ls[1], ls[2]);
                ls[3], ls[4] = "\x193\x8d", 18465701675821;
                ls[2] = 1532276344211;
                Rs[r[Z[1]][r[Z[2]](ls[1], ls[2])]] = .86;
                ls[1], ls[2] = "\x9b}\xb4\xcb%A\x86*q", 6235409061551;
                Rs[r[Z[1]][r[Z[2]](ls[1], ls[2])]] = 1;
                ls[1] = r[Z[2]];
                ls[2] = ls[1](ls[3], ls[4]);
                ls[4] = 21627967852206;
                ls[8], ls[3] = "\xd6\xec<\xf5L\x19\xae\x01\xd4e\xf4&\xe05", ";|\x06\xd2\x1a\x81\"\xbas";
                ls[1] = r[Z[2]];
                ls[2] = ls[1](ls[3], ls[4]);
                ls[2] = "\xd1\x9c3\xf6";
                bs = Instance[r[Z[1]][ls[2]]](r[Z[1]][ls[2]], Fs);
                ls[5] = "\xdc\x85\x14";
                ls[3] = 10969681242088;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[1] = "UDim2";
                ls[2] = r[Z[1]];
                ls[3] = r[Z[2]];
                ls[4] = ls[3](ls[5], ls[6]);
                ls[1] = ls[2][ls[4]];
                ls[6], ls[3] = 1315373876425, 1;
                ls[2], ls[1], ls[4] = -28, 1, -16;
                ls[3] = 8736230088648;
                bs[r[Z[1]][ls[1]]] = Env[ls[1]][ls[1]](ls[1], ls[2], ls[3], ls[4]);
                ls[2] = "s$_y\xa0\xdf0\xd2";
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[1] = "UDim2";
                ls[5] = "\x9cH3";
                ls[2] = r[Z[1]];
                ls[3] = r[Z[2]];
                ls[4] = ls[3](ls[5], ls[6]);
                ls[3] = 0;
                ls[1] = ls[2][ls[4]];
                ls[2] = 14;
                ls[4], ls[1] = 8, 0;
                bs[r[Z[1]][ls[1]]] = Env[ls[1]][ls[1]](ls[1], ls[2], ls[3], ls[4]);
                ls[2], ls[3] = "\xff\xb9\xa2\xd5l\xd4\xdd\xeb\x05\xc7\xf6\x07j\x1e\xfa&x9\x00Ms\xa7", 5246462661398;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                bs[r[Z[1]][ls[1]]] = 1;
                ls[2], ls[5], ls[3] = "\x9f\x83\xce\xe0", 20070994692356, 8575163899698;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[4] = "@\x96\x1c\xfc\x8e}\x17=\x87(\xda>`\x14zd";
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[3] = ls[2](ls[4], ls[5]);
                ls[3] = r[Z[16]];
                ls[5] = r[Z[1]];
                ls[6] = r[Z[2]];
                ls[7] = ls[6](ls[8], ls[9]);
                ls[4] = ls[5][ls[7]];
                ls[2] = ls[3][ls[4]];
                ls[4] = r[Z[1]];
                ls[7], ls[8] = "\x0c%bx\xc9V\xfe\xa5\tJV2\x98\xb0\x01\x9a\xc5\x8b\x85\xb1\xbc\xa6\xc0\xe9\xf4\x94\xe9\xc0\x00j,Fp-\xcf\xa3g\xd8\xf2\rW\xbe\xbfS\xdbp\xe0\x85h`\\~\xbf7\xdb\x18\xdfo]\xf7\x8b \xcd\xe3\xacU\xd42\xac\x9f\xc4\xec#)\xbe@\xff\n\xfa\x1ds>\xea\xa3\xac\xf5h\x16\x1aFO\xe4\xf7t\x92\xf3)\x01e\"\x9b\xb7\xe4\xa8\x84\xd8\x93\xae\x12\xa5\n\xc3!\x9d\xb91\xe7T\xd9%\x98\xfb\xfb:\x9eC\x19\xb3\xda\xa9\x9e\xa3\xa61_\x07\x83\x9b\xdc\xa5)x\xad\xd6\xac9\xdfK\xaa \xac\xa0\xab\xf3lN\xe7ZcQ\xf9\xe3Yr6\xf7\xaa\xf5-S\xf4\xa7\xe2\xba\x19\xe45\xb1\xb4\xc5\xa5,ib#T\xa4\xfd\xfeJ\x94\x01.\x8acBa:I\xd40:h!.\x82\x0e+M}\x91n\xf7e\x12\xb5 \x0c\x9d/Y/\xb2?\x06`\xd9\xe2\x8f\xc4\xfc\xd3\xd1\xd4\x994\xe5K\xfaX\xbe\x00\xaa\x10\x1f\r2\x1f\xff]Y>\x9ew\x14\xec\xa5\xfbR\x91\xb6\x8f\x87\xcf\xf3\xf4\x98\xda{\x02\x18\x18a\xa8\x16\xde\x08\x1f@\xe6\xc1m\xadi\xd9ofQ\xcbt\xee\xd8M\xb9\xe3\x0b\x1b\xa0\x99M\xf4\xc91\x17\xa0\x0cT@1^\x8aM\x8c\x8e\xe1E`\xf7+\xcd\x95f#Z\x88iwT\xf1\x0f*\xf0\x8b\x05\x18\xae\xb2\x0f\x99", 27686204105912;
                ls[5] = r[Z[2]];
                ls[6] = ls[5](ls[7], ls[8]);
                ls[3] = ls[4][ls[6]];
                ls[1] = ls[2] .. ls[3];
                ls[2] = "B\xa4\x95\"\xb9\x9c\xce\xbb\xe1\x13";
                bs[r[Z[1]][ls[1]]] = ls[1][ls[3]] .. ls[1];
                ls[3] = 25534359821540;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[3] = 15592280864953;
                ls[6] = "\x85\x19\xa8\xfe";
                bs[r[Z[1]][ls[1]]] = r[Z[4]];
                ls[2] = "<9\x11\x10\xe5|\x1c\xb6";
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[8] = 20876325637106;
                ls[3] = 14183488598937;
                bs[r[Z[1]][ls[1]]] = 11;
                ls[2] = "3\xc0\xff4";
                ls[7] = 17151401573989;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[2] = "Enum";
                ls[1] = Env[ls[2]];
                ls[3] = r[Z[1]];
                ls[4] = r[Z[2]];
                ls[5] = ls[4](ls[6], ls[7]);
                ls[7] = 2091712907164;
                ls[2] = ls[3][ls[5]];
                ls[2] = r[Z[1]];
                ls[6] = 2244188899370;
                ls[3] = r[Z[2]];
                ls[5] = "\xa4\xcd=\xc7\x89R";
                ls[4] = ls[3](ls[5], ls[6]);
                ls[1] = ls[2][ls[4]];
                ls[2] = "?=\x0eR\xf1(\n&\xf9\xf7\xfc";
                bs[r[Z[1]][ls[1]]] = ls[1][ls[2]][ls[1]];
                ls[3] = 6335270098700;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[2], ls[3], ls[6] = "S\x86\x1c\xe5$.\xca\x87\xcf\xb2hM\x9d\x9e", 27978270795208, "\xf8\xb7oOO}\xe1%\xfe\x87\xfe\xf8/k";
                bs[r[Z[1]][ls[1]]] = true;
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[2] = "Enum";
                ls[1] = Env[ls[2]];
                ls[3] = r[Z[1]];
                ls[4] = r[Z[2]];
                ls[5] = ls[4](ls[6], ls[7]);
                ls[2] = ls[3][ls[5]];
                ls[5] = "%\xe3\xf7\xa2";
                ls[2] = r[Z[1]];
                ls[3] = r[Z[2]];
                ls[6], ls[7] = 15244377896821, 24326363404415;
                ls[4] = ls[3](ls[5], ls[6]);
                ls[3], ls[6] = 20063478270205, "\x16\x9b\xbeAg|,\xc7\xa6\x1fN$\xb7\xd9";
                ls[1] = ls[2][ls[4]];
                bs[r[Z[1]][ls[1]]] = ls[1][ls[2]][ls[1]];
                ls[2] = "\xa0R\xd3\x1d6q\xd5\x0f\x1d\x84<\xb7cE";
                ls[1] = r[Z[2]](ls[2], ls[3]);
                ls[2] = "Enum";
                ls[1] = Env[ls[2]];
                ls[3] = r[Z[1]];
                ls[4] = r[Z[2]];
                ls[5] = ls[4](ls[6], ls[7]);
                ls[2] = ls[3][ls[5]];
                ls[2] = r[Z[1]];
                ls[3] = r[Z[2]];
                ls[6], ls[7], ls[5] = 14159865557891, "\xbc=\xc3", "\xc7\x18\xc4";
                ls[4] = ls[3](ls[5], ls[6]);
                ls[1] = ls[2][ls[4]];
                bs[r[Z[1]][ls[1]]] = ls[1][ls[2]][ls[1]];
                ls[6], ls[1] = 3994441485960, "Instance";
                i = i + 1;
                ls[2] = r[Z[1]];
                ls[5] = "D\x08\x07";
                ls[3] = r[Z[2]];
                ls[4] = ls[3](ls[5], ls[6]);
                ls[1] = ls[2][ls[4]];
                ls[6] = 26173255704375;
                ls[5] = "\x1f,\x82\x89\x8f\xd3]b\x91";
                ls[2] = r[Z[1]];
                ls[3] = r[Z[2]];
                ls[4] = ls[3](ls[5], ls[6]);
                ls[1] = ls[2][ls[4]];
                Ns = Env[ls[1]][ls[1]](ls[1]);
                ls[1] = r[Z[1]];
                ls[5] = 6081859294752;
                ls[2] = r[Z[2]];
                ls[4] = "n\xe9m\xd5";
                ls[3] = ls[2](ls[4], ls[5]);
                ls[3] = "UDim2";
                ls[2] = Env[ls[3]];
                ls[4] = r[Z[1]];
                ls[5] = r[Z[2]];
                ls[6] = ls[5](ls[7], ls[8]);
                ls[3] = ls[4][ls[6]];
                ls[5] = 0;
                ls[1] = ls[2][ls[3]];
                ls[9], ls[6], ls[4], ls[3] = 8714754596788, 18, 0, 1;
                ls[2] = ls[1](ls[3], ls[4], ls[5], ls[6]);
                Ns[ls[1][ls[3]]] = ls[2];
                ls[4], ls[5] = "\xc3\x15,\x03\xfc\xf4}\xf7?P\x13\xd1#dl\xaa2\xc7\x14tO\xed", 24887947516554;
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[3] = ls[2](ls[4], ls[5]);
                ls[8] = "\xd7\x7fQ\xb1";
                ls[5], ls[1] = 8675024936847, 1;
                Ns[ls[1][ls[3]]] = ls[1];
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[4] = "6G\xfcg \x9b\xa6;\xa3N";
                ls[3] = ls[2](ls[4], ls[5]);
                ls[1] = r[Z[4]];
                ls[5], ls[4] = 16292381899589, ":\xf3\x08m\x14\x14\xacg";
                Ns[ls[1][ls[3]]] = ls[1];
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[3] = ls[2](ls[4], ls[5]);
                ls[1] = 10;
                Ns[ls[1][ls[3]]] = ls[1];
                ls[1] = r[Z[1]];
                ls[4] = "'U\xe6^";
                ls[2] = r[Z[2]];
                ls[5] = 13261116223550;
                ls[3] = ls[2](ls[4], ls[5]);
                ls[4] = "Enum";
                ls[3] = Env[ls[4]];
                ls[5] = r[Z[1]];
                ls[6] = r[Z[2]];
                ls[7] = ls[6](ls[8], ls[9]);
                ls[4] = ls[5][ls[7]];
                ls[8] = 13773306704411;
                ls[2] = ls[3][ls[4]];
                ls[7] = "\x10\x14\xbd\xea\xcd\x08";
                ls[4] = r[Z[1]];
                ls[5] = r[Z[2]];
                ls[6] = ls[5](ls[7], ls[8]);
                ls[3] = ls[4][ls[6]];
                ls[1] = ls[2][ls[3]];
                Ns[ls[1][ls[3]]] = ls[1];
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[5], ls[4] = 14494883230907, "\x8d\x92?\xef\xd9\xab}yu\x96\xcf";
                ls[3] = ls[2](ls[4], ls[5]);
                ls[1], ls[4], ls[5] = i, "w\x13.v\x8e\xc4", 11768569539280;
                Ns[ls[1][ls[3]]] = ls[1];
                ls[6] = 3409234332775;
                ls[1] = r[Z[1]];
                ls[2] = r[Z[2]];
                ls[3] = ls[2](ls[4], ls[5]);
                ls[5] = "\x95N\xa1\xa8\xd3\xc3";
                ls[1] = r290;
                Ns[ls[1][ls[3]]] = ls[1];
                ls[2] = r[Z[1]];
                ls[3] = r[Z[2]];
                ls[4] = ls[3](ls[5], ls[6]);
                ls[1] = ls[2][ls[4]];
                ls[2] = Ns;
                r[Z[13]][ls[1]] = ls[2];
                ls[1] = r[Z[19]]();
                return r290; 
            end;
            local function r337(...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    133,
                    135,
                    132,
                    Z[57],
                    Z[58],
                    Z[9],
                    137,
                    Z[18],
                    Z[8],
                    Z[6],
                    Z[21],
                    Z[22],
                    Z[7],
                    Z[13],
                    Z[19],
                    134,
                    144,
                    142,
                    138,
                    Z[10],
                    143,
                    Z[59]
                };
                if r[Z[1]].container and r[Z[1]].container.Parent then
                    return;
                end;
                r338 = Instance.new("CanvasGroup");
                r338.Name = "Panel";
                r338.Size = UDim2.new(0, r[Z[5]], 0, r[Z[6]]);
                r338.Position = UDim2.new(1, -(r[Z[5]] + 24), 0.5, -r[Z[6]] / 2);
                r338.BackgroundTransparency = 1;
                r338.GroupTransparency = 1;
                r338.Visible = false;
                v3 = r[Z[4]]();
                r338.Parent = v3;
                r[Z[1]].container = r338;
                v3 = Instance.new("ImageLabel");
                v3.BackgroundTransparency = 1;
                v3.Image = "rbxassetid://6014261993";
                v3.ImageColor3 = Color3.new(0, 0, 0);
                v3.ImageTransparency = .62;
                v3.ScaleType = Enum.ScaleType.Slice;
                v3.SliceCenter = Rect.new(49, 49, 450, 450);
                v3.Size = UDim2.new(1, 50, 1, 50);
                v3.Position = UDim2.new(0, -25, 0, -20);
                v3.ZIndex = 0;
                v3.Parent = r338;
                B = Instance.new("Frame");
                B.Size = UDim2.new(1, 0, 1, 0);
                B.BackgroundColor3 = r[Z[7]];
                B.BackgroundTransparency = r[Z[8]];
                B.BorderSizePixel = 0;
                B.ClipsDescendants = true;
                B.Parent = r338;
                r[Z[1]].card = B;
                Instance.new("UICorner", B).CornerRadius = UDim.new(0, 22);
                r339 = Instance.new("UIStroke");
                r339.Thickness = 2.2;
                r339.Transparency = .2;
                r339.Color = Color3.new(1, 1, 1);
                r339.Parent = B;
                r340 = Instance.new("UIGradient");
                r340.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(190, 140, 255)),
                    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 90, 230)),
                    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 140, 255))
                });
                r340.Parent = r339;
                task.spawn(function(...)
                    local Z = {
                        339,
                        Z[2],
                        Z[3],
                        340,
                        Z[9]
                    };
                    C = r[Z[1]].Parent;
                    while C do
                        r[Z[4]].Rotation = os.clock() * 24 % 360;
                        C = r[Z[5]].Heartbeat;
                        C.Wait(C); 
                    end;
                    return; 
                end);
                v4 = Instance.new("Frame");
                v4.Size = UDim2.new(1, -6, 1, -6);
                v4.Position = UDim2.new(0, 3, 0, 3);
                v4.BackgroundTransparency = 1;
                v4.Parent = B;
                Instance.new("UICorner", v4).CornerRadius = UDim.new(0, 19);
                M = Instance.new("UIStroke");
                M.Thickness = 1;
                M.Transparency = .78;
                M.Color = Color3.new(1, 1, 1);
                M.Parent = v4;
                r341 = Instance.new("UIGradient");
                r341.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(.4, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 190, 220))
                });
                r341.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, .45),
                    NumberSequenceKeypoint.new(.4, .82),
                    NumberSequenceKeypoint.new(1, .7)
                });
                r341.Rotation = 105;
                r341.Parent = B;
                task.spawn(function(...)
                    local Z = {
                        Z[2],
                        Z[3],
                        341,
                        Z[9]
                    };
                    C = r[Z[3]].Parent;
                    while C do
                        r[Z[3]].Rotation = 105 + math.sin((os.clock() - os.clock()) * .3) * 20;
                        C = r[Z[4]].Heartbeat;
                        C.Wait(C); 
                    end;
                    return; 
                end);
                i = Instance.new("Frame");
                i.Size = UDim2.new(1, 0, 0, r[Z[10]]);
                i.BackgroundTransparency = 1;
                i.Parent = B;
                r342 = Instance.new("Frame");
                r342.Size = UDim2.new(0, 32, 0, 32);
                r342.Position = UDim2.new(0, 14, 0.5, 0);
                r342.AnchorPoint = Vector2.new(0, 0.5);
                r342.BackgroundColor3 = r[Z[11]];
                r342.BackgroundTransparency = .55;
                r342.Parent = i;
                Instance.new("UICorner", r342).CornerRadius = UDim.new(0, 11);
                r343 = Instance.new("UIStroke");
                r343.Color = Color3.new(1, 1, 1);
                r343.Transparency = .3;
                r343.Thickness = 1;
                r343.Parent = r342;
                q = Instance.new("Frame");
                q.Size = UDim2.new(0, 14, 0, 14);
                q.Position = UDim2.new(0.5, 0, 0.5, 0);
                q.AnchorPoint = Vector2.new(0.5, 0.5);
                q.BackgroundColor3 = r[Z[12]];
                q.Rotation = 45;
                q.Parent = r342;
                Instance.new("UICorner", q).CornerRadius = UDim.new(0, 4);
                task.spawn(function(...)
                    local Z = {
                        Z[2],
                        Z[3],
                        342,
                        343,
                        Z[9]
                    };
                    C = r[Z[3]].Parent;
                    while C do
                        r[Z[4]].Transparency = .2 + 0.25 * (0.5 + 0.5 * math.sin((os.clock() - os.clock()) * 1.8));
                        C = r[Z[5]].Heartbeat;
                        C.Wait(C); 
                    end;
                    return; 
                end);
                o = Instance.new("TextLabel");
                o.Size = UDim2.new(1, -170, 0, 16);
                o.Position = UDim2.new(0, 58, 0, 10);
                o.BackgroundTransparency = 1;
                o.Text = "I N V I N C I B L E   F L Y";
                o.TextColor3 = Color3.fromRGB(255, 255, 255);
                o.TextSize = 13;
                o.Font = Enum.Font.GothamBold;
                o.TextXAlignment = Enum.TextXAlignment.Left;
                o.Parent = i;
                O = Instance.new("UIGradient");
                O.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 50, 190)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(170, 100, 230)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 40, 160))
                });
                O.Parent = o;
                S = Instance.new("TextLabel");
                S.Size = UDim2.new(1, -170, 0, 12);
                S.Position = UDim2.new(0, 58, 0, 27);
                S.BackgroundTransparency = 1;
                S.Text = "v" .. r[Z[13]].SCRIPT_VERSION;
                S.TextColor3 = r[Z[14]];
                S.TextSize = 11;
                S.Font = Enum.Font.Gotham;
                S.TextXAlignment = Enum.TextXAlignment.Left;
                S.Parent = i;
                r344 = Instance.new("TextButton");
                r344.Size = UDim2.new(0, 28, 0, 28);
                r344.Position = UDim2.new(1, -76, 0.5, 0);
                r344.AnchorPoint = Vector2.new(0, 0.5);
                r344.BackgroundColor3 = r[Z[11]];
                r344.BackgroundTransparency = 0.75;
                r344.Text = "";
                r344.AutoButtonColor = false;
                r344.Parent = i;
                Instance.new("UICorner", r344).CornerRadius = UDim.new(0, 9);
                Y = Instance.new("Frame");
                Y.Size = UDim2.new(0, 10, 0, 2);
                Y.Position = UDim2.new(0.5, 0, 0.5, 0);
                Y.AnchorPoint = Vector2.new(0.5, 0.5);
                Y.BackgroundColor3 = r[Z[15]];
                Y.Parent = r344;
                Instance.new("UICorner", Y).CornerRadius = UDim.new(1, 0);
                X = Instance.new("TextButton");
                X.Size = UDim2.new(0, 28, 0, 28);
                X.Position = UDim2.new(1, -42, 0.5, 0);
                X.AnchorPoint = Vector2.new(0, 0.5);
                X.BackgroundColor3 = r[Z[11]];
                X.BackgroundTransparency = 0.75;
                X.Text = "";
                X.AutoButtonColor = false;
                X.Parent = i;
                Instance.new("UICorner", X).CornerRadius = UDim.new(0, 9);
                r345 = Instance.new("Frame");
                r345.Size = UDim2.new(0, 12, 0, 2);
                r345.Position = UDim2.new(0.5, 0, 0.5, 0);
                r345.AnchorPoint = Vector2.new(0.5, 0.5);
                r345.Rotation = 45;
                r345.BackgroundColor3 = r[Z[15]];
                r345.Parent = X;
                Instance.new("UICorner", r345).CornerRadius = UDim.new(1, 0);
                r346 = Instance.new("Frame");
                r346.Size = UDim2.new(0, 12, 0, 2);
                r346.Position = UDim2.new(0.5, 0, 0.5, 0);
                r346.AnchorPoint = Vector2.new(0.5, 0.5);
                r346.Rotation = -45;
                r346.BackgroundColor3 = r[Z[15]];
                r346.Parent = X;
                Instance.new("UICorner", r346).CornerRadius = UDim.new(1, 0);
                C = ipairs;
                L = r344;
                D, h = L[1], L[2];
                for p, I in C({
                    L,
                    X
                }) do
                    L = p;
                    r347 = I;
                    r348 = r347 == X;
                    C = r347.MouseEnter;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[16],
                            177,
                            Z[2],
                            Z[3],
                            178,
                            345,
                            Z[17],
                            346
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = 0.5
                        }, .15, Enum.EasingStyle.Sine);
                        if r[Z[5]] then
                            r[Z[1]](r[Z[6]], {
                                ["BackgroundColor3"] = r[Z[7]]
                            }, .15, Enum.EasingStyle.Sine);
                            r[Z[1]](r[Z[8]], {
                                ["BackgroundColor3"] = r[Z[7]]
                            }, .15, Enum.EasingStyle.Sine);
                        end;
                        return; 
                    end);
                    C = r347.MouseLeave;
                    C.Connect(C, function(...)
                        local Z = {
                            Z[16],
                            177,
                            Z[2],
                            Z[3],
                            178,
                            345,
                            Z[15],
                            346
                        };
                        r[Z[1]](r[Z[2]], {
                            ["BackgroundTransparency"] = 0.75
                        }, .2, Enum.EasingStyle.Sine);
                        if r[Z[5]] then
                            r[Z[1]](r[Z[6]], {
                                ["BackgroundColor3"] = r[Z[7]]
                            }, .2, Enum.EasingStyle.Sine);
                            r[Z[1]](r[Z[8]], {
                                ["BackgroundColor3"] = r[Z[7]]
                            }, .2, Enum.EasingStyle.Sine);
                        end;
                        return; 
                    end); 
                end;
                r349 = Instance.new("Frame");
                r349.Size = UDim2.new(1, -28, 0, 36);
                r349.Position = UDim2.new(0, 14, 0, r[Z[10]] + 6);
                r349.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                r349.BackgroundTransparency = .8;
                r349.Parent = B;
                Instance.new("UICorner", r349).CornerRadius = UDim.new(0, 12);
                h = Instance.new("UIStroke");
                h.Color = Color3.new(1, 1, 1);
                h.Transparency = .7;
                h.Thickness = 1;
                h.Parent = r349;
                r350 = Instance.new("Frame");
                r350.Size = UDim2.new(0.25, -4, 1, -4);
                r350.Position = UDim2.new(0, 2, 0, 2);
                r350.BackgroundColor3 = Color3.new(1, 1, 1);
                r350.BackgroundTransparency = .1;
                r350.BorderSizePixel = 0;
                r350.Parent = r349;
                Instance.new("UICorner", r350).CornerRadius = UDim.new(0, 10);
                J = Instance.new("UIStroke");
                J.Color = r[Z[12]];
                J.Transparency = 0.5;
                J.Thickness = 1;
                J.Parent = r350;
                local function I(arg1_116, arg2_116, arg3_116, ...)
                    local Z = {
                        Z[2],
                        Z[3],
                        Z[18],
                        Z[15],
                        367
                    };
                    v3 = arg3_116;
                    B = Instance.new("TextButton");
                    B.Size = UDim2.new(0.25, 0, 1, 0);
                    D = arg2_116;
                    B.Position = D;
                    B.BackgroundTransparency = 1;
                    D = arg1_116;
                    B.Text = D;
                    B.Font = Enum.Font.GothamBold;
                    B.TextSize = 10;
                    C = "TextColor3";
                    R = C;
                    if v3 then
                        E = r[Z[3]];
                    end;
                    C = C;
                    C = r[Z[2]];
                    B[C] = v3 or r[Z[4]];
                    B.AutoButtonColor = false;
                    B.Parent = r[Z[5]];
                    return B; 
                end;
                f = I("IDLES", UDim2.new(0, 0, 0, 0), true);
                ug = I("TAKEOFFS", UDim2.new(0.25, 0, 0, 0), false);
                wg = I("BOOSTS", UDim2.new(0.5, 0, 0, 0), false);
                Cg = I("SETTINGS", UDim2.new(0.75, 0, 0, 0), false);
                r351 = Instance.new("Frame");
                r351.Size = UDim2.new(1, -28, 0, 2);
                r351.Position = UDim2.new(0, 14, 0, r[Z[10]] + 46);
                r351.BackgroundColor3 = Color3.new(1, 1, 1);
                r351.BackgroundTransparency = .4;
                r351.BorderSizePixel = 0;
                r351.Parent = B;
                Instance.new("UICorner", r351).CornerRadius = UDim.new(1, 0);
                xg = Instance.new("Frame");
                xg.Size = UDim2.new(1, -28, 1, -(r[Z[10]] + 58));
                xg.Position = UDim2.new(0, 14, 0, r[Z[10]] + 54);
                xg.BackgroundTransparency = 1;
                xg.Parent = B;
                Zg = r[Z[19]](xg);
                r352 = {
                    ["idles"] = UDim2.new(0, 2, 0, 2),
                    ["takeoffs"] = UDim2.new(0.25, 2, 0, 2),
                    ["boosts"] = UDim2.new(0.5, 2, 0, 2),
                    ["settings"] = UDim2.new(0.75, 2, 0, 2)
                };
                r353 = {
                    ["idles"] = f,
                    ["takeoffs"] = ug,
                    ["boosts"] = wg,
                    ["settings"] = Cg
                };
                r354 = {
                    ["idles"] = Zg,
                    ["takeoffs"] = r[Z[20]](xg),
                    ["boosts"] = r[Z[21]](xg, B),
                    ["settings"] = r[Z[22]](xg)
                };
                r355 = "idles";
                local function r356(arg1_117, ...)
                    local Z = {
                        374,
                        Z[1],
                        Z[2],
                        Z[3],
                        Z[16],
                        368,
                        370,
                        371,
                        Z[18],
                        Z[15],
                        372
                    };
                    v1 = arg1_117;
                    if r[Z[1]] == v1 then
                        return;
                    end;
                    if r[Z[2]].closeBoostDropdown then
                        pcall(r[Z[2]].closeBoostDropdown);
                    end;
                    r[Z[1]] = v1;
                    r[Z[5]](r[Z[6]], {
                        ["Position"] = r[Z[7]][v1]
                    }, .3, Enum.EasingStyle.Quint);
                    for B, E in pairs(r[Z[8]]) do
                        C = C;
                        C = C;
                        r[Z[5]](E, {
                            ["TextColor3"] = B == v1 and r[Z[9]] or r[Z[10]]
                        }, .2, Enum.EasingStyle.Sine); 
                    end;
                    for B, E in pairs(r[Z[11]]) do
                        E.Visible = B == v1; 
                    end;
                    return; 
                end;
                r[Z[1]].switchTab = r356;
                C = f.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        373,
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]]("idles");
                    return; 
                end);
                C = ug.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        373,
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]]("takeoffs");
                    return; 
                end);
                C = wg.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        373,
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]]("boosts");
                    return; 
                end);
                C = Cg.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        373,
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]]("settings");
                    return; 
                end);
                Zg.Visible = true;
                r357 = false;
                C = i.InputBegan;
                C.Connect(C, function(arg1_118, ...)
                    local Z = {
                        Z[2],
                        Z[3],
                        376,
                        375,
                        338,
                        377
                    };
                    r360 = arg1_118;
                    v3 = r360.UserInputType;
                    if v3 == Enum.UserInputType.MouseButton1 or r360.UserInputType == Enum.UserInputType.Touch then
                        r[Z[3]] = true;
                        r[Z[4]] = r360.Position;
                        r[Z[6]] = r[Z[5]].Position;
                        v3 = r360.Changed;
                        v3.Connect(v3, function(...)
                            local Z = {
                                327,
                                Z[1],
                                Z[2],
                                Z[3]
                            };
                            if r[Z[1]].UserInputState == Enum.UserInputState.End then
                                r[Z[4]] = false;
                            end;
                            return; 
                        end);
                    end;
                    return; 
                end);
                C = r[Z[23]].InputChanged;
                C.Connect(C, function(arg1_119, ...)
                    local Z = {
                        376,
                        Z[2],
                        Z[3],
                        375,
                        338,
                        377
                    };
                    v1 = arg1_119;
                    if not r[Z[1]] then
                        return;
                    end;
                    if v1.UserInputType ~= Enum.UserInputType.MouseMovement and v1.UserInputType ~= Enum.UserInputType.Touch then
                        return;
                    end;
                    g, v1 = v1.Position - r[Z[4]], nil;
                    r[Z[5]].Position = UDim2.new(r[Z[6]].X.Scale, r[Z[6]].X.Offset + g.X, r[Z[6]].Y.Scale, r[Z[6]].Y.Offset + g.Y);
                    return; 
                end);
                C = r344.MouseButton1Click;
                C.Connect(C, function(...)
                    local Z = {
                        Z[24],
                        344,
                        Z[1],
                        Z[2],
                        Z[3],
                        Z[16],
                        338,
                        Z[5],
                        Z[10],
                        367,
                        369,
                        Z[6]
                    };
                    r[Z[1]](r[Z[2]]);
                    r[Z[3]].minimized = not r[Z[3]].minimized;
                    if r[Z[3]].minimized then
                        r[Z[6]](r[Z[7]], {
                            ["Size"] = UDim2.new(0, r[Z[8]], 0, r[Z[9]] + 4)
                        }, .4, Enum.EasingStyle.Quint);
                        r[Z[10]].Visible = false;
                        r[Z[11]].Visible = false;
                    else
                        r[Z[6]](r[Z[7]], {
                            ["Size"] = UDim2.new(0, r[Z[8]], 0, r[Z[12]])
                        }, 0.5, Enum.EasingStyle.Back);
                        r[Z[10]].Visible = true;
                        r[Z[11]].Visible = true;
                    end;
                    return; 
                end);
                C = X.MouseButton1Click;
                C.Connect(C, function(...)
                    r[Z[59]]();
                    return; 
                end);
                return; 
            end;
            r[Z[60]] = function(...)
                local Z = {
                    148,
                    Z[3],
                    Z[1],
                    Z[2],
                    Z[29],
                    Z[7],
                    Z[10],
                    Z[12],
                    Z[46],
                    139,
                    Z[9]
                };
                r[Z[1]]();
                v1 = r[Z[2]].container;
                r[Z[2]].open = true;
                r[Z[5]].guiOpen = true;
                r[Z[5]].guiOpenedOnce = true;
                v1.Visible = true;
                g = v1.Position;
                v1.Position = g + UDim2.new(0, 0, 0, 26);
                v1.GroupTransparency = 1;
                r[Z[6]](v1, {
                    ["Position"] = g
                }, .45, Enum.EasingStyle.Back);
                r[Z[6]](v1, {
                    ["GroupTransparency"] = 0
                }, .3, Enum.EasingStyle.Sine);
                C = r[Z[7]].MouseBehavior ~= Enum.MouseBehavior.Default;
                if C then
                    if not r[Z[5]].mouseAnchorNoticeShown then
                        r[Z[5]].mouseAnchorNoticeShown = true;
                        r[Z[8]]("Mouse Anchoring Detected", "Your mouse will be automatically unanchored while this menu is open.", r[Z[9]], "info", 4);
                    end;
                    r[Z[7]].MouseBehavior = Enum.MouseBehavior.Default;
                    C = r[Z[10]];
                    if C then
                        C = r[X];
                        C.Disconnect(C);
                    end;
                    C = r[Z[11]].Heartbeat;
                    r[Z[10]] = C.Connect(C, function(...)
                        local Z = {
                            Z[5],
                            Z[3],
                            Z[4],
                            Z[10],
                            Z[7]
                        };
                        if not r[Z[1]].guiOpen then
                            if r[Z[4]] then
                                C = r[Z[4]];
                                C.Disconnect(C);
                                r[Z[4]] = nil;
                            end;
                            return;
                        end;
                        if r[Z[5]].MouseBehavior ~= Enum.MouseBehavior.Default then
                            r[Z[5]].MouseBehavior = Enum.MouseBehavior.Default;
                        end;
                        return; 
                    end);
                end;
                return; 
            end;
            local function r362(...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    Z[29],
                    139,
                    Z[7]
                };
                r363 = r[Z[1]].container;
                if not r363 then
                    return;
                end;
                r[Z[1]].open = false;
                r[Z[4]].guiOpen = false;
                if r[Z[5]] then
                    C = r[Z[5]];
                    C.Disconnect(C);
                    r[Z[5]] = nil;
                end;
                r364 = r363.Position;
                r[Z[6]](r363, {
                    ["Position"] = r364 + UDim2.new(0, 0, 0, 26)
                }, .3, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                r[Z[6]](r363, {
                    ["GroupTransparency"] = 1
                }, 0.25, Enum.EasingStyle.Sine);
                task.delay(.32, function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        Z[3],
                        267,
                        19
                    };
                    if not r[Z[1]].open and r[Z[4]].Parent then
                        r[Z[4]].Visible = false;
                        r[Z[4]].Position = r[Z[5]];
                    end;
                    return; 
                end);
                return; 
            end;
            r[Z[59]] = function(...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    129,
                    Z[60]
                };
                if r[Z[1]].open then
                    r[Z[4]]();
                else
                    r[Z[5]]();
                end;
                return; 
            end;
            return; 
        end;
        ls[84] = nil;
        ls[86] = ls[81]();
        ls[87] = r33;
        ls[89] = function(arg1_120, ...)
            local Z = {
                47,
                45,
                40,
                49
            };
            v1 = arg1_120;
            if v1 == 1 then
                return r[Z[1]];
            end;
            if v1 == 2 then
                return r[Z[2]];
            end;
            if v1 == 3 then
                return r[Z[3]];
            end;
            if v1 == 4 then
                return r[Z[4]];
            end;
            return 1; 
        end;
        ls[86] = function(...)
            local Z = {
                572,
                61,
                60,
                ls[70],
                ls[82],
                ls[85],
                ls[83]
            };
            if r[Z[1]].crashHintShown then
                return;
            end;
            if r[Z[1]].hasSeenCrashHint() then
                return;
            end;
            r[Z[1]].crashHintShown = true;
            r[Z[1]].markCrashHintSeen();
            task.delay(1.8, function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[5],
                    Z[6],
                    Z[7]
                };
                if r[Z[1]].killed then
                    return;
                end;
                pcall(function(...)
                    local Z = {
                        Z[4],
                        Z[2],
                        Z[3],
                        Z[5],
                        Z[1],
                        Z[6],
                        Z[7]
                    };
                    r[Z[1]]("Invincible Fly", "Crash landings and wall impacts can be turned off in Settings if you'd rather fly without them.", r[Z[4]], "info", 8, "flying", function(...)
                        local Z = {
                            Z[5],
                            Z[2],
                            Z[3],
                            Z[6],
                            Z[7]
                        };
                        if r[Z[1]].killed then
                            return;
                        end;
                        if not r[Z[4]].open then
                            r[Z[5]]();
                        end;
                        if r[Z[4]].switchTab then
                            r[Z[4]].switchTab("settings");
                        end;
                        task.wait();
                        if r[Z[4]].scrollToCrashSettings then
                            r[Z[4]].scrollToCrashSettings();
                        end;
                        return; 
                    end);
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        ls[87][ls[88]] = ls[86];
        ls[88] = function(arg1_121, ...)
            local Z = {
                53,
                61,
                60,
                39,
                ls[2]
            };
            v1 = arg1_121;
            if v1 == r[Z[1]].lastTiltDir then
                return;
            end;
            r[Z[1]].lastTiltDir = v1;
            if v1 == 0 then
                if r[Z[4]].flying and not r[Z[1]].active then
                    r[Z[5]]();
                end;
            end;
            return; 
        end;
        ls[87] = function(...)
            local Z = {
                53,
                61,
                60,
                39,
                ls[2]
            };
            r[Z[1]].lastTiltDir = 0;
            if r[Z[4]].flying and not r[Z[1]].active then
                r[Z[5]]();
            end;
            return; 
        end;
        ls[86] = 530;
        r[ls[86]] = ls[87];
        ls[87] = 531;
        r[ls[87]] = ls[88];
        ls[88] = 532;
        r[ls[88]] = ls[89];
        ls[90] = function(...)
            local Z = {
                39,
                61,
                60,
                38,
                44,
                ls[88]
            };
            if r[Z[1]].boostLevel == 0 then
                return r[Z[4]].BASE_SPEED * r[Z[5]] * r[Z[1]].speedScale;
            end;
            return (r[Z[4]].BOOST_SPEEDS[r[Z[1]].boostLevel] or r[Z[4]].BASE_SPEED) * r[Z[6]](r[Z[1]].boostLevel) * r[Z[1]].speedScale; 
        end;
        ls[89] = 533;
        r[ls[89]] = ls[90];
        ls[90] = 10;
        r[ls[91]] = ls[90];
        ls[90] = -1;
        r[ls[92]] = ls[90];
        ls[94] = r16;
        ls[95] = r15;
        ls[96] = ls[95](ls[97], ls[98]);
        ls[93] = ls[94][ls[96]];
        ls[71] = nil;
        ls[96] = r16;
        ls[97] = r15;
        ls[98] = ls[97](ls[99], ls[100]);
        ls[81] = nil;
        ls[100] = "\x8f\xc7.\xd6\x94[5\xc4\xda\xc6IZ\xf0\xf7v\xde@\x96\xa1A\xf6\x1e";
        ls[95] = ls[96][ls[98]];
        ls[97] = r16;
        ls[98] = r15;
        ls[99] = ls[98](ls[100], ls[101]);
        ls[96] = ls[97][ls[99]];
        ls[98] = r16;
        ls[99] = r15;
        ls[101] = "\x84\x92%M\xeb\xa7\xc8\xb9\x16";
        ls[100] = ls[99](ls[101], ls[102]);
        ls[97] = ls[98][ls[100]];
        ls[99] = r16;
        ls[100] = r15;
        ls[102] = "a\xf0\x1a\xe83\xed4\xean>\x93\x17-k[9\x0b\xc3\r\xdeGA\xa0";
        ls[101] = ls[100](ls[102], ls[103]);
        ls[98] = ls[99][ls[101]];
        ls[100] = r16;
        ls[103] = "\x12K\xdb\xb720";
        ls[101] = r15;
        ls[102] = ls[101](ls[103], ls[104]);
        ls[99] = ls[100][ls[102]];
        ls[102] = "Vector3";
        ls[101] = Env[ls[102]];
        ls[103] = r16;
        ls[104] = r15;
        ls[105] = ls[104](ls[106], ls[107]);
        ls[102] = ls[103][ls[105]];
        ls[104] = 0;
        ls[100] = ls[101][ls[102]];
        ls[106], ls[103], ls[102] = 15960585550352, 0, 0;
        ls[101] = ls[100](ls[102], ls[103], ls[104]);
        ls[102] = r16;
        ls[105] = "@\x9b\xbf*\x03\x0f\xf4\x1e\xa1\xb7n\xbc";
        ls[103] = r15;
        ls[104] = ls[103](ls[105], ls[106]);
        ls[100] = ls[102][ls[104]];
        ls[104] = "Vector3";
        ls[103] = Env[ls[104]];
        ls[105] = r16;
        ls[110] = "\xea\nI}\xfb\xc6&";
        ls[106] = r15;
        ls[107] = ls[106](ls[108], ls[109]);
        ls[44] = nil;
        ls[104] = ls[105][ls[107]];
        ls[102] = ls[103][ls[104]];
        ls[104], ls[108], ls[107], ls[106], ls[105] = 25, 7229724334669, "A\xa2\xdf.\x83", 25, 8;
        ls[103] = ls[102](ls[104], ls[105], ls[106]);
        ls[104] = r16;
        ls[105] = r15;
        ls[106] = ls[105](ls[107], ls[108]);
        ls[102] = ls[104][ls[106]];
        ls[106] = "Color3";
        ls[105] = Env[ls[106]];
        ls[107] = r16;
        ls[108] = r15;
        ls[109] = ls[108](ls[110], ls[111]);
        ls[111] = "\xc8\xca\xe4M\xfe\xffh'\x93V";
        ls[106] = ls[107][ls[109]];
        ls[107], ls[109] = 120, "\n!\xd1m\xa5";
        ls[104] = ls[105][ls[106]];
        ls[106], ls[108] = 190, 255;
        ls[105] = ls[104](ls[106], ls[107], ls[108]);
        ls[106] = r16;
        ls[110] = 5150896722621;
        ls[107] = r15;
        ls[108] = ls[107](ls[109], ls[110]);
        ls[104] = ls[106][ls[108]];
        ls[108] = r16;
        ls[109] = r15;
        ls[106] = .2;
        ls[110] = ls[109](ls[111], ls[112]);
        ls[107] = ls[108][ls[110]];
        ls[108] = 2.5;
        ls[110] = r16;
        ls[111] = r15;
        ls[19] = nil;
        ls[112] = ls[111](ls[113], ls[114]);
        ls[109] = ls[110][ls[112]];
        ls[110] = 2;
        ls[112] = r16;
        ls[113] = r15;
        ls[114] = ls[113](ls[115], ls[116]);
        ls[111] = ls[112][ls[114]];
        ls[114] = r16;
        ls[30] = nil;
        ls[112] = .3;
        ls[115] = r15;
        ls[116] = ls[115](ls[117], ls[118]);
        ls[113] = ls[114][ls[116]];
        ls[114] = .7;
        ls[94] = {
            [ls[95]] = ls[96],
            [ls[97]] = ls[98],
            [ls[99]] = ls[101],
            [ls[100]] = ls[103],
            [ls[102]] = ls[105],
            [ls[104]] = ls[106],
            [ls[107]] = ls[108],
            [ls[109]] = ls[110],
            [ls[111]] = ls[112],
            [ls[113]] = ls[114]
        };
        ls[99], ls[109], ls[101], ls[110], ls[102], ls[111] = "@)\xd9\x9a", 5515980084241, "L\xac\xf2[\xf1\xcf", "n\xd2\x1c", 33300971452709, 7197511096879;
        ls[96] = r16;
        ls[122], ls[103], ls[100], ls[106] = 8549393309466, 14813794285028, 33754104330955, 33895842577231;
        ls[97] = r15;
        ls[98] = ls[97](ls[99], ls[100]);
        ls[95] = ls[96][ls[98]];
        ls[115] = "\x93F\x99\x0b\x02N\xc9]\r\x9a\x9b\xcb\xd1*";
        ls[98] = r16;
        ls[99] = r15;
        ls[100] = ls[99](ls[101], ls[102]);
        ls[97] = ls[98][ls[100]];
        ls[99] = r16;
        ls[102] = "\xd2@\xd0\x11\xf7\x86\xbcRp\"\xcb9\x08\xea\x0f\xf1\xabVS\xbcL\xb9\xa4";
        ls[100] = r15;
        ls[105] = 13690626060750;
        ls[101] = ls[100](ls[102], ls[103]);
        ls[42] = nil;
        ls[98] = ls[99][ls[101]];
        ls[100] = r16;
        ls[104] = 19504041707252;
        ls[101] = r15;
        ls[103] = ".\xfcz\x11 $00\xdc";
        ls[102] = ls[101](ls[103], ls[104]);
        ls[99] = ls[100][ls[102]];
        ls[101] = r16;
        ls[117] = "\x83&\xa2W\x85\x8d\xda\xcd\t";
        ls[102] = r15;
        ls[108], ls[104] = "LX\x0b", "\xc7O\xe5\xa9\xb4\x12C\x98K2\x81\x91,\x83\x98\xc6\xd2\x1a\xf1\r\xb4\xd8W";
        ls[103] = ls[102](ls[104], ls[105]);
        ls[100] = ls[101][ls[103]];
        ls[112] = "\xa9\x93\xa8\xc2\x1bxg";
        ls[102] = r16;
        ls[103] = r15;
        ls[105] = "x\x8e.\xd9x\x8b";
        ls[104] = ls[103](ls[105], ls[106]);
        ls[101] = ls[102][ls[104]];
        ls[104] = "Vector3";
        ls[103] = Env[ls[104]];
        ls[105] = r16;
        ls[106] = r15;
        ls[107] = ls[106](ls[108], ls[109]);
        ls[104] = ls[105][ls[107]];
        ls[102] = ls[103][ls[104]];
        ls[106] = 0;
        ls[105], ls[104] = 8, 0;
        ls[62] = nil;
        ls[108], ls[107] = 30695994290091, "4\xae\xe3\xd4\xb8R\xce\xa5\xa8\xd1\xf2I";
        ls[103] = ls[102](ls[104], ls[105], ls[106]);
        ls[104] = r16;
        ls[105] = r15;
        ls[106] = ls[105](ls[107], ls[108]);
        ls[102] = ls[104][ls[106]];
        ls[106] = "Vector3";
        ls[105] = Env[ls[106]];
        ls[107] = r16;
        ls[108] = r15;
        ls[114], ls[113] = 23333121905890, 24094428092327;
        ls[109] = ls[108](ls[110], ls[111]);
        ls[106] = ls[107][ls[109]];
        ls[108] = 24;
        ls[40] = nil;
        ls[104] = ls[105][ls[106]];
        ls[106], ls[107], ls[109] = 24, 26, "h=-\x9c\x12";
        ls[105] = ls[104](ls[106], ls[107], ls[108]);
        ls[116], ls[110], ls[118] = 25560130411772, 6005621298649, 4041687568052;
        ls[106] = r16;
        ls[107] = r15;
        ls[108] = ls[107](ls[109], ls[110]);
        ls[104] = ls[106][ls[108]];
        ls[108] = "Color3";
        ls[107] = Env[ls[108]];
        ls[109] = r16;
        ls[110] = r15;
        ls[111] = ls[110](ls[112], ls[113]);
        ls[112] = 17743051374732;
        ls[108] = ls[109][ls[111]];
        ls[106] = ls[107][ls[108]];
        ls[113], ls[109], ls[108], ls[110] = "W\xea\x02\x9e7wD\xd7>z", 90, 160, 230;
        ls[107] = ls[106](ls[108], ls[109], ls[110]);
        ls[108] = r16;
        ls[109] = r15;
        ls[111] = "\xff\xb8\xcc\x9b\x86";
        ls[110] = ls[109](ls[111], ls[112]);
        ls[106] = ls[108][ls[110]];
        ls[110] = r16;
        ls[111] = r15;
        ls[112] = ls[111](ls[113], ls[114]);
        ls[108] = .3;
        ls[88] = nil;
        ls[109] = ls[110][ls[112]];
        ls[112] = r16;
        ls[110] = 2;
        ls[113] = r15;
        ls[114] = ls[113](ls[115], ls[116]);
        ls[111] = ls[112][ls[114]];
        ls[112] = 1;
        ls[114] = r16;
        ls[115] = r15;
        ls[116] = ls[115](ls[117], ls[118]);
        ls[113] = ls[114][ls[116]];
        ls[114] = 0.5;
        ls[116] = r16;
        ls[117] = r15;
        ls[118] = ls[117](ls[119], ls[120]);
        ls[115] = ls[116][ls[118]];
        ls[116] = .8;
        ls[96] = {
            [ls[97]] = ls[98],
            [ls[99]] = ls[100],
            [ls[101]] = ls[103],
            [ls[102]] = ls[105],
            [ls[104]] = ls[107],
            [ls[106]] = ls[108],
            [ls[109]] = ls[110],
            [ls[111]] = ls[112],
            [ls[113]] = ls[114],
            [ls[115]] = ls[116]
        };
        ls[116] = 28990840236407;
        ls[98] = r16;
        ls[103], ls[101], ls[118], ls[104], ls[102] = "e\x06\xa3\x11=\xd4", "\xdf\"@3O\xe5s\xc6\xa7SF", 20588554046182, 27208374412027, 28266042386132;
        ls[99] = r15;
        ls[100] = ls[99](ls[101], ls[102]);
        ls[68] = nil;
        ls[111] = 5595439404123;
        ls[97] = ls[98][ls[100]];
        ls[37] = nil;
        ls[100] = r16;
        ls[101] = r15;
        ls[110], ls[115], ls[105], ls[106] = "\xe8M\xd9", 9142116884802, 33610218535493, 4699911393561;
        ls[102] = ls[101](ls[103], ls[104]);
        ls[108] = 19521222100740;
        ls[99] = ls[100][ls[102]];
        ls[107] = 32632009881270;
        ls[101] = r16;
        ls[102] = r15;
        ls[104] = "*\xb4|p\xd2\x9ar\xdc\x90\xbc\xa4W\xfc\xb2u\xd23\xd2\x9c\xa4\xfe\x88";
        ls[103] = ls[102](ls[104], ls[105]);
        ls[100] = ls[101][ls[103]];
        ls[80] = nil;
        ls[113] = 31546423767747;
        ls[102] = r16;
        ls[103] = r15;
        ls[105] = "\xd1\xb2\xf3~\x9b\x1d&\x14\xdc";
        ls[104] = ls[103](ls[105], ls[106]);
        ls[120] = 9817521103799;
        ls[101] = ls[102][ls[104]];
        ls[103] = r16;
        ls[66] = nil;
        ls[104] = r15;
        ls[106] = "*>\xab\x80\xa0p\r\xef\x1f\xfdky>q\x81\xbc\xe4\xa2\xfa=\x93\xe5F";
        ls[105] = ls[104](ls[106], ls[107]);
        ls[102] = ls[103][ls[105]];
        ls[107] = "\x84\x90\x14>\xd5\xa8";
        ls[104] = r16;
        ls[105] = r15;
        ls[106] = ls[105](ls[107], ls[108]);
        ls[103] = ls[104][ls[106]];
        ls[106] = "Vector3";
        ls[105] = Env[ls[106]];
        ls[107] = r16;
        ls[108] = r15;
        ls[109] = ls[108](ls[110], ls[111]);
        ls[106] = ls[107][ls[109]];
        ls[108], ls[114], ls[110], ls[107] = 0, "k\x9b-\xc6i\xd9=", 29825163095168, 28;
        ls[43] = nil;
        ls[112] = "\xd0\x82\xfc";
        ls[104] = ls[105][ls[106]];
        ls[106] = 0;
        ls[105] = ls[104](ls[106], ls[107], ls[108]);
        ls[109] = "]\x8cy\x10\xb9M`\x9a\x91\xcaeR";
        ls[106] = r16;
        ls[47] = nil;
        ls[107] = r15;
        ls[108] = ls[107](ls[109], ls[110]);
        ls[104] = ls[106][ls[108]];
        ls[108], ls[119], ls[117] = "Vector3", "\xa8\x80\xaeDM\x87\xbe\xc1\xb7", "\xd56\xbd7\xbeU9n\xad3k|\x9a\xef";
        ls[107] = Env[ls[108]];
        ls[109] = r16;
        ls[5] = nil;
        ls[110] = r15;
        ls[111] = ls[110](ls[112], ls[113]);
        ls[108] = ls[109][ls[111]];
        ls[109] = 32;
        ls[106] = ls[107][ls[108]];
        ls[108], ls[110], ls[112] = 48, 58, 1739514840660;
        ls[107] = ls[106](ls[108], ls[109], ls[110]);
        ls[108] = r16;
        ls[111] = "\xa5\xe3\xa7\xaf{";
        ls[109] = r15;
        ls[110] = ls[109](ls[111], ls[112]);
        ls[106] = ls[108][ls[110]];
        ls[110] = "Color3";
        ls[109] = Env[ls[110]];
        ls[111] = r16;
        ls[112] = r15;
        ls[113] = ls[112](ls[114], ls[115]);
        ls[115] = "v\x17\x8ay\xb4\xaf=\x87\xb6*";
        ls[110] = ls[111][ls[113]];
        ls[111], ls[113] = 180, "\xb6\x1f\xa9\xa3\xa2";
        ls[108] = ls[109][ls[110]];
        ls[110], ls[112], ls[114] = 220, 255, 24118051133373;
        ls[109] = ls[108](ls[110], ls[111], ls[112]);
        ls[110] = r16;
        ls[111] = r15;
        ls[112] = ls[111](ls[113], ls[114]);
        ls[108] = ls[110][ls[112]];
        ls[110] = .2;
        ls[112] = r16;
        ls[113] = r15;
        ls[114] = ls[113](ls[115], ls[116]);
        ls[111] = ls[112][ls[114]];
        ls[112] = 2;
        ls[114] = r16;
        ls[115] = r15;
        ls[116] = ls[115](ls[117], ls[118]);
        ls[13] = nil;
        ls[113] = ls[114][ls[116]];
        ls[116] = r16;
        ls[117] = r15;
        ls[114] = 2;
        ls[118] = ls[117](ls[119], ls[120]);
        ls[115] = ls[116][ls[118]];
        ls[116] = .4;
        ls[118] = r16;
        ls[119] = r15;
        ls[120] = ls[119](ls[121], ls[122]);
        ls[117] = ls[118][ls[120]];
        ls[118] = .9;
        ls[98] = {
            [ls[99]] = ls[100],
            [ls[101]] = ls[102],
            [ls[103]] = ls[105],
            [ls[104]] = ls[107],
            [ls[106]] = ls[109],
            [ls[108]] = ls[110],
            [ls[111]] = ls[112],
            [ls[113]] = ls[114],
            [ls[115]] = ls[116],
            [ls[117]] = ls[118]
        };
        ls[90] = {
            [ls[93]] = ls[94],
            [ls[95]] = ls[96],
            [ls[97]] = ls[98]
        };
        ls[93] = 534;
        r[ls[93]] = ls[90];
        ls[90] = 535;
        ls[117] = 0;
        ls[1] = nil;
        ls[95] = function(...)
            local Z = {
                39,
                61,
                60,
                175,
                ls[93],
                ls[90]
            };
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            if not r[Z[4]] or not r[Z[4]].Parent then
                return;
            end;
            r365 = r[Z[4]].Position;
            r366 = r[Z[4]].CFrame;
            R = r[Z[5]];
            for B, v4 in pairs("pairs") do
                E = B;
                r367 = v4;
                task.spawn(function(...)
                    local Z = {
                        Z[6],
                        20,
                        328,
                        329
                    };
                    r[Z[1]](r[Z[2]], r[Z[3]], r[Z[4]]);
                    return; 
                end); 
            end;
            return; 
        end;
        ls[94] = function(arg1_122, arg2_122, arg3_122, ...)
            local Z = {
                61,
                60,
                ls[91],
                ls[92],
                217
            };
            r368 = arg1_122;
            g = arg2_122;
            B = g - arg3_122.LookVector * r[Z[3]] + Vector3.new(0, r[Z[4]], 0);
            r369 = Instance.new("Part");
            r369.Size = r368.originalSize * r368.scale;
            i = (CFrame.lookAt(B, B + (g - B).Unit) + r368.offset * r368.scale) * CFrame.Angles(math.rad(90), 0, 0);
            r369.CFrame = i;
            r369.Anchored = true;
            r369.CanCollide = false;
            r369.CanQuery = false;
            r369.Material = Enum.Material.ForceField;
            r369.Color = r368.color;
            r369.Transparency = .45;
            r369.Parent = workspace;
            i = Instance.new("SpecialMesh", r369);
            i.MeshType = Enum.MeshType.FileMesh;
            i.MeshId = r368.meshId;
            i.TextureId = r368.textureId;
            i.Scale = Vector3.new(r368.scale, r368.scale, r368.scale);
            a = r368.scale * r368.expandSize;
            C = r[Z[5]];
            D = C.Create(C, i, TweenInfo.new(r368.expandDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["Scale"] = Vector3.new(a, a, a)
            });
            D.Play(D);
            task.delay(r368.fadeDelay, function(...)
                local Z = {
                    Z[5],
                    431,
                    Z[1],
                    Z[2],
                    430
                };
                C = r[Z[1]];
                D = C.Create(C, r[Z[2]], TweenInfo.new(r[Z[5]].fadeDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Transparency"] = 1
                });
                D.Play(D);
                return; 
            end);
            r370 = r369.CFrame;
            r371 = true;
            task.spawn(function(...)
                local Z = {
                    432,
                    431,
                    Z[1],
                    Z[2],
                    433
                };
                while r[Z[1]] do
                    r[Z[2]].CFrame = r[Z[5]] * CFrame.Angles(0, math.rad(math.random(0, 360)), 0);
                    task.wait(math.random(4, 12) / 100); 
                end;
                return; 
            end);
            task.delay(1.5, function(...)
                r371 = false;
                pcall(function(...)
                    C = r[Q];
                    C.Destroy(C);
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        ls[105] = 30704584486835;
        r[ls[90]] = ls[94];
        ls[94] = 536;
        r[ls[94]] = ls[95];
        ls[104] = 29994819480862;
        ls[96] = function(arg1_123, ...)
            local Z = {
                61,
                60,
                38,
                39,
                ls[86],
                ls[2],
                ls[3],
                ls[29],
                ls[53],
                ls[59],
                ls[94],
                215,
                ls[54],
                51
            };
            r372 = arg1_123;
            r372 = math.clamp(r372, 0, #r[Z[3]].BOOST_SPEEDS);
            if r[Z[4]].isCharging then
                return;
            end;
            C = r372 == 0;
            if C then
                r[Z[4]].boostLevel = 0;
                r[Z[4]].speedScale = 1;
                r[Z[5]]();
                r[Z[6]]();
                return;
            end;
            C = C;
            r373 = r[Z[4]].boostChargeDelayEnabled and (r[Z[3]].BOOST_CHARGE_TIMES[r372] or 0) or 0;
            r[Z[4]].boostLevel = r372;
            r[Z[4]].lastBoostedTime = os.clock();
            r[Z[5]]();
            r[Z[7]](r372);
            r[Z[8]](r372);
            if r373 <= 0 then
                r[Z[4]].speedScale = 1;
                r[Z[4]].isCharging = false;
                r[Z[9]](r372);
                r[Z[10]](r372);
                r[Z[11]]();
                return;
            end;
            r[Z[4]].isCharging = true;
            r374 = r[Z[4]].speedScale;
            r375 = 0;
            r376 = r372;
            g = r[Z[12]].Heartbeat;
            r377 = g.Connect(g, function(arg1_124, ...)
                local Z = {
                    331,
                    207,
                    Z[3],
                    Z[1],
                    Z[2],
                    58,
                    Z[4],
                    330,
                    333,
                    332,
                    Z[10],
                    Z[9],
                    Z[13],
                    Z[11]
                };
                C = r[Z[1]] + arg1_124;
                r[Z[1]] = C;
                if r[Z[1]] < r[Z[2]] then
                    v3 = r[Z[1]] + v1;
                    r[Z[7]].speedScale = r[Z[8]] + ((r[Z[3]].BOOST_CHARGE_FACTORS[r[Z[6]]] or .12) - r[Z[8]]) * (1 - (1 - r[Z[1]] / r[Z[2]]) ^ 3);
                else
                    D = r[Z[9]];
                    D.Disconnect(D);
                    r[Z[7]].speedScale = 1;
                    r[Z[7]].isCharging = false;
                    C = r[Z[1]] + v1;
                    if r[Z[7]].boostLevel == r[Z[10]] and r[Z[7]].flying then
                        r[Z[11]](r[Z[6]]);
                        r[Z[12]](r[Z[6]]);
                        r[Z[13]]();
                        r[Z[14]]();
                    end;
                    return;
                end; 
            end);
            r[Z[14]][#r[Z[14]] + 1] = r377;
            return; 
        end;
        ls[95] = 537;
        r[ls[95]] = ls[96];
        ls[97] = function(...)
            local Z = {
                39,
                61,
                60,
                42,
                ls[95],
                38
            };
            if not r[Z[1]].flying then
                return;
            end;
            if r[Z[1]].transitioning then
                return;
            end;
            if r[Z[1]].isCharging then
                return;
            end;
            if CW and CW.locked then
                return;
            end;
            if WI and WI.locked then
                return;
            end;
            if Vector3.new(r[Z[4]].L + r[Z[4]].R, r[Z[4]].U + r[Z[4]].D, r[Z[4]].F + r[Z[4]].B).Magnitude < .01 and r[Z[1]].boostLevel == 0 then
                return;
            end;
            r[Z[5]](r[Z[1]].boostLevel % #r[Z[6]].BOOST_SPEEDS + 1);
            return; 
        end;
        ls[102] = "5s\x82\xee\xa7s\xbb\xf5&\x14o'\xf7\xa2v:9\xcd\x1cg\x811\x11d[\xa6\xbd";
        ls[96] = 538;
        ls[103] = 264148549878;
        r[ls[96]] = ls[97];
        ls[99] = r16;
        ls[100] = r15;
        ls[101] = ls[100](ls[102], ls[103]);
        ls[103], ls[107] = "U0\x01i\x8d\xd00\xae5\xa2f\xc9\xc2\xa6\x86M\xd6\n\xee!\x02c\r\xc9\x83)\xc8S", 25561204186365;
        ls[98] = ls[99][ls[101]];
        ls[100] = r16;
        ls[101] = r15;
        ls[120] = function(arg1_125, ...)
            local Z = {
                39,
                61,
                60,
                173,
                175,
                217
            };
            v1 = arg1_125;
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            g = RaycastParams.new();
            g.FilterDescendantsInstances = {
                r[Z[4]]
            };
            g.FilterType = Enum.RaycastFilterType.Exclude;
            g.RespectCanCollide = true;
            C = workspace;
            v3 = C.Raycast(C, r[Z[5]].Position, Vector3.new(0, -10, 0), g);
            if not v3 then
                return;
            end;
            B = v3.Position;
            C = v3.Normal.Unit;
            Q = math.abs(C.Dot(C, Vector3.new(1, 0, 0))) < .9;
            if Q then
                v4 = Vector3.new(1, 0, 0);
            end;
            C, D = C, Q;
            if Q then
                v4 = v4;
                M = C.Cross(C, v4).Unit;
                a = CFrame.fromMatrix(B, M, C, -M.Cross(M, C).Unit) * CFrame.Angles(0, 0, math.rad(90));
                r378 = Instance.new("Part");
                r378.Anchored = true;
                r378.CanCollide = false;
                r378.CanQuery = false;
                r378.CastShadow = false;
                r378.Shape = Enum.PartType.Cylinder;
                r378.Size = Vector3.new(0.25, 2, 2);
                r378.CFrame = CFrame.new(B + C * .05) * (a - a.Position);
                r378.Material = Enum.Material.Neon;
                r378.Color = Color3.fromRGB(220, 225, 235);
                r378.Transparency = .1;
                r378.Parent = workspace;
                C = r[Z[6]];
                q = math.clamp(arg1_125 / 20, 6, 20);
                D = C.Create(C, r378, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    ["Size"] = Vector3.new(.1, q, q),
                    ["Transparency"] = 1
                });
                D.Play(D);
                task.delay(.55, function(...)
                    pcall(function(...)
                        C = r[v2];
                        C.Destroy(C);
                        return; 
                    end);
                    return; 
                end);
                return;
            else
                D = Vector3.new(0, 0, 1);
            end; 
        end;
        ls[102] = ls[101](ls[103], ls[104]);
        ls[122] = function(...)
            local Z = {
                39,
                61,
                60,
                173,
                175,
                217
            };
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            v1 = RaycastParams.new();
            v1.FilterDescendantsInstances = {
                r[Z[4]]
            };
            v1.FilterType = Enum.RaycastFilterType.Exclude;
            C = workspace;
            g = C.Raycast(C, r[Z[5]].Position, Vector3.new(0, -50, 0), v1);
            if not g then
                return;
            end;
            r379 = g.Position;
            C = g.Normal.Unit;
            r380 = C;
            a = r380;
            M = math.abs(a.Dot(a, Vector3.new(1, 0, 0))) < .9;
            if M then
                E = Vector3.new(1, 0, 0);
            end;
            C, D = C, M;
            if M then
                E = E;
                D = r380;
                v4 = D.Cross(D, E).Unit;
                r381 = CFrame.fromMatrix(r379, v4, r380, -v4.Cross(v4, r380).Unit) * CFrame.Angles(0, 0, math.rad(90));
                local function a(arg1_126, arg2_126, arg3_126, arg4_126, arg5_126, arg6_126, arg7_126, ...)
                    local Z = {
                        Z[2],
                        Z[3],
                        160,
                        161,
                        307,
                        Z[6]
                    };
                    r382 = arg1_126;
                    r383 = arg2_126;
                    r384 = arg3_126;
                    r385 = arg4_126;
                    r386 = arg5_126;
                    r387 = arg6_126;
                    task.delay(arg7_126, function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            359,
                            363,
                            Z[3],
                            Z[4],
                            Z[5],
                            362,
                            364,
                            Z[6],
                            360,
                            361
                        };
                        r388 = Instance.new("Part");
                        r388.Name = "IFlyRing";
                        r388.Anchored = true;
                        r388.CanCollide = false;
                        r388.CanQuery = false;
                        r388.CastShadow = false;
                        r388.Shape = Enum.PartType.Cylinder;
                        r388.Size = Vector3.new(r[Z[3]], r[Z[4]], r[Z[4]]);
                        r388.CFrame = CFrame.new(r[Z[5]] + r[Z[6]] * .05) * (r[Z[7]] - r[Z[7]].Position);
                        r388.Material = Enum.Material.Neon;
                        r388.Color = r[Z[8]];
                        r388.Transparency = r[Z[9]];
                        r388.Parent = workspace;
                        C = r[Z[10]];
                        D = C.Create(C, r388, TweenInfo.new(r[Z[11]], Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            ["Size"] = Vector3.new(r[Z[3]] * .3, r[Z[12]], r[Z[12]]),
                            ["Transparency"] = 1
                        });
                        D.Play(D);
                        task.delay(r[Z[11]] + .05, function(...)
                            pcall(function(...)
                                C = r[v1];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                        return; 
                    end);
                    return; 
                end;
                a(4, 18, .28, .7, Color3.fromRGB(225, 230, 240), .15, 0);
                a(3, 12, .2, .55, Color3.fromRGB(210, 218, 235), .2, .07);
                a(2, 7, .14, .4, Color3.fromRGB(245, 248, 255), .1, .14);
                r389 = Instance.new("Part");
                r389.Name = "IFlyDisc";
                r389.Anchored = true;
                r389.CanCollide = false;
                r389.CanQuery = false;
                r389.CastShadow = false;
                r389.Shape = Enum.PartType.Cylinder;
                r389.Size = Vector3.new(.08, 3, 3);
                o = CFrame.new;
                S = r381;
                v5 = r381.Position;
                r389.CFrame = o(r379 + r380 * .03) * o;
                r389.Material = Enum.Material.Neon;
                r389.Color = Color3.fromRGB(240, 243, 250);
                r389.Transparency = .3;
                r389.Parent = workspace;
                C = r[Z[6]];
                J = 30389968531086;
                h = "o\xb3K6y\x7f\xab\xd5\xd9\x81\xc0\xd2";
                v = r[Z[3]];
                t = v(h, 9247346794916);
                X = 1;
                D = C.Create(C, r389, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    ["Size"] = Vector3[r[Z[2]][r[Z[3]]("U\xe1\x06", J)]](.05, 10, 10),
                    [r[Z[2]][t]] = X
                });
                D.Play(D);
                task.delay(.3, function(...)
                    pcall(function(...)
                        C = r[v2];
                        C.Destroy(C);
                        return; 
                    end);
                    return; 
                end);
                D = 1;
                for C = 0, q do
                    X = 0;
                    v = X / 12 * math.pi * 2;
                    t = math.cos(v) * o;
                    h = math.sin(v) * o;
                    C = workspace;
                    ug = 0;
                    I, J = C, C.Raycast(C, Vector3.new(r379.X + t, r379.Y + 3, r379.Z + h), Vector3.new(0, -8, ug), RaycastParams.new());
                    if J then
                        L = J.Position.Y;
                    end;
                    L, I = J or r379.Y, J;
                    if J then
                        I = J.Normal;
                    end;
                    C = I;
                    D = I;
                    if I then
                        I = I;
                        r390 = Instance.new("Part");
                        r390.Name = "IFlyShard";
                        r390.Anchored = false;
                        r390.CanCollide = false;
                        r390.CanQuery = false;
                        r390.CastShadow = false;
                        ug = X % 3 == 0;
                        C = r390;
                        Cg = C;
                        D = "Size";
                        if ug then
                            xg = Vector3.new(math.random(8, 16) / 100, math.random(25, 55) / 100, math.random(8, 16) / 100);
                        end;
                        C = C;
                        wg = ug;
                        if ug then
                            C = r[Z[3]];
                            C[r[Z[2]][r[Z[3]]("\xc3nV\x9a", Zg)]] = xg;
                            C = I.Unit;
                            xg = C;
                            Cg = math.abs(C.Dot(C, Vector3.new(1, 0, 0))) < .9;
                            D, C = Cg and Vector3.new(1, 0, 0), xg;
                            if Cg then
                                xg = C.Cross(C, Cg and Vector3.new(1, 0, 0)).Unit;
                                r390.CFrame = CFrame.fromMatrix(Vector3.new(r379.X + t, J or r[v3].Y, r379.Z + h), xg, C, -xg.Cross(xg, C).Unit) * CFrame.Angles(math.rad(math.random(-25, 25)), math.rad(math.random(0, 360)), math.rad(math.random(-25, 25)));
                                if J then
                                    D = C.Raycast(C, p, Vector3[r[Z[2]][wg]](0, -8, ug), v1).Instance;
                                end;
                                if J then
                                    kg = C.Raycast(C, p, Vector3[r[Z[2]][wg]](0, -8, ug), v1).Instance;
                                    if kg.IsA(kg, "BasePart") then
                                        r390.Material = kg.Material;
                                        r390.Color = Color3.new(math.min(kg.Color.R * 1.15, 1), math.min(kg.Color.G * 1.15, 1), math.min(kg.Color.B * 1.15, 1));
                                    else
                                        r390.Material = Enum.Material.SmoothPlastic;
                                        r390.Color = Color3.fromRGB(170, 175, 185);
                                    end;
                                else
                                    r390.Material = Enum.Material.SmoothPlastic;
                                    r390.Color = Color3.fromRGB(170, 175, 185);
                                end;
                                r390.Parent = workspace;
                                C = Vector3.new(t, 0, h).Unit;
                                kg = C;
                                if ug then
                                    Pg = math.random(8, 16);
                                end;
                                C, D = C, ug;
                                if ug then
                                    Pg, J, p = Pg, nil, nil;
                                    r390.AssemblyLinearVelocity = C * math.random(6, 16) + Vector3.new(0, Pg, 0);
                                    r390.AssemblyAngularVelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10));
                                    task.spawn(function(...)
                                        local Z = {
                                            Z[2],
                                            Z[3],
                                            7,
                                            Z[6]
                                        };
                                        task.wait(math.random(20, 45) / 100);
                                        if not r[Z[3]] or not r[Z[3]].Parent then
                                            return;
                                        end;
                                        C = r[Z[4]];
                                        D = C.Create(C, r[Z[3]], TweenInfo.new(.4, Enum.EasingStyle.Linear), {
                                            ["Transparency"] = 1
                                        });
                                        D.Play(D);
                                        task.wait(.45);
                                        pcall(function(...)
                                            C = r[f];
                                            C.Destroy(C);
                                            return; 
                                        end);
                                        return; 
                                    end);
                                else
                                    D = math.random(4, 10);
                                end;
                            else
                                D = Vector3.new(0, 0, 1);
                            end;
                        else
                            wg = Vector3.new(math.random(12, 28) / 100, math.random(10, 20) / 100, math.random(12, 28) / 100);
                        end;
                    else
                        D = g.Normal;
                    end; 
                end;
                r391 = Instance.new("Part");
                r391.Anchored = true;
                r391.CanCollide = false;
                r391.CanQuery = false;
                r391.CastShadow = false;
                r391.Size = Vector3.new(1, 1, 1);
                r391.CFrame = CFrame.new(r379 + g.Normal * .3);
                r391.Transparency = 1;
                r391.Parent = workspace;
                S = Instance.new("ParticleEmitter");
                S.Texture = "rbxasset://textures/particles/smoke_main.dds";
                S.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 220, 225)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
                });
                S.LightEmission = .6;
                S.LightInfluence = .3;
                S.Size = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 2),
                    NumberSequenceKeypoint.new(1, 0)
                });
                S.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, .1),
                    NumberSequenceKeypoint.new(0.5, 0.5),
                    NumberSequenceKeypoint.new(1, 1)
                });
                S.Speed = NumberRange.new(4, 12);
                S.SpreadAngle = Vector2.new(55, 55);
                S.Lifetime = NumberRange.new(0.5, 1.1);
                S.Rate = 0;
                S.RotSpeed = NumberRange.new(-90, 90);
                S.Rotation = NumberRange.new(0, 360);
                S.Parent = r391;
                S.Emit(S, 30);
                task.delay(1.5, function(...)
                    pcall(function(...)
                        C = r[O];
                        C.Destroy(C);
                        return; 
                    end);
                    return; 
                end);
                return;
            else
                D = Vector3.new(0, 0, 1);
            end; 
        end;
        ls[74] = nil;
        ls[99] = ls[100][ls[102]];
        ls[97] = {
            ls[98],
            ls[99]
        };
        ls[98] = 539;
        ls[106] = "\x14\x05i\t\x9d\x9f";
        r[ls[98]] = ls[97];
        ls[97] = 40;
        ls[99] = 540;
        r[ls[99]] = ls[97];
        ls[101] = r16;
        ls[110] = 541;
        ls[104], ls[108] = "\xa6\x87\xaa\xfe", 33960269052811;
        ls[102] = r15;
        ls[103] = ls[102](ls[104], ls[105]);
        ls[100] = ls[101][ls[103]];
        ls[118] = 542;
        ls[101] = nil;
        ls[103] = r16;
        ls[104] = r15;
        ls[105] = ls[104](ls[106], ls[107]);
        ls[102] = ls[103][ls[105]];
        ls[103], ls[105] = false, "0\x05\xe0\x0c\xa9\xa3";
        ls[97], ls[106] = {
            [ls[100]] = ls[101],
            [ls[102]] = ls[103]
        }, 34303876922571;
        ls[61] = nil;
        ls[100] = 543;
        r[ls[100]] = ls[97];
        ls[102] = r16;
        ls[103] = r15;
        ls[104] = ls[103](ls[105], ls[106]);
        ls[101] = ls[102][ls[104]];
        ls[107], ls[102] = "\xb9\xcb\xb1~", false;
        ls[104] = r16;
        ls[105] = r15;
        ls[109] = 544;
        ls[106] = ls[105](ls[107], ls[108]);
        ls[103] = ls[104][ls[106]];
        ls[104] = nil;
        ls[97] = {
            [ls[101]] = ls[102],
            [ls[103]] = ls[104]
        };
        ls[114] = function(arg1_127, arg2_127, arg3_127, arg4_127, arg5_127, arg6_127, arg7_127, arg8_127, arg9_127, arg10_127, arg11_127, arg12_127, ...)
            local Z = {
                39,
                61,
                60,
                173,
                214,
                572,
                217,
                ls[99]
            };
            i, a, Q, R = arg10_127, arg11_127, arg9_127, arg5_127;
            v1, E, M = arg1_127, arg6_127, arg8_127;
            r392 = arg12_127;
            v4, B = arg7_127, arg4_127;
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            math.clamp(arg3_127, 0.5, 2.4);
            C = arg2_127.Unit;
            O = math.abs(C.Dot(C, Vector3.new(1, 0, 0))) < .98;
            o, C = O and Vector3.new(1, 0, 0), C;
            if O then
                O = C.Cross(C, O and Vector3.new(1, 0, 0)).Unit;
                v5 = RaycastParams.new();
                h = r[Z[5]];
                p = {
                    h.GetPlayers(h)
                };
                for t, p in ipairs(x(p)) do
                    h = t;
                    if p.Character then
                        table.insert({
                            r[Z[4]]
                        }, p.Character);
                    end; 
                end;
                X = {
                    r[Z[4]]
                };
                v5.FilterDescendantsInstances = X;
                v5.FilterType = Enum.RaycastFilterType.Exclude;
                v5.RespectCanCollide = true;
                L = r[Z[3]];
                I = L("\xc3N", 33638136674911);
                C = math.random() * math[r[Z[2]][I]] * 2;
                for h = 1, v4 do
                    L = C + h / v4 * math.pi * 2 + (math.random() - 0.5) * math.pi * 2 / v4 * 0.5;
                    I = arg6_127 * (.9 + math.random() * 0.25);
                    C = workspace;
                    xg = C.Raycast(C, v1 + O * math.cos(L) * I + O.Cross(O, C).Unit * math.sin(L) * I + C * 3, -C * 6, v5);
                    if xg then
                        Zg, kg = arg4_127, arg5_127;
                        Vg = xg.Position;
                        Pg = true;
                        yg = "Terrain";
                        Ag = workspace[yg];
                        if xg.Instance == Ag then
                            Zg = C.Raycast(C, Cg, Vg, v5).Material;
                            rg = r[Z[6]].tryGetTerrainColor;
                            yg = {
                                rg(Zg)
                            };
                            if yg[1] then
                                rg = yg[2];
                                kg = yg[2];
                            else
                                Pg = false;
                            end;
                        else
                            Ag = xg.Instance;
                            if Ag.IsA(Ag, "BasePart") then
                                Zg = xg.Instance.Material;
                                kg = xg.Instance.Color;
                            end;
                            if true then
                                gg = M + math.random() * (arg9_127 - M);
                                r393 = gg * (1.1 + math.random() * .6);
                                Fg = workspace;
                                Rg = Fg.Raycast(Fg, Vg - C * .05, -C * 8, RaycastParams.new());
                                bg = C;
                                if Rg then
                                    jg = (xg.Position - Rg.Position).Magnitude;
                                end;
                                C = C;
                                r393 = math.min(r393, math.max(.3, ((Rg or 4) - .1 - r392) / .45));
                                bg = Vg - v1;
                                Tg = v1 + C * bg.Dot(bg, C) - Vg;
                                if Tg.Magnitude < .01 then
                                    Tg = q.Cross(q, o).Unit * math.cos(L) * I + O.Cross(O, q).Unit * math[r[Z[2]][r[Z[3]]("v\x08\x10", Pg)]](L) * I;
                                    if Tg.Magnitude < .01 then
                                        Tg = q.Cross(q, o).Unit;
                                    end;
                                end;
                                cg = Tg.Unit;
                                if math.abs(cg.Dot(cg, q)) > .95 then
                                    Gg = O.Cross(O, q).Unit;
                                end;
                                Kg = q.Cross(q, cg).Unit;
                                Gg = cg.Cross(cg, Kg).Unit;
                                r394 = CFrame.fromMatrix(Vg, Kg, Gg, -cg) * CFrame.Angles(-math.rad(i + math.random() * (arg11_127 - i)), 0, 0) * CFrame.Angles(0, math.rad(math.random(-12, 12)), math.rad(math.random(-8, 8)));
                                r395 = Instance.new("Part");
                                r395.Name = "IFlyWallRock";
                                r395.Anchored = true;
                                r395.CanCollide = false;
                                r395.CanQuery = false;
                                r395.CanTouch = false;
                                r395.CastShadow = true;
                                r395.Material = Zg;
                                ng = R;
                                r395.Color = ng;
                                r395.Size = Vector3.new(gg, r393, gg * (.55 + math.random() * .35));
                                r395.CFrame = r394 * CFrame.new(0, -(r393 + r392), 0);
                                r395.Parent = workspace;
                                task.delay(h / arg7_127 * .08 + math.random() * .05, function(...)
                                    local Z = {
                                        304,
                                        Z[2],
                                        Z[3],
                                        Z[7],
                                        303,
                                        365
                                    };
                                    if not r[Z[1]].Parent then
                                        return;
                                    end;
                                    C = r[Z[4]];
                                    D = C.Create(C, r[Z[1]], TweenInfo.new(.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                        ["CFrame"] = r[Z[5]] * CFrame.new(0, -r[Z[6]] * .45, 0)
                                    });
                                    D.Play(D);
                                    return; 
                                end);
                                task.delay(r[Z[8]] + math.random() * 4, function(...)
                                    local Z = {
                                        304,
                                        Z[2],
                                        Z[3],
                                        Z[7],
                                        303,
                                        365,
                                        311
                                    };
                                    if not r[Z[1]].Parent then
                                        return;
                                    end;
                                    r[Z[1]].CanCollide = false;
                                    C = r[Z[4]];
                                    D = C.Create(C, r[Z[1]], TweenInfo.new(1.1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                                        ["CFrame"] = r[Z[5]] * CFrame.new(0, -(r[Z[6]] + r[Z[7]]), 0)
                                    });
                                    D.Play(D);
                                    task.delay(1.2, function(...)
                                        local Z = {
                                            mg
                                        };
                                        pcall(function(...)
                                            C = r[mg];
                                            C.Destroy(C);
                                            return; 
                                        end);
                                        return; 
                                    end);
                                    return; 
                                end);
                            end;
                        end;
                    end; 
                end;
                return;
            else
                o = Vector3.new(0, 0, 1);
            end; 
        end;
        ls[107] = function(...)
            local Z = {
                ls[100],
                61,
                60
            };
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            r[Z[1]].locked = false;
            return; 
        end;
        ls[101] = 545;
        r[ls[101]] = ls[97];
        ls[103] = function(arg1_128, arg2_128, arg3_128, arg4_128, ...)
            local Z = {
                39,
                61,
                60,
                173,
                ls[98],
                215
            };
            v3 = arg3_128;
            r396 = arg1_128;
            r397 = arg2_128;
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            C = math.clamp;
            E = C;
            C(arg4_128 or 1, .65, 2.4);
            E = RaycastParams.new();
            E.FilterDescendantsInstances = {
                r[Z[4]]
            };
            E.FilterType = Enum.RaycastFilterType.Exclude;
            E.RespectCanCollide = true;
            M = C;
            R = v3.Unit;
            S = {
                Vector3.new(0, 1, 0)
            };
            a = math.abs(R.Dot(R, x(S))) < .95;
            if a then
                Q = Vector3.new(0, 1, 0);
            end;
            C = C;
            v4 = a;
            if a then
                Y = 16107692669593;
                M = R.Cross(R, Q).Unit;
                Q = M.Cross(M, R).Unit;
                for O, S in ipairs({
                    Vector3[r[Z[2]][r[Z[3]]("X\x8e\x11", Y)]](0, 0, 0),
                    M * .7,
                    -M * .7,
                    Q * .7,
                    -Q * .7
                }) do
                    v2 = O;
                    Y = workspace;
                    a = Y.Raycast(Y, r397 + R * 5 + S, -R * 10, RaycastParams.new());
                    if a then
                        
                    else
                        
                    end; 
                end;
                if a then
                    r397 = a.Position;
                    v3 = a.Normal;
                    r396 = a.Instance;
                end;
                v4 = C;
                r398 = v3.Unit;
                S = r398;
                M = math.abs(S.Dot(S, Vector3.new(0, 1, 0))) < .95;
                R, C = M and Vector3.new(0, 1, 0), C;
                if M then
                    M = r398;
                    v4 = M.Cross(M, M and Vector3.new(0, 1, 0)).Unit;
                    M = v4.Cross(v4, r398).Unit;
                    local function r399(arg1_129, arg2_129, arg3_129, ...)
                        local Z = {
                            Z[2],
                            Z[3]
                        };
                        r400 = arg1_129;
                        r401 = arg2_129;
                        r402 = arg3_129;
                        E = {
                            pcall(function(...)
                                local Z = {
                                    181,
                                    Z[1],
                                    Z[2],
                                    180
                                };
                                C = r[Z[1]].CFrame;
                                return C.PointToObjectSpace(C, r[Z[4]]); 
                            end)
                        };
                        R = E[1];
                        C = pcall;
                        M = {
                            C(function(...)
                                local Z = {
                                    181,
                                    Z[1],
                                    Z[2],
                                    182
                                };
                                C = r[Z[1]].CFrame;
                                return C.VectorToObjectSpace(C, r[Z[4]]); 
                            end)
                        };
                        M = not R;
                        if R then
                            D = M[1];
                        end;
                        C = M;
                        if not R then
                            return math.huge;
                        end;
                        for a, o in ipairs("ipairs") do
                            q = a;
                            O = M[2][o];
                            v5 = E[2][o];
                            S = (r400.Size * 0.5)[o];
                            if math.abs(O) > 1e-005 then
                                Y = math.max((-S - v5) / O, (S - v5) / O);
                                if Y >= 0 then
                                    math.min(math.huge, Y);
                                end;
                            end; 
                        end;
                        return math.huge; 
                    end;
                    r403 = RaycastParams.new();
                    r403.FilterDescendantsInstances = {
                        r[Z[4]]
                    };
                    r403.FilterType = Enum.RaycastFilterType.Exclude;
                    r403.RespectCanCollide = true;
                    local function O(arg1_130, arg2_130, ...)
                        local Z = {
                            348,
                            Z[2],
                            Z[3],
                            289,
                            349,
                            204,
                            290
                        };
                        v3 = r[Z[1]];
                        g, v1 = arg2_130, arg1_130;
                        if v3 then
                            v3 = r[Z[1]];
                            D = v3.IsA(v3, "BasePart");
                        end;
                        if v3 then
                            return math.min(r[Z[4]](r[Z[1]], r[Z[5]], v1), g);
                        end;
                        B = 6;
                        for E = 1, B do
                            C = workspace;
                            v2 = C.Raycast(C, r[Z[5]] + v1 * g * E / B + r[Z[6]] * 1, -r[Z[6]] * 2.5, r[Z[7]]);
                            q = v2 ~= nil;
                            D = q;
                            if q then
                                D = v2.Instance ~= workspace.Terrain;
                            end;
                            if D then
                                D = v2.Instance;
                                if not D.IsA(D, "BasePart") then
                                    q = false;
                                else
                                    if C.Raycast(C, a + r[Z[6]] * 1, -r[Z[6]] * O, o).Instance.Transparency >= .95 then
                                        q = false;
                                    end;
                                end;
                            end;
                            if q then
                                v3 = g * Q / B;
                            else
                                
                            end;
                            return 0; 
                        end;
                        return 0; 
                    end;
                    h = r[Z[5]];
                    for t, h in ipairs(h) do
                        I, J = C, C;
                        r404 = t;
                        p = r404 == 1 and 0 or 45;
                        L = math.rad(p);
                        J = (10 + r404 * 2) * D;
                        I = J * (math.abs(math.cos(L)) + math.abs(math.sin(L))) * 0.5;
                        f = O(v4, I);
                        ug = O(-v4, I);
                        wg = O(M, I);
                        Cg = O(-M, I);
                        xg = (f - ug) * 0.5;
                        kg = (wg - Cg) * 0.5;
                        r405 = Instance.new("Part");
                        r405.Name = "IFlyCrack";
                        r405.Anchored = true;
                        r405.CanCollide = false;
                        r405.CanQuery = false;
                        r405.CanTouch = false;
                        r405.CastShadow = false;
                        r405.Size = Vector3.new(J, J, .05);
                        Dg = CFrame.fromMatrix(r397 + r398 * .05, v4, M, -r398);
                        r405.CFrame = Dg;
                        r405.Transparency = 1;
                        r405.Parent = workspace;
                        Ag = Instance.new("SurfaceGui");
                        Ag.Face = Enum.NormalId.Front;
                        Ag.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud;
                        Dg = 50;
                        Ag.PixelsPerStud = Dg;
                        Ag.LightInfluence = 0;
                        Ag.Parent = r405;
                        Dg = Instance.new("Frame");
                        Dg.AnchorPoint = Vector2.new(0.5, 0.5);
                        Dg.Size = UDim2.new(0, math.max(f + ug, .2) * 50, 0, math.max(wg + Cg, .2) * 50);
                        Dg.Position = UDim2.new(0.5, xg * 50, 0.5, -kg * 50);
                        Dg.BackgroundTransparency = 1;
                        Dg.ClipsDescendants = true;
                        Dg.Parent = Ag;
                        r406 = Instance.new("ImageLabel");
                        r406.BackgroundTransparency = 1;
                        r406.Image = h;
                        r406.AnchorPoint = Vector2.new(0.5, 0.5);
                        r406.Size = UDim2.new(0, J * 50, 0, J * 50);
                        r406.Position = UDim2.new(0.5, -xg * 50, 0.5, kg * 50);
                        r406.Rotation = p;
                        r406.ImageTransparency = 0;
                        r406.Parent = Dg;
                        task.spawn(function(...)
                            local Z = {
                                21,
                                Z[6],
                                Z[2],
                                Z[3],
                                23,
                                22
                            };
                            g = r[Z[1]] == 1 and 45 or 35;
                            while C < g do
                                D = r[Z[2]].Heartbeat;
                                r407 = math.clamp((C + D.Wait(D)) / g, 0, 1);
                                pcall(function(...)
                                    local Z = {
                                        Z[5],
                                        Z[3],
                                        Z[4],
                                        434
                                    };
                                    r[Z[1]].ImageTransparency = r[Z[4]] * r[Z[4]];
                                    return; 
                                end); 
                            end;
                            pcall(function(...)
                                C = r[Pg];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end); 
                    end;
                    return;
                else
                    R = Vector3.new(1, 0, 0);
                end;
            else
                v4 = Vector3.new(1, 0, 0);
            end; 
        end;
        ls[97], ls[105] = nil, "tryGetTerrainColor";
        ls[77] = nil;
        ls[75] = nil;
        ls[102] = 546;
        r[ls[102]] = ls[97];
        ls[97] = 547;
        r[ls[97]] = ls[103];
        ls[119] = function(...)
            local Z = {
                215,
                61,
                60,
                39,
                175,
                43,
                52,
                42,
                ls[95],
                53,
                ls[2],
                ls[89],
                ls[118],
                46,
                50,
                ls[87],
                38,
                ls[11],
                435,
                51
            };
            C = r[Z[1]].RenderStepped;
            r[Z[20]][#r[Z[20]] + 1] = C.Connect(C, function(arg1_131, ...)
                local Z = {
                    Z[4],
                    Z[2],
                    Z[3],
                    Z[5],
                    Z[6],
                    Z[7],
                    Z[8],
                    Z[9],
                    Z[10],
                    Z[11],
                    Z[12],
                    Z[13],
                    Z[14],
                    Z[15],
                    Z[16],
                    Z[17],
                    Z[18],
                    Z[19]
                };
                if not r[Z[1]].flying or (not r[Z[4]] or not r[Z[4]].Parent) then
                    return;
                end;
                if not r[Z[5]] or not r[Z[6]] then
                    return;
                end;
                v3 = workspace.CurrentCamera.CFrame;
                B = Vector3.new(r[Z[7]].L + r[Z[7]].R, r[Z[7]].U + r[Z[7]].D, r[Z[7]].F + r[Z[7]].B);
                R = B.Magnitude > .01;
                if r[Z[1]].wasMoving and not R then
                    if r[Z[1]].boostLevel > 0 then
                        r[Z[1]].isCharging = false;
                        r[Z[1]].speedScale = 1;
                        r[Z[8]](0);
                    else
                        if r[Z[1]].boostLevel == 0 then
                            if not r[Z[9]].active or not r[Z[9]].active.IsPlaying then
                                r[Z[11]]();
                            end;
                        end;
                    end;
                end;
                r[Z[1]].wasMoving = R;
                if R then
                    E = v3.VectorToWorldSpace(v3, B.Unit) * r[Z[11]]();
                else
                    if r[Z[1]].hoverEnabled and r[Z[1]].boostLevel == 0 then
                        r[Z[12]] = r[Z[12]] + arg1_131 * r[Z[13]];
                        E = Vector3.new(0, math.sin(r[Z[12]]) * r[Z[14]], 0);
                    end;
                    a = r[Z[5]].Velocity;
                    r[Z[5]].Velocity = a.Lerp(a, Vector3.zero, math.min(arg1_131 * (5.5 - r[Z[1]].driftAmount * 4.7), 1));
                    C = D[v4[Q]];
                    if r[Z[1]].boostLevel == 0 and not r[Z[1]].isCharging then
                        C = C;
                        if r[Z[7]].B ~= 0 and r[Z[7]].F == 0 then
                            Q = 2;
                        else
                            q = r[Z[7]].L ~= 0;
                            C = a;
                            if q and (r[Z[7]].R == 0 and (r[Z[7]].F == 0 and r[Z[7]].B == 0)) then
                                Q = -1;
                            else
                                q = r[Z[7]].R ~= 0 and (r[Z[7]].L == 0 and (r[Z[7]].F == 0 and r[Z[7]].B == 0));
                                C = r[Z[7]].R ~= 0 and (r[Z[7]].L == 0 and (r[Z[7]].F == 0 and r[Z[7]].B == 0));
                                if r[Z[7]].R ~= 0 and (r[Z[7]].L == 0 and (r[Z[7]].F == 0 and r[Z[7]].B == 0)) then
                                    Q = 1;
                                end;
                            end;
                        end;
                    end;
                    r[Z[15]](0);
                    CFrame.new(r[Z[4]].Position, r[Z[4]].Position + v3.LookVector);
                    if r[Z[1]].boostLevel >= 3 then
                        o = CFrame.new(r[Z[4]].Position, r[Z[4]].Position + v3[r[Z[2]][r[Z[3]](p, J)]]) * CFrame.Angles(math.rad(-15), 0, 0);
                    end;
                    if r[Z[9]].lastTiltDir == -1 then
                        o = CFrame.new(r[Z[4]].Position, r[Z[4]].Position + v3[r[Z[2]][r[Z[3]]("\xd5\xab\xce\xc0\xca\xc8\xec\x83\xf4!", J)]]) * CFrame.Angles(0, 0, math.rad(r[Z[16]].TILT_GYRO_ANGLE));
                    else
                        v = r[Z[2]];
                        if r[Z[9]].lastTiltDir == 1 then
                            o = CFrame.new(r[Z[4]].Position, r[Z[4]].Position + v3[r[Z[2]][r[Z[3]]("\xd5\xab\xce\xc0\xca\xc8\xec\x83\xf4!", J)]]) * CFrame.Angles(0, 0, math.rad(-r[Z[16]].TILT_GYRO_ANGLE));
                        else
                            if r[Z[9]].lastTiltDir == 2 then
                                o = CFrame.new(r[Z[4]].Position, r[Z[4]].Position + v3[r[Z[2]][r[Z[3]]("\xd5\xab\xce\xc0\xca\xc8\xec\x83\xf4!", J)]]) * CFrame.Angles(math.rad(r[Z[16]].BACK_TILT_ANGLE), 0, 0);
                            end;
                            v = r[Z[6]].CFrame;
                            r[Z[6]].CFrame = v.Lerp(v, CFrame.new(r[Z[4]].Position, r[Z[4]].Position + v3[r[Z[2]][r[Z[3]]("\xd5\xab\xce\xc0\xca\xc8\xec\x83\xf4!", J)]]), math.min(v1 * 4.5, 1));
                            r[Z[17]](v1);
                            r[Z[18]]();
                            return;
                        end;
                    end;
                end; 
            end);
            return; 
        end;
        ls[76] = nil;
        ls[104] = r33;
        ls[103] = function(arg1_132, ...)
            r408 = arg1_132;
            B = {
                pcall(function(...)
                    local Z = {
                        Z[1],
                        Z[2],
                        592
                    };
                    C = workspace.Terrain;
                    return C.GetMaterialColor(C, r[Z[3]]); 
                end)
            };
            if B[1] then
                return true, B[2];
            end;
            return false, nil; 
        end;
        ls[104][ls[105]] = ls[103];
        ls[108] = 548;
        ls[103] = 549;
        ls[104] = function(arg1_133, arg2_133, arg3_133, arg4_133, ...)
            local Z = {
                39,
                61,
                60,
                173,
                572,
                ls[97],
                214,
                217,
                ls[99]
            };
            v3 = arg3_133;
            r409 = arg2_133;
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            C = math.clamp;
            E = C;
            B = C(arg4_133 or 1, .65, 2.4);
            v4 = RaycastParams.new();
            v4.FilterDescendantsInstances = {
                r[Z[4]]
            };
            v4.FilterType = Enum.RaycastFilterType.Exclude;
            v4.RespectCanCollide = true;
            r410 = Enum.Material.Concrete;
            r411 = Color3.fromRGB(130, 130, 130);
            i = workspace;
            a = i.Raycast(i, r409 + Vector3.new(0, 2, 0), Vector3.new(0, -5, 0), v4);
            if a then
                S = r[Z[2]];
                if a.Instance == workspace.Terrain then
                    r410 = a.Material;
                    v2 = r[Z[5]].tryGetTerrainColor;
                    S = {
                        v2(a.Material)
                    };
                    if S[1] then
                        v2 = S[2];
                        r411 = v2;
                    else
                        Q = false;
                    end;
                else
                    S = a.Instance;
                    if S then
                        S = i.Raycast(i, v2, o, v4).Instance;
                        q = S.IsA(S, "BasePart");
                    end;
                    C = math.clamp;
                    if S then
                        r410 = a.Instance.Material;
                        r411 = a.Instance.Color;
                    end;
                end;
            end;
            r[Z[6]](arg1_133, r409, v3, B);
            r412 = RaycastParams.new();
            p = r[Z[7]];
            for h, p in ipairs(p.GetPlayers(p)) do
                X = h;
                if p.Character then
                    table.insert({
                        r[Z[4]]
                    }, p.Character);
                end; 
            end;
            t = {
                r[Z[4]]
            };
            r412.FilterDescendantsInstances = t;
            f = "\x89.\x97\x87\xcb\x1f\x84";
            I = r[Z[3]](f, 18229471265361);
            r412.FilterType = Enum.RaycastFilterType[r[Z[2]][I]];
            r412.RespectCanCollide = true;
            local function X(arg1_134, arg2_134, arg3_134, arg4_134, arg5_134, arg6_134, arg7_134, ...)
                local Z = {
                    Z[2],
                    Z[3],
                    574,
                    393,
                    270,
                    271,
                    Z[5],
                    Z[8],
                    Z[9]
                };
                E, g = arg6_134, arg2_134;
                v3 = arg3_134;
                r413 = arg7_134;
                B, R = arg4_134, arg5_134;
                O = "*\t";
                o = r[Z[2]](O, 4906076115417);
                C = math.random() * math[r[Z[1]][o]] * 2;
                for i = 1, g do
                    o = C + i / g * math.pi * 2 + (math.random() - 0.5) * math.pi * 2 / g * 0.5;
                    O = arg1_134 * (.9 + math.random() * 0.25);
                    C = workspace;
                    X = C.Raycast(C, Vector3.new(r[Z[3]].X + math.cos(o) * O, r[Z[3]].Y + 6, r[Z[3]].Z + math.sin(o) * O), Vector3.new(0, -14, 0), r[Z[4]]);
                    if X then
                        v = r[Z[5]];
                        t = r[Z[6]];
                        h = true;
                        I = r[Z[1]];
                        p = workspace.Terrain;
                        if X.Instance == p then
                            v = D.Material;
                            D = r[Z[7]].tryGetTerrainColor;
                            I = {
                                D(D.Material)
                            };
                            if I[1] then
                                D = I[2];
                                t = I[2];
                            else
                                h = false;
                            end;
                        else
                            p = D.Instance;
                            if p.IsA(p, "BasePart") then
                                v = D.Instance.Material;
                                t = D.Instance.Color;
                            end;
                            if true then
                                I = v3 + math.random() * (arg4_134 - v3);
                                r414 = I * (1.1 + math.random() * .6);
                                r415 = Instance.new("Part");
                                r415.Name = "IFlyCraterRock";
                                r415.Anchored = true;
                                r415.CanCollide = false;
                                r415.CanQuery = false;
                                r415.CanTouch = false;
                                r415.CastShadow = true;
                                Vg = r[Z[5]];
                                r415.Material = Vg;
                                Vg = r[Z[6]];
                                r415.Color = Vg;
                                r415.Size = Vector3.new(I, r414, I * (.55 + math.random() * .35));
                                Cg = D.Position;
                                r416 = CFrame.lookAt(Cg, Vector3.new(r[Z[3]].X, Cg.Y, r[Z[3]].Z)) * CFrame.Angles(math.rad(R + math.random() * (arg6_134 - R)), 0, 0) * CFrame.Angles(0, math.rad(math.random(-12, 12)), math.rad(math.random(-8, 8)));
                                r415.CFrame = r416 * CFrame.new(0, -(r414 + r413), 0);
                                r415.Parent = workspace;
                                task.delay(i / arg2_134 * .08 + math.random() * .05, function(...)
                                    local Z = {
                                        115,
                                        Z[1],
                                        Z[2],
                                        Z[8],
                                        116,
                                        114
                                    };
                                    if not r[Z[1]].Parent then
                                        return;
                                    end;
                                    C = r[Z[4]];
                                    D = C.Create(C, r[Z[1]], TweenInfo.new(.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                                        ["CFrame"] = r[Z[5]] * CFrame.new(0, -r[Z[6]] * .45, 0)
                                    });
                                    D.Play(D);
                                    return; 
                                end);
                                task.delay(r[Z[9]] + math.random() * 4, function(...)
                                    local Z = {
                                        115,
                                        Z[1],
                                        Z[2],
                                        Z[8],
                                        116,
                                        114,
                                        223
                                    };
                                    if not r[Z[1]].Parent then
                                        return;
                                    end;
                                    r[Z[1]].CanCollide = false;
                                    C = r[Z[4]];
                                    D = C.Create(C, r[Z[1]], TweenInfo.new(1.1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                                        ["CFrame"] = r[Z[5]] * CFrame.new(0, -(r[Z[6]] + r[Z[7]]), 0)
                                    });
                                    D.Play(D);
                                    task.delay(1.2, function(...)
                                        local Z = {
                                            wg
                                        };
                                        pcall(function(...)
                                            C = r[wg];
                                            C.Destroy(C);
                                            return; 
                                        end);
                                        return; 
                                    end);
                                    return; 
                                end);
                            end;
                        end;
                    end; 
                end;
                return; 
            end;
            if true then
                X(4.2 * B, math.clamp(math.floor(9 * B + 0.5), 6, 16), 1.6 * B, 2.6 * B, 18, 38, 2 * B);
                X(6.8 * B, math.clamp(math.floor(14 * B + 0.5), 9, 24), .8 * B, 1.5 * B, 30, 55, 1.5 * B);
            end;
            if true then
                h = math.clamp(math.floor(10 * B + 0.5), 6, 20);
            end;
            C = C;
            h = Q or 0;
            for p = 1, h do
                t = p;
                I = math.random() * math.pi * 2;
                f = (1.5 + math.random() * 2.5) * B;
                Cg = workspace;
                Vg = Cg.Raycast(Cg, Vector3.new(r409.X + math.cos(I) * f, r409.Y + 6, r409.Z + math.sin(I) * f), Vector3.new(0, -12, 0), r412);
                Zg = C;
                Cg, C = Vg and Vg.Position.Y, C;
                if Vg then
                    C = C;
                    if Vg then
                        Hg = r[Z[2]];
                        Dg = workspace.Terrain;
                        if Vg.Instance == Dg then
                            Zg = Vg.Material;
                            Ag = r[Z[5]].tryGetTerrainColor;
                            Hg = {
                                Ag(Vg.Material)
                            };
                            if Hg[1] then
                                Ag = Hg[2];
                                kg = Hg[2];
                            else
                                Pg = false;
                            end;
                        else
                            Dg = Vg.Instance;
                            if Dg.IsA(Dg, "BasePart") then
                                Zg = Vg.Instance.Material;
                                kg = Vg.Instance.Color;
                            end;
                        end;
                    end;
                    if true then
                        Hg = math.random(30, 70) / 100 * B;
                        r417 = Instance.new("Part");
                        r417.Name = "IFlyCraterChunk";
                        r417.Anchored = false;
                        r417.CanCollide = true;
                        r417.CanQuery = false;
                        r417.CastShadow = true;
                        bg = r410;
                        r417.Material = bg;
                        bg = r411;
                        r417.Color = bg;
                        r417.Size = Vector3.new(Hg, Hg * (.6 + math.random() * .8), Hg);
                        r417.CFrame = CFrame.new(r409.X + ug, (kg and Vg.Position.Y) + 1, r409.Z + wg) * CFrame.Angles(math.rad(math.random(0, 360)), math.rad(math.random(0, 360)), math.rad(math.random(0, 360)));
                        r417.Parent = workspace;
                        r417.AssemblyLinearVelocity = (Vector3.new(ug, 0, wg).Unit * math.random(18, 35) + Vector3.new(0, math.random(12, 26), 0)) * D;
                        r417.AssemblyAngularVelocity = Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15));
                        task.spawn(function(...)
                            local Z = {
                                Z[2],
                                Z[3],
                                73,
                                Z[8]
                            };
                            task.wait(8 + math.random() * 6);
                            if not r[Z[3]] or not r[Z[3]].Parent then
                                return;
                            end;
                            C = r[Z[4]];
                            D = C.Create(C, r[Z[3]], TweenInfo.new(1.2, Enum.EasingStyle.Linear), {
                                ["Transparency"] = 1
                            });
                            D.Play(D);
                            task.wait(1.3);
                            pcall(function(...)
                                C = r[Bg];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                    end;
                else
                    Cg = r409.Y;
                end; 
            end;
            r418 = Instance.new("Part");
            r418.Anchored = true;
            r418.CanCollide = false;
            r418.CanQuery = false;
            r418.Size = Vector3.new(1, 1, 1);
            r418.Transparency = 1;
            r418.CFrame = CFrame.new(r409 + v3.Unit * 0.5);
            r418.Parent = workspace;
            p = Instance.new("ParticleEmitter");
            p.Texture = "rbxasset://textures/particles/smoke_main.dds";
            p.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, r411),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 175, 170)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 215, 210))
            });
            p.LightEmission = .1;
            p.LightInfluence = .8;
            p.Size = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 2 * B),
                NumberSequenceKeypoint.new(0.5, 6 * B),
                NumberSequenceKeypoint.new(1, 0)
            });
            p.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, .2),
                NumberSequenceKeypoint.new(.6, .6),
                NumberSequenceKeypoint.new(1, 1)
            });
            p.Speed = NumberRange.new(4 * B, 12 * B);
            p.SpreadAngle = Vector2.new(55, 55);
            p.Lifetime = NumberRange.new(1.2, 2.8);
            p.Rate = 0;
            p.Parent = r418;
            p.Emit(p, math.floor(50 * B + 0.5));
            task.delay(4, function(...)
                pcall(function(...)
                    C = r[t];
                    C.Destroy(C);
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        r[ls[103]] = ls[104];
        ls[104] = 550;
        ls[106] = function(...)
            local Z = {
                ls[100],
                61,
                60,
                173,
                214,
                39,
                ls[101],
                43,
                38,
                ls[14],
                175,
                ls[104],
                215
            };
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            r419 = RaycastParams.new();
            R = r[Z[5]];
            for B, v4 in ipairs(R.GetPlayers(R)) do
                E = B;
                if v4.Character then
                    table.insert({
                        r[Z[4]]
                    }, v4.Character);
                end; 
            end;
            B = {
                r[Z[4]]
            };
            r419.FilterDescendantsInstances = B;
            r419.FilterType = Enum.RaycastFilterType.Exclude;
            r419.RespectCanCollide = true;
            local function r420(...)
                local Z = {
                    Z[6],
                    Z[2],
                    Z[3],
                    Z[1],
                    Z[7],
                    Z[8],
                    Z[9],
                    Z[10],
                    Z[11],
                    81,
                    Z[12]
                };
                if not r[Z[1]].flying then
                    return;
                end;
                if r[Z[4]].locked then
                    return;
                end;
                if r[Z[5]].locked then
                    return;
                end;
                if not r[Z[1]].crashEnabled then
                    return;
                end;
                if not r[Z[6]] or not r[Z[6]].Parent then
                    return;
                end;
                v1 = os.clock() - r[Z[1]].lastBoostedTime < 0.5;
                if not (r[Z[1]].boostLevel >= 1 or v1) then
                    return;
                end;
                B = {
                    r[Z[8]]()
                };
                v3 = B[2];
                B = B[1];
                if not B then
                    return;
                end;
                C = Vector3.new;
                if v3 then
                    v4 = v3.X;
                end;
                C = C;
                if v3 then
                    Q = v3.Z;
                end;
                C = C;
                C = C;
                C = workspace;
                E = C.Raycast(C, C(v3 or r[Z[9]].Position.X, B + 0.5, v3 or r[Z[9]].Position.Z), Vector3.new(0, -5, 0), r[Z[10]]);
                if not E then
                    return;
                end;
                D = E.Normal;
                if D.Dot(D, Vector3.new(0, 1, 0)) < 0.75 then
                    return;
                end;
                C = E.Instance ~= workspace.Terrain;
                if C then
                    D = E.Instance;
                    if not D.IsA(D, "BasePart") then
                        return;
                    end;
                    if not E.Instance.CanCollide then
                        return;
                    end;
                    if E.Instance.Transparency >= .95 then
                        return;
                    end;
                end;
                M, i = C, C;
                a = r[Z[1]].boostLevel >= 1;
                Q = a;
                if a then
                    C = C;
                    C = C;
                    if B[1] - E.Position.Y > (Q and r[Z[7]].CRASH_CONTACT_THRESHOLD * 2.4 or r[Z[7]].CRASH_CONTACT_THRESHOLD) then
                        return;
                    end;
                    if r[Z[4]].conn then
                        C = r[Z[4]].conn;
                        C.Disconnect(C);
                        r[Z[4]].conn = nil;
                    end;
                    r[Z[11]](E.Instance, E.Position, E.Normal);
                    return;
                else
                    Q = os.clock() - r[Z[1]].lastBoostedTime < 0.5;
                end; 
            end;
            C = r[Z[13]].Heartbeat;
            B = C.Connect(C, function(...)
                r420();
                return; 
            end);
            r[Z[1]].conn = B;
            if r[Z[11]] then
                C = r[Z[11]].Touched;
                r421 = C.Connect(C, function(arg1_135, ...)
                    local Z = {
                        Z[6],
                        Z[2],
                        Z[3],
                        Z[1],
                        Z[8],
                        Z[9],
                        Z[10],
                        Z[11],
                        81,
                        205,
                        Z[12]
                    };
                    v1 = arg1_135;
                    if not r[Z[1]].flying or (r[Z[4]].locked or not r[Z[1]].crashEnabled) then
                        return;
                    end;
                    if not v1 or not v1.Parent then
                        return;
                    end;
                    if not v1.CanCollide then
                        return;
                    end;
                    if not (r[Z[1]].boostLevel >= 1 or os.clock() - r[Z[1]].lastBoostedTime < 0.5) then
                        return;
                    end;
                    R = {
                        r[Z[7]]()
                    };
                    B = R[2];
                    R = R[1];
                    if not R then
                        return;
                    end;
                    C = Vector3.new;
                    v4 = C;
                    E, C = B and B.X, C;
                    if B then
                        Q = C;
                        v4 = R + 0.5;
                        if B then
                            i = R[2].Z;
                        end;
                        C, M = C, B;
                        if B then
                            C = workspace;
                            v4 = C.Raycast(C, Q(M and B.X, R + 0.5, i), Vector3.new(0, -3, 0), r[Z[9]]);
                            if not v4 then
                                return;
                            end;
                            D = v4.Normal;
                            if D.Dot(D, Vector3.new(0, 1, 0)) < 0.75 then
                                return;
                            end;
                            i = workspace.Terrain;
                            if v4.Instance ~= i and i.IsA(i, "BasePart") then
                                return;
                            end;
                            if R[1] - v4.Position.Y > r[Z[6]].CRASH_CONTACT_THRESHOLD + 0.5 then
                                return;
                            end;
                            C = r[Z[10]];
                            C.Disconnect(C);
                            if r[Z[4]].conn then
                                C = r[Z[4]].conn;
                                C.Disconnect(C);
                                r[Z[4]].conn = nil;
                            end;
                            r[Z[11]](v4.Instance, v4.Position, v4.Normal);
                            return;
                        else
                            M = r[Z[8]].Position.Z;
                        end;
                    else
                        E = r[Z[8]].Position.X;
                    end; 
                end);
                r422 = r[Z[1]].conn;
                r[Z[1]].conn = {
                    ["Disconnect"] = function(...)
                        pcall(function(...)
                            C = r[M];
                            C.Disconnect(C);
                            return; 
                        end);
                        pcall(function(...)
                            C = r[E];
                            C.Disconnect(C);
                            return; 
                        end);
                        return; 
                    end
                };
            end;
            return; 
        end;
        ls[105] = function(arg1_136, arg2_136, arg3_136, ...)
            local Z = {
                ls[100],
                61,
                60,
                ls[101],
                572,
                444,
                175,
                43,
                39,
                42,
                51,
                ls[9],
                ls[17],
                ls[26],
                ls[32],
                ls[35],
                ls[39],
                ls[52],
                445,
                174,
                ls[18],
                ls[28],
                ls[57],
                ls[31],
                ls[33],
                ls[103],
                ls[46],
                38,
                217,
                ls[45],
                215,
                438,
                173,
                ls[20]
            };
            g, v1 = arg2_136, arg1_136;
            if r[Z[1]].locked then
                return;
            end;
            if r[Z[4]].locked then
                return;
            end;
            if v1 ~= workspace.Terrain then
                if not v1 or not v1.IsA(v1, "BasePart") then
                    return;
                end;
                if not v1.CanCollide then
                    return;
                end;
            end;
            r[Z[1]].locked = true;
            pcall(r[Z[5]].maybeShowCrashHint);
            C = r[Z[6]];
            C(.4);
            C = C;
            C = C;
            if r[Z[8]] and r[Z[8]].Parent then
                math.max(r[Z[7]] and r[Z[7]].AssemblyLinearVelocity.Magnitude or 0, r[Z[8]].Velocity.Magnitude);
            end;
            E = math.clamp(.3 + r[Z[9]].boostLevel * .3 + (r[Z[7]] and r[Z[7]].AssemblyLinearVelocity.Magnitude or 0) / 400, .65, 2.4);
            if r[Z[1]].conn then
                D = r[Z[1]].conn;
                D.Disconnect(D);
                r[Z[1]].conn = nil;
            end;
            r[Z[9]].flying = false;
            r[Z[9]].transitioning = false;
            r[Z[9]].boostLevel = 0;
            r[Z[9]].speedScale = 1;
            r[Z[9]].isCharging = false;
            r[Z[10]].F = 0;
            r[Z[10]].B = 0;
            r[Z[10]].L = 0;
            r[Z[10]].R = 0;
            r[Z[10]].U = 0;
            r[Z[10]].D = 0;
            for s = #r[Z[11]], 1, -1 do
                r423 = v4;
                pcall(function(...)
                    local Z = {
                        Z[11],
                        356
                    };
                    C = r[Z[1]][r[Z[2]]];
                    C.Disconnect(C);
                    return; 
                end);
                table.remove(r[Z[11]], r423); 
            end;
            if r[Z[9]].isFirstPerson then
                r[Z[12]]();
            end;
            r[Z[13]]();
            r[Z[14]]();
            r[Z[15]]();
            r[Z[16]]();
            r[Z[17]]();
            r[Z[18]]();
            r[Z[19]]();
            r[Z[7]].AssemblyLinearVelocity = Vector3.zero;
            r[Z[7]].AssemblyAngularVelocity = Vector3.zero;
            v4 = workspace.CurrentCamera.CFrame.LookVector;
            r424 = Vector3.new(v4.X, 0, v4.Z);
            if r424.Magnitude < .01 then
                r424 = Vector3.new(0, 0, -1);
            end;
            r424 = r424.Unit;
            r425 = Vector3.new(g.X, g.Y + 3.1, g.Z);
            r[Z[7]].CFrame = CFrame.new(r425, r425 + r424);
            r426 = Instance.new("BodyPosition");
            r426.Name = "CrashBP";
            r426.Position = r425;
            r426.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
            r426.P = 100000;
            r426.D = 5000;
            r426.Parent = r[Z[7]];
            r427 = Instance.new("BodyGyro");
            r427.Name = "CrashBG";
            r427.CFrame = CFrame.new(r425, r425 + r424);
            r427.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000);
            r427.P = 100000;
            r427.D = 5000;
            r427.Parent = r[Z[7]];
            r[Z[20]].WalkSpeed = 0;
            r[Z[20]].JumpPower = 0;
            r[Z[20]].PlatformStand = false;
            r[Z[20]].AutoRotate = false;
            r[Z[21]]();
            r[Z[22]].trauma = math.min(.4 + E * 0.5, 1.6);
            r[Z[22]].shakeUntil = os.clock() + 3.5;
            r[Z[23]](0.75, .02, .9);
            r[Z[24]]();
            r[Z[25]]();
            r[Z[26]](v1, g, arg3_136, E);
            task.spawn(function(...)
                local Z = {
                    Z[9],
                    Z[2],
                    Z[3],
                    Z[27],
                    Z[28],
                    Z[29],
                    Z[30]
                };
                if not r[Z[1]].sfxEnabled then
                    return;
                end;
                r428 = r[Z[4]](r[Z[5]].CRASH_SOUND_ID, false, 0);
                r428.TimePosition = 2.4;
                C = r428;
                C.Play(C);
                C = r[Z[6]];
                D = C.Create(C, r428, TweenInfo.new(.1), {
                    ["Volume"] = r[Z[7]](1)
                });
                D.Play(D);
                C = r428.Ended;
                C.Connect(C, function(...)
                    pcall(function(...)
                        C = r[v1];
                        C.Destroy(C);
                        return; 
                    end);
                    return; 
                end);
                return; 
            end);
            task.spawn(function(...)
                local Z = {
                    Z[31],
                    Z[2],
                    Z[3],
                    Z[32],
                    Z[28],
                    Z[33],
                    10,
                    Z[7],
                    424,
                    11,
                    12,
                    Z[5],
                    Z[9],
                    Z[20],
                    Z[1],
                    Z[6],
                    Z[15],
                    Z[16],
                    Z[34]
                };
                C = r[Z[1]].Heartbeat;
                C.Wait(C);
                C = r[Z[1]].Heartbeat;
                C.Wait(C);
                r429 = r[Z[4]](r[Z[5]].CRASH_ANIM_ID);
                r429.Looped = false;
                r429.Priority = Enum.AnimationPriority.Action4;
                C = r429;
                C.Play(C, 0);
                v3 = r429.Length <= 0;
                D = 0 < 20;
                while not v3 do
                    if v3 then
                        C = r[Z[1]].Heartbeat;
                        C.Wait(C);
                        g = g + 1;
                    end;
                    v3 = 0;
                    pcall(function(...)
                        local Z = {
                            266,
                            Z[2],
                            Z[3]
                        };
                        r[Z[1]].TimePosition = 3;
                        return; 
                    end);
                    task.wait(math.max(1, (r429.Length > 0 and r429.Length or 6) - 3));
                    pcall(function(...)
                        C = r429;
                        C.Stop(C, .3);
                        return; 
                    end);
                    R = RaycastParams.new();
                    R.FilterDescendantsInstances = {
                        r[Z[6]]
                    };
                    R.FilterType = Enum.RaycastFilterType.Exclude;
                    R.RespectCanCollide = true;
                    D = workspace;
                    E = D.Raycast(D, Vector3.new(r[Z[7]].X, r[Z[7]].Y + 3, r[Z[7]].Z), Vector3.new(0, -8, 0), R);
                    if E then
                        M = Vector3.new(r[Z[7]].X, E.Position.Y + 3.1, r[Z[7]].Z);
                        r[Z[8]].CFrame = CFrame.new(M, M + r[Z[9]]);
                    end;
                    pcall(function(...)
                        C = r[v2];
                        C.Destroy(C);
                        return; 
                    end);
                    pcall(function(...)
                        C = r[q];
                        C.Destroy(C);
                        return; 
                    end);
                    D = r[Z[1]].Heartbeat;
                    D.Wait(D);
                    C = 0;
                    if r[Z[12]].killed or (r[Z[13]].isDead or (not r[Z[14]] or (not r[Z[14]].Parent or r[Z[14]].Health <= 0))) then
                        r[Z[15]].locked = false;
                        r[Z[13]].transitioning = false;
                        return;
                    end;
                    r[Z[14]].WalkSpeed = 16;
                    r[Z[14]].JumpPower = 50;
                    r[Z[14]].PlatformStand = false;
                    r[Z[14]].AutoRotate = true;
                    r[Z[16]](.8);
                    r[Z[17]]();
                    r[Z[18]]();
                    r[Z[19]]();
                    r[Z[15]].locked = false;
                    r[Z[13]].transitioning = false;
                    return; 
                end;
                D = 0 < 20; 
            end);
            return; 
        end;
        r[ls[104]] = ls[105];
        ls[105] = 551;
        r[ls[105]] = ls[106];
        ls[106] = 552;
        r[ls[106]] = ls[107];
        ls[107] = {};
        r[ls[108]] = ls[107];
        ls[107] = {};
        ls[111] = function(arg1_137, ...)
            local Z = {
                173,
                174,
                ls[108],
                ls[109],
                61,
                60,
                53,
                440,
                215,
                572,
                ls[110],
                175
            };
            r430 = arg1_137;
            if not r[Z[1]] or not r[Z[2]] then
                return;
            end;
            C = {};
            r[Z[3]] = C;
            r[Z[4]] = {};
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[5],
                    Z[6]
                };
                C = r[Z[1]];
                C.ChangeState(C, Enum.HumanoidStateType.Physics);
                return; 
            end);
            if r[Z[7]].active then
                pcall(function(...)
                    local Z = {
                        Z[7],
                        Z[5],
                        Z[6]
                    };
                    C = r[Z[1]].active;
                    C.Stop(C, 0);
                    return; 
                end);
                r[Z[7]].active = nil;
            end;
            if r[Z[7]].replicated then
                pcall(function(...)
                    local Z = {
                        Z[7],
                        Z[5],
                        Z[6]
                    };
                    C = r[Z[1]].replicated;
                    C.Stop(C, 0);
                    return; 
                end);
                r[Z[7]].replicated = nil;
            end;
            if r[Z[8]] then
                pcall(function(...)
                    C = r[js];
                    C.Disconnect(C);
                    return; 
                end);
                r[Z[8]] = nil;
            end;
            v4 = r[Z[6]];
            v3 = r[Z[9]].Heartbeat;
            r[Z[11]] = v3.Connect(v3, function(...)
                local Z = {
                    Z[10],
                    Z[5],
                    Z[6],
                    Z[11],
                    Z[2]
                };
                C = r[Z[1]].killed;
                if C then
                    if r[Z[4]] then
                        C = r[Z[4]];
                        C.Disconnect(C);
                        r[Z[4]] = nil;
                    end;
                    return;
                end;
                C = C;
                if not r[Z[5]] or (not r[Z[5]].Parent or (r[Z[5]].Health <= 0 or v4.GetState(v4) == Enum.HumanoidStateType.Dead)) then
                    if r[Z[4]] then
                        D = r[Z[4]];
                        D.Disconnect(D);
                        r[Z[4]] = nil;
                    end;
                    return;
                end;
                pcall(function(...)
                    local Z = {
                        Z[5],
                        Z[2],
                        Z[3]
                    };
                    C = r[Z[1]];
                    C.ChangeState(C, Enum.HumanoidStateType.Physics);
                    return; 
                end);
                return; 
            end);
            r[Z[2]].PlatformStand = true;
            r[Z[2]].AutoRotate = false;
            M = r[Z[1]];
            Q = {
                M.GetDescendants(M)
            };
            for v4, M in ipairs(x(Q)) do
                r431 = M;
                Q = r431;
                v3 = v4;
                if Q.IsA(Q, "BasePart") then
                    table.insert(r[Z[4]], {
                        ["part"] = r431,
                        ["wasCanCollide"] = r431.CanCollide
                    });
                    if r431.Name ~= "HumanoidRootPart" then
                        pcall(function(...)
                            local Z = {
                                125,
                                Z[5],
                                Z[6]
                            };
                            r[Z[1]].CanCollide = true;
                            return; 
                        end);
                    end;
                end; 
            end;
            M = r[Z[1]];
            Q = {
                M.GetDescendants(M)
            };
            for v4, M in ipairs(x(Q)) do
                v3 = v4;
                r432 = M;
                Q = r432;
                if Q.IsA(Q, "Motor6D") then
                    pcall(function(...)
                        local Z = {
                            322,
                            Z[5],
                            Z[6]
                        };
                        r[Z[1]].Enabled = false;
                        return; 
                    end);
                    table.insert(r[Z[3]], r432);
                end; 
            end;
            C = C;
            if r430 and r430.Magnitude > 0 then
                M = r[Z[1]];
                Q = {
                    M.GetDescendants(M)
                };
                for v4, M in ipairs(x(Q)) do
                    v3 = v4;
                    r433 = M;
                    Q = r433;
                    if Q.IsA(Q, "BasePart") then
                        r434 = r433.Position - r[Z[12]].Position;
                        pcall(function(...)
                            local Z = {
                                317,
                                Z[5],
                                Z[6],
                                149,
                                201
                            };
                            r[Z[1]].AssemblyLinearVelocity = r[Z[4]] + Vector3.new((math.random() - 0.5) * r[Z[5]].Magnitude * .6, (math.random() - 0.5) * r[Z[5]].Magnitude * .3, (math.random() - 0.5) * r[Z[5]].Magnitude * .6);
                            return; 
                        end);
                    end; 
                end;
            end;
            return; 
        end;
        r[ls[109]] = ls[107];
        ls[107] = nil;
        r[ls[110]] = ls[107];
        ls[107] = 553;
        r[ls[107]] = ls[111];
        ls[111] = 554;
        ls[112] = function(...)
            local Z = {
                ls[110],
                ls[108],
                61,
                60,
                ls[109],
                174,
                ls[20]
            };
            C = r[Z[1]];
            if C then
                C = r[Z[1]];
                C.Disconnect(C);
                r[Z[1]] = nil;
            end;
            for v3, R in ipairs(r[Z[2]]) do
                B = v3;
                r435 = R;
                pcall(function(...)
                    local Z = {
                        D,
                        Z[3],
                        Z[4]
                    };
                    r[Z[1]].Enabled = true;
                    return; 
                end); 
            end;
            r[Z[2]] = {};
            R = r[Z[5]];
            for B, R in ipairs(R) do
                r436 = R;
                R, v1 = 326, B;
                pcall(function(...)
                    local Z = {
                        326,
                        Z[3],
                        Z[4]
                    };
                    r[Z[1]].part.CanCollide = r[Z[1]].wasCanCollide;
                    return; 
                end); 
            end;
            r[Z[5]] = {};
            B = r[Z[6]];
            if B then
                g = r[Z[6]].Parent;
            end;
            C = C;
            if B then
                r[Z[6]].PlatformStand = false;
                r[Z[6]].AutoRotate = true;
                R = r[Z[6]].Health;
                C = C;
                if R > 0 and R.GetState(R) ~= Enum.HumanoidStateType.Dead then
                    pcall(function(...)
                        local Z = {
                            Z[6],
                            Z[3],
                            Z[4]
                        };
                        C = r[Z[1]];
                        C.ChangeState(C, Enum.HumanoidStateType.GettingUp);
                        return; 
                    end);
                    r[ls[20]]();
                end;
            end;
            return; 
        end;
        ls[113] = function(arg1_138, arg2_138, arg3_138, arg4_138, ...)
            local Z = {
                39,
                61,
                60,
                ls[97]
            };
            if not r[Z[1]].vfxEnabled then
                return;
            end;
            B = math.clamp(arg4_138, 0.5, 2.4);
            r[Z[4]](arg1_138, arg2_138, arg3_138, B);
            return; 
        end;
        r[ls[111]] = ls[112];
        ls[112] = 555;
        r[ls[112]] = ls[113];
        ls[113] = 556;
        r[ls[113]] = ls[114];
        ls[115] = function(arg1_139, arg2_139, arg3_139, arg4_139, ...)
            local Z = {
                ls[101],
                61,
                60,
                ls[100],
                572,
                175,
                ls[102],
                39,
                42,
                51,
                ls[9],
                ls[26],
                ls[32],
                ls[35],
                ls[39],
                ls[52],
                444,
                43,
                ls[17],
                445,
                ls[18],
                174,
                38,
                ls[57],
                ls[28],
                ls[31],
                ls[33],
                ls[45],
                ls[112],
                173,
                ls[113],
                ls[107],
                ls[111],
                ls[20]
            };
            v3, g = arg3_139, arg2_139;
            v1 = arg1_139;
            B = arg4_139;
            if r[Z[1]].locked then
                return;
            end;
            if v1 ~= workspace.Terrain then
                if not v1 or not v1.IsA(v1, "BasePart") then
                    return;
                end;
                if not v1.CanCollide then
                    return;
                end;
                if v1.Transparency >= .95 then
                    return;
                end;
            end;
            r[Z[1]].locked = true;
            r[Z[4]].locked = true;
            C = pcall;
            C(r[Z[5]].maybeShowCrashHint);
            R = r[Z[6]] and r[Z[6]].AssemblyLinearVelocity;
            C, D = C, R;
            if R then
                R = R;
                E = math.clamp(.4 + B / 300, 0.5, 2.4);
                v4 = math.clamp(.4 + B / 100, .6, 4);
                if r[Z[4]].conn then
                    C = r[Z[4]].conn;
                    C.Disconnect(C);
                    r[Z[4]].conn = nil;
                end;
                r[Z[7]]();
                r[Z[1]].locked = true;
                r[Z[8]].flying = false;
                r[Z[8]].transitioning = false;
                r[Z[8]].boostLevel = 0;
                r[Z[8]].speedScale = 1;
                r[Z[8]].isCharging = false;
                r[Z[9]].F = 0;
                r[Z[9]].B = 0;
                r[Z[9]].L = 0;
                r[Z[9]].R = 0;
                r[Z[9]].U = 0;
                r[Z[9]].D = 0;
                for M = #r[Z[10]], 1, -1 do
                    r437 = M;
                    pcall(function(...)
                        local Z = {
                            Z[10],
                            117
                        };
                        C = r[Z[1]][r[Z[2]]];
                        C.Disconnect(C);
                        return; 
                    end);
                    table.remove(r[Z[10]], r437); 
                end;
                if r[Z[8]].isFirstPerson then
                    r[ls[9]]();
                end;
                r[Z[12]]();
                r[Z[13]]();
                r[Z[14]]();
                r[Z[15]]();
                r[Z[16]]();
                r[Z[17]](0);
                if r[Z[6]] and r[Z[6]].Parent then
                    r[Z[6]].AssemblyLinearVelocity = Vector3.zero;
                    r[Z[6]].AssemblyAngularVelocity = Vector3.zero;
                end;
                if r[Z[18]] and r[Z[18]].Parent then
                    r[Z[18]].Velocity = Vector3.zero;
                end;
                r[Z[19]]();
                r[Z[20]]();
                r[Z[21]]();
                r[Z[22]].AutoRotate = false;
                Q = math.clamp(B / (r[Z[23]].BOOST_SPEEDS[#r[Z[23]].BOOST_SPEEDS] or 600), 0, 1);
                r[Z[24]](r[Z[23]].WALL_FLASH_MIN_ALPHA + (r[Z[23]].WALL_FLASH_MAX_ALPHA - r[Z[23]].WALL_FLASH_MIN_ALPHA) * Q, .02, r[Z[23]].WALL_FLASH_MIN_DURATION + (r[Z[23]].WALL_FLASH_MAX_DURATION - r[Z[23]].WALL_FLASH_MIN_DURATION) * Q);
                r[Z[25]].trauma = math.min(1 + Q * .6, 1.6);
                r[Z[8]].fpShakeTrauma = math.min(1 + Q * .6, 1.6);
                r[Z[25]].shakeUntil = os.clock() + v4 + 0.5;
                r[Z[26]]();
                r[Z[27]]();
                if r[Z[8]].sfxEnabled then
                    local function v2(arg1_140, arg2_140, arg3_140, ...)
                        local Z = {
                            Z[2],
                            Z[3],
                            Z[6]
                        };
                        r438 = Instance.new("Sound");
                        R = arg1_140;
                        r438.SoundId = R;
                        R = arg2_140;
                        r438.PlaybackSpeed = R;
                        R = arg3_140;
                        r438.Volume = R;
                        r438.Looped = false;
                        r438.Parent = r[Z[3]];
                        C = r438;
                        C.Play(C);
                        C = r438.Ended;
                        C.Connect(C, function(...)
                            pcall(function(...)
                                C = r[B];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                        task.delay(20, function(...)
                            pcall(function(...)
                                C = r[B];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                        return; 
                    end;
                    v2(r[Z[23]].WALL_SFX_FLASHBANG, .7, r[Z[28]](1));
                    v2(r[Z[23]].WALL_SFX_IMPACT_EXTRA, 1, r[Z[28]](.6));
                end;
                r[Z[29]](arg1_139, g, v3, E);
                v2 = Enum.Material.Concrete;
                q = Color3.fromRGB(140, 134, 128);
                O = RaycastParams.new();
                O.FilterDescendantsInstances = {
                    r[Z[30]]
                };
                O.FilterType = Enum.RaycastFilterType.Exclude;
                D = workspace;
                S = D.Raycast(D, g + v3 * 0.5, -v3 * 2, O);
                if S then
                    v = "Terrain";
                    Y = workspace[v];
                    if S.Instance == Y then
                        v2 = D.Raycast(D, v5, Y, O).Material;
                        v5 = r[Z[5]].tryGetTerrainColor;
                        v = {
                            v5(v2)
                        };
                        if v[1] then
                            v5 = v[2];
                            q = v[2];
                        else
                            o = false;
                        end;
                    else
                        Y = S.Instance;
                        if Y.IsA(Y, "BasePart") then
                            v2 = S.Instance.Material;
                            q = S.Instance.Color;
                        end;
                    end;
                end;
                if true then
                    r[Z[31]](g, v3, E, v2, q, 4.2 * E, math.clamp(math.floor(9 * E + 0.5), 6, 16), 1.6 * E, 2.6 * E, 18, 38, 1.2 * E);
                    r[Z[31]](g, v3, E, v2, q, 6.8 * E, math.clamp(math.floor(14 * E + 0.5), 9, 24), .8 * E, 1.5 * E, 30, 55, .8 * E);
                end;
                if r[Z[8]].vfxEnabled then
                    r439 = Instance.new("Part");
                    r439.Anchored = true;
                    r439.CanCollide = false;
                    r439.CanQuery = false;
                    r439.Size = Vector3.new(1, 1, 1);
                    r439.Transparency = 1;
                    r439.CFrame = CFrame.new(arg2_139 + arg3_139 * .3);
                    r439.Parent = workspace;
                    J = Instance.new("ParticleEmitter");
                    J.Texture = "rbxasset://textures/particles/smoke_main.dds";
                    J.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, q),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 175, 170)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 215, 210))
                    });
                    J.LightEmission = .1;
                    J.LightInfluence = .8;
                    J.Size = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 2 * E),
                        NumberSequenceKeypoint.new(0.5, 5 * E),
                        NumberSequenceKeypoint.new(1, 0)
                    });
                    J.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, .2),
                        NumberSequenceKeypoint.new(.6, .6),
                        NumberSequenceKeypoint.new(1, 1)
                    });
                    J.Speed = NumberRange.new(4 * E, 12 * E);
                    J.SpreadAngle = Vector2.new(65, 65);
                    J.Lifetime = NumberRange.new(.8, 2.2);
                    J.Rate = 0;
                    J.Parent = r439;
                    J.Emit(J, math.floor(40 * E));
                    task.delay(3.5, function(...)
                        pcall(function(...)
                            C = r[h];
                            C.Destroy(C);
                            return; 
                        end);
                        return; 
                    end);
                end;
                p = math.clamp(B * .12, 4, 28);
                r[Z[32]](v3 * p + Vector3.new(0, p * .22, 0));
                task.delay(v4, function(...)
                    local Z = {
                        Z[5],
                        Z[2],
                        Z[3],
                        Z[8],
                        Z[33],
                        Z[22],
                        Z[34],
                        Z[17],
                        Z[13],
                        Z[14],
                        Z[1],
                        Z[4]
                    };
                    if r[Z[1]].killed or r[Z[4]].isDead then
                        return;
                    end;
                    pcall(function(...)
                        r[Z[33]]();
                        return; 
                    end);
                    if r[Z[6]] and (r[Z[6]].Parent and r[Z[6]].Health > 0) then
                        r[Z[6]].WalkSpeed = 16;
                        r[Z[6]].JumpPower = 50;
                        r[Z[6]].AutoRotate = true;
                        r[Z[7]]();
                    end;
                    r[Z[8]](0.5);
                    r[Z[9]]();
                    r[Z[10]]();
                    r[Z[11]].locked = false;
                    r[Z[12]].locked = false;
                    r[Z[4]].transitioning = false;
                    return; 
                end);
                return;
            else
                D = Vector3.zero;
            end; 
        end;
        ls[114] = 557;
        r[ls[114]] = ls[115];
        ls[115] = 558;
        ls[116] = function(...)
            local Z = {
                ls[101],
                61,
                60,
                175,
                173,
                214,
                215,
                39,
                43,
                ls[114]
            };
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            if not r[Z[4]] then
                return;
            end;
            r440 = RaycastParams.new();
            R = r[Z[6]];
            for B, v4 in ipairs(R.GetPlayers(R)) do
                E = B;
                if v4.Character then
                    table.insert({
                        r[Z[5]]
                    }, v4.Character);
                end; 
            end;
            B = {
                r[Z[5]]
            };
            r440.FilterDescendantsInstances = B;
            r440.FilterType = Enum.RaycastFilterType.Exclude;
            r440.RespectCanCollide = true;
            B = r[Z[7]].Heartbeat;
            r[Z[1]].conn = B.Connect(B, function(arg1_141, ...)
                local Z = {
                    Z[8],
                    Z[2],
                    Z[3],
                    Z[1],
                    Z[9],
                    Z[4],
                    423,
                    Z[10]
                };
                if not r[Z[1]].flying then
                    return;
                end;
                if r[Z[4]].locked then
                    return;
                end;
                if not r[Z[1]].wallImpactEnabled then
                    return;
                end;
                if not r[Z[5]] or not r[Z[5]].Parent then
                    return;
                end;
                g = r[Z[5]].Velocity.Magnitude;
                if g < 30 then
                    return;
                end;
                if r[Z[1]].boostLevel < 1 and not (os.clock() - r[Z[1]].lastBoostedTime < 0.5) then
                    return;
                end;
                B = r[Z[5]].Velocity.Unit;
                C = workspace;
                E = C.Raycast(C, r[Z[6]].Position, B * math.max(2.5, g * arg1_141 * 1.5), r[Z[7]]);
                if not E then
                    return;
                end;
                v4 = E.Normal;
                if math.abs(v4.Y) > .7 and v4.Y > 0 then
                    return;
                end;
                if E.Instance ~= workspace.Terrain then
                    D = E.Instance;
                    if not D.IsA(D, "BasePart") then
                        return;
                    end;
                    if not E.Instance.CanCollide then
                        return;
                    end;
                    if E.Instance.Transparency >= .95 then
                        return;
                    end;
                end;
                if -B.Dot(B, v4) < 0.25 then
                    return;
                end;
                C = r[Z[4]].conn;
                C.Disconnect(C);
                r[Z[4]].conn = nil;
                r[Z[8]](E.Instance, E.Position, E.Normal, g);
                return; 
            end);
            return; 
        end;
        r[ls[115]] = ls[116];
        ls[116] = function(...)
            local Z = {
                ls[101],
                61,
                60
            };
            if r[Z[1]].conn then
                C = r[Z[1]].conn;
                C.Disconnect(C);
                r[Z[1]].conn = nil;
            end;
            r[Z[1]].locked = false;
            return; 
        end;
        r[ls[102]] = ls[116];
        ls[3] = nil;
        r[ls[118]] = ls[117];
        ls[117] = 559;
        r[ls[117]] = ls[119];
        ls[93] = nil;
        ls[119] = 560;
        r[ls[119]] = ls[120];
        ls[120] = 561;
        ls[121] = function(arg1_142, ...)
            local Z = {
                ls[15],
                175,
                61,
                60,
                ls[17],
                174,
                445,
                173,
                52,
                ls[14],
                215,
                38,
                ls[119],
                ls[28]
            };
            r441 = arg1_142;
            C = r[Z[1]];
            r442 = C();
            C = C;
            if not r442 or (r442 and r[Z[2]].Position.Y - r442 or math.huge) > 50 then
                r[Z[5]]();
                r[Z[6]].PlatformStand = false;
                r[Z[6]].AutoRotate = true;
                r[Z[7]]();
                if r441 then
                    r441();
                end;
                return;
            end;
            r443 = {};
            v4 = r[Z[8]];
            for E, Q in ipairs(v4.GetDescendants(v4)) do
                r444 = Q;
                M = E;
                a = r[C];
                v2 = a.IsA(a, "BasePart");
                if v2 then
                    i = r[C].CanCollide;
                end;
                if v2 then
                    r443[#r443 + 1] = r[C];
                    pcall(function(...)
                        local Z = {
                            C,
                            Z[3],
                            Z[4]
                        };
                        r[Z[1]].CanCollide = false;
                        return; 
                    end);
                end; 
            end;
            local function r445(...)
                local Z = {
                    391,
                    Z[3],
                    Z[4]
                };
                v3 = r[Z[1]];
                for g, R in ipairs(D) do
                    r446 = R;
                    pcall(function(...)
                        local Z = {
                            323,
                            Z[2],
                            Z[3]
                        };
                        if r[Z[1]].Parent then
                            r[Z[1]].CanCollide = true;
                        end;
                        return; 
                    end); 
                end;
                r[Z[1]] = {};
                return; 
            end;
            C = r[Z[9]];
            if not (r447 and ) then
                v4 = r[Z[2]].CFrame.LookVector;
                M = Vector3.new(v4.X, 0, v4.Z);
                if M.Magnitude < .01 then
                    Vector3.new(0, 0, -1);
                end;
                r447 = CFrame.new(Vector3.zero, M.Unit);
            end;
            r[Z[5]]();
            r[Z[6]].WalkSpeed = 0;
            r[Z[6]].JumpPower = 0;
            r[Z[6]].PlatformStand = true;
            r[Z[6]].AutoRotate = false;
            r448 = Instance.new("BodyVelocity");
            r448.Name = "IFlyLandBV";
            r448.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
            r448.Velocity = Vector3.zero;
            r448.Parent = r[Z[2]];
            r449 = Instance.new("BodyGyro");
            r449.Name = "IFlyLandGyro";
            r449.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000);
            r449.P = 50000;
            r449.D = 1000;
            r449.CFrame = CFrame.new(r[Z[2]].Position) * r447;
            r449.Parent = r[Z[2]];
            C = false;
            r450 = C;
            O = r[Z[10]]();
            q = O;
            if O then
                r451 = O;
                C = r[Z[11]].Heartbeat;
                r452 = C.Connect(C, function(...)
                    local Z = {
                        105,
                        Z[2],
                        Z[3],
                        Z[4],
                        209,
                        427,
                        104,
                        426,
                        Z[10],
                        208,
                        Z[1],
                        231,
                        Z[12],
                        103,
                        Z[13],
                        Z[14],
                        Z[7],
                        230
                    };
                    if r[Z[1]] then
                        return;
                    end;
                    if not r[Z[2]] or not r[Z[2]].Parent then
                        C = r[Z[5]];
                        C.Disconnect(C);
                        r[Z[6]]();
                        return;
                    end;
                    R = r[Z[2]];
                    v3 = CFrame.new(R.Position);
                    r[Z[7]].CFrame = v3 * r[Z[8]];
                    v1 = r[Z[9]];
                    g = v1();
                    D = g;
                    if g then
                        v1 = D;
                        C = r[Z[11]];
                        v3 = C(nil, math.max(v1, r[Z[10]]) + 1);
                        if v3 then
                            C = D;
                            r442 = C;
                        end;
                        r[Z[10]] = v1;
                        R = v1 - r[Z[12]];
                        M = r[Z[13]];
                        if R <= M.LAND_FOOT_THRESHOLD then
                            r[Z[1]] = true;
                            v4 = r[Z[5]];
                            v4.Disconnect(v4);
                            r[Z[6]]();
                            M = math.abs(r[Z[14]].Velocity.Y);
                            r[Z[2]].CFrame = CFrame.new(Vector3.new(r[Z[2]].Position.X, r[Z[12]] + r[Z[2]].Position.Y - v1, r[Z[2]].Position.Z)) * r[Z[8]];
                            r[Z[2]].AssemblyLinearVelocity = Vector3.zero;
                            r[Z[2]].AssemblyAngularVelocity = Vector3.zero;
                            v4 = r[Z[14]];
                            v4.Destroy(v4);
                            v4 = r[Z[7]];
                            v4.Destroy(v4);
                            r[Z[15]](M);
                            r[Z[16]].trauma = math.min(r[Z[16]].trauma + math.clamp(M / 500, .05, 0.5), 1);
                            r[Z[17]]();
                            if r[Z[18]] then
                                r441();
                            end;
                            return;
                        end;
                        if R > r[Z[13]].LAND_FAST_THRESHOLD then
                            v4 = math.min(r[Z[13]].LAND_MAX_SPEED + (R - r[Z[13]].LAND_FAST_THRESHOLD) * r[Z[13]].LAND_HEIGHT_SCALE, 500);
                        else
                            if B - r[Z[12]] > r[Z[13]].LAND_SLOW_THRESHOLD then
                                M = (B - r[Z[12]] - r[Z[13]].LAND_SLOW_THRESHOLD) / (r[Z[13]].LAND_FAST_THRESHOLD - r[Z[13]].LAND_SLOW_THRESHOLD);
                                v4 = r[Z[13]].LAND_SLOW_SPEED + (r[Z[13]].LAND_MAX_SPEED - r[Z[13]].LAND_SLOW_SPEED) * M * M;
                            else
                                v4 = r[Z[13]].LAND_SLOW_SPEED;
                            end;
                            r[Z[14]].Velocity = Vector3.new(0, -nil, 0);
                            return;
                        end;
                    else
                        D = r[Z[2]].Position.Y - 3;
                    end; 
                end);
                return;
            else
                q = r[Z[2]].Position.Y - 3;
            end; 
        end;
        ls[127] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[85],
                42,
                ls[86],
                51,
                ls[9],
                43,
                52,
                ls[26],
                ls[32],
                ls[35],
                ls[39],
                ls[52],
                ls[58],
                ls[106],
                ls[102],
                174,
                ls[20],
                444,
                572,
                ls[120],
                ls[17],
                445
            };
            if not r[Z[1]].flying or r[Z[1]].transitioning then
                return;
            end;
            if r[Z[1]].boostLevel > 0 then
                return;
            end;
            r[Z[1]].flying = false;
            r[Z[1]].transitioning = true;
            r[Z[1]].boostLevel = 0;
            r[Z[1]].speedScale = 1;
            r[Z[1]].wasMoving = false;
            r[Z[1]].isCharging = false;
            r[Z[1]].idlePendingRefly = false;
            if r[Z[4]] and r[Z[4]].refreshIdlesList then
                pcall(function(...)
                    local Z = {
                        Z[4],
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]].refreshIdlesList(false);
                    return; 
                end);
            end;
            r[Z[5]].F = 0;
            r[Z[5]].B = 0;
            r[Z[5]].L = 0;
            r[Z[5]].R = 0;
            r[Z[5]].U = 0;
            r[Z[5]].D = 0;
            r[Z[6]]();
            for V = #r[Z[7]], 1, -1 do
                r453 = v1;
                pcall(function(...)
                    local Z = {
                        Mg,
                        179
                    };
                    v1 = r[Z[2]];
                    C = r[Z[1]][v1];
                    C.Disconnect(C);
                    return; 
                end);
                table.remove(r[Z[7]], r453); 
            end;
            if r[Z[1]].isFirstPerson then
                r[Z[8]]();
            end;
            if r[Z[9]] then
                r[Z[9]].Velocity = Vector3.zero;
            end;
            if r[Z[10]] then
                r[Z[10]].MaxTorque = Vector3.zero;
            end;
            r[Z[11]]();
            r[Z[12]]();
            r[Z[13]]();
            r[Z[14]]();
            r[Z[15]]();
            r[Z[16]]();
            r[Z[17]]();
            r[Z[18]]();
            local function v1(...)
                local Z = {
                    Z[19],
                    Z[2],
                    Z[3],
                    Z[20],
                    Z[21],
                    Z[1],
                    Z[22]
                };
                r[Z[1]].WalkSpeed = 16;
                r[Z[1]].JumpPower = 50;
                r[Z[1]].PlatformStand = false;
                r[Z[1]].AutoRotate = true;
                r[Z[4]]();
                r[Z[5]](.8);
                r[Z[6]].transitioning = false;
                r[Z[7]].stopFootTracker();
                return; 
            end;
            if r[Z[1]].smoothLandingsEnabled then
                r[Z[23]](v1);
            else
                r[Z[24]]();
                r[Z[25]]();
                v1();
            end;
            return; 
        end;
        r[ls[120]] = ls[121];
        ls[125] = function(arg1_143, ...)
            local Z = {
                39,
                61,
                60,
                38,
                ls[85],
                42,
                174,
                ls[18],
                ls[16],
                ls[2],
                ls[123],
                ls[117],
                ls[25],
                ls[31],
                ls[33],
                ls[105],
                ls[115],
                ls[38],
                ls[51],
                572,
                ls[7]
            };
            v1 = arg1_143;
            r[Z[1]].flying = true;
            r[Z[1]].takingOff = false;
            r[Z[1]].boostLevel = 0;
            r[Z[1]].speedScale = 1;
            r[Z[1]].wasMoving = false;
            r[Z[1]].isCharging = false;
            r[Z[1]].currentFOV = r[Z[4]].FOV_BASE;
            r[Z[1]].idlePendingRefly = false;
            if r[Z[5]] and r[Z[5]].refreshIdlesList then
                pcall(function(...)
                    local Z = {
                        Z[5],
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]].refreshIdlesList(false);
                    return; 
                end);
            end;
            r[Z[6]].F = 0;
            r[Z[6]].B = 0;
            r[Z[6]].L = 0;
            r[Z[6]].R = 0;
            r[Z[6]].U = 0;
            r[Z[6]].D = 0;
            r[Z[7]].PlatformStand = true;
            r[Z[7]].AutoRotate = false;
            r[Z[8]]();
            r[Z[9]]();
            workspace.CurrentCamera.FieldOfView = r[Z[4]].FOV_BASE;
            if v1 == "skip" then
            else
                if v1 == "airborne" then
                    r[ls[2]](1.25);
                else
                    if arg1_143 == "takeoff" then
                        r[Z[10]](r[Z[11]]);
                    else
                        r[ls[2]]();
                    end;
                    r[Z[12]]();
                    r[Z[13]]();
                    r[Z[14]]();
                    r[Z[15]]();
                    r[Z[16]]();
                    r[Z[17]]();
                    r[Z[18]]();
                    r[Z[19]]();
                    r[Z[20]].startFootTracker();
                    if r[Z[1]].fpWanted and not r[Z[1]].isFirstPerson then
                        r[ls[7]]();
                    end;
                    return;
                end;
            end; 
        end;
        ls[121] = 562;
        ls[124] = function(arg1_144, ...)
            local Z = {
                39,
                61,
                60,
                174,
                ls[18],
                42,
                ls[21],
                245,
                55,
                175,
                ls[121],
                ls[46],
                217,
                ls[45],
                438,
                439,
                215,
                441,
                ls[2],
                ls[123]
            };
            v1 = arg1_144;
            r[Z[1]].transitioning = true;
            r[Z[4]].WalkSpeed = 0;
            r[Z[4]].JumpPower = 0;
            r[Z[4]].PlatformStand = true;
            r[Z[4]].AutoRotate = false;
            r[Z[5]]();
            r[Z[6]].F = 0;
            r[Z[6]].B = 0;
            r[Z[6]].L = 0;
            r[Z[6]].R = 0;
            r[Z[6]].U = 0;
            r[Z[6]].D = 0;
            r[Z[7]]();
            r454 = r[Z[8]][r[Z[9]]] or r[Z[8]].Homelander;
            r455 = r[Z[10]].Position.X;
            r456 = r[Z[10]].Position.Z;
            C = r[Z[10]].CFrame;
            v4 = {
                C.ToEulerAnglesYXZ(C)
            };
            E = v4[3];
            v4 = v4[1];
            r457 = Instance.new("BodyPosition");
            r457.Name = "IFlyTakeoffPin";
            r457.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000);
            r457.Position = r[Z[10]].Position;
            r457.P = 50000;
            r457.D = 1000;
            r457.Parent = r[Z[10]];
            Q = Instance.new("BodyGyro");
            Q.Name = "IFlyTakeoffRotPin";
            Q.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000);
            Q.P = 50000;
            Q.D = 1000;
            Q.CFrame = CFrame.Angles(0, v4[2], 0);
            Q.Parent = r[Z[10]];
            i = math.max(r454.LiftStart - .1, 0);
            task.delay(i, function(...)
                local Z = {
                    Z[10],
                    Z[2],
                    Z[3],
                    Z[11]
                };
                if r[Z[1]] and r[Z[1]].Parent then
                    r[Z[4]]();
                end;
                return; 
            end);
            task.delay(i, function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    Z[12],
                    Z[13],
                    Z[14]
                };
                if not r[Z[1]].sfxEnabled then
                    return;
                end;
                r458 = r[Z[4]]("rbxassetid://91992256988574", false, 0);
                C = r458;
                C.Play(C);
                C = r[Z[5]];
                D = C.Create(C, r458, TweenInfo.new(.12, Enum.EasingStyle.Linear), {
                    ["Volume"] = r[Z[6]](.45)
                });
                D.Play(D);
                task.delay(.8, function(...)
                    local Z = {
                        Z[5],
                        162,
                        Z[2],
                        Z[3]
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3],
                            Z[4]
                        };
                        C = r[Z[1]];
                        D = C.Create(C, r[Z[2]], TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                            ["Volume"] = 0
                        });
                        D.Play(D);
                        task.delay(2.1, function(...)
                            local Z = {
                                Z[2]
                            };
                            pcall(function(...)
                                local Z = {
                                    Z[2]
                                };
                                C = r[Z[1]];
                                C.Stop(C);
                                C = r[Z[1]];
                                C.Destroy(C);
                                return; 
                            end);
                            return; 
                        end);
                        return; 
                    end);
                    return; 
                end);
                return; 
            end);
            r459 = r[Z[15]](r454.AnimationId);
            r459.Looped = false;
            r459.Priority = Enum.AnimationPriority.Action4;
            C = r459;
            C.Play(C, r[Z[16]], 1, 1);
            r460 = r[Z[10]].Position.Y;
            r461 = r460 + 7;
            r462 = 0;
            r463 = math.max(r454.LiftEnd - r454.LiftStart, .05);
            r464 = false;
            r465 = false;
            task.delay(r454.LiftStart, function(...)
                r464 = true;
                return; 
            end);
            r466 = r[Z[10]].Position;
            C = r[Z[17]].Heartbeat;
            X = C.Connect(C, function(arg1_145, ...)
                local Z = {
                    Z[10],
                    Z[2],
                    Z[3],
                    265,
                    263,
                    259,
                    264,
                    260,
                    261,
                    257,
                    255,
                    256,
                    254,
                    262,
                    Z[1],
                    Z[18],
                    258,
                    Z[19]
                };
                if not r[Z[1]] or not r[Z[1]].Parent then
                    return;
                end;
                r[Z[4]] = r[Z[1]].Position;
                if r[Z[5]] then
                    r[Z[6]] = math.min(r[Z[6]] + arg1_145, r[Z[7]]);
                    r[Z[10]].Position = Vector3.new(r[Z[11]], r[Z[8]] + (r[Z[9]] - r[Z[8]]) * (1 - (1 - r[Z[6]] / r[Z[7]]) ^ 3), r[Z[12]]);
                    C = r[Z[1]][g];
                    if r[Z[13]].BlendToIdle and not r[Z[14]] then
                        r[Z[14]] = true;
                        r[Z[15]].flying = true;
                        r[Z[16]](r[Z[17]], r[Z[7]]);
                        r[Z[18]]();
                    end;
                else
                    r[Z[10]].Position = Vector3.new(r[Z[11]], r[Z[4]].Y, r[Z[12]]);
                end;
                return; 
            end);
            task.wait(r454.LiftEnd);
            X.Disconnect(X);
            C = r457;
            C.Destroy(C);
            Q.Destroy(Q);
            if not r454.BlendToIdle then
                r[Z[18]](r459, r[Z[20]]);
            end;
            C = r[Z[10]].CFrame;
            h = {
                C.ToEulerAnglesYXZ(C)
            };
            t = h[3];
            h = h[1];
            r[Z[10]].CFrame = CFrame.new(r466) * CFrame.Angles(0, h[2], 0);
            r[Z[1]].transitioning = false;
            if v1 then
                v1(r454.BlendToIdle);
            end;
            return; 
        end;
        r[ls[121]] = ls[122];
        ls[122] = .9;
        r[ls[123]] = ls[122];
        ls[122] = 563;
        r[ls[122]] = ls[124];
        ls[124] = 564;
        ls[113] = nil;
        r[ls[124]] = ls[125];
        ls[119] = nil;
        ls[125] = 565;
        ls[126] = function(...)
            local Z = {
                39,
                61,
                60,
                ls[100],
                ls[101],
                ls[70],
                ls[79],
                ls[124],
                ls[15],
                ls[14],
                ls[7],
                ls[122]
            };
            if r[Z[1]].flying or r[Z[1]].transitioning then
                return;
            end;
            if r[Z[4]].locked or r[Z[5]].locked then
                r[Z[6]]("Can't Fly", "Recovering from impact\xe2\x80\xa6", r[Z[7]], "error", 1.5);
                return;
            end;
            if not r[Z[1]].takeoffsEnabled then
                r[Z[8]]();
                return;
            end;
            if not r[Z[9]](true) or r[Z[10]](true) then
                r[Z[8]]("airborne");
            else
                r[Z[1]].takingOff = true;
                if r[Z[1]].fpWanted and not r[Z[1]].isFirstPerson then
                    r[Z[11]]();
                end;
                task.spawn(function(...)
                    r[Z[12]](function(arg1_146, ...)
                        local Z = {
                            Z[2],
                            Z[3],
                            Z[4]
                        };
                        v1 = arg1_146;
                        C = r[Z[1]];
                        v3, R = C, v3;
                        if v1 then
                            B = "skip";
                        end;
                        C = R;
                        v1, C = nil, v3;
                        C(v1 or "takeoff");
                        return; 
                    end);
                    return; 
                end);
                return;
            end; 
        end;
        r[ls[125]] = ls[126];
        ls[126] = 566;
        ls[120] = nil;
        r[ls[126]] = ls[127];
        ls[127] = r33;
        ls[129] = r16;
        ls[130] = r15;
        ls[131] = ls[130](ls[132], ls[133]);
        ls[128] = ls[129][ls[131]];
        ls[130] = r26;
        ls[132] = r16;
        ls[63] = nil;
        ls[133] = r15;
        ls[15] = nil;
        ls[118] = nil;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[131] = ls[132][ls[134]];
        ls[133], hg = 22940120404852, nil;
        ls[65] = nil;
        ls[132] = "\xedk.8\x83%\xeb\x9eiS";
        ls[129] = ls[130][ls[131]];
        ls[136] = 32866092742544;
        ls[131] = function(arg1_147, arg2_147, ...)
            local Z = {
                572,
                61,
                60,
                ls[85],
                38,
                39,
                ls[126],
                ls[125],
                ls[96],
                ls[83],
                42,
                436,
                ls[70],
                ls[73],
                ls[7],
                ls[82],
                ls[9]
            };
            if r[Z[1]].killed then
                return;
            end;
            if arg2_147 then
                return;
            end;
            if r[Z[4]].capturing then
                return;
            end;
            if os.clock() < r[Z[4]].inputLockUntil then
                return;
            end;
            v3 = arg1_147.KeyCode;
            if v3 == Enum.KeyCode.Unknown then
                return;
            end;
            if v3 == r[Z[5]].KEY_TOGGLE then
                if r[Z[6]].flying then
                    r[Z[7]]();
                else
                    r[Z[8]]();
                end;
            else
                if v3 == r[Z[5]].KEY_BOOST then
                    r[Z[9]]();
                else
                    if v1.KeyCode == r[Z[5]].KEY_MENU then
                        r[Z[10]]();
                    else
                        if v1.KeyCode == r[Z[5]].KEY_FORWARD then
                            r[Z[11]].F = -1;
                        else
                            if v1.KeyCode == r[Z[5]].KEY_BACK then
                                r[Z[11]].B = 1;
                            else
                                if v1.KeyCode == r[Z[5]].KEY_LEFT then
                                    r[Z[11]].L = -1;
                                else
                                    if v1.KeyCode == r[Z[5]].KEY_RIGHT then
                                        r[Z[11]].R = 1;
                                    else
                                        if v1.KeyCode == r[Z[5]].KEY_UP then
                                            r[Z[11]].U = 1;
                                        else
                                            if v1.KeyCode == r[Z[5]].KEY_DOWN then
                                                r[Z[11]].D = -1;
                                            else
                                                v4 = r[Z[2]];
                                                if r[Z[6]].quickTogglesEnabled and v1.KeyCode == r[Z[5]].KEY_QUICK_CRASH then
                                                    r[Z[6]].crashEnabled = not r[Z[6]].crashEnabled;
                                                    r[Z[12]]();
                                                    if r[Z[4]].crashToggleHandle then
                                                        r[Z[4]].crashToggleHandle.set(r[Z[6]].crashEnabled);
                                                    end;
                                                    C = r[Z[13]];
                                                    E = C;
                                                    v4 = r[Z[6]].crashEnabled and "Enabled";
                                                    C = C;
                                                    if v4 then
                                                        C = C;
                                                        C("Crash Landings", v4, r[Z[14]], "info", 1.5);
                                                        return;
                                                    else
                                                        R = "Disabled";
                                                    end;
                                                else
                                                    if r[Z[6]].quickTogglesEnabled and v1.KeyCode == r[Z[5]].KEY_QUICK_WALL then
                                                        r[Z[6]].wallImpactEnabled = not r[Z[6]].wallImpactEnabled;
                                                        r[Z[12]]();
                                                        if r[Z[4]].wallToggleHandle then
                                                            r[Z[4]].wallToggleHandle.set(r[Z[6]].wallImpactEnabled);
                                                        end;
                                                        C = r[Z[13]];
                                                        C = C;
                                                        C = C;
                                                        C("Wall Impacts", r[Z[6]].wallImpactEnabled and "Enabled" or "Disabled", r[Z[14]], "info", 1.5);
                                                    else
                                                        if r[Z[6]].quickTogglesEnabled and v1.KeyCode == r[Z[5]].KEY_QUICK_FP then
                                                            r[Z[6]].fpWanted = not r[Z[6]].fpWanted;
                                                            if r[Z[6]].fpWanted then
                                                                if r[Z[6]].flying then
                                                                    r[Z[15]]();
                                                                else
                                                                    r[Z[13]]("First Person", "Only works while flying, it'll switch on as soon as you take off.", r[Z[16]], "info", 3);
                                                                end;
                                                            else
                                                                r[Z[17]]();
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end; 
        end;
        ls[69], ls[130] = nil, "Connect";
        ls[130] = ls[129][ls[130]];
        ls[130] = ls[130](ls[129], ls[131]);
        ls[23] = nil;
        ls[127][ls[128]] = ls[130];
        ls[127] = r33;
        ls[124] = nil;
        ls[129] = r16;
        ls[112] = nil;
        ls[130] = r15;
        ls[131] = ls[130](ls[132], ls[133]);
        ls[128] = ls[129][ls[131]];
        ls[130] = r26;
        ls[135] = "\xfa{\xe4\xb1\xe2r\x9b7\xe4\xc7";
        ls[132] = r16;
        ls[133] = r15;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[135] = 19221638989293;
        ls[78] = nil;
        ls[114] = nil;
        ls[131] = ls[132][ls[134]];
        ls[129] = ls[130][ls[131]];
        ls[130] = "Connect";
        ls[95] = nil;
        ls[131] = function(arg1_148, arg2_148, ...)
            local Z = {
                572,
                61,
                60,
                38,
                42
            };
            if r[Z[1]].killed then
                return;
            end;
            if arg2_148 then
                return;
            end;
            v3 = arg1_148.KeyCode;
            if v3 == Enum.KeyCode.Unknown then
                return;
            end;
            if v3 == r[Z[4]].KEY_FORWARD then
                r[Z[5]].F = 0;
            else
                if v3 == r[Z[4]].KEY_BACK then
                    r[Z[5]].B = 0;
                else
                    if v1.KeyCode == r[Z[4]].KEY_LEFT then
                        r[Z[5]].L = 0;
                    else
                        if v1.KeyCode == r[Z[4]].KEY_RIGHT then
                            r[Z[5]].R = 0;
                        else
                            if v1.KeyCode == r[Z[4]].KEY_UP then
                                r[Z[5]].U = 0;
                            else
                                if v1.KeyCode == r[Z[4]].KEY_DOWN then
                                    r[Z[5]].D = 0;
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end; 
        end;
        ls[130] = ls[129][ls[130]];
        ls[130] = ls[130](ls[129], ls[131]);
        ls[127][ls[128]] = ls[130];
        ls[127] = 567;
        ls[134] = "\xc0>\xd8.ufS\x86t";
        ls[128] = function(...)
            local Z = {
                572,
                61,
                60,
                39,
                ls[110],
                42,
                51,
                57,
                ls[8],
                174,
                ls[17],
                ls[26],
                ls[32],
                ls[35],
                ls[39],
                ls[52],
                ls[106],
                ls[102],
                ls[100],
                ls[101],
                ls[108],
                ls[109],
                445,
                ls[58],
                ls[6],
                216,
                38
            };
            if r[Z[1]].killed then
                return;
            end;
            if r[Z[4]].isDead then
                return;
            end;
            r[Z[4]].isDead = true;
            if r[Z[5]] then
                C = r[Z[5]];
                C.Disconnect(C);
                r[Z[5]] = nil;
            end;
            r[Z[4]].flying = false;
            r[Z[4]].transitioning = false;
            r[Z[4]].isCharging = false;
            r[Z[4]].boostLevel = 0;
            r[Z[4]].speedScale = 1;
            r[Z[6]].F = 0;
            r[Z[6]].B = 0;
            r[Z[6]].L = 0;
            r[Z[6]].R = 0;
            r[Z[6]].U = 0;
            r[Z[6]].D = 0;
            for V = #r[Z[7]], 1, -1 do
                r467 = v1;
                pcall(function(...)
                    local Z = {
                        Z[7],
                        226
                    };
                    v1 = r[Z[2]];
                    C = r[Z[1]][v1];
                    C.Disconnect(C);
                    return; 
                end);
                table.remove(r[Z[7]], r467); 
            end;
            if r[Z[8]].conn then
                D = r[Z[8]].conn;
                D.Disconnect(D);
                r[Z[8]].conn = nil;
            end;
            if r[Z[8]].mouseConn then
                D = r[Z[8]].mouseConn;
                D.Disconnect(D);
                r[Z[8]].mouseConn = nil;
            end;
            if r[Z[8]].enforceConn then
                D = r[Z[8]].enforceConn;
                D.Disconnect(D);
                r[Z[8]].enforceConn = nil;
            end;
            r[Z[4]].isFirstPerson = false;
            if r[Z[4]].isFirstPerson then
                pcall(function(...)
                    r[Z[9]](function(...)
                        local Z = {
                            Z[2],
                            Z[3],
                            Z[4],
                            Z[5]
                        };
                        pcall(function(...)
                            local Z = {
                                Z[1],
                                Z[2],
                                Z[3],
                                Z[4]
                            };
                            v1 = workspace.CurrentCamera;
                            v1.CameraType = r[Z[3]].savedCameraType or Enum.CameraType.Custom;
                            v1.CameraSubject = r[Z[3]].savedCameraSubject or r[Z[4]];
                            return; 
                        end);
                        return; 
                    end);
                    return; 
                end);
            end;
            r[Z[11]]();
            r[Z[12]]();
            r[Z[13]]();
            r[Z[14]]();
            r[Z[15]]();
            r[Z[16]]();
            r[Z[17]]();
            r[Z[18]]();
            r[Z[1]].stopFootTracker();
            r[Z[19]].locked = false;
            r[Z[20]].locked = false;
            for B, E in ipairs(r[Z[21]]) do
                r468 = E;
                R = B;
                pcall(function(...)
                    local Z = {
                        199,
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]].Enabled = true;
                    return; 
                end); 
            end;
            r[Z[21]] = {};
            E = r[Z[22]];
            for R, E in ipairs(E) do
                g = R;
                r469 = E;
                E = 285;
                pcall(function(...)
                    local Z = {
                        v4,
                        Z[2],
                        Z[3]
                    };
                    r[Z[1]].part.CanCollide = r[Z[1]].wasCanCollide;
                    return; 
                end); 
            end;
            r[Z[22]] = {};
            r[Z[23]]();
            r[Z[24]]();
            r[Z[25]]();
            pcall(function(...)
                local Z = {
                    Z[26],
                    Z[2],
                    Z[3],
                    Z[27]
                };
                r[Z[1]].MouseBehavior = Enum.MouseBehavior.Default;
                workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
                workspace.CurrentCamera.FieldOfView = r[Z[4]].FOV_BASE;
                return; 
            end);
            r[Z[4]].currentFOV = r[Z[27]].FOV_BASE;
            return; 
        end;
        r[ls[127]] = ls[128];
        ls[129] = function(...)
            local Z = {
                174,
                61,
                60,
                ls[127]
            };
            C = r[Z[1]].Died;
            C.Connect(C, r[Z[4]]);
            return; 
        end;
        ls[128] = 568;
        ls[38] = nil;
        r[ls[128]] = ls[129];
        ls[129] = r[ls[128]];
        ls[130] = ls[129]();
        ls[129] = r33;
        ls[131] = r16;
        ls[132] = r15;
        ls[133] = ls[132](ls[134], ls[135]);
        ls[130] = ls[131][ls[133]];
        ls[31] = nil;
        ls[132] = r31;
        ls[134] = r16;
        ls[99] = nil;
        ls[135] = r15;
        ls[136] = ls[135](ls[137], ls[138]);
        ls[133] = ls[134][ls[136]];
        ls[136] = 5975555610045;
        ls[131] = ls[132][ls[133]];
        ls[132], ls[134] = "Connect", "\x8f\x0f)\x1c\x98?=Q\xd9\xa4\xe0";
        ls[133] = function(arg1_149, ...)
            local Z = {
                572,
                61,
                60,
                57,
                ls[28],
                39,
                216,
                ls[6],
                173,
                174,
                175,
                176,
                38,
                53,
                ls[101],
                ls[100],
                ls[108],
                ls[109],
                ls[110],
                ls[26],
                ls[32],
                ls[35],
                ls[39],
                ls[52],
                ls[58],
                ls[106],
                ls[102],
                51,
                ls[17],
                ls[128]
            };
            v1 = arg1_149;
            if r[Z[1]].killed then
                return;
            end;
            if r[Z[4]].conn then
                C = r[Z[4]].conn;
                C.Disconnect(C);
                r[Z[4]].conn = nil;
            end;
            if r[Z[4]].mouseConn then
                C = r[Z[4]].mouseConn;
                C.Disconnect(C);
                r[Z[4]].mouseConn = nil;
            end;
            if r[Z[4]].enforceConn then
                C = r[Z[4]].enforceConn;
                C.Disconnect(C);
                r[Z[4]].enforceConn = nil;
            end;
            r[Z[5]].shakeUntil = 0;
            r[Z[6]].isFirstPerson = false;
            r[Z[7]].MouseBehavior = Enum.MouseBehavior.Default;
            r[Z[8]]();
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[3]
                };
                workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
                return; 
            end);
            r[Z[9]] = v1;
            r[Z[10]] = v1.WaitForChild(v1, "Humanoid");
            r[Z[11]] = v1.WaitForChild(v1, "HumanoidRootPart");
            v3 = r[Z[10]];
            r[Z[12]] = v3.WaitForChild(v3, "Animator");
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[3],
                    Z[10],
                    Z[13]
                };
                workspace.CurrentCamera.CameraSubject = r[Z[3]];
                workspace.CurrentCamera.FieldOfView = r[Z[4]].FOV_BASE;
                return; 
            end);
            r[Z[6]].flying = false;
            r[Z[6]].transitioning = false;
            r[Z[6]].boostLevel = 0;
            r[Z[6]].speedScale = 1;
            r[Z[6]].wasMoving = false;
            r[Z[6]].isCharging = false;
            r[Z[6]].currentFOV = r[Z[13]].FOV_BASE;
            r[Z[6]].isFirstPerson = false;
            r[Z[6]].isDead = false;
            r[Z[6]].fpYaw = 0;
            r[Z[6]].fpPitch = 0;
            r[Z[14]].active = nil;
            r[Z[14]].replicated = nil;
            r[Z[14]].lastTiltDir = 0;
            r[Z[1]].replicatedIdleAnimInstance = nil;
            r[Z[4]].conn = nil;
            r[Z[4]].mouseConn = nil;
            r[Z[4]].hidden = {};
            r[Z[15]].locked = false;
            r[Z[16]].locked = false;
            r[Z[17]] = {};
            r[Z[18]] = {};
            if r[Z[19]] then
                E = r[Z[19]];
                E.Disconnect(E);
                r[Z[19]] = nil;
            end;
            r[Z[20]]();
            r[Z[21]]();
            r[Z[22]]();
            r[Z[23]]();
            r[Z[24]]();
            r[Z[25]]();
            r[Z[26]]();
            r[Z[27]]();
            r[Z[1]].stopFootTracker();
            a = r[Z[28]];
            for i, a in ipairs(a) do
                v4 = i;
                r470 = a;
                pcall(function(...)
                    C = r[v2];
                    C.Disconnect(C);
                    return; 
                end); 
            end;
            r[Z[28]] = {};
            r[Z[29]]();
            r[Z[30]]();
            return; 
        end;
        ls[72] = nil;
        ls[132] = ls[131][ls[132]];
        ls[132] = ls[132](ls[131], ls[133]);
        ls[129][ls[130]] = ls[132];
        ls[129] = r33;
        ls[25] = nil;
        ls[135] = 2686584031686;
        ls[131] = r16;
        ls[123] = nil;
        ls[21] = nil;
        ls[132] = r15;
        ls[127] = nil;
        ls[29] = nil;
        ls[133] = ls[132](ls[134], ls[135]);
        ls[100] = nil;
        ls[130] = ls[131][ls[133]];
        ls[89] = nil;
        ls[131] = function(...)
            local Z = {
                61,
                60,
                222
            };
            r471 = {};
            pcall(function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    273
                };
                if gethui then
                    table.insert(r[Z[3]], gethui());
                end;
                return; 
            end);
            pcall(function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    273
                };
                g = game;
                table.insert(r[Z[3]], g.GetService(g, "CoreGui"));
                return; 
            end);
            pcall(function(...)
                local Z = {
                    Z[3],
                    Z[1],
                    Z[2],
                    273
                };
                C = r[Z[1]];
                v1 = C.FindFirstChildOfClass(C, "PlayerGui");
                if v1 then
                    table.insert(r[Z[4]], v1);
                end;
                return; 
            end);
            r472 = {
                ["IFlyMenu"] = true,
                ["IFlyNotify"] = true,
                ["IFlyFlash"] = true,
                ["IFlyAnnouncement"] = true,
                ["IFlyR15Warning"] = true
            };
            R = r471;
            for B, v4 in ipairs("ipairs") do
                r473 = v4;
                E = B;
                pcall(function(...)
                    local Z = {
                        C,
                        274,
                        Z[1],
                        Z[2]
                    };
                    v3 = r[Z[1]];
                    v3 = "ipairs";
                    for g, R in ipairs(v3.GetChildren(v3)) do
                        B = g;
                        if r[Z[2]][R.Name] then
                            R.Destroy(R);
                        end; 
                    end;
                    return; 
                end); 
            end;
            return; 
        end;
        ls[134] = "\xc2\t\xb2\xfc^W\xa4";
        ls[129][ls[130]] = ls[131];
        ls[91] = nil;
        ls[18] = nil;
        ls[129] = r33;
        ls[11] = nil;
        ls[131] = r16;
        ls[132] = r15;
        ls[135] = 27777474946317;
        ls[133] = ls[132](ls[134], ls[135]);
        ls[57] = nil;
        ls[16] = nil;
        ls[130] = ls[131][ls[133]];
        ls[131] = function(...)
            local Z = {
                572,
                61,
                60,
                39,
                57,
                ls[32],
                ls[35],
                ls[26],
                ls[39],
                ls[52],
                ls[106],
                ls[102],
                445,
                ls[110],
                ls[111],
                51,
                ls[17],
                ls[58],
                ls[6],
                173,
                174,
                ls[20],
                216,
                38
            };
            if r[Z[1]].killed then
                return;
            end;
            r[Z[1]].killed = true;
            r[Z[4]].flying = false;
            r[Z[4]].transitioning = false;
            r[Z[4]].isFirstPerson = false;
            B = "inputBegan";
            v3 = {
                B,
                "inputEnded",
                "charAdded"
            };
            g, D = B[3], B[1];
            for g, R in v3, ipairs(v3) do
                B = g;
                r474 = R;
                pcall(function(...)
                    local Z = {
                        Z[1],
                        598
                    };
                    C = r[Z[1]][r[Z[2]]];
                    if C then
                        C = r[Z[1]][r[Z[2]]];
                        C.Disconnect(C);
                    end;
                    return; 
                end); 
            end;
            pcall(function(...)
                local Z = {
                    Z[5],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]].conn then
                    C = r[Z[1]].conn;
                    C.Disconnect(C);
                    r[Z[1]].conn = nil;
                end;
                return; 
            end);
            pcall(function(...)
                local Z = {
                    Z[5],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]].mouseConn then
                    C = r[Z[1]].mouseConn;
                    C.Disconnect(C);
                    r[Z[1]].mouseConn = nil;
                end;
                return; 
            end);
            pcall(function(...)
                local Z = {
                    Z[5],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]].enforceConn then
                    C = r[Z[1]].enforceConn;
                    C.Disconnect(C);
                    r[Z[1]].enforceConn = nil;
                end;
                return; 
            end);
            pcall(r[Z[6]]);
            pcall(r[Z[7]]);
            pcall(r[Z[8]]);
            pcall(r[Z[9]]);
            pcall(r[Z[10]]);
            pcall(r[Z[11]]);
            pcall(r[Z[12]]);
            pcall(r[Z[1]].stopFootTracker);
            pcall(function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]].footTrackerPart then
                    C = r[Z[1]].footTrackerPart;
                    C.Destroy(C);
                    r[Z[1]].footTrackerPart = nil;
                end;
                return; 
            end);
            pcall(r[Z[13]]);
            pcall(function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]].replicatedIdleAnimInstance then
                    C = r[Z[1]].replicatedIdleAnimInstance;
                    C.Destroy(C);
                    r[Z[1]].replicatedIdleAnimInstance = nil;
                end;
                return; 
            end);
            pcall(function(...)
                local Z = {
                    ls[110]
                };
                if r[Z[1]] then
                    C = r[Z[1]];
                    C.Disconnect(C);
                    r[Z[1]] = nil;
                end;
                return; 
            end);
            pcall(r[Z[15]]);
            for g = #r[Z[16]], 1, -1 do
                r475 = g;
                pcall(function(...)
                    local Z = {
                        Mg,
                        573
                    };
                    C = r[Z[1]][r[Z[2]]];
                    C.Disconnect(C);
                    return; 
                end);
                table.remove(r[Z[16]], r475); 
            end;
            pcall(r[Z[17]]);
            pcall(r[Z[18]]);
            pcall(r[Z[19]]);
            pcall(function(...)
                local Z = {
                    Z[20],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]] then
                    C = ipairs;
                    v3 = r[Z[1]];
                    v3 = "ipairs";
                    for g, R in C(v3.GetDescendants(v3)) do
                        B = g;
                        r476 = R;
                        C = r476;
                        if C.IsA(C, "BasePart") then
                            pcall(function(...)
                                local Z = {
                                    78,
                                    Z[2],
                                    Z[3]
                                };
                                r[Z[1]].CanCollide = true;
                                return; 
                            end);
                        end; 
                    end;
                end;
                return; 
            end);
            pcall(function(...)
                local Z = {
                    Z[21],
                    Z[2],
                    Z[3]
                };
                if r[Z[1]] and r[Z[1]].Parent then
                    r[Z[1]].WalkSpeed = 16;
                    r[Z[1]].JumpPower = 50;
                    r[Z[1]].PlatformStand = false;
                    r[Z[1]].AutoRotate = true;
                end;
                return; 
            end);
            pcall(r[Z[22]]);
            pcall(function(...)
                local Z = {
                    Z[23],
                    Z[2],
                    Z[3],
                    Z[24],
                    Z[21]
                };
                r[Z[1]].MouseBehavior = Enum.MouseBehavior.Default;
                v1 = workspace.CurrentCamera;
                v1.CameraType = Enum.CameraType.Custom;
                v1.FieldOfView = r[Z[4]].FOV_BASE;
                if r[Z[5]] and r[Z[5]].Parent then
                    v1.CameraSubject = r[Z[5]];
                end;
                return; 
            end);
            r[Z[1]].destroyGuis();
            pcall(function(...)
                local Z = {
                    Z[2],
                    Z[3]
                };
                v1 = getgenv;
                D, C = v1 and getgenv(), r[Z[1]][g];
                if v1 then
                    (v1 and getgenv()).INVINCIBLE_FLY_RUNNING = false;
                    return;
                else
                    D = _G;
                end; 
            end);
            return; 
        end;
        ls[129][ls[130]] = ls[131];
        ls[130] = "pcall";
        ls[129] = Env[ls[130]];
        ls[135] = "\x0f\x96OG\xbc";
        ls[87] = nil;
        ls[126] = nil;
        ls[2] = nil;
        ls[128] = nil;
        ls[105] = nil;
        ls[103] = nil;
        ls[12] = nil;
        ls[41] = nil;
        ls[131] = function(...)
            local Z = {
                61,
                60,
                572,
                ls[70],
                ls[79]
            };
            v3 = getgenv;
            if v3 then
                v1 = getgenv();
            end;
            C, D = As, v3;
            if v3 then
                v1.INVINCIBLE_FLY_CLEANUP = r[Z[3]].cleanup;
                v1.AlreadyRunningInvincibleFly = function(...)
                    local Z = {
                        Z[4],
                        Z[1],
                        Z[2],
                        Z[5]
                    };
                    pcall(function(...)
                        local Z = {
                            Z[1],
                            Z[2],
                            Z[3],
                            Z[4]
                        };
                        r[Z[1]]("Invincible Fly", "Already running.", r[Z[4]], "error", 3);
                        return; 
                    end);
                    return; 
                end;
                return;
            else
                D = _G;
            end; 
        end;
        ls[130] = ls[129](ls[131]);
        ls[131] = "task";
        ls[33] = nil;
        ls[130] = Env[ls[131]];
        ls[132] = r16;
        ls[122] = nil;
        ls[53] = nil;
        ls[133] = r15;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[131] = ls[132][ls[134]];
        ls[108] = nil;
        ls[136] = 6705722333285;
        ls[7] = nil;
        ls[97] = nil;
        ls[129] = ls[130][ls[131]];
        ls[130] = ls[129](function(...)
            local Z = {
                241,
                54,
                442,
                61,
                60,
                245,
                55,
                249,
                35
            };
            v1 = r[Z[1]][r[Z[2]]];
            if v1 then
                r[Z[3]](v1.AnimationId);
            end;
            g = r[Z[6]][r[Z[7]]];
            if g then
                r[Z[3]](g.AnimationId);
            end;
            for H = 1, 4 do
                M = r[Z[8]][r[Z[9]][v3]];
                if M then
                    r[Z[3]](M.animId);
                end; 
            end;
            return; 
        end);
        ls[135], ls[131] = "u\xa2\x1ai\xd0", "task";
        ls[109] = nil;
        ls[110] = nil;
        ls[130] = Env[ls[131]];
        ls[54] = nil;
        ls[52] = nil;
        ls[132] = r16;
        ls[133] = r15;
        ls[59] = nil;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[58] = nil;
        ls[131] = ls[132][ls[134]];
        ls[79] = nil;
        ls[20] = nil;
        ls[56] = nil;
        ls[135] = "5\x93\x9bAn";
        ls[129] = ls[130][ls[131]];
        ls[8] = nil;
        ls[46] = nil;
        ls[131] = "task";
        ls[130] = ls[129](function(...)
            local Z = {
                38,
                61,
                60,
                241,
                248,
                245,
                438,
                215
            };
            v1 = {
                r[Z[1]].CRASH_ANIM_ID
            };
            B = r[Z[4]];
            for v3, E in pairs(D) do
                R = v3;
                v1[#v1 + 1] = E.AnimationId; 
            end;
            for B, E in ipairs(r[Z[5]]) do
                R = B;
                v1[#v1 + 1] = E.animId; 
            end;
            for B, E in pairs(r[Z[6]]) do
                R = B;
                v1[#v1 + 1] = E.AnimationId; 
            end;
            g = {};
            for R, v4 in ipairs(v1) do
                E = R;
                r477 = v4;
                a = {
                    pcall(function(...)
                        local Z = {
                            Z[7],
                            314
                        };
                        return r[Z[1]](r[Z[2]]); 
                    end)
                };
                M = a[1];
                r478 = a[2];
                if M then
                    Q = r478;
                end;
                if M then
                    r478.Priority = Enum.AnimationPriority.Idle;
                    pcall(function(...)
                        C = r478;
                        C.Play(C, 0, 0, 1);
                        return; 
                    end);
                    g[#g + 1] = r478;
                end; 
            end;
            C = r[Z[8]].Heartbeat;
            C.Wait(C);
            for R, v4 in ipairs(g) do
                r479 = v4;
                E = R;
                pcall(function(...)
                    C = r479;
                    C.Stop(C, 0);
                    return; 
                end);
                pcall(function(...)
                    C = r479;
                    C.Destroy(C);
                    return; 
                end); 
            end;
            return; 
        end);
        ls[60] = nil;
        ls[6] = nil;
        ls[130] = Env[ls[131]];
        ls[132] = r16;
        ls[136] = 471387046327;
        ls[133] = r15;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[131] = ls[132][ls[134]];
        ls[104] = nil;
        ls[129] = ls[130][ls[131]];
        ls[94] = nil;
        ls[130] = ls[129](ls[49]);
        ls[32] = nil;
        ls[131], Hs = "task", nil;
        ls[39] = nil;
        ls[117] = nil;
        ls[35] = nil;
        ls[135] = "\xa6\xbct\xf6\x11";
        ls[67] = nil;
        ls[26] = nil;
        ls[130] = Env[ls[131]];
        ls[92] = nil;
        ls[132] = r16;
        ls[73] = nil;
        ls[133] = r15;
        ls[136] = 9221576204684;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[106] = nil;
        ls[90] = nil;
        ls[17] = nil;
        ls[131] = ls[132][ls[134]];
        ls[129] = ls[130][ls[131]];
        ls[131] = function(...)
            local Z = {
                61,
                60,
                572
            };
            task.wait(10);
            while not r[Z[3]].killed do
                if r[Z[3]].checkForUpdate() then
                    break;
                else
                    task.wait(300);
                end; 
            end;
            return; 
        end;
        ls[130] = ls[129](ls[131]);
        ls[131] = "task";
        ls[130] = Env[ls[131]];
        ls[27] = nil;
        ls[132] = r16;
        ls[136] = 33686456531596;
        ls[45] = nil;
        ls[135] = "\xbb@:r\t";
        ls[133] = r15;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[111] = nil;
        ls[131] = ls[132][ls[134]];
        ls[121] = nil;
        ls[51] = nil;
        ls[115] = nil;
        ls[129] = ls[130][ls[131]];
        ls[131] = 1.5;
        ls[132] = function(...)
            local Z = {
                ls[70],
                61,
                60,
                437,
                38,
                ls[82]
            };
            pcall(function(...)
                local Z = {
                    Z[1],
                    Z[2],
                    Z[3],
                    Z[4],
                    Z[5],
                    Z[6]
                };
                r[Z[1]]("Invincible Fly", "Press " .. r[Z[4]](r[Z[5]].KEY_TOGGLE) .. " to fly, " .. r[Z[4]](r[Z[5]].KEY_MENU) .. " for settings and idles", r[Z[6]], "info", 5);
                return; 
            end);
            return; 
        end;
        ls[49] = nil;
        ls[4] = nil;
        ls[135] = "\x1dk\xed\xa9 ";
        ls[130] = ls[129](ls[131], ls[132]);
        ls[64] = nil;
        ls[96] = nil;
        ls[131] = "task";
        ls[9] = nil;
        ls[107] = nil;
        ls[86] = nil;
        ls[130] = Env[ls[131]];
        ls[136] = 33326742042941;
        ls[132] = r16;
        ls[133] = r15;
        ls[85] = nil;
        ls[134] = ls[133](ls[135], ls[136]);
        ls[131] = ls[132][ls[134]];
        ls[14] = nil;
        ls[132] = function(...)
            local Z = {
                572,
                61,
                60,
                ls[70],
                437,
                38,
                ls[82],
                ls[83]
            };
            if r[Z[1]].killed then
                return;
            end;
            if r[Z[1]].guiOpenedOnce then
                return;
            end;
            if r[Z[1]].guiHintShown then
                return;
            end;
            if r[Z[1]].getGuiHintCount() >= r[Z[1]].GUI_HINT_MAX_COUNT then
                return;
            end;
            r[Z[1]].guiHintShown = true;
            r[Z[1]].incrementGuiHintCount();
            pcall(function(...)
                local Z = {
                    Z[4],
                    Z[2],
                    Z[3],
                    Z[5],
                    Z[6],
                    Z[7],
                    Z[1],
                    Z[8]
                };
                r[Z[1]]("Invincible Fly", "Having trouble opening the GUI? Press this notification to open it, or press " .. r[Z[4]](r[Z[5]].KEY_MENU) .. " to open the GUI.", r[Z[6]], "info", 8, "flying", function(...)
                    local Z = {
                        Z[7],
                        Z[2],
                        Z[3],
                        Z[8]
                    };
                    if not r[Z[1]].killed then
                        r[Z[4]]();
                    end;
                    return; 
                end);
                return; 
            end);
            return; 
        end;
        ls[129] = ls[130][ls[131]];
        ls[131] = 60;
        ls[70] = nil;
        ls[130] = ls[129](ls[131], ls[132]);
        ls[82] = nil;
        ls[28] = nil;
        ls[83] = nil;
        ls[102] = nil;
        ls[101] = nil;
        ls[98] = nil;
        ls[125] = nil;
        return;
    else
        J = r31.CharacterAdded;
        o = J.Wait(J);
    end;
end;
return (function(...)
    local Z = {
        353
    };
    while true do
        l1 = l2;
        l2 = l1;
        r[Z[1]](); 
    end;
    return; 
end)();