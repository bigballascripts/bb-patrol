-- config/loot.lua
LootConfig = {
  RarityWeights = { Common=60, Uncommon=25, Rare=10, Epic=4, Legendary=1 },

  Tables = {
    regular_pool = {
      slots = 2,
      entries = {
        { item='bandage',    rarity='Common',   weight=30 },
        { item='water',      rarity='Common',   weight=25 },
        { item='ammo_9mm',   rarity='Uncommon', weight=20 },
        { item='screwdriver',rarity='Common',   weight=15 },
        { item='medkit_s',   rarity='Uncommon', weight=10 },
      }
    },
    elite_pool = {
      slots = 3,
      entries = {
        { item='medkit_m',   rarity='Uncommon', weight=20 },
        { item='ammo_556',   rarity='Uncommon', weight=20 },
        { item='armor_plate',rarity='Rare',     weight=10 },
        { item='stim',       rarity='Rare',     weight=6 },
        { item='toolkit',    rarity='Common',   weight=20 },
      }
    },
    armored_pool = {
      slots = 3,
      entries = {
        { item='armor_plate',rarity='Rare',     weight=20 },
        { item='ammo_762',   rarity='Uncommon', weight=20 },
        { item='medkit_l',   rarity='Rare',     weight=12 },
        { item='grenade',    rarity='Epic',     weight=4 },
      }
    },
    boss_pool = {
      slots = 4,
      entries = {
        { item='keycard',    rarity='Epic',     weight=6 },
        { item='unique_rig', rarity='Legendary',weight=2 },
        { item='ammo_ap',    rarity='Rare',     weight=14 },
        { item='stim_x',     rarity='Epic',     weight=6 },
        { item='cash_bundle',rarity='Uncommon', weight=22 },
      }
    },
  },
}
