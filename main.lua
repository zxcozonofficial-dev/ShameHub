-- Luau | main.lua | GitHub loader for licensed ShameHub strategies.
local url = "https://api.jnkie.com/api/v1/luascripts/public/4938b313f7382a02dcfb486362c97b4f20ae96e67a6e4d12ed91e488522e02ba/download"

if game.PlaceId == 3260590327 or game.PlaceId == 5591597781 then
    loadstring(game:HttpGet(url))()
    repeat task.wait(0.5) until shared.TDSTable
    return shared.TDSTable
end

loadstring(game:HttpGet(url))()
