class_name Tower
extends Node2D

#@export var tower: TowerStats : set = set_tower_stats
@onready var tower_state_machine= $State_machine
var rest_point
var rest_nodes = []
#func set_tower_stats(value:TowerStats) -> void:
#	tower = value.create_instance()


func _ready() -> void:
	tower_state_machine.init(self)
	rest_nodes = get_tree().get_nodes_in_group("placable")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()

func play(delta):
	var shortest_dist = 75
	for child in rest_nodes:
		var distance = global_position.distance_to(child.global_position)
		if distance < shortest_dist:
			child.select()
			rest_point = child.global_position
			shortest_dist = distance
	global_position = lerp(global_position,rest_point,10*delta)
	
func _unhandled_input(event: InputEvent) -> void:
	tower_state_machine.on_input(event)

func _process(delta: float) -> void:
	tower_state_machine.process_frame(delta)
