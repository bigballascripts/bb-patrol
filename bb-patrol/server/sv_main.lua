-- server/sv_main.lua
CreateThread(function()
  while true do
    Wait(1500)
    TriggerClientEvent('tarkov_pve:tick', -1)
    TriggerEvent('tarkov_pve:maintenanceTick')
  end
end)
