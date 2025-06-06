class_name Hand
extends Container

@onready var TOWER = preload("res://Scenes/tower.tscn")
var tower
#spawns tower
func _on_button_pressed() -> void:
	var tower = TOWER.instantiate()
	add_child(tower)
	
#deals damage to tower
func _on_button_2_pressed() -> void:
	tower.take_damage(3)
