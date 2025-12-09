-- config/outfits.lua
OutfitConfig = {
  regular_outfits = {
    { gender='male',  model='mp_m_freemode_01', components = { {component=3, drawable=0}, {component=4, drawable=25}, {component=6, drawable=1} } },
    { gender='female',model='mp_f_freemode_01', components = { {component=3, drawable=0}, {component=4, drawable=30}, {component=6, drawable=3} } },
  },
  elite_outfits = {
    { gender='male',  model='s_m_y_blackops_01' },
    { gender='male',  model='s_m_y_blackops_02' },
  },
  armored_outfits = {
    { gender='male',  model='s_m_m_armoured_01' },
    { gender='male',  model='s_m_m_armoured_02' },
  },
  boss_outfits = {
    { gender='male',  model='s_m_y_hwaycop_01' },
  },
}
