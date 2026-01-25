local accessibleServices: { Instance } = {}

for _, service in game:GetChildren() do
	pcall(function()
		local checker = Instance.new("StringValue", service)
		checker:Destroy()
		table.insert(accessibleServices, service)
	end)
end

-- remove potentially bad services
pcall(function()
	table.remove(accessibleServices, table.find(accessibleServices, game:GetService("StarterPack")))
	table.remove(accessibleServices, table.find(accessibleServices, game:GetService("StarterPlayer")))
	table.remove(accessibleServices, table.find(accessibleServices, game:GetService("Teams")))
	table.remove(accessibleServices, table.find(accessibleServices, game:GetService("StarterGui")))
	table.remove(accessibleServices, table.find(accessibleServices, game:GetService("Lighting")))
end)

local API = {}

function API.randomService(): Instance
	local rng = Random.new()

	return accessibleServices[rng:NextInteger(1, #accessibleServices)]
end

return API
