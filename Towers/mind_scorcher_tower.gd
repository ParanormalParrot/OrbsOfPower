extends StaticBody2D

class_name MindScorcherTower

var target_enemy = null
var enemies = []
var beam = Line2D.new()
var beam_outline = Line2D.new()
@export var min_damage = 10
var current_damage = min_damage
@export var max_damage = 20
@export var recharge_time = 0.5
@export var damage_increment = 2
var current_recharge_time =  recharge_time
var cost = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	beam.add_point($ShotPoint.global_position - global_position)
	beam_outline.add_point($ShotPoint.global_position - global_position)
	beam.width = 1
	beam_outline.width = 3
	add_child(beam_outline)
	add_child(beam)
	beam_outline.default_color = Color(1, 0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_recharge_time -= delta
	if target_enemy != null:
		if beam.points.size() > 1:
			beam.remove_point(1)
			beam_outline.remove_point(1)
		beam.add_point(target_enemy.tower_target.global_position -  global_position)
		beam_outline.add_point(target_enemy.tower_target.global_position -  global_position)
		if current_recharge_time <= 0:
			target_enemy.take_damage(current_damage)
			if current_damage < max_damage:
				current_damage+=damage_increment
				if current_damage > (max_damage + min_damage) / 2:
					beam.width = 2
					beam_outline.width = 4
					
			else:
				beam.width = 3
				beam_outline.width = 5
			target_enemy.slow_down(0.5, 0.2)
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
		
func _draw():
	if target_enemy:
		draw_line($ShotPoint.global_position, target_enemy.global_position,Color(1, 1, 1), 1)
		draw_line($ShotPoint.global_position, target_enemy.global_position,Color(1, 0, 0), 10000)

	
	
