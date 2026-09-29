extends VBoxContainer
class_name Counter

@export var icon_texture: Texture

const GREEN: Color = Color("6bbfa3")
const RED: Color = Color(0.9, 0, 0, 1)

func _ready() -> void:
	$Icon.texture = icon_texture

func _get_color_for_count(count: int) -> Color:
	if (count == 0):
		return RED;
	return GREEN

func update(count: int) -> void:
	# Set count
	$Count.text = str(count)
	
	# Update color
	modulate = _get_color_for_count(count)
