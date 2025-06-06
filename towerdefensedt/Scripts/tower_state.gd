class_name TowerState
extends Node

enum State {BASE, CLICKED, DRAGGING, RELEASED}

signal transition_request (from: TowerState, to: State)

@export var state: State

func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent)-> void:
	pass
	

func on_gui_input(_event: InputEvent)-> void:
	pass

func on_mouse_enetered()-> void:
	pass

func on_mouse_exited()->void:
	pass
