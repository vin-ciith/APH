repeat task.wait() until game:IsLoaded()

local Title = "Alpha Hub UI"
local FileNames = {"MainSave", "Configuration.json", "Drawing.json"}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/SplixUiLib/main/Main"))()

local windowColor = Color3.fromRGB(225,58,81)
local window = library:new({textsize = 13.5,font = Enum.Font.RobotoMono,name = Title,color = windowColor})

window.outline.Size = UDim2.new(0, 600, 0, 460)

local tab = window:page({name = "Main"})
local tab2 = window:page({name = "Visuals"})
local credtab = window:page({name = "Credits"})

local section1 = tab:section({name = "Aimbot",side = "left",size = 260})
local section3 = tab:section({name = "Settings",side = "right",size = 75})

local vsection1 = tab2:section({name = "ESP",side = "left",size=125})
local vsection2 = tab2:section({name = "Zoom",side = "right",size=75})
local vsection3 = tab2:section({name = "Lighting",side = "left",size=75})
local vsection4 = tab2:section({name = "Colors",side = "right",size=150})

local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local HttpService = game:GetService("HttpService")

local function Encode(Table)
	if Table and type(Table) == "table" then
		local EncodedTable = HttpService:JSONEncode(Table)

		return EncodedTable
	end
end

local function Decode(String)
	if String and type(String) == "string" then
		local DecodedTable = HttpService:JSONDecode(String)

		return DecodedTable
	end
end

window.key = Enum.KeyCode.RightShift

circlefov = 100
aimpart = "Head"
aimkey = Enum.UserInputType.MouseButton2
smoothness = 1
tracersM = false
tracers = false
tracersname = false
fov = 20
lerpfov = fov
bright = 0.5
zoomkey = Enum.KeyCode.F1
FovCircle = nil
tog2 = false
fullbright = false
friendCheck = false
wallCheck = false
teamCheck = false
togAim = false

enemyColor = Color3.new(1, 0, 0)
friendColor = Color3.new(0, 1, 0)
teammateColor = Color3.new(0, 0, 1)
fovColor = Color3.new(1, 1, 1)

local function SaveSettings()
    if isfile(Title.."/"..FileNames[1].."/"..FileNames[2]) then
        writefile(Title.."/"..FileNames[1].."/"..FileNames[2], Encode(
            {
                wallCheck;
                teamCheck;
                friendCheck;
                togAim;
                aimkey;
                fov;
                zoomkey;
                smoothness;
                aimpart;
                window.key;
                fullbright;
                bright;
                {enemyColor.R, enemyColor.G, enemyColor.B};
                {friendColor.R, friendColor.G, friendColor.B};
                {teammateColor.R, teammateColor.G, teammateColor.B};
            })
        )
        print(unpack(Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[2]))))
    end

    if isfile(Title.."/"..FileNames[1].."/"..FileNames[2]) then
        writefile(Title.."/"..FileNames[1].."/"..FileNames[3], Encode(
            {
                circlefov, 
                FovCircle ~= nil,
                tracers, 
                tracersM, 
                tracersname, 
                tog2, 
                {fovColor.R, fovColor.G, fovColor.B};
            })
        )
        print(unpack(Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[3]))))
    end
end

if not isfolder(Title) then
    makefolder(Title)
end

if not isfolder(Title.."/"..FileNames[1]) then
    makefolder(Title.."/"..FileNames[1])
end

if not isfile(Title.."/"..FileNames[1].."/"..FileNames[2]) then
    writefile(Title.."/"..FileNames[1].."/"..FileNames[2], Encode(
        {
            wallCheck;
            teamCheck;
            friendCheck;
            togAim;
            aimkey;
            fov;
            zoomkey;
            smoothness;
            aimpart;
            window.key;
            fullbright;
            bright;
            {enemyColor.R, enemyColor.G, enemyColor.B};
            {friendColor.R, friendColor.G, friendColor.B};
            {teammateColor.R, teammateColor.G, teammateColor.B};
        })
    )
