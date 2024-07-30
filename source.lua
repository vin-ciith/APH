--DO NOT TOUCH BELOW--
local AllHumanoids = _G.AllHumanoids or false

local Enemy = nil
local Highlights = {}

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local FullBright = false

local UseOtherESP = false

if game.GameId == 372226183 then
    table.insert(Highlights, "ComputerTable")
    Enemy = "Hammer"
elseif game.GameId == 3808081382 then
    UseOtherESP = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end

local TrueZoom = false
local TrueZoomAMT = 20
local TweenedZoomAMT = TrueZoomAMT

loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Aimbot%20V2%20GUI.lua"))()

local TracerEnabled = _G.TracerEnabled or 0
local Lines = {}

local Updating = {}

local BodyParts = {'LeftFoot', 'LeftHand', 'LeftLowerArm', 'LeftLowerLeg', 'LeftUpperArm', 'LeftUpperLeg', 'LowerTorso', 'RightFoot', 'RightHand', 'RightLowerArm', 'RightLowerLeg', 'RightUpperLeg', 'RightUpperArm', 'UpperTorso', 'Head'}

local function CreateHitbox(character, autoUpdate)
    if autoUpdate and character and character ~= game.Players.LocalPlayer.Character then
        if table.find(Updating, character) then return end
        table.insert(Updating, character)
        
		local Highlight = Instance.new("Highlight")
		Highlight.Name = "HitboxChams"
		Highlight.Parent = character
		
		local Tracer
		local NameTracer
		while character ~= nil and task.wait() do
		    if UseOtherESP then
		       for X,Z in pairs(character:GetChildren()) do
                   if Z.ClassName == 'MeshPart' or Z.ClassName == 'Part' and table.find(BodyParts, Z.Name) then
                       if Z:FindFirstChild("ImTheAlphaImTheLeaderImTheOneToTrust") then
                           Z['ImTheAlphaImTheLeaderImTheOneToTrust'].Color3 = Highlight.FillColor
                       else
                           if Z.Name == 'Head' then
                               local headha = Instance.new("CylinderHandleAdornment",Z)
                               headha.Adornee = Z
                               headha.Transparency = 0
                               headha.AlwaysOnTop = true
                               headha.Name = "ImTheAlphaImTheLeaderImTheOneToTrust"
                               headha.ZIndex = 1
                               headha.Color3 = Highlight.FillColor
                               headha.Height = 1.3
                           else
                               local boxha = Instance.new("BoxHandleAdornment",Z)
                               boxha.Adornee = Z
                               boxha.Transparency = 0
                               boxha.AlwaysOnTop = true
                               boxha.Name = "ImTheAlphaImTheLeaderImTheOneToTrust"
                               boxha.Size = Z.Size
                               boxha.ZIndex = 1
                               boxha.Color3 = Highlight.FillColor
                           end
                       end
                   end
               end 
		    end
		    
		    if Highlight == nil or Highlight.Parent == nil then
        		local Highlight = Instance.new("Highlight")
        		Highlight.Name = "HitboxChams"
        		Highlight.Parent = character
		    end
		    
    		if Enemy then
    		    if character:FindFirstChild(Enemy) then
    		        Highlight.FillColor = Color3.new(1, 0, 0)
    		    else
    		        Highlight.FillColor = Color3.new(0, 0, 1)
    		    end
    		else
    		    Highlight.FillColor = Color3.new(1, 0, 0)
    		end
    
    		if Player then
        		if Player.Team == game.Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
        		   Highlight.FillColor = Color3.new(0, 0, 1) 
        		end
    		
    			local IsFriends = Player:IsFriendsWith(game.Players.LocalPlayer.UserId)
    			if IsFriends then
    				Highlight.FillColor = Color3.new(0, 1, 0)
    				if Player.Team == game.Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
    				   Highlight.FillColor = Color3.new(0, 1, 1) 
    				end
    			end
    		end
    
    		if TracerEnabled ~= 0 and TracerEnabled ~= 3 and character:FindFirstChild("HumanoidRootPart") then
    			local ScreenPos, OnScreen = workspace.CurrentCamera:WorldToScreenPoint(character.HumanoidRootPart.Position)
    			if OnScreen then
    			    if not Tracer then
    			        Tracer = Drawing.new("Line")
    			    end
    				Tracer.Visible = true
    				Tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
    				Tracer.To = Vector2.new(ScreenPos.X, ScreenPos.Y)
    				Tracer.Color = Highlight.FillColor
    			else
            		if Tracer then
            		   Tracer:Remove() 
            		   Tracer = nil
            		end
    			end
    		elseif TracerEnabled == 0 or TracerEnabled == 3 then
        		if Tracer then
        		   Tracer:Remove()
        		   Tracer = nil
        		end
    		end
    		
    		if TracerEnabled >= 2 and character:FindFirstChild("HumanoidRootPart") then
    			local ScreenPos, OnScreen = workspace.CurrentCamera:WorldToScreenPoint(character.HumanoidRootPart.Position)
    			if OnScreen then
    			    if not NameTracer then
    			        NameTracer = Drawing.new("Text")
    			    end
    			    if Player then
        			    NameTracer.Text = Player.DisplayName.." (@"..Player.Name..")"
    			    else
    			        NameTracer.Text = character.Name
    			    end
    				NameTracer.Visible = true
    				NameTracer.Outline = true
    				NameTracer.Position = Vector2.new(ScreenPos.X, ScreenPos.Y)
    				NameTracer.OutlineColor = Color3.new(0, 0, 0)
    			else
            		if NameTracer then
            		   NameTracer:Remove() 
            		   NameTracer = nil
            		end
    			end
    		elseif TracerEnabled <= 1 then
        		if NameTracer then
        		   NameTracer:Remove()
        		   NameTracer = nil
        		end
    		end
		end
		
		if Tracer then
		    Tracer:Remove() 
            Tracer = nil
		end
		if NameTracer then
		    NameTracer:Remove()
		    NameTracer = nil
		end
    elseif character and not character:FindFirstChild("HitboxChams") and character ~= game.Players.LocalPlayer.Character then
		local Highlight = Instance.new("Highlight")
		Highlight.Name = "HitboxChams"
		Highlight.Parent = character
		Highlight.FillColor = Color3.new(1, 0, 0)

		local Player = game.Players:GetPlayerFromCharacter(character)
		if Player then
    		if Player.Team == game.Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
    		   Highlight.FillColor = Color3.new(0, 0, 1) 
    		end
		
			local IsFriends = Player:IsFriendsWith(game.Players.LocalPlayer.UserId)
			if IsFriends then
				Highlight.FillColor = Color3.new(0, 1, 0)
				if Player.Team == game.Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
				   Highlight.FillColor = Color3.new(0, 1, 1) 
				end
			end
		end
	elseif character and character ~= game.Players.LocalPlayer.Character then
		local Highlight = character:WaitForChild("HitboxChams")
		if Enemy then
		    if character:FindFirstChild(Enemy) then
		        Highlight.FillColor = Color3.new(1, 0, 0)
		    else
		        Highlight.FillColor = Color3.new(0, 0, 1)
		    end
		else
		    Highlight.FillColor = Color3.new(1, 0, 0)
		end

		local Player = game.Players:GetPlayerFromCharacter(character)
		if Player then
    		if Player.Team == game.Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
    		   Highlight.FillColor = Color3.new(0, 0, 1) 
    		end
		
			local IsFriends = Player:IsFriendsWith(game.Players.LocalPlayer.UserId)
			if IsFriends then
				Highlight.FillColor = Color3.new(0, 1, 0)
				if Player.Team == game.Players.LocalPlayer.Team and #game.Teams:GetChildren() > 1 then
				   Highlight.FillColor = Color3.new(0, 1, 1) 
				end
			end
		end

		if TracerEnabled and character:FindFirstChild("HumanoidRootPart") then
			local ScreenPos, OnScreen = workspace.CurrentCamera:WorldToScreenPoint(character.HumanoidRootPart.Position)
			if OnScreen then
				local Tracer = Drawing.new("Line")
				Tracer.Visible = true
				Tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
				Tracer.To = Vector2.new(ScreenPos.X, ScreenPos.Y)
				Tracer.Color = Highlight.FillColor

				table.insert(Lines, Tracer)
			end
		end
	end
