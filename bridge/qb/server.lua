local QBCore = exports['qb-core']:GetCoreObject()
local Framework = {}
local shared_config = require 'config.shared'

function Framework.Notify(playerId, text, nType)
    if shared_config.Notifications == 'framework' then
        QBCore.Functions.Notify(playerId, text, nType)
    elseif shared_config.Notifications == 'ox' then
        TriggerClientEvent('ox_lib:notify', playerId, {
            description = text,
            type = nType,
        })
    end
end

function Framework.CreateUsableItem(itemName, func)
    QBCore.Functions.CreateUseableItem(itemName, function(source, item)
        func(source)
    end)
end

function Framework.getIdentifier(source)
    return QBCore.Functions.GetPlayer(source).PlayerData.citizenid
end

return Framework