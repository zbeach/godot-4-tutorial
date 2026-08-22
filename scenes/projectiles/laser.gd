extends Area2D

@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _get_velocity(_direction, _speed, delta) -> Vector2:
	return _direction * _speed * delta
	
func _ready():
	$ExpireTimer.start()

func _process(delta):
	position += _get_velocity(direction, speed, delta)

func _on_body_entered(body: Node2D) -> void:
	if "hit" in body:
		body.hit()
	queue_free()

func _on_expire_timer_timeout() -> void:
	queue_free()
 
