class_name TowerStateMachine
extends Node

@export var starting_state: TowerState

var current_state: TowerState

func init(parent: Tower)->void:
	for child in get_children():
		child.parent = parent
	
	change_state(starting_state)

func change_state(new_state: TowerState)->void:
	if current_state:
		current_state.exit
	current_state = new_state
	current_state.enter()

func on_input(_event: InputEvent)-> void:
	var new_state = current_state.on_input(_event)
	if new_state:
		change_state(new_state)

func on_gui_input(_event: InputEvent)-> void:
	var new_state = current_state.on_gui_input(_event)
	if new_state:
		change_state(new_state)

func on_mouse_entered()-> void:
	var new_state = current_state.on_mouse_entered()
	if new_state:
		change_state(new_state)

func on_mouse_exited()->void:
	var new_state = current_state.on_mouse_exited()
	if new_state:
		change_state(new_state)

func process_frame(delta: float) ->void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
