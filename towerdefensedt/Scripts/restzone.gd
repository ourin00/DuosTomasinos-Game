extends Node2D
func select():
	for child in get_tree().get_nodes_in_group("placable"):
		child.deselect()
		modulate=Color.ORANGE_RED
func deselect():
	modulate=Color.WHITE
