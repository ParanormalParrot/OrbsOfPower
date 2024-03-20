extends Button

class_name PauseButton

@export var pause_menu: Control


func _on_pressed():
	pause_menu.visible = true
	get_tree().paused = true