end

local function FBright()
    if game.Lighting:FindFirstChildOfClass("DepthOfFieldEffect") then
        game.Lighting:FindFirstChildOfClass("DepthOfFieldEffect"):Remove()
    elseif workspace.CurrentCamera:FindFirstChildOfClass("DepthOfFieldEffect") then
        workspace.CurrentCamera:FindFirstChildOfClass("DepthOfFieldEffect"):Remove()
    end
    if game.Lighting:FindFirstChildOfClass("BlurEffect") then
        game.Lighting:FindFirstChildOfClass("BlurEffect"):Remove()
    elseif workspace.CurrentCamera:FindFirstChildOfClass("BlurEffect") then
        workspace.CurrentCamera:FindFirstChildOfClass("BlurEffect"):Remove()
    end
	game.Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
	game.Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
	game.Lighting.Brightness = 3
	game.Lighting.EnvironmentDiffuseScale = 1
	game.Lighting.EnvironmentSpecularScale = 1
	game.Lighting.GlobalShadows = false
	if game.Lighting:FindFirstChild("Atmosphere") then
		game.Lighting.Atmosphere:Remove()
	else
		game.Lighting.FogEnd = 1000000
	end
end

UserInputService.InputBegan:Connect(function(input, processed)
	if input.KeyCode == Enum.KeyCode.Equals then
		TrueZoomAMT = TrueZoomAMT - 5
	elseif input.KeyCode == Enum.KeyCode.Minus then
		TrueZoomAMT = TrueZoomAMT + 5
	elseif input.KeyCode == Enum.KeyCode.F1 then
		TrueZoom = not TrueZoom
		if not TrueZoom then
			workspace.CurrentCamera.FieldOfView = 70
		end
	elseif input.KeyCode == Enum.KeyCode.F2 then
		TracerEnabled = TracerEnabled + 1
		if TracerEnabled == 4 then
		   TracerEnabled = 0 
		end
	elseif input.KeyCode == Enum.KeyCode.F3  then
		FullBright = not FullBright
    	if FullBright then
    	    FBright()
    	end
	end
end)

local function v1(v)
    if table.find(Highlights, v.Name) then
        local Highlight = Instance.new("Highlight")
        Highlight.Parent = v
        if v:IsA("Model") and v.PrimaryPart then
           Highlight.FillColor = v.PrimaryPart.Color
        end
    end
    
    if v:IsA("Model") and not game.Players:GetPlayerFromCharacter(v) then
        if AllHumanoids and v:FindFirstChildOfClass("Humanoid") then
           CreateHitbox(v, true)
        end
    end
end

workspace.DescendantAdded:Connect(function(v)
    v1(v)
end)
for _, v in pairs(workspace:GetDescendants()) do
    v1(v)
end

RunService.Heartbeat:Connect(function(deltaTime)
	for _, Line in pairs(Lines) do
		Line:Remove()
	end

	for _, Player in pairs(game.Players:GetPlayers()) do
		CreateHitbox(Player.Character, true)
	end

	TweenedZoomAMT = TweenedZoomAMT + (TrueZoomAMT - TweenedZoomAMT) * 0.1

	if TrueZoom then
		workspace.CurrentCamera.FieldOfView = TweenedZoomAMT
	end
end)

game.Lighting.Changed:Connect(function()
	if FullBright then
	    FBright()
	end
end)