else
    local Settings = Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[2]))
    print(unpack(Settings))
    if #Settings >= 15 then
        pcall(function()
            wallCheck = Settings[1]
            teamCheck = Settings[2]
            friendCheck = Settings[3]
            togAim = Settings[4]
            fov = Settings[6]
            smoothness = Settings[8]
            aimpart = Settings[9]
            fullbright = Settings[11]
            bright = Settings[12]
            enemyColor = Color3.new(Settings[13][1], Settings[13][2], Settings[13][3])
            friendColor = Color3.new(Settings[14][1], Settings[14][2], Settings[14][3])
            teammateColor = Color3.new(Settings[15][1], Settings[15][2], Settings[15][3])
        end)
    end
end

if not isfile(Title.."/"..FileNames[1].."/"..FileNames[3]) then
    writefile(Title.."/"..FileNames[1].."/"..FileNames[3], Encode(
        {
            circlefov, 
            FovCircle ~= nil,
            tracers, 
            tracersM, 
            tracersname, 
            tog2, 
            {fovColor.R, fovColor.G, fovColor.B};
        })
    )
else
    local Visuals = Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[3]))
    print(unpack(Visuals))
    if #Visuals >= 7 then
        pcall(function()
            circlefov = Visuals[1]
            tracers = Visuals[3]
            tracersM = Visuals[4]
            tracersname = Visuals[5]
            tog2 = Visuals[6]
            fovColor = Color3.new(Visuals[7][1], Visuals[7][2], Visuals[7][3])

            if Visuals[2] then
                FovCircle = Drawing.new("Circle")
                FovCircle.Visible = true
                FovCircle.Color = fovColor
                FovCircle.Transparency = 1
                FovCircle.Thickness = 2
                FovCircle.Radius = circlefov
                FovCircle.Position = Vector2.new(mouse.X, mouse.Y+36) 
            end
        end)
    end
end

coroutine.wrap(function()
    while wait(10) do
        SaveSettings()
    end
end)()

local function FBright()
    if not fullbright then return end
    Lighting.Ambient = Color3.new(bright, bright, bright)
    Lighting.OutdoorAmbient = Color3.new(bright, bright, bright)
    Lighting.Brightness = 3
    Lighting.GlobalShadows = false
    
    local BlurL = Lighting:FindFirstChildOfClass("BlurEffect")
    if BlurL then
        BlurL:Destroy()
    end
    local DepthL = Lighting:FindFirstChildOfClass("DepthOfFieldEffect")
    if DepthL then
        DepthL:Destroy()
    end
    
    local BlurC = Camera:FindFirstChildOfClass("BlurEffect")
    if BlurC then
        BlurC:Destroy()
    end
    local DepthC = Camera:FindFirstChildOfClass("DepthOfFieldEffect")
    if DepthC then
        DepthC:Destroy()
    end
end

local mouse = Players.LocalPlayer:GetMouse()

section1:toggle({name = "Aimbot",def = togAim,callback = function(value)
    togAim = value
end})
section1:toggle({name = "Wall Check",def = wallCheck,callback = function(value)
    wallCheck = value
end})
section1:toggle({name = "Team Check",def = teamCheck,callback = function(value)
    teamCheck = value
end})
section1:toggle({name = "Friend Check",def = friendCheck,callback = function(value)
    friendCheck = value
end})
section1:toggle({name = "FOV Enabled",def = FovCircle ~= nil,callback = function(value)
    if value then
        FovCircle = Drawing.new("Circle")
        FovCircle.Visible = true
        FovCircle.Color = fovColor
        FovCircle.Transparency = 1
        FovCircle.Thickness = 2
        FovCircle.Radius = circlefov
        FovCircle.Position = Vector2.new(mouse.X, mouse.Y+36) 
    else
        if FovCircle then
            FovCircle:Remove()
            FovCircle = nil
        end
    end
end})
section1:slider({name = "FOV",def = circlefov, max = 300,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
    circlefov = value
    if FovCircle then
        FovCircle.Radius = circlefov
    end
end})

