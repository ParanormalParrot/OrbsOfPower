extends Node2D

class_name OrbDragObject

var overlappedTower = null

func _on_area_2d_body_entered(body):
	if body.is_in_group("Tower"):
		overlappedTower = body;
		
func _on_area_2d_body_exited(body):
	if body == overlappedTower:
		overlappedTower = null
