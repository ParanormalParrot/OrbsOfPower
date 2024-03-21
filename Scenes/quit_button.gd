extends Button

class_name QuitButton


func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selection_screen.tscn")
