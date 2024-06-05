extends AttackTower

class_name MindScorcherTower

var target_enemy = null
var beam = Line2D.new()
var beam_outline = Line2D.new()
@export var min_damage = 10
var current_damage = min_damage
@export var max_damage = 20
@export var damage_increment = 2

func _ready():
	beam.z_index = 2
	beam_outline.z_index = 1
	super._ready()
	beam.add_point($ShotPoint.global_position - global_position)
	beam_outline.add_point($ShotPoint.global_position - global_position)
	beam.width = 1
	beam_outline.width = 3
	add_child(beam_outline)
	add_child(beam)
	beam_outline.default_color = Color(1, 0, 0)

func _process(delta):
	current_recharge_time -= delta
	if target_enemy != null:
		if beam.points.size() > 1:
			beam.remove_point(1)
			beam_outline.remove_point(1)
		beam.add_point(target_enemy.tower_target.global_position -  global_position)
		beam_outline.add_point(target_enemy.tower_target.global_position -  global_position)
		if current_recharge_time <= 0:
			target_enemy.take_damage(current_damage, Enums.DamageType.PSYCHIC)
			if current_damage < max_damage:
				current_damage+=damage_increment
				if current_damage > (max_damage + min_damage) / 2:
					beam.width = 2
					beam_outline.width = 4
					
			else:
				beam.width = 3
				beam_outline.width = 5
			target_enemy.slow_down(0.5, 0.3)
			current_recharge_time = recharge_time
	else:
		beam.remove_point(1)
		beam_outline.remove_point(1)
		
func _on_range_body_entered(body):
	if body.is_in_group("Enemy"):
		enemies.append(body)
		if !target_enemy:
			target_enemy = body
			current_damage = min_damage
			beam.width = 1
			beam_outline.width = 2
	
func _on_range_body_exited(body):
	if body.is_in_group("Enemy"):
		enemies.erase(body)
		if body == target_enemy:
			if enemies.size() > 0:
				var first_enemy = enemies[0]
				for i in enemies:
					if i.get_parent().get_progress() < first_enemy.get_parent().get_progress():
						first_enemy = i
				target_enemy = first_enemy
				current_damage = min_damage
				beam.width = 1
				beam_outline.width = 2

	


func _on_tower_ui_gui_input(event: InputEvent) -> void:
	pass # Replace with function body.


func _on_mouse_area_2d_mouse_exited() -> void:
	pass # Replace with function body.