section1:keybind({name = "Aim Key",def = aimkey,callback = function(key)
   aimkey = key
end})
section1:dropdown({name = "Aimpart (W.I.P)",def = aimpart,max = 4,options = {"Head","Torso","Arm","Leg"},callback = function(chosen)
   aimpart = chosen
end})

section1:slider({name = "Smoothness",def = smoothness, max = 10,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
    smoothness = value
end})

mouse.Move:Connect(function()
    if FovCircle then
        FovCircle.Position = Vector2.new(mouse.X, mouse.Y+36)
    end
end)

vsection1:toggle({name = "ESP",def = tog2,callback = function(value)
  tog2 = value
end})
vsection1:toggle({name = "Tracers",def = tracers,callback = function(value)
  tracers = value
end})
vsection1:toggle({name = "Middle Tracers",def = tracersM,callback = function(value)
  tracersM = value
end})
vsection1:toggle({name = "Name ESP",def = tracersname,callback = function(value)
  tracersname = value
end})
vsection1:toggle({name = "Add @ to Name ESP",def = false,callback = function(value)
  NameAndDisplayESP = value
end})

vsection2:slider({name = "Zoom FOV",def = fov, max = 100,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
   fov = value
   Camera.FieldOfView = (zooming and lerpfov) or 70
end})

vsection2:keybind({name = "Zoom Key",def = zoomkey,callback = function(key)
   zoomkey = key
end})

vsection3:toggle({name = "Fullbright",def = fullbright,callback = function(value)
    fullbright = value
    FBright()
end})
vsection3:slider({name = "Brightness",def = bright * 100, max = 100,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
    bright = value/100
    FBright()
end})

section3:keybind({name = "Hide UI",def = window.key,callback = function(key)
   window.key = key
end})
section3:button({name = "Save Config",callback = function(key)
    SaveSettings()
end})

local picker = vsection4:colorpicker({name = "Enemy Color",cpname = nil,def = enemyColor,callback = function(value)
   enemyColor = value
end})

local picker2 = vsection4:colorpicker({name = "Friend Color",cpname = nil,def = friendColor,callback = function(value)
   friendColor = value
end})

local picker3 = vsection4:colorpicker({name = "Teammate Color",cpname = nil,def = teammateColor,callback = function(value)
   teammateColor = value
end})

local picker3 = vsection4:colorpicker({name = "FOV Circle Color",cpname = nil,def = fovColor,callback = function(value)
   fovColor = value
   if FovCircle then
       FovCircle.Color = value
   end
end})

local bgcolor = vsection4:colorpicker({name = "Border Color",cpname = nil,def = window.themeitems.accent.BackgroundColor3[1].BackgroundColor3,callback = function(value)
   window.themeitems.accent.BackgroundColor3[1].BackgroundColor3 = value
end})
local bgcolor2 = vsection4:colorpicker({name = "UI Color",cpname = nil,def = window.tabs.BackgroundColor3,callback = function(value)
   window.tabs.BackgroundColor3 = value
end})

local uis = game:GetService("UserInputService")

zooming = false
uis.InputBegan:Connect(function(input, processed)
    if input.KeyCode == zoomkey then
       zooming = not zooming
       Camera.FieldOfView = (zooming and lerpfov) or 70
    end

    if (input.KeyCode == aimkey or input.UserInputType == aimkey) and togAim then
        holdingaim = true
        while holdingaim and task.wait() do
            if aimat then
                if smoothness == 1 then
                    Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, aimat.Position)
                else
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.lookAt(Camera.CFrame.Position, aimat.Position), 1/smoothness)
                end
            end
        end
    end
end)

uis.InputEnded:Connect(function(input, processed)
    if input.KeyCode == aimkey or input.UserInputType == aimkey then
        holdingaim = false
    end
end)

Camera.Changed:Connect(function()
    if zooming then
       Camera.FieldOfView = lerpfov
    end
end)

