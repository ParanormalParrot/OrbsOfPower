extends TextureRect


@onready var dragObjectPrefab = preload("res://UI/fire_orb_drag_object.tscn")

@onready var fireMageTowerPrefab = preload("res://Towers/fire_mage_tower.tscn")

@onready var mindScorcherTowerPrefab = preload("res://Towers/mind_scorcher_tower.tscn")

@onready var magmaMageTowerPrefab = preload("res://Towers/magma_mage_tower.tscn")


@onready var fireAlchemistPrefab = preload("res://Towers/fire_alchemist_tower.tscn")


@export var gameController: Node2D
@export var mana_cost = 100
func _ready():
	$ManaCostLabel.text = str(mana_cost)

func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_mask == 1:
		var dragObject = dragObjectPrefab.instantiate()
		add_child(dragObject)
		get_child(1).global_position = get_global_mouse_position()
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if get_child(1):
			get_child(1).global_position = get_global_mouse_position()
			
	elif event is InputEventMouseButton and event.button_mask == 0:
		if get_child(1).overlappedTower != null and "ApprenticeTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
			var path = get_tree().get_root().get_node("Main/Towers")
			var upgradedTower = fireMageTowerPrefab.instantiate()
			path.add_child(upgradedTower)
			upgradedTower.position = get_child(1).overlappedTower.position
			upgradedTower.name = "FireMageTower"
			var cost = get_child(1).overlappedTower.cost + mana_cost
			upgradedTower.cost = cost
			get_child(1).overlappedTower.queue_free()
			get_child(1).queue_free()
			gameController.mana -= mana_cost
		elif get_child(1).overlappedTower != null and "PsychicMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
			var path = get_tree().get_root().get_node("Main/Towers")
			var upgradedTower = mindScorcherTowerPrefab.instantiate()
			path.add_child(upgradedTower)
			upgradedTower.position = get_child(1).overlappedTower.position
			var cost = get_child(1).overlappedTower.cost + mana_cost
			upgradedTower.cost = cost
			get_child(1).overlappedTower.queue_free()
			get_child(1).queue_free()
			gameController.mana -= mana_cost
		elif get_child(1).overlappedTower != null and "EarthMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
			var path = get_tree().get_root().get_node("Main/Towers")
			var upgradedTower = magmaMageTowerPrefab.instantiate()
			path.add_child(upgradedTower)
			upgradedTower.position = get_child(1).overlappedTower.position
			var cost = get_child(1).overlappedTower.cost + mana_cost
			upgradedTower.cost = cost
			get_child(1).overlappedTower.queue_free()
			get_child(1).queue_free()
			gameController.mana -= mana_cost
		elif get_child(1).overlappedTower != null and "FireMageTower" in get_child(1).overlappedTower.name and gameController.mana >= mana_cost:
			var path = get_tree().get_root().get_node("Main/Towers")
			var upgradedTower = fireAlchemistPrefab.instantiate()
			path.add_child(upgradedTower)
			upgradedTower.position = get_child(1).overlappedTower.position
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
