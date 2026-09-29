extends CharacterBody2D
class_name Player

signal laser(pos: Vector2, dir: Vector2)
signal grenade(pos: Vector2, dir: Vector2)

var can_laser: bool = true
var can_grenade: bool = true

@export var max_speed: int = 500
var speed: int = max_speed


func _get_random_projectile_origin() -> Vector2:
	var projectile_markers: Array[Node] = $ProjectileStartPositions.get_children()
	var marker: Node = projectile_markers[randi() % projectile_markers.size()]
	return marker.global_position

func _handle_projectile_action(set_deployability: Callable, timer: Timer, delay: float, weapon_signal: Signal) -> void:
	set_deployability.call(false)
	timer.start(delay)
	var direction = (get_global_mouse_position() - position).normalized()
	weapon_signal.emit(_get_random_projectile_origin(), direction)
	
func _handle_laser_action() -> void:
	$Blast.emitting = true
	_handle_projectile_action(
		func(_can_laser: bool): can_laser = _can_laser,
		$LaserTimer,
		0.5,
		laser
	)
	
func _handle_grenade_action() -> void:
	_handle_projectile_action(
		func(_can_grenade: bool): can_grenade = _can_grenade,
		$GrenadeTimer,
		2,
		grenade
	)
	
func _handle_projectile_actions() -> void:
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_count > 0:
		Globals.laser_count -= 1
		_handle_laser_action()
	
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_count > 0:
		Globals.grenade_count -= 1
		_handle_grenade_action()

func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	# Rotate
	look_at(get_global_mouse_position())
	
	_handle_projectile_actions()

func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
