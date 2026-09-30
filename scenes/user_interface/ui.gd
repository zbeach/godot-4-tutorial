extends CanvasLayer

@onready var laser_counter: Counter = $Counters/HBoxContainer/Laser
@onready var grenade_counter: Counter = $Counters/HBoxContainer/Grenade


func _ready() -> void:
	Globals.laser_count_changed.connect(laser_counter.update)
	Globals.grenade_count_changed.connect(grenade_counter.update)
	
	laser_counter.update(Globals.laser_count)
	grenade_counter.update(Globals.grenade_count)
