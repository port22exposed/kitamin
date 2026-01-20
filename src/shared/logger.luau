local RunService = game:GetService("RunService")

local logger = {}

function logger.debug(...)
	if RunService:IsStudio() then
		return print(`[{script.Name}][debug]`, ...)
	end
end

function logger.info(...)
	return print(`[{script.Name}][info]`, ...)
end

function logger.warn(...)
	return warn(`[{script.Name}][warn]`, ...)
end

function logger.error(...)
	return error(`[{script.Name}][error]: {table.concat({ ... }, " ")}`)
end

return logger
