## Overview

This resource brings a Escape from Tarkov-style PvE experience into FiveM. It introduces hostile NPCs inspired by Scavs, Rogues, and Bosses, with dynamic patrols, detection logic, contextual voicelines, scalable spawn systems, and weighted loot drops. The framework is designed to be modular and performance-optimized, capable of handling 20+ NPCs simultaneously without degrading server performance.

## Key Features

**Dynamic NPC Behavior**
    - Area patrols, route patrols, and static guard modes.
    - Detection based on sight, hearing, distance, and threat level.
    - Aggressive engagement logic with suppression, flanking, and push mechanics.

**NPC Classes**

Regular, Elite, Armored, and Boss types.

Each class has unique stats, loadouts, and behavioral patterns.

**Contextual Voicelines**

Spotting, taking fire, pushing, coordinating, and death events.

Configurable voice pools per NPC class.

**Spawn System**

Adjustable spawn rates, cooldowns, and difficulty scaling.

Spawn groups tied to specific map zones.

**Loot Integration**

Weighted loot pools with rarity tiers.

Configurable drop tables integrated with core inventory.

**Modular Configuration**

Outfits, weapons, loot, voicelines, and NPC stats are all defined in config files.

Server owners can tweak gameplay without touching core scripts.

## Installation

1. Download & Extract
    - Place the tarkov_pve folder into your server’s resources directory.

2. fxmanifest Setup
    - Ensure the included fxmanifest.lua is intact.
    - Add the resource to your server config:
    - ensure tarkov_pve

3. Configuration
    - Navigate to the config/ folder.
    - Adjust:
        npcs.lua → NPC classes, stats, and behavior.
        spawns.lua → Spawn groups, rates, and cooldowns.
        loot.lua → Loot pools and rarity weights.
        voicelines.lua → Contextual voice pools.
        outfits.lua → NPC models and clothing.
        weapons.lua → Weapon pools per class.

4. Inventory Integration
    - Replace the placeholder loot handler in sv_loot.lua with your inventory system’s API.
    - Example:
        ```exports['inventory']:AddItem(playerId, item, 1)```

5. Audio Integration (Optional)
    - Replace PlayAmbientSpeech1 calls with your preferred audio/voiceline system.

6. Restart Server
    - Restart your FiveM server to load the resource.

## Performance Notes
AI cycles run on configurable tick rates (default 250ms).
NPC pool capped at 24 active entities for stability.
Spawn cooldowns prevent overcrowding.
Config-only tuning ensures easy balancing without code edits.

## Customization Tips
Difficulty Scaling: Adjust accuracy/aggression in npcs.lua.
PvE Intensity: Modify maxAlive and spawn rates in spawns.lua.
Economy Balance: Tune rarity weights and loot pools in loot.lua.
Immersion: Expand voiceline pools for variety.
Visual Identity: Add new outfits and weapon sets for diversity.

## Credits

Developed by Big Balla with inspiration from Escape from Tarkov’s PvE systems. Built to deliver a deep, hostile, and immersive PvE experience for FiveM servers.
