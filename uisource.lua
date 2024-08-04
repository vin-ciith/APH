repeat task.wait() until game:IsLoaded()

local Title = "Alpha Hub UI"
local FileNames = {"MainSave", "Configuration.json", "Drawing.json"}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/SplixUiLib/main/Main"))()

local windowColor = Color3.fromRGB(225,58,81)
local window = library:new({textsize = 13.5,font = Enum.Font.RobotoMono,name = Title,color = windowColor})

window.outline.Size = UDim2.new(0, 600, 0, 480)

local tab = window:page({name = "Main"})
local tab2 = window:page({name = "Visuals"})
local credtab = window:page({name = "Credits"})

local credsVin = credtab:section({name = "Vinciith",side = "left",size = 25})
local credsAlpha = credtab:section({name = "AlphaDawg2007",side = "left",size = 25})

local credsThinkers = credtab:section({name = "'hi' - Thinkers",side = "right",size = 50})
credsThinkers:button({name = "press me",callback = function()
	local sound = Instance.new("Sound")
	sound.Name = "YIPPEE!!"
	sound.Parent = workspace
	sound.SoundId = "rbxassetid://7933571710"
	sound:Play()
	game:GetService("Debris"):AddItem(sound, 5)

	local Part = Instance.new("Part")
	Part.Anchored = true
	Part.BottomSurface = Enum.SurfaceType.Smooth
	Part.CanCollide = false
	Part.Transparency = 1
	Part.TopSurface = Enum.SurfaceType.Smooth
	Part.Color = Color3.fromRGB(255, 175, 0)
	Part.Material = Enum.Material.SmoothPlastic
	Part.Size = Vector3.new(2, 2, 1)
	Part.CFrame = CFrame.new(-0.8839893341064453, 1, -0.54254150390625, 0, 0, 1, 0, 1, -0, -1, 0, 0)
	Part.formFactor = Enum.FormFactor.Symmetric
	Part.Parent = workspace.CurrentCamera
	Part.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0,0,-2)

	local ParticleEmitter = Instance.new("ParticleEmitter")
	ParticleEmitter.Lifetime = NumberRange.new(1, 2)
	ParticleEmitter.SpreadAngle = Vector2.new(360, 360)
	ParticleEmitter.LockedToPart = true
	ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
	ParticleEmitter.VelocitySpread = 360
	ParticleEmitter.Speed = NumberRange.new(10, 10)
	ParticleEmitter.Size = NumberSequence.new(0.1)
	ParticleEmitter.Enabled = false
	ParticleEmitter.Acceleration = Vector3.new(0, -10, 0)
	ParticleEmitter.Rate = 99
	ParticleEmitter.Texture = "http://www.roblox.com/asset/?id=241685484"
	ParticleEmitter.RotSpeed = NumberRange.new(260, 260)
	ParticleEmitter.Parent = Part

	local ParticleEmitter1 = Instance.new("ParticleEmitter")
	ParticleEmitter1.Lifetime = NumberRange.new(1, 2)
	ParticleEmitter1.SpreadAngle = Vector2.new(360, 360)
	ParticleEmitter1.LockedToPart = true
	ParticleEmitter1.Color = ColorSequence.new(Color3.fromRGB(230, 255, 0), Color3.fromRGB(255, 238, 0))
	ParticleEmitter1.VelocitySpread = 360
	ParticleEmitter1.Speed = NumberRange.new(10, 10)
	ParticleEmitter1.Size = NumberSequence.new(0.1)
	ParticleEmitter1.Enabled = false
	ParticleEmitter1.Acceleration = Vector3.new(0, -10, 0)
	ParticleEmitter1.Rate = 99
	ParticleEmitter1.Texture = "http://www.roblox.com/asset/?id=241685484"
	ParticleEmitter1.RotSpeed = NumberRange.new(260, 260)
	ParticleEmitter1.Parent = Part

	local ParticleEmitter2 = Instance.new("ParticleEmitter")
	ParticleEmitter2.Lifetime = NumberRange.new(1, 2)
	ParticleEmitter2.SpreadAngle = Vector2.new(360, 360)
	ParticleEmitter2.LockedToPart = true
	ParticleEmitter2.Color = ColorSequence.new(Color3.fromRGB(46, 255, 0))
	ParticleEmitter2.VelocitySpread = 360
	ParticleEmitter2.Speed = NumberRange.new(10, 10)
	ParticleEmitter2.Size = NumberSequence.new(0.1)
	ParticleEmitter2.Enabled = false
	ParticleEmitter2.Acceleration = Vector3.new(0, -10, 0)
	ParticleEmitter2.Rate = 99
	ParticleEmitter2.Texture = "http://www.roblox.com/asset/?id=241685484"
	ParticleEmitter2.RotSpeed = NumberRange.new(260, 260)
	ParticleEmitter2.Parent = Part

	local ParticleEmitter3 = Instance.new("ParticleEmitter")
	ParticleEmitter3.Lifetime = NumberRange.new(1, 2)
	ParticleEmitter3.SpreadAngle = Vector2.new(360, 360)
	ParticleEmitter3.LockedToPart = true
	ParticleEmitter3.Color = ColorSequence.new(Color3.fromRGB(0, 25, 255), Color3.fromRGB(0, 0, 255))
	ParticleEmitter3.VelocitySpread = 360
	ParticleEmitter3.Speed = NumberRange.new(10, 10)
	ParticleEmitter3.Size = NumberSequence.new(0.1)
	ParticleEmitter3.Enabled = false
	ParticleEmitter3.Acceleration = Vector3.new(0, -10, 0)
	ParticleEmitter3.Rate = 99
	ParticleEmitter3.Texture = "http://www.roblox.com/asset/?id=241685484"
	ParticleEmitter3.RotSpeed = NumberRange.new(260, 260)
	ParticleEmitter3.Parent = Part

	local ParticleEmitter4 = Instance.new("ParticleEmitter")
	ParticleEmitter4.Lifetime = NumberRange.new(1, 2)
	ParticleEmitter4.SpreadAngle = Vector2.new(360, 360)
	ParticleEmitter4.LockedToPart = true
	ParticleEmitter4.Color = ColorSequence.new(Color3.fromRGB(0, 255, 226))
	ParticleEmitter4.VelocitySpread = 360
	ParticleEmitter4.Speed = NumberRange.new(10, 10)
	ParticleEmitter4.Size = NumberSequence.new(0.1)
	ParticleEmitter4.Enabled = false
	ParticleEmitter4.Acceleration = Vector3.new(0, -10, 0)
	ParticleEmitter4.Rate = 99
	ParticleEmitter4.Texture = "http://www.roblox.com/asset/?id=241685484"
	ParticleEmitter4.RotSpeed = NumberRange.new(260, 260)
	ParticleEmitter4.Parent = Part

	ParticleEmitter:Emit(50)
	ParticleEmitter1:Emit(50)
	ParticleEmitter2:Emit(50)
	ParticleEmitter3:Emit(50)
	ParticleEmitter4:Emit(50)
	while game:GetService("RunService").Heartbeat:Wait() and sound.IsPlaying do
		Part.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(0,0,-2)
	end
	Part:Destroy()
end})

