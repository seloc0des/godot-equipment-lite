# Changelog

## 1.4.3 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Equipment · Setup and Equippables (Lite) tabs were blank on Godot 4.5.** Their tabs beside
  the Inspector had no title, so "open the Equipment · Setup tab" pointed at nothing. They are named
  when the pack switches on now. Godot 4.7 was not affected.

## 1.4.2 (2026-09-28)

Renaming an item keeps its slot.

- **Renaming an item keeps the slot the Setup tab gave it.** The tab saved an older copy, so the
  slot vanished and the pickup equipped nothing.
- **The Equippables (Lite) list always shows about five rows**, at any editor scale. At 125% it came
  out a few rows tall. The divider under it still drags.
- **No "invalid UID" warning on the first Play after New item.** Godot hadn't registered the new
  file yet, which put a yellow Debugger badge on screen.

## 1.4.1 (2026-09-27)

Both tabs fit a default dock.

- **The Setup and authoring tabs fit a default dock.** A tab taller than the dock scrolls, and lists
  show what you just made the next time they open.

## 1.4.0 (2026-09-27)

Equipment you can use without writing code.

- **Equip on pickup with no code.** "Equip it when the player picks it up" puts the item in its
  slot, and the slot is picked from a list.
- **An equipped list opens with C** at the bottom right.
- **New item uses the Inventory pack's item script when it's installed**, so a sword made there can
  go in the bag and be worn.
- **"Player equipment"** adds the slots, marks the node as the player and adds the list. Six example
  items in the demo.
- **The Equippables (Lite) tab shows its fields in the editor.** It was empty there after New and
  when opening a file.
- **New in the Equippables (Lite) tab names the item** and opens it in the Inspector, and a rename
  made in the Inspector survives the tab's Save.
- **Pressing Play right after Apply includes what it added.** The Setup tab never marked the scene
  as changed, so Play ran the saved version without it.
- **The slots component is added the way a node you add by hand is**, so its game code doesn't run
  in the editor.
- **Saving in the Equippables tab keeps your scenes linked to the file** instead of leaving them an
  orphaned copy that the scene then saved inside itself.
- **Nodes the Setup tab adds get readable names.** A second one under the same parent is
  called something like `UILayer2`, instead of a generated name full of `@` signs.
- **Long status messages in the authoring tab wrap** instead of running off the edge of the dock.

## 1.3.0 (2026-08-22)

- Engine floor moves to Godot 4.5. The project and the plugin description both
  said 4.3 before, which no longer matched the code.
- The addon and its docs now say selodev throughout. The old CindieForge name
  was still in the README and the upgrade notes after the rebrand.

## 1.2.0 — 2026-07-24

One-click no-code setup.

- New **Equipment · Setup** panel (the first dock tab): pick the outcome you want → **Apply** → the Lite component is added to your scene, baked in and re-editable.
- Pro unlocks the full no-code wiring — gameplay triggers, bound UI, and cross-system hooks.

## 1.1.0 — 2026-07-24

No-code authoring dock.

- New editor dock: author equippable item resources through a UI panel — create, edit, duplicate, delete, no `.tres` hand-editing. (The Pro tier adds every field, one-click scene wiring, and the `EventTrigger` node.)

## 1.0.0 — 2026-06-01

Initial release.

- `EquipmentLite` Node — 4 fixed slots, equip / unequip / try_equip / get_equipped / all_equipped / clear.
- Item Resource: minimal, duck-typed on id / name / icon / metadata.equip_slot.
- Signals: `item_equipped`, `item_unequipped`, `contents_changed`.
- Demo: 6 items across 4 slot types, equip / unequip buttons, live slot list.
