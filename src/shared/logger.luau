local TestService = game:GetService("TestService")
local RunService = game:GetService("RunService")

local logger = {}

function logger.debug(...)
	if RunService:IsStudio() then
		return print("[debug]:", ...)
	end
end

function logger.info(...)
	return print("[info]:", ...)
end

function logger.warn(...)
	return warn("[warn]:", ...)
end

function logger.error(...)
	return error("[error]:", ...)
end

return true
