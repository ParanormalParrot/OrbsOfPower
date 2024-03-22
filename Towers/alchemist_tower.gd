extends StaticBody2D

class_name AlchemistTower
var enemies = []
var homunculi = []
@export var homunculusAsset: PackedScene
@export var number_of_summons = 2
var spawnRate = 5
var currentSpawnTime = spawnRate
var cost
@onready var tower_ui = $TowerUI

func _ready():
	$TowerUI.visible = false
	
	
	
func _process(delta):
	currentSpawnTime-=delta
	if currentSpawnTime <= 0:
		for i in homunculi:
			if i == null:
				homunculi.erase(i)
		if homunculi.size() < number_of_summons:
			var homunculus = homunculusAsset.instantiate()
			homunculi.append(homunculus)
			get_tree().get_current_scene().add_child(homunculus)
			
			homunculus.global_position = $Flag.global_position
			homunculus.enemies = enemies
			homunculus.defaultPosition = $Flag.global_position
			currentSpawnTime = spawnRate

			
func _on_aggro_range_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body)
		for i in homunculi:
			if i != null:
				i.enemies.append(body)



func _on_aggro_range_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies.erase(body)
		for i in homunculi:
			if i != null:
				i.enemies.erase(body)



func _on_range_body_entered(body):
	if body == $Flag:
		$Flag.is_in_range = true




func _on_range_body_exited(body):
	if body == $Flag:
		$Flag.is_in_range = false
		
		
func _on_mouse_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_mask == 1:
		$TowerUI.visible = !$TowerUI.visible


func _on_dismantle_button_pressed():
	get_tree().get_root().get_node("Main/PlayerStatsController").mana+= cost/2
	for i in homunculi:
		if is_instance_valid(i):
			i.queue_free()
	queue_free()
	

func _on_tower_ui_mouse_exited():
	$TowerUI.visible = false


