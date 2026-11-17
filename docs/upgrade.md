# Upgrade to the full Equipment

## What the full version adds

- **Customizable layout.** `EquipmentLayout` + `EquipmentSlotConfig` Resources — any slot ids, any categories per slot.
- **Two-handed conflicts.** A two-handed weapon ejects whatever's in `weapon_off` and blocks it from re-equipping.
- **Modifier aggregation.** `equipment.get_modifier_sum("damage")` returns `{flat, percent_add, percent_mult}`. `apply_modifiers("damage", 5.0)` returns the final value. Pairs cleanly with the Stats / Skill Trees addon.
- **Paper-doll UI.** `EquipmentUI` + `EquipmentPaperSlot` Controls with drag-drop from any inventory, slot-to-slot swap, themed.
- **Save-contract auto-join.** Equipped state lives in the Save addon's payload.
- **Inventory addon bridge.** Set `inventory_path` and unequipped items return to the bag automatically; auto-equip on pickup from `Events.item_used`.

## Moving from Lite

The full version installs next to the Lite, in its own folder, and both run in the same project, so you can move over one piece at a time. It isn't a drop-in replacement: the class names differ, and so do some method names.

`EquipmentLite` becomes `EquipmentComponent`. `equip`, `unequip`, `try_equip`, `get_equipped`, `all_equipped` and `clear` keep their names. In the full version, `unequip` puts the item back in the bag and `try_equip` takes it from the bag by default. Pass `false` to keep the Lite's behavior. `is_equipped` doesn't exist in the full version. The full version reads the same `equip_slot` metadata key on items.

## Where to buy

The full version is on itch.io: **https://selodev.itch.io**.

## License

MIT.