Lighting.Changed:Connect(function()
    FBright()
end)

local characters = {}

function CreateChams(Character)
    if Character ~= nil and Character.Parent ~= nil and Character:FindFirstChildOfClass("Humanoid") and Character:FindFirstChild("Head") and Character:FindFirstChild("HumanoidRootPart") then
        if Character:FindFirstChild("Chams") then
            return false
        end

        if not tog2 and not tracers and not tracersname then
            return false
        end

        local Humanoid = Character:FindFirstChildOfClass("Humanoid")

        local Player, FriendsWith = Players:GetPlayerFromCharacter(Character)
        if Player then
            if Player == Players.LocalPlayer then return false end
            FriendsWith = Players.LocalPlayer:IsFriendsWith(Player.UserId)
        end

        local Highlight = Instance.new("Highlight")
        Highlight.Name = "Chams"
        Highlight.Parent = Character
        Highlight.FillColor = enemyColor

        local ManualStop = false
        Humanoid.Died:Connect(function()
            ManualStop = true
        end)

        local Tracer, NameView

        while ManualStop == false and Highlight ~= nil and Character ~= nil and Character.Parent ~= nil and Character:FindFirstChild("Humanoid") and Character:FindFirstChild("Head") and Character:FindFirstChild("HumanoidRootPart") and Humanoid ~= nil and Humanoid.Health > 0 and task.wait(0.02) do
            Highlight.Enabled = tog2
            if Player and Player.Parent then
                local PlayersAmt = 0
                local TeamsPlayers = {}
                for _,t in pairs(game.Teams:GetChildren()) do
                    TeamsPlayers[t.Name] = 0
                end
                for _,p in pairs(game.Players:GetPlayers()) do
                    if p.Team then
                        PlayersAmt += 1
                        TeamsPlayers[p.Team.Name] += 1
                    end
                end

                local IsTeam = (Player.Team == Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 and TeamsPlayers[Player.Team.Name] ~= PlayersAmt)
                FriendsWith = Players.LocalPlayer:IsFriendsWith(Player.UserId)

                if FriendsWith then
                    Highlight.FillColor = friendColor
                    if IsTeam then
                        local R = friendColor.R + teammateColor.R
                        if R > 1 then R = 1 end
                        local G = friendColor.G + teammateColor.G
                        if G > 1 then G = 1 end
                        local B = friendColor.B + teammateColor.B
                        if B > 1 then B = 1 end
                        
                        Highlight.FillColor = Color3.new(R, G, B)
                    end
                elseif IsTeam then
                    Highlight.FillColor = teammateColor
                else
                    Highlight.FillColor = enemyColor
                end
            end

            local Position, OnScreen = Camera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
            if tracers and (OnScreen or tracersM) then
                local div = 1
                if tracersM then
                    div = 2
                end
                if tracersM and not OnScreen then
                    local Offset = (Character.HumanoidRootPart.Position-Camera.CFrame.Position)
                    local Relative = Camera.CFrame:VectorToObjectSpace(Offset)

                    local Position2D = Vector2.new(-Relative.X, Relative.Y)
                    local PositionUnit = Position2D.Unit

                    if not Tracer then
                        Tracer = Drawing.new("Line")
                    end
                    Tracer.Visible = true
                    Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/div)
                    Tracer.To = PositionUnit * -math.abs(Camera.ViewportSize.Y/PositionUnit.Y)
                    Tracer.Color = Highlight.FillColor
                    Tracer.Thickness = 2
                    Tracer.Transparency = 1
                else
                    if not Tracer then
                        Tracer = Drawing.new("Line")
                    end
                    Tracer.Visible = true
                    Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/div)
                    Tracer.To = Vector2.new(Position.X, Position.Y)
                    Tracer.Color = Highlight.FillColor
                    Tracer.Thickness = 2
                    Tracer.Transparency = 1
                end
            else
                if Tracer then
                    Tracer:Remove()
                    Tracer = nil
                end
            end
            
            local Position, OnScreen = Camera:WorldToViewportPoint(Character.Head.Position)
            if tracersname and OnScreen then
                if not NameView then
                    NameView = Drawing.new("Text")
                end

                if Player then
                    NameView.Text = (NameAndDisplayESP and Player.DisplayName.." (@"..Player.Name..")") or Player.DisplayName
                else
                    NameView.Text = Character.Name
                end
                NameView.Visible = true
                NameView.Position = Vector2.new(Position.X, Position.Y)
                NameView.Outline = true
            else
                if NameView then
                    NameView:Remove()
                    NameView = nil
                end
            end
        end

        if Highlight then
            Highlight:Remove()
        end

        if Tracer then
            Tracer:Remove()
        end
        if NameView then
            NameView:Remove()
        end
    end
