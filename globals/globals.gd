extends Node

signal laser_count_changed(count: int)
signal grenade_count_changed(count: int)

var laser_count: int = 20:
	set(count):
		laser_count = count
		laser_count_changed.emit(laser_count)

var grenade_count: int = 10:
	set(count):
		grenade_count = count
		grenade_count_changed.emit(grenade_count)
