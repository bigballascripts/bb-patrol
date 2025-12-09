-- server/sv_spawns.lua
local activeCount = 0
local groupCooldowns = {}

local function difficultyScale()
  return SpawnConfig.Difficulty.scale
end

RegisterNetEvent('tarkov_pve:requestSpawnTick', function()
  local src = source
  -- Decide if we spawn from groups
  for groupName, group in pairs(SpawnConfig.Groups) do
    if group.enabled then
      local cd = groupCooldowns[groupName] or 0
      if cd < os.time() then
        local alive = GlobalState[groupName..':alive'] or 0
        if alive < (group.maxAlive or 6) then
          if math.random() < (SpawnConfig.Rates.baseSpawnRate) then
            local classPicked = Utils.WeightedPick(group.classes, 'weight').class
            local point = group.points[math.random(1, #group.points)]
            TriggerClientEvent('tarkov_pve:spawnNPC', -1, groupName, classPicked, point)
            groupCooldowns[groupName] = os.time() + ( (group.cooldownMs or SpawnConfig.Rates.groupCooldownMs) / 1000 )
            GlobalState[groupName..':alive'] = alive + 1
          end
        end
      end
    end
  end
end)

RegisterNetEvent('tarkov_pve:onNPCDied', function(groupName, class, killerId)
  local alive = GlobalState[groupName..':alive'] or 1
  GlobalState[groupName..':alive'] = math.max(0, alive - 1)
  TriggerEvent('tarkov_pve:rollLoot', class, killerId)
end)
