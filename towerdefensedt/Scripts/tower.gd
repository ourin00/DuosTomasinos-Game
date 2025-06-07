class_name Tower
extends Node2D

#@export var tower: TowerStats : set = set_tower_stats
@onready var tower_state_machine= $State_machine

#func set_tower_stats(value:TowerStats) -> void:
#	tower = value.create_instance()


func _ready() -> void:
	tower_state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	tower_state_machine.on_input(event)

func _process(delta: float) -> void:
	tower_state_machine.process_frame(delta)
