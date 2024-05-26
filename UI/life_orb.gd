extends Orb

class_name LifeOrb

@onready var dragObjectPrefab = preload("res://UI/life_orb_drag_object.tscn")

@onready var alchemistTowerPrefab = preload("res://Towers/alchemist_tower.tscn")


@onready var fireAlchemistTowerPrefab = preload("res://Towers/fire_alchemist_tower.tscn")
@onready var earthAlchemistTower = preload("res://Towers/earth_alchemist_tower.tscn")
@onready var hypnosistTower = preload("res://Towers/hypnosist_tower.tscn")

func _ready():
	$ManaCostLabel.text = str(mana_cost)

func _process(delta):
	if gameController.mana >= mana_cost:
		$ManaCostLabel.set("theme_override_colors/font_color",Color.WHITE)
	else:
		$ManaCostLabel.set("theme_override_colors/font_color",Color.RED)

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
				var alchemistTower = alchemistTowerPrefab.instantiate()
				get_tree().current_scene.add_child(alchemistTower)
				alchemistTower.position = get_child(1).overlappedTower.position
				var cost = get_child(1).overlappedTower.cost + mana_cost
				alchemistTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				alchemistTower.name = "AlchemistTower"
				
				gameController.mana -= mana_cost
			if get_child(1).overlappedTower != null and "FireMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = fireAlchemistTowerPrefab.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "FireAlchemistTower"
				var cost = get_child(1).overlappedTower.cost + mana_cost
				upgradedTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				gameController.mana -= mana_cost
			if get_child(1).overlappedTower != null and "EarthMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = earthAlchemistTower.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "EarthAlchemistTower"
				var cost = get_child(1).overlappedTower.cost + mana_cost
				upgradedTower.cost = cost
				get_child(1).overlappedTower.queue_free()
				get_child(1).queue_free()
				gameController.mana -= mana_cost
			if get_child(1).overlappedTower != null and "PsychicMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
				var upgradedTower = hypnosistTower.instantiate()
				get_tree().current_scene.add_child(upgradedTower)
				upgradedTower.position = get_child(1).overlappedTower.position
				upgradedTower.name= "EarthAlchemistTower"
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
