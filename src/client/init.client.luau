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

local log = require("@shared/logger").new(`kitamin_{Players.LocalPlayer.Name}`)

log:info(`kitamin client initialized in {(os.clock() - startTime) * 1000}ms`)
