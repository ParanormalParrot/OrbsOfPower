extends Control

class_name MainMenu

@export var menu: Control
@export var options: Control

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalAudioManager.menu_music.play()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	menu.visible = false
	options.visible = true

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selection_screen.tscn")

func _on_back_button_pressed():
	menu.visible = true
	options.visible = false
	
