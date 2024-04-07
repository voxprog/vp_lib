local Framework = {}
local shared_config = require 'config.shared'

function Framework.Notify(playerId, text, nType)
    TriggerClientEvent('ox_lib:notify', playerId, {
        description = text,
        type = nType,
    })
end

function Framework.CreateUsableItem(itemName, func) return end

return Framework