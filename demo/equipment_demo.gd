extends Node

const ItemScript := preload("res://addons/equipment_lite/item_resource.gd")
const EquipmentLiteScript := preload("res://addons/equipment_lite/equipment_lite.gd")
const SLOTS: Array = ["weapon_main", "chest", "boots", "ring"]

var _eq: EquipmentLite
var _slot_labels: Dictionary = {}
var _items: Array


func _ready() -> void:
	var bg := ColorRect.new()
	bg.color = Color(0.10, 0.12, 0.16)
	bg.anchor_right = 1; bg.anchor_bottom = 1
	add_child(bg)

	_items = [
		_item("sword", "Iron Sword", "weapon_main"),
		_item("axe", "Battle Axe", "weapon_main"),
		_item("plate", "Plate Chest", "chest"),
		_item("boots", "Leather Boots", "boots"),
		_item("ring1", "Ring of Focus", "ring"),
		_item("ring2", "Ring of Power", "ring"),
	]

	_eq = EquipmentLiteScript.new()
	add_child(_eq)
	_eq.contents_changed.connect(_refresh)

	var layer := CanvasLayer.new()
	add_child(layer)

	var title := Label.new()
	title.text = "Equipment — Lite — Demo"
	title.position = Vector2(16, 12)
	title.add_theme_font_size_override("font_size", 16)
	layer.add_child(title)

	# Slot list (right).
	var slots := VBoxContainer.new()
	slots.position = Vector2(540, 48)
	slots.add_theme_constant_override("separation", 6)
	layer.add_child(slots)
	for slot_id in SLOTS:
		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation", 8)
		slots.add_child(row)
		var name_label := Label.new()
		name_label.text = "%s:" % String(slot_id)
		name_label.add_theme_font_size_override("font_size", 14)
		name_label.custom_minimum_size = Vector2(120, 0)
		row.add_child(name_label)
		var val_label := Label.new()
		val_label.text = "—"
		val_label.add_theme_font_size_override("font_size", 14)
		val_label.modulate = Color(1, 1, 1, 0.7)
		row.add_child(val_label)
		var unequip_btn := Button.new()
		unequip_btn.text = "Unequip"
		unequip_btn.pressed.connect(_eq.unequip.bind(String(slot_id)))
		row.add_child(unequip_btn)
		_slot_labels[String(slot_id)] = val_label

	# Item buttons (left).
	var btns := VBoxContainer.new()
	btns.position = Vector2(16, 48)
	btns.add_theme_constant_override("separation", 4)
	layer.add_child(btns)
	for it in _items:
		var b := Button.new()
		b.text = "Equip %s (%s)" % [String(it.name), String(it.metadata.equip_slot)]
		b.pressed.connect(_eq.try_equip.bind(it))
		btns.add_child(b)

	_refresh()


func _item(id_: String, name_: String, slot: String) -> Resource:
	var it = ItemScript.new()
	it.id = id_; it.name = name_
	it.metadata = {"equip_slot": slot}
	return it


func _refresh() -> void:
	for slot_id in SLOTS:
		var it: Resource = _eq.get_equipped(String(slot_id))
		var l: Label = _slot_labels[String(slot_id)]
		l.text = String(it.name) if it != null else "—"
		l.modulate = Color(1, 1, 1, 1.0) if it != null else Color(1, 1, 1, 0.5)
