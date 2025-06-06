class_name Tower
extends Node2D

@export var tower: TowerStats : set = set_tower_stats
@onready var tower_state_machine: TowerState 

func set_tower_stats(value:TowerStats) -> void:
	tower = value.create_instance()


func _on_mouse_entered()->void:
	pass
