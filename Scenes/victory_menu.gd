extends CenterContainer

class_name VictoryMenu

func _on_exit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/level_selection_screen.tscn")
	GlobalAudioManager.mute_all()
	GlobalAudioManager.menu_music.play()


func _on_resume_button_pressed():
	get_tree().paused = false
	visible = false




func _on_retry_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	GlobalAudioManager.preparation_music.play()
	
	
