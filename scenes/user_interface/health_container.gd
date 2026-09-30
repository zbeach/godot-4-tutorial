extends MarginContainer
class_name HealthContainer

func _ready() -> void:
	Globals.health_changed.connect(_update)
	_update(Globals.health)

func _update(health: int) -> void:
	$HealthBar.set_value_no_signal(float(health))
