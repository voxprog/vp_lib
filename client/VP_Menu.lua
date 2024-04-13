local shared_config = require 'config.shared'
local Framework = require 'bridge.client'
if not Framework then return end
VP_Menu = lib.class('VP_Menu')

--* Class Functions
--[[
    data = {
        headerTitle,
        options: {
            title,
            description,
            disabled,
            event,
            isServerEvent,
            args,
            icon,
        },
    }
]]
function VP_Menu:constructor(data)
    -- Using a compatible menu option that isn't ox
    if (shared_config.Menu ~= 'ox' and Framework.GetFramework() ~= 'esx') then
        Framework.ShowMenu(data)
        return
    end

    -- use ox
    local options = {}
    for i=1, #data.options do
        local tmp_data = data.options[i]
        options[#options+1] = {
            title = tmp_data.title,
            description = tmp_data.description or nil,
            disabled = tmp_data.disabled or false,
            serverEvent = tmp_data.isServerEvent and tmp_data.event or nil,
            event = not tmp_data.isServerEvent and tmp_data.event or nil,
            args = tmp_data.args,
        }
    end
    lib.registerContext({
        id = data.headerTitle,
        title = data.headerTitle,
        options = options
    })
    lib.showContext(data.headerTitle)
end

--* Related Events
RegisterNetEvent('vp_adminmenu:client:displayMenu', function(data)
    VP_Menu:new(data)
end)

return VP_Menu