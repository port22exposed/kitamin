local container = Instance.new("Folder")
for _, child in script:GetChildren() do
	child:Clone().Parent = container
end
script.Disabled = true
script:Destroy()
script = container

local Players = game:GetService("Players")

local client: Script = script.client

Players.PlayerAdded:Connect(function(player: Player)
	local c = client:Clone()
	c.Parent = player:FindFirstChildWhichIsA("PlayerGui")
		or player:FindFirstChildWhichIsA("Backpack")
		or Instance.new("Backpack", player)
	c.Disabled = false
end)

for _, player in Players:GetPlayers() do
	local c = client:Clone()
	c.Parent = player:FindFirstChildWhichIsA("PlayerGui")
		or player:FindFirstChildWhichIsA("Backpack")
		or Instance.new("Backpack", player)
	c.Disabled = false
end
