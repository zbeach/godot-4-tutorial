extends VBoxContainer
class_name Counter

@export var icon_texture: Texture

func _ready() -> void:
	$Icon.texture = icon_texture

func set_count(count: int) -> void:
	$Count.text = str(count)
