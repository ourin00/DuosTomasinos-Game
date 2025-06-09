#dragging
extends TowerState

signal body_recieved(body)

@export var released_state: TowerState
@export var idle_state: TowerState
var current_position
var mouse_position
var mouse_entered:bool = false

var body_ref

var offset:Vector2

var rest_point
var rest_nodes = []

#when this method is first called set the offset
func enter() -> void:
	offset = get_viewport().get_mouse_position() - parent.global_position
	print("in dragging script")
	rest_nodes = get_tree().get_nodes_in_group("placable")
	rest_point = rest_nodes[0].global_position


func on_input(_event:InputEvent)->TowerState:
	if Input.is_action_just_released("left_click") && !mouse_entered:
		return idle_state
	if Input.is_action_just_released("left_click") && mouse_entered:
		return released_state
	return null

func process_frame(delta: float)-> TowerState:
	parent.global_position = lerp(parent.global_position,get_viewport().get_mouse_position() ,25*delta)
	var shortest_dist = 100
	for child in rest_nodes:
		var distance = parent.global_position.distance_to(child.global_position)
		if distance < shortest_dist:
			child.select()
	return null

func on_body_entered(body: Node2D)->TowerState:
	mouse_entered=true
	body_recieved.emit(body)
	return null

func on_body_exited(body: Node2D)->TowerState:
	mouse_entered=false
	return null
