local ESX = exports['es_extended']:getSharedObject()
local Framework = {}
local shared_config = require 'config.shared'

function Framework.GetFramework()
    return 'esx'
end

function Framework.Notify(text, nType)
    if shared_config.Notifications == 'framework' then
        TriggerEvent('esx:showNotification', text)
    elseif shared_config.Notifications == 'ox' then
        lib.notify({
            description = text,
            type = nType,
        })
    end
end

-- This script does not support esx_context.
function Framework.ShowMenu(data)
    lib.print.error('esx_context is not supported.')
end

function Framework.ShowInput(data)
    lib.print.error('esx_menu_dialog is not supported.')
end

function Framework.GetPlayerGang()
    return nil
end

function Framework.GetPlayerJob()
    return ESX.PlayerData.job.name
end

function Framework.ProgressBar(message, duration, animationDict, animation, onFinish, onCancel)
    ESX.Progressbar(message, duration, {
        FreezePlayer = true,
        animation = {
            type = 'anim',
            dict = animationDict,
            lib = animation,
        },
        onFinish = onFinish(),
        onCancel = onCancel()
    })
end

return Framework