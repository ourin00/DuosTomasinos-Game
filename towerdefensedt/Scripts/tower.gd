class_name Tower
extends Node2D

#@export var tower: TowerStats : set = set_tower_stats
@onready var tower_state_machine= $State_machine
@onready var arrow : PackedScene= preload("res://Scenes/arrow.tscn")
var rest_point
var rest_nodes = []
var enemy
signal tower_node(tower)
#func set_tower_stats(value:TowerStats) -> void:
#	tower = value.create_instance()


func _ready() -> void:
	tower_state_machine.init(self)
	rest_nodes = get_tree().get_nodes_in_group("placable")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()
	tower_node.emit(self)


func play(area):
	var arrow_temp = arrow.instantiate()
	add_child(arrow_temp)
	arrow_temp.animate_to_position(area.global_position,0.1)



func _unhandled_input(event: InputEvent) -> void:
	tower_state_machine.on_input(event)

func _process(delta: float) -> void:
	tower_state_machine.process_frame(delta)
