#released
extends TowerState

@export var idle_state: TowerState
@export var play_state: TowerState
var body_ref

func enter()->void:
	parent.play()
	parent.instantiate()


func _on_dragging_body_recieved(body: Variant) -> void:
	body_ref=body
	
