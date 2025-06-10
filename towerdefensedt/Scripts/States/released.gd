#released
extends TowerState

@export var idle_state: TowerState
@export var play_state: TowerState

var in_pos: bool = false

var rest_point:Vector2
var rest_nodes = []
var distance
func enter():
	print("in released script")
	rest_nodes = get_tree().get_nodes_in_group("placable")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()

func process_frame(delta: float)-> TowerState:
	var shortest_dist = 75
	for child in rest_nodes:
		var distance = parent.global_position.distance_to(child.global_position)
		if distance < shortest_dist:
			child.select()
			rest_point = child.global_position
			shortest_dist = distance
			parent.global_position = lerp(parent.global_position,rest_point,10*delta)
	if are_vectors_equal(parent.global_position,rest_point) == true:
		return play_state
	return null

func are_vectors_equal(a: Vector2, b: Vector2) -> bool:
	print(a.distance_to(b) < 1)
	return a.distance_to(b) < 1
