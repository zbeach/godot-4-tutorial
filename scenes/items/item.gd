extends Area2D

const ROTATION_SPEED: int = 4
var available_options = ['laser', 'laser', 'laser', 'laser', 'grenade', 'health']
var type = available_options[randi() % len(available_options)]

func _ready():
	match type:
		'laser':
			$Sprite2D.modulate = Color(0.185, 0.449, 0.696, 1.0)
		'grenade':
			$Sprite2D.modulate = Color(0.706, 0.0, 0.171, 1.0)
		'health':
			$Sprite2D.modulate = Color(0.0, 0.601, 0.384, 1.0)

func _process(delta):
	rotation += ROTATION_SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	match type:
		'laser':
			Globals.laser_count += 5
		'grenade':
			Globals.grenade_count += 1
		'health':
			Globals.health += 10
	queue_free()
