local QBCore = exports['qb-core']:GetCoreObject()
local Framework = {}
local shared_config = require 'config.shared'

function Framework.GetFramework()
    return 'qb'
end

function Framework.Notify(text, nType)
    if shared_config.Notifications == 'framework' then
        QBCore.Functions.Notify(text, nType)
    elseif shared_config.Notifications == 'ox' then
        lib.notify({
            description = text,
            type = nType,
        })
    end
end

function Framework.ShowMenu(data)
    local options = {
        {
            header = data.headerTitle,
            isMenuHeader = true
        }
    }

    for i=1, #data.options do
        local tmp_data = data.options[i]
        options[#options+1] = {
            header = tmp_data.title,
            txt = tmp_data.description,
            disabled = tmp_data.disabled,
            icon = tmp_data.icon:split('fas fa-')[2],
            params = {
                event = tmp_data.event,
                isServer = tmp_data.isServerEvent
            }
        }
    end

    exports['qb-menu']:openMenu(options)
end

function Framework.ShowInput(heading, rows)
    local inputs = {}
    for i = 1, #rows do
        local index = #inputs+1

        local newType = rows[i].type
        if newType == 'textarea' then newType = 'text' end

        inputs[index] = {
            text = rows[i].label,
            name = i,
            type = newType,
            isRequired = rows[i].required or false,
        }

        if rows[i].options then
            inputs[index].options = {}
            for ii = 1, #rows[i].options do
                inputs[index].options[#inputs[index].options + 1] = {
                    value = rows[i].options[ii].value,
                    text = rows[i].options[ii].label,
                }
            end
        end
    end
    local retVal = exports['qb-input']:ShowInput({
        heading = heading,
        inputs = inputs
    })

    local newTable = {}
    for k,v in pairs(retVal) do
        newTable[tonumber(k)] = v
    end
    return newTable
end

function Framework.GetPlayerGang()
    return QBCore.Functions.GetPlayerData().gang.name
end

function Framework.GetPlayerJob()
    return QBCore.Functions.GetPlayerData().job.name
end

function Framework.ProgressBar(message, duration, animationDict, animation, onFinish, onCancel)
    QBCore.Functions.Progressbar(message, message, duration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animationDict,
        anim = animation,
    }, {}, {}, onFinish(), onCancel())
end

return Framework