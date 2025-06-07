class_name Hand
extends Container

@onready var TOWER = preload("res://Scenes/tower.tscn")
var tower_instance
#spawns tower
func _on_button_pressed() -> void:
	var tower_instance = TOWER.instantiate()
	add_child(tower_instance)
	
#deals damage to tower
func _on_button_2_pressed() -> void:
	tower_instance.take_damage(3)
