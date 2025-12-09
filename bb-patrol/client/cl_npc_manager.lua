-- client/cl_npc_manager.lua
local NPCs = {} -- { id -> { ped, class, group, state, lastSeenPlayer, target, lastScan } }

local function equipWeapon(ped, class)
  local poolName = NPCConfig.Classes[class].weaponPool
  local pool = WeaponConfig[poolName]
  local pick = pool[math.random(1, #pool)]
  GiveWeaponToPed(ped, GetHashKey(pick.name), pick.ammo, false, true)
  SetPedAccuracy(ped, math.floor( NPCConfig.Classes[class].accuracy * 100 + (pick.accuracyBonus * 100) ))
  SetPedArmour(ped, NPCConfig.Classes[class].armor or 0)
end

RegisterNetEvent('tarkov_pve:spawnNPC')
AddEventHandler('tarkov_pve:spawnNPC', function(groupName, class, point)
  local classDef = NPCConfig.Classes[class]
  local outfits = OutfitConfig[classDef.outfitPool]
  local outfit = outfits[math.random(1, #outfits)]

  local mHash = GetHashKey(outfit.model)
  RequestModel(mHash) while not HasModelLoaded(mHash) do Wait(10) end
  local ped = CreatePed(4, mHash, point.x, point.y, point.z, 0.0, true, true)
  SetPedRelationshipGroupHash(ped, GetHashKey('HATES_PLAYER'))
  SetPedAsEnemy(ped, true)
  SetPedCombatAttributes(ped, 46, true) -- use cover
  SetPedCombatAbility(ped, 2)
  SetPedCanRagdoll(ped, true)
  SetPedMaxHealth(ped, classDef.health) SetEntityHealth(ped, classDef.health)

  ClientUtils.SetPedOutfit(ped, outfit)
  equipWeapon(ped, class)

  local id = NetworkGetNetworkIdFromEntity(ped)
  SetNetworkIdCanMigrate(id, false)

  NPCs[id] = {
    ped = ped, class = class, group = groupName,
    state = 'patrol', lastSeenPlayer = nil, target = nil,
    patrolMode = point.patrol or 'area',
    patrolData = point,
    lastScan = GetGameTimer(),
  }
end)

AddEventHandler('entityDamaged', function(victim, attacker, weapon, isMelee)
  -- Hook if needed with appropriate event lib to set taking_fire state
end)

RegisterNetEvent('tarkov_pve:giveLoot')
AddEventHandler('tarkov_pve:giveLoot', function(items)
  -- Integrate with your inventory: replace with your item add logic
  for _, item in ipairs(items) do
    -- Example: exports['inventory']:AddItem(item, 1)
    -- Fallback notification:
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(('Loot: %s'):format(item))
    EndTextCommandThefeedPostTicker(false, true)
  end
end)

function DespawnNPC(id)
  local data = NPCs[id]
  if not data then return end
  if DoesEntityExist(data.ped) then DeletePed(data.ped) end
  NPCs[id] = nil
end

exports('GetNPCPool', function() return NPCs end)
