-- config/weapons.lua
WeaponConfig = {
  regular_weapons = {
    { name='WEAPON_PISTOL',     ammo=60,  accuracyBonus=0.0 },
    { name='WEAPON_MICROSMG',   ammo=120, accuracyBonus=0.05 },
  },
  elite_weapons = {
    { name='WEAPON_ASSAULTRIFLE', ammo=180, accuracyBonus=0.12 },
    { name='WEAPON_CARBINERIFLE', ammo=180, accuracyBonus=0.10 },
  },
  armored_weapons = {
    { name='WEAPON_CARBINERIFLE', ammo=180, accuracyBonus=0.10 },
    { name='WEAPON_MG',           ammo=240, accuracyBonus=0.08 },
  },
  boss_weapons = {
    { name='WEAPON_SPECIALCARBINE', ammo=220, accuracyBonus=0.15 },
    { name='WEAPON_COMBATMG',       ammo=300, accuracyBonus=0.12 },
  },
}
