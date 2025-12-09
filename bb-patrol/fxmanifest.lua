-- fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

author 'Jamian'
description 'Tarkov-inspired PvE framework for FiveM'
version '1.0.0'

lua54 'yes'

shared_scripts {
  'config/npcs.lua',
  'config/spawns.lua',
  'config/loot.lua',
  'config/voicelines.lua',
  'config/outfits.lua',
  'config/weapons.lua',
}

server_scripts {
  'server/sv_utils.lua',
  'server/sv_loot.lua',
  'server/sv_spawns.lua',
  'server/sv_main.lua',
}

client_scripts {
  'client/cl_utils.lua',
  'client/cl_behavior.lua',
  'client/cl_npc_manager.lua',
  'client/cl_main.lua',
}
