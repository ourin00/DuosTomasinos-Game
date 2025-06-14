extends TowerState

@export var clicked_state: TowerState
func enter():
	print("play state")
	
func on_area_entered(area: Area2D):
	if area.is_in_group("enemy"):
		print("enemy detected")
		arrow.instantiate()

func on_area_exited(area: Area2D):
	if area.is_in_group("enemy"):
		print("enemy left")
