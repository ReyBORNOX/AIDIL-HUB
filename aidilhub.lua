local player = game.Players.LocalPlayer

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "AIDIL HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "LocalPlayer"
})

--[[
Name = <string> - The name of the section.
]]

OrionLib:MakeNotification({
	Name = "welcome",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number>layer ~= player and otherPlayer.Character then
            local humanoidRootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local screenPos, visible = camera:WorldToScreenPoint(humanoidRootPart.Position)
                if visible then
                    local mousePos = UserInputService:GetMouseLocation()
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if distance < shortestDistance then
                        closest = humanoidRootPart
                        shortestDistance = distance
                    end
                end
            end
        end
    end
    return closest - The duration of the notfication.
]]

Tab:AddButton({
	Name = "Player Speed",
	Callback = function()
      		player.Character.Humanoid.WalkSpeed = 50
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "esp",
	Callback = function()
      		-- LocalScript: Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Customize highlight colors
local HIGHLIGHT_COLOR = Color3.fromRGB(255, 0, 0) -- Bright red
local OUTLINE_COLOR = Color3.fromRGB(255, 255, 255) -- White outline

-- Function to apply highlight
local function applyHighlight(character)
	if not character:FindFirstChild("HumanoidRootPart") then
		character:WaitForChild("HumanoidRootPart")
	end

	-- Avoid adding duplicate highlight
	if character:FindFirstChild("PlayerHighlight") then return end

	local highlight = Instance.new("Highlight")
	highlight.Name = "PlayerHighlight"
	highlight.FillColor = HIGHLIGHT_COLOR
	highlight.OutlineColor = OUTLINE_COLOR
	highlight.FillTransparency = 0.3
	highlight.OutlineTransparency = 0
	highlight.Adornee = character
	highlight.Parent = character
end

-- Function to handle a new player
local function handlePlayer(player)
	if player == LocalPlayer then return end

	player.CharacterAdded:Connect(function(char)
		applyHighlight(char)
	end)

	-- Handle existing character
	if player.Character then
		applyHighlight(player.Character)
	end
end

-- Set up all current players
for _, player in ipairs(Players:GetPlayers()) do
	handlePlayer(player)
end

-- Handle future players
Players.PlayerAdded:Connect(handlePlayer)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "esp tracer",
	Callback = function()
      		-- LocalScript: place in StarterPlayerScripts

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function createTracer(fromPart, toPart)
	local att0 = Instance.new("Attachment", fromPart)
	local att1 = Instance.new("Attachment", toPart)

	local beam = Instance.new("Beam")
	beam.Attachment0 = att0
	beam.Attachment1 = att1
	beam.Width0 = 0.1
	beam.Width1 = 0.1
	beam.FaceCamera = true
	beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
	beam.Transparency = NumberSequence.new(0.25)
	beam.Name = "TracerBeam"
	beam.Parent = fromPart

	return beam
end

local function setupTracers()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local tracer = createTracer(LocalPlayer.Character.HumanoidRootPart, player.Character.HumanoidRootPart)
				game.Debris:AddItem(tracer, 0.1) -- clean up
			end
		end
	end
end

-- Update tracers every frame
RunService.RenderStepped:Connect(function()
	setupTracers()
end)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "noclip toggle N",
	Callback = function()
      		-- LocalScript: Noclip toggle with 'N' key
-- Place inside StarterPlayer > StarterPlayerScripts

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local noclip = false

-- Toggle noclip
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.N then
		noclip = not noclip
		print("Noclip:", noclip and "ON" or "OFF")
	end
end)

-- Disable collisions if noclip is on
RunService.Stepped:Connect(function()
	if noclip and LocalPlayer.Character then
		for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide then
				part.CanCollide = false
			end
		end
	end
end)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "click tp only pc and this cant stop",
	Callback = function()
      		-- Teleport player by clicking anywhere in the game world

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()  -- Get the mouse to detect clicks

-- Function to teleport player to clicked position
local function onMouseClick()
    -- Get the position of the click in world space
    local targetPosition = mouse.Hit.p
    
    -- Check if the player has a character and if it's alive
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Teleport the player to the clicked position
        player.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, 3, 0)))  -- Offset a bit to avoid ground collision
    end
end

-- Connect the mouse click to the teleport function
mouse.Button1Down:Connect(onMouseClick)

  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]