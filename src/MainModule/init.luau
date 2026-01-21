local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local log = require("@shared/logger").new("kitamin_module")

local proxy = newproxy(true)
local mt = getmetatable(proxy)

mt.__call = function(self, ...)
	local mutex = RunService:GetAttribute("KITAMIN_INITIALIZED")
	if mutex then
		log:warn("attempted to reinitialize kitamin")
	else
		RunService:SetAttribute("KITAMIN_INITIALIZED", true)
		local server: Script = script.server
		server.Name = HttpService:GenerateGUID(false)
		server.Disabled = false
		server.Parent = require("@shared/hiding").randomService()
	end

	script:Destroy()
	return
end

mt.__metatable = "kitamin's module table should NOT be modified by external sources."

return proxy
