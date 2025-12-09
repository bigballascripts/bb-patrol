-- client/cl_utils.lua
local function setPedOutfit(ped, outfit)
  if outfit.model then
    local mHash = GetHashKey(outfit.model)
    RequestModel(mHash) while not HasModelLoaded(mHash) do Wait(10) end
    SetEntityAsMissionEntity(ped, true, true)
    SetEntityInvincible(ped, false)
  end
  if outfit.components then
    for _, c in ipairs(outfit.components) do
      SetPedComponentVariation(ped, c.component, c.drawable or 0, c.texture or 0, 0)
    end
  end
end

ClientUtils = {
  SetPedOutfit = setPedOutfit,
}
