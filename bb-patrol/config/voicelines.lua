-- config/voicelines.lua
VoiceConfig = {
  profiles = {
    scav = {
      spot = { 'There!', 'Contact!', 'Eyes on target!' },
      taking_fire = { 'Taking fire!', 'I’m hit!', 'Under fire!' },
      push = { 'Advancing!', 'Push up!', 'Move!' },
      coordinate = { 'Cover me!', 'Flank left!', 'You, right side!' },
      death = { 'Ugh...', 'I’m done...', 'Tell my mom...' },
    },
    rogue = {
      spot = { 'Target acquired.', 'Visual confirmed.', 'Moving to engage.' },
      taking_fire = { 'I’m suppressed!', 'Taking rounds!', 'Hostile fire!' },
      push = { 'Pressing!', 'On me!', 'Stack up!' },
      coordinate = { 'Shift right.', 'Crossfire.', 'Hold angles.' },
      death = { 'No...', 'System failure...', 'Bleeding out...' },
    },
    armored = {
      spot = { 'Eyes on!', 'Heavy target.', 'Marking hostile.' },
      taking_fire = { 'Armor hit!', 'Ricochet!', 'We’re taking heat!' },
      push = { 'Bulldozing!', 'Break their line!', 'Push hard!' },
      coordinate = { 'Set cover!', 'Rotate!', 'I’ll tank!' },
      death = { 'Plate’s gone...', 'I’m falling...', 'Go...' },
    },
    boss = {
      spot = { 'Prey found.', 'You’re mine.', 'Hunt begins.' },
      taking_fire = { 'Cute.', 'Bleed me? Try.', 'Pressure noted.' },
      push = { 'Advance.', 'Crush them.', 'Forward!' },
      coordinate = { 'Left wing, now.', 'Pin them.', 'Sweep wide.' },
      death = { 'Not... yet...', 'Remember my name...', 'Fall back—' },
    },
  }
}
