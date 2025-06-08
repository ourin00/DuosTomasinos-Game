#dragging
extends TowerState

@export var released_state: TowerState

@export var idle_state: TowerState
var current_position
var mouse_position
var mouse_entered:bool = false
var body_ref
signal body_recieved(body)
var offset:Vector2
#when this method is first called set the offset
func enter() -> void:
	offset = get_viewport().get_mouse_position() - parent.global_position
	print("in dragging script")

func on_input(_event:InputEvent)->TowerState:
	if Input.is_action_just_released("left_click") && !mouse_entered:
		print("relased")
		return idle_state
	if Input.is_action_just_released("left_click") && mouse_entered:
		print("relased")
		return released_state
	return null

func process_frame(_delta: float)-> TowerState:
	parent.global_position = get_viewport().get_mouse_position() - offset
	return null

func on_body_entered(body: StaticBody2D)->TowerState:
	mouse_entered=true
	body_recieved.emit(body)
	return null

func on_body_exited(body: StaticBody2D)->TowerState:
	mouse_entered=false
	return null
