class_name Arrow
extends Node2D

var tween: Tween

func write()->void:
	print("hello")

func animate_to_position(new_position: Vector2, duration:float)-> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "global_position",new_position,duration)
	
