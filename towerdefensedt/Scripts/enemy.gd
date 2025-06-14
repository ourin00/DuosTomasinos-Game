extends Node2D

@onready var tower = $"../Tower"
func _process(delta: float) -> void:
	if Input.is_action_pressed("spacebar"):
		global_position = lerp(global_position,tower.global_position,delta*5)
	if Input.is_action_pressed("right_click"):
		global_position = lerp(global_position,tower.global_position,-delta*5)
