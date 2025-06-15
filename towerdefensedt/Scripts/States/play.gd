extends TowerState
@export var clicked_state: TowerState

#instances
var arrow_inst
var parent_tower
#logic
var enemy_entered:bool=false
#data
var last_enemy_point
var enemy=[]
func on_area_entered(area: Area2D):
	if area.is_in_group("enemy"):
		arrow_inst=arrow.instantiate()
		enemy.append(area)
		parent_tower.call_deferred("add_child",arrow_inst)
		enemy_entered=true

func on_area_exited(area: Area2D):
	if area.is_in_group("enemy"):
		enemy_entered=false
		last_enemy_point= area.global_position
		arrow_inst.queue_free()

func process_frame(delta: float) -> TowerState:
	if enemy_entered:
		arrow_inst.global_position = lerp(arrow_inst.global_position,enemy[0].global_position,delta*2)
	return null

func _on_node_forwarding(node):
	parent_tower=node
