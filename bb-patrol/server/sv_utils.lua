-- server/sv_utils.lua
local function weightedPick(list, key)
  local sum = 0
  for _, v in ipairs(list) do sum = sum + (v.weight or 1) end
  local r = math.random() * sum
  for _, v in ipairs(list) do
    r = r - (v.weight or 1)
    if r <= 0 then return v end
  end
  return list[#list]
end

Utils = {
  WeightedPick = weightedPick,
}
