-- Luau | main.lua | GitHub loader for licensed ShameHub strategies.
local url = "https://api.jnkie.com/api/v1/luascripts/public/4938b313f7382a02dcfb486362c97b4f20ae96e67a6e4d12ed91e488522e02ba/download"
local env = getgenv and getgenv() or _G
local current = env.FoxAutoSettings
if current and not current.Dead and current.StrategyLibrary and (current.Initialized or shared.TDSTable == current.StrategyLibrary) then return current.StrategyLibrary end
local pending = env.ShameHubPublicLoader
if pending and pending.Loading then
    local deadline = os.clock() + 180
    repeat task.wait(0.1) until not pending.Loading or os.clock() >= deadline
    assert(not pending.Loading, "ShameHub loader timed out")
    assert(not pending.Error, pending.Error)
    return pending.API
end
pending = {Loading = true}
env.ShameHubPublicLoader = pending
local ok, result = xpcall(function()
    local api = assert(loadstring(game:HttpGet(url)))()
    if game.PlaceId == 3260590327 or game.PlaceId == 5591597781 then
        local deadline = os.clock() + 180
        repeat
            local window = env.FoxAutoSettings
            if window and not window.Dead and window.StrategyLibrary and (window.Initialized or shared.TDSTable == window.StrategyLibrary) then return window.StrategyLibrary end
            task.wait(0.1)
        until os.clock() >= deadline
        error("ShameHub did not initialize; update the Jnkie source")
    end
    return api
end, debug.traceback)
pending.Loading = false
if not ok then pending.Error = tostring(result); error(result, 0) end
pending.API = result
return result
