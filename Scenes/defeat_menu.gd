extends CenterContainer

class_name DefeatMenu


func _on_try_again_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	GlobalAudioManager.preparation_music.play()


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selection_screen.tscn")
	GlobalAudioManager.menu_music.play()
