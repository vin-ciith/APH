--DO NOT TOUCH BELOW--
local AllHumanoids = _G.AllHumanoids or false

local Enemy = nil
local Highlights = {}

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local FullBright = false

if game.GameId == 372226183 then
    table.insert(Highlights, "ComputerTable")
    Enemy = "Hammer"
end

local TrueZoom = false
local TrueZoomAMT = 20
local TweenedZoomAMT = TrueZoomAMT

loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Aimbot%20V2%20GUI.lua"))()

local TracerEnabled = false
local Lines = {}

local Updating = {}

local function CreateHitbox(character, autoUpdate)
    if autoUpdate and character ~= game.Players.LocalPlayer.Character then
        if table.find(Updating, character) then return end
        table.insert(Updating, character)
        
		local Highlight = Instance.new("Highlight")
		Highlight.Name = "HitboxChams"
		Highlight.Parent = character
		
		local Tracer
		while character ~= nil and task.wait() do
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
    
    		if TracerEnabled and character:FindFirstChild("HumanoidRootPart") then
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
    		elseif not TracerEnabled then
        		if Tracer then
        		   Tracer:Remove()
        		   Tracer = nil
        		end
    		end
		end
		if Tracer then
		    Tracer:Remove() 
            Tracer = nil
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

UserInputService.InputBegan:Connect(function(input, processed)
	if input.KeyCode == Enum.KeyCode.Equals then
		TrueZoomAMT -= 5
	elseif input.KeyCode == Enum.KeyCode.Minus then
		TrueZoomAMT += 5
	elseif input.KeyCode == Enum.KeyCode.F1 then
		TrueZoom = not TrueZoom
		if not TrueZoom then
			workspace.CurrentCamera.FieldOfView = 70
		end
	elseif input.KeyCode == Enum.KeyCode.F2 then
		TracerEnabled = not TracerEnabled
	elseif input.KeyCode == Enum.KeyCode.F3  then
		FullBright = not FullBright
    	if FullBright then
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
end)
