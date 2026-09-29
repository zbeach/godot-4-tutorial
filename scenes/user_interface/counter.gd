extends VBoxContainer
class_name Counter

@export var count: int = 5
@export var icon_texture: Texture


func _ready() -> void:
	$Count.text = str(count)
	$Icon.texture = icon_texture

func set_count(count: int) -> void:
	$Count.text = str(count)
