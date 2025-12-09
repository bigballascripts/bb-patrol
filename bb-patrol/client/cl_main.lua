-- client/cl_main.lua
-- Relationship setup: hostile toward players
CreateThread(function()
  AddRelationshipGroup('HATES_PLAYER')
  SetRelationshipBetweenGroups(5, GetHashKey('HATES_PLAYER'), GetHashKey('PLAYER'))
  SetRelationshipBetweenGroups(5, GetHashKey('PLAYER'), GetHashKey('HATES_PLAYER'))
end)

-- Death voice hook
CreateThread(function()
  while true do
    Wait(200)
    local pool = exports['tarkov_pve']:GetNPCPool()
    for _, data in pairs(pool) do
      if DoesEntityExist(data.ped) and IsEntityDead(data.ped) then
        playVoice(NPCConfig.Classes[data.class].voiceProfile, 'death', data.ped)
      end
    end
  end
end)
