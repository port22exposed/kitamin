local RunService = game:GetService("RunService")

local logger = {}
logger.__index = logger

function logger.new(name: string?)
	name = name or script.Name
	local self = setmetatable({}, logger)
	self.name = name
	return self
end

function logger:debug(...: any): ()
	if RunService:IsStudio() then
		print(`[{self.name}][debug]`, ...)
	end
end

function logger:info(...: any): ()
	print(`[{self.name}][info]`, ...)
end

function logger:warn(...: any): ()
	warn(`[{self.name}][warn]`, ...)
end

function logger:error(...: any): ()
	local args = table.pack(...)
	local strings = table.create(args.n)
	for i = 1, args.n do
		strings[i] = tostring(args[i])
	end
	error(`[{self.name}][error]: {table.concat(strings, " ")}`)
end

return logger
