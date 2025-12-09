-- client/cl_behavior.lua
local function distance(a, b)
  local dx = a.x - b.x
  local dy = a.y - b.y
  local dz = a.z - b.z
  return math.sqrt(dx*dx + dy*dy + dz*dz)
end

local function playVoice(profile, context, ped)
  local lines = VoiceConfig.profiles[profile][context]
  if not lines then return end
  local pick = lines[math.random(1, #lines)]
  -- Replace with your audio system (3D sound, etc.). For placeholder:
  PlayAmbientSpeech1(ped, pick, 'SPEECH_PARAMS_FORCE_SHOUTED')
end

local function scanForPlayers(ped, class)
  local px, py, pz = table.unpack(GetEntityCoords(ped))
  local range = NPCConfig.Detection.BaseSightRange
  local closest, closestDist, seen = nil, 9999.0, false

  for _, playerId in ipairs(GetActivePlayers()) do
    local playerPed = GetPlayerPed(playerId)
    if playerPed ~= ped then
      local ppos = GetEntityCoords(playerPed)
      local dist = #(ppos - vector3(px,py,pz))
      if dist < range then
        local hit = HasEntityClearLosToEntity(ped, playerPed, 17)
        if hit then
          seen = true
          if dist < closestDist then
            closest = playerPed
            closestDist = dist
          end
        end
      end
    end
  end
  return seen, closest, closestDist
end

local function setState(data, newState)
  data.state = newState
end

local function runPatrol(data)
  local ped = data.ped
  if data.patrolMode == 'area' then
    TaskWanderStandard(ped, 10.0, 10)
  elseif data.patrolMode == 'route' and data.patrolData.route then
    local wp = data.patrolData.route[ math.random(1, #data.patrolData.route) ]
    TaskGoStraightToCoord(ped, wp.x, wp.y, wp.z, 2.0, -1, 0.0, 0.0)
  else
    -- static: idle look around
    TaskStandStill(ped, 2000)
  end
end

local function engageTarget(data, target, dist)
  local ped = data.ped
  local classDef = NPCConfig.Classes[data.class]
  if dist <= NPCConfig.Behavior.PushDistance and classDef.aggression >= classDef.rushThreshold then
    TaskCombatPed(ped, target, 0, 16) -- push
    playVoice(classDef.voiceProfile, 'push', ped)
  else
    TaskCombatPed(ped, target, 0, 0)  -- standard engage
    if dist <= NPCConfig.Behavior.HoldDistance then
      -- Take cover occasionally
      if math.random() < 0.4 then TaskStayInCover(ped, true) end
    end
  end
end

local function behaviorTick(data)
  local ped = data.ped
  if not DoesEntityExist(ped) or IsEntityDead(ped) then
    TriggerServerEvent('tarkov_pve:onNPCDied', data.group, data.class, GetPlayerServerId(PlayerId()))
    return 'dead'
  end

  local now = GetGameTimer()
  if now - data.lastScan >= math.random(NPCConfig.Classes[data.class].scanInterval.min, NPCConfig.Classes[data.class].scanInterval.max) then
    local seen, target, dist = scanForPlayers(ped, data.class)
    data.lastScan = now

    if seen then
      if data.state ~= 'combat' then
        setState(data, 'combat')
        playVoice(NPCConfig.Classes[data.class].voiceProfile, 'spot', ped)
      end
      data.target = target
      engageTarget(data, target, dist)
      data.lastSeenPlayer = now
    else
      if data.state == 'combat' and (now - (data.lastSeenPlayer or now)) > NPCConfig.Behavior.LoseSightTimeoutMs then
        setState(data, 'search')
        TaskGoToEntity(ped, data.target or ped, -1, 8.0, 2.0, 0, 0)
      elseif data.state == 'search' and (now - (data.lastSeenPlayer or now)) > NPCConfig.Behavior.SearchTimeoutMs then
        setState(data, 'patrol')
        runPatrol(data)
      elseif data.state == 'patrol' then
        runPatrol(data)
      end
    end
  end

  return data.state
end

CreateThread(function()
  while true do
    Wait(NPCConfig.TickRateMs)
    local pool = exports['tarkov_pve']:GetNPCPool()
    local count = 0
    for id, data in pairs(pool) do
      count = count + 1
      if count > NPCConfig.MaxActiveFromPool then break end
      behaviorTick(data)
    end
    -- Ask server for spawn decisions throttled
    TriggerServerEvent('tarkov_pve:requestSpawnTick')
  end
end)
