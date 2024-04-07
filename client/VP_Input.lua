local shared_config = require 'config.shared'
local Framework = require 'bridge.client'
if not Framework then return end
VP_Input = lib.class('VP_Input')

--* Class Functions
---Follows formatting from ox_lib.
---@param heading string
---@param rows table
---@return table|nil
function VP_Input:init(heading, rows)
    -- Using a compatible menu option that isn't ox
    if (shared_config.Menu ~= 'ox' and Framework.GetFramework() ~= 'esx') then
        return Framework.ShowInput(heading, rows)
    end

    -- use ox
    return lib.inputDialog(heading, rows)
end

--* Related Events
RegisterNetEvent('vp_adminmenu:client:displayMenu', function(data)
    VP_Input:new({
        data = data
    })
end)