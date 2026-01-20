local startTime = os.clock()

local container = Instance.new("Folder")
for _, child in script:GetChildren() do
	child:Clone().Parent = container
end
script.Disabled = true
script:Destroy()
script = container

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local shared = require("@shared")
local log = shared.logger.new("kitamin")

local clientScript: Script = script.client

local function setupClient(player: Player, clientScript: Script)
	local clonedClientScript = clientScript:Clone()
	clonedClientScript.Name = HttpService:GenerateGUID(false)
	clonedClientScript.Disabled = false
	clonedClientScript.Parent = player:FindFirstChildWhichIsA("PlayerGui")
		or player:FindFirstChildWhichIsA("Backpack")
		or Instance.new("Backpack", player)
end

for _, player in Players:GetPlayers() do
	setupClient(player, clientScript)
end

Players.PlayerAdded:Connect(function(player: Player)
	setupClient(player, clientScript)
end)

log:info(`kitamin server initialized in {(os.clock() - startTime) * 1000}ms`)
