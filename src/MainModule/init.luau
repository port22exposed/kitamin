local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Shared = require("@shared")

local proxy = newproxy(true)
local mt = getmetatable(proxy)

mt.__call = function(self, ...)
	local mutex = RunService:GetAttribute("KITAMIN")
	if mutex then
		warn("attempted to reinitialize Kitamin")
	else
		RunService:SetAttribute("KITAMIN", true)
		local serverInit = script.Server
		serverInit.Name = HttpService:GenerateGUID(false)
		local sharedModules = script.Shared:Clone()
		sharedModules.Parent = serverInit
		serverInit.Disabled = false
		serverInit.Parent = Shared.Hiding.randomService()
	end

	script:Destroy()
	return
end

mt.__metatable = "Kitamin's module table should NOT be modified by external sources."

return proxy
