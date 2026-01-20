local container = Instance.new("Folder")
for _, child in script:GetChildren() do
	child:Clone().Parent = container
end
script.Disabled = true
script:Destroy()
script = container

local client: Script = script.Client
