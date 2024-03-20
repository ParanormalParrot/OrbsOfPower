extends Panel
@onready var tower = preload("res://Towers/apprentice_tower.tscn")
var currTile



func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		add_child(tempTower)
		get_child(1).global_position = get_global_mouse_position()
		print(event.global_position)
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED;
		
	elif event is InputEventMouseMotion and event.button_mask == 1:
	
		get_child(1).global_position = get_global_mouse_position()
	
	elif event is InputEventMouseButton and event.button_mask == 0:
		var path = get_tree().get_root().get_node("Main/Towers")
		path.add_child(tempTower)
		tempTower.position = get_global_mouse_position()
		print(event.global_position)
		get_child(1).queue_free()
