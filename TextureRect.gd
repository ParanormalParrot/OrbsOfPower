extends TextureRect


@onready var dragObjectPrefab = preload("res://UI/fire_orb_drag_object.tscn")

@onready var earthMageTowerPrefab = preload("res://Towers/earth_mage_tower.tscn")






func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_mask == 1:
		var dragObject  = dragObjectPrefab.instantiate()
		add_child(dragObject)
		get_child(0).global_position = get_global_mouse_position()
		print(event.global_position)
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
	
		get_child(0).global_position = get_global_mouse_position()
	elif event is InputEventMouseButton and event.button_mask == 0:
		if get_child(0).overlappedTower != null and "ApprenticeTower" in get_child(0).overlappedTower.name:
			var path = get_tree().get_root().get_node("Main/Towers")
			var upgradedTower = earthMageTowerPrefab.instantiate()
			path.add_child(upgradedTower)
			upgradedTower.position = get_child(0).overlappedTower.position
			get_child(0).overlappedTower.queue_free()
			get_child(0).queue_free()
		else:
			get_child(0).queue_free()
	else:
		if get_child_count() > 0:
			get_child(0).queue_free()
