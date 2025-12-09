-- config/spawns.lua
SpawnConfig = {
  Difficulty = {
    scale = 1.0,          -- global scaling: impacts accuracy/aggro
    rampPerMinute = 0.02, -- incremental difficulty in long sessions
  },

  -- Global cooldowns/rates
  Rates = {
    baseSpawnRate = 0.7,     -- baseline probability per tick/window
    groupCooldownMs = 20000, -- cooldown per group
    perNPCSpawnDelayMs = { min=800, max=1600 },
  },

  -- Spawn groups allow shaping PvE intensity per zone
  Groups = {
    Warehouse = {
      enabled = true,
      maxAlive = 8,
      classes = {
        { class='Regular', weight=70 },
        { class='Elite',   weight=20 },
        { class='Armored', weight=10 },
      },
      points = {
        { x=907.1, y=-3202.9, z=-97.3, radius=12.0, patrol='area' },
        { x=905.2, y=-3190.1, z=-97.3, radius=16.0, patrol='route', route = {
            { x=905.2, y=-3190.1, z=-97.3 },
            { x=914.8, y=-3180.2, z=-97.3 },
            { x=928.2, y=-3191.4, z=-97.3 },
        }},
      },
    },
    Docks = {
      enabled = true,
      maxAlive = 6,
      classes = {
        { class='Regular', weight=60 },
        { class='Elite',   weight=30 },
        { class='Armored', weight=10 },
      },
      points = {
        { x=-1705.5, y=-1124.8, z=13.0, radius=25.0, patrol='area' },
      },
    },
    BossArena = {
      enabled = true,
      maxAlive = 3,
      classes = {
        { class='Boss', weight=100 },
      },
      points = {
        { x=1310.0, y=1080.0, z=104.0, radius=20.0, patrol='static' },
      },
      cooldownMs = 900000, -- 15 min respawn for bosses
    },
  },
}