local section1 = tab:section({name = "Aimbot",side = "left",size = 260})
local section2 = tab:section({name = "Player",side = "Left",size = 125})
local section3 = tab:section({name = "Settings",side = "right",size = 75})

local vsection1 = tab2:section({name = "ESP",side = "left",size=125})
local vsection2 = tab2:section({name = "Zoom",side = "right",size=75})
local vsection3 = tab2:section({name = "Lighting",side = "left",size=75})
local vsection4 = tab2:section({name = "Colors",side = "right",size=150})

local townPassive = nil
if game.GameId == 1718755273 then
	local townSection = tab:section({name = "town",side = "right",size=75})

	townPassive = Color3.new(1, 1, 1)
	local passivePicker = townSection:colorpicker({name = "Passive Color",cpname = nil,def = townPassive,callback = function(value)
		townPassive = value
	end})	

	townCheck = true
	townSection:toggle({name = "Passive Check (Aimbot)",def = townCheck,callback = function(value)
		townCheck = value
	end})
end

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

noclip = false
walkspeedEnabled = false
clicktp = false
walkspeed = 16
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
				tostring(aimkey);
				fov;
				tostring(zoomkey);
				smoothness;
				aimpart;
				tostring(window.key);
				fullbright;
				bright;
				{enemyColor.R, enemyColor.G, enemyColor.B};
				{friendColor.R, friendColor.G, friendColor.B};
				{teammateColor.R, teammateColor.G, teammateColor.B};
				noclip,
				walkspeedEnabled,
				walkspeed,
				clicktp
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
			tostring(aimkey);
			fov;
			tostring(zoomkey);
			smoothness;
			aimpart;
			tostring(window.key);
			fullbright;
			bright;
			{enemyColor.R, enemyColor.G, enemyColor.B};
			{friendColor.R, friendColor.G, friendColor.B};
			{teammateColor.R, teammateColor.G, teammateColor.B};
			noclip,
			walkspeedEnabled,
			walkspeed,
			clicktp
		})
	)
