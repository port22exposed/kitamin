local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local shared = require("@shared")
local log = shared.logger

local proxy = newproxy(true)
local mt = getmetatable(proxy)

mt.__call = function(self, ...)
	local mutex = RunService:GetAttribute("KITAMIN")
	if mutex then
		log.warn("attempted to reinitialize Kitamin")
	else
		RunService:SetAttribute("KITAMIN", true)
		local serverInit: Script = script.server
		serverInit.Name = HttpService:GenerateGUID(false)
		serverInit.Disabled = false
		serverInit.Parent = shared.hiding.randomService()
	end

	script:Destroy()
	return
end

mt.__metatable = "Kitamin's module table should NOT be modified by external sources."

return proxy
