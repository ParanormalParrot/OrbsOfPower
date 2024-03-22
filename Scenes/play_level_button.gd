extends Button

class_name PlayLevelButton 

@export var level_path = ""

func _on_pressed():
	get_tree().change_scene_to_file(level_path)
	GlobalAudioManager.menu_music.stop()
	GlobalAudioManager.preparation_music.play()
