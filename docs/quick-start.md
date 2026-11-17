# Quick Start

Everything here happens in the **Equipment · Setup** tab. Code is optional, at the bottom.

## 1. Give your player slots

Select your player node, pick **Player equipment** and press **Apply**.

- The player gets an `EquipmentLite` with four slots (Weapon, Chest, Boots, Ring) and is marked as the player.
- An equipped list goes in the bottom-right corner of the screen. It starts hidden. Press **C** in game to open and close it. It shows one line per slot, such as "Weapon: Iron Sword".
- The tab adds the **character** input action on C. If your project already has a `character` action, the tab keeps yours and the status line names its key.

## 2. Make items

Pick **Equip it when the player picks it up**, choose a **Slot** and press **New item**. The item lands in `res://items` (`new_item.tres`, then `new_item_2.tres`, and so on) with a name and that slot filled in, and opens in the Inspector: rename it and pick an icon there. With an Inventory pack in the project, New item makes that pack's kind of item, so the same sword can sit in the bag and be worn. The **Equippables (Lite)** tab edits Equipment items in the same folder, and its **New** makes them the same way but without a slot: pick one here before you press Apply. The demo's six items are listed after your own, as examples.

## 3. Put gear in the level

1. Add the thing that lies on the ground: a Sprite2D, a mesh, or an Area2D/Area3D.
2. Select it, pick **Equip it when the player picks it up**, choose the item, check its **Slot**, and press **Apply**.
3. It gets an `EquipPickupLite` node. A node that isn't an area also gets a **PickupArea** with a round shape. Resize the shape in the Inspector if it doesn't fit your sprite.

The item carries its slot. Picking an item shows its slot in **Slot**, and Apply writes your choice into the item file, so you never type a slot name. Apply again on the same node to swap its item.

## 4. Press Play

Walk into it. The player puts the item on in its slot, "Equipped Iron Sword" shows at the top of the screen, and the pickup disappears. Whatever was in that slot before is replaced (the full version sends it back to the bag). Untick **Show Messages** on the pickup to turn the message off.

Pickups only react to the node in the "player" group, and your player needs a collision shape to touch them. If the tab warns that nothing is the player, select your player and press **Make the selected node the player**.

## From code (optional)

### Slots

`EquipmentLite.SLOTS = ["weapon_main", "chest", "boots", "ring"]`. These are the only slot ids. If you need different ones, that's the full version (custom `EquipmentLayout`).

### Item shape

Items are any Resource with these fields:

| Field | Type | Notes |
|---|---|---|
| `id` | String | Identifier. |
| `name` | String | Display name. |
| `icon` | Texture2D | Optional. |
| `metadata` | Dictionary | Must contain `equip_slot` = one of the SLOTS. |

The Lite addon ships a minimal `item_resource.gd` you can use, or point at your existing item type. Anything with the right fields works.

### Use it

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

### Listen

```gdscript
equipment.item_equipped.connect(func(slot, item): print("Equipped ", item.name, " in ", slot))
equipment.item_unequipped.connect(func(slot, item): print("Removed ", item.name, " from ", slot))
equipment.contents_changed.connect(_refresh_my_ui)
```

### Save / load

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
