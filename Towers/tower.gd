extends StaticBody2D

class_name Tower

var cost = 0
@onready var tower_ui = $TowerUI

func _ready():
	$TowerUI.visible = false
	
func _on_mouse_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_mask == 1:
		$TowerUI.visible = !$TowerUI.visible

func _on_dismantle_button_pressed():
	get_tree().get_root().get_node("Main/PlayerStatsController").mana+= cost/2
	queue_free()
	
func _on_tower_ui_mouse_exited():
	$TowerUI.visible = false
