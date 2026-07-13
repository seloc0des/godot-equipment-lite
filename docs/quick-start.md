# Quick Start

## Slots

`EquipmentLite.SLOTS = ["weapon_main", "chest", "boots", "ring"]`. These are the only slot ids. If you need different ones, that's the Pro tier (custom `EquipmentLayout`).

## Item shape

Items are any Resource with these fields:

| Field | Type | Notes |
|---|---|---|
| `id` | String | Identifier. |
| `name` | String | Display name. |
| `icon` | Texture2D | Optional. |
| `metadata` | Dictionary | Must contain `equip_slot` = one of the SLOTS. |

The Lite addon ships a minimal `item_resource.gd` you can use, or point at your existing item type — anything with the right fields works.

## Use it

```gdscript
@onready var equipment: EquipmentLite = $EquipmentLite

# Equip auto-detects the slot from metadata.equip_slot:
equipment.try_equip(iron_sword)         # returns slot id used, or ""

# Or set a slot explicitly:
var prev := equipment.equip("chest", plate)  # returns previous occupant

# Inspect:
equipment.get_equipped("weapon_main")   # Resource or null
equipment.is_equipped("chest")          # bool
equipment.all_equipped()                # Dict[slot_id -> Resource]

# Unequip:
equipment.unequip("ring")               # returns the removed item
equipment.clear()                       # remove everything
```

## Listen

```gdscript
equipment.item_equipped.connect(func(slot, item): print("Equipped ", item.name, " in ", slot))
equipment.item_unequipped.connect(func(slot, item): print("Removed ", item.name, " from ", slot))
equipment.contents_changed.connect(_refresh_my_ui)
```

## Save / load

The Lite tier doesn't join a save group. Persist via your own save system using `all_equipped()` and resource paths:

```gdscript
func save_state() -> Dictionary:
    var out: Dictionary = {}
    for slot in equipment.all_equipped().keys():
        var it: Resource = equipment.get_equipped(slot)
        out[slot] = it.resource_path
    return out

func load_state(data: Dictionary) -> void:
    equipment.clear()
    for slot in data.keys():
        var path := String(data[slot])
        if ResourceLoader.exists(path):
            equipment.equip(String(slot), load(path))
```
