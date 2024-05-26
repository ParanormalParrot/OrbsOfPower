extends CharacterBody2D

class_name Flag

var dragging = false
var previous_position
var previous_drag_position
var is_in_range = true
var position_changed = false
@export var range : Area2D
@export var tower_collision : CollisionObject2D


func _ready():
	set_process_input(true)
	previous_position = global_position
	

func _on_drag_handle_input_event(viewport, event, shape_idx):
	print(previous_position)
	if get_parent().tower_ui.visible:
		if event is InputEventMouseButton and event.pressed:
			previous_position = global_position
		if event is InputEventMouseMotion and event.button_mask == 1:
			global_position = get_global_mouse_position()
		if event is InputEventMouseButton and event.button_mask == 0:
			if $Area2D.get_overlapping_bodies().size() == 0:
				global_position = get_global_mouse_position()
				get_parent().reposition_homunculi()
			else:
				global_position = previous_position
		