end

for i,v in pairs(Players:GetChildren()) do
    if v.Character then table.insert(characters, v.Character) end
    v.CharacterAdded:Connect(function(v)
        table.insert(characters, v)
    end)
end
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(v)
        table.insert(characters, v)
    end)
end)

function GetPartsInView()
    local parts = {}
    for i, char in pairs(characters) do
        local obj = char:FindFirstChild(aimpart)
        if obj and obj:IsA("BasePart") and obj.Parent then
            local hum = obj.Parent:FindFirstChildOfClass("Humanoid")
            if hum then
                if hum.Health <= 0 then
                    continue
                end
            end

            if wallCheck == true then
                local RayParams = RaycastParams.new()
                RayParams.FilterDescendantsInstances = characters
                RayParams.FilterType = Enum.RaycastFilterType.Blacklist

                local Ray = workspace:Raycast(Camera.CFrame.Position, ((obj.Position-Camera.CFrame.Position)*10), RayParams)

                if Ray then
                    --Object in way!
                    continue
                end
            end

            if teamCheck == true then
                local player = Players:GetPlayerFromCharacter(char)
                if player then
                    if player.Team == Players.LocalPlayer.Team then
                        continue
                    end
                end
            end

            if friendCheck == true then
                local player = Players:GetPlayerFromCharacter(char)
                if player then
                    if Players.LocalPlayer:IsFriendsWith(player.UserId) then
                        continue
                    end
                end
            end

            local vector, isOnScreen = Camera:WorldToScreenPoint(obj.Position)
            if isOnScreen then
                table.insert(parts, {obj, vector})
            end
        end
    end

    return parts
end

RunService.Heartbeat:Connect(function()
    lerpfov = lerpfov + (fov - lerpfov) * 0.1

    if togAim and Players.LocalPlayer.Character then
        local partsinview = GetPartsInView()
        table.sort(partsinview, function(a, b)
            return (a[1].Position-Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude > (b[1].Position-Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
        end)
        if FovCircle then
            local found = false
            for i,v in pairs(partsinview) do
                if v[2].X < (mouse.X + FovCircle.Radius) and v[2].X > (mouse.X - FovCircle.Radius) then
                    if v[2].Y+36 < (mouse.Y + FovCircle.Radius)+36 and v[2].Y+36 > (mouse.Y - FovCircle.Radius)+36 then
                        if v[1].Name ~= aimpart or (Players.LocalPlayer.Character and v[1]:IsDescendantOf(Players.LocalPlayer.Character)) then continue end
                        found = true
                        aimat = v[1]
                    end
                end
            end
            
            if not found then
                aimat = nil
            end
        else
            local found = false
            for i,v in pairs(partsinview) do
                if v[1].Name ~= aimpart or (Players.LocalPlayer.Character and v[1]:IsDescendantOf(Players.LocalPlayer.Character)) then continue end
                found = true
                aimat = v[1]
            end
            
            if not found then
                aimat = nil
            end
        end
    else
        aimat = nil
    end

    for Index, Player in pairs(Players:GetChildren()) do
        if not Player.Character then continue end
        task.spawn(function()
            CreateChams(Player.Character)
        end)
    end
end)
