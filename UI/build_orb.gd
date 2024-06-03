extends Orb

class_name BuildOrb

@onready var towerPrefab = preload("res://Towers/apprentice_tower.tscn")

@onready var dragObjectPrefab = preload("res://UI/tower_drag_object.tscn")
var currTile

	
func _on_gui_input(event):
	if gameController.mana >= mana_cost:
		if event is InputEventMouseButton and event.button_mask == 1:
			var dragObject = dragObjectPrefab.instantiate()
			add_child(dragObject)
			get_child(1).global_position = get_global_mouse_position()
			
		elif event is InputEventMouseMotion and event.button_mask == 1:
		
			var child = get_child(1)
			if child:
				child.global_position = get_global_mouse_position()
		
		elif event is InputEventMouseButton and event.button_mask == 0 and gameController.mana >= mana_cost:
			if get_child(1).isValidPosition:
				print(event.global_position)
				var tower = towerPrefab.instantiate()
				get_tree().current_scene.add_child(tower)
				tower.position = get_global_mouse_position()
				print(tower.position)
				tower.name = "ApprenticeTower"
				tower.cost += mana_cost
				gameController.mana -= mana_cost
			get_child(1).queue_free()
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
