extends CenterContainer




func _on_try_again_button_pressed():
	get_tree().reload_current_scene()


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selection_screen.tscn")
