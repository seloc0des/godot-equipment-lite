# Upgrade to Equipment (Pro)

## What Pro adds

- **Customizable layout.** `EquipmentLayout` + `EquipmentSlotConfig` Resources — any slot ids, any categories per slot.
- **Two-handed conflicts.** A two-handed weapon ejects whatever's in `weapon_off` and blocks it from re-equipping.
- **Modifier aggregation.** `equipment.get_modifier_sum("damage")` returns `{flat, percent_add, percent_mult}`. `apply_modifiers("damage", 5.0)` returns the final value. Pairs cleanly with the Stats / Skill Trees addon.
- **Paper-doll UI.** `EquipmentUI` + `EquipmentPaperSlot` Controls with drag-drop from any inventory, slot-to-slot swap, themed.
- **Save-contract auto-join.** Equipped state lives in the Save addon's payload.
- **Inventory addon bridge.** Set `inventory_path` and unequipped items return to the bag automatically; auto-equip on pickup from `Events.item_used`.

## Migration from Lite

Slot ids are arbitrary in Pro, but the Lite defaults (`weapon_main`, `chest`, `boots`, `ring`) are also the recommended Pro defaults. Item metadata's `equip_slot` key is identical. `try_equip()` works the same way.

## Where to buy

The full version is on itch.io — **https://selodev.itch.io**. Both tiers share the
same field names and method signatures, so upgrading is a class-name swap.

## License

MIT.
