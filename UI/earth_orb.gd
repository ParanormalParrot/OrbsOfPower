extends Orb

class_name EarthOrb

@onready var dragObjectPrefab = preload("res://UI/earth_orb_drag_object.tscn")

@onready var earthMageTowerPrefab = preload("res://Towers/earth_mage_tower.tscn")

@onready var magmaMageTowerPrefab = preload("res://Towers/magma_mage_tower.tscn")

@onready var earthAlchemistTowerPrefab = preload("res://Towers/earth_alchemist_tower.tscn")

@onready var seismicPsychicMageTowerPrefab = preload("res://Towers/seismic_psychic_mage_tower.tscn")

		
func _on_gui_input(event):
	if gameController.mana >= mana_cost:
		if event is InputEventMouseButton and event.button_mask == 1:
			var dragObject  = dragObjectPrefab.instantiate()
			add_child(dragObject)
			get_child(1).global_position = get_global_mouse_position()
			
		elif event is InputEventMouseMotion and event.button_mask == 1:
		
			var child = get_child(1)
			if child:
				child.global_position = get_global_mouse_position()
		elif event is InputEventMouseButton and event.button_mask == 0:
			if get_child(1).overlappedTower != null and "ApprenticeTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = earthMageTowerPrefab.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "EarthMageTower"
				var cost = get_child(1).overlappedTower.cost + mana_cost
				upgradedTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				gameController.mana -= mana_cost
			elif get_child(1).overlappedTower != null and "FireMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = magmaMageTowerPrefab.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "MagmaMageTower"
				var cost = get_child(1).overlappedTower.cost + mana_cost
				upgradedTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				gameController.mana -= mana_cost
			elif get_child(1).overlappedTower != null and "AlchemistTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = earthAlchemistTowerPrefab.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "MagmaMageTower"
				var cost = get_child(1).overlappedTower.cost + mana_cost
				upgradedTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				gameController.mana -= mana_cost
			elif get_child(1).overlappedTower != null and "PsychicMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = seismicPsychicMageTowerPrefab.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "MagmaMageTower"
				var cost = get_child(1).overlappedTower.cost + mana_cost
				upgradedTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				gameController.mana -= mana_cost
			
			else:
				get_child(1).queue_free()
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
