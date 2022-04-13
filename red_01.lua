--Lua implementation of Redis' INCRBY

--[[
Настройки проекта:
Project -> Lua Interpreter -> Redis
Project -> Command Line Parameters...
  -а) сначала передаются ключи, затем после "," передаются аргументы
  -б) всё, в том числе "запятая", разделяется пробелами
]]

local k = KEYS[1]
local n = ARGV[1]

--print(k, n)
local v = redis.call('GET', k)
if not v then
  v = 0
end

v = v + n
redis.call('SET', k, v)

return val
