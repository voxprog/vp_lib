--[[ FX INFORMATION ]]--
fx_version                  'cerulean'
games                       { 'gta5' }
lua54                       'yes'

--[[ RESOURCE INFORMATION ]]--
name                        'vp_lib'
author                      'VoxProg'
description                 'Multiframework library for VoxProg resources.'
version                     '1.0.0'

--[[ MANIFEST ]]--
dependencies                { 'ox_lib' }
client_scripts              { 'client/VP_Input.lua', 'client/VP_Menu.lua' }
shared_scripts              { '@ox_lib/init.lua', 'config/shared.lua' }
files                       {
    'config/shared.lua',
    'bridge/client.lua',
    'bridge/server.lua',
    'bridge/qb/client.lua',
    'bridge/qb/server.lua',
    'bridge/esx/client.lua',
    'bridge/esx/server.lua',
}