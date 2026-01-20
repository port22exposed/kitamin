local container = Instance.new("Folder")
for _, child in script:GetChildren() do
	child:Clone().Parent = container
end
script.Disabled = true
script:Destroy()
script = container

local Players = game:GetService("Players")

local shared = require("@shared")

local log = shared.logger

local client: Script = script.client

log.info("Kitamin server initialized")
