extends Node

signal laser_count_changed(value: int)
signal grenade_count_changed(value: int)
signal health_changed(value: int)

var laser_count: int = 20:
	set(value):
		laser_count = value
		laser_count_changed.emit(laser_count)

var grenade_count: int = 5:
	set(value):
		grenade_count = value
		grenade_count_changed.emit(grenade_count)

var health: int = 60:
	set(value):
		health = value
		health_changed.emit(health)
