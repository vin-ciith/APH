repeat task.wait() until game:IsLoaded()

local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local function FBright()
    if not fullbright then return end
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
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

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/SplixUiLib/main/Main"))()

local windowColor = Color3.fromRGB(225,58,81)
local window = library:new({textsize = 13.5,font = Enum.Font.RobotoMono,name = "Alpha Hub",color = windowColor})

window.outline.Size = UDim2.new(0, 600, 0, 460)

local tab = window:page({name = "Main"})

local section1 = tab:section({name = "Aimbot",side = "left",size = 260})
local section2 = tab:section({name = "Visual",side = "right",size = 270})
local section3 = tab:section({name = "Settings",side = "left",size = 100})

local mouse = Players.LocalPlayer:GetMouse()

circlefov = 100
section1:toggle({name = "Aimbot",def = false,callback = function(value)
    togAim = value
end})
section1:toggle({name = "Wall Check",def = false,callback = function(value)
    wallCheck = value
end})
section1:toggle({name = "Team Check",def = false,callback = function(value)
    teamCheck = value
end})
section1:toggle({name = "FOV Enabled",def = false,callback = function(value)
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

aimpart = "Head"
aimkey = Enum.UserInputType.MouseButton2
section1:keybind({name = "Aim Key",def = zoomkey,callback = function(key)
   aimkey = key
end})
section1:dropdown({name = "Aimpart (W.I.P)",def = "Head",max = 4,options = {"Head","Torso","Arm","Leg"},callback = function(chosen)
   aimpart = chosen
end})

smoothness = 1
section1:slider({name = "Smoothness",def = smoothness, max = 10,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
    smoothness = value
end})

mouse.Move:Connect(function()
    if FovCircle then
        FovCircle.Position = Vector2.new(mouse.X, mouse.Y+36)
    end
end)

tracersM = false
section2:toggle({name = "ESP",def = false,callback = function(value)
  tog2 = value
end})
section2:toggle({name = "Tracers",def = false,callback = function(value)
  tracers = value
end})
section2:toggle({name = "Middle Tracers",def = false,callback = function(value)
  tracersM = value
end})
section2:toggle({name = "Name ESP",def = false,callback = function(value)
  tracersname = value
end})
section2:toggle({name = "Add @ to Name ESP",def = false,callback = function(value)
  NameAndDisplayESP = value
end})

fov = 20
lerpfov = fov

section2:slider({name = "Zoom FOV",def = fov, max = 100,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
   fov = value
   Camera.FieldOfView = (zooming and lerpfov) or 70
end})

zoomkey = Enum.KeyCode.F1
section2:keybind({name = "Zoom Key",def = zoomkey,callback = function(key)
   zoomkey = key
end})

section2:toggle({name = "Fullbright",def = false,callback = function(value)
    fullbright = value
    FBright()
end})

section3:keybind({name = "Hide UI",def = Enum.KeyCode.RightShift,callback = function(key)
   window.key = key
end})

enemyColor = Color3.new(1, 0, 0)
local picker = section2:colorpicker({name = "Enemy Color",cpname = nil,def = enemyColor,callback = function(value)
   enemyColor = value
end})

friendColor = Color3.new(0, 1, 0)
local picker2 = section2:colorpicker({name = "Friend Color",cpname = nil,def = friendColor,callback = function(value)
   friendColor = value
end})

teammateColor = Color3.new(0, 0, 1)
local picker3 = section2:colorpicker({name = "Teammate Color",cpname = nil,def = teammateColor,callback = function(value)
   teammateColor = value
end})

fovColor = Color3.new(1, 1, 1)
local picker3 = section2:colorpicker({name = "FOV Circle Color",cpname = nil,def = fovColor,callback = function(value)
   fovColor = value
   if FovCircle then
       FovCircle.Color = value
   end
end})

local bgcolor = section3:colorpicker({name = "Border Color",cpname = nil,def = windowColor,callback = function(value)
   window.themeitems.accent.BackgroundColor3[1].BackgroundColor3 = value
end})
local bgcolor2 = section3:colorpicker({name = "UI Color",cpname = nil,def = windowColor,callback = function(value)
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
    if Character and (not Character:FindFirstChild("Head") or not Character:FindFirstChild("HumanoidRootPart")) then return false end
    local Player = Players:GetPlayerFromCharacter(Character)
    if Player and Player == Players.LocalPlayer then return end
    if Character == nil or Character.Parent == nil or Character:FindFirstChild("Chams") then return end

    local Highlight = Instance.new("Highlight")
    Highlight.Parent = Character
    Highlight.Name = "Chams"
    Highlight.FillColor = enemyColor
    Highlight.Enabled = tog2

    if Player and Players.LocalPlayer:IsFriendsWith(Player.UserId) then
        Highlight.FillColor = friendColor
        if Player.Team == Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
            local R = friendColor.R + teammateColor.R
            if R > 1 then R = 1 end
            local G = friendColor.G + teammateColor.G
            if G > 1 then G = 1 end
            local B = friendColor.B + teammateColor.B
            if B > 1 then B = 1 end
            
            Highlight.FillColor = Color3.new(R, G, B)
        end
    end

    if Player and Player.Team == Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
        Highlight.FillColor = teammateColor
    end

    local Tracer, NameTracer

    local ABORT = false
    local c
    c=Players.PlayerRemoving:Connect(function(p)
        ABORT = true
        Highlight:Destroy()
        c:Disconnect()

        if Tracer then
            Tracer.Visible = false
            Tracer:Remove()
            Tracer = nil
        end
        if NameTracer then
            NameTracer.Visible = false
            NameTracer:Remove()
            NameTracer = nil
        end
    end)

    local hum = Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.Died:Connect(function()
            for i,v in pairs(characters) do
                if v == Character then
                    table.remove(characters, i)
                end
            end
            ABORT = true
            Highlight:Destroy()

            if Tracer then
                Tracer.Visible = false
                Tracer:Remove()
                Tracer = nil
            end
            if NameTracer then
                NameTracer.Visible = false
                NameTracer:Remove()
                NameTracer = nil
            end
        end)
    else
        ABORT = true
        Highlight:Destroy()

        if Tracer then
            Tracer.Visible = false
            Tracer:Remove()
            Tracer = nil
        end
        if NameTracer then
            NameTracer.Visible = false
            NameTracer:Remove()
            NameTracer = nil
        end
    end

    while Highlight and Character and Character:FindFirstChild("HumanoidRootPart") and not ABORT and task.wait() do
        Highlight.Enabled = tog2
        Highlight.FillColor = enemyColor

        if Player and Players.LocalPlayer:IsFriendsWith(Player.UserId) then
            Highlight.FillColor = friendColor
            if Player.Team == Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
                local R = friendColor.R + teammateColor.R
                if R > 1 then R = 1 end
                local G = friendColor.G + teammateColor.G
                if G > 1 then G = 1 end
                local B = friendColor.B + teammateColor.B
                if B > 1 then B = 1 end
                
                Highlight.FillColor = Color3.new(R, G, B)
            end
        end

        if Player and Player.Team == Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
            Highlight.FillColor = teammateColor
        end

        if not Character or not Character:FindFirstChild("HumanoidRootPart") then break end
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
        
        if not Character or not Character:FindFirstChild("Head") then break end
        local Position, OnScreen = Camera:WorldToViewportPoint(Character.Head.Position)
        if tracersname and OnScreen then
            if not NameTracer then
                NameTracer = Drawing.new("Text")
            end

            if Player then
                NameTracer.Text = (NameAndDisplayESP and Player.DisplayName.." (@"..Player.Name..")") or Player.DisplayName
            else
                NameTracer.Text = Character.Name
            end
            NameTracer.Visible = true
            NameTracer.Position = Vector2.new(Position.X, Position.Y)
            NameTracer.Outline = true
        else
            if NameTracer then
                NameTracer:Remove()
                NameTracer = nil
            end
        end
    end

    if Tracer then
        Tracer.Visible = false
        Tracer:Remove()
        Tracer = nil
    end
    if NameTracer then
        NameTracer.Visible = false
        NameTracer:Remove()
        NameTracer = nil
    end
end

workspace.DescendantAdded:Connect(function(v)
    if v:FindFirstChildOfClass("Humanoid") then
        table.insert(characters, v)
    end
end)
for i,v in pairs(workspace:GetDescendants()) do
    if v:FindFirstChildOfClass("Humanoid") then
        table.insert(characters, v)
    end
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
            if wallCheck then
                local RayParams = RaycastParams.new()
                RayParams.FilterDescendantsInstances = characters
                RayParams.FilterType = Enum.RaycastFilterType.Blacklist

                local Ray = workspace:Raycast(Camera.CFrame.Position, ((obj.Position-Camera.CFrame.Position)*10), RayParams)

                if Ray then
                    --Object in way!
                    continue
                end
            end

            if teamCheck then
                local player = Players:GetPlayerFromCharacter(char)
                if player then
                    if player.Team == Players.LocalPlayer.Team then
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
        end
    else
        aimat = nil
    end

    for Index, Character in pairs(characters) do
        task.spawn(function()
            CreateChams(Character)
        end)
    end
end)
