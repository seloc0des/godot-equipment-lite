# Equipment (Lite)

**FREE.** Fixed 4-slot equipment (weapon_main / chest / boots / ring) for Godot 4.5+. Pure GDScript. MIT.

The working core of the [selodev Equipment addon](docs/upgrade.md). Slots on your player, gear lying in the level that the player puts on by walking into it, and a plain list of what's worn on the C key. Stat bonuses and the paper doll are in the full version.

> **No-code docks.** Enable the plugin and two tabs appear. **Equipment · Setup** puts things in your scene. **Equippables (Lite)** creates, edits, duplicates and deletes your items, with no `.tres` editing.

## One-click setup (no code)

Enable the plugin and an **Equipment · Setup** tab appears in the editor.

1. Select your player node, pick **Player equipment** and press **Apply**. The player gets four slots and is marked as the player, and an equipped list goes in the bottom-right corner of the screen. It starts hidden. Press **C** in game to open it.
2. Select something lying on the ground (a sprite, a mesh or an Area2D/Area3D), pick **Equip it when the player picks it up**, choose the item (or press **New item**) and its **Slot**, and press **Apply**. A node that isn't an area gets a **PickupArea** to be touched through.
3. Press Play and walk into it. The player puts it on, "Equipped Iron Sword" shows at the top of the screen, and the pickup disappears. Whatever was in that slot is replaced.

Your player needs a collision shape so it can touch things (a CharacterBody2D or CharacterBody3D with a CollisionShape, the usual setup). If nothing in the scene is the player yet, the tab says so, and its **Make the selected node the player** button fixes it.

## 5-minute install

1. Copy `addons/equipment_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Equipment (Lite)**.
3. Follow the three steps above. [docs/quick-start.md](docs/quick-start.md) has the details.

From code (optional):

```gdscript
equipment.try_equip(iron_sword)               # auto-detects slot from metadata
equipment.equip("chest", plate_armor)         # explicit slot
var prev := equipment.unequip("ring")         # returns the item (or null)
equipment.all_equipped()                      # Dict[slot_id -> Resource]
```

## What's missing (and why)

| Feature | Tier |
|---|---|
| Customizable slot layout (`EquipmentLayout` Resource) | Full version |
| Two-handed conflicts | Full version |
| Modifier aggregation (`get_modifier_sum`, `apply_modifiers`) | Full version |
| Paper-doll UI with slot icons + drag-drop slots (Lite's list is plain text) | Full version |
| Save-contract auto-join | Full version |
| Inventory addon bridge (auto-return on unequip) | Full version |
| Category gating per slot | Full version |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