else
	local Settings = Decode(readfile(Title.."/"..FileNames[1].."/"..FileNames[2]))
	print(unpack(Settings))
	if #Settings >= 15 then
		pcall(function()
			if Settings[5] ~= nil then
				print(string.split(tostring(Settings[5]), ".")[3])
				aimkey = Enum[string.split(tostring(Settings[5]), ".")[2]][string.split(tostring(Settings[5]), ".")[3]]
			end
			if Settings[7] ~= nil then
				print(string.split(tostring(Settings[7]), ".")[3])
				zoomkey = Enum[string.split(tostring(Settings[7]), ".")[2]][string.split(tostring(Settings[7]), ".")[3]]
			end
			if Settings[10] ~= nil then
				print(string.split(tostring(Settings[10]), ".")[3])
				window.key = Enum[string.split(tostring(Settings[10]), ".")[2]][string.split(tostring(Settings[10]), ".")[3]]
			end
			
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
			noclip = Settings[16]
			walkspeedEnabled = Settings[17]
			walkspeed = Settings[18]
			clicktp = Settings[19]
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

local DefaultLighting, Reset
local function FBright()
	DefaultLighting = DefaultLighting or {
		Lighting.Ambient,
		Lighting.OutdoorAmbient,
		Lighting.Brightness,
		Lighting.GlobalShadows
	}
	if not fullbright then
		if not Reset then
			Reset = true
			Lighting.Ambient = DefaultLighting[1]
			Lighting.OutdoorAmbient = DefaultLighting[2]
			Lighting.Brightness = DefaultLighting[3]
			Lighting.GlobalShadows = DefaultLighting[4]
		end
		return 
	end
	Reset = false
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
section1:dropdown({name = "Aimpart (R6)",def = aimpart,max = 4,options = {"Head","Torso"},callback = function(chosen)
	aimpart = chosen
end})

section1:slider({name = "Smoothness",def = smoothness, max = 10,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
	smoothness = value
end})

section2:toggle({name = "Toggle WalkSpeed",def = walkspeedEnabled,callback = function(value)
	walkspeedEnabled = value
end})
section2:slider({name = "WalkSpeed",def = walkspeed, max = 250,min = 1,rounding = true,ticking = false,measuring = "",callback = function(value)
	walkspeed = value
end})
section2:toggle({name = "Noclip",def = noclip,callback = function(value)
	noclip = value
end})
section2:toggle({name = "CTRL+Click Teleport",def = clicktp,callback = function(value)
	clicktp = value
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

local fovSlider = vsection2:slider({name = "Zoom FOV (= or -)",def = fov, max = 100,min = 5,rounding = true,ticking = false,measuring = "",callback = function(value)
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
	elseif input.KeyCode == Enum.KeyCode.Equals then
		fov = fov - 5
		if fov < fovSlider.min then
			fov = fovSlider.min
		end
		fovSlider:set(fov)
	elseif input.KeyCode == Enum.KeyCode.Minus then
		fov = fov + 5
		if fov > fovSlider.max then
			fov = fovSlider.max
		end
		fovSlider:set(fov)
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

		while ManualStop == false and Highlight ~= nil and Character ~= nil and Character.Parent ~= nil and Character:FindFirstChild("Humanoid") and Character:FindFirstChild("Head") and Character:FindFirstChild("HumanoidRootPart") and Humanoid ~= nil and Humanoid.Health > 0 and task.wait(0.05) do
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
				elseif townPassive ~= nil and Character.Head.Material == Enum.Material.ForceField then
					Highlight.FillColor = townPassive
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
			if game.GameId == 1718755273 then --town
				if char.Parent ~= workspace or char == nil then
					continue
				end
			end

			local hum = obj.Parent:FindFirstChildOfClass("Humanoid")
			if hum then
				if hum.Health <= 0 then
					continue
				end
			end

			if wallCheck == true then
				local RayParams = RaycastParams.new()
				RayParams.FilterDescendantsInstances = characters
				RayParams.FilterType = Enum.RaycastFilterType.Exclude

				local ray = workspace:Raycast(Camera.CFrame.Position, ((obj.Position-Camera.CFrame.Position)), RayParams)

				if ray then
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

			if townCheck ~= nil and townCheck == true then
				if obj.Material == Enum.Material.ForceField then
					continue
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

local holdingCTRL = false

local wsConnect
local resetWS = true
local resetNC = true

RunService.Heartbeat:Connect(function()
	lerpfov = lerpfov + (fov - lerpfov) * 0.1
	
	if zooming then
		Camera.FieldOfView = lerpfov
	end

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

	if clicktp and uis:IsKeyDown(Enum.KeyCode.LeftControl) then
		holdingCTRL = true
	else
		holdingCTRL = false
	end

	if noclip then
		resetNC = false
		if not noclipParts then
			noclipParts = {}
			for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("BasePart") and v.CanCollide then
					table.insert(noclipParts, v.Name)
				end
			end
		end

		for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	else
		if noclipParts and not resetNC then
			resetNC = true
			for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
				if table.find(noclipParts, v.Name) then
					v.CanCollide = true
				end
			end
		end
	end

	if Players.LocalPlayer.Character then
		local Humanoid = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if Humanoid then
			if walkspeedEnabled then
				resetWS = false
				Humanoid.WalkSpeed = walkspeed
				if not wsConnect then
					wsConnect = Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
						Humanoid.WalkSpeed = walkspeed
					end)
				end
			elseif not resetWS then
				resetWS = true
				if wsConnect then
					wsConnect:Disconnect()
					wsConnect = nil
				end
				Humanoid.WalkSpeed = game.StarterPlayer.CharacterWalkSpeed
			end
		end
	end

	for Index, Player in pairs(Players:GetChildren()) do
		if not Player.Character then continue end
		task.spawn(function()
			CreateChams(Player.Character)
		end)
	end
end)

mouse.Button1Down:Connect(function()
	if holdingCTRL and clicktp then
		local pos = mouse.Hit.Position
		if Players.LocalPlayer.Character then
			local HRP = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if HRP then
				Players.LocalPlayer.Character:PivotTo(CFrame.new(pos + Vector3.new(0, 3.5, 0)))
			end
		end
	end
end)
