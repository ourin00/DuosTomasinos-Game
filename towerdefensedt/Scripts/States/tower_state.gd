class_name TowerState
extends Node

var parent:Tower
@onready var arrow= preload("res://Scenes/arrow.tscn")
func enter() -> void:
	pass

func exit() -> void:
	pass

func on_input(_event: InputEvent)-> TowerState:
	return null
	

func on_gui_input(_event: InputEvent)-> TowerState:
	return null

func on_mouse_entered()-> TowerState:
	return null

func on_mouse_exited()-> TowerState:
	return null

func process_frame(_delta: float) -> TowerState:
	return null

func on_body_entered(_body)-> TowerState:
	return null

func on_body_exited(_body)-> TowerState:
	return null
	
func on_area_entered(_area: Area2D) -> TowerState:
	return null

func on_area_exited(_area: Area2D) -> TowerState:
	return null
