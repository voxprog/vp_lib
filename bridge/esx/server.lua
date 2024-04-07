local ESX = exports['es_extended']:getSharedObject()
local Framework = {}
local shared_config = require 'config.shared'

function Framework.Notify(playerId, text, nType)
    if shared_config.Notifications == 'framework' then
        TriggerClientEvent('esx:showNotification', playerId, text)
    elseif shared_config.Notifications == 'ox' then
        TriggerClientEvent('ox_lib:notify', playerId, {
            description = text,
            type = nType,
        })
    end
end

function Framework.CreateUsableItem(itemName, func)
    ESX.RegisterUsableItem(itemName, function(playerId)
        func(playerId)
    end)
end

function Framework.getIdentifier(source)
    return ESX.GetPlayerFromId(source).getIdentifier()
end

return Framework