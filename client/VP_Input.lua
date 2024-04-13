local shared_config = require 'config.shared'
local Framework = require 'bridge.client'
if not Framework then return end
VP_Input = lib.class('VP_Input')

--* Class Functions
---Follows formatting from ox_lib.
---@param heading string
---@param rows table
---@return table|nil
function VP_Input:constructor(heading, rows, cb)
    -- Using a compatible menu option that isn't ox
    if (shared_config.Input ~= 'ox' and Framework.GetFramework() ~= 'esx') then
        cb(Framework.ShowInput(heading, rows))
        return
    end

    -- use ox
    cb(lib.inputDialog(heading, rows))
    return
end

--* Related Events
RegisterNetEvent('vp_adminmenu:client:displayMenu', function(data)
    VP_Input:new({
        data = data
    })
end)

return VP_Input