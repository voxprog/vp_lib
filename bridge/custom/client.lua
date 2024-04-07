local Framework = {}
local shared_config = require 'config.shared'

--! DO NOT EDIT.
function Framework.GetFramework()
    return 'custom'
end
--! DO NOT EDIT.

function Framework.Notify(text, nType)
    lib.notify({
        description = text,
        type = nType,
    })
end

function Framework.ShowMenu(data) return end
function Framework.GetPlayerGang() return nil end
function Framework.GetPlayerJob() return nil end
function Framework.ProgressBar(message, duration, animationDict, animation, onFinish, onCancel) return end

return Framework