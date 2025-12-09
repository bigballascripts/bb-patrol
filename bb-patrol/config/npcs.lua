-- config/npcs.lua
NPCConfig = {
  -- Global tuning
  TickRateMs = 250,               -- AI cycle frequency
  MaxActiveFromPool = 24,         -- target pool capacity
  Detection = {
    BaseSightRange = 55.0,
    BaseHearingRange = 35.0,
    PeripheralPenalty = 0.75,     -- off-axis penalty
    DarknessPenalty = 0.8,        -- at night
    MovementBonus = 1.2,          -- running player
    SuppressedPenalty = 0.6,      -- suppressed shots
    ThreatDistanceWeight = 1.0,   -- closer = more threat
  },

  -- Classes
  Classes = {
    Regular = {
      health = 200,
      armor = 0,
      accuracy = 0.28,
      aggression = 0.55,
      bravery = 0.6,
      rushThreshold = 0.65,
      scanInterval = { min=1500, max=3000 },
      voiceProfile = 'scav',
      lootTable = 'regular_pool',
      outfitPool = 'regular_outfits',
      weaponPool = 'regular_weapons',
    },
    Elite = {
      health = 300,
      armor = 25,
      accuracy = 0.45,
      aggression = 0.75,
      bravery = 0.8,
      rushThreshold = 0.5,
      scanInterval = { min=1000, max=2500 },
      voiceProfile = 'rogue',
      lootTable = 'elite_pool',
      outfitPool = 'elite_outfits',
      weaponPool = 'elite_weapons',
    },
    Armored = {
      health = 350,
      armor = 60,
      accuracy = 0.35,
      aggression = 0.6,
      bravery = 0.7,
      rushThreshold = 0.55,
      scanInterval = { min=1200, max=2600 },
      voiceProfile = 'armored',
      lootTable = 'armored_pool',
      outfitPool = 'armored_outfits',
      weaponPool = 'armored_weapons',
    },
    Boss = {
      health = 600,
      armor = 80,
      accuracy = 0.55,
      aggression = 0.9,
      bravery = 1.0,
      rushThreshold = 0.8,
      scanInterval = { min=800, max=2200 },
      voiceProfile = 'boss',
      lootTable = 'boss_pool',
      outfitPool = 'boss_outfits',
      weaponPool = 'boss_weapons',
      minions = { class='Elite', count=2, tetherRadius=40.0 },
      specialBehaviors = { suppressiveFire=true, flank=true, retreatOnLowHP=true },
    },
  },

  -- Behavior states and thresholds
  Behavior = {
    SearchTimeoutMs = 12000,
    LoseSightTimeoutMs = 6000,
    PushDistance = 18.0,
    HoldDistance = 25.0,
    FlankChance = 0.25,
    SuppressiveBurstTimeMs = { min=1500, max=3000 },
    ReactionScanArcDeg = 120.0,
    ReactionScanStepDeg = 20.0,
    CoverFindRange = 35.0,
  },
}
