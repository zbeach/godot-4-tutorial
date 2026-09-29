extends CanvasLayer

@onready var laser_label: Label = $Counters/HBoxContainer/Laser/Count


func update_laser_text():
	laser_label.text = str(Globals.laser_count)
