fx_version('cerulean')
games({ 'gta5' })
name 'TopicAdminSystem'
version '1.0 EVOLVEDBETA'
description 'Project Topic - JS - LUA'
Author'Project Topic Developers - https://discord.gg/MPrc3nRaS2'

shared_script {'config.lua'}

client_scripts {
    'cl/main.lua',
    'cl/modules/functions.lua'
}

server_scripts {
      'sv/main.lua',
}