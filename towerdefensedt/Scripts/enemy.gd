extends Node2D
var health:int = 3: set= check_health
@onready var tower = $"../Tower"

func _process(delta: float) -> void:
	if Input.is_action_pressed("spacebar"):
		global_position = lerp(global_position,tower.global_position,delta*5)
	if Input.is_action_pressed("right_click"):
		global_position = lerp(global_position,tower.global_position,-delta*5)
		
func take_damage(damage:int)->void:
	print(health)
	if health>0:
		health -=damage

func check_health(new_health:int):
	health=new_health
	if new_health <= 0:
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("arrow"):
		take_damage(1)
		area.get_parent().queue_free()
