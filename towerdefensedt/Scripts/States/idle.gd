#idle
extends TowerState

@export var clicked_state:TowerState
var mouse_entered:bool = false

func enter():
	parent.scale=(Vector2(1.00,1.00))
	print("idle state")


#if left click + mouse on tower go to clicked state
func on_input(_event: InputEvent)->TowerState:
	if Input.is_action_just_pressed("left_click") && mouse_entered:
		parent.scale=(Vector2(1.15,1.15))
		return clicked_state
	return null

func on_mouse_entered() -> TowerState:
	parent.scale=(Vector2(1.15,1.15))
	mouse_entered=true
	return null


func on_mouse_exited() -> TowerState:
	parent.scale=(Vector2(1.00,1.00))
	mouse_entered=false
	return null
