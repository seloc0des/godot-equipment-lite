# Equipment — Lite

> **New since 1.0.0:** a no-code authoring dock (create, edit, duplicate and delete equippable items from an editor panel) and a one-click **Setup** tab that drops a working component into your scene. Details in CHANGELOG.md.

**FREE.** Fixed 4-slot equipment (weapon_main / chest / boots / ring) for Godot 4.3+. Pure GDScript. MIT.

The working core of the [CindieForge Equipment addon](docs/upgrade.md). Equip items by slot, get equipped items back, listen for changes. No modifier math, no UI — bring your own paper-doll.

## 5-minute install

1. Copy `addons/equipment_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Equipment — Lite**.
3. Add an `EquipmentLite` Node to your player.
4. Author items with `metadata.equip_slot = "weapon_main" | "chest" | "boots" | "ring"`.
5. `equipment.try_equip(item)`, `equipment.unequip(slot_id)`, `equipment.get_equipped(slot_id)`.

```gdscript
equipment.try_equip(iron_sword)               # auto-detects slot from metadata
equipment.equip("chest", plate_armor)         # explicit slot
var prev := equipment.unequip("ring")         # returns the item (or null)
equipment.all_equipped()                      # Dict[slot_id -> Resource]
```

## What's missing (and why)

| Feature | Tier |
|---|---|
| Customizable slot layout (`EquipmentLayout` Resource) | Pro |
| Two-handed conflicts | Pro |
| Modifier aggregation (`get_modifier_sum`, `apply_modifiers`) | Pro |
| Paper-doll UI Control + drag-drop slots | Pro |
| Save-contract auto-join | Pro |
| Inventory addon bridge (auto-return on unequip) | Pro |
| Category gating per slot | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT.


---

## Part of a family

The free Lite tier of one system in a set of Godot 4 RPG systems built to
interoperate (shared item + save contracts) — each also works fully standalone.

**Free tiers — try before you buy:**

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite) — item slots, stack merging, capacity
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite) — 4-slot gear manager
- [Save/Load Lite](https://github.com/seloc0des/godot-save-load-lite) — single-slot JSON persistence
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite) — shapeless instant recipes
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite) — COLLECT + KILL quests
- [Stats/Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite) — stat aggregator
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite) — single fixed-currency shop
- [Settings + Menu System](https://github.com/seloc0des/godot-settings-menus) — complete, free, no paid tier

**Full versions** — drop-in UI, weight/categories, timed crafting, restock & currencies,
save-aware cross-system integration, and more — are on itch.io:
**https://selodev.itch.io**
