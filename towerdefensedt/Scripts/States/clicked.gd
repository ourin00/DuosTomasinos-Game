#clicked
extends TowerState

@export var released_state: TowerState
@export var drag_state: TowerState

var parent_position:Vector2
var mouse_position:Vector2
var offset:Vector2
#when this method is first called set the offset
func enter() -> void:
	mouse_position = get_viewport().get_mouse_position()
	parent_position = parent.global_position
	offset= parent_position - mouse_position
	print("in clicked script")
func on_input(_event: InputEvent)-> TowerState:
	if Input.is_action_just_released("left_click"):
		return released_state
	return null

func process_frame(_delta: float)-> TowerState:
	mouse_position = get_viewport().get_mouse_position()
	if mouse_position != parent_position-offset: 
		return drag_state
	return null
