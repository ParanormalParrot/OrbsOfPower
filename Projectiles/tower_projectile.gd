extends CharacterBody2D

class_name TowerProjectile

var target
var targetPosition
@export var speed = 200
var damage
const Enemy = preload("res://Enemies/enemy.gd")


func _process(delta):
	if target != null:
		var direction = global_position.direction_to(target.tower_target.global_position)
		var distance = global_position.distance_to(target.tower_target.global_position)
		var max_speed = (distance / delta)
		velocity = direction * minf(speed, max_speed)
		move_and_slide()
	else:
		queue_free()
	
	

func _on_area_2d_body_entered(body):
	if body == target:
		body.take_damage(damage)
		queue_free()
		
