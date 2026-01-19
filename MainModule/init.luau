local proxy = newproxy(true)
local mt = getmetatable(proxy)

mt.__call = function (self, ...)

end

mt.__metatable = "Kitamin's module table should NOT be modified by external sources."

return proxy
