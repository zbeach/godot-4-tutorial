extends Node2D
class_name LevelParent

@onready var laser_counter: Counter = $UI/Counters/HBoxContainer/Laser
@onready var grenade_counter: Counter = $UI/Counters/HBoxContainer/Grenade

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")


func _ready() -> void:
	laser_counter.set_count(Globals.laser_count)
	grenade_counter.set_count(Globals.grenade_count)
	
	Globals.laser_count_changed.connect(laser_counter.set_count)
	Globals.grenade_count_changed.connect(grenade_counter.set_count)

func _on_player_projectile(projectile: CollisionObject2D, pos: Vector2) -> void:
	projectile.position = pos
	$Projectiles.add_child(projectile)
	
func _on_player_laser(pos: Vector2, direction: Vector2) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(laser.direction.angle()) + 90
	_on_player_projectile(laser, pos)
	
func _on_player_grenade(pos: Vector2, direction: Vector2) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.linear_velocity = direction * grenade.speed
	_on_player_projectile(grenade, pos)

func _on_house_player_entered() -> void:
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player, "modulate:a", 0, 2).from(0.5)
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1).set_trans(Tween.TRANS_QUAD)

func _on_house_player_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 2)
