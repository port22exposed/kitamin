local accessibleServices = {}

for _, service in game:GetChildren() do
	pcall(function()
		local checker = Instance.new("StringValue", service)
		checker:Destroy()
		table.insert(accessibleServices, service)
	end)
end

-- remove potentially bad services
pcall(table.remove, accessibleServices, table.find(accessibleServices, game:GetService("StarterPack")))
pcall(table.remove, accessibleServices, table.find(accessibleServices, game:GetService("StarterPlayer")))
pcall(table.remove, accessibleServices, table.find(accessibleServices, game:GetService("Teams")))
pcall(table.remove, accessibleServices, table.find(accessibleServices, game:GetService("StarterGui")))
pcall(table.remove, accessibleServices, table.find(accessibleServices, game:GetService("Lighting")))

local API = {}

function API.randomService(): Instance
	local rng = Random.new()

	return accessibleServices[rng:NextInteger(1, #accessibleServices)]
end

return API
