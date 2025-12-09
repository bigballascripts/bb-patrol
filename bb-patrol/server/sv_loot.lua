-- server/sv_loot.lua
local function rollLootTable(tableName)
  local tbl = LootConfig.Tables[tableName]
  if not tbl then return {} end
  local results, slots = {}, tbl.slots or 2
  for i=1, slots do
    local entry = Utils.WeightedPick(tbl.entries, 'weight')
    results[#results+1] = entry.item
  end
  return results
end

AddEventHandler('tarkov_pve:rollLoot', function(class, playerId)
  local classDef = NPCConfig.Classes[class]
  if not classDef then return end
  local drops = rollLootTable(classDef.lootTable)
  TriggerClientEvent('tarkov_pve:giveLoot', playerId, drops)
end)
