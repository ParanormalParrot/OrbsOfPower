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
	

func _physics_process(delta):
	if get_parent().tower_ui.visible and dragging:
		if self in range.get_overlapping_bodies() and $Area2D.get_overlapping_bodies().size() == 0:
			previous_drag_position = global_position
			global_position = get_global_mouse_position()
			
		else:
			global_position = previous_position
			is_in_range = true
			dragging = false


func _on_drag_handle_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("LMB"):
		if !dragging:
			previous_position = global_position
		dragging = true
	else:
		dragging = false
		




