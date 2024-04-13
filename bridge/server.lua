local using_qb = (GetResourceState('qb-core') ~= 'missing' or GetResourceState('qbx_core') ~= 'missing')
local using_esx_legacy = GetResourceState('es_extended') ~= 'missing'

return
    (using_qb and require 'bridge.qb.server') or
    (using_esx_legacy and require 'bridge.esx.server') or
    (require 'bridge.custom.server')