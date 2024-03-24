extends CharacterBody2D

class_name TowerDragObject

var isValidPosition = false

func _ready():
	if $ApprenticeMageTower/Area2D.get_overlapping_bodies().size() == 0:
		isValidPosition = true
		$PlacementAreaIndicator.modulate = Color(0, 1, 0)
	else:
		isValidPosition = false
		$PlacementAreaIndicator.modulate = Color(1, 0, 0)


func _on_area_2d_body_entered(body):
	if $ApprenticeMageTower/Area2D.get_overlapping_bodies().size() == 0:
		isValidPosition = true
		$PlacementAreaIndicator.modulate = Color(0, 1, 0)
	else:
		isValidPosition = false
		$PlacementAreaIndicator.modulate = Color(1, 0, 0)


func _on_area_2d_body_exited(body):
	if $ApprenticeMageTower/Area2D.get_overlapping_bodies().size() == 0:
		isValidPosition = true
		$PlacementAreaIndicator.modulate = Color(0, 1, 0)
	else:
		isValidPosition = false
		$PlacementAreaIndicator.modulate = Color(1, 0, 0)
